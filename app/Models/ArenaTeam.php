<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class ArenaTeam extends Model
{
    use BelongsToRealm;

    /**
     * Mapping of Arena Team Types to descriptions.
     *
     * @var array
     */
    const TYPES = [
        2 => '2v2',
        3 => '3v3',
        5 => '5v5',
    ];

    /**
     * Name of column that acts as the model's primary key.
     *
     * @var string
     */
    protected $table = 'arena_team';

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
    protected $primaryKey = 'arenaTeamId';

    /**
     * Returns the character that is the captain of the arena team.
     *
     * @return Builder
     */
    public function captain()
    {
        return $this->belongsTo(Character::class, 'captainGuid', 'guid');
    }

    /**
     * Returns all characters that are members of the arena team.
     *
     * @return Builder
     */
    public function members()
    {
        return $this->belongsToMany(Character::class, 'arena_team_member', 'arenaTeamId', 'guid', 'arenaTeamId', 'guid')
            ->as('member');
    }
}
