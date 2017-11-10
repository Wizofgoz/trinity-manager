<?php

namespace App\Http\Controllers;

use App\Models\Guild;
use App\Models\Realm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GuildController extends Controller
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
     * List of guilds on the given realm.
     *
     * @param Realm $realm
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Realm $realm)
    {
        $guilds = Guild::setRealm($realm)->all();

        return view('guild.index', ['guilds' => $guilds]);
    }

    /**
     * Information view for a guild.
     *
     * @param Realm $realm
     * @param int   $guildID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm, int $guildID)
    {
        $guild = $this->resolveGuild($realm, $guildID);

        $this->authorize('view', $guild);

        return view('guild.show', ['guild' => $guild]);
    }

    /**
     * Show edit form for guild.
     *
     * @param Realm $realm
     * @param int   $guildID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Realm $realm, int $guildID)
    {
        $guild = $this->resolveGuild($realm, $guildID);

        $this->authorize('update', $guild);

        return view('guild.edit');
    }

    /**
     * Store the changes in the database.
     *
     * @param Request $request
     * @param Realm   $realm
     * @param int     $guildID
     */
    public function update(Request $request, Realm $realm, int $guildID)
    {
        $guild = $this->resolveGuild($realm, $guildID);

        $this->authorize('update', $guild);

        $this->validator($request->all())->validate();

        $guild->name = $request->name;

        $guild->save();
        session()->flash('status', 'Guild updated');
    }

    public function delete()
    {
    }

    /**
     * Resolve guild from ID and a given realm.
     *
     * @param Realm $realm
     * @param int   $guildID
     *
     * @return mixed
     */
    protected function resolveGuild(Realm $realm, int $guildID)
    {
        return Guild::setRealm($realm)->findOrFail($guildID);
    }

    /**
     * Get validator for a guild.
     *
     * @param array $data
     *
     * @return mixed
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|min:4|max:255',
        ]);
    }
}
