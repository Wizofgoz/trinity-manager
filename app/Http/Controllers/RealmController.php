<?php

namespace App\Http\Controllers;

use App\Models\Realm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class RealmController extends Controller
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

    /**
     * List of all realms.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $realms = Realm::all();

        return view('realm.index', ['realms' => $realms]);
    }

    /**
     * Info view of single realm.
     *
     * @param Realm $realm
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Realm $realm)
    {
        $this->authorize('view', $realm);

        return view('realm.show', ['realm' => $realm]);
    }

    /**
     * Show edit form for single realm.
     *
     * @param Realm $realm
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Realm $realm)
    {
        $this->authorize('update', $realm);

        return view('realm.edit', ['realm' => $realm]);
    }

    /**
     * Perform update on a single realm.
     *
     * @param Request $request
     * @param Realm   $realm
     */
    public function update(Request $request, Realm $realm)
    {
        $this->authorize('update', $realm);

        $this->validator($request->all())->validate();

        $this->updateModel($request, $realm);

        $realm->save();

        session()->flash('status', 'Realm updated');
    }

    /**
     * Show create form for a single realm.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        $this->authorize('create', Realm::class);

        return view('realm.create');
    }

    /**
     * Perform create for a single realm.
     *
     * @param Request $request
     */
    public function store(Request $request)
    {
        $this->authorize('create', Realm::class);

        $this->validator($request->all())->validate();

        $realm = new Realm();
        $this->updateModel($request, $realm);

        $realm->save();

        session()->flash('status', 'Realm created');
    }

    /**
     * Perform delete on a single realm.
     *
     * @param Request $request
     * @param Realm   $realm
     *
     * @throws ValidationException
     */
    public function destroy(Request $request, Realm $realm)
    {
        $this->authorize('delete', $realm);

        if (!$request->has('confirmed') || $request->confirmed == 0) {
            throw ValidationException::withMessages(['confirmed' => 'You must confirm that you want to delete this.']);
        }

        $realm->delete();
    }

    /**
     * Update a given realm model with data from the given request.
     *
     * @param Request $request
     * @param Realm   $realm
     */
    protected function updateModel(Request $request, Realm $realm)
    {
        $realm->name = $request->name;
        $realm->address = $request->address;
        $realm->localAddress = $request->localAddress;
        $realm->port = $request->port;
        $realm->icon = $request->icon;
        $realm->flag = $request->flag;
        $realm->timezone = $request->timezone;
        $realm->allowedSecurityLevel = $request->allowedSecurityLevel;
        $realm->gamebuild = $request->gamebuild;
    }

    /**
     * Get validator for realm.
     *
     * @param array $data
     *
     * @return mixed
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name'         => 'required|string|min:4|max:32',
            'address'      => 'string|min:1|max:255',
            'localAddress' => 'ip',
            'port'         => 'numeric|min:1|max:65536',
            'icon'         => [
                'numeric',
                Rule::in(array_keys(Realm::ICON_MAP)),
            ],
            'flag' => [
                'numeric',
                Rule::in(array_keys(Realm::FLAG_MAP)),
            ],
            'timezone' => [
                'numeric',
                Rule::in(array_keys(Realm::TIMEZONE_MAP)),
            ],
            'allowedSecurityLevel' => 'numeric|min:0|max:3',
            'gamebuild'            => [
                'numeric',
                Rule::in(array_keys(Realm::BUILD_MAP)),
            ],
        ]);
    }
}
