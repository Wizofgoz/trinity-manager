<?php

namespace App\Extensions;

use Illuminate\Contracts\Hashing\Hasher as HasherContract;
use Illuminate\Support\Str;
use RuntimeException;

class SHA1Hasher implements HasherContract
{
    /**
     * Hash the given value.
     *
     * @param string $value
     * @param array  $options
     *
     * @throws RuntimeException
     *
     * @return string
     */
    public function make($value, array $options = [])
    {
        return Str::upper(sha1(Str::upper($value)));
    }

    /**
     * Check the given plain value against a hash.
     *
     * @param string $value
     * @param string $hashedValue
     * @param array  $options
     *
     * @return bool
     */
    public function check($value, $hashedValue, array $options = [])
    {
        if (strlen($hashedValue) === 0) {
            return false;
        }

        return hash_equals($this->make($value), $hashedValue);
    }

    /**
     * Check if the given hash has been hashed using the given options.
     *
     * @param string $hashedValue
     * @param array  $options
     *
     * @return bool
     */
    public function needsRehash($hashedValue, array $options = [])
    {
        return false;
    }
}
