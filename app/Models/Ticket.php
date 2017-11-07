<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use BelongsToRealm;

    protected $table = 'gm_ticket';
    protected $primaryKey = 'Id';
    public $timestamps = false;

    public function creator()
    {
        return $this->belongsTo(Character::class, 'playerGuid', 'guid')->connection($this->getConnectionName());
    }

    public function assignedTo()
    {
        return $this->belongsTo(Character::class, 'assignedTo', 'guid')->connection($this->getConnectionName());
    }
}
