<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Ticket extends Model
{
    use BelongsToRealm;

    const RESPONSE_TRUE = 17;
    const RESPONSE_FALSE = 1;

    /**
     * Table the model resides in.
     *
     * @var string
     */
    protected $table = 'gm_ticket';

    /**
     * Name of the column marked as primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'Id';

    /**
     * Whether the model has standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Defines relation between this GM Ticket and the character that created it.
     *
     * @return Builder
     */
    public function creator()
    {
        return $this->belongsTo(Character::class, 'playerGuid', 'guid');
    }

    /**
     * Defines relation between this GM Ticket and the character it's assigned to.
     *
     * @return Builder
     */
    public function assignedTo()
    {
        return $this->belongsTo(Character::class, 'assignedTo', 'guid');
    }

    /**
     * Defines relation between this GM Ticket and the character that closed it.
     * If it is not closed, returns false.
     * If closed by the console, returns null.
     *
     * @return bool|Builder|null
     */
    public function closedBy()
    {
        if ($this->isClosed()) {
            return false;
        }

        if ($this->isClosedByConsole()) {
            return null;
        }

        return $this->belongsTo(Character::class, 'closedBy', 'guid');
    }

    /**
     * Returns whether the ticket has been viewed yet.
     *
     * @return bool
     */
    public function hasBeenViewed()
    {
        return $this->viewed > 0;
    }

    /**
     * Returns whether the ticket has been closed.
     *
     * @return bool
     */
    public function isClosed()
    {
        return $this->closedBy !== 0;
    }

    /**
     * Returns whether the ticket has been closed by the console.
     *
     * @return bool
     */
    public function isClosedByConsole()
    {
        return $this->isClosed() && $this->closedBy === -1;
    }

    /**
     * Casts createtime timestamp as a Carbon instance.
     *
     * @param $value
     *
     * @return Carbon
     */
    public function getCreatetimeAttribute($value)
    {
        return Carbon::createFromTimestamp($value);
    }

    /**
     * Casts lastModifiedTime timestamp as a Carbon instance.
     *
     * @param $value
     *
     * @return Carbon
     */
    public function getLastModifiedTimeAttribute($value)
    {
        return Carbon::createFromTimestamp($value);
    }

    /**
     * Casts Carbon instance as a timestamp for storage in the database.
     *
     * @param Carbon $value
     */
    public function setCreatetimeAttribute(Carbon $value)
    {
        $this->attributes['createtime'] = $value->timestamp;
    }

    /**
     * Casts Carbon instance as a timestamp for storage in the database.
     *
     * @param Carbon $value
     */
    public function setLastModifiedTimeAttribute(Carbon $value)
    {
        $this->attributes['lastModifiedTime'] = $value->timestamp;
    }
}
