<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemInstance extends Model
{
    protected $connection = 'characters';

    protected $table = 'item_instance';

    protected $primaryKey = 'guid';

    public function owner()
    {
        return $this->belongsTo(Character::class, 'owner_guid', 'guid');
    }

    public function creator()
    {
        return $this->belongsTo(Character::class, 'creatorGuid', 'guid');
    }

    public function gifter()
    {
        return $this->belongsTo(Character::class, 'giftCreatorGuid', 'guid');
    }

    public function item()
    {
        return $this->belongsTo(Item::class, 'itemEntry', 'entry');
    }
}