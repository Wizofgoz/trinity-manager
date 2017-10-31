<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class ItemInstance extends Model
{
    use BelongsToRealm;

    /**
     * DB table that the model resides in
     *
     * @var string
     */
    protected $table = 'item_instance';

    /**
     * Name of column that acts as the model's primary key
     *
     * @var string
     */
    protected $primaryKey = 'guid';

    /**
     * Defines the relation between the item instance and the character that owns it
     *
     * @return Builder
     */
    public function owner()
    {
        return $this->belongsTo(Character::class, 'owner_guid', 'guid');
    }

    /**
     * Defines the relation between the item instance and the character that created it
     *
     * @return Builder
     */
    public function creator()
    {
        return $this->belongsTo(Character::class, 'creatorGuid', 'guid');
    }

    /**
     * Defines the relation between the item instance and the character that gifted it
     *
     * @return Builder
     */
    public function gifter()
    {
        return $this->belongsTo(Character::class, 'giftCreatorGuid', 'guid');
    }

    /**
     * Returns the item template the item instance belongs to
     *
     * @return Item
     */
    public function item()
    {
        return Item::where('entry', '=', $this->itemEntry)->first();
    }

    /**
     * Returns whether the item instance is a stack of items
     *
     * @return bool
     */
    public function isStack()
    {
        return $this->count > 1;
    }
}
