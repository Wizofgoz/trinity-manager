<?php

namespace App\Helpers;

abstract class CharacterFlags
{
    const GROUP_LEADER = 1;
    const IS_AFK = 2;
    const IS_DO_NOT_DISTURB = 4;
    const IS_GM = 8;
    const IS_GHOST = 16;
    const IS_RESTING = 32;
    const UNKNOWN7 = 64;
    const UNKNOWN8 = 128;
    const IS_CONTESTED_PVP = 256;
    const IS_IN_PVP = 512;
    const IS_HELM_HIDDEN = 1024;
    const IS_CLOAK_HIDDEN = 2048;
    const HAS_PLAYED_LONG_TIME = 4096;
    const HAS_PLAYED_TOO_LONG = 8192;
    const IS_OUT_OF_BOUNDS = 16384;
    const IS_DEVELOPER = 32768;
    const UNKNOWN17 = 65536;
    const IN_TAXI_BENCHMARK_MODE = 131072;
    const IS_PVP_TIMER_ACTIVE = 262144;
    const UNKNOWN20 = 524288;
    const UNKNOWN21 = 1048576;
    const UNKNOWN22 = 2097152;
    const IS_COMMENTATOR = 4194304;
    const ALLOW_ONLY_ABILITY = 8388608;
    const UNKNOWN25 = 16777216;
    const CANNOT_GAIN_XP = 33554432;
}