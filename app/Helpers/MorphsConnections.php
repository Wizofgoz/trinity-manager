<?php

namespace App\Helpers;

use Closure;
use Illuminate\Support\Facades\Config;

trait MorphsConnections
{
    private $connectionBase;

    public function iterateConnection(string $base, Closure $function, int $start = 1, int $end = null)
    {
        $this->connectionBase = $base;

        if ($end === null) {
            $end = $this->getDefaultEndCount();
        }

        for ($i = $start; $i <= $end; $i++) {
            $function($base.$i);
        }
    }

    public function getDefaultEndCount()
    {
        $count = 0;
        $connections = Config::get('database')['connections'];
        foreach ($connections as $connection => $info) {
            if (strpos($connection, $this->connectionBase) !== false) {
                $count++;
            }
        }

        return $count;
    }
}