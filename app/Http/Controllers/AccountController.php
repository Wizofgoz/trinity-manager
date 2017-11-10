<?php

namespace App\Http\Controllers;

use App\Extensions\SHA1Hasher;
use App\Notifications\EmailUpdated;
use App\Notifications\PasswordUpdated;
use App\User;
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
     * Show general account information.
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
     * Store the changes in the database.
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
            $user->email_verified = false;
            $user->notify(new EmailUpdated($user));
        }

        if (!is_null($request->password)) {
            $user->{$user->getAuthPassword()} = $this->hasher->make($user->username.':'.$request->password);
            $user->notify(new PasswordUpdated($user));
        }

        $user->save();

        $request->session()->flash('status', 'Account updated');
    }

    /**
     * Mark the user's email as validated.
     *
     * @param Request $request
     *
     * @throws ValidationException
     */
    public function verifyEmail(Request $request)
    {
        $this->emailValidator($request->all())->validate();

        $user = User::where('email_verification_token', '=', $request->token)->firstOrFail();

        if (!Auth::guard()->attempt([
          'username' => $user->username,
          'password' => $request->password,
        ])) {
            throw ValidationException::withMessages(['password' => [trans('auth.failed')]]);
        }

        $user->email_verified = true;
        $user->save();

        session()->flash('status', 'Email verified');
    }

    /**
     * Get a validator for an incoming update request.
     *
     * @param array $data
     *
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email'    => 'required|string|email|max:255|unique:auth.account',
            'password' => 'nullable|string|min:6|confirmed',
        ]);
    }

    /**
     * Get a validator for an incoming verify email request.
     *
     * @param array $data
     *
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function emailValidator(array $data)
    {
        return Validator::make($data, [
            'token'    => 'required|string|exists:auth.account,email_verification_token',
            'password' => 'required|string|min:6',
        ]);
    }
}
