<?php

namespace App\Helpers;

class ItemClass
{
    /**
     * Mapping of Item Classes to names
     *
     * @var array
     */
    const CLASS_MAP = [
      0 => 'Consumable',
      1 => 'Container',
      2 => 'Weapon',
      3 => 'Gem',
      4 => 'Armor',
      5 => 'Reagent',
      6 => 'Projectile',
      7 => 'Trade Goods',
      8 => 'Generic',
      9 => 'Recipe',
      10 => 'Money',
      11 => 'Quiver',
      12 => 'Quest',
      13 => 'Key',
      14 => 'Permanent',
      15 => 'Miscellaneous',
      16 => 'Glyph'
    ];

    /**
     * Mapping of Item Classes and Sub Classes to names and comments
     *
     * @var array
     */
    const SUBCLASS_MAP = [
        0 => [
            0 => [
                'name' => 'Consumable',
                'comments' => 'Usability in combat is decided by the spell assigned.',
            ],
            1 => ['name' => 'Potion'],
            2 => ['name' => 'Elixir'],
            3 => ['name' => 'Flask'],
            4 => ['name' => 'Scroll'],
            5 => ['name' => 'Food & Drink'],
            6 => ['name' => 'Item Enhancement'],
            7 => ['name' => 'Bandage'],
            8 => ['name' => 'Other']
        ],
        1 => [
            0 => ['name' => 'Bag'],
            1 => ['name' => 'Soul Bag'],
            2 => ['name' => 'Herb Bag'],
            3 => ['name' => 'Enchanting Bag'],
            4 => ['name' => 'Engineering Bag'],
            5 => ['name' => 'Gem Bag'],
            6 => ['name' => 'Mining Bag'],
            7 => ['name' => 'Leatherworking Bag'],
            8 => ['name' => 'Inscription Bag']
        ],
        2 => [
            0 => [
                'name' => 'Axe',
                'comments' => 'One handed'
            ],
            1 => [
              'name' => 'Axe',
              'comments' => 'Two handed'
            ],
            2 => ['name' => 'Bow'],
            3 => ['name' => 'Gun'],
            4 => [
                'name' => 'Mace',
                'comments' => 'One handed'
            ],
            5 => [
              'name' => 'Mace',
              'comments' => 'Two handed'
            ],
            6 => ['name' => 'Polearm'],
            7 => [
              'name' => 'Sword',
              'comments' => 'One handed'
            ],
            8 => [
              'name' => 'Sword',
              'comments' => 'Two handed'
            ],
            9 => ['name' => 'Obsolete'],
            10 => ['name' => 'Staff'],
            11 => ['name' => 'Exotic'],
            12 => ['name' => 'Exotic'],
            13 => ['name' => 'Fist Weapon'],
            14 => [
              'name' => 'Miscellaneous',
              'comments' => '(Blacksmith Hammer, Mining Pick, etc.)'
            ],
            15 => ['name' => 'Dagger'],
            16 => ['name' => 'Thrown'],
            17 => ['name' => 'Spear'],
            18 => ['name' => 'Crossbow'],
            19 => ['name' => 'Wand'],
            20 => ['name' => 'Fishing Pole']
        ],
        3 => [
            0 => ['name' => 'Red'],
            1 => ['name' => 'Blue'],
            2 => ['name' => 'Yellow'],
            3 => ['name' => 'Purple'],
            4 => ['name' => 'Green'],
            5 => ['name' => 'Orange'],
            6 => ['name' => 'Meta'],
            7 => ['name' => 'Simple'],
            8 => ['name' => 'Prismatic']
        ],
        4 => [
            0 => ['name' => 'Miscellaneous'],
            1 => ['name' => 'Cloth'],
            2 => ['name' => 'Leather'],
            3 => ['name' => 'Mail'],
            4 => ['name' => 'Plate'],
            5 => ['name' => 'Buckler'],
            6 => ['name' => 'Shield'],
            7 => ['name' => 'Libram'],
            8 => ['name' => 'Idol'],
            9 => ['name' => 'Totem'],
            10 => ['name' => 'Sigil']
        ],
        5 => [
            0 => ['name' => 'Reagent']
        ],
        6 => [
            0 => ['name' => 'Wand'],
            1 => ['name' => 'Bolt'],
            2 => ['name' => 'Arrow'],
            3 => ['name' => 'Bullet'],
            4 => ['name' => 'Thrown']
        ],
        7 => [
            0 => ['name' => 'Trade Goods'],
            1 => ['name' => 'Parts'],
            2 => ['name' => 'Explosives'],
            3 => ['name' => 'Devices'],
            4 => ['name' => 'Jewelcrafting'],
            5 => ['name' => 'Cloth'],
            6 => ['name' => 'Leather'],
            7 => ['name' => 'Metal & Stone'],
            8 => ['name' => 'Meat'],
            9 => ['name' => 'Herb'],
            10 => ['name' => 'Elemental'],
            11 => ['name' => 'Other'],
            12 => ['name' => 'Enchanting'],
            13 => ['name' => 'Materials'],
            14 => ['name' => 'Armor Enhancement'],
            15 => ['name' => 'Weapon Enhancement']
        ],
        8 => [
            0 => ['name' => 'Generic']
        ],
        9 => [
            0 => ['name' => 'Book'],
            1 => ['name' => 'Leatherworking'],
            2 => ['name' => 'Tailoring'],
            3 => ['name' => 'Engineering'],
            4 => ['name' => 'Blacksmithing'],
            5 => ['name' => 'Cooking'],
            6 => ['name' => 'Alchemy'],
            7 => ['name' => 'First Aid'],
            8 => ['name' => 'Enchanting'],
            9 => ['name' => 'Fishing'],
            10 => ['name' => 'Jewelcrafting']
        ],
        10 => [
            0 => ['name' => 'Money']
        ],
        11 => [
            0 => ['name' => 'Quiver'],
            1 => ['name' => 'Quiver'],
            2 => [
                'name' => 'Quiver',
                'comments' => 'Can hold arrows'
            ],
            3 => [
                'name' => 'Ammo Pouch',
                'comments' => 'Can hold bullets'
            ]
        ],
        12 => [
            0 => ['name' => 'Quest']
        ],
        13 => [
            0 => ['name' => 'Key'],
            1 => ['name' => 'Lockpick']
        ],
        14 => [
            0 => ['name' => 'Permanent']
        ],
        15 => [
            0 => ['name' => 'Junk'],
            1 => ['name' => 'Reagent'],
            2 => ['name' => 'Pet'],
            3 => ['name' => 'Holiday'],
            4 => ['name' => 'Other'],
            5 => ['name' => 'Mount']
        ],
        16 => [
          1 => ['name' => 'Warrior'],
          2 => ['name' => 'Paladin'],
          3 => ['name' => 'Hunter'],
          4 => ['name' => 'Rogue'],
          5 => ['name' => 'Priest'],
          6 => ['name' => 'Death Knight'],
          7 => ['name' => 'Shaman'],
          8 => ['name' => 'Mage'],
          9 => ['name' => 'Warlock'],
          11 => ['name' => 'Druid']
        ]
    ];

