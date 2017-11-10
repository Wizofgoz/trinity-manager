<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Support\Carbon;

class CalendarInvite extends Pivot
{
    use BelongsToRealm;

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'calendar_invites';

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
    protected $primaryKey = 'id';

    /**
     * Return the statustime as a Carbon instance.
     *
     * @param $value
     *
     * @return Carbon
     */
    public function getStatustimeAttribute($value)
    {
        return Carbon::createFromTimestamp($value);
    }

    /**
     * Cast the Carbon instance of statustime as a UNIX timestamp.
     *
     * @param Carbon $value
     */
    public function setStatustimeAttribute(Carbon $value)
    {
        $this->attributes['statustime'] = $value->timestamp;
    }

    /**
     * Defines relation with character that received the invitation.
     *
     * @return Builder
     */
    public function receiver()
    {
        return $this->belongsTo(Character::class, 'invitee', 'guid');
    }

    /**
     * Defines relation with character that sent the invitation.
     *
     * @return Builder
     */
    public function sender()
    {
        return $this->belongsTo(Character::class, 'sender', 'guid');
    }
}
