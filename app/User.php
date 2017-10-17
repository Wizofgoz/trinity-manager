<?php

namespace App;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * DB connection that the model uses
     *
     * @var string
     */
    protected $connection = 'auth';

    /**
     * DB table that the model resides in
     *
     * @var string
     */
    protected $table = 'account';

    /**
     * Whether the model contains standard timestamp columns
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'sha_pass_hash',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'sha_pass_hash', 'remember_token',
    ];

    /**
     * Returns the password hash for the model
     *
     * @return string
     */
    public function getAuthPassword()
    {
        return $this->sha_pass_hash;
    }

    /**
     * Returns the identifier for the model
     *
     * @return string
     */
    public function getAuthIdentifierName()
    {
        return 'username';
    }

    /**
     * Returns a collection of the Characters that belong to the account
     *
     * @return Collection
     */
    public function characters()
    {
        return $this->hasMany('App\Models\Character', 'account');
    }

    /**
     * Returns a collection of the realms that the account has characters on
     *
     * @return Collection
     */
    public function realms()
    {
        return $this->belongsToMany('App\Models\Realm', 'realmcharacters', 'acctid', 'realmid')
            ->withPivot('numchars');
    }
}
