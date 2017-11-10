<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use App\Helpers\GuildRights;
use http\Exception\InvalidArgumentException;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;

class GuildRank extends Pivot
{
    use BelongsToRealm;

    const RIGHTS_MAP = [
        GuildRights::NONE               => 'Has no rights',
        GuildRights::GCHAT_LISTEN       => 'Can read messages in the guild general chat channel',
        GuildRights::GCHAT_SPEAK        => 'Can write messages in the guild general chat channel',
        GuildRights::OFFCHAT_LISTEN     => 'Can read messages in the guild officer chat channel',
        GuildRights::OFFCHAT_SPEAK      => 'Can write messages in the guild officer chat channel',
        GuildRights::INVITE             => 'Can invite other players to the guild',
        GuildRights::REMOVE             => 'Can kick other players out of the guild',
        GuildRights::PROMOTE            => 'Can promote other players',
        GuildRights::DEMOTE             => 'Can demote other players',
        GuildRights::SET_MOTD           => 'Can change the guild message of the day',
        GuildRights::EDIT_PERSONAL_NOTE => 'Can edit other players\' personal notes',
        GuildRights::VIEW_OFFICER_NOTE  => 'Can view the officer notes of other players',
        GuildRights::EDIT_GUILD_INFO    => 'Can edit guild info',
        GuildRights::WITHDRAW_GOLD_LOCK => 'Can remove money withdraw capacity',
        GuildRights::WITHDRAW_REPAIR    => 'Can withdraw gold for repair',
        GuildRights::WITHDRAW_GOLD      => 'Can withdraw gold',
        GuildRights::CREATE_GUILD_EVENT => 'Can create a guild event',
        GuildRights::ALL                => 'Has all rights',
    ];

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'guild_rank';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Name of column that acts as the model's primary key.
     *
     * @var string
     */
    protected $primaryKey = 'rid';

    /**
     * Returns the guild the rank belongs to.
     *
     * @return Builder
     */
    public function guild()
    {
        return $this->belongsTo(Guild::class, 'guildid', 'guildid');
    }

    /**
     * Returns all members of the guild that have this rank assigned.
     *
     * @return Builder
     */
    public function members()
    {
        return $this->hasMany(GuildMember::class, 'rank', 'rid')
            ->where('guildid', '=', $this->guildid);
    }

    /**
     * Determine if the member has a given right.
     *
     * @param int $right
     *
     * @return bool
     */
    public function hasRight(int $right)
    {
        if (!in_array($right, array_keys(self::RIGHTS_MAP))) {
            throw new InvalidArgumentException('Invalid right');
        }

        return $this->rights === GuildRights::ALL || $this->rights & $right;
    }
}