    /**
     * Class ID
     *
     * @var int
     */
    private $class;

    /**
     * Sub Class ID
     *
     * @var int
     */
    private $subclass;

    /**
     * ItemClass constructor.
     *
     * @param int $class
     * @param int $subclass
     */
    public function __construct(int $class, int $subclass)
    {
        $this->class = $class;
        $this->subclass = $subclass;
    }

    /**
     * Return the Class ID
     *
     * @return int
     */
    public function getClass()
    {
        return $this->class;
    }

    /**
     * Return the Sub Class ID
     *
     * @return int
     */
    public function getSubClass()
    {
        return $this->subclass;
    }

    /**
     * Return the name of the class
     *
     * @return string
     */
    public function getClassName()
    {
        return self::CLASS_MAP[$this->class];
    }

    /**
     * Return the name of the Sub Class
     *
     * @return string
     */
    public function getSubClassName()
    {
        return self::SUBCLASS_MAP[$this->class][$this->subclass]['name'];
    }

    /**
     * Return whether the Class has a comment
     *
     * @return bool
     */
    public function hasComment()
    {
        return isset(self::SUBCLASS_MAP[$this->class][$this->subclass]['comments']);
    }

    /**
     * Return the comment on the Class
     *
     * @return string
     */
    public function getComment()
    {
        if (!$this->hasComment()) {
            return '';
        }

        return self::SUBCLASS_MAP[$this->class][$this->subclass]['comments'];
    }
}