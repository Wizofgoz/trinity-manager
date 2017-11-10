<?php

namespace App\Http\Controllers;

use App\Models\Character;
use App\Models\Realm;
use Illuminate\Support\Facades\Auth;

class CharacterController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show list of all characters the user has on the realm
     * or all characters if they are a GM or Admin
     *
     * @param Realm $realm
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Realm $realm)
    {
        $characters = Character::setRealm($realm);

        if (Auth::user()->isAdmin($realm->id) || Auth::user()->isGM($realm->id)) {
            $characters = $characters->all();
        } else {
            $characters = $characters->where('account', '=', Auth::user()->id)->get();
        }

        return view('character.index', ['characters' => $characters]);
    }

    /**
     * Show info for the provided character
     *
     * @param Realm $realm
     * @param int $characterID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm, int $characterID)
    {
        $character = Character::setRealm($realm)->find($characterID);

        $this->authorize('view', $character);

        return view('character.show', ['character' => $character]);
    }
}
