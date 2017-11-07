<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class SecurityLevel extends Model
{
    const ALL_REALMS = -1;

    const LEVEL_PLAYER = 0;

    const LEVEL_MODERATOR = 1;

    const LEVEL_GM = 2;

    const LEVEL_ADMIN = 3;

    /**
     * Connection that the model uses.
     *
     * @var string
     */
    protected $connection = 'auth';

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'account_access';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Returns all realms that the security level is available on.
     *
     * @return Builder
     */
    public function realms()
    {
        if ($this->RealmID == self::ALL_REALMS) {
            return Realm::query();
        }

        return $this->belongsTo(Realm::class, 'RealmID');
    }

    /**
     * Returns the account that owns this security level.
     *
     * @return Builder
     */
    public function account()
    {
        return User::where('id', '=', $this->id);
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class);
    }
}
