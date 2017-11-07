<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;

class GuildRank extends Pivot
{
    use BelongsToRealm;

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
}
