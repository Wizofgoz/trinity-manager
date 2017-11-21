<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Pivot;

class InventoryItem extends Pivot
{
    /**
     * Constant that when bag attribute is equal to this, it is equipped somehow.
     *
     * @var int
     */
    const INVENTORY_EQUIPPED = 0;

    /**
     * Mapping of equipment slots to names.
     *
     * @var array
     */
    const SLOT_TYPES_EQUIPPED = [
        'Head'      => 0,
        'Neck'      => 1,
        'Shoulders' => 2,
        'Body'      => 3,
        'Chest'     => 4,
        'Waist'     => 5,
        'Legs'      => 6,
        'Feet'      => 7,
        'Wrists'    => 8,
        'Hands'     => 9,
        'Finger1'   => 10,
        'Finger2'   => 11,
        'Trinket1'  => 12,
        'Trinket2'  => 13,
        'Back'      => 14,
        'Main-Hand' => 15,
        'Off-Hand'  => 16,
        'Ranged'    => 17,
        'Tabard'    => 18,
    ];

    const SLOT_TYPES_EQUIPPED_BAGS = [19, 20, 21, 22];

    const SLOT_TYPES_MAIN_BACKPACK = [23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38];

    const SLOT_TYPES_MAIN_BANK = [39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66];

    const SLOT_TYPES_BANK_BAGS = [67, 68, 69, 70, 71, 72, 73];

    const SLOT_TYPES_KEYRING = [86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117];

    const SLOT_TYPES_CURRENCIES = [118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135];

    /**
     * InventoryItem constructor.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

    /**
     * Defines relation between the Inventory Item and an Item Instance.
     *
     * @return Builder
     */
    public function itemInstance()
    {
        return $this->belongsTo(ItemInstance::class, 'item', 'guid');
    }

    /**
     * Defines relation between the Inventory Item and the Item Instance of the bag it is placed in.
     *
     * @return Builder|null
     */
    public function bagInstance()
    {
        if ($this->bag == 0) {
            return null;
        }

        return $this->belongsTo(ItemInstance::class, 'bag', 'guid');
    }
}
