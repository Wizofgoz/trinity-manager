<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use BelongsToRealm;

    const RESPONSE_TRUE = 17;
    const RESPONSE_FALSE = 1;

    protected $table = 'gm_ticket';
    protected $primaryKey = 'Id';
    public $timestamps = false;

    public function creator()
    {
        return $this->belongsTo(Character::class, 'playerGuid', 'guid');
    }

    public function assignedTo()
    {
        return $this->belongsTo(Character::class, 'assignedTo', 'guid');
    }

    public function closedBy()
    {
        if ($this->closedBy == 0) {
            return false;
        }

        if ($this->closedBy == -1) {
            return null;
        }

        return $this->belongsTo(Character::class, 'closedBy', 'guid');
    }

    public function hasBeenViewed()
    {
        return $this->viewed > 0;
    }
}
