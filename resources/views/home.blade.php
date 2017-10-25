@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                </div>
            </div>
        </div>
    </div>
    <h3>Realms</h3>
    <div class="row">
        @foreach ($realms as $realm)
            <div class="col-sm-4">
                @include('components.realm.card', ['realm' => $realm])
            </div>
        @endforeach
    </div>
    <h3>Characters</h3>
    <div class="row">
        @foreach ($characters as $character)
            <div class="col-sm-6">
                @include('components.character.card', ['character' => $character])
            </div>
        @endforeach
    </div>
</div>
@endsection
