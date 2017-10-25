<?php

namespace App\Helpers;

abstract class ItemFlags
{
    const UNK1 = 0x01;
    const CONJURED = 0x02;
    const OPENABLE = 0x04;
    const HEROIC_TEXT = 0x08;
    const DEPRECIATED = 0x010;
    const HARD_DESTROY = 0x020;
    const UNK2 = 0x040;
    const NO_COOLDOWN = 0x080;
    const UNK3 = 0x0100;
    const PARTY_LOOT = 0x0800;
    const REFUNDABLE = 0x01000;
    const CHARTER = 0x02000;
    const UNK5 = 0x04000;
    const UNK6 = 0x08000;
    const UNK7 = 0x010000;
    const UNK8 = 0x020000;
    const PROSPECTABLE = 0x040000;
    const UNIQUE_EQUIPPED = 0x080000;
    const UNK9 = 0x0100000;
    const ARENA_MATCH_USABLE = 0x0200000;
    const THROWABLE = 0x0400000;
    const SHAPESHIFT_USABLE = 0x0800000;
    const UNK10 = 0x01000000;
    /**
     * Can be looted only if requirements are met and recipe is not known
     */
    const PROFESSION_LOOT_FILTER = 0x02000000;
    const ARENA_NOT_USABLE = 0x04000000;
    const BIND_TO_ACCOUNT = 0x08000000;
    const SPELL_CAST_ON_TRIGGER = 0x010000000;
    const MILLABLE = 0x020000000;
    const UNK11 = 0x040000000;
    const BIND_ON_PICKUP_TRADEABLE = 0x080000000;

    // Extra flags below

    const HORDE_ONLY = 0x01;
    const ALLIANCE_ONLY = 0x02;
    const EXTENDED_COST_GOLD_REQUIRED = 0x04;
    const NEED_ROLL_DISABLED1 = 0x0100;
    const NEED_ROLL_DISABLED2 = 0x0200;
    const HAS_NORMAL_PRICE = 0x04000;
    const BNET_ACCOUNT_BOUND = 0x020000;
    const CANNOT_BE_TRANSMOG = 0x0200000;
    const CANNOT_TRANSMOG = 0x0400000;
    const CAN_TRANSMOG = 0x0800000;
}