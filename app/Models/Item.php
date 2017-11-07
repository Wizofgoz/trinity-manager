<?php

namespace App\Models;

use App\Helpers\Classes;
use App\Helpers\ItemClass;
use App\Helpers\ItemFlags;
use App\Helpers\ItemQuality;
use App\Helpers\Races;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Item extends Model
{
    const FLAGS = [
        ItemFlags::UNK1 => 'Unknown (1)',
        ItemFlags::CONJURED => 'Conjured',
        ItemFlags::OPENABLE => 'Openable',
        ItemFlags::HEROIC_TEXT => 'Heroic Text',
        ItemFlags::DEPRECIATED => 'Depreciated',
        ItemFlags::HARD_DESTROY => 'Hard Destroy',
        ItemFlags::UNK2 => 'Unknown (2)',
        ItemFlags::NO_COOLDOWN => 'No Cooldown',
        ItemFlags::UNK3 => 'Unknown (3)',
        ItemFlags::PARTY_LOOT => 'Party Loot',
        ItemFlags::REFUNDABLE => 'Refundable',
        ItemFlags::CHARTER => 'Charter',
        ItemFlags::UNK5 => 'Unknown (5)',
        ItemFlags::UNK6 => 'Unknown (6)',
        ItemFlags::UNK7 => 'Unknown (7)',
        ItemFlags::UNK8 => 'Unknown (8)',
        ItemFlags::PROSPECTABLE => 'Prospectable',
        ItemFlags::UNIQUE_EQUIPPED => 'Unique Equipped',
        ItemFlags::UNK9 => 'Unknown (9)',
        ItemFlags::ARENA_MATCH_USABLE => 'Arena Match Usable',
        ItemFlags::THROWABLE => 'Throwable',
        ItemFlags::SHAPESHIFT_USABLE => 'Shapeshift Usable',
        ItemFlags::UNK10 => 'Unknown (10)',
        ItemFlags::PROFESSION_LOOT_FILTER => 'Profession Loot Filter',
        ItemFlags::ARENA_NOT_USABLE => 'Arena Not Usable',
        ItemFlags::BIND_TO_ACCOUNT => 'Bind To Account',
        ItemFlags::SPELL_CAST_ON_TRIGGER => 'Spell Cast On Trigger',
        ItemFlags::MILLABLE => 'Millable',
        ItemFlags::UNK11 => 'Unknown (11)',
        ItemFlags::BIND_ON_PICKUP_TRADEABLE => 'Bind On Pickup Tradeable'
    ];

    const FLAGS_EXTRA = [
        ItemFlags::HORDE_ONLY => 'Horde Only',
        ItemFlags::ALLIANCE_ONLY => 'Alliance Only',
        ItemFlags::EXTENDED_COST_GOLD_REQUIRED => 'Extended Cost Gold Required',
        ItemFlags::NEED_ROLL_DISABLED1 => 'Need Roll Disabled 1',
        ItemFlags::NEED_ROLL_DISABLED2 => 'Need Roll Disabled 2',
        ItemFlags::HAS_NORMAL_PRICE => 'Has Normal Price',
        ItemFlags::BNET_ACCOUNT_BOUND => 'BattleNet Account Bound',
        ItemFlags::CANNOT_BE_TRANSMOG => 'Cannot Be Transmog',
        ItemFlags::CANNOT_TRANSMOG => 'Cannot Transmog',
        ItemFlags::CAN_TRANSMOG => 'Can Transmog'
    ];

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
     * Whether the item has the given flag
     *
     * @param int $flag
     * @return bool
     */
    public function hasFlag(int $flag)
    {
        if (!Arr::exists(self::FLAGS, $flag)) {
            throw new \InvalidArgumentException('Invalid flag given');
        }

        return $this->Flags & $flag;
    }

    /**
     * Whether the item has the given extra flag
     *
     * @param int $flag
     * @return bool
     */
    public function hasExtraFlag(int $flag)
    {
        if (!Arr::exists(self::FLAGS_EXTRA, $flag)) {
            throw new \InvalidArgumentException('Invalid flag given');
        }

        return $this->FlagsExtra & $flag;
    }

    /**
     * Whether the item is only usable by a single faction
     *
     * @return bool
     */
    public function isFactionSpecific()
    {
        return ($this->hasExtraFlag(ItemFlags::HORDE_ONLY) || $this->hasExtraFlag(ItemFlags::ALLIANCE_ONLY));
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
        return ($this->AllowableRace != Races::ALL);
    }

    /**
     * Whether the item has Class restrictions
     *
     * @return bool
     */
    public function isClassSpecific()
    {
        return ($this->AllowableClass != Classes::ALL);
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