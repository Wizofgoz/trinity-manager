<?php

namespace App\Helpers;

abstract class Races
{
    const ALL = -1;
    const HUMAN = 1;
    const ORC = 2;
    const DWARF = 3;
    const NIGHT_ELF = 4;
    const UNDEAD = 5;
    const TAUREN = 6;
    const GNOME = 7;
    const TROLL = 8;
    const GOBLIN = 9;
    const BLOOD_ELF = 10;
    const DRAENEI = 11;
    const FEL_ORC = 12;
    const NAGA = 13;
    const BROKEN = 14;
    const SKELETON = 15;
    const VRYKUL = 16;
    const TUSKARR = 17;
    const FOREST_TROLL = 18;
    const TAUNKA = 19;
    const NORTHREND_SKELETON = 20;
    const ICE_TROLL = 21;
    const WORGEN = 22;
    const PANDAREN_NEUTRAL = 24;
    const PANDAREN_ALLIANCE = 25;
    const PANDAREN_HORDE = 26;
    const NAMES = [
        self::HUMAN => 'Human',
        self::ORC => 'Orc',
        self::DWARF => 'Dwarf',
        self::NIGHT_ELF => 'Night Elf'
    ];
}