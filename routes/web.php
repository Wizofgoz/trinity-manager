<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('dashboard', 'HomeController@index')->name('home');

Route::get('2fa/enable', 'Google2FAController@enableTwoFactor');
Route::get('2fa/disable', 'Google2FAController@disableTwoFactor');
Route::get('2fa/validate', 'Auth\AuthController@getValidateToken');
Route::post('2fa/validate', ['middleware' => 'throttle:5', 'uses' => 'Auth\LoginController@postValidateToken']);

// start account
Route::get('account/email/verify', 'AccountController@verifyEmail')->name('account.verify');
Route::middleware('auth')->group(function () {
    Route::get('account', 'AccountController@index')->name('account.show');
    Route::put('account', 'AccountController@store')->name('account.update');
});
// end account

// start realm
Route::resource('realms', 'RealmController');

Route::prefix('realms/{realm}')->group(function () {

    // start character
    Route::resource('characters', 'CharacterController', ['only' => ['index', 'show']]);

    Route::prefix('characters/{character}')->group(function () {
        // start calendar
        Route::resource('calendar', 'CalendarEventController');
        // end calendar
    });
    // end character

    //start guild
    Route::resource('guilds', 'GuildController', ['except' => ['create', 'store', 'destroy']]);

    Route::prefix('guilds/{guild}')->group(function () {
        // start guild member
        Route::resource('members', 'GuildMemberController', ['except' => ['create', 'store', 'destroy']]);
        // end guild member

        // start guild rank
        Route::resource('ranks', 'GuildRankController');
        // end guild rank
    });
    // end guild

    // start tickets
    Route::resource('tickets', 'TicketController');
    // end tickets
});
// end realm
