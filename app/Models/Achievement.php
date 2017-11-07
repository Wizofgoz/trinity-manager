<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Achievement extends Model
{
    protected $connection = 'sqlite';

    protected $table = 'achievements_wotlk';
}
