<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Character extends Model
{
    /**
     * Mapping of Race IDs to Race Names
     *
     * @var array
     */
    public $races = [
        1 => 'Human',
        2 => 'Orc',
        3 => 'Dwarf',
        4 => 'Night Elf',
        5 => 'Undead',
        6 => 'Tauren',
        7 => 'Gnome',
        8 => 'Troll',
        9 => 'Goblin',
        10 => 'Blood Elf',
        11 => 'Draenei',
    ];

    /**
     * Mapping of Class IDs to Class Names
     *
     * @var array
     */
    public $classes = [
        1 => 'Warrior',
        2 => 'Paladin',
        3 => 'Hunter',
        4 => 'Rogue',
        5 => 'Priest',
        6 => 'Death Knight',
        7 => 'Shaman',
        8 => 'Mage',
        9 => 'Warlock',
        10 => 'Monk',
        11 => 'Druid',
        12 => 'Demon Hunter'
    ];

    /**
     * Connection that the model uses
     *
     * @var string
     */
    protected $connection = 'characters';

    /**
     * Name of column that acts as the model's primary key
     *
     * @var string
     */
    protected $primaryKey = 'guid';

    /**
     * Whether the model contains standard timestamp columns
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Returns the account the character belongs to
     *
     * @return \App\User
     */
    public function account()
    {
        return $this->belongsTo('App/User', 'account');
    }

    /**
     * Returns the race of the character
     *
     * @return string
     */
    public function race()
    {
        return $this->races[$this->race];
    }

    /**
     * Returns the class of the character
     *
     * @return string
     */
    public function class()
    {
        return $this->classes[$this->class];
    }
}