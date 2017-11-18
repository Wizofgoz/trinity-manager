-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2017 at 11:16 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.1.11-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth`
--
CREATE DATABASE IF NOT EXISTS `auth` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `auth`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `expansion` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verification_token` text,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';

-- --------------------------------------------------------

--
-- Table structure for table `account_access`
--

CREATE TABLE `account_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `gmlevel` tinyint(3) UNSIGNED NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_banned`
--

CREATE TABLE `account_banned` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `unbandate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- --------------------------------------------------------

--
-- Table structure for table `account_muted`
--

CREATE TABLE `account_muted` (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mutetime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';

-- --------------------------------------------------------

--
-- Table structure for table `autobroadcast`
--

CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) UNSIGNED NOT NULL,
  `weight` tinyint(3) UNSIGNED DEFAULT '1',
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip2nation`
--

CREATE TABLE `ip2nation` (
  `ip` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip2nationCountries`
--

CREATE TABLE `ip2nationCountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_banned`
--

CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) UNSIGNED NOT NULL,
  `unbandate` int(10) UNSIGNED NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `time` int(10) UNSIGNED NOT NULL,
  `realm` int(10) UNSIGNED NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs_ip_actions`
--

CREATE TABLE `logs_ip_actions` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Unique Identifier',
  `account_id` int(10) UNSIGNED NOT NULL COMMENT 'Account ID',
  `character_guid` int(10) UNSIGNED NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) UNSIGNED NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int(10) UNSIGNED NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rbac_account_permissions`
--

CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) UNSIGNED NOT NULL COMMENT 'Account id',
  `permissionId` int(10) UNSIGNED NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

-- --------------------------------------------------------

--
-- Table structure for table `rbac_default_permissions`
--

CREATE TABLE `rbac_default_permissions` (
  `secId` int(10) UNSIGNED NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) UNSIGNED NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';

-- --------------------------------------------------------

--
-- Table structure for table `rbac_linked_permissions`
--

CREATE TABLE `rbac_linked_permissions` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) UNSIGNED NOT NULL COMMENT 'Linked Permission id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';

-- --------------------------------------------------------

--
-- Table structure for table `rbac_permissions`
--

CREATE TABLE `rbac_permissions` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- --------------------------------------------------------

--
-- Table structure for table `realmcharacters`
--

CREATE TABLE `realmcharacters` (
  `realmid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `acctid` int(10) UNSIGNED NOT NULL,
  `numchars` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- --------------------------------------------------------

--
-- Table structure for table `realmlist`
--

CREATE TABLE `realmlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) UNSIGNED NOT NULL DEFAULT '8085',
  `icon` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `flag` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `timezone` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `population` float UNSIGNED NOT NULL DEFAULT '0',
  `gamebuild` int(10) UNSIGNED NOT NULL DEFAULT '12340'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `uptime`
--

CREATE TABLE `uptime` (
  `realmid` int(10) UNSIGNED NOT NULL,
  `starttime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uptime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`username`);

--
-- Indexes for table `account_access`
--
ALTER TABLE `account_access`
  ADD PRIMARY KEY (`id`,`RealmID`);

--
-- Indexes for table `account_banned`
--
ALTER TABLE `account_banned`
  ADD PRIMARY KEY (`id`,`bandate`);

--
-- Indexes for table `account_muted`
--
ALTER TABLE `account_muted`
  ADD PRIMARY KEY (`guid`,`mutedate`);

--
-- Indexes for table `autobroadcast`
--
ALTER TABLE `autobroadcast`
  ADD PRIMARY KEY (`id`,`realmid`);

--
-- Indexes for table `ip2nation`
--
ALTER TABLE `ip2nation`
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `ip2nationCountries`
--
ALTER TABLE `ip2nationCountries`
  ADD PRIMARY KEY (`code`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `ip_banned`
--
ALTER TABLE `ip_banned`
  ADD PRIMARY KEY (`ip`,`bandate`);

--
-- Indexes for table `logs_ip_actions`
--
ALTER TABLE `logs_ip_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `rbac_account_permissions`
--
ALTER TABLE `rbac_account_permissions`
  ADD PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  ADD KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`);

--
-- Indexes for table `rbac_default_permissions`
--
ALTER TABLE `rbac_default_permissions`
  ADD PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  ADD KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`);

--
-- Indexes for table `rbac_linked_permissions`
--
ALTER TABLE `rbac_linked_permissions`
  ADD PRIMARY KEY (`id`,`linkedId`),
  ADD KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  ADD KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`);

--
-- Indexes for table `rbac_permissions`
--
ALTER TABLE `rbac_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realmcharacters`
--
ALTER TABLE `realmcharacters`
  ADD PRIMARY KEY (`realmid`,`acctid`),
  ADD KEY `acctid` (`acctid`);

--
-- Indexes for table `realmlist`
--
ALTER TABLE `realmlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

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
-- Indexes for table `uptime`
--
ALTER TABLE `uptime`
  ADD PRIMARY KEY (`realmid`,`starttime`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `autobroadcast`
--
ALTER TABLE `autobroadcast`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs_ip_actions`
--
ALTER TABLE `logs_ip_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier', AUTO_INCREMENT=309;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `realmlist`
--
ALTER TABLE `realmlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rbac_account_permissions`
--
ALTER TABLE `rbac_account_permissions`
  ADD CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rbac_default_permissions`
--
ALTER TABLE `rbac_default_permissions`
  ADD CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`);

--
-- Constraints for table `rbac_linked_permissions`
--
ALTER TABLE `rbac_linked_permissions`
  ADD CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
