<?php

namespace App;

use App\Models\Character;
use App\Models\Realm;
use App\Models\SecurityLevel;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * DB connection that the model uses.
     *
     * @var string
     */
    protected $connection = 'auth';

    /**
     * DB table that the model resides in.
     *
     * @var string
     */
    protected $table = 'account';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    protected $primaryKey = 'id';

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
     * Returns the password hash for the model.
     *
     * @return string
     */
    public function getAuthPassword()
    {
        return $this->sha_pass_hash;
    }

    /**
     * Returns the identifier for the model.
     *
     * @return string
     */
    public function getAuthIdentifierName()
    {
        return 'username';
    }

    /**
     * Returns a collection of the Characters that belong to the account.
     *
     * @return Collection
     */
    public function allCharacters()
    {
        $characters = new Collection();

        // loop over realms
        foreach ($this->realms() as $realm) {
            // if the realm has characters, get them, else skip
            if ($realm->numchars > 0) {
                // add the characters to the collection
                $characters->merge($this->realmCharacters($realm));
            }
        }

        return $characters;
    }

    /**
     * Returns a collection of the characters that belong to the account on the given realm.
     *
     * @param Realm $realm
     *
     * @return mixed
     */
    public function realmCharacters(Realm $realm)
    {
        return Character::setRealm($realm)->where('account', '=', $this->id)->get();
    }

    /**
     * Returns a collection of the realms that the account has characters on.
     *
     * @return Builder
     */
    public function realms()
    {
        return $this->belongsToMany(Realm::class, 'realmcharacters', 'acctid', 'realmid')
            ->withPivot('numchars');
    }

    /**
     * Returns a collection of the realms that the account has security clearance on.
     *
     * @return Builder
     */
    public function securityLevels()
    {
        return SecurityLevel::where('id', '=', $this->id);
    }

    /**
     * Whether the user is a normal player on the given realm or all realms when omitted.
     *
     * @param int|null $realmID
     *
     * @return bool
     */
    public function isPlayer(int $realmID = null)
    {
        return $this->hasSecurityLevel(['level' => SecurityLevel::LEVEL_PLAYER, 'realm' => $realmID]);
    }

    /**
     * Whether the user is a moderator on the given realm or all realms when omitted.
     *
     * @param int|null $realmID
     *
     * @return bool
     */
    public function isModerator(int $realmID = null)
    {
        return $this->hasSecurityLevel(['level' => SecurityLevel::LEVEL_MODERATOR, 'realm' => $realmID]);
    }

    /**
     * Whether the user is a GM on the given realm or all realms when omitted.
     *
     * @param int|null $realmID
     *
     * @return bool
     */
    public function isGM(int $realmID = null)
    {
        return $this->hasSecurityLevel(['level' => SecurityLevel::LEVEL_GM, 'realm' => $realmID]);
    }

    /**
     * Whether the user is a moderator on the given realm or all realms when omitted.
     *
     * @param int|null $realmID
     *
     * @return bool
     */
    public function isAdmin(int $realmID = null)
    {
        return $this->hasSecurityLevel(['level' => SecurityLevel::LEVEL_ADMIN, 'realm' => $realmID]);
    }

    /**
     * Whether the user has a SecurityLevel matching the given filters.
     *
     * @param array $filters
     *
     * @return bool
     */
    public function hasSecurityLevel(array $filters = [])
    {
        $defaultFilters = [
            'level' => SecurityLevel::LEVEL_PLAYER,
            'realm' => SecurityLevel::ALL_REALMS,
        ];

        $filters = array_merge($defaultFilters, $filters);

        $secLevels = $this->securityLevels()->get();
        foreach ($secLevels as $secLevel) {
            if ($secLevel->gmlevel >= $filters['level'] && (
                $secLevel->RealmID == $filters['realm'] ||
                $secLevel->RealmID == SecurityLevel::ALL_REALMS)) {
                return true;
            }
        }

        // default permission is player and will have no row
        if ($filters['level'] === SecurityLevel::LEVEL_PLAYER) {
            return true;
        }

        return false;
    }
}
