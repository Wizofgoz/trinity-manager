<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $account = Auth::user();
        $realms = $account->realms();
        $characters = $account->allCharacters();

        return view('home', [
          'realms'     => $realms,
          'characters' => $characters,
        ]);
    }
}
