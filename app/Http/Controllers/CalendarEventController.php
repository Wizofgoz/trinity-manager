<?php

namespace App\Http\Controllers;

use App\Models\CalendarEvent;
use App\Models\Character;
use App\Models\Realm;
use Illuminate\Http\Request;

class CalendarEventController extends Controller
{
    /**
     * CalendarEventController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * List of sent and received events.
     *
     * @param Realm $realm
     * @param int   $characterID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Realm $realm, int $characterID)
    {
        $character = $this->resolveCharacter($realm, $characterID);
        $received = $character->calendarReceived()->get();
        $sent = $character->calendarSent()->get();

        return view('character.calendar.index', ['sent' => $sent, 'received' => $received]);
    }

    /**
     * Info view of an event.
     *
     * @param Realm $realm
     * @param int   $characterID
     * @param int   $eventID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm, int $characterID, int $eventID)
    {
        $character = $this->resolveCharacter($realm, $characterID);
        $event = $this->resolveEvent($realm, $eventID);

        $this->authorize('view', $event);

        return view('character.calendar.show', ['event' => $event]);
    }

    /**
     * Show edit form for individual event.
     *
     * @param Realm $realm
     * @param int   $characterID
     * @param int   $eventID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Realm $realm, int $characterID, int $eventID)
    {
        $character = $this->resolveCharacter($realm, $characterID);
        $event = $this->resolveEvent($realm, $eventID);

        $this->authorize('edit', $event);

        return view('character.calendar.edit', ['event' => $event]);
    }

    /**
     * Handle update request for individual event.
     *
     * @param Realm $realm
     * @param int   $characterID
     * @param int   $eventID
     */
    public function update(Realm $realm, int $characterID, int $eventID)
    {
        $event = $this->resolveEvent($realm, $eventID);

        $this->authorize('update', $event);
    }

    /**
     * Show create form for individual event.
     *
     * @param Realm $realm
     * @param int   $characterID
     */
    public function create(Realm $realm, int $characterID)
    {
        $this->authorize('create', CalendarEvent::class);
    }

    /**
     * Handle create request for individual event.
     *
     * @param Realm $realm
     * @param int   $characterID
     */
    public function store(Realm $realm, int $characterID)
    {
        $this->authorize('create', CalendarEvent::class);
    }

    /**
     * Handle delete request for an individual event.
     *
     * @param Realm $realm
     * @param int   $characterID
     * @param int   $eventID
     */
    public function destroy(Realm $realm, int $characterID, int $eventID)
    {
        $event = $this->resolveEvent($realm, $eventID);

        $this->authorize('delete', $event);
    }

    /**
     * Resolve a character from a realm and a character id.
     *
     * @param Realm $realm
     * @param int   $characterID
     *
     * @return mixed
     */
    protected function resolveCharacter(Realm $realm, int $characterID)
    {
        return Character::setRealm($realm)->findOrFail($characterID);
    }

    /**
     * Resolve an event from a realm and an event id.
     *
     * @param Realm $realm
     * @param int   $eventID
     *
     * @return mixed
     */
    protected function resolveEvent(Realm $realm, int $eventID)
    {
        return CalendarEvent::setRealm($realm)->findOrFail($eventID);
    }
}
