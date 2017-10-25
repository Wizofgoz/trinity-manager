<?php

namespace App\Models;

use App\Helpers\Classes;
use App\Helpers\ItemClass;
use App\Helpers\ItemFlags;
use App\Helpers\ItemQuality;
use App\Helpers\Races;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $connection = 'world';

    protected $table = 'item_template';

    protected $primaryKey = 'entry';

    protected $classObj;

    protected $qualityObj;

    /**
     * Returns an ItemClass object with info about the Item's class and subclass
     *
     * @return ItemClass
     */
    public function class()
    {
        if (!isset($this->classObj)) {
            $this->classObj = new ItemClass($this->class, $this->subclass);
        }

        return $this->classObj;
    }

    /**
     * Returns an ItemQuality object with info about the Item's quality
     *
     * @return ItemQuality
     */
    public function quality()
    {
        if (!isset($this->qualityObj)) {
            $this->qualityObj = new ItemQuality($this->Quality);
        }

        return $this->qualityObj;
    }

    /**
     * Whether the item is conjured
     *
     * @return bool
     */
    public function isConjured()
    {
        return $this->Flags & ItemFlags::CONJURED;
    }

    /**
     * Whether the item shows heroic text
     *
     * @return bool
     */
    public function showsHeroicText()
    {
        return $this->Flags & ItemFlags::HEROIC_TEXT;
    }

    /**
     * Whether the item can be prospected
     *
     * @return bool
     */
    public function isProspectable()
    {
        return $this->Flags & ItemFlags::PROSPECTABLE;
    }

    /**
     * Whether the item can be milled
     *
     * @return bool
     */
    public function isMillable()
    {
        return $this->Flags & ItemFlags::MILLABLE;
    }

    /**
     * Whether the item is unique-equipped
     *
     * @return bool
     */
    public function isUnique()
    {
        return $this->Flags & ItemFlags::UNIQUE_EQUIPPED;
    }

    /**
     * Whether the item binds to account on equip
     *
     * @return bool
     */
    public function bindsToAccount()
    {
        return $this->Flags & ItemFlags::BIND_TO_ACCOUNT;
    }

    /**
     * Whether the item is only usable by Horde characters
     *
     * @return bool
     */
    public function isHordeOnly()
    {
        return $this->FlagsExtra & ItemFlags::HORDE_ONLY;
    }

    /**
     * Whether the item is only usable by Alliance characters
     *
     * @return bool
     */
    public function isAllianceOnly()
    {
        return $this->FlagsExtra & ItemFlags::ALLIANCE_ONLY;
    }

    /**
     * Whether the item is only usable by a single faction
     *
     * @return bool
     */
    public function isFactionSpecific()
    {
        return ($this->isHordeOnly() || $this->isAllianceOnly());
    }

    /**
     * Whether the item can be sold to a vendor
     *
     * @return bool
     */
    public function canSellToVendor()
    {
        return ($this->SellPrice != 0);
    }

    /**
     * Whether the item has Racial restrictions
     *
     * @return bool
     */
    public function isRaceSpecific()
    {
        return ($this->AllowableRace == Races::ALL);
    }

    /**
     * Whether the item has Class restrictions
     *
     * @return bool
     */
    public function isClassSpecific()
    {
        return ($this->AllowableClass == Classes::ALL);
    }

    /**
     * Returns names of races allowed to use the item
     *
     * @return array
     */
    public function allowedRaces()
    {
        $allowedRaces = [];

        foreach (Character::RACES as $value) {
            // if the AllowableRace is set to all, add all races
            if ($this->AllowableRace == Races::ALL) {
                $allowedRaces[] = Character::RACES[$value];

            // if the AllowableRace includes the current race, add it
            } elseif ($this->AllowableRace & $value) {
                $allowedRaces[] = Character::RACES[$value];
            }
        }

        return $allowedRaces;
    }

    /**
     * Returns names of classes allowed to use the item
     *
     * @return array
     */
    public function allowedClasses()
    {
        $allowedClasses = [];

        foreach (Character::CLASSES as $value) {
            // if the AllowableClass is set to all, add all races
            if ($this->AllowableClass == Races::ALL) {
                $allowedClasses[] = Character::CLASSES[$value];

            // if the AllowableClass includes the current race, add it
            } elseif ($this->AllowableClass & $value) {
                $allowedClasses[] = Character::CLASSES[$value];
            }
        }

        return $allowedClasses;
    }
}