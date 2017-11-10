<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Realm extends Model
{
    /**
     * Mapping of server Flag IDs to Descriptions.
     */
    const FLAG_MAP = [
        0   => 'None',
        1   => 'Invalid',
        2   => 'Offline',
        4   => 'Specify Build',
        8   => 'Medium',
        16  => 'Medium',
        32  => 'New Players',
        64  => 'Recommended',
        128 => 'Full',
    ];

    /**
     * Mapping of server Icon IDs to Descriptions.
     */
    const ICON_MAP = [
        0 => 'Normal',
        1 => 'PvP',
        4 => 'Normal',
        6 => 'RP',
        8 => 'RP PvP',
    ];

    /**
     * Mapping of server Timezone IDs to Descriptions.
     */
    const TIMEZONE_MAP = [
        1  => 'Development',
        2  => 'United States',
        3  => 'Oceanic',
        4  => 'Latin America',
        5  => 'Tournament',
        6  => 'Korea',
        7  => 'Tournament',
        8  => 'English',
        9  => 'German',
        10 => 'French',
        11 => 'Spanish',
        12 => 'Russian',
        13 => 'Tournament',
        14 => 'Taiwan',
        15 => 'Tournament',
        16 => 'China',
        17 => 'CN1',
        18 => 'CN2',
        19 => 'CN3',
        20 => 'CN4',
        21 => 'CN5',
        22 => 'CN6',
        23 => 'CN7',
        24 => 'CN8',
        25 => 'Tournament',
        26 => 'Test Server',
        27 => 'Tournament',
        29 => 'CN9',
        30 => 'Test Server 2',
        31 => 'CN10',
        32 => 'CTC',
        33 => 'CNC',
        34 => 'CN1/4',
        35 => 'CN/2/6/9',
        36 => 'CN3/7',
        37 => 'Russian Tournament',
        38 => 'CN5/8',
        39 => 'CN11',
        40 => 'CN12',
        41 => 'CN13',
        42 => 'CN14',
        43 => 'CN15',
        44 => 'CN16',
        45 => 'CN17',
        46 => 'CN18',
        47 => 'CN19',
        48 => 'CN20',
        49 => 'Brazil',
        50 => 'Italian',
        51 => 'Hyrule',
        52 => 'QA2 Test',
        53 => '',
        54 => '',
        55 => 'Recommended Realm',
        56 => 'Test',
        57 => 'Recommended Realm',
        58 => '',
        59 => 'Future Test',
    ];

    /**
     * Mapping of client Build IDs to Descriptions.
     */
    const BUILD_MAP = [
        5875  => '1.12.1',
        6005  => '1.12.2',
        8606  => '2.4.3',
        9947  => '3.1.3',
        10146 => '3.2.0',
        10505 => '3.2.2a',
        11159 => '3.3.0a',
        11403 => '3.3.2',
        11623 => '3.3.3',
        11723 => '3.3.3a',
        12340 => '3.3.5a',
    ];

    /**
     * Connection that the model uses.
     *
     * @var string
     */
    protected $connection = 'auth';

    /**
     * Table that the model resides in.
     *
     * @var string
     */
    protected $table = 'realmlist';

    /**
     * Whether or not the model contains standard timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Text description of what flag the realm has.
     *
     * @return string
     */
    public function flagDescription()
    {
        return self::FLAG_MAP[$this->flag];
    }

    /**
     * Text description of what icon the realm has.
     *
     * @return string
     */
    public function iconDescription()
    {
        return self::ICON_MAP[$this->icon];
    }

    /**
     * Text description of what time zone the realm operates in.
     *
     * @return string
     */
    public function timezoneDescription()
    {
        return self::TIMEZONE_MAP[$this->timezone];
    }

    /**
     * Semantic version string of the client the realm supports.
     *
     * @return mixed
     */
    public function buildVersion()
    {
        return self::BUILD_MAP[$this->gamebuild];
    }

    /**
     * Returns the uptime model for the realm.
     *
     * @return Builder
     */
    public function uptime()
    {
        return $this->hasOne('App\Models\Uptime', 'realmid');
    }
}
