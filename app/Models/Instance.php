<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Instance extends Model
{
    use BelongsToRealm;

    const DIFFICULTY_DUNGEON_NORMAL = 0;
    const DIFFICULTY_DUNGEON_HEROIC = 1;

    const DUNGEON_DIFFICULTY_MAP = [
        self::DIFFICULTY_DUNGEON_NORMAL => 'Normal',
        self::DIFFICULTY_DUNGEON_HEROIC => 'Heroic',
    ];

    const DIFFICULTY_RAID_NORMAL_10 = 0;
    const DIFFICULTY_RAID_NORMAL_25 = 1;
    const DIFFICULTY_RAID_HEROIC_10 = 2;
    const DIFFICULTY_RAID_HEROIC_25 = 3;

    const RAID_DIFFICULTY_MAP = [
        self::DIFFICULTY_RAID_NORMAL_10 => 'Normal 10-Man',
        self::DIFFICULTY_RAID_NORMAL_25 => 'Normal 25-Man',
        self::DIFFICULTY_RAID_HEROIC_10 => 'Heroic 10-Man',
        self::DIFFICULTY_RAID_HEROIC_25 => 'Heroic 25-man',
    ];

    protected $table = 'instance';

    public $timestamps = false;

    public function groups()
    {
        return $this->belongsToMany(Group::class, 'group_instance', 'instance', 'guid', 'id', 'guid');
    }

    public function characters()
    {
        return $this->belongsToMany(Character::class, 'character_instance', 'instance', 'guid', 'id', 'guid');
    }

    public function map()
    {
    }

    /**
     * Returns when the instance will reset as a Carbon instance.
     *
     * @return Carbon
     */
    public function resettime()
    {
        if ($this->resettime > 0) {
            return Carbon::createFromTimestamp($this->resettime);
        }

        // raid and heroic dungeons have a global reset time
        $reset = DB::connection("characters{$this->realm->id}")
            ->table('instance_reset')
            ->where('mapid', $this->map)
            ->where('difficulty', $this->difficulty)
            ->first('resettime');

        return Carbon::createFromTimestamp($reset);
    }
}
