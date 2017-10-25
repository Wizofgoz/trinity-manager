<?php

namespace App\Helpers;

class ItemQuality
{
    /**
     * Mapping of Quality IDs to colors and descriptions
     *
     * @var array
     */
    const QUALITY_MAP = [
        0 => [
            'color' => 'grey',
            'description' => 'Poor'
        ],
        1 => [
            'color' => 'white',
            'description' => 'Common'
        ],
        2 => [
            'color' => 'green',
            'description' => 'Uncommon'
        ],
        3 => [
            'color' => 'blue',
            'description' => 'Rare'
        ],
        4 => [
            'color' => 'purple',
            'description' => 'Epic'
        ],
        5 => [
            'color' => 'orange',
            'description' => 'Legendary'
        ],
        6 => [
            'color' => 'red',
            'description' => 'Artifact'
        ],
        7 => [
            'color' => 'gold',
            'description' => 'Heirloom'
        ]
    ];

    /**
     * ID of the level of the Quality
     *
     * @var int
     */
    private $qualityID;

    /**
     * ItemQuality constructor.
     *
     * @param int $qualityID
     */
    public function __construct(int $qualityID)
    {
        $this->qualityID = $qualityID;
    }

    /**
     * Returns the ID of the level of the Quality
     *
     * @return int
     */
    public function getQualityID()
    {
        return $this->qualityID;
    }

    /**
     * Returns the color of the Quality
     *
     * @return string
     */
    public function getColor()
    {
        return self::QUALITY_MAP[$this->qualityID]['color'];
    }

    /**
     * Returns the description of the Quality
     *
     * @return string
     */
    public function getDescription()
    {
        return self::QUALITY_MAP[$this->qualityID]['description'];
    }
}