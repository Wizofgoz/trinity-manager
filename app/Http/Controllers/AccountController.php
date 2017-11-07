<?php

namespace App\Http\Controllers;

use App\Events\Account\UpdatedEmail;
use App\Events\Account\UpdatedPassword;
use App\Extensions\SHA1Hasher;
use App\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class AccountController extends Controller
{
    private $hasher;

    /**
     * Create a new controller instance.
     *
     * @param $hasher SHA1Hasher
     */
    public function __construct(SHA1Hasher $hasher)
    {
        $this->hasher = $hasher;
    }

    /**
     * Show general account information
     *
     * @param $request Request
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return view('account.profile', ['account' => $request->user()]);
    }

    /**
     * Store the changes in the database
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validator($request->all())->validate();

        $user = $request->user();
        if ($user->email !== $request->email) {
            $user->email = $request->email;
            event(new UpdatedEmail($user));
        }

        if (!is_null($request->password)) {
            $user->{$user->getAuthPassword()} = $this->hasher->make($user->username . ':' . $request->password);
            event(new UpdatedPassword($user));
        }

        $request->session()->flash('status', 'Account updated');
    }

    public function verifyEmail(Request $request)
    {
        $this->emailValidator($request->all());

        $user = User::where('email_verification_token', '=', $request->token)->firstOrFail();

        if (!Auth::guard()->attempt([
          'username' => $user->username,
          'password' => $request->password
        ])) {
            throw ValidationException::withMessages(['password' => [trans('auth.failed')]]);
        }

        $user->email_verified = true;
        $user->save();

        session()->flash('status', 'Email verified');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email' => 'required|string|email|max:255|unique:auth.account',
            'password' => 'nullable|string|min:6|confirmed',
        ]);
    }

    protected function emailValidator(array $data)
    {
        return Validator::make($data, [
            'token' => 'required|string|exists:auth.account,email_verification_token',
            'password' => 'required|string|min:6'
        ]);
    }
}
