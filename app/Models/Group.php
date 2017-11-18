<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use BelongsToRealm;

    const LOOT_FREE_FOR_ALL = 0;
    const LOOT_ROUND_ROBIN = 1;
    const LOOT_MASTER = 2;
    const LOOT_GROUP = 3;
    const LOOT_NEED_BEFORE_GREED = 4;

    const TYPE_NORMAL = 0;
    const TYPE_BATTLEGROUND = 1;
    const TYPE_RAID = 2;
    const TYPE_BATTLEGROUND_RAID = 3;
    const TYPE_UNKNOWN = 4;
    const TYPE_LOOKING_FOR_GROUP = 8;

    const TYPE_MAP = [
        self::TYPE_NORMAL            => 'Normal',
        self::TYPE_BATTLEGROUND      => 'Battleground',
        self::TYPE_RAID              => 'Raid',
        self::TYPE_BATTLEGROUND_RAID => 'Battleground Raid',
        self::TYPE_UNKNOWN           => 'Unknown',
        self::TYPE_LOOKING_FOR_GROUP => 'Looking For Group',
    ];

    protected $table = 'groups';

    public $timestamps = false;

    protected $primaryKey = 'guid';

    public function leader()
    {
        return $this->belongsTo(Character::class, 'leaderGuid', 'guid');
    }

    public function lootMaster()
    {
        if ($this->lootMethod != self::LOOT_MASTER) {
            return false;
        }

        return $this->belongsTo(Character::class, 'looterGuid', 'guid');
    }

    public function typeName()
    {
        return self::TYPE_MAP[$this->groupType];
    }
}
