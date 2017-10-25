<section class="card">
    <h4 class="card-title">{{$realm->name}}<span></span></h4>
    <h6 class="card-subtitle mb-2 text-muted">{{$realm->address}}</h6>
    <p class="card-text">{{$realm->buildVersion()}}</p>
    <p class="card-text">{{$realm->numchars}}</p>
    <div class="card-footer text-muted">{{$realm->flagDescription()}}</div>
</section>