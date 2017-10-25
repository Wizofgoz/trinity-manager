<section class="card">
    <h4 class="card-title">{{$character->name}}<span></span></h4>
    <h6 class="card-subtitle mb-2 text-muted">Level {{$character->level}}</h6>
    <p class="card-text">{{$character->race()}}</p>
    <p class="card-text">{{$character->class()}}</p>
    <div class="card-footer">
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="{{$character->xp}}"
                 aria-valuemin="0" aria-valuemax="{{$character->xpToLevel()}}">
                {{$character->xp}}/{{$character->xpToLevel()}}
            </div>
        </div>
    </div>
</section>