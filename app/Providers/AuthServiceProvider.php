<?php

namespace App\Providers;

use App\Extensions\SHA1Hasher;
use App\Models\CalendarEvent;
use App\Models\Guild;
use App\Models\GuildMember;
use App\Models\GuildRank;
use App\Models\Realm;
use App\Models\Ticket;
use App\Policies\CalendarEventPolicy;
use App\Policies\GuildMemberPolicy;
use App\Policies\GuildPolicy;
use App\Policies\GuildRankPolicy;
use App\Policies\RealmPolicy;
use App\Policies\TicketPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Auth;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        Realm::class => RealmPolicy::class,
        Guild::class => GuildPolicy::class,
        GuildMember::class => GuildMemberPolicy::class,
        GuildRank::class => GuildRankPolicy::class,
        CalendarEvent::class => CalendarEventPolicy::class,
        Ticket::class => TicketPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Auth::provider('trinitycore', function ($app, array $config) {
            return new TrinityCoreUserProvider(new SHA1Hasher(), $config['model']);
        });
    }
}
