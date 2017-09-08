-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 12, 2016 at 02:14 PM
-- Server version: 5.5.47
-- PHP Version: 5.3.10-1ubuntu3.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sitads`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
CREATE TABLE IF NOT EXISTS `ad` (
  `adID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adName` varchar(150) DEFAULT NULL,
  `adRedemptionCode` varchar(20) DEFAULT NULL,
  `adRedemptionPage` tinyint(1) DEFAULT '0',
  `adFreeText` text,
  `adFilename` varchar(80) NOT NULL DEFAULT '',
  `ad_campID` int(10) unsigned NOT NULL DEFAULT '0',
  `adAltText` varchar(150) DEFAULT NULL COMMENT 'remove me after x71',
  `adWidth` int(11) NOT NULL DEFAULT '0',
  `adHeight` int(11) NOT NULL DEFAULT '0',
  `adInactive` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'not used after x71',
  `adActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adID`),
  KEY `ad_banner_adCampaignID` (`ad_campID`),
  KEY `adWidth` (`adWidth`),
  KEY `adHeight` (`adHeight`),
  KEY `adActive` (`adActive`),
  KEY `adRedeptionCode` (`adRedemptionCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=2185 ;

-- --------------------------------------------------------

--
-- Table structure for table `ad_click`
--

DROP TABLE IF EXISTS `ad_click`;
CREATE TABLE IF NOT EXISTS `ad_click` (
  `adClickID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adClickIP` varchar(20) NOT NULL DEFAULT '',
  `adClickDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adClick_customerID` int(11) NOT NULL DEFAULT '0',
  `adClick_comCode` varchar(60) NOT NULL DEFAULT '',
  `adClick_adID` int(10) unsigned NOT NULL DEFAULT '0',
  `adClick_zoneCode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`adClickID`),
  KEY `adClickID` (`adClickID`),
  KEY `adClickDate` (`adClickDate`),
  KEY `adClick_adID` (`adClick_adID`),
  KEY `adClick_zoneCode` (`adClick_zoneCode`),
  KEY `adClick_customerID` (`adClick_customerID`),
  KEY `adClick_comCode` (`adClick_comCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=217330 ;

-- --------------------------------------------------------

--
-- Table structure for table `ad_view`
--

DROP TABLE IF EXISTS `ad_view`;
CREATE TABLE IF NOT EXISTS `ad_view` (
  `adViewID` bigint(20) NOT NULL AUTO_INCREMENT,
  `adViewIP` varchar(20) NOT NULL DEFAULT '',
  `adViewDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adView_customerID` int(11) NOT NULL DEFAULT '0',
  `adView_comCode` varchar(20) NOT NULL DEFAULT '',
  `adView_adID` int(11) NOT NULL DEFAULT '0',
  `adView_zoneCode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`adViewID`),
  KEY `adViewID` (`adViewID`),
  KEY `adView_adID` (`adView_adID`),
  KEY `adViewDate` (`adViewDate`),
  KEY `adView_zoneCode` (`adView_zoneCode`),
  KEY `ad_customerID` (`adView_customerID`),
  KEY `adView_comCode` (`adView_comCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53758785 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
  `campID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campName` varchar(100) NOT NULL DEFAULT '',
  `campDesc` text,
  `campURL` varchar(150) NOT NULL DEFAULT '',
  `campEmail` varchar(50) NOT NULL DEFAULT '',
  `campSdate` date NOT NULL DEFAULT '0000-00-00',
  `campEdate` date NOT NULL DEFAULT '0000-00-00',
  `campActive` tinyint(1) NOT NULL DEFAULT '0',
  `campGlobal` tinyint(4) NOT NULL DEFAULT '0',
  `campPriority` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`campID`),
  KEY `adCampaignSdate` (`campSdate`),
  KEY `adCampaignEdate` (`campEdate`),
  KEY `adCampaignActive` (`campActive`),
  KEY `adCampaignPriority` (`campPriority`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 PACK_KEYS=1 AUTO_INCREMENT=1402 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_company`
--

DROP TABLE IF EXISTS `camp_company`;
CREATE TABLE IF NOT EXISTS `camp_company` (
  `cpID` int(11) NOT NULL AUTO_INCREMENT,
  `cp_campID` int(11) NOT NULL DEFAULT '0',
  `cp_comCode` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`cpID`),
  KEY `publisherid` (`cp_campID`),
  KEY `cpID` (`cpID`),
  KEY `camp_companycode` (`cp_comCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5217 ;

-- --------------------------------------------------------

--
-- Table structure for table `camp_zone`
--

DROP TABLE IF EXISTS `camp_zone`;
CREATE TABLE IF NOT EXISTS `camp_zone` (
  `cz_campID` int(4) NOT NULL DEFAULT '0',
  `cz_zoneCode` varchar(10) NOT NULL DEFAULT '0',
  KEY `cz_campID` (`cz_campID`,`cz_zoneCode`),
  KEY `cz_zoneCode` (`cz_zoneCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `zoneCode` varchar(10) NOT NULL DEFAULT '',
  `zoneName` varchar(40) NOT NULL DEFAULT '',
  `zoneWidth` int(11) NOT NULL DEFAULT '0',
  `zoneHeight` int(11) NOT NULL DEFAULT '0',
  `zone_comCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`zoneCode`),
  KEY `zoneCode` (`zoneCode`),
  KEY `zoneWidth` (`zoneWidth`),
  KEY `zoneHeight` (`zoneHeight`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 PACK_KEYS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
