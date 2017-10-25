<section class="card">
    <h4 class="card-title">
        {{$mail->subject}}
        <span class="float-right">
            @if (!$mail->isRead())
                <span class="badge-info">New</span>
            @endif
            @if ($mail->requiresCashOnDelivery)
                <span class="badge-info">Requires Payment</span>
            @endif
        </span>
    </h4>
    <h6 class="card-subtitle mb-2 text-muted">
        @if ($mail->sender()->guid == $character->guid)
            To: {{$mail->receiver()->name}}
        @else
            From: {{$mail->sender()->name}}
        @endif
    </h6>
    <p class="card-text">{{$character->race()}}</p>
    <p class="card-text">{{$character->class()}}</p>
    <div class="card-footer">
        Sent {{}} ago
    </div>
</section>