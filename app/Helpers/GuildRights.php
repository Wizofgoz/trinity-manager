<?php

namespace App\Helpers;

abstract class GuildRights
{
    const NONE = 64;
    const GCHAT_LISTEN = 65;
    const GCHAT_SPEAK = 66;
    const OFFCHAT_LISTEN = 68;
    const OFFCHAT_SPEAK = 72;
    const INVITE = 80;
    const REMOVE = 96;
    const PROMOTE = 192;
    const DEMOTE = 320;
    const SET_MOTD = 4160;
    const EDIT_PERSONAL_NOTE = 8256;
    const VIEW_OFFICER_NOTE = 16448;
    const EDIT_OFFICER_NOTE = 32832;
    const EDIT_GUILD_INFO = 65600;
    const WITHDRAW_GOLD_LOCK = 131072;
    const WITHDRAW_REPAIR = 262144;
    const WITHDRAW_GOLD = 524288;
    const CREATE_GUILD_EVENT = 1048576;
    const ALL = 1962495;
}
