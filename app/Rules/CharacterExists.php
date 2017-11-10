<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;

class CharacterExists implements Rule
{
    protected $requestData;

    /**
     * Create a new rule instance.
     *
     * @param array $requestData
     */
    public function __construct(array $requestData = [])
    {
        $this->requestData = $requestData;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        if ($attribute == 'closedBy' && ($value == 0 || $value == -1)) {
            return true;
        }

        try {
            DB::connection("characters{$this->requestData['realm']}.characters")->where('guid', $value)->firstOrFail();
        } catch (ModelNotFoundException $exception) {
            return false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'The character you selected does not exist.';
    }
}
