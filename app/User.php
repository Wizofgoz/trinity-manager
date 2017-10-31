<?php

namespace App;

use App\Models\Character;
use App\Models\Realm;
use App\Models\SecurityLevel;
use Illuminate\Database\Eloquent\Builder;
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
        $characters = new Collection;

        // loop over realms
        foreach ($this->realms() as $realm) {
            // if the realm has characters, get them, else skip
            if ($realm->numchars > 0) {
                // add the characters to the collection
                $characters->merge(Character::where('account', '=', $this->id)->setRealm($realm)->get());
            }
        }

        return $characters;
    }

    /**
     * Returns a collection of the realms that the account has characters on
     *
     * @return Builder
     */
    public function realms()
    {
        return $this->belongsToMany(Realm::class, 'realmcharacters', 'acctid', 'realmid')
            ->withPivot('numchars');
    }

    /**
     * Returns a collection of the realms that the account has security clearance on
     *
     * @return Builder
     */
    public function securityLevels()
    {
        return SecurityLevel::where('id', '=', $this->id);
    }
}
