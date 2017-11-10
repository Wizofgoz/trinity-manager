<?php

namespace App\Models;

use App\Helpers\BelongsToRealm;
use App\Helpers\CharacterFlags;
use App\Helpers\Classes;
use App\Helpers\Races;
use App\User;
use http\Exception\InvalidArgumentException;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class Character extends Model
{
    use BelongsToRealm;

    /**
     * Mapping of Race IDs to Race Names.
     *
     * @var array
     */
    const RACES = [
        Races::HUMAN     => 'Human',
        Races::ORC       => 'Orc',
        Races::DWARF     => 'Dwarf',
        Races::NIGHT_ELF => 'Night Elf',
        Races::UNDEAD    => 'Undead',
        Races::TAUREN    => 'Tauren',
        Races::GNOME     => 'Gnome',
        Races::TROLL     => 'Troll',
        Races::GOBLIN    => 'Goblin',
        Races::BLOOD_ELF => 'Blood Elf',
        Races::DRAENEI   => 'Draenei',
    ];

    /**
     * Mapping of Class IDs to Class Names.
     *
     * @var array
     */
    const CLASSES = [
        Classes::WARRIOR      => 'Warrior',
        Classes::PALADIN      => 'Paladin',
        Classes::HUNTER       => 'Hunter',
        Classes::ROGUE        => 'Rogue',
        Classes::PRIEST       => 'Priest',
        Classes::DEATH_KNIGHT => 'Death Knight',
        Classes::SHAMAN       => 'Shaman',
        Classes::MAGE         => 'Mage',
        Classes::WARLOCK      => 'Warlock',
        Classes::MONK         => 'Monk',
        Classes::DRUID        => 'Druid',
        Classes::DEMON_HUNTER => 'Demon Hunter',
    ];

    const FLAGS = [
        CharacterFlags::GROUP_LEADER           => 'Group Leader',
        CharacterFlags::IS_AFK                 => 'AFK',
        CharacterFlags::IS_DO_NOT_DISTURB      => 'Do Not Disturb',
        CharacterFlags::IS_GM                  => 'GM',
        CharacterFlags::IS_GHOST               => 'Ghost',
        CharacterFlags::IS_RESTING             => 'Resting',
        CharacterFlags::UNKNOWN7               => 'Unknown (7)',
        CharacterFlags::UNKNOWN8               => 'Unknown (8)',
        CharacterFlags::IS_CONTESTED_PVP       => 'Contested PVP',
        CharacterFlags::IS_IN_PVP              => 'In PVP',
        CharacterFlags::IS_HELM_HIDDEN         => 'Hide Helm',
        CharacterFlags::IS_CLOAK_HIDDEN        => 'Cloak Hidden',
        CharacterFlags::HAS_PLAYED_LONG_TIME   => 'Played Long Time',
        CharacterFlags::HAS_PLAYED_TOO_LONG    => 'Played Too Long',
        CharacterFlags::IS_OUT_OF_BOUNDS       => 'Out Of Bounds',
        CharacterFlags::IS_DEVELOPER           => 'Developer',
        CharacterFlags::UNKNOWN17              => 'Unknown (17)',
        CharacterFlags::IN_TAXI_BENCHMARK_MODE => 'Taxi Benchmark',
        CharacterFlags::IS_PVP_TIMER_ACTIVE    => 'PVP Timer Active',
        CharacterFlags::UNKNOWN20              => 'Unknown (20)',
        CharacterFlags::UNKNOWN21              => 'Unknown (21)',
        CharacterFlags::UNKNOWN22              => 'Unknown (22)',
        CharacterFlags::IS_COMMENTATOR         => 'Commentator',
        CharacterFlags::ALLOW_ONLY_ABILITY     => 'Allow Only Ablility',
        CharacterFlags::UNKNOWN25              => 'Unknown (25)',
        CharacterFlags::CANNOT_GAIN_XP         => 'No XP Gain',
    ];

    const CONNECTION_BASE = 'characters';

    /**
     * Name of column that acts as the model's primary key.
     *
     * @var string
     */
    protected $primaryKey = 'guid';

    /**
     * Whether the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Returns the key name for use in routing
     *
     * @return string
     */
    public function getRouteKeyName()
    {
        return 'guid';
    }

    /**
     * Returns the account the character belongs to.
     *
     * @return Builder
     */
    public function account()
    {
        return User::where('id', '=', $this->account);
    }

    /**
     * Returns the race of the character.
     *
     * @return string
     */
    public function race()
    {
        return self::RACES[$this->race];
    }

    /**
     * Returns the class of the character.
     *
     * @return string
     */
    public function class()
    {
        return self::CLASSES[$this->class];
    }

    /**
     * Returns an array of the achievements the character has completed so far.
     *
     * @return array
     */
    public function achievementsCompleted()
    {
        $achievements = [];

        // get achievements that have been completed by the character
        $achieved = DB::connection('character')->table('character_achievement')->where('guid', $this->guid)->order('achievement')->get();

        $ids = [];

        // pull out the achievement IDs
        foreach ($achieved as $row) {
            $ids[] = $row->achievement;
        }

        // get achievement information for the retrieved IDs
        $infos = Achievement::whereIn('ID', $ids)->order('ID')->get();

        // merge the date achieved into the extended info
        foreach ($infos as $index => $info) {
            $achievements[$index] = array_merge($achieved, $infos);
        }

        // return the array sorted by date achieved
        return Arr::sort($achievements, function ($a, $b) {
            return $a['date'] <=> $b['date'];
        });
    }

    /**
     * TODO: finish implementing.
     *
     * @return array
     */
    public function achievementsInProgress()
    {
        $achievements = [];

        // get achievements that have been started by the character
        $progressed = DB::connection('character')->table('character_achievement_progress')->where('guid', $this->guid)->order('criteria')->get();

        $ids = [];

        // pull out the criteria IDs
        foreach ($progressed as $row) {
            $ids[] = $row->criteria;
        }

        // get achievement information for the retrieved IDs
        $infos = Achievement::whereIn('Achievement', $ids)->join('')->order('ID')->get();

        // merge the date achieved into the extended info
        foreach ($infos as $index => $info) {
            $achievements[$index] = array_merge($achieved, $infos);
        }

        // return the array sorted by date achieved
        return Arr::sort($achievements, function ($a, $b) {
            return $a['date'] <=> $b['date'];
        });
    }

    /**
     * Returns the Guild that the Character belongs to.
     *
     * @return Builder
     */
    public function guild()
    {
        // characters can't really have multiple guilds
        // but the relationship follows the pattern
        return $this->belongsToMany(Guild::class, 'guild_member', 'guid', 'guildid', 'guid', 'guildid')
            ->connection($this->getConnectionName())
            ->using(GuildMember::class)
            ->as('member');
    }

    /**
     * Returns the Character's rank in their guild.
     *
     * @return Builder
     */
    public function guildRank()
    {
        $member = $this->guild()->first()->member;

        return $member->rank();
    }

    /**
     * Defines relation between the character and the Arena Teams they are a part of.
     *
     * @return Builder
     */
    public function arenaTeams()
    {
        return $this->belongsToMany(ArenaTeam::class, 'arena_team_member', 'guid', 'arenaTeamId', 'guid', 'arenaTeamId')
            ->as('member');
    }

    /**
     * Defines relation between the character and items that are in their inventory (main backpack and bags).
     *
     * @return Builder
     */
    public function inventory()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '!=', InventoryItem::INVENTORY_EQUIPPED)
            ->using(InventoryItem::class)
            ->as('slot')
            // get items in character's main backpack
            ->unionAll($this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
                ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
                ->wherePivotIn('slot', InventoryItem::SLOT_TYPES_MAIN_BACKPACK)
                ->using(InventoryItem::class)
                ->as('slot')
            );
    }

    /**
     * Defines relation between the character and items that are equipped to their person
     * Filterable by slot name.
     *
     * @param string|null $slot
     *
     * @return Builder
     */
    public function equipped(string $slot = null)
    {
        $equipped = $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->using(InventoryItem::class)
            ->as('slot');

        // if a slot is specified, validate it and filter the query
        if ($slot !== null) {
            if (!in_array($slot, InventoryItem::SLOT_TYPES_EQUIPPED)) {
                throw new InvalidArgumentException('Invalid slot type');
            }

            return $equipped->wherePivot('slot', '=', InventoryItem::SLOT_TYPES_EQUIPPED[$slot]);
        }

        return $equipped->wherePivotIn('slot', InventoryItem::SLOT_TYPES_EQUIPPED);
    }

    /**
     * Defines relation between the character and the bags that are assigned to inventory slots.
     *
     * @return Builder
     */
    public function inventoryBags()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->wherePivotIn('slot', InventoryItem::SLOT_TYPES_EQUIPPED_BAGS)
            ->using(InventoryItem::class)
            ->as('slot');
    }

    /**
     * Defines relation between the character and the items in their main bank tab.
     *
     * @return Builder
     */
    public function bankInventory()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->wherePivotIn('slot', SLOT_TYPES_MAIN_BANK)
            ->using(InventoryItem::class)
            ->as('slot');
    }

    /**
     * Defines relation between the character and the bags that are assigned to bank slots.
     *
     * @return Builder
     */
    public function bankBags()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->wherePivotIn('slot', SLOT_TYPES_BANK_BAGS)
            ->using(InventoryItem::class)
            ->as('slot');
    }

    /**
     * Defines relation between the character and the keys they have on their keyring.
     *
     * @return Builder
     */
    public function keys()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->wherePivotIn('slot', SLOT_TYPES_KEYRING)
            ->using(InventoryItem::class)
            ->as('slot');
    }

    /**
     * Defines relation between the character and the currencies they are in possession of (Emblems, Marks, etc.).
     *
     * @return Builder
     */
    public function currencies()
    {
        return $this->belongsToMany(ItemInstance::class, 'character_inventory', 'guid', 'item', 'guid', 'guid')
            ->wherePivot('bag', '=', InventoryItem::INVENTORY_EQUIPPED)
            ->wherePivotIn('slot', SLOT_TYPES_CURRENCIES)
            ->using(InventoryItem::class)
            ->as('slot');
    }

    /**
     * Returns StdClass object with character's stats.
     *
     * @return \StdClass
     */
    public function stats()
    {
        return DB::connection($this->getConnectionName())->table('character_stats')->where('guid', '=', $this->guid)->first();
    }

    /**
     * Returns StdClass object with xp needed for character to reach the next level.
     *
     * @return \StdClass
     */
    public function xpToLevel()
    {
        return DB::connection('world')->table('player_xp_for_level')->where('level', '=', $this->level)->first('Experience');
    }

    /**
     * Defines relation between the character and any mail they have received.
     *
     * @return Builder
     */
    public function receivedMail()
    {
        return $this->hasMany(Mail::class, 'receiver', 'guid');
    }

    /**
     * Defines relation between the character and any mail they have sent.
     *
     * @return Builder
     */
    public function sentMail()
    {
        return $this->hasMany(Mail::class, 'sender', 'guid');
    }

    /**
     * Defines relation between the character and any events they have been invited to
     *
     * @return Builder
     */
    public function calendarReceived()
    {
        return $this->belongsToMany(CalendarEvent::class, 'calendar_invites', 'invitee', 'calendar', 'guid', 'id')
              ->using(CalendarInvite::class)
              ->as('invite');
    }

    /**
     * Defines relation between the character and any events they have invited others to
     *
     * @return Builder
     */
    public function calendarSent()
    {
        return $this->belongsToMany(CalendarEvent::class, 'calendar_invites', 'invitee', 'calendar', 'guid', 'id')
              ->using(CalendarInvite::class)
              ->as('invite');
    }

    /**
     * Returns array of stringified flags the character has assigned.
     *
     * @return array
     */
    public function flags()
    {
        $flags = [];

        foreach (self::FLAGS as $value => $string) {
            if ($this->playerFlags & $value) {
                $flags[] = $string;
            }
        }

        return $flags;
    }

    /**
     * Whether or not the character has a given flag.
     *
     * @param int $flag
     *
     * @return int
     */
    public function hasFlag(int $flag)
    {
        if (!Arr::exists(self::FLAGS, $flag)) {
            throw new \InvalidArgumentException('Invalid flag given');
        }

        return $this->playerFlags & $flag;
    }

    /**
     * Gets string version of title the character has activated (defaults to %s)
     *
     * @return string
     */
    public function title()
    {
        return DB::connection('sqlite')->table('player_titles_wotlk')
                ->where('id', '=', $this->chosenTitle)->select('title')->first(null, '%s');
    }

    /**
     * Gets name formatted with active title
     *
     * @return string
     */
    public function formattedName()
    {
        return sprintf($this->title(), $this->name);
    }
}
