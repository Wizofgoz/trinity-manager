<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;

class SecurityLevel extends Pivot
{
    /**
     * Connection that the model uses
     *
     * @var string
     */
    protected $connection = 'auth';

    /**
     * DB table that the model resides in
     *
     * @var string
     */
    protected $table = 'account_access';

    /**
     * Whether the model contains standard timestamp columns
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Returns all realms that the security level is available on
     *
     * @return Builder
     */
    public function realms()
    {
        if ($this->RealmID == -1) {
            return Realm::query();
        }

        return $this->belongsTo(Realm::class, 'RealmID');
    }

  /**
     * Returns the account that owns this security level
     *
     * @return Builder
     */
    public function account()
    {
        return $this->belongsTo(User::class, 'id');
    }
}