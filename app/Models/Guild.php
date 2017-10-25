<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class Guild extends Model
{
    /**
     * Connection that the model uses
     *
     * @var string
     */
    protected $connection = 'characters';

    /**
     * DB table that the model resides in
     *
     * @var string
     */
    protected $table = 'guild';

    /**
     * Whether the model contains standard timestamp columns
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Name of column that acts as the model's primary key
     *
     * @var string
     */
    protected $primaryKey = 'guildid';

    /**
     * Get carbon instance of when the guild was created
     *
     * @param int $value
     * @return Carbon
     */
    public function getCreatedateAttribute($value)
    {
        return Carbon::createFromTimestamp($value);
    }

    /**
     * Set the date the guild was created
     *
     * @param Carbon $value
     * @return void
     */
    public function setCreatedateAttribute($value)
    {
        $this->attributes['createdate'] = $value->timestamp;
    }

    /**
     * Returns the character that created the guild
     *
     * @return Builder
     */
    public function master()
    {
        return $this->belongsTo(Character::class, 'leaderguid', 'guid');
    }

    /**
     * Returns a collection of all members
     *
     * @return Builder
     */
    public function members()
    {
        return $this->belongsToMany(Character::class, 'guild_member', 'guildid', 'guid', 'guildid', 'guid')
            ->using(GuildMember::class)
            ->as('member');
    }

    /**
     * Returns a collection of all ranks available to the guild
     *
     * @return Builder
     */
    public function ranks()
    {
        return $this->hasMany(GuildRank::class, 'guildid');
    }
}