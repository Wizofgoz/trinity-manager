<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $connection = 'auth';

    protected $table = 'rbac_permissions';

    public $timestamps = false;

    public function roles()
    {
    }

    public function users()
    {
        $this->belongsToMany(User::class, 'rbac_account_permissions', 'permissionId',
            'accountId', 'id', 'guid');
    }
}
