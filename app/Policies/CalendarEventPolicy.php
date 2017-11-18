<?php

namespace App\Policies;

use App\Models\CalendarEvent;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CalendarEventPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the calendarEvent.
     *
     * @param \App\User                 $user
     * @param \App\Models\CalendarEvent $calendarEvent
     *
     * @return mixed
     */
    public function view(User $user, CalendarEvent $calendarEvent)
    {
        //
    }

    /**
     * Determine whether the user can create calendarEvents.
     *
     * @param \App\User $user
     *
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the calendarEvent.
     *
     * @param \App\User                 $user
     * @param \App\Models\CalendarEvent $calendarEvent
     *
     * @return mixed
     */
    public function update(User $user, CalendarEvent $calendarEvent)
    {
        //
    }

    /**
     * Determine whether the user can delete the calendarEvent.
     *
     * @param \App\User                 $user
     * @param \App\Models\CalendarEvent $calendarEvent
     *
     * @return mixed
     */
    public function delete(User $user, CalendarEvent $calendarEvent)
    {
        //
    }
}
