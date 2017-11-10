<?php

namespace App\Http\Controllers;

use App\Models\Guild;
use App\Models\GuildMember;
use App\Models\Realm;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class GuildMemberController extends Controller
{
    /**
     * GuildMemberController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * List of guild members for a given guild on a realm
     *
     * @param Request $request
     * @param Realm $realm
     * @param int $guildID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request, Realm $realm, int $guildID)
    {
        $guild = $this->resolveGuild($realm, $guildID);

        $members = $guild->members();

        if ($request->has('rank')) {
          $members->where('rank', '=', $request->rank);
        }

        $members = $members->get();

        return view('guild.member.index', ['members' => $members]);
    }

    /**
     * Info view for a guild member
     *
     * @param Realm $realm
     * @param int $guildID
     * @param int $characterID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm, int $guildID, int $characterID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $member = $this->resolveGuildMember($guild, $characterID);

        $this->authorize('view', $member);

        return view('guild.member.show', ['member' => $member]);
    }

    /**
     * Show edit form for a guild member
     *
     * @param Realm $realm
     * @param int $guildID
     * @param int $characterID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Realm $realm, int $guildID, int $characterID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $member = $this->resolveGuildMember($guild, $characterID);

        $this->authorize('update', $member);

        return view('guild.member.edit', ['member' => $member]);
    }

    /**
     * Update the guild in the database
     *
     * @param Request $request
     * @param Realm $realm
     * @param int $guildID
     * @param int $characterID
     */
    public function update(Request $request, Realm $realm, int $guildID, int $characterID)
    {
        $guild = $this->resolveGuild($realm, $guildID);
        $member = $this->resolveGuildMember($guild, $characterID);

        $this->authorize('update', $member);

        $member->rank = $request->rank;
        $member->pnote = $request->pnote;

    }

    /**
     * Resolve a Guild from a realm and guild ID
     *
     * @param Realm $realm
     * @param int $guildID
     * @throws ModelNotFoundException
     * @return Guild
     */
    protected function resolveGuild(Realm $realm, int $guildID)
    {
        return Guild::setRealm($realm)->findOrFail($guildID);
    }

    /**
     * Resolve a Guild Member from a guild and Character ID
     *
     * @param Guild $guild
     * @param int $characterID
     * @throws ModelNotFoundException
     * @return GuildMember
     */
    protected function resolveGuildMember(Guild $guild, int $characterID)
    {
        return GuildMember::setRealm($guild->getRealm())
                ->where('guildid', '=', $guild->id)
                ->where('guid', '=', $characterID)->findOrFail();
    }

    /**
     * Get validator for a member list search request
     *
     * @param array $data
     * @return mixed
     */
    protected function membersSearchValidator(array $data)
    {
        return Validator::make($data, [
            'rank' => [
                'optional',
                Rule::exists('characters'.$data['realm'].'.guild_rank')
                    ->where('rid', $data['rank'])
                    ->where('guildid', $data['guild'])
            ]
        ]);
    }
}
