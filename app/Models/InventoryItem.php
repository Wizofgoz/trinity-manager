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

    /**
     * InventoryItem constructor.
     *
     * @param array $attributes
     */
    public function __construct(array $attributes = [])
    {
        define('SLOT_TYPES_EQUIPPED_BAGS', range(19, 22));
        define('SLOT_TYPES_MAIN_BACKPACK', range(23, 38));
        define('SLOT_TYPES_MAIN_BANK', range(39, 66));
        define('SLOT_TYPES_BANK_BAGS', range(67, 73));
        define('SLOT_TYPES_KEYRING', range(86, 117));
        define('SLOT_TYPES_CURRENCIES', range(118, 135));
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
            return;
        }

        return $this->belongsTo(ItemInstance::class, 'bag', 'guid');
    }
}
