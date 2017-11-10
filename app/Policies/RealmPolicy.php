<?php

namespace App\Policies;

use App\User;
use App\Models\Realm;
use Illuminate\Auth\Access\HandlesAuthorization;

class RealmPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the realm.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Realm  $realm
     * @return mixed
     */
    public function view(User $user, Realm $realm)
    {
        return true;
    }

    /**
     * Determine whether the user can create realms.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->isAdmin();
    }

    /**
     * Determine whether the user can update the realm.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Realm  $realm
     * @return mixed
     */
    public function update(User $user, Realm $realm)
    {
        return $user->isAdmin($realm->id);
    }

    /**
     * Determine whether the user can delete the realm.
     *
     * @param  \App\User  $user
     * @param  \App\Models\Realm  $realm
     * @return mixed
     */
    public function delete(User $user, Realm $realm)
    {
        return $user->isAdmin($realm->id);
    }
}
