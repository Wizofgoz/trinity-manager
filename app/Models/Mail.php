<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use \Illuminate\Database\Eloquent\Builder;

class Mail extends Model
{
    /**
     * Mapping of mail types to descriptions
     *
     * @var array
     */
    const TYPES_MAP = [
        0 => 'Normal',
        2 => 'Auction',
        3 => 'Creature',
        4 => 'Game Object',
        5 => 'Item'
    ];

    const CHECK_MASK_NONE = 0x00;
    const CHECK_MASK_READ = 0x01;
    const CHECK_MASK_RETURNED = 0x02;
    const CHECK_MASK_COPIED = 0x04;
    const CHECK_MASK_COD_PAYMENT = 0x08;
    const CHECK_MASK_HAS_BODY = 0x10;

    /**
     * DB connection this model uses
     *
     * @var string
     */
    protected $connection = 'characters';

    /**
     * DB table this model uses
     *
     * @var string
     */
    protected $table = 'mail';

    /**
     * Whether the table contains standard timestamp fields
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Whether the mail has items attached to it
     *
     * @return bool
     */
    public function hasItems()
    {
        return $this->has_items == 1;
    }

    /**
     * Whether the mail requires the specified money to be paid to receive the attached items
     *
     * @return bool
     */
    public function requiresCashOnDelivery()
    {
        return $this->cod == 1;
    }

    /**
     * Whether the mail has been read yet
     *
     * @return bool
     */
    public function isRead()
    {
        return $this->checked & self::CHECK_MASK_READ;
    }

    /**
     * Whether the mail has been returned
     *
     * @return bool
     */
    public function isReturned()
    {
        return $this->checked & self::CHECK_MASK_RETURNED;
    }

    /**
     * Whether the mail has been copied (Items can't be copied)
     *
     * @return bool
     */
    public function isCopied()
    {
        return $this->checked & self::CHECK_MASK_COPIED;
    }

    /**
     * Whether the money included in the mail is for a COD payment
     *
     * @return bool
     */
    public function isCODPayment()
    {
        return $this->checked & self::CHECK_MASK_COD_PAYMENT;
    }

    /**
     * Whether the mail has body text
     *
     * @return bool
     */
    public function hasBodyText()
    {
        return $this->checked & self::CHECK_MASK_HAS_BODY;
    }

    /**
     * Defines relation between the Mail and the Character that sent it
     *
     * @return Builder
     */
    public function sender()
    {
        return $this->belongsTo(Character::class, 'sender', 'guid');
    }

    /**
     * Defines relation between the Mail and the Character that received it
     *
     * @return Builder
     */
    public function receiver()
    {
        return $this->belongsTo(Character::class, 'receiver', 'guid');
    }

    /**
     * Defines relation between the Mail and any items that were attached to it
     *
     * @return Builder
     */
    public function items()
    {
        return $this->belongsToMany(ItemInstance::class, 'mail_items', 'mail_id', 'item_guid', 'id', 'guid');
    }
}