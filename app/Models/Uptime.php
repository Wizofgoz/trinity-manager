<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Uptime extends Model
{
    protected $connection = 'auth';
    protected $table = 'uptime';
    public $timestamps = false;
    protected $primaryKey = 'realmid';

  /**
   * Returns the realm that the uptime object belongs to
   *
   * @return Builder
   */
    public function realm()
    {
        return $this->belongsTo(Realm::class, 'realmid');
    }
}