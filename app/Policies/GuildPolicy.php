<?php

namespace App\Policies;

use App\User;
use App\Models\Guild;
use Illuminate\Auth\Access\HandlesAuthorization;

class GuildPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the guild.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Guild  $guild
     * @return mixed
     */
    public function view(User $user, Guild $guild)
    {
        return true;
    }

    /**
     * Determine whether the user can create guilds.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->isAdmin();
    }

    /**
     * Determine whether the user can update the guild.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Guild  $guild
     * @return mixed
     */
    public function update(User $user, Guild $guild)
    {
        // if user is either an admin or the guild master
        return $user->isAdmin() || $this->isGuildMaster($user, $guild);
    }

    /**
     * Determine whether the user can delete the guild.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Guild  $guild
     * @return mixed
     */
    public function delete(User $user, Guild $guild)
    {
        // if user is either an admin or the guild master
        return $user->isAdmin() || $this->isGuildMaster($user, $guild);
    }

    /**
     * Determine whether the user is the master of the guild in question
     *
     * @param User $user
     * @param Guild $guild
     * @return bool
     */
    protected function isGuildMaster(User $user, Guild $guild)
    {
        return $guild->master()->first()->id === $user->id;
    }
}
