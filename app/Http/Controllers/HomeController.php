<?php

namespace App\Http\Controllers;

use App\Models\Realm;
use Illuminate\Http\Request;
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
        $characters = $account->characters();

        return view('home', [
          'realms' => $realms,
          'characters' => $characters
        ]);
    }
}
