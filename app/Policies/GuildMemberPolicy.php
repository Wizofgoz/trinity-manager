<?php

namespace App\Policies;

use App\User;
use App\Models\GuildMember;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class GuildMemberPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the guildMember.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildMember  $guildMember
     * @return mixed
     */
    public function view(User $user, GuildMember $guildMember)
    {
        if ($user->isAdmin()) {
            return true;
        }

        $guild = $guildMember->guild();

        try {
            $characterIDs = $user->realmCharacters($guild->getRealm())->pluck('guid');
            $guild->members()->whereIn($characterIDs);
        } catch (ModelNotFoundException $e) {
            return false;
        }

        return true;
    }

    /**
     * Determine whether the user can create guildMembers.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return false;
    }

    /**
     * Determine whether the user can update the guildMember.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildMember  $guildMember
     * @return mixed
     */
    public function update(User $user, GuildMember $guildMember)
    {
        return $user->isAdmin() || $this->isGuildMaster($user, $guildMember);
    }

    /**
     * Determine whether the user can delete the guildMember.
     *
     * @param  \App\User  $user
     * @param  \App\Models\GuildMember  $guildMember
     * @return mixed
     */
    public function delete(User $user, GuildMember $guildMember)
    {
        return $user->isAdmin() || $this->isGuildMaster($user, $guildMember);
    }

    /**
     * Determine whether the user is the master of the guild in question
     *
     * @param User $user
     * @param GuildMember $guildMember
     * @return bool
     */
    protected function isGuildMaster(User $user, GuildMember $guildMember)
    {
        $guild = $guildMember->guild();

        return $guild->master()->first()->id === $user->id;
    }
}
