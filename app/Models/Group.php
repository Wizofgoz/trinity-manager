<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
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

    /**
     * Table the model resides in.
     *
     * @var string
     */
    protected $table = 'groups';

    /**
     * Whether the model has standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Name of column marked as the primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'guid';

    /**
     * Defines relation between this group and the character marked as the leader.
     *
     * @return Builder
     */
    public function leader()
    {
        return $this->belongsTo(Character::class, 'leaderGuid', 'guid');
    }

    /**
     * Defines relation between this group and the character marked as the loot master.
     * If the group is not using a master looter, returns false.
     *
     * @return bool|Builder
     */
    public function lootMaster()
    {
        if (!$this->isMasterLoot()) {
            return false;
        }

        return $this->belongsTo(Character::class, 'looterGuid', 'guid');
    }

    /**
     * Returns the string name of the type of the group.
     *
     * @return string
     */
    public function typeName()
    {
        return self::TYPE_MAP[$this->groupType];
    }

    /**
     * Returns the string name of the loot mode the group is in.
     *
     * @return string
     */
    public function lootTypeName()
    {
        return self::TYPE_MAP[$this->lootMethod];
    }

    /**
     * Returns whether the group is using the given loot type.
     *
     * @param int $lootType
     *
     * @return bool
     */
    public function isLootType(int $lootType)
    {
        return $this->lootMethod === $lootType;
    }

    /**
     * Convenience method for returning whether the group is in "Free For All" loot mode.
     *
     * @return bool
     */
    public function isFreeForAllLoot()
    {
        return $this->isLootType(self::LOOT_FREE_FOR_ALL);
    }

    /**
     * Convenience method for returning whether the group is in "Round Robin" loot mode.
     *
     * @return bool
     */
    public function isRoundRobinLoot()
    {
        return $this->isLootType(self::LOOT_ROUND_ROBIN);
    }

    /**
     * Convenience method for returning whether the group is in "Master Looter" loot mode.
     *
     * @return bool
     */
    public function isMasterLoot()
    {
        return $this->isLootType(self::LOOT_MASTER);
    }

    /**
     * Convenience method for returning whether the group is in "Group Loot" loot mode.
     *
     * @return bool
     */
    public function isGroupLoot()
    {
        return $this->isLootType(self::LOOT_GROUP);
    }

    /**
     * Convenience method for returning whether the group is in "Need Before Greed" loot mode.
     *
     * @return bool
     */
    public function isNeedBeforeGreedLoot()
    {
        return $this->isLootType(self::LOOT_NEED_BEFORE_GREED);
    }
}
