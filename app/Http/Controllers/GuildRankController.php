<?php

namespace App\Http\Controllers;

use App\Models\Guild;
use App\Models\GuildRank;
use App\Models\Realm;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class GuildRankController extends Controller
{
    /**
     * GuildMemberController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * List of guild ranks for a given guild on a realm.
     *
     * @param Realm $realm
     * @param int   $guildID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Realm $realm, int $guildID)
    {
        $guild = $this->resolveGuild($realm, $guildID);

        $ranks = $guild->ranks()->get();

        return view('guild.rank.index', ['ranks' => $ranks]);
    }

    /**
     * Info view for a guild rank.
     *
     * @param Realm $realm
     * @param int   $guildID
     * @param int   $rankID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm, int $guildID, int $rankID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $rank = $this->resolveGuildRank($guild, $rankID);

        $this->authorize('view', $rank);

        return view('guild.rank.show', ['rank' => $rank]);
    }

    /**
     * Show edit form for a guild rank.
     *
     * @param Realm $realm
     * @param int   $guildID
     * @param int   $rankID
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Realm $realm, int $guildID, int $rankID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $rank = $this->resolveGuildRank($guild, $rankID);

        $this->authorize('update', $rank);

        return view('guild.rank.edit', ['rank' => $rank]);
    }

    /**
     * Update the guild in the database.
     *
     * @param Request $request
     * @param Realm   $realm
     * @param int     $guildID
     * @param int     $rankID
     */
    public function update(Request $request, Realm $realm, int $guildID, int $rankID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $rank = $this->resolveGuildRank($guild, $rankID);

        $this->authorize('update', $rank);

        $rank->rank = $request->rank;
        $rank->pnote = $request->pnote;
    }

    public function create()
    {
    }

    public function store()
    {
    }

    public function destroy()
    {
    }

    /**
     * Resolve a Guild from a realm and guild ID.
     *
     * @param Realm $realm
     * @param int   $guildID
     *
     * @throws ModelNotFoundException
     *
     * @return Guild
     */
    protected function resolveGuild(Realm $realm, int $guildID)
    {
        return Guild::setRealm($realm)->findOrFail($guildID);
    }

    /**
     * Resolve a Guild Member from a guild and Character ID.
     *
     * @param Guild $guild
     * @param int   $rankID
     *
     * @throws ModelNotFoundException
     *
     * @return GuildRank
     */
    protected function resolveGuildRank(Guild $guild, int $rankID)
    {
        return GuildRank::setRealm($guild->getRealm())
            ->where('guildid', '=', $guild->id)
            ->where('rid', '=', $rankID)->findOrFail();
    }
}
