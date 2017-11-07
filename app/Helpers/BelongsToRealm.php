<?php

namespace App\Helpers;

use App\Models\Realm;

trait BelongsToRealm
{
    protected $realm;

    public function setRealm(Realm $realm)
    {
        $this->realm = $realm;
        $this->setConnection(static::CONNECTION_BASE.$this->realm->id);
    }

    public function getRealm()
    {
        return $this->realm;
    }
}
