-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2017 at 11:17 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.1.11-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `characters`
--
CREATE DATABASE IF NOT EXISTS `characters` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `characters`;

-- --------------------------------------------------------

--
-- Table structure for table `account_data`
--

CREATE TABLE `account_data` (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_instance_times`
--

CREATE TABLE `account_instance_times` (
  `accountId` int(10) UNSIGNED NOT NULL,
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `releaseTime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_tutorial`
--

CREATE TABLE `account_tutorial` (
  `accountId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tut7` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `name` varchar(120) NOT NULL DEFAULT '',
  `crc` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Addons';

-- --------------------------------------------------------

--
-- Table structure for table `arena_team`
--

CREATE TABLE `arena_team` (
  `arenaTeamId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `captainGuid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rating` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `weekGames` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `weekWins` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `backgroundColor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `emblemStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `emblemColor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `borderStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `borderColor` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `arena_team_member`
--

CREATE TABLE `arena_team_member` (
  `arenaTeamId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `weekGames` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `weekWins` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `personalRating` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auctionhouse`
--

CREATE TABLE `auctionhouse` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `houseid` tinyint(3) UNSIGNED NOT NULL DEFAULT '7',
  `itemguid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemowner` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `buyoutprice` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `buyguid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastbid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `startbid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deposit` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banned_addons`
--

CREATE TABLE `banned_addons` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Version` varchar(255) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `battleground_deserters`
--

CREATE TABLE `battleground_deserters` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'characters.guid',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT 'type of the desertion',
  `datetime` datetime NOT NULL COMMENT 'datetime of the desertion'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bugreport`
--

CREATE TABLE `bugreport` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Debug System';

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `creator` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '4',
  `dungeon` int(10) NOT NULL DEFAULT '-1',
  `eventtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time2` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_invites`
--

CREATE TABLE `calendar_invites` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `event` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `invitee` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `statustime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `name` varchar(128) NOT NULL,
  `team` int(10) UNSIGNED NOT NULL,
  `announce` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `ownership` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `password` varchar(32) DEFAULT NULL,
  `bannedList` text,
  `lastUsed` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Channel System';

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `xp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `money` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `face` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `hairStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `hairColor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `facialStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `bankSlots` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `restState` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `playerFlags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `instance_mode_mask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text NOT NULL,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `totaltime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `leveltime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `logout_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resettalents_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `extra_flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `stable_slots` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `at_login` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `zone` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `death_expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `totalHonorPoints` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `todayHonorPoints` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `totalKills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `todayKills` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `chosenTitle` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `knownCurrencies` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `watchedFaction` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `drunk` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `health` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `power7` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `latency` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `talentGroupsCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `activeTalentGroup` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `ammoId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `knownTitles` longtext,
  `actionBars` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `grantableLevels` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(10) UNSIGNED DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_account_data`
--

CREATE TABLE `character_account_data` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_achievement`
--

CREATE TABLE `character_achievement` (
  `guid` int(10) UNSIGNED NOT NULL,
  `achievement` smallint(5) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_achievement_progress`
--

CREATE TABLE `character_achievement_progress` (
  `guid` int(10) UNSIGNED NOT NULL,
  `criteria` smallint(5) UNSIGNED NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_action`
--

CREATE TABLE `character_action` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spec` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `button` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_arena_stats`
--

CREATE TABLE `character_arena_stats` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `matchMakerRating` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_aura`
--

CREATE TABLE `character_aura` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `effectMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `recalculateMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stackCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `amount0` int(11) NOT NULL DEFAULT '0',
  `amount1` int(11) NOT NULL DEFAULT '0',
  `amount2` int(11) NOT NULL DEFAULT '0',
  `base_amount0` int(11) NOT NULL DEFAULT '0',
  `base_amount1` int(11) NOT NULL DEFAULT '0',
  `base_amount2` int(11) NOT NULL DEFAULT '0',
  `maxDuration` int(11) NOT NULL DEFAULT '0',
  `remainTime` int(11) NOT NULL DEFAULT '0',
  `remainCharges` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_banned`
--

CREATE TABLE `character_banned` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- --------------------------------------------------------

--
-- Table structure for table `character_battleground_data`
--

CREATE TABLE `character_battleground_data` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instanceId` int(10) UNSIGNED NOT NULL COMMENT 'Instance Identifier',
  `team` smallint(5) UNSIGNED NOT NULL,
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiStart` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `taxiEnd` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mountSpell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_battleground_random`
--

CREATE TABLE `character_battleground_random` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_declinedname`
--

CREATE TABLE `character_declinedname` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_equipmentsets`
--

CREATE TABLE `character_equipmentsets` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `setguid` bigint(20) UNSIGNED NOT NULL,
  `setindex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(31) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `ignore_mask` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item0` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item1` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item2` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item3` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item4` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item5` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item6` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item7` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item8` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item9` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item10` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item11` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item12` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item13` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item14` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item15` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item16` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item17` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `item18` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_fishingsteps`
--

CREATE TABLE `character_fishingsteps` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `fishingSteps` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_gifts`
--

CREATE TABLE `character_gifts` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `entry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_glyphs`
--

CREATE TABLE `character_glyphs` (
  `guid` int(10) UNSIGNED NOT NULL,
  `talentGroup` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `glyph1` smallint(5) UNSIGNED DEFAULT '0',
  `glyph2` smallint(5) UNSIGNED DEFAULT '0',
  `glyph3` smallint(5) UNSIGNED DEFAULT '0',
  `glyph4` smallint(5) UNSIGNED DEFAULT '0',
  `glyph5` smallint(5) UNSIGNED DEFAULT '0',
  `glyph6` smallint(5) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_homebind`
--

CREATE TABLE `character_homebind` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_instance`
--

CREATE TABLE `character_instance` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `instance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `extendState` tinyint(2) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_inventory`
--

CREATE TABLE `character_inventory` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `item` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_pet`
--

CREATE TABLE `character_pet` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `entry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modelid` int(10) UNSIGNED DEFAULT '0',
  `CreatedBySpell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `PetType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `level` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `exp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Reactstate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(21) NOT NULL DEFAULT 'Pet',
  `renamed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `curhealth` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `curmana` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `curhappiness` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `savetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `abdata` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `character_pet_declinedname`
--

CREATE TABLE `character_pet_declinedname` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus`
--

CREATE TABLE `character_queststatus` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `explored` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `timer` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobcount1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `mobcount2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `mobcount3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `mobcount4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `itemcount1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `itemcount2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `itemcount3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `itemcount4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `playercount` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_daily`
--

CREATE TABLE `character_queststatus_daily` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_monthly`
--

CREATE TABLE `character_queststatus_monthly` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_rewarded`
--

CREATE TABLE `character_queststatus_rewarded` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `active` tinyint(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_seasonal`
--

CREATE TABLE `character_queststatus_seasonal` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_weekly`
--

CREATE TABLE `character_queststatus_weekly` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_reputation`
--

CREATE TABLE `character_reputation` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_skills`
--

CREATE TABLE `character_skills` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint(5) UNSIGNED NOT NULL,
  `value` smallint(5) UNSIGNED NOT NULL,
  `max` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_social`
--

CREATE TABLE `character_social` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_spell`
--

CREATE TABLE `character_spell` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_spell_cooldown`
--

CREATE TABLE `character_spell_cooldown` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `categoryId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_stats`
--

CREATE TABLE `character_stats` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxpower7` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `strength` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `agility` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `stamina` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `intellect` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spirit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `armor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resHoly` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resFire` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resNature` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resFrost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resShadow` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resArcane` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `blockPct` float UNSIGNED NOT NULL DEFAULT '0',
  `dodgePct` float UNSIGNED NOT NULL DEFAULT '0',
  `parryPct` float UNSIGNED NOT NULL DEFAULT '0',
  `critPct` float UNSIGNED NOT NULL DEFAULT '0',
  `rangedCritPct` float UNSIGNED NOT NULL DEFAULT '0',
  `spellCritPct` float UNSIGNED NOT NULL DEFAULT '0',
  `attackPower` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spellPower` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resilience` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_talent`
--

CREATE TABLE `character_talent` (
  `guid` int(10) UNSIGNED NOT NULL,
  `spell` mediumint(8) UNSIGNED NOT NULL,
  `talentGroup` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `corpse`
--

CREATE TABLE `corpse` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `displayId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemCache` text NOT NULL,
  `bytes1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bytes2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guildId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dynFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `corpseType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Death System';

-- --------------------------------------------------------

--
-- Table structure for table `creature_respawn`
--

CREATE TABLE `creature_respawn` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_respawn`
--

CREATE TABLE `gameobject_respawn` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `mapId` smallint(10) UNSIGNED NOT NULL DEFAULT '0',
  `instanceId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

-- --------------------------------------------------------

--
-- Table structure for table `game_event_condition_save`
--

CREATE TABLE `game_event_condition_save` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `done` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_save`
--

CREATE TABLE `game_event_save` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `next_start` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gm_subsurvey`
--

CREATE TABLE `gm_subsurvey` (
  `surveyId` int(10) UNSIGNED NOT NULL,
  `questionId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `answer` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `answerComment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `gm_survey`
--

CREATE TABLE `gm_survey` (
  `surveyId` int(10) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mainSurvey` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` longtext NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `gm_ticket`
--

CREATE TABLE `gm_ticket` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 open, 1 closed, 2 character deleted',
  `playerGuid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `description` text NOT NULL,
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `closedBy` int(10) NOT NULL DEFAULT '0',
  `assignedTo` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `response` text NOT NULL,
  `completed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `escalated` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `viewed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `needMoreHelp` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `resolvedBy` int(10) NOT NULL DEFAULT '0' COMMENT 'GUID of GM who resolved the ticket'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `guid` int(10) UNSIGNED NOT NULL,
  `leaderGuid` int(10) UNSIGNED NOT NULL,
  `lootMethod` tinyint(3) UNSIGNED NOT NULL,
  `looterGuid` int(10) UNSIGNED NOT NULL,
  `lootThreshold` tinyint(3) UNSIGNED NOT NULL,
  `icon1` bigint(20) UNSIGNED NOT NULL,
  `icon2` bigint(20) UNSIGNED NOT NULL,
  `icon3` bigint(20) UNSIGNED NOT NULL,
  `icon4` bigint(20) UNSIGNED NOT NULL,
  `icon5` bigint(20) UNSIGNED NOT NULL,
  `icon6` bigint(20) UNSIGNED NOT NULL,
  `icon7` bigint(20) UNSIGNED NOT NULL,
  `icon8` bigint(20) UNSIGNED NOT NULL,
  `groupType` tinyint(3) UNSIGNED NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `raidDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `masterLooterGuid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

-- --------------------------------------------------------

--
-- Table structure for table `group_instance`
--

CREATE TABLE `group_instance` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `instance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permanent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

CREATE TABLE `group_member` (
  `guid` int(10) UNSIGNED NOT NULL,
  `memberGuid` int(10) UNSIGNED NOT NULL,
  `memberFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `subgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `roles` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

-- --------------------------------------------------------

--
-- Table structure for table `guild`
--

CREATE TABLE `guild` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `leaderguid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `EmblemColor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `BorderStyle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `BorderColor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `info` varchar(500) NOT NULL DEFAULT '',
  `motd` varchar(128) NOT NULL DEFAULT '',
  `createdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BankMoney` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_eventlog`
--

CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ItemOrMoney` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ItemStackCount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `DestTabId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event UNIX time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_item`
--

CREATE TABLE `guild_bank_item` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_right`
--

CREATE TABLE `guild_bank_right` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rid` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `gbright` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `SlotPerDay` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_tab`
--

CREATE TABLE `guild_bank_tab` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `TabId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `TabName` varchar(16) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_eventlog`
--

CREATE TABLE `guild_eventlog` (
  `guildid` int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(10) UNSIGNED NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(3) UNSIGNED NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(10) UNSIGNED NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(10) UNSIGNED NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(3) UNSIGNED NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int(10) UNSIGNED NOT NULL COMMENT 'Event UNIX time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

-- --------------------------------------------------------

--
-- Table structure for table `guild_member`
--

CREATE TABLE `guild_member` (
  `guildid` int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator',
  `guid` int(10) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `guild_member_withdraw`
--

CREATE TABLE `guild_member_withdraw` (
  `guid` int(10) UNSIGNED NOT NULL,
  `tab0` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tab1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tab2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tab3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tab4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tab5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `money` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Member Daily Withdraws';

-- --------------------------------------------------------

--
-- Table structure for table `guild_rank`
--

CREATE TABLE `guild_rank` (
  `guildid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rid` tinyint(3) UNSIGNED NOT NULL,
  `rname` varchar(20) NOT NULL DEFAULT '',
  `rights` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE `instance` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `resettime` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `completedEncounters` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instance_reset`
--

CREATE TABLE `instance_reset` (
  `mapid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `resettime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_instance`
--

CREATE TABLE `item_instance` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemEntry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `owner_guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `creatorGuid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `giftCreatorGuid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `duration` int(10) NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `randomPropertyId` smallint(5) NOT NULL DEFAULT '0',
  `durability` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `playedTime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Table structure for table `item_loot_items`
--

CREATE TABLE `item_loot_items` (
  `container_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int(10) NOT NULL DEFAULT '0' COMMENT 'stack size',
  `follow_rules` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `counted` tinyint(1) NOT NULL DEFAULT '0',
  `under_threshold` tinyint(1) NOT NULL DEFAULT '0',
  `needs_quest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'quest drop',
  `rnd_prop` int(10) NOT NULL DEFAULT '0' COMMENT 'random enchantment added when originally rolled',
  `rnd_suffix` int(10) NOT NULL DEFAULT '0' COMMENT 'random suffix added when originally rolled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_loot_money`
--

CREATE TABLE `item_loot_money` (
  `container_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `money` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'money loot (in copper)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_refund_instance`
--

CREATE TABLE `item_refund_instance` (
  `item_guid` int(10) UNSIGNED NOT NULL COMMENT 'Item GUID',
  `player_guid` int(10) UNSIGNED NOT NULL COMMENT 'Player GUID',
  `paidMoney` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

-- --------------------------------------------------------

--
-- Table structure for table `item_soulbound_trade_data`
--

CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int(10) UNSIGNED NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

-- --------------------------------------------------------

--
-- Table structure for table `lag_reports`
--

CREATE TABLE `lag_reports` (
  `reportId` int(10) UNSIGNED NOT NULL,
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lagType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `mapId` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `latency` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `createTime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `lfg_data`
--

CREATE TABLE `lfg_data` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LFG Data';

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `sender` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `expire_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deliver_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `money` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cod` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mail System';

-- --------------------------------------------------------

--
-- Table structure for table `mail_items`
--

CREATE TABLE `mail_items` (
  `mail_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `receiver` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

CREATE TABLE `petition` (
  `ownerguid` int(10) UNSIGNED NOT NULL,
  `petitionguid` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `petition_sign`
--

CREATE TABLE `petition_sign` (
  `ownerguid` int(10) UNSIGNED NOT NULL,
  `petitionguid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `playerguid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `player_account` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_aura`
--

CREATE TABLE `pet_aura` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `effectMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `recalculateMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stackCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `amount0` mediumint(8) NOT NULL,
  `amount1` mediumint(8) NOT NULL,
  `amount2` mediumint(8) NOT NULL,
  `base_amount0` mediumint(8) NOT NULL,
  `base_amount1` mediumint(8) NOT NULL,
  `base_amount2` mediumint(8) NOT NULL,
  `maxDuration` int(11) NOT NULL DEFAULT '0',
  `remainTime` int(11) NOT NULL DEFAULT '0',
  `remainCharges` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_spell`
--

CREATE TABLE `pet_spell` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_spell_cooldown`
--

CREATE TABLE `pet_spell_cooldown` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `categoryId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_quest_save`
--

CREATE TABLE `pool_quest_save` (
  `pool_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quest_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pvpstats_battlegrounds`
--

CREATE TABLE `pvpstats_battlegrounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `winner_faction` tinyint(4) NOT NULL,
  `bracket_id` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pvpstats_players`
--

CREATE TABLE `pvpstats_players` (
  `battleground_id` bigint(20) UNSIGNED NOT NULL,
  `character_guid` int(10) UNSIGNED NOT NULL,
  `winner` bit(1) NOT NULL,
  `score_killing_blows` mediumint(8) UNSIGNED NOT NULL,
  `score_deaths` mediumint(8) UNSIGNED NOT NULL,
  `score_honorable_kills` mediumint(8) UNSIGNED NOT NULL,
  `score_bonus_honor` mediumint(8) UNSIGNED NOT NULL,
  `score_damage_done` mediumint(8) UNSIGNED NOT NULL,
  `score_healing_done` mediumint(8) UNSIGNED NOT NULL,
  `attr_1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `attr_2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `attr_3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `attr_4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `attr_5` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_tracker`
--

CREATE TABLE `quest_tracker` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `character_guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quest_accept_time` datetime NOT NULL,
  `quest_complete_time` datetime DEFAULT NULL,
  `quest_abandon_time` datetime DEFAULT NULL,
  `completed_by_gm` tinyint(1) NOT NULL DEFAULT '0',
  `core_hash` varchar(120) NOT NULL DEFAULT '0',
  `core_revision` varchar(120) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reserved_name`
--

CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

-- --------------------------------------------------------

--
-- Table structure for table `updates_include`
--

CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

-- --------------------------------------------------------

--
-- Table structure for table `warden_action`
--

CREATE TABLE `warden_action` (
  `wardenId` smallint(5) UNSIGNED NOT NULL,
  `action` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `worldstates`
--

CREATE TABLE `worldstates` (
  `entry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Saves';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_data`
--
ALTER TABLE `account_data`
  ADD PRIMARY KEY (`accountId`,`type`);

--
-- Indexes for table `account_instance_times`
--
ALTER TABLE `account_instance_times`
  ADD PRIMARY KEY (`accountId`,`instanceId`);

--
-- Indexes for table `account_tutorial`
--
ALTER TABLE `account_tutorial`
  ADD PRIMARY KEY (`accountId`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `arena_team`
--
ALTER TABLE `arena_team`
  ADD PRIMARY KEY (`arenaTeamId`);

--
-- Indexes for table `arena_team_member`
--
ALTER TABLE `arena_team_member`
  ADD PRIMARY KEY (`arenaTeamId`,`guid`);

--
-- Indexes for table `auctionhouse`
--
ALTER TABLE `auctionhouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_guid` (`itemguid`);

--
-- Indexes for table `banned_addons`
--
ALTER TABLE `banned_addons`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `idx_name_ver` (`Name`,`Version`);

--
-- Indexes for table `bugreport`
--
ALTER TABLE `bugreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_invites`
--
ALTER TABLE `calendar_invites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`name`,`team`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_account` (`account`),
  ADD KEY `idx_online` (`online`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `character_account_data`
--
ALTER TABLE `character_account_data`
  ADD PRIMARY KEY (`guid`,`type`);

--
-- Indexes for table `character_achievement`
--
ALTER TABLE `character_achievement`
  ADD PRIMARY KEY (`guid`,`achievement`);

--
-- Indexes for table `character_achievement_progress`
--
ALTER TABLE `character_achievement_progress`
  ADD PRIMARY KEY (`guid`,`criteria`);

--
-- Indexes for table `character_action`
--
ALTER TABLE `character_action`
  ADD PRIMARY KEY (`guid`,`spec`,`button`);

--
-- Indexes for table `character_arena_stats`
--
ALTER TABLE `character_arena_stats`
  ADD PRIMARY KEY (`guid`,`slot`);

--
-- Indexes for table `character_aura`
--
ALTER TABLE `character_aura`
  ADD PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`);

--
-- Indexes for table `character_banned`
--
ALTER TABLE `character_banned`
  ADD PRIMARY KEY (`guid`,`bandate`);

--
-- Indexes for table `character_battleground_data`
--
ALTER TABLE `character_battleground_data`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_battleground_random`
--
ALTER TABLE `character_battleground_random`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_declinedname`
--
ALTER TABLE `character_declinedname`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_equipmentsets`
--
ALTER TABLE `character_equipmentsets`
  ADD PRIMARY KEY (`setguid`),
  ADD UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  ADD KEY `Idx_setindex` (`setindex`);

--
-- Indexes for table `character_fishingsteps`
--
ALTER TABLE `character_fishingsteps`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_gifts`
--
ALTER TABLE `character_gifts`
  ADD PRIMARY KEY (`item_guid`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_glyphs`
--
ALTER TABLE `character_glyphs`
  ADD PRIMARY KEY (`guid`,`talentGroup`);

--
-- Indexes for table `character_homebind`
--
ALTER TABLE `character_homebind`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_instance`
--
ALTER TABLE `character_instance`
  ADD PRIMARY KEY (`guid`,`instance`),
  ADD KEY `instance` (`instance`);

--
-- Indexes for table `character_inventory`
--
ALTER TABLE `character_inventory`
  ADD PRIMARY KEY (`item`),
  ADD UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_pet`
--
ALTER TABLE `character_pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `idx_slot` (`slot`);

--
-- Indexes for table `character_pet_declinedname`
--
ALTER TABLE `character_pet_declinedname`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_key` (`owner`);

--
-- Indexes for table `character_queststatus`
--
ALTER TABLE `character_queststatus`
  ADD PRIMARY KEY (`guid`,`quest`);

--
-- Indexes for table `character_queststatus_daily`
--
ALTER TABLE `character_queststatus_daily`
  ADD PRIMARY KEY (`guid`,`quest`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_queststatus_monthly`
--
ALTER TABLE `character_queststatus_monthly`
  ADD PRIMARY KEY (`guid`,`quest`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_queststatus_rewarded`
--
ALTER TABLE `character_queststatus_rewarded`
  ADD PRIMARY KEY (`guid`,`quest`);

--
-- Indexes for table `character_queststatus_seasonal`
--
ALTER TABLE `character_queststatus_seasonal`
  ADD PRIMARY KEY (`guid`,`quest`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_queststatus_weekly`
--
ALTER TABLE `character_queststatus_weekly`
  ADD PRIMARY KEY (`guid`,`quest`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `character_reputation`
--
ALTER TABLE `character_reputation`
  ADD PRIMARY KEY (`guid`,`faction`);

--
-- Indexes for table `character_skills`
--
ALTER TABLE `character_skills`
  ADD PRIMARY KEY (`guid`,`skill`);

--
-- Indexes for table `character_social`
--
ALTER TABLE `character_social`
  ADD PRIMARY KEY (`guid`,`friend`,`flags`),
  ADD KEY `friend` (`friend`);

--
-- Indexes for table `character_spell`
--
ALTER TABLE `character_spell`
  ADD PRIMARY KEY (`guid`,`spell`);

--
-- Indexes for table `character_spell_cooldown`
--
ALTER TABLE `character_spell_cooldown`
  ADD PRIMARY KEY (`guid`,`spell`);

--
-- Indexes for table `character_stats`
--
ALTER TABLE `character_stats`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `character_talent`
--
ALTER TABLE `character_talent`
  ADD PRIMARY KEY (`guid`,`spell`,`talentGroup`);

--
-- Indexes for table `corpse`
--
ALTER TABLE `corpse`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_type` (`corpseType`),
  ADD KEY `idx_instance` (`instanceId`),
  ADD KEY `idx_time` (`time`);

--
-- Indexes for table `creature_respawn`
--
ALTER TABLE `creature_respawn`
  ADD PRIMARY KEY (`guid`,`instanceId`),
  ADD KEY `idx_instance` (`instanceId`);

--
-- Indexes for table `gameobject_respawn`
--
ALTER TABLE `gameobject_respawn`
  ADD PRIMARY KEY (`guid`,`instanceId`),
  ADD KEY `idx_instance` (`instanceId`);

--
-- Indexes for table `game_event_condition_save`
--
ALTER TABLE `game_event_condition_save`
  ADD PRIMARY KEY (`eventEntry`,`condition_id`);

--
-- Indexes for table `game_event_save`
--
ALTER TABLE `game_event_save`
  ADD PRIMARY KEY (`eventEntry`);

--
-- Indexes for table `gm_subsurvey`
--
ALTER TABLE `gm_subsurvey`
  ADD PRIMARY KEY (`surveyId`,`questionId`);

--
-- Indexes for table `gm_survey`
--
ALTER TABLE `gm_survey`
  ADD PRIMARY KEY (`surveyId`);

--
-- Indexes for table `gm_ticket`
--
ALTER TABLE `gm_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `leaderGuid` (`leaderGuid`);

--
-- Indexes for table `group_instance`
--
ALTER TABLE `group_instance`
  ADD PRIMARY KEY (`guid`,`instance`),
  ADD KEY `instance` (`instance`);

--
-- Indexes for table `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`memberGuid`);

--
-- Indexes for table `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`guildid`);

--
-- Indexes for table `guild_bank_eventlog`
--
ALTER TABLE `guild_bank_eventlog`
  ADD PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  ADD KEY `guildid_key` (`guildid`),
  ADD KEY `Idx_PlayerGuid` (`PlayerGuid`),
  ADD KEY `Idx_LogGuid` (`LogGuid`);

--
-- Indexes for table `guild_bank_item`
--
ALTER TABLE `guild_bank_item`
  ADD PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  ADD KEY `guildid_key` (`guildid`),
  ADD KEY `Idx_item_guid` (`item_guid`);

--
-- Indexes for table `guild_bank_right`
--
ALTER TABLE `guild_bank_right`
  ADD PRIMARY KEY (`guildid`,`TabId`,`rid`),
  ADD KEY `guildid_key` (`guildid`);

--
-- Indexes for table `guild_bank_tab`
--
ALTER TABLE `guild_bank_tab`
  ADD PRIMARY KEY (`guildid`,`TabId`),
  ADD KEY `guildid_key` (`guildid`);

--
-- Indexes for table `guild_eventlog`
--
ALTER TABLE `guild_eventlog`
  ADD PRIMARY KEY (`guildid`,`LogGuid`),
  ADD KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  ADD KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  ADD KEY `Idx_LogGuid` (`LogGuid`);

--
-- Indexes for table `guild_member`
--
ALTER TABLE `guild_member`
  ADD UNIQUE KEY `guid_key` (`guid`),
  ADD KEY `guildid_key` (`guildid`),
  ADD KEY `guildid_rank_key` (`guildid`,`rank`);

--
-- Indexes for table `guild_member_withdraw`
--
ALTER TABLE `guild_member_withdraw`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `guild_rank`
--
ALTER TABLE `guild_rank`
  ADD PRIMARY KEY (`guildid`,`rid`),
  ADD KEY `Idx_rid` (`rid`);

--
-- Indexes for table `instance`
--
ALTER TABLE `instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `map` (`map`),
  ADD KEY `resettime` (`resettime`),
  ADD KEY `difficulty` (`difficulty`);

--
-- Indexes for table `instance_reset`
--
ALTER TABLE `instance_reset`
  ADD PRIMARY KEY (`mapid`,`difficulty`),
  ADD KEY `difficulty` (`difficulty`);

--
-- Indexes for table `item_instance`
--
ALTER TABLE `item_instance`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_owner_guid` (`owner_guid`);

--
-- Indexes for table `item_loot_money`
--
ALTER TABLE `item_loot_money`
  ADD PRIMARY KEY (`container_id`);

--
-- Indexes for table `item_refund_instance`
--
ALTER TABLE `item_refund_instance`
  ADD PRIMARY KEY (`item_guid`,`player_guid`);

--
-- Indexes for table `item_soulbound_trade_data`
--
ALTER TABLE `item_soulbound_trade_data`
  ADD PRIMARY KEY (`itemGuid`);

--
-- Indexes for table `lag_reports`
--
ALTER TABLE `lag_reports`
  ADD PRIMARY KEY (`reportId`);

--
-- Indexes for table `lfg_data`
--
ALTER TABLE `lfg_data`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_receiver` (`receiver`);

--
-- Indexes for table `mail_items`
--
ALTER TABLE `mail_items`
  ADD PRIMARY KEY (`item_guid`),
  ADD KEY `idx_receiver` (`receiver`),
  ADD KEY `idx_mail_id` (`mail_id`);

--
-- Indexes for table `petition`
--
ALTER TABLE `petition`
  ADD PRIMARY KEY (`ownerguid`,`type`),
  ADD UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`);

--
-- Indexes for table `petition_sign`
--
ALTER TABLE `petition_sign`
  ADD PRIMARY KEY (`petitionguid`,`playerguid`),
  ADD KEY `Idx_playerguid` (`playerguid`),
  ADD KEY `Idx_ownerguid` (`ownerguid`);

--
-- Indexes for table `pet_aura`
--
ALTER TABLE `pet_aura`
  ADD PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`);

--
-- Indexes for table `pet_spell`
--
ALTER TABLE `pet_spell`
  ADD PRIMARY KEY (`guid`,`spell`);

--
-- Indexes for table `pet_spell_cooldown`
--
ALTER TABLE `pet_spell_cooldown`
  ADD PRIMARY KEY (`guid`,`spell`);

--
-- Indexes for table `pool_quest_save`
--
ALTER TABLE `pool_quest_save`
  ADD PRIMARY KEY (`pool_id`,`quest_id`);

--
-- Indexes for table `pvpstats_battlegrounds`
--
ALTER TABLE `pvpstats_battlegrounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pvpstats_players`
--
ALTER TABLE `pvpstats_players`
  ADD PRIMARY KEY (`battleground_id`,`character_guid`);

--
-- Indexes for table `reserved_name`
--
ALTER TABLE `reserved_name`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `updates_include`
--
ALTER TABLE `updates_include`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `warden_action`
--
ALTER TABLE `warden_action`
  ADD PRIMARY KEY (`wardenId`);

--
-- Indexes for table `worldstates`
--
ALTER TABLE `worldstates`
  ADD PRIMARY KEY (`entry`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banned_addons`
--
ALTER TABLE `banned_addons`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bugreport`
--
ALTER TABLE `bugreport`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier';
--
-- AUTO_INCREMENT for table `character_equipmentsets`
--
ALTER TABLE `character_equipmentsets`
  MODIFY `setguid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gm_subsurvey`
--
ALTER TABLE `gm_subsurvey`
  MODIFY `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gm_survey`
--
ALTER TABLE `gm_survey`
  MODIFY `surveyId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gm_ticket`
--
ALTER TABLE `gm_ticket`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lag_reports`
--
ALTER TABLE `lag_reports`
  MODIFY `reportId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pvpstats_battlegrounds`
--
ALTER TABLE `pvpstats_battlegrounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
