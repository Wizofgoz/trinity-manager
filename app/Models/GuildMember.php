<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;

class GuildMember extends Pivot
{
    use BelongsToRealm;

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'guild_member';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Returns the Guild Rank of the member.
     *
     * @return Builder
     */
    public function rank()
    {
        return $this->belongsTo(GuildRank::class, 'rank', 'rid')
            ->where('guildid', '=', $this->guildid);
    }

    /**
     * Returns the guild the member belongs to.
     *
     * @return Builder
     */
    public function guild()
    {
        return $this->belongsTo(Guild::class, 'guildid', 'guildid');
    }

    /**
     * Returns the Character the member is related to.
     *
     * @return Builder
     */
    public function character()
    {
        return $this->belongsTo(Character::class, 'guid', 'guid');
    }
}
