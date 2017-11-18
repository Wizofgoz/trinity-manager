<?php

namespace App\Http\Controllers;

use App\Models\Character;
use App\Models\Realm;
use App\Models\Ticket;
use App\Rules\CharacterExists;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @param Realm   $realm
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Realm $realm)
    {
        $tickets = Ticket::setRealm($realm);

        if ($request->has('open') && $request->open == 1) {
            $tickets->where('closedBy', '=', 0);
        }

        if ($request->has('closed') && $request->closed == 1) {
            $tickets->where('closedBy', '!=', 0);
        }

        if ($request->has('viewed') && $request->viewed == 1) {
            $tickets->where('viewed', '>', 0);
        }

        if ($request->has('unviewed') && $request->unviewed == 1) {
            $tickets->where('viewed', '=', 0);
        }

        if ($request->has('openedBy')) {
            $character = Character::setRealm($realm)->where('name', '=', $request->openedBy)->first();
            $tickets->where('playerGuid', '=', $character->guid);
        }

        if ($request->has('closedBy')) {
            $character = Character::setRealm($realm)->where('name', '=', $request->closedBy)->first();
            $tickets->where('closedBy', '=', $character->guid);
        }

        if ($request->has('assignedTo')) {
            $character = Character::setRealm($realm)->where('name', '=', $request->assignedTo)->first();
            $tickets->where('assignedTo', '=', $character->guid);
        }

        if ($request->has('start')) {
            $tickets->where('createtime', '>=', Carbon::createFromFormat('Y-m-d H:i:s', $request->start)->timestamp);
        }

        if ($request->has('end')) {
            $tickets->where('createtime', '<', Carbon::createFromFormat('Y-m-d H:i:s', $request->end)->timestamp);
        }

        $tickets = $tickets->get();

        return view('ticket.index', ['tickets' => $tickets]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param Realm $realm
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Realm $realm)
    {
        $this->authorize('create', Ticket::class);

        return view('tickets.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Realm                    $realm
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Realm $realm)
    {
        $this->authorize('create', Ticket::class);

        $this->validator($request->all())->validate();

        $ticket = (new Ticket())->setRealm($realm);
        $ticket->playerGuid = $request->playerGuid;
        $ticket->name = $request->name;
        $ticket->description = $request->description;
        $ticket->mapId = $request->mapId;
        $ticket->posX = $request->posX;
        $ticket->posY = $request->posY;
        $ticket->posZ = $request->posZ;
        $ticket->createtime = Carbon::now()->timestamp;
        $ticket->closedBy = $request->closedBy;
        $ticket->assignedTo = $request->assignedTo;
        $ticket->comment = $request->comment;
        $ticket->response = $request->response;
        $ticket->completed = $request->completed;
        $ticket->escalated = $request->escalated;

        $ticket->save();
        session()->flash('status', 'Ticket created');
    }

    /**
     * Display the specified resource.
     *
     * @param Realm $realm
     * @param int   $ticketID
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Realm $realm, int $ticketID)
    {
        $ticket = $this->resolveTicket($realm, $ticketID);

        $this->authorize('view', $ticket);

        return view('tickets.show', ['ticket' => $ticket]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Realm $realm
     * @param int   $ticketID
     *
     * @return \Illuminate\Http\Response
     */
    public function edit(Realm $realm, int $ticketID)
    {
        $ticket = $this->resolveTicket($realm, $ticketID);

        $this->authorize('update', $ticket);

        return view('tickets.edit', ['ticket' => $ticket]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param Realm                    $realm
     * @param int                      $ticketID
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Realm $realm, int $ticketID)
    {
        $ticket = $this->resolveTicket($realm, $ticketID);

        $this->authorize('update', $ticket);

        $ticket->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Realm $realm
     * @param int   $ticketID
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Realm $realm, int $ticketID)
    {
        $ticket = $this->resolveTicket($realm, $ticketID);

        $this->authorize('delete', $ticket);

        $ticket->delete();
    }

    /**
     * Resolve a Ticket from a realm and ticket ID.
     *
     * @param Realm $realm
     * @param int   $ticketID
     *
     * @throws ModelNotFoundException
     *
     * @return Ticket
     */
    protected function resolveTicket(Realm $realm, int $ticketID)
    {
        return Ticket::setRealm($realm)->findOrFail($ticketID);
    }

    /**
     * Returns a validator instance for create/update requests.
     *
     * @param array $data
     *
     * @return \Illuminate\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'playerGuid' => [
                'required',
                'numeric',
                Rule::exists("characters{$data['realm']}.characters")->where(function ($query) use ($data) {
                    $query->where('guid', $data['playerGuid'])
                        ->where('account', Auth::user()->id);
                }),
            ],
            'description' => 'required|string',
            'mapId'       => 'required|numeric',
            'posX'        => 'required|numeric|min:0',
            'posY'        => 'required|numeric|min:0',
            'posZ'        => 'required|numeric|min:0',
            'closedBy'    => ['required', new CharacterExists($data)],
            'assignedTo'  => ['optional', new CharacterExists($data)],
            'comment'     => 'optional|string',
            'response'    => [
                'optional',
                'numeric',
                Rule::in([Ticket::RESPONSE_TRUE, Ticket::RESPONSE_FALSE]),
            ],
            'completed' => 'optional|numeric',
            'escalated' => 'optional|numeric',
        ]);
    }

    /**
     * Returns a validator instance for search requests.
     *
     * @param array $data
     *
     * @return \Illuminate\Validation\Validator
     */
    protected function searchValidator(array $data)
    {
        return Validator::make($data, [
            'open'     => 'optional|boolean|different:closed',
            'closed'   => 'optional|boolean|different:open',
            'viewed'   => 'optional|boolean|different:unviewed',
            'unviewed' => 'optional|boolean|different:viewed',
            'openedBy' => [
                'optional',
                'string',
                Rule::exists('characters'.$data['realm'].'.characters')
                    ->where('name', $data['openedBy']),
            ],
            'closedBy' => [
                'optional',
                Rule::exists('characters'.$data['realm'].'.characters')
                    ->where('name', $data['closedBy']),
            ],
            'assignedTo' => [
                'optional',
                Rule::exists('characters'.$data['realm'].'.characters')
                  ->where('name', $data['assignedTo']),
            ],
            'start' => 'optional|date|before:end',
            'end'   => 'optional|date|after:start',
        ]);
    }
}
