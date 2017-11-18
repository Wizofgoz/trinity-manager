<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class RealmStart extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'realm:start {realmID=1 : The ID of the realm to start} {--D|delay=0 : The time (in seconds) the action should be delayed}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Start the worldserver for a given realm';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //
    }
}
