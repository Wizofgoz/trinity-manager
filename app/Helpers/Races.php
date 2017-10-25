<?php

namespace App\Helpers;

abstract class Races
{
    const ALL = -1;
    const HUMAN = 1;
    const ORC = 2;
    const DWARF = 4;
    const NIGHT_ELF = 8;
    const UNDEAD = 16;
    const TAUREN = 32;
    const GNOME = 64;
    const TROLL = 128;
    const GOBLIN = 256;
    const BLOOD_ELF = 512;
    const DRAENEI = 1024;
    const FEL_ORC = 2048;
    const NAGA = 4096;
    const BROKEN = 8192;
    const SKELETON = 16384;
    const VRYKUL = 32768;
    const TUSKARR = 65536;
    const FOREST_TROLL = 131072;
    const TAUNKA = 262144;
    const NORTHREND_SKELETON = 524288;
    const ICE_TROLL = 1048576;
    const WORGEN = 2097152;
    const PANDAREN_NEUTRAL = 8388608;
    const PANDAREN_ALLIANCE = 16777216;
    const PANDAREN_HORDE = 33554432;
    const NAMES = [
        self::HUMAN => 'Human',
        self::ORC => 'Orc',
        self::DWARF => 'Dwarf',
        self::NIGHT_ELF => 'Night Elf'
    ];
}