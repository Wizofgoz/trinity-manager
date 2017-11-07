<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddEmailVerificationToken extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('auth')->table('account', function (Blueprint $table) {
            $table->boolean('email_verified')->default(0);
            $table->text('email_verification_token')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('auth')->table('account', function (Blueprint $table) {
            $table->dropColumn(['email_verified', 'email_verification_token']);
        });
    }
}
