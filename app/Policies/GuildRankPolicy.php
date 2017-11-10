<?php

namespace App\Policies;

use App\Helpers\GuildRights;
use App\Models\Guild;
use App\Models\GuildMember;
use App\User;
use App\Models\GuildRank;
use Illuminate\Auth\Access\HandlesAuthorization;

class GuildRankPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the GuildRank.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildRank  $guildRank
     * @return mixed
     */
    public function view(User $user, GuildRank $guildRank)
    {
        return true;
    }

    /**
     * Determine whether the user can create GuildRanks.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Guild  $guild
     * @return mixed
     */
    public function create(User $user, Guild $guild)
    {
        return $this->canEditGuildInfo($user, $guild);
    }

    /**
     * Determine whether the user can update the GuildRank.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildRank  $guildRank
     * @return mixed
     */
    public function update(User $user, GuildRank $guildRank)
    {
        return $this->canEditGuildInfo($user, $guild);
    }

    /**
     * Determine whether the user can delete the GuildRank.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildRank  $guildRank
     * @return mixed
     */
    public function delete(User $user, GuildRank $guildRank)
    {
        return $this->canEditGuildInfo($user, $guild);
    }

    /**
     * Determine whether the user can make edits to guild info
     *
     * @param User $user
     * @param Guild $guild
     * @return bool
     */
    protected function canEditGuildInfo(User $user, Guild $guild)
    {
        // either they are an admin or their rank can edit guild info
        if ($user->isAdmin($guild->getRealm()->id)) {
            return true;
        }

        $characters = $user->realmCharacters($guild->getRealm())->pluck('guid');
        $members = GuildMember::setRealm($guild->getRealm())->whereIn('guid', $characters)->get();
        foreach ($members as $member) {
            if ($member->rank()->hasRight(GuildRights::EDIT_GUILD_INFO)) {
                return true;
            }
        }

        return false;
    }
}
