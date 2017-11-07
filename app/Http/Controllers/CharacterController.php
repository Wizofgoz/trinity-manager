<?php
/**
 * Created by IntelliJ IDEA.
 * User: mac
 * Date: 10/18/17
 * Time: 4:57 PM.
 */

namespace App\Http\Controllers;

class CharacterController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('character');
    }
}
