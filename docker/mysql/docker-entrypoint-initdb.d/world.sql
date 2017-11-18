-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2017 at 11:18 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.1.11-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `world`
--
CREATE DATABASE IF NOT EXISTS `world` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `world`;

-- --------------------------------------------------------

--
-- Table structure for table `access_requirement`
--

CREATE TABLE `access_requirement` (
  `mapId` mediumint(8) UNSIGNED NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `level_min` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `level_max` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `item_level` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `item2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_done_A` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_done_H` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `completed_achievement` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Access Requirements' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `achievement_criteria_data`
--

CREATE TABLE `achievement_criteria_data` (
  `criteria_id` mediumint(8) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `value1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `value2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Achievment system' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `achievement_dbc`
--

CREATE TABLE `achievement_dbc` (
  `ID` int(10) UNSIGNED NOT NULL,
  `requiredFaction` int(11) NOT NULL DEFAULT '-1',
  `mapID` int(11) NOT NULL DEFAULT '-1',
  `points` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `refAchievement` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `achievement_reward`
--

CREATE TABLE `achievement_reward` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `TitleA` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `TitleH` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Sender` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Subject` varchar(255) DEFAULT NULL,
  `Text` text,
  `MailTemplateID` mediumint(8) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `achievement_reward_locale`
--

CREATE TABLE `achievement_reward_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Subject` text,
  `Text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `areatrigger_involvedrelation`
--

CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `areatrigger_scripts`
--

CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `areatrigger_tavern`
--

CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `areatrigger_teleport`
--

CREATE TABLE `areatrigger_teleport` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Name` text,
  `target_map` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `battleground_template`
--

CREATE TABLE `battleground_template` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `MinPlayersPerTeam` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) UNSIGNED NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) UNSIGNED NOT NULL,
  `HordeStartO` float NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` char(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `battlemaster_entry`
--

CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Battleground template id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_text`
--

CREATE TABLE `broadcast_text` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Language` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `MaleText` longtext,
  `FemaleText` longtext,
  `EmoteID0` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteID1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteID2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay0` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `SoundId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Unk1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Unk2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_text_locale`
--

CREATE TABLE `broadcast_text_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `MaleText` text,
  `FemaleText` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `permission` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `help` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Chat System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `SourceTypeOrReferenceId` mediumint(8) NOT NULL DEFAULT '0',
  `SourceGroup` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `SourceEntry` mediumint(8) NOT NULL DEFAULT '0',
  `SourceId` int(11) NOT NULL DEFAULT '0',
  `ElseGroup` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` mediumint(8) NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ConditionValue1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ConditionValue2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ConditionValue3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `NegativeCondition` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ErrorType` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ErrorTextId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Condition System';

-- --------------------------------------------------------

--
-- Table structure for table `creature`
--

CREATE TABLE `creature` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `phaseMask` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `modelid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `equipment_id` tinyint(3) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) UNSIGNED NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '0',
  `currentwaypoint` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `curhealth` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `curmana` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `npcflag` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unit_flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dynamicflags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` char(64) DEFAULT '',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `creature_addon`
--

CREATE TABLE `creature_addon` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `bytes1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bytes2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `emote` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `auras` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_classlevelstats`
--

CREATE TABLE `creature_classlevelstats` (
  `level` tinyint(3) UNSIGNED NOT NULL,
  `class` tinyint(3) UNSIGNED NOT NULL,
  `basehp0` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `basehp1` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `basehp2` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `basemana` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `basearmor` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `attackpower` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `damage_base` float NOT NULL DEFAULT '0',
  `damage_exp1` float NOT NULL DEFAULT '0',
  `damage_exp2` float NOT NULL DEFAULT '0',
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_equip_template`
--

CREATE TABLE `creature_equip_template` (
  `CreatureID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ID` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `ItemID1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemID2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemID3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_formations`
--

CREATE TABLE `creature_formations` (
  `leaderGUID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `memberGUID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dist` float UNSIGNED NOT NULL,
  `angle` float UNSIGNED NOT NULL,
  `groupAI` int(10) UNSIGNED NOT NULL,
  `point_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `point_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_loot_template`
--

CREATE TABLE `creature_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Table structure for table `creature_model_info`
--

CREATE TABLE `creature_model_info` (
  `DisplayID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `BoundingRadius` float NOT NULL DEFAULT '0',
  `CombatReach` float NOT NULL DEFAULT '0',
  `Gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `DisplayID_Other_Gender` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';

-- --------------------------------------------------------

--
-- Table structure for table `creature_onkill_reputation`
--

CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(8) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature OnKill Reputation gain' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `creature_questender`
--

CREATE TABLE `creature_questender` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `creature_questitem`
--

CREATE TABLE `creature_questitem` (
  `CreatureEntry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Idx` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ItemId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_queststarter`
--

CREATE TABLE `creature_queststarter` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `creature_summon_groups`
--

CREATE TABLE `creature_summon_groups` (
  `summonerId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `summonerType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `groupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `summonTime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_template`
--

CREATE TABLE `creature_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `difficulty_entry_1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `difficulty_entry_2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `difficulty_entry_3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `KillCredit1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `KillCredit2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modelid1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `modelid2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `modelid3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `modelid4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `IconName` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `minlevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `exp` smallint(6) NOT NULL DEFAULT '0',
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `npcflag` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `BaseAttackTime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RangeAttackTime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BaseVariance` float NOT NULL DEFAULT '1',
  `RangeVariance` float NOT NULL DEFAULT '1',
  `unit_class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `unit_flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unit_flags2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dynamicflags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `family` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `trainer_class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `trainer_race` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `type_flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lootid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `resistance1` smallint(6) NOT NULL DEFAULT '0',
  `resistance2` smallint(6) NOT NULL DEFAULT '0',
  `resistance3` smallint(6) NOT NULL DEFAULT '0',
  `resistance4` smallint(6) NOT NULL DEFAULT '0',
  `resistance5` smallint(6) NOT NULL DEFAULT '0',
  `resistance6` smallint(6) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell5` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell6` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell7` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spell8` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VehicleId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `mingold` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `InhabitType` tinyint(3) UNSIGNED NOT NULL DEFAULT '3',
  `HoverHeight` float NOT NULL DEFAULT '1',
  `HealthModifier` float NOT NULL DEFAULT '1',
  `ManaModifier` float NOT NULL DEFAULT '1',
  `ArmorModifier` float NOT NULL DEFAULT '1',
  `DamageModifier` float NOT NULL DEFAULT '1',
  `ExperienceModifier` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `movementId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `mechanic_immune_mask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flags_extra` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `creature_template_addon`
--

CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `path_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `bytes1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bytes2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `emote` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `auras` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_template_locale`
--

CREATE TABLE `creature_template_locale` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `Title` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_text`
--

CREATE TABLE `creature_text` (
  `CreatureID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `GroupID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Text` longtext,
  `Type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Language` tinyint(3) NOT NULL DEFAULT '0',
  `Probability` float UNSIGNED NOT NULL DEFAULT '0',
  `Emote` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Duration` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Sound` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `BroadcastTextId` mediumint(6) NOT NULL DEFAULT '0',
  `TextRange` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creature_text_locale`
--

CREATE TABLE `creature_text_locale` (
  `CreatureID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `GroupID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disables`
--

CREATE TABLE `disables` (
  `sourceType` int(10) UNSIGNED NOT NULL,
  `entry` int(10) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `params_0` varchar(255) NOT NULL DEFAULT '',
  `params_1` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disenchant_loot_template`
--

CREATE TABLE `disenchant_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `event_scripts`
--

CREATE TABLE `event_scripts` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `delay` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `command` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `datalong` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `datalong2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exploration_basexp`
--

CREATE TABLE `exploration_basexp` (
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `basexp` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Exploration System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `fishing_loot_template`
--

CREATE TABLE `fishing_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Table structure for table `gameobject`
--

CREATE TABLE `gameobject` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `phaseMask` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` char(64) DEFAULT '',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gameobject System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_addon`
--

CREATE TABLE `gameobject_addon` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parent_rotation0` float NOT NULL DEFAULT '0',
  `parent_rotation1` float NOT NULL DEFAULT '0',
  `parent_rotation2` float NOT NULL DEFAULT '0',
  `parent_rotation3` float NOT NULL DEFAULT '1',
  `invisibilityType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `invisibilityValue` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_loot_template`
--

CREATE TABLE `gameobject_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_questender`
--

CREATE TABLE `gameobject_questender` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_questitem`
--

CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Idx` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ItemId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_queststarter`
--

CREATE TABLE `gameobject_queststarter` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Identifier'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_template`
--

CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `displayId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `unk1` varchar(100) NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT '1',
  `Data0` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data1` int(11) NOT NULL DEFAULT '0',
  `Data2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data6` int(11) NOT NULL DEFAULT '0',
  `Data7` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data8` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data9` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data10` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data11` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data12` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data13` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data14` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data15` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data16` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data17` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data18` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data19` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data20` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data21` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data22` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Data23` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gameobject System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_template_addon`
--

CREATE TABLE `gameobject_template_addon` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mingold` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_template_locale`
--

CREATE TABLE `gameobject_template_locale` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `name` text,
  `castBarCaption` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event`
--

CREATE TABLE `game_event` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) UNSIGNED NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) UNSIGNED NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint(3) UNSIGNED DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_arena_seasons`
--

CREATE TABLE `game_event_arena_seasons` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint(3) UNSIGNED NOT NULL COMMENT 'Arena season number'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_battleground_holiday`
--

CREATE TABLE `game_event_battleground_holiday` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `bgflag` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_condition`
--

CREATE TABLE `game_event_condition` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_creature`
--

CREATE TABLE `game_event_creature` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_creature_quest`
--

CREATE TABLE `game_event_creature_quest` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event.',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_gameobject`
--

CREATE TABLE `game_event_gameobject` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_gameobject_quest`
--

CREATE TABLE `game_event_gameobject_quest` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_model_equip`
--

CREATE TABLE `game_event_model_equip` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modelid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `equipment_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_npcflag`
--

CREATE TABLE `game_event_npcflag` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `guid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `npcflag` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_npc_vendor`
--

CREATE TABLE `game_event_npc_vendor` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_pool`
--

CREATE TABLE `game_event_pool` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Id of the pool'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_prerequisite`
--

CREATE TABLE `game_event_prerequisite` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_quest_condition`
--

CREATE TABLE `game_event_quest_condition` (
  `eventEntry` tinyint(3) UNSIGNED NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `num` float DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_seasonal_questrelation`
--

CREATE TABLE `game_event_seasonal_questrelation` (
  `questId` int(10) UNSIGNED NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entry of the game event'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `game_tele`
--

CREATE TABLE `game_tele` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';

-- --------------------------------------------------------

--
-- Table structure for table `game_weather`
--

CREATE TABLE `game_weather` (
  `zone` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '25',
  `ScriptName` char(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Weather System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `gossip_menu`
--

CREATE TABLE `gossip_menu` (
  `MenuID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `TextID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gossip_menu_option`
--

CREATE TABLE `gossip_menu_option` (
  `MenuID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `OptionID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `OptionIcon` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `OptionText` text,
  `OptionBroadcastTextID` mediumint(6) NOT NULL DEFAULT '0',
  `OptionType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `OptionNpcFlag` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ActionMenuID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ActionPoiID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `BoxCoded` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `BoxMoney` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BoxText` text,
  `BoxBroadcastTextID` mediumint(6) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gossip_menu_option_locale`
--

CREATE TABLE `gossip_menu_option_locale` (
  `MenuID` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `OptionID` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `OptionText` text,
  `BoxText` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `graveyard_zone`
--

CREATE TABLE `graveyard_zone` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `GhostZone` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Faction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

-- --------------------------------------------------------

--
-- Table structure for table `instance_encounters`
--

CREATE TABLE `instance_encounters` (
  `entry` int(10) UNSIGNED NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `creditEntry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instance_spawn_groups`
--

CREATE TABLE `instance_spawn_groups` (
  `instanceMapId` smallint(5) UNSIGNED NOT NULL,
  `bossStateId` tinyint(3) UNSIGNED NOT NULL,
  `bossStates` tinyint(3) UNSIGNED NOT NULL,
  `spawnGroupId` int(10) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instance_template`
--

CREATE TABLE `instance_template` (
  `map` smallint(5) UNSIGNED NOT NULL,
  `parent` smallint(5) UNSIGNED NOT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `allowMount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_enchantment_template`
--

CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ench` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `chance` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item Random Enchantment System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `item_loot_template`
--

CREATE TABLE `item_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `item_set_names`
--

CREATE TABLE `item_set_names` (
  `entry` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `InventoryType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_set_names_locale`
--

CREATE TABLE `item_set_names_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_template`
--

CREATE TABLE `item_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `subclass` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `SoundOverrideSubclass` tinyint(3) NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Quality` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `FlagsExtra` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BuyCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `BuyPrice` bigint(20) NOT NULL DEFAULT '0',
  `SellPrice` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `AllowableClass` int(11) NOT NULL DEFAULT '-1',
  `AllowableRace` int(11) NOT NULL DEFAULT '-1',
  `ItemLevel` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `stackable` int(11) DEFAULT '1',
  `ContainerSlots` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `StatsCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `ScalingStatDistribution` smallint(6) NOT NULL DEFAULT '0',
  `ScalingStatValue` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `armor` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `delay` smallint(5) UNSIGNED NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `spellcharges_1` smallint(6) NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `spellcharges_2` smallint(6) NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `spellcharges_3` smallint(6) NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `spellcharges_4` smallint(6) NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `spellcharges_5` smallint(6) NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `startquest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `lockid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `block` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `itemset` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `area` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(8) NOT NULL DEFAULT '0',
  `TotemCategory` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_1` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_1` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_2` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_2` mediumint(8) NOT NULL DEFAULT '0',
  `socketColor_3` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_3` mediumint(8) NOT NULL DEFAULT '0',
  `socketBonus` mediumint(8) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` smallint(6) NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `duration` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ItemLimitCategory` smallint(6) NOT NULL DEFAULT '0',
  `HolidayId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `minMoneyLoot` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxMoneyLoot` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `flagsCustom` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `item_template_locale`
--

CREATE TABLE `item_template_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `Description` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lfg_dungeon_rewards`
--

CREATE TABLE `lfg_dungeon_rewards` (
  `dungeonId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `otherQuestId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lfg_dungeon_template`
--

CREATE TABLE `lfg_dungeon_template` (
  `dungeonId` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_respawn`
--

CREATE TABLE `linked_respawn` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) UNSIGNED NOT NULL COMMENT 'master creature',
  `linkType` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature Respawn Link System' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mail_level_reward`
--

CREATE TABLE `mail_level_reward` (
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `raceMask` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Mail System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `mail_loot_template`
--

CREATE TABLE `mail_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `milling_loot_template`
--

CREATE TABLE `milling_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `npc_spellclick_spells`
--

CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int(10) UNSIGNED NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int(10) UNSIGNED NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint(3) UNSIGNED NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `npc_text`
--

CREATE TABLE `npc_text` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `BroadcastTextID0` mediumint(6) NOT NULL DEFAULT '0',
  `lang0` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `em0_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em0_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em0_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em0_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em0_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em0_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `BroadcastTextID1` mediumint(6) NOT NULL DEFAULT '0',
  `lang1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `em1_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em1_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em1_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em1_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em1_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em1_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `BroadcastTextID2` mediumint(6) NOT NULL DEFAULT '0',
  `lang2` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `em2_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em2_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em2_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em2_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em2_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em2_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `BroadcastTextID3` mediumint(6) NOT NULL DEFAULT '0',
  `lang3` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `em3_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em3_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em3_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em3_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em3_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em3_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `BroadcastTextID4` mediumint(6) NOT NULL DEFAULT '0',
  `lang4` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `em4_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em4_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em4_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em4_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em4_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em4_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `BroadcastTextID5` mediumint(6) NOT NULL DEFAULT '0',
  `lang5` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `em5_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em5_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em5_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em5_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em5_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em5_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `BroadcastTextID6` mediumint(6) NOT NULL DEFAULT '0',
  `lang6` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `em6_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em6_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em6_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em6_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em6_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em6_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `BroadcastTextID7` mediumint(6) NOT NULL DEFAULT '0',
  `lang7` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  `em7_0` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em7_1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em7_2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em7_3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em7_4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `em7_5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `npc_text_locale`
--

CREATE TABLE `npc_text_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Text0_0` longtext,
  `Text0_1` longtext,
  `Text1_0` longtext,
  `Text1_1` longtext,
  `Text2_0` longtext,
  `Text2_1` longtext,
  `Text3_0` longtext,
  `Text3_1` longtext,
  `Text4_0` longtext,
  `Text4_1` longtext,
  `Text5_0` longtext,
  `Text5_1` longtext,
  `Text6_0` longtext,
  `Text6_1` longtext,
  `Text7_0` longtext,
  `Text7_1` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `npc_trainer`
--

CREATE TABLE `npc_trainer` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `SpellID` mediumint(8) NOT NULL DEFAULT '0',
  `MoneyCost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ReqSkillLine` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ReqSkillRank` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ReqLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `npc_vendor`
--

CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `incrtime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Npc System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `outdoorpvp_template`
--

CREATE TABLE `outdoorpvp_template` (
  `TypeId` tinyint(3) UNSIGNED NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='OutdoorPvP Templates' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `page_text`
--

CREATE TABLE `page_text` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Text` longtext NOT NULL,
  `NextPageID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Table structure for table `page_text_locale`
--

CREATE TABLE `page_text_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Text` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pet_levelstats`
--

CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `hp` smallint(5) UNSIGNED NOT NULL,
  `mana` smallint(5) UNSIGNED NOT NULL,
  `armor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `str` smallint(5) UNSIGNED NOT NULL,
  `agi` smallint(5) UNSIGNED NOT NULL,
  `sta` smallint(5) UNSIGNED NOT NULL,
  `inte` smallint(5) UNSIGNED NOT NULL,
  `spi` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores pet levels stats.' PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `pet_name_generation`
--

CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `half` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pickpocketing_loot_template`
--

CREATE TABLE `pickpocketing_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo`
--

CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `zone` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo_action`
--

CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `button` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo_cast_spell`
--

CREATE TABLE `playercreateinfo_cast_spell` (
  `raceMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `classMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo_item`
--

CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `itemid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `amount` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo_skills`
--

CREATE TABLE `playercreateinfo_skills` (
  `raceMask` int(10) UNSIGNED NOT NULL,
  `classMask` int(10) UNSIGNED NOT NULL,
  `skill` smallint(5) UNSIGNED NOT NULL,
  `rank` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playercreateinfo_spell_custom`
--

CREATE TABLE `playercreateinfo_spell_custom` (
  `racemask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `classmask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_classlevelstats`
--

CREATE TABLE `player_classlevelstats` (
  `class` tinyint(3) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `basehp` smallint(5) UNSIGNED NOT NULL,
  `basemana` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores levels stats.' PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_achievement`
--

CREATE TABLE `player_factionchange_achievement` (
  `alliance_id` int(10) UNSIGNED NOT NULL,
  `horde_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_items`
--

CREATE TABLE `player_factionchange_items` (
  `race_A` int(10) UNSIGNED NOT NULL,
  `alliance_id` int(10) UNSIGNED NOT NULL,
  `commentA` text,
  `race_H` int(10) UNSIGNED NOT NULL,
  `horde_id` int(10) UNSIGNED NOT NULL,
  `commentH` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_quests`
--

CREATE TABLE `player_factionchange_quests` (
  `alliance_id` int(10) UNSIGNED NOT NULL,
  `horde_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_reputations`
--

CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int(10) UNSIGNED NOT NULL,
  `horde_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_spells`
--

CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int(10) UNSIGNED NOT NULL,
  `horde_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_factionchange_titles`
--

CREATE TABLE `player_factionchange_titles` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_levelstats`
--

CREATE TABLE `player_levelstats` (
  `race` tinyint(3) UNSIGNED NOT NULL,
  `class` tinyint(3) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `str` tinyint(3) UNSIGNED NOT NULL,
  `agi` tinyint(3) UNSIGNED NOT NULL,
  `sta` tinyint(3) UNSIGNED NOT NULL,
  `inte` tinyint(3) UNSIGNED NOT NULL,
  `spi` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores levels stats.' PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `player_xp_for_level`
--

CREATE TABLE `player_xp_for_level` (
  `Level` tinyint(3) UNSIGNED NOT NULL,
  `Experience` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `points_of_interest`
--

CREATE TABLE `points_of_interest` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `Icon` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Flags` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Importance` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Name` text NOT NULL,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `points_of_interest_locale`
--

CREATE TABLE `points_of_interest_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_creature`
--

CREATE TABLE `pool_creature` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `chance` float UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_gameobject`
--

CREATE TABLE `pool_gameobject` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `chance` float UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_pool`
--

CREATE TABLE `pool_pool` (
  `pool_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `mother_pool` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_quest`
--

CREATE TABLE `pool_quest` (
  `entry` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_template`
--

CREATE TABLE `pool_template` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospecting_loot_template`
--

CREATE TABLE `prospecting_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `quest_details`
--

CREATE TABLE `quest_details` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Emote1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_mail_sender`
--

CREATE TABLE `quest_mail_sender` (
  `QuestId` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardMailSenderEntry` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_offer_reward`
--

CREATE TABLE `quest_offer_reward` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Emote1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Emote4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteDelay4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RewardText` text,
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_poi`
--

CREATE TABLE `quest_poi` (
  `QuestID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ObjectiveIndex` int(11) NOT NULL DEFAULT '0',
  `MapID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `WorldMapAreaId` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Floor` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Priority` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_poi_points`
--

CREATE TABLE `quest_poi_points` (
  `QuestID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Idx1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Idx2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `X` int(11) NOT NULL DEFAULT '0',
  `Y` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_request_items`
--

CREATE TABLE `quest_request_items` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `CompletionText` text,
  `VerifiedBuild` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_template`
--

CREATE TABLE `quest_template` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `QuestType` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `QuestLevel` smallint(3) NOT NULL DEFAULT '1',
  `MinLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `QuestSortID` smallint(6) NOT NULL DEFAULT '0',
  `QuestInfoID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredFactionId1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredFactionId2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardNextQuest` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardXPDifficulty` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RewardMoney` int(11) NOT NULL DEFAULT '0',
  `RewardBonusMoney` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RewardDisplaySpell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardSpell` int(11) NOT NULL DEFAULT '0',
  `RewardHonor` int(11) NOT NULL DEFAULT '0',
  `RewardKillHonor` float NOT NULL DEFAULT '0',
  `StartItem` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Flags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredPlayerKills` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RewardItem1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardAmount1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardItem2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardAmount2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardItem3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardAmount3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardItem4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardAmount4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDrop1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDropQuantity1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDrop2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDropQuantity2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDrop3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDropQuantity3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDrop4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ItemDropQuantity4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `POIContinent` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `POIx` float NOT NULL DEFAULT '0',
  `POIy` float NOT NULL DEFAULT '0',
  `POIPriority` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardTitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RewardTalents` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `RewardArenaPoints` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RewardFactionID1` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride1` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionID2` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride2` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionID3` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride3` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionID4` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride4` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionID5` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewardFactionValue5` mediumint(8) NOT NULL DEFAULT '0',
  `RewardFactionOverride5` mediumint(8) NOT NULL DEFAULT '0',
  `TimeAllowed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AllowableRaces` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `LogTitle` text,
  `LogDescription` text,
  `QuestDescription` text,
  `AreaDescription` text,
  `QuestCompletionLog` text,
  `RequiredNpcOrGo1` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo2` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo3` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGo4` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredNpcOrGoCount4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId1` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId2` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId3` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId4` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId5` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemId6` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount1` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount5` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredItemCount6` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Unknown0` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

-- --------------------------------------------------------

--
-- Table structure for table `quest_template_addon`
--

CREATE TABLE `quest_template_addon` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `AllowableClasses` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SourceSpellID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `PrevQuestID` mediumint(8) NOT NULL DEFAULT '0',
  `NextQuestID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(8) NOT NULL DEFAULT '0',
  `RewardMailTemplateID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `RewardMailDelay` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(8) NOT NULL DEFAULT '0',
  `ProvidedItemCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quest_template_locale`
--

CREATE TABLE `quest_template_locale` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `CompletedText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference_loot_template`
--

CREATE TABLE `reference_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `reputation_reward_rate`
--

CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `quest_daily_rate` float NOT NULL DEFAULT '1',
  `quest_weekly_rate` float NOT NULL DEFAULT '1',
  `quest_monthly_rate` float NOT NULL DEFAULT '1',
  `quest_repeatable_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reputation_spillover_template`
--

CREATE TABLE `reputation_spillover_template` (
  `faction` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `faction3` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `faction4` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reputation spillover reputation gain' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `script_spline_chain_meta`
--

CREATE TABLE `script_spline_chain_meta` (
  `entry` int(10) UNSIGNED NOT NULL,
  `chainId` smallint(5) UNSIGNED NOT NULL,
  `splineId` tinyint(3) UNSIGNED NOT NULL,
  `expectedDuration` int(10) UNSIGNED NOT NULL,
  `msUntilNext` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `script_spline_chain_waypoints`
--

CREATE TABLE `script_spline_chain_waypoints` (
  `entry` int(10) UNSIGNED NOT NULL,
  `chainId` smallint(5) UNSIGNED NOT NULL,
  `splineId` tinyint(3) UNSIGNED NOT NULL,
  `wpId` tinyint(3) UNSIGNED NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `script_waypoint`
--

CREATE TABLE `script_waypoint` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Script Creature waypoints' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `skill_discovery_template`
--

CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Skill Discovery System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `skill_extra_item_template`
--

CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'max num of adds'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Skill Specialization System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `skill_fishing_base_level`
--

CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Fishing system' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `skill_perfect_item_template`
--

CREATE TABLE `skill_perfect_item_template` (
  `spellId` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
  `perfectItemType` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Crafting Perfection System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `skinning_loot_template`
--

CREATE TABLE `skinning_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `smart_scripts`
--

CREATE TABLE `smart_scripts` (
  `entryorguid` int(11) NOT NULL,
  `source_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `id` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `link` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `event_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `event_phase_mask` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `event_chance` tinyint(3) UNSIGNED NOT NULL DEFAULT '100',
  `event_flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `event_param1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `event_param2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `event_param3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `event_param4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `action_param1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_param2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_param3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_param4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_param5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action_param6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `target_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `target_param1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `target_param2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `target_param3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT 'Event Comment'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spawn_group`
--

CREATE TABLE `spawn_group` (
  `groupId` int(10) UNSIGNED NOT NULL,
  `spawnType` tinyint(10) UNSIGNED NOT NULL,
  `spawnId` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spawn_group_template`
--

CREATE TABLE `spawn_group_template` (
  `groupId` int(10) UNSIGNED NOT NULL,
  `groupName` varchar(100) NOT NULL,
  `groupFlags` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spelldifficulty_dbc`
--

CREATE TABLE `spelldifficulty_dbc` (
  `id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `spellid0` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `spellid1` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `spellid2` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `spellid3` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_area`
--

CREATE TABLE `spell_area` (
  `spell` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `area` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `autocast` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `quest_start_status` int(11) NOT NULL DEFAULT '64',
  `quest_end_status` int(11) NOT NULL DEFAULT '11'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_bonus_data`
--

CREATE TABLE `spell_bonus_data` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_custom_attr`
--

CREATE TABLE `spell_custom_attr` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'spell id',
  `attributes` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SpellInfo custom attributes';

-- --------------------------------------------------------

--
-- Table structure for table `spell_dbc`
--

CREATE TABLE `spell_dbc` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Dispel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Mechanic` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Attributes` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx6` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesEx7` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Stances` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `StancesNot` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Targets` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `CastingTimeIndex` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `AuraInterruptFlags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ProcFlags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ProcChance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ProcCharges` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `MaxLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BaseLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `DurationIndex` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `RangeIndex` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `StackAmount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `Effect1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Effect2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Effect3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides3` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints3` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectMechanic2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectMechanic3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude3` int(11) NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectItemType1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectItemType2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectItemType3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue3` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int(11) NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `MaxTargetLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyName` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `DmgClass` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `PreventionType` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Custom spell.dbc entries' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_enchant_proc_data`
--

CREATE TABLE `spell_enchant_proc_data` (
  `EnchantID` int(10) UNSIGNED NOT NULL,
  `Chance` float NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `HitMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesMask` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell enchant proc data' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `spell_group`
--

CREATE TABLE `spell_group` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_group_stack_rules`
--

CREATE TABLE `spell_group_stack_rules` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `stack_rule` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_learn_spell`
--

CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `SpellID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `Active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_linked_spell`
--

CREATE TABLE `spell_linked_spell` (
  `spell_trigger` mediumint(8) NOT NULL,
  `spell_effect` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

-- --------------------------------------------------------

--
-- Table structure for table `spell_loot_template`
--

CREATE TABLE `spell_loot_template` (
  `Entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Item` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Reference` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `GroupId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MinCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `MaxCount` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_pet_auras`
--

CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) UNSIGNED NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `pet` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) UNSIGNED NOT NULL COMMENT 'pet aura id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_proc`
--

CREATE TABLE `spell_proc` (
  `SpellId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ProcFlags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellTypeMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SpellPhaseMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `HitMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `AttributesMask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Charges` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_ranks`
--

CREATE TABLE `spell_ranks` (
  `first_spell_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spell_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell Rank Data' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_required`
--

CREATE TABLE `spell_required` (
  `spell_id` mediumint(8) NOT NULL DEFAULT '0',
  `req_spell` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell Additinal Data' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_scripts`
--

CREATE TABLE `spell_scripts` (
  `id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `effIndex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `delay` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `command` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `datalong` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `datalong2` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_script_names`
--

CREATE TABLE `spell_script_names` (
  `spell_id` int(11) NOT NULL,
  `ScriptName` char(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spell_target_position`
--

CREATE TABLE `spell_target_position` (
  `ID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `EffectIndex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `MapID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `spell_threat`
--

CREATE TABLE `spell_threat` (
  `entry` mediumint(8) UNSIGNED NOT NULL,
  `flatMod` int(11) DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `transports`
--

CREATE TABLE `transports` (
  `guid` int(10) UNSIGNED NOT NULL,
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` text,
  `ScriptName` char(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Transports' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `trinity_string`
--

CREATE TABLE `trinity_string` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for table `vehicle_accessory`
--

CREATE TABLE `vehicle_accessory` (
  `guid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint(3) UNSIGNED NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) UNSIGNED NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_template_accessory`
--

CREATE TABLE `vehicle_template_accessory` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint(3) UNSIGNED NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) UNSIGNED NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `core_version` varchar(120) NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) DEFAULT NULL,
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Version Notes' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `warden_checks`
--

CREATE TABLE `warden_checks` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `data` varchar(48) DEFAULT NULL,
  `str` varchar(20) DEFAULT NULL,
  `address` int(10) UNSIGNED DEFAULT NULL,
  `length` tinyint(3) UNSIGNED DEFAULT NULL,
  `result` varchar(24) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `waypoints`
--

CREATE TABLE `waypoints` (
  `entry` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `pointid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `point_comment` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature waypoints' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `waypoint_data`
--

CREATE TABLE `waypoint_data` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `delay` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `move_type` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `action_chance` smallint(6) NOT NULL DEFAULT '100',
  `wpguid` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `waypoint_scripts`
--

CREATE TABLE `waypoint_scripts` (
  `id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `delay` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `command` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `datalong` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `datalong2` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `dataint` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_requirement`
--
ALTER TABLE `access_requirement`
  ADD PRIMARY KEY (`mapId`,`difficulty`);

--
-- Indexes for table `achievement_criteria_data`
--
ALTER TABLE `achievement_criteria_data`
  ADD PRIMARY KEY (`criteria_id`,`type`);

--
-- Indexes for table `achievement_dbc`
--
ALTER TABLE `achievement_dbc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `achievement_reward`
--
ALTER TABLE `achievement_reward`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `achievement_reward_locale`
--
ALTER TABLE `achievement_reward_locale`
  ADD PRIMARY KEY (`ID`,`Locale`);

--
-- Indexes for table `areatrigger_involvedrelation`
--
ALTER TABLE `areatrigger_involvedrelation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areatrigger_scripts`
--
ALTER TABLE `areatrigger_scripts`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `areatrigger_tavern`
--
ALTER TABLE `areatrigger_tavern`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areatrigger_teleport`
--
ALTER TABLE `areatrigger_teleport`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `areatrigger_teleport` ADD FULLTEXT KEY `name` (`Name`);

--
-- Indexes for table `battleground_template`
--
ALTER TABLE `battleground_template`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `battlemaster_entry`
--
ALTER TABLE `battlemaster_entry`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `broadcast_text`
--
ALTER TABLE `broadcast_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `broadcast_text_locale`
--
ALTER TABLE `broadcast_text_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`);

--
-- Indexes for table `creature`
--
ALTER TABLE `creature`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_map` (`map`),
  ADD KEY `idx_id` (`id`);

--
-- Indexes for table `creature_addon`
--
ALTER TABLE `creature_addon`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `creature_classlevelstats`
--
ALTER TABLE `creature_classlevelstats`
  ADD PRIMARY KEY (`level`,`class`);

--
-- Indexes for table `creature_equip_template`
--
ALTER TABLE `creature_equip_template`
  ADD PRIMARY KEY (`CreatureID`,`ID`);

--
-- Indexes for table `creature_formations`
--
ALTER TABLE `creature_formations`
  ADD PRIMARY KEY (`memberGUID`);

--
-- Indexes for table `creature_loot_template`
--
ALTER TABLE `creature_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `creature_model_info`
--
ALTER TABLE `creature_model_info`
  ADD PRIMARY KEY (`DisplayID`);

--
-- Indexes for table `creature_onkill_reputation`
--
ALTER TABLE `creature_onkill_reputation`
  ADD PRIMARY KEY (`creature_id`);

--
-- Indexes for table `creature_questender`
--
ALTER TABLE `creature_questender`
  ADD PRIMARY KEY (`id`,`quest`);

--
-- Indexes for table `creature_questitem`
--
ALTER TABLE `creature_questitem`
  ADD PRIMARY KEY (`CreatureEntry`,`Idx`);

--
-- Indexes for table `creature_queststarter`
--
ALTER TABLE `creature_queststarter`
  ADD PRIMARY KEY (`id`,`quest`);

--
-- Indexes for table `creature_template`
--
ALTER TABLE `creature_template`
  ADD PRIMARY KEY (`entry`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `creature_template_addon`
--
ALTER TABLE `creature_template_addon`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `creature_template_locale`
--
ALTER TABLE `creature_template_locale`
  ADD PRIMARY KEY (`entry`,`locale`);

--
-- Indexes for table `creature_text`
--
ALTER TABLE `creature_text`
  ADD PRIMARY KEY (`CreatureID`,`GroupID`,`ID`);

--
-- Indexes for table `creature_text_locale`
--
ALTER TABLE `creature_text_locale`
  ADD PRIMARY KEY (`CreatureID`,`GroupID`,`ID`);

--
-- Indexes for table `disables`
--
ALTER TABLE `disables`
  ADD PRIMARY KEY (`sourceType`,`entry`);

--
-- Indexes for table `disenchant_loot_template`
--
ALTER TABLE `disenchant_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `exploration_basexp`
--
ALTER TABLE `exploration_basexp`
  ADD PRIMARY KEY (`level`);

--
-- Indexes for table `fishing_loot_template`
--
ALTER TABLE `fishing_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `gameobject`
--
ALTER TABLE `gameobject`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `gameobject_addon`
--
ALTER TABLE `gameobject_addon`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `gameobject_loot_template`
--
ALTER TABLE `gameobject_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `gameobject_questender`
--
ALTER TABLE `gameobject_questender`
  ADD PRIMARY KEY (`id`,`quest`);

--
-- Indexes for table `gameobject_questitem`
--
ALTER TABLE `gameobject_questitem`
  ADD PRIMARY KEY (`GameObjectEntry`,`Idx`);

--
-- Indexes for table `gameobject_queststarter`
--
ALTER TABLE `gameobject_queststarter`
  ADD PRIMARY KEY (`id`,`quest`);

--
-- Indexes for table `gameobject_template`
--
ALTER TABLE `gameobject_template`
  ADD PRIMARY KEY (`entry`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `gameobject_template_addon`
--
ALTER TABLE `gameobject_template_addon`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `gameobject_template_locale`
--
ALTER TABLE `gameobject_template_locale`
  ADD PRIMARY KEY (`entry`,`locale`);

--
-- Indexes for table `game_event`
--
ALTER TABLE `game_event`
  ADD PRIMARY KEY (`eventEntry`);

--
-- Indexes for table `game_event_arena_seasons`
--
ALTER TABLE `game_event_arena_seasons`
  ADD UNIQUE KEY `season` (`season`,`eventEntry`);

--
-- Indexes for table `game_event_battleground_holiday`
--
ALTER TABLE `game_event_battleground_holiday`
  ADD PRIMARY KEY (`eventEntry`);

--
-- Indexes for table `game_event_condition`
--
ALTER TABLE `game_event_condition`
  ADD PRIMARY KEY (`eventEntry`,`condition_id`);

--
-- Indexes for table `game_event_creature`
--
ALTER TABLE `game_event_creature`
  ADD PRIMARY KEY (`guid`,`eventEntry`);

--
-- Indexes for table `game_event_creature_quest`
--
ALTER TABLE `game_event_creature_quest`
  ADD PRIMARY KEY (`id`,`quest`);

--
-- Indexes for table `game_event_gameobject`
--
ALTER TABLE `game_event_gameobject`
  ADD PRIMARY KEY (`guid`,`eventEntry`);

--
-- Indexes for table `game_event_gameobject_quest`
--
ALTER TABLE `game_event_gameobject_quest`
  ADD PRIMARY KEY (`id`,`quest`,`eventEntry`);

--
-- Indexes for table `game_event_model_equip`
--
ALTER TABLE `game_event_model_equip`
  ADD PRIMARY KEY (`guid`);

--
-- Indexes for table `game_event_npcflag`
--
ALTER TABLE `game_event_npcflag`
  ADD PRIMARY KEY (`guid`,`eventEntry`);

--
-- Indexes for table `game_event_npc_vendor`
--
ALTER TABLE `game_event_npc_vendor`
  ADD PRIMARY KEY (`guid`,`item`),
  ADD KEY `slot` (`slot`);

--
-- Indexes for table `game_event_pool`
--
ALTER TABLE `game_event_pool`
  ADD PRIMARY KEY (`pool_entry`);

--
-- Indexes for table `game_event_prerequisite`
--
ALTER TABLE `game_event_prerequisite`
  ADD PRIMARY KEY (`eventEntry`,`prerequisite_event`);

--
-- Indexes for table `game_event_quest_condition`
--
ALTER TABLE `game_event_quest_condition`
  ADD PRIMARY KEY (`quest`);

--
-- Indexes for table `game_event_seasonal_questrelation`
--
ALTER TABLE `game_event_seasonal_questrelation`
  ADD PRIMARY KEY (`questId`,`eventEntry`),
  ADD KEY `idx_quest` (`questId`);

--
-- Indexes for table `game_tele`
--
ALTER TABLE `game_tele`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_weather`
--
ALTER TABLE `game_weather`
  ADD PRIMARY KEY (`zone`);

--
-- Indexes for table `gossip_menu`
--
ALTER TABLE `gossip_menu`
  ADD PRIMARY KEY (`MenuID`,`TextID`);

--
-- Indexes for table `gossip_menu_option`
--
ALTER TABLE `gossip_menu_option`
  ADD PRIMARY KEY (`MenuID`,`OptionID`);

--
-- Indexes for table `gossip_menu_option_locale`
--
ALTER TABLE `gossip_menu_option_locale`
  ADD PRIMARY KEY (`MenuID`,`OptionID`,`Locale`);

--
-- Indexes for table `graveyard_zone`
--
ALTER TABLE `graveyard_zone`
  ADD PRIMARY KEY (`ID`,`GhostZone`);

--
-- Indexes for table `instance_encounters`
--
ALTER TABLE `instance_encounters`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `instance_spawn_groups`
--
ALTER TABLE `instance_spawn_groups`
  ADD PRIMARY KEY (`instanceMapId`,`bossStateId`,`spawnGroupId`,`bossStates`);

--
-- Indexes for table `instance_template`
--
ALTER TABLE `instance_template`
  ADD PRIMARY KEY (`map`);

--
-- Indexes for table `item_enchantment_template`
--
ALTER TABLE `item_enchantment_template`
  ADD PRIMARY KEY (`entry`,`ench`);

--
-- Indexes for table `item_loot_template`
--
ALTER TABLE `item_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `item_set_names`
--
ALTER TABLE `item_set_names`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `item_set_names_locale`
--
ALTER TABLE `item_set_names_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `item_template`
--
ALTER TABLE `item_template`
  ADD PRIMARY KEY (`entry`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `items_index` (`class`);

--
-- Indexes for table `item_template_locale`
--
ALTER TABLE `item_template_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `lfg_dungeon_rewards`
--
ALTER TABLE `lfg_dungeon_rewards`
  ADD PRIMARY KEY (`dungeonId`,`maxLevel`);

--
-- Indexes for table `lfg_dungeon_template`
--
ALTER TABLE `lfg_dungeon_template`
  ADD PRIMARY KEY (`dungeonId`);

--
-- Indexes for table `linked_respawn`
--
ALTER TABLE `linked_respawn`
  ADD PRIMARY KEY (`guid`,`linkType`);

--
-- Indexes for table `mail_level_reward`
--
ALTER TABLE `mail_level_reward`
  ADD PRIMARY KEY (`level`,`raceMask`);

--
-- Indexes for table `mail_loot_template`
--
ALTER TABLE `mail_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `milling_loot_template`
--
ALTER TABLE `milling_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `npc_spellclick_spells`
--
ALTER TABLE `npc_spellclick_spells`
  ADD PRIMARY KEY (`npc_entry`,`spell_id`);

--
-- Indexes for table `npc_text`
--
ALTER TABLE `npc_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `npc_text_locale`
--
ALTER TABLE `npc_text_locale`
  ADD PRIMARY KEY (`ID`,`Locale`);

--
-- Indexes for table `npc_trainer`
--
ALTER TABLE `npc_trainer`
  ADD PRIMARY KEY (`ID`,`SpellID`);

--
-- Indexes for table `npc_vendor`
--
ALTER TABLE `npc_vendor`
  ADD PRIMARY KEY (`entry`,`item`,`ExtendedCost`),
  ADD KEY `slot` (`slot`);

--
-- Indexes for table `outdoorpvp_template`
--
ALTER TABLE `outdoorpvp_template`
  ADD PRIMARY KEY (`TypeId`);

--
-- Indexes for table `page_text`
--
ALTER TABLE `page_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `page_text_locale`
--
ALTER TABLE `page_text_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `pet_levelstats`
--
ALTER TABLE `pet_levelstats`
  ADD PRIMARY KEY (`creature_entry`,`level`);

--
-- Indexes for table `pet_name_generation`
--
ALTER TABLE `pet_name_generation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickpocketing_loot_template`
--
ALTER TABLE `pickpocketing_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `playercreateinfo`
--
ALTER TABLE `playercreateinfo`
  ADD PRIMARY KEY (`race`,`class`);

--
-- Indexes for table `playercreateinfo_action`
--
ALTER TABLE `playercreateinfo_action`
  ADD PRIMARY KEY (`race`,`class`,`button`),
  ADD KEY `playercreateinfo_race_class_index` (`race`,`class`);

--
-- Indexes for table `playercreateinfo_item`
--
ALTER TABLE `playercreateinfo_item`
  ADD PRIMARY KEY (`race`,`class`,`itemid`),
  ADD KEY `playercreateinfo_race_class_index` (`race`,`class`);

--
-- Indexes for table `playercreateinfo_skills`
--
ALTER TABLE `playercreateinfo_skills`
  ADD PRIMARY KEY (`raceMask`,`classMask`,`skill`);

--
-- Indexes for table `playercreateinfo_spell_custom`
--
ALTER TABLE `playercreateinfo_spell_custom`
  ADD PRIMARY KEY (`racemask`,`classmask`,`Spell`);

--
-- Indexes for table `player_classlevelstats`
--
ALTER TABLE `player_classlevelstats`
  ADD PRIMARY KEY (`class`,`level`);

--
-- Indexes for table `player_factionchange_achievement`
--
ALTER TABLE `player_factionchange_achievement`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`);

--
-- Indexes for table `player_factionchange_items`
--
ALTER TABLE `player_factionchange_items`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`);

--
-- Indexes for table `player_factionchange_quests`
--
ALTER TABLE `player_factionchange_quests`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`),
  ADD UNIQUE KEY `alliance_uniq` (`alliance_id`),
  ADD UNIQUE KEY `horde_uniq` (`horde_id`);

--
-- Indexes for table `player_factionchange_reputations`
--
ALTER TABLE `player_factionchange_reputations`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`);

--
-- Indexes for table `player_factionchange_spells`
--
ALTER TABLE `player_factionchange_spells`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`);

--
-- Indexes for table `player_factionchange_titles`
--
ALTER TABLE `player_factionchange_titles`
  ADD PRIMARY KEY (`alliance_id`,`horde_id`);

--
-- Indexes for table `player_levelstats`
--
ALTER TABLE `player_levelstats`
  ADD PRIMARY KEY (`race`,`class`,`level`);

--
-- Indexes for table `player_xp_for_level`
--
ALTER TABLE `player_xp_for_level`
  ADD PRIMARY KEY (`Level`);

--
-- Indexes for table `points_of_interest`
--
ALTER TABLE `points_of_interest`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `points_of_interest_locale`
--
ALTER TABLE `points_of_interest_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `pool_creature`
--
ALTER TABLE `pool_creature`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `pool_gameobject`
--
ALTER TABLE `pool_gameobject`
  ADD PRIMARY KEY (`guid`),
  ADD KEY `idx_guid` (`guid`);

--
-- Indexes for table `pool_pool`
--
ALTER TABLE `pool_pool`
  ADD PRIMARY KEY (`pool_id`);

--
-- Indexes for table `pool_quest`
--
ALTER TABLE `pool_quest`
  ADD PRIMARY KEY (`entry`),
  ADD KEY `idx_guid` (`entry`);

--
-- Indexes for table `pool_template`
--
ALTER TABLE `pool_template`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `prospecting_loot_template`
--
ALTER TABLE `prospecting_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `quest_details`
--
ALTER TABLE `quest_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_mail_sender`
--
ALTER TABLE `quest_mail_sender`
  ADD PRIMARY KEY (`QuestId`);

--
-- Indexes for table `quest_offer_reward`
--
ALTER TABLE `quest_offer_reward`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_poi`
--
ALTER TABLE `quest_poi`
  ADD PRIMARY KEY (`QuestID`,`id`),
  ADD KEY `idx` (`QuestID`,`id`);

--
-- Indexes for table `quest_poi_points`
--
ALTER TABLE `quest_poi_points`
  ADD PRIMARY KEY (`QuestID`,`Idx1`,`Idx2`),
  ADD KEY `questId_id` (`QuestID`,`Idx1`);

--
-- Indexes for table `quest_request_items`
--
ALTER TABLE `quest_request_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_template`
--
ALTER TABLE `quest_template`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_template_addon`
--
ALTER TABLE `quest_template_addon`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `quest_template_locale`
--
ALTER TABLE `quest_template_locale`
  ADD PRIMARY KEY (`ID`,`locale`);

--
-- Indexes for table `reference_loot_template`
--
ALTER TABLE `reference_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `reputation_reward_rate`
--
ALTER TABLE `reputation_reward_rate`
  ADD PRIMARY KEY (`faction`);

--
-- Indexes for table `reputation_spillover_template`
--
ALTER TABLE `reputation_spillover_template`
  ADD PRIMARY KEY (`faction`);

--
-- Indexes for table `script_spline_chain_meta`
--
ALTER TABLE `script_spline_chain_meta`
  ADD PRIMARY KEY (`entry`,`chainId`,`splineId`) USING BTREE;

--
-- Indexes for table `script_spline_chain_waypoints`
--
ALTER TABLE `script_spline_chain_waypoints`
  ADD PRIMARY KEY (`entry`,`chainId`,`splineId`,`wpId`) USING BTREE;

--
-- Indexes for table `script_waypoint`
--
ALTER TABLE `script_waypoint`
  ADD PRIMARY KEY (`entry`,`pointid`);

--
-- Indexes for table `skill_discovery_template`
--
ALTER TABLE `skill_discovery_template`
  ADD PRIMARY KEY (`spellId`,`reqSpell`);

--
-- Indexes for table `skill_extra_item_template`
--
ALTER TABLE `skill_extra_item_template`
  ADD PRIMARY KEY (`spellId`);

--
-- Indexes for table `skill_fishing_base_level`
--
ALTER TABLE `skill_fishing_base_level`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `skill_perfect_item_template`
--
ALTER TABLE `skill_perfect_item_template`
  ADD PRIMARY KEY (`spellId`);

--
-- Indexes for table `skinning_loot_template`
--
ALTER TABLE `skinning_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `smart_scripts`
--
ALTER TABLE `smart_scripts`
  ADD PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`);

--
-- Indexes for table `spawn_group`
--
ALTER TABLE `spawn_group`
  ADD PRIMARY KEY (`groupId`,`spawnType`,`spawnId`);

--
-- Indexes for table `spawn_group_template`
--
ALTER TABLE `spawn_group_template`
  ADD PRIMARY KEY (`groupId`);

--
-- Indexes for table `spelldifficulty_dbc`
--
ALTER TABLE `spelldifficulty_dbc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spell_area`
--
ALTER TABLE `spell_area`
  ADD PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`racemask`,`gender`);

--
-- Indexes for table `spell_bonus_data`
--
ALTER TABLE `spell_bonus_data`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `spell_custom_attr`
--
ALTER TABLE `spell_custom_attr`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `spell_dbc`
--
ALTER TABLE `spell_dbc`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `spell_enchant_proc_data`
--
ALTER TABLE `spell_enchant_proc_data`
  ADD PRIMARY KEY (`EnchantID`);

--
-- Indexes for table `spell_group`
--
ALTER TABLE `spell_group`
  ADD PRIMARY KEY (`id`,`spell_id`);

--
-- Indexes for table `spell_group_stack_rules`
--
ALTER TABLE `spell_group_stack_rules`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `spell_learn_spell`
--
ALTER TABLE `spell_learn_spell`
  ADD PRIMARY KEY (`entry`,`SpellID`);

--
-- Indexes for table `spell_linked_spell`
--
ALTER TABLE `spell_linked_spell`
  ADD UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`);

--
-- Indexes for table `spell_loot_template`
--
ALTER TABLE `spell_loot_template`
  ADD PRIMARY KEY (`Entry`,`Item`);

--
-- Indexes for table `spell_pet_auras`
--
ALTER TABLE `spell_pet_auras`
  ADD PRIMARY KEY (`spell`,`effectId`,`pet`);

--
-- Indexes for table `spell_proc`
--
ALTER TABLE `spell_proc`
  ADD PRIMARY KEY (`SpellId`);

--
-- Indexes for table `spell_ranks`
--
ALTER TABLE `spell_ranks`
  ADD PRIMARY KEY (`first_spell_id`,`rank`),
  ADD UNIQUE KEY `spell_id` (`spell_id`);

--
-- Indexes for table `spell_required`
--
ALTER TABLE `spell_required`
  ADD PRIMARY KEY (`spell_id`,`req_spell`);

--
-- Indexes for table `spell_script_names`
--
ALTER TABLE `spell_script_names`
  ADD UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`);

--
-- Indexes for table `spell_target_position`
--
ALTER TABLE `spell_target_position`
  ADD PRIMARY KEY (`ID`,`EffectIndex`);

--
-- Indexes for table `spell_threat`
--
ALTER TABLE `spell_threat`
  ADD PRIMARY KEY (`entry`);

--
-- Indexes for table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`guid`),
  ADD UNIQUE KEY `idx_entry` (`entry`);

--
-- Indexes for table `trinity_string`
--
ALTER TABLE `trinity_string`
  ADD PRIMARY KEY (`entry`);

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
-- Indexes for table `vehicle_accessory`
--
ALTER TABLE `vehicle_accessory`
  ADD PRIMARY KEY (`guid`,`seat_id`);

--
-- Indexes for table `vehicle_template_accessory`
--
ALTER TABLE `vehicle_template_accessory`
  ADD PRIMARY KEY (`entry`,`seat_id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`core_version`);

--
-- Indexes for table `warden_checks`
--
ALTER TABLE `warden_checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waypoints`
--
ALTER TABLE `waypoints`
  ADD PRIMARY KEY (`entry`,`pointid`);

--
-- Indexes for table `waypoint_data`
--
ALTER TABLE `waypoint_data`
  ADD PRIMARY KEY (`id`,`point`);

--
-- Indexes for table `waypoint_scripts`
--
ALTER TABLE `waypoint_scripts`
  ADD PRIMARY KEY (`guid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creature`
--
ALTER TABLE `creature`
  MODIFY `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier', AUTO_INCREMENT=1022682;
--
-- AUTO_INCREMENT for table `gameobject`
--
ALTER TABLE `gameobject`
  MODIFY `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier', AUTO_INCREMENT=255094;
--
-- AUTO_INCREMENT for table `game_tele`
--
ALTER TABLE `game_tele`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1433;
--
-- AUTO_INCREMENT for table `pet_name_generation`
--
ALTER TABLE `pet_name_generation`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;
--
-- AUTO_INCREMENT for table `transports`
--
ALTER TABLE `transports`
  MODIFY `guid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `warden_checks`
--
ALTER TABLE `warden_checks`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
