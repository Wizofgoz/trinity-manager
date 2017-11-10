<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class CalendarEvent extends Model
{
    use BelongsToRealm;

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'calendar_events';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Return the eventtime as a Carbon instance
     *
     * @param $value
     * @return Carbon
     */
    public function getEventtimeAttribute($value)
    {
        return Carbon::createFromTimestamp($value);
    }

    /**
     * Cast the Carbon instance of eventtime as a UNIX timestamp
     *
     * @param Carbon $value
     */
    public function setEventtimeAttribute(Carbon $value)
    {
        $this->attributes['eventtime'] = $value->timestamp;
    }

    /**
     * Defines relation with characters that are invited to the event
     *
     * @return Builder
     */
    public function invitees()
    {
        return $this->belongsToMany(Character::class, 'calendar_invites', 'event', 'invitee', 'id', 'guid')
            ->using(CalendarInvite::class)
            ->as('invite');
    }

    /**
     * Defines relation with the character that created the event
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function creator()
    {
        return $this->belongsTo(Character::class, 'creator', 'guid');
    }
}
