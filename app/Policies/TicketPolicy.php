<?php

namespace App\Policies;

use App\Models\Ticket;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class TicketPolicy
{
    use HandlesAuthorization;

    public function before(User $user, $ability)
    {
        if ($user->isAdmin()) {
            return true;
        }
    }

    /**
     * Determine whether the user can view the ticket.
     *
     * @param \App\User          $user
     * @param \App\Models\Ticket $ticket
     *
     * @return mixed
     */
    public function view(User $user, Ticket $ticket)
    {
        return true;
    }

    /**
     * Determine whether the user can create tickets.
     *
     * @param \App\User $user
     *
     * @return mixed
     */
    public function create(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can update the ticket.
     *
     * @param \App\User          $user
     * @param \App\Models\Ticket $ticket
     *
     * @return mixed
     */
    public function update(User $user, Ticket $ticket)
    {
        if ($user->isGM()) {
            return true;
        }

        $ticketUser = $ticket->creator()->account();

        return $user->id === $ticketUser->id;
    }

    /**
     * Determine whether the user can delete the ticket.
     *
     * @param \App\User          $user
     * @param \App\Models\Ticket $ticket
     *
     * @return mixed
     */
    public function delete(User $user, Ticket $ticket)
    {
        $ticketUser = $ticket->creator()->account();

        return $user->id === $ticketUser->id;
    }
}
