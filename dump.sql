-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: magento14
-- ------------------------------------------------------
-- Server version	5.5.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_assert`
--

DROP TABLE IF EXISTS `admin_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_assert`
--

LOCK TABLES `admin_assert` WRITE;
/*!40000 ALTER TABLE `admin_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES (1,0,1,1,'G',0,'Administrators');
INSERT INTO `admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES (3,1,2,0,'U',1,'Sergey');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_rule`
--

DROP TABLE IF EXISTS `admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_admin_rule` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_rule`
--

LOCK TABLES `admin_rule` WRITE;
/*!40000 ALTER TABLE `admin_rule` DISABLE KEYS */;
INSERT INTO `admin_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `assert_id`, `role_type`, `permission`) VALUES (1,1,'all','',0,'G','allow');
/*!40000 ALTER TABLE `admin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `logdate` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`) VALUES (1,'Sergey','L','nfxpnk@gmail.com','admin','04cbc7627bec5d8908678ad1f22aa46f:ZI','2013-03-06 13:52:50','2013-03-06 13:52:50',NULL,0,0,1,'N;');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url` varchar(255) NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_remove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_SEVERITY` (`severity`),
  KEY `IDX_IS_READ` (`is_read`),
  KEY `IDX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (1,4,'2008-07-25 05:24:40','Magento 1.1 Production Version Now Available','We are thrilled to announce the availability of the production release of Magento 1.1. Read more about the release in the Magento Blog.','http://www.magentocommerce.com/blog/comments/magento-11-is-here-1/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (2,4,'2008-08-02 05:30:16','Updated iPhone Theme is now available','Updated iPhone theme for Magento 1.1 is now available on Magento Connect and for upgrade through your Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/updated-iphone-theme-for-magento-11-is-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (3,3,'2008-08-02 05:40:27','Magento version 1.1.2 is now available','Magento version 1.1.2 is now available for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-version-112-is-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (4,3,'2008-08-13 21:51:46','Magento version 1.1.3 is now available','Magento version 1.1.3 is now available','http://www.magentocommerce.com/blog/comments/magento-version-113-is-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (5,1,'2008-09-03 01:10:31','Magento Version 1.1.4 Security Update Now Available','Magento 1.1.4 Security Update Now Available. If you are using Magento version 1.1.x, we highly recommend upgrading to this version as soon as possible.','http://www.magentocommerce.com/blog/comments/magento-version-114-security-update/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (6,3,'2008-09-16 02:09:54','Magento version 1.1.5 Now Available','Magento version 1.1.5 Now Available.\n\nThis release includes many bug fixes, a new category manager and a new skin for the default Magento theme.','http://www.magentocommerce.com/blog/comments/magento-version-115-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (7,3,'2008-09-18 00:18:35','Magento version 1.1.6 Now Available','Magento version 1.1.6 Now Available.\n\nThis version includes bug fixes for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-116-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (8,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (9,3,'2008-11-20 06:31:12','Magento version 1.1.7 Now Available','Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option','http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (10,3,'2008-11-27 02:24:50','Magento Version 1.1.8 Now Available','Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (11,3,'2008-12-30 12:45:59','Magento version 1.2.0 is now available for download and upgrade','We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2','http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (12,2,'2008-12-31 02:59:22','Magento version 1.2.0.1 now available','Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1201-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (13,2,'2009-01-13 01:41:49','Magento version 1.2.0.2 now available','Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (14,3,'2009-01-24 05:25:56','Magento version 1.2.0.3 now available','Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (15,3,'2009-02-03 02:57:00','Magento version 1.2.1 is now available for download and upgrade','We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (16,3,'2009-02-24 05:45:47','Magento version 1.2.1.1 now available','Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (17,3,'2009-02-27 06:39:24','CSRF Attack Prevention','We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/','http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (18,2,'2009-03-04 04:03:58','Magento version 1.2.1.2 now available','Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (19,3,'2009-03-31 06:22:40','Magento version 1.3.0 now available','Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (20,3,'2009-04-18 08:06:02','Magento version 1.3.1 now available','Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (21,3,'2009-05-20 02:31:21','Magento version 1.3.1.1 now available','Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.','http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (22,3,'2009-05-30 02:54:06','Magento version 1.3.2 now available','This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.','http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (23,3,'2009-06-01 23:32:52','Magento version 1.3.2.1 now available','Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.','http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (24,3,'2009-07-02 05:21:44','Magento version 1.3.2.2 now available','Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (25,3,'2009-07-23 10:48:54','Magento version 1.3.2.3 now available','Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (26,4,'2009-08-28 22:26:28','PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.','If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URLâ€˜s in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes','http://www.magentocommerce.com/wiki/paypal_payflow_changes',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (27,2,'2009-09-24 00:16:49','Magento Version 1.3.2.4 Security Update','Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (28,4,'2009-09-25 18:57:54','Magento Preview Version 1.4.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (29,4,'2009-10-07 04:55:40','Magento Preview Version 1.4.0.0-alpha3 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (30,4,'2009-12-09 04:30:36','Magento Preview Version 1.4.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (31,4,'2009-12-31 14:22:12','Magento Preview Version 1.4.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (32,4,'2010-02-13 08:39:53','Magento CE Version 1.4.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.','http://bit.ly/c53rpK',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (33,3,'2010-02-20 07:39:36','Magento CE Version 1.4.0.1 Stable is now available','Magento CE 1.4.0.1 Stable is now available for upgrade and download.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (34,4,'2010-04-24 00:09:03','Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure','Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.','http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (35,4,'2010-05-31 21:20:21','Announcing the Launch of Magento Mobile','The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with Magentoâ€™s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.','http://www.magentocommerce.com/product/mobile',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (36,4,'2010-06-11 00:08:08','Magento CE Version 1.4.1.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (37,4,'2010-07-27 01:37:34','Magento CE Version 1.4.1.1 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (38,4,'2010-07-28 09:12:12','Magento CE Version 1.4.2.0-beta1 Preview Release Now Available','This release gives a preview of the new Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (39,4,'2010-07-29 00:15:01','Magento CE Version 1.4.1.1 Patch Available','As some users experienced issues with upgrading to CE 1.4.1.1 through PEAR channels we provided a patch for it that is available on our blog http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (40,4,'2010-10-12 04:13:25','Magento Mobile is now live!','Magento Mobile is now live! Signup today to have your own native iPhone mobile-shopping app in iTunes for the holiday season! Learn more at http://www.magentomobile.com/','http://www.magentomobile.com/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (41,4,'2010-11-09 02:52:06','Magento CE Version 1.4.2.0-RC1 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC1 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (42,4,'2010-12-03 01:33:00','Magento CE Version 1.4.2.0-RC2 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC2 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (43,4,'2010-12-09 03:29:55','Magento CE Version 1.4.2.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1420-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (44,4,'2010-12-18 04:23:55','Magento Preview Version CE 1.5.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (45,4,'2010-12-30 04:51:08','Magento Preview Version CE 1.5.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (46,4,'2011-01-14 05:35:36','Magento Preview Version CE 1.5.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (47,4,'2011-01-22 02:19:09','Magento Preview Version CE 1.5.0.0-beta2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (48,4,'2011-01-28 02:27:57','Magento Preview Version CE 1.5.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (49,4,'2011-02-04 02:56:33','Magento Preview Version CE 1.5.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (50,4,'2011-02-09 00:43:23','Magento CE Version 1.5.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.5.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-community-professional-and-enterprise-editions-releases-now-availab/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (51,4,'2011-02-10 04:42:57','Magento CE 1.5.0.1 stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.0.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-1501-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (52,4,'2011-03-19 00:15:45','Magento CE 1.5.1.0-beta1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-beta1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (53,4,'2011-03-31 22:43:02','Magento CE 1.5.1.0-rc1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-rc1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (54,4,'2011-04-26 23:21:07','Magento CE 1.5.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1510-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (55,4,'2011-05-26 23:33:23','Magento Preview Version CE 1.6.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-alpha1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (56,4,'2011-06-15 22:12:08','Magento Preview Version CE 1.6.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-beta1for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (57,4,'2011-06-30 23:03:58','Magento Preview Version CE 1.6.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (58,4,'2011-07-11 23:07:39','Magento Preview Version CE 1.6.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc2-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (59,4,'2011-08-19 21:58:31','Magento CE 1.6.0.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1600-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (60,4,'2011-09-17 05:31:26','Magento Preview Version CE 1.6.1.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (61,4,'2011-09-29 19:44:10','Magento Preview Version CE 1.6.1.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (62,4,'2011-10-19 21:50:05','Magento CE 1.6.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1610-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (63,4,'2011-12-30 22:39:35','Magento Preview Version CE 1.7.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-alpha1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (64,4,'2012-01-11 22:24:20','Magento CE 1.6.2.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1620-stable-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (65,4,'2012-03-03 00:54:12','Magento Preview Version CE 1.7.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-beta1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (66,4,'2012-04-23 14:02:40','Magento Community Preview Version CE 1.7.0.0-RC1 has been released!','Learn more about the exciting new features and updates in this release and how you can take it for a test drive. As this is a preview version, we need to stress that it\'s likely unstable and that we DON\'T recommend that you use it in any production environment just yet.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-rc1-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (67,4,'2012-05-11 09:46:54','Magento Community 1.7 and Magento Enterprise 1.12 now available!','Learn more about the exciting new features and updates in these releases.','http://www.magentocommerce.com/blog/comments/magento-enterprise-112-and-community-17-now-available/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (68,4,'2012-06-20 18:54:07','Magento Community Edition 1.7.0.1 now available! ','We have just released an updated version of Magento Community Edition, version 1.7.0.1. This update delivers new, minor functionality and fixes for some potential security vulnerabilities.','http://www.magentocommerce.com/blog/comments/magento-community-edition-1701-released/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (69,4,'2012-07-05 19:21:43','Important Security Update - Zend Platform Vulnerability','We have recently learned of a serious vulnerability in the Zend platform on which Magento is built. Learn more and access a patch that addresses this issue. ','http://www.magentocommerce.com/blog/comments/important-security-update-zend-platform-vulnerability/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (70,4,'2012-11-19 20:27:42','Wrap up more holiday sales with financing','Give your customers up to 6 months financing. You get paid right away with Bill Me Later, a PayPal service. It’s a great way to extend financing in time for the holidays. Learn More.','http://www.magentocommerce.com/paypal/billmelater?utm_source=CEMessaging&utm_medium=copy&utm_content=sixmonths&utm_campaign=BML',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (71,4,'2012-12-07 11:22:30','Increase Your Sales With PayPal','Magento merchants using PayPal Express Checkout can help increase their sales on average 18%. It is one simple thing you can do right now to help boost your sales. Learn more.','http://www.magentocommerce.com/add-paypal?utm_source=CEModule&utm_medium=copy&utm_content=18&utm_campaign=choosepaypal',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (72,4,'2013-01-15 22:02:07','Imagine 2013 Registration is Now Open!','Join 1500 merchants, partners, developers and enthusiasts from 35+ countries around the world for Magento’s premier global conference! Collaborate, learn, network and get inspired by the future of eCommerce. Tickets will sell out fast! April 8th – 10th in Las Vegas.','https://registration.imagineecommerce.com/',0,0);
INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES (73,4,'2013-02-12 17:53:42','Get More eCommerce Power with Magento Enterprise','Limited time offer: Get a free, customized evaluation of your Community Edition site from a Magento Solution Partner. This evaluation gives you a clear look at the numerous benefits you can achieve by upgrading to Enterprise Edition. ','http://www.magentocommerce.com/community-to-enterprise?utm_source=CEMM&utm_medium=copy&utm_campaign=CE2EE',0,0);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assert`
--

DROP TABLE IF EXISTS `api_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assert_type` varchar(20) NOT NULL DEFAULT '',
  `assert_data` text,
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assert`
--

LOCK TABLES `api_assert` WRITE;
/*!40000 ALTER TABLE `api_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_role`
--

DROP TABLE IF EXISTS `api_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`),
  KEY `parent_id` (`parent_id`,`sort_order`),
  KEY `tree_level` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_role`
--

LOCK TABLES `api_role` WRITE;
/*!40000 ALTER TABLE `api_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rule`
--

DROP TABLE IF EXISTS `api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` varchar(255) NOT NULL DEFAULT '',
  `privileges` varchar(20) NOT NULL DEFAULT '',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` char(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `resource` (`resource_id`,`role_id`),
  KEY `role_id` (`role_id`,`resource_id`),
  CONSTRAINT `FK_api_rule` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rule`
--

LOCK TABLES `api_rule` WRITE;
/*!40000 ALTER TABLE `api_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_session`
--

DROP TABLE IF EXISTS `api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_session` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `logdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessid` varchar(40) NOT NULL DEFAULT '',
  KEY `API_SESSION_USER` (`user_id`),
  KEY `API_SESSION_SESSID` (`sessid`),
  CONSTRAINT `FK_API_SESSION_USER` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_session`
--

LOCK TABLES `api_session` WRITE;
/*!40000 ALTER TABLE `api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_user` (
  `user_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `api_key` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reload_acl_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user`
--

LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_idx`
--

LOCK TABLES `catalog_category_anc_categs_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  KEY `IDX_CATEGORY` (`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_tmp`
--

LOCK TABLES `catalog_category_anc_categs_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_idx`
--

LOCK TABLES `catalog_category_anc_products_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_tmp`
--

LOCK TABLES `catalog_category_anc_products_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `children_count` int(11) NOT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Category Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES (1,3,0,0,'0000-00-00 00:00:00','2013-03-06 13:43:36','1',0,0,1);
INSERT INTO `catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES (2,3,3,1,'2013-03-06 13:43:36','2013-03-06 13:43:36','1/2',1,1,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_EMTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (1,3,34,0,2,1);
INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (2,3,34,1,2,1);
INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (3,3,105,0,1,1);
INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (4,3,105,0,2,1);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (1,3,58,0,1,'');
INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (2,3,58,1,1,'');
INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (3,3,58,0,2,'');
INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (4,3,58,1,2,'');
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`) USING BTREE,
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (1,3,33,0,1,'Root Catalog');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (2,3,33,1,1,'Root Catalog');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (3,3,35,0,1,'root-catalog');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (4,3,33,0,2,'Default Category');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (5,3,33,1,2,'Default Category');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (6,3,41,1,2,'PRODUCTS');
INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES (7,3,35,0,2,'default-category');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY` (`category_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned DEFAULT NULL,
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `UNQ_CATEGORY_PRODUCT` (`category_id`,`product_id`,`store_id`),
  KEY `FK_CATALOG_CATEGORY_PRODUCT_INDEX_CATEGORY_ENTITY` (`category_id`),
  KEY `IDX_JOIN` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BASE` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_PROD_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_CATEGORY_PROD_IDX_CATEGORY_ENTITY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATEGORY_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visibility` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_idx`
--

LOCK TABLES `catalog_category_product_index_enbl_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visibility` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `IDX_PRODUCT` (`product_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_tmp`
--

LOCK TABLES `catalog_category_product_index_enbl_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_idx`
--

LOCK TABLES `catalog_category_product_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` tinyint(3) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_CUSTOMER` (`customer_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_PRODUCT` (`product_id`),
  KEY `IDX_VISITOR_PRODUCTS` (`visitor_id`,`product_id`),
  KEY `IDX_CUSTOMER_PRODUCTS` (`customer_id`,`product_id`),
  KEY `FK_CATALOG_COMPARE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `frontend_input_renderer` varchar(255) DEFAULT NULL,
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_searchable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_html_allowed_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_used_for_price_rules` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated after 1.4.0.1',
  `is_filterable_in_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_in_product_listing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_for_sort_by` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `apply_to` varchar(255) NOT NULL,
  `is_visible_in_advanced_search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `is_wysiwyg_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_used_for_promo_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (33,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (34,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (35,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (36,'',0,1,0,0,0,0,1,0,0,0,0,1,'',0,0,1,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (37,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (38,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (39,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (40,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (41,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (42,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (43,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (44,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (45,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (46,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (47,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (48,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (49,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (50,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (51,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (52,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (53,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (54,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (55,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (56,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (57,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (58,'adminhtml/catalog_category_helper_sortby_available',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (59,'adminhtml/catalog_category_helper_sortby_default',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (60,'',0,1,1,0,0,0,0,0,0,1,1,1,'',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (61,'',0,1,1,0,1,0,1,0,0,0,0,1,'',1,0,1,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (62,'',0,1,1,0,1,0,1,0,0,1,0,1,'',1,0,1,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (63,'',1,1,1,0,1,0,0,0,0,0,0,1,'',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (64,'',2,1,1,1,0,0,0,0,0,1,1,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (65,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (66,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (67,'',2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (68,'',2,1,0,0,0,0,0,0,0,0,0,1,'simple,virtual,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (69,'',1,1,0,0,0,0,0,0,0,0,0,1,'simple,bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (70,'',1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (71,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (72,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (73,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (74,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (75,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (76,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (77,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (78,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (79,'',2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (80,'',1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (81,'',2,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (82,'',2,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (83,'',1,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (84,'',2,1,1,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (85,'',2,1,1,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (86,'',0,1,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (87,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (88,'',0,0,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (89,'',1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (90,'',1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (91,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (92,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (93,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (94,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (95,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (96,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (97,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (98,'',1,0,0,0,0,0,0,0,0,1,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (99,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (100,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (101,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (102,'',0,0,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (103,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (104,'',1,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (105,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (106,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (107,'',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (108,'adminhtml/catalog_category_helper_pricestep',0,1,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (109,'',1,1,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (110,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (111,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (112,'',1,0,0,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (113,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (114,'',1,1,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (115,'',1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (116,'',1,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (117,'',0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (118,'',0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (119,'',1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0);
INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES (120,'',1,1,0,0,0,0,0,0,0,1,0,0,'',0,0,0,0);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` (`parent_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(3) unsigned NOT NULL,
  `min_price` decimal(12,4) NOT NULL,
  `max_price` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `selection_can_change_qty` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`selection_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` (`option_id`),
  KEY `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bundle Selections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `selection_price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `FK_BUNDLE_PRICE_SELECTION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BUNDLE_PRICE_SELECTION_ID` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`entity_id`,`stock_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_enabled_index`
--

DROP TABLE IF EXISTS `catalog_product_enabled_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UNQ_PRODUCT_STORE` (`product_id`,`store_id`),
  KEY `IDX_PRODUCT_VISIBILITY_IN_STORE` (`product_id`,`store_id`,`visibility`),
  KEY `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_enabled_index`
--

LOCK TABLES `catalog_product_enabled_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_enabled_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_enabled_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple',
  `sku` varchar(64) DEFAULT NULL,
  `has_options` smallint(1) NOT NULL DEFAULT '0',
  `required_options` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DATETIME_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DATETIME_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_DECIMAL_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_BASE` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_ATTRIBUTE_GALLERY_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_CATEGORY_ENTITY_GALLERY_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_GALLERY` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_MEDIA_GALLERY_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog product media gallery values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `all_groups` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_TIER_PRICE` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_TIER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_TIER_PRICE_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TIER_PRICE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_TIER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`,`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` (`store_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_PRODUCT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PROD_ENTITY_VARCHAR_PROD_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_ENTITY` (`entity_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `tier_percent` decimal(12,4) DEFAULT NULL,
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `alt_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `alt_tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `alt_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `alt_tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_type` tinyint(1) unsigned DEFAULT '0',
  `is_required` tinyint(1) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_type` tinyint(1) unsigned DEFAULT '0',
  `is_required` tinyint(1) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price_type` tinyint(1) unsigned NOT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `tier_percent` decimal(12,4) DEFAULT NULL,
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--

LOCK TABLES `catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--

LOCK TABLES `catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `orig_price` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  `base_tier` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--

LOCK TABLES `catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_idx`
--

LOCK TABLES `catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--

LOCK TABLES `catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `tax_class_id` smallint(5) unsigned DEFAULT '0',
  `price` decimal(12,4) DEFAULT NULL,
  `final_price` decimal(12,4) DEFAULT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  `max_price` decimal(12,4) DEFAULT NULL,
  `tier_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

LOCK TABLES `catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `min_price` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` (`customer_group_id`),
  KEY `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_tier_price`
--

LOCK TABLES `catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `rate` float(12,4) unsigned DEFAULT '1.0000',
  PRIMARY KEY (`website_id`),
  KEY `IDX_DATE` (`date`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_website`
--

LOCK TABLES `catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `IDX_UNIQUE` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `FK_LINK_PRODUCT` (`product_id`),
  KEY `FK_LINKED_PRODUCT` (`linked_product_id`),
  KEY `FK_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_PRODUCT_LINK_LINKED_PRODUCT` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link`
--

LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `product_link_attribute_code` varchar(32) NOT NULL DEFAULT '',
  `data_type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` (`link_type_id`),
  CONSTRAINT `FK_ATTRIBUTE_PRODUCT_LINK_TYPE` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Attributes for product link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute`
--

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (1,2,'qty','decimal');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (2,1,'position','int');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (3,4,'position','int');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (4,5,'position','int');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (6,1,'qty','decimal');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (7,3,'position','int');
INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES (8,3,'qty','decimal');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_DECIMAL_LINK` (`link_id`),
  CONSTRAINT `FK_DECIMAL_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DECIMAL_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--

LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned DEFAULT NULL,
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_INT_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_INT_PRODUCT_LINK` (`link_id`),
  CONSTRAINT `FK_INT_PRODUCT_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INT_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_link_attribute_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `link_id` int(11) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` (`product_link_attribute_id`),
  KEY `FK_VARCHAR_LINK` (`link_id`),
  CONSTRAINT `FK_VARCHAR_LINK` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_VARCHAR_PRODUCT_LINK_ATTRIBUTE` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar attributes values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--

LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Types of product link(Related, superproduct, bundles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_type`
--

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES (1,'relation');
INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES (2,'bundle');
INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES (3,'super');
INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES (4,'up_sell');
INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES (5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `is_require` tinyint(1) NOT NULL DEFAULT '1',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `max_characters` int(10) unsigned DEFAULT NULL,
  `file_extension` varchar(50) DEFAULT NULL,
  `image_size_x` smallint(5) unsigned NOT NULL,
  `image_size_y` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option`
--

LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_price`
--

LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_OPTION_STORE` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION` (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_title`
--

LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_price`
--

LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_OPTION_TYPE_STORE` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_title`
--

LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` (`option_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_value`
--

LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CHILD` (`child_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_CHILD` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_RELATION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_relation`
--

LOCK TABLES `catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_super_attribute_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute`
--

LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `use_default` tinyint(1) unsigned DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_ATTRIBUTE_STORE` (`product_super_attribute_id`,`store_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_LABEL` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PROD_SUPER_ATTR_LABEL_ATTR` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value_index` varchar(255) NOT NULL DEFAULT '',
  `is_percent` tinyint(1) unsigned DEFAULT '0',
  `pricing_value` decimal(10,4) DEFAULT NULL,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` (`product_super_attribute_id`),
  KEY `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_ATTRIBUTE_PRICING` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--

LOCK TABLES `catalog_product_super_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `FK_SUPER_PRODUCT_LINK_PARENT` (`parent_id`),
  KEY `FK_catalog_product_super_link` (`product_id`),
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUPER_PRODUCT_LINK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_link`
--

LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_WEBSITE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_website`
--

LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation`
--

DROP TABLE IF EXISTS `catalogindex_aggregation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation` (
  `aggregation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`aggregation_id`),
  UNIQUE KEY `IDX_STORE_KEY` (`store_id`,`key`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation`
--

LOCK TABLES `catalogindex_aggregation` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_code` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `IDX_CODE` (`tag_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation_tag`
--

LOCK TABLES `catalogindex_aggregation_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_aggregation_to_tag`
--

DROP TABLE IF EXISTS `catalogindex_aggregation_to_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_aggregation_to_tag` (
  `aggregation_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `IDX_AGGREGATION_TAG` (`aggregation_id`,`tag_id`),
  KEY `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` (`tag_id`),
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_AGGREGATION` FOREIGN KEY (`aggregation_id`) REFERENCES `catalogindex_aggregation` (`aggregation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_AGGREGATION_TO_TAG_TAG` FOREIGN KEY (`tag_id`) REFERENCES `catalogindex_aggregation_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_aggregation_to_tag`
--

LOCK TABLES `catalogindex_aggregation_to_tag` WRITE;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_aggregation_to_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_eav`
--

DROP TABLE IF EXISTS `catalogindex_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_eav` (
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`,`entity_id`,`attribute_id`,`value`),
  KEY `IDX_VALUE` (`value`),
  KEY `FK_CATALOGINDEX_EAV_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_EAV_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_EAV_STORE` (`store_id`),
  CONSTRAINT `FK_CATALOGINDEX_EAV_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_EAV_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_eav`
--

LOCK TABLES `catalogindex_eav` WRITE;
/*!40000 ALTER TABLE `catalogindex_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_minimal_price`
--

DROP TABLE IF EXISTS `catalogindex_minimal_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_minimal_price` (
  `index_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`index_id`),
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `FK_CI_MINIMAL_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`qty`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CI_MINIMAL_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_MINIMAL_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_minimal_price`
--

LOCK TABLES `catalogindex_minimal_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_minimal_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_minimal_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogindex_price`
--

DROP TABLE IF EXISTS `catalogindex_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogindex_price` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_class_id` smallint(6) NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  KEY `IDX_VALUE` (`value`),
  KEY `IDX_QTY` (`qty`),
  KEY `FK_CATALOGINDEX_PRICE_ENTITY` (`entity_id`),
  KEY `FK_CATALOGINDEX_PRICE_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CATALOGINDEX_PRICE_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_RANGE_VALUE` (`entity_id`,`attribute_id`,`customer_group_id`,`value`),
  KEY `FK_CI_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_FULL` (`entity_id`,`attribute_id`,`customer_group_id`,`value`,`website_id`),
  CONSTRAINT `FK_CI_PRICE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINDEX_PRICE_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogindex_price`
--

LOCK TABLES `catalogindex_price` WRITE;
/*!40000 ALTER TABLE `catalogindex_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogindex_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Catalog inventory Stocks list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock`
--

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` (`stock_id`, `stock_name`) VALUES (1,'Default');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_min_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_qty_decimal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backorders` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `use_config_backorders` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `use_config_min_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_max_sale_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_in_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `low_stock_date` datetime DEFAULT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  `use_config_notify_stock_qty` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_config_manage_stock` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `stock_status_changed_automatically` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_config_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `use_config_enable_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_qty_increments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `IDX_STOCK_PRODUCT` (`product_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` (`product_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` (`stock_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_ITEM_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inventory Stock Item Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_item`
--

LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status`
--

LOCK TABLES `cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

LOCK TABLES `cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `stock_id` smallint(4) unsigned NOT NULL,
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `stock_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_STOCK` (`stock_id`),
  KEY `FK_CATALOGINVENTORY_STOCK_STATUS_WEBSITE` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--

LOCK TABLES `cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL,
  `discount_amount` decimal(12,4) NOT NULL,
  `website_ids` text,
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule`
--

LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_affected_product`
--

DROP TABLE IF EXISTS `catalogrule_affected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_affected_product`
--

LOCK TABLES `catalogrule_affected_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_affected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_affected_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `rule_id` (`rule_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `website_id` (`website_id`),
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website`
--

LOCK TABLES `catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_operator` enum('to_fixed','to_percent','by_fixed','by_percent') NOT NULL DEFAULT 'to_fixed',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `action_stop` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `sort_order` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `FK_catalogrule_product_rule` (`rule_id`),
  KEY `FK_catalogrule_product_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_website` (`website_id`),
  KEY `IDX_FROM_TIME` (`from_time`),
  KEY `IDX_TO_TIME` (`to_time`),
  KEY `FK_CATALOGRULE_PRODUCT_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_rule` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product`
--

LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_date` date NOT NULL DEFAULT '0000-00-00',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL,
  `latest_start_date` date DEFAULT NULL,
  `earliest_end_date` date DEFAULT NULL,
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `rule_date` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `FK_catalogrule_product_price_customergroup` (`customer_group_id`),
  KEY `FK_catalogrule_product_price_website` (`website_id`),
  KEY `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_customergroup` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_catalogrule_product_price_website` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price`
--

LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_fulltext` (
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `data_index` longtext NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  FULLTEXT KEY `data_index` (`data_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_fulltext`
--

LOCK TABLES `catalogsearch_fulltext` WRITE;
/*!40000 ALTER TABLE `catalogsearch_fulltext` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_query`
--

DROP TABLE IF EXISTS `catalogsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query_text` varchar(255) NOT NULL DEFAULT '',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `synonym_for` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `display_in_terms` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `is_processed` tinyint(1) DEFAULT '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`query_id`),
  KEY `FK_CATALOGSEARCH_QUERY_STORE` (`store_id`),
  KEY `IDX_SEARCH_QUERY` (`query_text`,`store_id`,`popularity`),
  CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_query`
--

LOCK TABLES `catalogsearch_query` WRITE;
/*!40000 ALTER TABLE `catalogsearch_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_result`
--

DROP TABLE IF EXISTS `catalogsearch_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `relevance` decimal(6,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_QUERY` (`query_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_RELEVANCE` (`query_id`,`relevance`),
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_CATALOG_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_result`
--

LOCK TABLES `catalogsearch_result` WRITE;
/*!40000 ALTER TABLE `catalogsearch_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_height` varchar(25) DEFAULT NULL,
  `checkbox_text` text NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `is_html` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement`
--

LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `agreement_id` (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_CHECKOUT_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement_store`
--

LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS Blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES (5,'Footer Links','footer_links','<ul>\r\n<li><a href=\"{{store direct_url=\"about-magento-demo-store\"}}\">About Us</a></li>\r\n<li class=\"last\"><a href=\"{{store direct_url=\"customer-service\"}}\">Customer Service</a></li>\r\n</ul>','2013-03-06 15:43:01','2013-03-06 15:43:01',1);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `FK_CMS_BLOCK_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_BLOCK_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Blocks to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_store`
--

LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
INSERT INTO `cms_block_store` (`block_id`, `store_id`) VALUES (5,0);
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `root_template` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `content_heading` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  `creation_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `layout_update_xml` text,
  `custom_theme` varchar(100) DEFAULT NULL,
  `custom_root_template` varchar(255) NOT NULL DEFAULT '',
  `custom_layout_update_xml` text,
  `custom_theme_from` date DEFAULT NULL,
  `custom_theme_to` date DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES (1,'404 Not Found 1','two_columns_right','Page keywords','Page description','no-route','','<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2007-06-20 18:38:32','2007-08-26 19:11:13',1,0,NULL,NULL,'',NULL,NULL,NULL);
INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES (2,'Home page','two_columns_right','','','home','','<div class=\"page-title\"><h2>Home Page</h2></div>\r\n','2007-08-23 10:03:25','2007-09-06 13:26:53',1,0,'<!--<reference name=\"content\">\n<block type=\"catalog/product_new\" name=\"home.catalog.product.new\" alias=\"product_new\" template=\"catalog/product/new.phtml\" after=\"cms_page\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n<block type=\"reports/product_viewed\" name=\"home.reports.product.viewed\" alias=\"product_viewed\" template=\"reports/home_product_viewed.phtml\" after=\"product_new\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n<block type=\"reports/product_compared\" name=\"home.reports.product.compared\" template=\"reports/home_product_compared.phtml\" after=\"product_viewed\"><action method=\"addPriceBlockType\"><type>bundle</type><block>bundle/catalog_product_price</block><template>bundle/catalog/product/price.phtml</template></action></block>\n</reference><reference name=\"right\">\n<action method=\"unsetChild\"><alias>right.reports.product.viewed</alias></action>\n<action method=\"unsetChild\"><alias>right.reports.product.compared</alias></action>\n</reference>-->',NULL,'',NULL,NULL,NULL);
INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES (3,'About  Us','one_column','','','about-magento-demo-store','','<div class=\"page-title\">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class=\"col3-set\">\r\n<div class=\"col-1\"><p><a href=\"http://www.varien.com/\"><img src=\"{{skin url=\'images/media/about_us_img.jpg\'}}\" title=\"Varien\" alt=\"Varien\" /></a></p><p style=\"line-height:1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color:#888; font:1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class=\"col-2\">\r\n<p><strong style=\"color:#de036f;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class=\"col-3\">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style=\"color:#de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height:1.2em;\"><strong style=\"font:italic 2em Georgia, serif;\">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>','2007-08-30 14:01:18','2007-08-30 14:01:18',1,0,NULL,NULL,'',NULL,NULL,NULL);
INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES (4,'Customer Service','three_columns','','','customer-service','','<div class=\"page-title\">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class=\"disc\">\r\n<li><a href=\"#answer1\">Shipping &amp; Delivery</a></li>\r\n<li><a href=\"#answer2\">Privacy &amp; Security</a></li>\r\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\r\n<li><a href=\"#answer4\">Ordering</a></li>\r\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href=\"#answer6\">Viewing Orders</a></li>\r\n<li><a href=\"#answer7\">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer2\">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer4\">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer6\">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer7\">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>','2007-08-30 14:02:20','2007-08-30 14:03:37',1,0,NULL,NULL,'',NULL,NULL,NULL);
INSERT INTO `cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES (5,'Enable Cookies','one_column','','','enable-cookies','','<div class=\"std\">\r\n    <ul class=\"messages\">\r\n        <li class=\"notice-msg\">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class=\"page-title\">\r\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\r\n    <ul class=\"disc\">\r\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\r\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\r\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\r\n        <li><a href=\"#opera\">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n</div>\r\n','2013-03-06 13:43:04','2013-03-06 13:43:04',1,0,NULL,NULL,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `FK_CMS_PAGE_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_CMS_PAGE_STORE_PAGE` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_PAGE_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Pages to Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_store`
--

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES (1,0);
INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES (2,0);
INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES (3,0);
INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES (4,0);
INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES (5,0);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache` (
  `id` varchar(255) NOT NULL,
  `data` mediumblob,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache`
--

LOCK TABLES `core_cache` WRITE;
/*!40000 ALTER TABLE `core_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_option`
--

DROP TABLE IF EXISTS `core_cache_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL,
  `value` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_option`
--

LOCK TABLES `core_cache_option` WRITE;
/*!40000 ALTER TABLE `core_cache_option` DISABLE KEYS */;
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('block_html',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('collections',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('config',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('config_api',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('eav',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('layout',1);
INSERT INTO `core_cache_option` (`code`, `value`) VALUES ('translate',1);
/*!40000 ALTER TABLE `core_cache_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_tag`
--

DROP TABLE IF EXISTS `core_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_tag` (
  `tag` varchar(255) NOT NULL,
  `cache_id` varchar(255) NOT NULL,
  KEY `IDX_TAG` (`tag`),
  KEY `IDX_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_tag`
--

LOCK TABLES `core_cache_tag` WRITE;
/*!40000 ALTER TABLE `core_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` enum('default','websites','stores','config') NOT NULL DEFAULT 'default',
  `scope_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT 'general',
  `value` text NOT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_scope` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (1,'default',0,'catalog/category/root_id','2');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (2,'default',0,'admin/dashboard/enable_charts','1');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (3,'default',0,'web/unsecure/base_url','http://127.0.0.60/');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (4,'default',0,'web/secure/base_url','http://127.0.0.60/');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (5,'default',0,'general/locale/code','en_US');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (6,'default',0,'general/locale/timezone','America/Los_Angeles');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (7,'default',0,'currency/options/base','USD');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (8,'default',0,'currency/options/default','USD');
INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES (9,'default',0,'currency/options/allow','USD');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_email_template`
--

DROP TABLE IF EXISTS `core_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_email_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `orig_template_code` varchar(200) DEFAULT NULL,
  `orig_template_variables` text NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_email_template`
--

LOCK TABLES `core_email_template` WRITE;
/*!40000 ALTER TABLE `core_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_flag`
--

DROP TABLE IF EXISTS `core_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag_code` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag_data` text,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`flag_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_flag`
--

LOCK TABLES `core_flag` WRITE;
/*!40000 ALTER TABLE `core_flag` DISABLE KEYS */;
INSERT INTO `core_flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES (1,'admin_notification_survey',0,'a:1:{s:13:\"survey_viewed\";b:1;}','2013-03-06 13:52:53');
/*!40000 ALTER TABLE `core_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_link`
--

DROP TABLE IF EXISTS `core_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` varchar(64) NOT NULL DEFAULT '',
  `package` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `store_id` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `FK_core_layout_link_update` (`layout_update_id`),
  CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_LAYOUT_LINK_UPDATE` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_link`
--

LOCK TABLES `core_layout_link` WRITE;
/*!40000 ALTER TABLE `core_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_update`
--

DROP TABLE IF EXISTS `core_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `xml` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_update_id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_update`
--

LOCK TABLES `core_layout_update` WRITE;
/*!40000 ALTER TABLE `core_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `data_version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource version registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_resource`
--

LOCK TABLES `core_resource` WRITE;
/*!40000 ALTER TABLE `core_resource` DISABLE KEYS */;
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('adminnotification_setup','1.0.0','1.0.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('admin_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('api_setup','0.8.1','0.8.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('backup_setup','0.7.0','0.7.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('bundle_setup','0.1.13','0.1.13');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('catalogindex_setup','0.7.10','0.7.10');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('cataloginventory_setup','0.7.8','0.7.8');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('catalogrule_setup','0.7.10','0.7.10');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('catalogsearch_setup','0.7.7','0.7.7');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('catalog_setup','1.4.0.0.38','1.4.0.0.38');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('checkout_setup','0.9.5','0.9.5');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('cms_setup','0.7.13','0.7.13');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('compiler_setup','0.1.0','0.1.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('contacts_setup','0.8.0','0.8.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('core_setup','0.8.27','0.8.27');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('cron_setup','0.7.1','0.7.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('customer_setup','1.4.0.0.13','1.4.0.0.13');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('dataflow_setup','0.7.4','0.7.4');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('directory_setup','0.8.11','0.8.11');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('downloadable_setup','1.4.0.1','1.4.0.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('eav_setup','0.7.15','0.7.15');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('find_feed_setup','0.0.2','0.0.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('giftmessage_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('googlebase_setup','0.1.2','0.1.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('googlecheckout_setup','0.7.4','0.7.4');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('googleoptimizer_setup','0.1.2','0.1.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('index_setup','1.4.0.2','1.4.0.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('log_setup','0.7.7','0.7.7');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('moneybookers_setup','1.2.0.1','1.2.0.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('newsletter_setup','0.8.3','0.8.3');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('paygate_setup','0.7.1','0.7.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('payment_setup','0.7.0','0.7.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('paypaluk_setup','0.7.0','0.7.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('paypal_setup','1.4.0.1','1.4.0.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('poll_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('productalert_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('rating_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('reports_setup','0.7.10','0.7.10');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('review_setup','0.7.6','0.7.6');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('salesrule_setup','1.4.0.0.6','1.4.0.0.6');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('sales_setup','1.4.0.21','1.4.0.21');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('sendfriend_setup','0.7.4','0.7.4');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('shipping_setup','0.7.0','0.7.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('sitemap_setup','0.7.2','0.7.2');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('tag_setup','0.7.7','0.7.7');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('tax_setup','1.4.0.0','1.4.0.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('usa_setup','0.7.1','0.7.1');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('weee_setup','0.13','0.13');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('widget_setup','1.4.0.0.0','1.4.0.0.0');
INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES ('wishlist_setup','0.7.8','0.7.8');
/*!40000 ALTER TABLE `core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_session`
--

DROP TABLE IF EXISTS `core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `FK_SESSION_WEBSITE` (`website_id`),
  CONSTRAINT `FK_SESSION_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_session`
--

LOCK TABLES `core_session` WRITE;
/*!40000 ALTER TABLE `core_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `website_id` smallint(5) unsigned DEFAULT '0',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_STORE_WEBSITE` (`website_id`),
  KEY `is_active` (`is_active`,`sort_order`),
  KEY `FK_STORE_GROUP` (`group_id`),
  CONSTRAINT `FK_STORE_GROUP_STORE` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_STORE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES (0,'admin',0,0,'Admin',0,1);
INSERT INTO `core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES (1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store_group`
--

DROP TABLE IF EXISTS `core_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `FK_STORE_GROUP_WEBSITE` (`website_id`),
  KEY `default_store_id` (`default_store_id`),
  CONSTRAINT `FK_STORE_GROUP_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store_group`
--

LOCK TABLES `core_store_group` WRITE;
/*!40000 ALTER TABLE `core_store_group` DISABLE KEYS */;
INSERT INTO `core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES (0,0,'Default',0,0);
INSERT INTO `core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES (1,1,'Main Website Store',2,1);
/*!40000 ALTER TABLE `core_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_translate`
--

DROP TABLE IF EXISTS `core_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `translate` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `IDX_CODE` (`store_id`,`locale`,`string`),
  KEY `FK_CORE_TRANSLATE_STORE` (`store_id`),
  CONSTRAINT `FK_CORE_TRANSLATE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translation data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_translate`
--

LOCK TABLES `core_translate` WRITE;
/*!40000 ALTER TABLE `core_translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_url_rewrite`
--

DROP TABLE IF EXISTS `core_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `id_path` varchar(255) NOT NULL DEFAULT '',
  `request_path` varchar(255) NOT NULL DEFAULT '',
  `target_path` varchar(255) NOT NULL DEFAULT '',
  `is_system` tinyint(1) unsigned DEFAULT '1',
  `options` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_REQUEST_PATH` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_PATH` (`id_path`,`is_system`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_STORE` (`store_id`),
  KEY `IDX_ID_PATH` (`id_path`),
  KEY `IDX_TARGET_PATH` (`target_path`,`store_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT` (`product_id`),
  KEY `IDX_CATEGORY_REWRITE` (`category_id`,`is_system`,`product_id`,`store_id`,`id_path`),
  CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_url_rewrite`
--

LOCK TABLES `core_url_rewrite` WRITE;
/*!40000 ALTER TABLE `core_url_rewrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable`
--

DROP TABLE IF EXISTS `core_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable` (
  `variable_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable`
--

LOCK TABLES `core_variable` WRITE;
/*!40000 ALTER TABLE `core_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable_value`
--

DROP TABLE IF EXISTS `core_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable_value` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `plain_value` text NOT NULL,
  `html_value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_VARIABLE_STORE` (`variable_id`,`store_id`),
  KEY `IDX_VARIABLE_ID` (`variable_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable_value`
--

LOCK TABLES `core_variable_value` WRITE;
/*!40000 ALTER TABLE `core_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_website`
--

DROP TABLE IF EXISTS `core_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort_order` (`sort_order`),
  KEY `default_group_id` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_website`
--

LOCK TABLES `core_website` WRITE;
/*!40000 ALTER TABLE `core_website` DISABLE KEYS */;
INSERT INTO `core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES (0,'admin','Admin',0,0,0);
INSERT INTO `core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES (1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `core_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated`
--

DROP TABLE IF EXISTS `coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated`
--

LOCK TABLES `coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated_order`
--

DROP TABLE IF EXISTS `coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `coupon_code` varchar(50) NOT NULL DEFAULT '',
  `coupon_uses` int(11) NOT NULL DEFAULT '0',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_ORDER_PSOC` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALESTRULE_COUPON_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated_order`
--

LOCK TABLES `coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) NOT NULL DEFAULT '0',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending',
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedule`
--

LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` (`parent_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=400001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Customer Address Entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity`
--

LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
INSERT INTO `customer_address_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `increment_id`, `parent_id`, `created_at`, `updated_at`, `is_active`) VALUES (1,2,0,'',1,'2013-03-06 15:21:01','2013-03-06 15:21:01',1);
INSERT INTO `customer_address_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `increment_id`, `parent_id`, `created_at`, `updated_at`, `is_active`) VALUES (2,2,0,'',311182,'2013-03-06 15:34:11','2013-03-06 15:34:11',1);
INSERT INTO `customer_address_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `increment_id`, `parent_id`, `created_at`, `updated_at`, `is_active`) VALUES (400000,2,0,'',910000,'2013-03-06 16:00:16','2013-03-06 16:00:16',1);
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_datetime`
--

LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_decimal`
--

LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_int`
--

LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=500001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_text`
--

LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
INSERT INTO `customer_address_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (1,2,24,1,'Street Address #1\nStreet Address #2');
INSERT INTO `customer_address_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (2,2,24,2,'Street Address #1\nStreet Address #2');
INSERT INTO `customer_address_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (500000,2,24,400000,'Street Address #1\nStreet Address #2');
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ADDRESS_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (1,2,18,1,'Prefix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (2,2,19,1,'First Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (3,2,20,1,'Middle Name/Initial');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (4,2,21,1,'Last Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (5,2,22,1,'Suffix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (6,2,23,1,'Company');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (7,2,25,1,'Kiev');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (8,2,26,1,'UA');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (9,2,27,1,'State/Province');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (10,2,29,1,'State/Province');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (11,2,30,1,'Telephone');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (12,2,31,1,'Fax');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (13,2,18,2,'Prefix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (14,2,19,2,'First Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (15,2,20,2,'Middle Name/Initial');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (16,2,21,2,'Last Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (17,2,22,2,'Suffix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (18,2,23,2,'Company');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (19,2,25,2,'Kiev');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (20,2,26,2,'UA');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (21,2,27,2,'State/Province');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (22,2,29,2,'Zip/Postal Code');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (23,2,30,2,'Telephone');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (24,2,31,2,'Fax');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600000,2,18,400000,'Prefix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600001,2,19,400000,'First Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600002,2,20,400000,'Middle Name/Initial');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600003,2,21,400000,'Last Name');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600004,2,22,400000,'Suffix');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600005,2,23,400000,'Company');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600006,2,25,400000,'City');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600007,2,26,400000,'UA');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600008,2,27,400000,'State/Province');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600009,2,29,400000,'Zip/Postal Code');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600010,2,30,400000,'Telephone');
INSERT INTO `customer_address_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (600011,2,31,400000,'Fax');
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `input_filter` varchar(255) DEFAULT NULL,
  `multiline_count` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `validate_rules` text,
  `is_system` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `data_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_EAV_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute`
--

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (1,1,'',0,NULL,1,10,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (2,0,'',0,NULL,1,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (3,1,'',0,NULL,1,20,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (4,0,'',0,NULL,0,30,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (5,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (6,0,'',0,NULL,0,50,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (7,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (8,0,'',0,NULL,0,70,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (9,1,'',0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,80,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (10,1,'',0,NULL,1,25,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,90,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (12,0,'',0,NULL,1,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (13,0,'',0,NULL,1,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (14,0,'',0,NULL,1,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (15,0,'',0,'a:1:{s:15:\"max_text_length\";i:255;}',0,100,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (16,0,'',0,NULL,1,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (17,0,'',0,NULL,0,0,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (18,0,'',0,NULL,0,10,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (19,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,20,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (20,0,'',0,NULL,0,30,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (21,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (22,0,'',0,NULL,0,50,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (23,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (24,1,'',2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,70,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (25,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,80,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (26,1,'',0,NULL,1,90,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (27,1,'',0,NULL,1,100,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (28,1,'',0,NULL,1,100,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (29,1,'',0,'a:0:{}',1,110,'customer/attribute_data_postcode');
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (30,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,120,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (31,1,'',0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,130,NULL);
INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES (32,0,'',0,'a:0:{}',0,110,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `is_visible` tinyint(1) unsigned DEFAULT NULL,
  `is_required` tinyint(1) unsigned DEFAULT NULL,
  `default_value` text,
  `multiline_count` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_WEBST_CORE_WEBST` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUST_EAV_ATTR_WEBST_ATTR_EAV_ATTR` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute_website`
--

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `group_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_CUSTOMER_ENTITY_STORE` (`store_id`),
  KEY `IDX_ENTITY_TYPE` (`entity_type_id`),
  KEY `IDX_AUTH` (`email`,`website_id`),
  KEY `FK_CUSTOMER_WEBSITE` (`website_id`),
  CONSTRAINT `FK_CUSTOMER_ENTITY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=910001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Customer Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
INSERT INTO `customer_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`) VALUES (1,1,0,0,'nfxpnk+test02@gmail.com',1,'',0,'2013-03-06 15:21:01','2013-03-06 15:21:01',1);
INSERT INTO `customer_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`) VALUES (311182,1,0,1,'nfxpnk+test311182@gmail.com',1,'',0,'2013-03-06 15:34:10','2013-03-06 15:34:10',1);
INSERT INTO `customer_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`) VALUES (910000,1,0,1,'nfxpnk+final@gmail.com',1,'',0,'2013-03-06 16:00:16','2013-03-06 16:00:16',1);
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DATETIME_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DATETIME_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=700001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_datetime`
--

LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
INSERT INTO `customer_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (1,1,11,1,'1984-03-06 00:00:00');
INSERT INTO `customer_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (2,1,11,311182,'1989-03-02 00:00:00');
INSERT INTO `customer_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (700000,1,11,910000,'1984-03-01 00:00:00');
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_DECIMAL_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_decimal`
--

LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_INT_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_INT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=800004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_int`
--

LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (1,1,32,1,1);
INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (2,1,13,1,1);
INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (5,1,32,311182,1);
INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (800000,1,32,910000,1);
INSERT INTO `customer_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (800001,1,13,910000,400000);
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_CUSTOMER_TEXT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_text`
--

LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `IDX_ATTRIBUTE_VALUE` (`entity_id`,`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_CUSTOMER_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_CUSTOMER_VARCHAR_ENTITY` (`entity_id`),
  KEY `IDX_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=900008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_varchar`
--

LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (1,1,4,1,'Prefx');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (2,1,5,1,'First Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (3,1,6,1,'Middle Name/Initial');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (4,1,7,1,'Last Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (5,1,8,1,'Suffix');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (6,1,15,1,'Tax/VAT Number');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (7,1,12,1,'0ced0eb34349310aca2c9830b30d79f8:hk');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (8,1,3,1,'Admin');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (9,1,4,311182,'Prefix');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (10,1,5,311182,'First Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (11,1,6,311182,'Middle Name/Initial');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (12,1,7,311182,'Last Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (13,1,8,311182,'Suffix');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (14,1,15,311182,'Tax/VAT Number');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (15,1,12,311182,'8e9532fc55287ced2a7cb0609ecd9f02:8G');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (16,1,3,311182,'Admin');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900000,1,4,910000,'Prefix');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900001,1,5,910000,'First Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900002,1,6,910000,'Middle Name/Initial');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900003,1,7,910000,'Last Name');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900004,1,8,910000,'Suffix');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900005,1,15,910000,'Tax/VAT Number');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900006,1,12,910000,'3bc170e7c211c8aed29aff6ca2bbad1d:of');
INSERT INTO `customer_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `entity_id`, `value`) VALUES (900007,1,3,910000,'Admin');
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` char(32) NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer attributes/forms relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_form_attribute`
--

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',1);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',3);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',4);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',4);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',4);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',4);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',5);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',5);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',5);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',5);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',6);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',6);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',6);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',6);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',7);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',7);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',7);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',7);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',8);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',8);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',8);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',8);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_checkout',9);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',9);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',9);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',9);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',9);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_checkout',10);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',10);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_checkout',11);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',11);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',11);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',11);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',11);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_checkout',15);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',15);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',15);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',15);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',15);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',18);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',18);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',18);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',19);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',19);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',19);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',20);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',20);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',20);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',21);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',21);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',21);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',22);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',22);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',22);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',23);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',23);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',23);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',24);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',24);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',24);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',25);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',25);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',25);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',26);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',26);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',26);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',27);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',27);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',27);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',28);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',28);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',28);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',29);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',29);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',29);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',30);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',30);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',30);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer_address',31);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_address_edit',31);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_register_address',31);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_checkout',32);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('adminhtml_customer',32);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('checkout_register',32);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_create',32);
INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES ('customer_account_edit',32);
/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `customer_group_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL DEFAULT '',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES (0,'NOT LOGGED IN',3);
INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES (1,'General',3);
INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES (2,'Wholesale',3);
INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES (3,'Retailer',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch`
--

DROP TABLE IF EXISTS `dataflow_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `adapter` varchar(128) DEFAULT NULL,
  `params` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `FK_DATAFLOW_BATCH_PROFILE` (`profile_id`),
  KEY `FK_DATAFLOW_BATCH_STORE` (`store_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DATAFLOW_BATCH_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch`
--

LOCK TABLES `dataflow_batch` WRITE;
/*!40000 ALTER TABLE `dataflow_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_export`
--

DROP TABLE IF EXISTS `dataflow_batch_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_export_id`),
  KEY `FK_DATAFLOW_BATCH_EXPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_export`
--

LOCK TABLES `dataflow_batch_export` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_import`
--

DROP TABLE IF EXISTS `dataflow_batch_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0',
  `batch_data` longtext,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_import_id`),
  KEY `FK_DATAFLOW_BATCH_IMPORT_BATCH` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_import`
--

LOCK TABLES `dataflow_batch_import` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_import_data`
--

DROP TABLE IF EXISTS `dataflow_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  `value` text,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`import_id`),
  KEY `FK_dataflow_import_data` (`session_id`),
  CONSTRAINT `FK_dataflow_import_data` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_import_data`
--

LOCK TABLES `dataflow_import_data` WRITE;
/*!40000 ALTER TABLE `dataflow_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile`
--

DROP TABLE IF EXISTS `dataflow_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actions_xml` text,
  `gui_data` text,
  `direction` enum('import','export') DEFAULT NULL,
  `entity_type` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `data_transfer` enum('file','interactive') DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile`
--

LOCK TABLES `dataflow_profile` WRITE;
/*!40000 ALTER TABLE `dataflow_profile` DISABLE KEYS */;
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (1,'Export All Products','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file');
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (2,'Export Product Stocks','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"catalog/convert_adapter_product\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n    <var name=\"map\">\r\n        <map name=\"store\"><![CDATA[store]]></map>\r\n        <map name=\"sku\"><![CDATA[sku]]></map>\r\n        <map name=\"qty\"><![CDATA[qty]]></map>\r\n        <map name=\"is_in_stock\"><![CDATA[is_in_stock]]></map>\r\n    </var>\r\n    <var name=\"_only_specified\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_product_stocks.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file');
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (3,'Import All Products','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive');
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (4,'Import Product Stocks','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive');
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (5,'Export Customers','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"customer/convert_adapter_customer\" method=\"load\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\r\n</action>\r\n\r\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\r\n</action>\r\n\r\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n</action>\r\n\r\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\r\n    <var name=\"type\">file</var>\r\n    <var name=\"path\">var/export</var>\r\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\r\n</action>\r\n\r\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','customer',0,'file');
INSERT INTO `dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES (6,'Import Customers','2013-03-06 15:43:00','2013-03-06 15:43:00','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\r\n    <var name=\"delimiter\"><![CDATA[,]]></var>\r\n    <var name=\"enclose\"><![CDATA[\"]]></var>\r\n    <var name=\"fieldnames\">true</var>\r\n    <var name=\"store\"><![CDATA[0]]></var>\r\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\r\n    <var name=\"method\">parse</var>\r\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','customer',0,'interactive');
/*!40000 ALTER TABLE `dataflow_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile_history`
--

DROP TABLE IF EXISTS `dataflow_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(64) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `performed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `FK_dataflow_profile_history` (`profile_id`),
  CONSTRAINT `FK_dataflow_profile_history` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile_history`
--

LOCK TABLES `dataflow_profile_history` WRITE;
/*!40000 ALTER TABLE `dataflow_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_profile_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_session`
--

DROP TABLE IF EXISTS `dataflow_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_session`
--

LOCK TABLES `dataflow_session` WRITE;
/*!40000 ALTER TABLE `dataflow_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `design` varchar(255) NOT NULL DEFAULT '',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`design_change_id`),
  KEY `FK_DESIGN_CHANGE_STORE` (`store_id`),
  CONSTRAINT `FK_DESIGN_CHANGE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_change`
--

LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `iso2_code` varchar(2) NOT NULL DEFAULT '',
  `iso3_code` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country`
--

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AD','AD','AND');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AE','AE','ARE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AF','AF','AFG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AG','AG','ATG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AI','AI','AIA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AL','AL','ALB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AM','AM','ARM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AN','AN','ANT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AO','AO','AGO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AQ','AQ','ATA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AR','AR','ARG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AS','AS','ASM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AT','AT','AUT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AU','AU','AUS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AW','AW','ABW');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AX','AX','ALA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('AZ','AZ','AZE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BA','BA','BIH');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BB','BB','BRB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BD','BD','BGD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BE','BE','BEL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BF','BF','BFA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BG','BG','BGR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BH','BH','BHR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BI','BI','BDI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BJ','BJ','BEN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BL','BL','BLM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BM','BM','BMU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BN','BN','BRN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BO','BO','BOL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BR','BR','BRA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BS','BS','BHS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BT','BT','BTN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BV','BV','BVT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BW','BW','BWA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BY','BY','BLR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('BZ','BZ','BLZ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CA','CA','CAN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CC','CC','CCK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CD','CD','COD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CF','CF','CAF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CG','CG','COG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CH','CH','CHE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CI','CI','CIV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CK','CK','COK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CL','CL','CHL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CM','CM','CMR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CN','CN','CHN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CO','CO','COL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CR','CR','CRI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CU','CU','CUB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CV','CV','CPV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CX','CX','CXR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CY','CY','CYP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('CZ','CZ','CZE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DE','DE','DEU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DJ','DJ','DJI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DK','DK','DNK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DM','DM','DMA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DO','DO','DOM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('DZ','DZ','DZA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('EC','EC','ECU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('EE','EE','EST');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('EG','EG','EGY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('EH','EH','ESH');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ER','ER','ERI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ES','ES','ESP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ET','ET','ETH');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FI','FI','FIN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FJ','FJ','FJI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FK','FK','FLK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FM','FM','FSM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FO','FO','FRO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('FR','FR','FRA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GA','GA','GAB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GB','GB','GBR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GD','GD','GRD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GE','GE','GEO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GF','GF','GUF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GG','GG','GGY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GH','GH','GHA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GI','GI','GIB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GL','GL','GRL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GM','GM','GMB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GN','GN','GIN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GP','GP','GLP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GQ','GQ','GNQ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GR','GR','GRC');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GS','GS','SGS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GT','GT','GTM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GU','GU','GUM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GW','GW','GNB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('GY','GY','GUY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HK','HK','HKG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HM','HM','HMD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HN','HN','HND');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HR','HR','HRV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HT','HT','HTI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('HU','HU','HUN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ID','ID','IDN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IE','IE','IRL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IL','IL','ISR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IM','IM','IMN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IN','IN','IND');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IO','IO','IOT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IQ','IQ','IRQ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IR','IR','IRN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IS','IS','ISL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('IT','IT','ITA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('JE','JE','JEY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('JM','JM','JAM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('JO','JO','JOR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('JP','JP','JPN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KE','KE','KEN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KG','KG','KGZ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KH','KH','KHM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KI','KI','KIR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KM','KM','COM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KN','KN','KNA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KP','KP','PRK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KR','KR','KOR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KW','KW','KWT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KY','KY','CYM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('KZ','KZ','KAZ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LA','LA','LAO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LB','LB','LBN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LC','LC','LCA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LI','LI','LIE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LK','LK','LKA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LR','LR','LBR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LS','LS','LSO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LT','LT','LTU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LU','LU','LUX');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LV','LV','LVA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('LY','LY','LBY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MA','MA','MAR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MC','MC','MCO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MD','MD','MDA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ME','ME','MNE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MF','MF','MAF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MG','MG','MDG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MH','MH','MHL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MK','MK','MKD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ML','ML','MLI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MM','MM','MMR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MN','MN','MNG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MO','MO','MAC');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MP','MP','MNP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MQ','MQ','MTQ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MR','MR','MRT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MS','MS','MSR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MT','MT','MLT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MU','MU','MUS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MV','MV','MDV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MW','MW','MWI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MX','MX','MEX');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MY','MY','MYS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('MZ','MZ','MOZ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NA','NA','NAM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NC','NC','NCL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NE','NE','NER');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NF','NF','NFK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NG','NG','NGA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NI','NI','NIC');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NL','NL','NLD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NO','NO','NOR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NP','NP','NPL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NR','NR','NRU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NU','NU','NIU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('NZ','NZ','NZL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('OM','OM','OMN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PA','PA','PAN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PE','PE','PER');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PF','PF','PYF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PG','PG','PNG');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PH','PH','PHL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PK','PK','PAK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PL','PL','POL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PM','PM','SPM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PN','PN','PCN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PR','PR','PRI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PS','PS','PSE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PT','PT','PRT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PW','PW','PLW');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('PY','PY','PRY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('QA','QA','QAT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('RE','RE','REU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('RO','RO','ROU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('RS','RS','SRB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('RU','RU','RUS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('RW','RW','RWA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SA','SA','SAU');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SB','SB','SLB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SC','SC','SYC');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SD','SD','SDN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SE','SE','SWE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SG','SG','SGP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SH','SH','SHN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SI','SI','SVN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SJ','SJ','SJM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SK','SK','SVK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SL','SL','SLE');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SM','SM','SMR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SN','SN','SEN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SO','SO','SOM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SR','SR','SUR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ST','ST','STP');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SV','SV','SLV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SY','SY','SYR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('SZ','SZ','SWZ');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TC','TC','TCA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TD','TD','TCD');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TF','TF','ATF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TG','TG','TGO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TH','TH','THA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TJ','TJ','TJK');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TK','TK','TKL');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TL','TL','TLS');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TM','TM','TKM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TN','TN','TUN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TO','TO','TON');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TR','TR','TUR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TT','TT','TTO');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TV','TV','TUV');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TW','TW','TWN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('TZ','TZ','TZA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('UA','UA','UKR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('UG','UG','UGA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('UM','UM','UMI');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('US','US','USA');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('UY','UY','URY');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('UZ','UZ','UZB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VA','VA','VAT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VC','VC','VCT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VE','VE','VEN');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VG','VG','VGB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VI','VI','VIR');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VN','VN','VNM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('VU','VU','VUT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('WF','WF','WLF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('WS','WS','WSM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('YE','YE','YEM');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('YT','YT','MYT');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ZA','ZA','ZAF');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ZM','ZM','ZMB');
INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES ('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(2) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `format` text NOT NULL,
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `country_type` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Countries format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_format`
--

LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region` (
  `region_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(4) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `default_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  KEY `FK_REGION_COUNTRY` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='Country regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region`
--

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (1,'US','AL','Alabama');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (2,'US','AK','Alaska');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (3,'US','AS','American Samoa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (4,'US','AZ','Arizona');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (5,'US','AR','Arkansas');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (6,'US','AF','Armed Forces Africa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (7,'US','AA','Armed Forces Americas');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (8,'US','AC','Armed Forces Canada');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (9,'US','AE','Armed Forces Europe');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (10,'US','AM','Armed Forces Middle East');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (11,'US','AP','Armed Forces Pacific');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (12,'US','CA','California');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (13,'US','CO','Colorado');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (14,'US','CT','Connecticut');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (15,'US','DE','Delaware');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (16,'US','DC','District of Columbia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (17,'US','FM','Federated States Of Micronesia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (18,'US','FL','Florida');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (19,'US','GA','Georgia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (20,'US','GU','Guam');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (21,'US','HI','Hawaii');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (22,'US','ID','Idaho');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (23,'US','IL','Illinois');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (24,'US','IN','Indiana');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (25,'US','IA','Iowa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (26,'US','KS','Kansas');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (27,'US','KY','Kentucky');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (28,'US','LA','Louisiana');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (29,'US','ME','Maine');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (30,'US','MH','Marshall Islands');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (31,'US','MD','Maryland');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (32,'US','MA','Massachusetts');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (33,'US','MI','Michigan');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (34,'US','MN','Minnesota');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (35,'US','MS','Mississippi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (36,'US','MO','Missouri');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (37,'US','MT','Montana');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (38,'US','NE','Nebraska');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (39,'US','NV','Nevada');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (40,'US','NH','New Hampshire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (41,'US','NJ','New Jersey');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (42,'US','NM','New Mexico');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (43,'US','NY','New York');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (44,'US','NC','North Carolina');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (45,'US','ND','North Dakota');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (46,'US','MP','Northern Mariana Islands');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (47,'US','OH','Ohio');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (48,'US','OK','Oklahoma');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (49,'US','OR','Oregon');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (50,'US','PW','Palau');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (51,'US','PA','Pennsylvania');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (52,'US','PR','Puerto Rico');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (53,'US','RI','Rhode Island');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (54,'US','SC','South Carolina');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (55,'US','SD','South Dakota');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (56,'US','TN','Tennessee');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (57,'US','TX','Texas');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (58,'US','UT','Utah');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (59,'US','VT','Vermont');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (60,'US','VI','Virgin Islands');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (61,'US','VA','Virginia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (62,'US','WA','Washington');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (63,'US','WV','West Virginia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (64,'US','WI','Wisconsin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (65,'US','WY','Wyoming');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (66,'CA','AB','Alberta');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (67,'CA','BC','British Columbia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (68,'CA','MB','Manitoba');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (69,'CA','NL','Newfoundland and Labrador');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (70,'CA','NB','New Brunswick');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (71,'CA','NS','Nova Scotia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (72,'CA','NT','Northwest Territories');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (73,'CA','NU','Nunavut');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (74,'CA','ON','Ontario');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (75,'CA','PE','Prince Edward Island');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (76,'CA','QC','Quebec');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (77,'CA','SK','Saskatchewan');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (78,'CA','YT','Yukon Territory');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (79,'DE','NDS','Niedersachsen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (80,'DE','BAW','Baden-Württemberg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (81,'DE','BAY','Bayern');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (82,'DE','BER','Berlin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (83,'DE','BRG','Brandenburg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (84,'DE','BRE','Bremen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (85,'DE','HAM','Hamburg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (86,'DE','HES','Hessen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (87,'DE','MEC','Mecklenburg-Vorpommern');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (88,'DE','NRW','Nordrhein-Westfalen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (89,'DE','RHE','Rheinland-Pfalz');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (90,'DE','SAR','Saarland');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (91,'DE','SAS','Sachsen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (92,'DE','SAC','Sachsen-Anhalt');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (93,'DE','SCN','Schleswig-Holstein');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (94,'DE','THE','Thüringen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (95,'AT','WI','Wien');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (96,'AT','NO','Niederösterreich');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (97,'AT','OO','Oberösterreich');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (98,'AT','SB','Salzburg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (99,'AT','KN','Kärnten');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (100,'AT','ST','Steiermark');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (101,'AT','TI','Tirol');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (102,'AT','BL','Burgenland');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (103,'AT','VB','Voralberg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (104,'CH','AG','Aargau');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (105,'CH','AI','Appenzell Innerrhoden');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (106,'CH','AR','Appenzell Ausserrhoden');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (107,'CH','BE','Bern');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (108,'CH','BL','Basel-Landschaft');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (109,'CH','BS','Basel-Stadt');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (110,'CH','FR','Freiburg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (111,'CH','GE','Genf');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (112,'CH','GL','Glarus');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (113,'CH','GR','Graubünden');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (114,'CH','JU','Jura');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (115,'CH','LU','Luzern');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (116,'CH','NE','Neuenburg');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (117,'CH','NW','Nidwalden');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (118,'CH','OW','Obwalden');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (119,'CH','SG','St. Gallen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (120,'CH','SH','Schaffhausen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (121,'CH','SO','Solothurn');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (122,'CH','SZ','Schwyz');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (123,'CH','TG','Thurgau');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (124,'CH','TI','Tessin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (125,'CH','UR','Uri');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (126,'CH','VD','Waadt');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (127,'CH','VS','Wallis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (128,'CH','ZG','Zug');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (129,'CH','ZH','Zürich');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (130,'ES','A Coruсa','A Coruña');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (131,'ES','Alava','Alava');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (132,'ES','Albacete','Albacete');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (133,'ES','Alicante','Alicante');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (134,'ES','Almeria','Almeria');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (135,'ES','Asturias','Asturias');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (136,'ES','Avila','Avila');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (137,'ES','Badajoz','Badajoz');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (138,'ES','Baleares','Baleares');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (139,'ES','Barcelona','Barcelona');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (140,'ES','Burgos','Burgos');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (141,'ES','Caceres','Caceres');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (142,'ES','Cadiz','Cadiz');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (143,'ES','Cantabria','Cantabria');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (144,'ES','Castellon','Castellon');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (145,'ES','Ceuta','Ceuta');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (146,'ES','Ciudad Real','Ciudad Real');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (147,'ES','Cordoba','Cordoba');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (148,'ES','Cuenca','Cuenca');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (149,'ES','Girona','Girona');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (150,'ES','Granada','Granada');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (151,'ES','Guadalajara','Guadalajara');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (152,'ES','Guipuzcoa','Guipuzcoa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (153,'ES','Huelva','Huelva');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (154,'ES','Huesca','Huesca');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (155,'ES','Jaen','Jaen');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (156,'ES','La Rioja','La Rioja');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (157,'ES','Las Palmas','Las Palmas');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (158,'ES','Leon','Leon');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (159,'ES','Lleida','Lleida');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (160,'ES','Lugo','Lugo');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (161,'ES','Madrid','Madrid');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (162,'ES','Malaga','Malaga');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (163,'ES','Melilla','Melilla');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (164,'ES','Murcia','Murcia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (165,'ES','Navarra','Navarra');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (166,'ES','Ourense','Ourense');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (167,'ES','Palencia','Palencia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (168,'ES','Pontevedra','Pontevedra');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (169,'ES','Salamanca','Salamanca');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (171,'ES','Segovia','Segovia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (172,'ES','Sevilla','Sevilla');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (173,'ES','Soria','Soria');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (174,'ES','Tarragona','Tarragona');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (175,'ES','Teruel','Teruel');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (176,'ES','Toledo','Toledo');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (177,'ES','Valencia','Valencia');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (178,'ES','Valladolid','Valladolid');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (179,'ES','Vizcaya','Vizcaya');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (180,'ES','Zamora','Zamora');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (181,'ES','Zaragoza','Zaragoza');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (182,'FR','01','Ain');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (183,'FR','02','Aisne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (184,'FR','03','Allier');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (185,'FR','04','Alpes-de-Haute-Provence');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (186,'FR','05','Hautes-Alpes');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (187,'FR','06','Alpes-Maritimes');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (188,'FR','07','Ardèche');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (189,'FR','08','Ardennes');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (190,'FR','09','Ariège');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (191,'FR','10','Aube');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (192,'FR','11','Aude');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (193,'FR','12','Aveyron');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (194,'FR','13','Bouches-du-Rhône');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (195,'FR','14','Calvados');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (196,'FR','15','Cantal');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (197,'FR','16','Charente');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (198,'FR','17','Charente-Maritime');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (199,'FR','18','Cher');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (200,'FR','19','Corrèze');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (201,'FR','2A','Corse-du-Sud');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (202,'FR','2B','Haute-Corse');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (203,'FR','21','Côte-d\'Or');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (204,'FR','22','Côtes-d\'Armor');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (205,'FR','23','Creuse');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (206,'FR','24','Dordogne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (207,'FR','25','Doubs');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (208,'FR','26','Drôme');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (209,'FR','27','Eure');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (210,'FR','28','Eure-et-Loir');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (211,'FR','29','Finistère');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (212,'FR','30','Gard');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (213,'FR','31','Haute-Garonne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (214,'FR','32','Gers');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (215,'FR','33','Gironde');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (216,'FR','34','Hérault');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (217,'FR','35','Ille-et-Vilaine');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (218,'FR','36','Indre');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (219,'FR','37','Indre-et-Loire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (220,'FR','38','Isère');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (221,'FR','39','Jura');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (222,'FR','40','Landes');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (223,'FR','41','Loir-et-Cher');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (224,'FR','42','Loire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (225,'FR','43','Haute-Loire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (226,'FR','44','Loire-Atlantique');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (227,'FR','45','Loiret');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (228,'FR','46','Lot');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (229,'FR','47','Lot-et-Garonne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (230,'FR','48','Lozère');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (231,'FR','49','Maine-et-Loire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (232,'FR','50','Manche');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (233,'FR','51','Marne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (234,'FR','52','Haute-Marne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (235,'FR','53','Mayenne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (236,'FR','54','Meurthe-et-Moselle');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (237,'FR','55','Meuse');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (238,'FR','56','Morbihan');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (239,'FR','57','Moselle');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (240,'FR','58','Nièvre');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (241,'FR','59','Nord');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (242,'FR','60','Oise');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (243,'FR','61','Orne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (244,'FR','62','Pas-de-Calais');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (245,'FR','63','Puy-de-Dôme');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (246,'FR','64','Pyrénées-Atlantiques');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (247,'FR','65','Hautes-Pyrénées');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (248,'FR','66','Pyrénées-Orientales');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (249,'FR','67','Bas-Rhin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (250,'FR','68','Haut-Rhin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (251,'FR','69','Rhône');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (252,'FR','70','Haute-Saône');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (253,'FR','71','Saône-et-Loire');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (254,'FR','72','Sarthe');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (255,'FR','73','Savoie');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (256,'FR','74','Haute-Savoie');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (257,'FR','75','Paris');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (258,'FR','76','Seine-Maritime');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (259,'FR','77','Seine-et-Marne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (260,'FR','78','Yvelines');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (261,'FR','79','Deux-Sèvres');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (262,'FR','80','Somme');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (263,'FR','81','Tarn');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (264,'FR','82','Tarn-et-Garonne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (265,'FR','83','Var');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (266,'FR','84','Vaucluse');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (267,'FR','85','Vendée');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (268,'FR','86','Vienne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (269,'FR','87','Haute-Vienne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (270,'FR','88','Vosges');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (271,'FR','89','Yonne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (272,'FR','90','Territoire-de-Belfort');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (273,'FR','91','Essonne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (274,'FR','92','Hauts-de-Seine');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (275,'FR','93','Seine-Saint-Denis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (276,'FR','94','Val-de-Marne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (277,'FR','95','Val-d\'Oise');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (278,'RO','AB','Alba');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (279,'RO','AR','Arad');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (280,'RO','AG','Argeş');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (281,'RO','BC','Bacău');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (282,'RO','BH','Bihor');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (283,'RO','BN','Bistriţa-Năsăud');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (284,'RO','BT','Botoşani');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (285,'RO','BV','Braşov');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (286,'RO','BR','Brăila');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (287,'RO','B','Bucureşti');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (288,'RO','BZ','Buzău');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (289,'RO','CS','Caraş-Severin');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (290,'RO','CL','Călăraşi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (291,'RO','CJ','Cluj');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (292,'RO','CT','Constanţa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (293,'RO','CV','Covasna');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (294,'RO','DB','Dâmboviţa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (295,'RO','DJ','Dolj');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (296,'RO','GL','Galaţi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (297,'RO','GR','Giurgiu');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (298,'RO','GJ','Gorj');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (299,'RO','HR','Harghita');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (300,'RO','HD','Hunedoara');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (301,'RO','IL','Ialomiţa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (302,'RO','IS','Iaşi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (303,'RO','IF','Ilfov');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (304,'RO','MM','Maramureş');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (305,'RO','MH','Mehedinţi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (306,'RO','MS','Mureş');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (307,'RO','NT','Neamţ');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (308,'RO','OT','Olt');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (309,'RO','PH','Prahova');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (310,'RO','SM','Satu-Mare');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (311,'RO','SJ','Sălaj');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (312,'RO','SB','Sibiu');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (313,'RO','SV','Suceava');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (314,'RO','TR','Teleorman');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (315,'RO','TM','Timiş');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (316,'RO','TL','Tulcea');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (317,'RO','VS','Vaslui');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (318,'RO','VL','Vâlcea');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (319,'RO','VN','Vrancea');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (320,'FI','Lappi','Lappi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (322,'FI','Kainuu','Kainuu');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (323,'FI','Pohjois-Karjala','Pohjois-Karjala');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (324,'FI','Pohjois-Savo','Pohjois-Savo');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (325,'FI','Etelä-Savo','Etelä-Savo');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (327,'FI','Pohjanmaa','Pohjanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (328,'FI','Pirkanmaa','Pirkanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (329,'FI','Satakunta','Satakunta');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (331,'FI','Keski-Suomi','Keski-Suomi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (332,'FI','Varsinais-Suomi','Varsinais-Suomi');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (333,'FI','Etelä-Karjala','Etelä-Karjala');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (334,'FI','Päijät-Häme','Päijät-Häme');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (335,'FI','Kanta-Häme','Kanta-Häme');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (336,'FI','Uusimaa','Uusimaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (337,'FI','Itä-Uusimaa','Itä-Uusimaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (338,'FI','Kymenlaakso','Kymenlaakso');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (339,'FI','Ahvenanmaa','Ahvenanmaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (340,'EE','EE-37','Harjumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (341,'EE','EE-39','Hiiumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (342,'EE','EE-44','Ida-Virumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (343,'EE','EE-49','Jõgevamaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (344,'EE','EE-51','Järvamaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (345,'EE','EE-57','Läänemaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (346,'EE','EE-59','Lääne-Virumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (347,'EE','EE-65','Põlvamaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (348,'EE','EE-67','Pärnumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (349,'EE','EE-70','Raplamaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (350,'EE','EE-74','Saaremaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (351,'EE','EE-78','Tartumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (352,'EE','EE-82','Valgamaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (353,'EE','EE-84','Viljandimaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (354,'EE','EE-86','Võrumaa');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (355,'LV','LV-DGV','Daugavpils');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (356,'LV','LV-JEL','Jelgava');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (357,'LV','Jēkabpils','Jēkabpils');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (358,'LV','LV-JUR','Jūrmala');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (359,'LV','LV-LPX','Liepāja');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (360,'LV','LV-LE','Liepājas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (361,'LV','LV-REZ','Rēzekne');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (362,'LV','LV-RIX','Rīga');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (363,'LV','LV-RI','Rīgas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (364,'LV','Valmiera','Valmiera');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (365,'LV','LV-VEN','Ventspils');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (366,'LV','Aglonas novads','Aglonas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (367,'LV','LV-AI','Aizkraukles novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (368,'LV','Aizputes novads','Aizputes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (369,'LV','Aknīstes novads','Aknīstes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (370,'LV','Alojas novads','Alojas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (371,'LV','Alsungas novads','Alsungas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (372,'LV','LV-AL','Alūksnes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (373,'LV','Amatas novads','Amatas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (374,'LV','Apes novads','Apes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (375,'LV','Auces novads','Auces novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (376,'LV','Babītes novads','Babītes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (377,'LV','Baldones novads','Baldones novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (378,'LV','Baltinavas novads','Baltinavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (379,'LV','LV-BL','Balvu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (380,'LV','LV-BU','Bauskas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (381,'LV','Beverīnas novads','Beverīnas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (382,'LV','Brocēnu novads','Brocēnu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (383,'LV','Burtnieku novads','Burtnieku novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (384,'LV','Carnikavas novads','Carnikavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (385,'LV','Cesvaines novads','Cesvaines novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (386,'LV','Ciblas novads','Ciblas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (387,'LV','LV-CE','Cēsu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (388,'LV','Dagdas novads','Dagdas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (389,'LV','LV-DA','Daugavpils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (390,'LV','LV-DO','Dobeles novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (391,'LV','Dundagas novads','Dundagas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (392,'LV','Durbes novads','Durbes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (393,'LV','Engures novads','Engures novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (394,'LV','Garkalnes novads','Garkalnes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (395,'LV','Grobiņas novads','Grobiņas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (396,'LV','LV-GU','Gulbenes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (397,'LV','Iecavas novads','Iecavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (398,'LV','Ikšķiles novads','Ikšķiles novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (399,'LV','Ilūkstes novads','Ilūkstes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (400,'LV','Inčukalna novads','Inčukalna novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (401,'LV','Jaunjelgavas novads','Jaunjelgavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (403,'LV','Jaunpils novads','Jaunpils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (404,'LV','LV-JL','Jelgavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (405,'LV','LV-JK','Jēkabpils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (406,'LV','Kandavas novads','Kandavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (407,'LV','Kokneses novads','Kokneses novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (408,'LV','Krimuldas novads','Krimuldas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (409,'LV','Krustpils novads','Krustpils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (410,'LV','LV-KR','Krāslavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (411,'LV','LV-KU','Kuldīgas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (412,'LV','Kārsavas novads','Kārsavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (413,'LV','Lielvārdes novads','Lielvārdes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (414,'LV','LV-LM','Limbažu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (415,'LV','Lubānas novads','Lubānas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (416,'LV','LV-LU','Ludzas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (417,'LV','Līgatnes novads','Līgatnes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (418,'LV','Līvānu novads','Līvānu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (419,'LV','LV-MA','Madonas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (420,'LV','Mazsalacas novads','Mazsalacas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (421,'LV','Mālpils novads','Mālpils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (422,'LV','Mārupes novads','Mārupes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (423,'LV','Naukšēnu novads','Naukšēnu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (424,'LV','Neretas novads','Neretas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (425,'LV','Nīcas novads','Nīcas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (426,'LV','LV-OG','Ogres novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (427,'LV','Olaines novads','Olaines novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (428,'LV','Ozolnieku novads','Ozolnieku novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (429,'LV','LV-PR','Preiļu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (430,'LV','Priekules novads','Priekules novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (431,'LV','Priekuļu novads','Priekuļu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (432,'LV','Pārgaujas novads','Pārgaujas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (433,'LV','Pāvilostas novads','Pāvilostas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (434,'LV','Pļaviņu novads','Pļaviņu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (435,'LV','Raunas novads','Raunas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (436,'LV','Riebiņu novads','Riebiņu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (437,'LV','Rojas novads','Rojas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (438,'LV','Ropažu novads','Ropažu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (439,'LV','Rucavas novads','Rucavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (440,'LV','Rugāju novads','Rugāju novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (441,'LV','Rundāles novads','Rundāles novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (442,'LV','LV-RE','Rēzeknes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (443,'LV','Rūjienas novads','Rūjienas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (444,'LV','Salacgrīvas novads','Salacgrīvas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (445,'LV','Salas novads','Salas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (446,'LV','Salaspils novads','Salaspils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (447,'LV','LV-SA','Saldus novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (448,'LV','Saulkrastu novads','Saulkrastu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (449,'LV','Siguldas novads','Siguldas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (450,'LV','Skrundas novads','Skrundas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (451,'LV','Skrīveru novads','Skrīveru novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (452,'LV','Smiltenes novads','Smiltenes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (453,'LV','Stopiņu novads','Stopiņu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (454,'LV','Strenču novads','Strenču novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (455,'LV','Sējas novads','Sējas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (456,'LV','LV-TA','Talsu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (457,'LV','LV-TU','Tukuma novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (458,'LV','Tērvetes novads','Tērvetes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (459,'LV','Vaiņodes novads','Vaiņodes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (460,'LV','LV-VK','Valkas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (461,'LV','LV-VM','Valmieras novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (462,'LV','Varakļānu novads','Varakļānu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (463,'LV','Vecpiebalgas novads','Vecpiebalgas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (464,'LV','Vecumnieku novads','Vecumnieku novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (465,'LV','LV-VE','Ventspils novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (466,'LV','Viesītes novads','Viesītes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (467,'LV','Viļakas novads','Viļakas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (468,'LV','Viļānu novads','Viļānu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (469,'LV','Vārkavas novads','Vārkavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (470,'LV','Zilupes novads','Zilupes novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (471,'LV','Ādažu novads','Ādažu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (472,'LV','Ērgļu novads','Ērgļu novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (473,'LV','Ķeguma novads','Ķeguma novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (474,'LV','Ķekavas novads','Ķekavas novads');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (475,'LT','LT-AL','Alytaus Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (476,'LT','LT-KU','Kauno Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (477,'LT','LT-KL','Klaipėdos Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (478,'LT','LT-MR','Marijampolės Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (479,'LT','LT-PN','Panevėžio Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (480,'LT','LT-SA','Šiaulių Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (481,'LT','LT-TA','Tauragės Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (482,'LT','LT-TE','Telšių Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (483,'LT','LT-UT','Utenos Apskritis');
INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES (484,'LT','LT-VL','Vilniaus Apskritis');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '',
  `region_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `FK_DIRECTORY_REGION_NAME_REGION` (`region_id`),
  CONSTRAINT `FK_DIRECTORY_REGION_NAME_REGION` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Regions names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region_name`
--

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',1,'Alabama');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',2,'Alaska');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',3,'American Samoa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',4,'Arizona');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',5,'Arkansas');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',6,'Armed Forces Africa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',7,'Armed Forces Americas');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',8,'Armed Forces Canada');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',9,'Armed Forces Europe');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',10,'Armed Forces Middle East');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',11,'Armed Forces Pacific');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',12,'California');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',13,'Colorado');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',14,'Connecticut');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',15,'Delaware');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',16,'District of Columbia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',17,'Federated States Of Micronesia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',18,'Florida');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',19,'Georgia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',20,'Guam');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',21,'Hawaii');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',22,'Idaho');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',23,'Illinois');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',24,'Indiana');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',25,'Iowa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',26,'Kansas');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',27,'Kentucky');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',28,'Louisiana');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',29,'Maine');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',30,'Marshall Islands');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',31,'Maryland');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',32,'Massachusetts');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',33,'Michigan');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',34,'Minnesota');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',35,'Mississippi');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',36,'Missouri');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',37,'Montana');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',38,'Nebraska');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',39,'Nevada');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',40,'New Hampshire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',41,'New Jersey');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',42,'New Mexico');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',43,'New York');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',44,'North Carolina');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',45,'North Dakota');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',46,'Northern Mariana Islands');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',47,'Ohio');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',48,'Oklahoma');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',49,'Oregon');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',50,'Palau');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',51,'Pennsylvania');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',52,'Puerto Rico');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',53,'Rhode Island');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',54,'South Carolina');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',55,'South Dakota');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',56,'Tennessee');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',57,'Texas');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',58,'Utah');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',59,'Vermont');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',60,'Virgin Islands');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',61,'Virginia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',62,'Washington');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',63,'West Virginia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',64,'Wisconsin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',65,'Wyoming');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',66,'Alberta');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',67,'British Columbia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',68,'Manitoba');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',69,'Newfoundland and Labrador');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',70,'New Brunswick');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',71,'Nova Scotia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',72,'Northwest Territories');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',73,'Nunavut');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',74,'Ontario');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',75,'Prince Edward Island');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',76,'Quebec');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',77,'Saskatchewan');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',78,'Yukon Territory');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',79,'Niedersachsen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',80,'Baden-Württemberg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',81,'Bayern');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',82,'Berlin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',83,'Brandenburg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',84,'Bremen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',85,'Hamburg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',86,'Hessen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',87,'Mecklenburg-Vorpommern');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',88,'Nordrhein-Westfalen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',89,'Rheinland-Pfalz');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',90,'Saarland');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',91,'Sachsen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',92,'Sachsen-Anhalt');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',93,'Schleswig-Holstein');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',94,'Thüringen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',95,'Wien');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',96,'Niederösterreich');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',97,'Oberösterreich');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',98,'Salzburg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',99,'Kärnten');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',100,'Steiermark');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',101,'Tirol');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',102,'Burgenland');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',103,'Voralberg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',104,'Aargau');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',105,'Appenzell Innerrhoden');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',106,'Appenzell Ausserrhoden');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',107,'Bern');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',108,'Basel-Landschaft');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',109,'Basel-Stadt');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',110,'Freiburg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',111,'Genf');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',112,'Glarus');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',113,'Graubünden');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',114,'Jura');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',115,'Luzern');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',116,'Neuenburg');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',117,'Nidwalden');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',118,'Obwalden');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',119,'St. Gallen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',120,'Schaffhausen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',121,'Solothurn');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',122,'Schwyz');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',123,'Thurgau');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',124,'Tessin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',125,'Uri');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',126,'Waadt');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',127,'Wallis');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',128,'Zug');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',129,'Zürich');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',130,'A Coruña');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',131,'Alava');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',132,'Albacete');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',133,'Alicante');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',134,'Almeria');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',135,'Asturias');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',136,'Avila');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',137,'Badajoz');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',138,'Baleares');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',139,'Barcelona');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',140,'Burgos');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',141,'Caceres');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',142,'Cadiz');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',143,'Cantabria');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',144,'Castellon');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',145,'Ceuta');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',146,'Ciudad Real');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',147,'Cordoba');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',148,'Cuenca');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',149,'Girona');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',150,'Granada');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',151,'Guadalajara');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',152,'Guipuzcoa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',153,'Huelva');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',154,'Huesca');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',155,'Jaen');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',156,'La Rioja');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',157,'Las Palmas');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',158,'Leon');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',159,'Lleida');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',160,'Lugo');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',161,'Madrid');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',162,'Malaga');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',163,'Melilla');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',164,'Murcia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',165,'Navarra');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',166,'Ourense');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',167,'Palencia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',168,'Pontevedra');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',169,'Salamanca');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',170,'Santa Cruz de Tenerife');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',171,'Segovia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',172,'Sevilla');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',173,'Soria');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',174,'Tarragona');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',175,'Teruel');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',176,'Toledo');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',177,'Valencia');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',178,'Valladolid');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',179,'Vizcaya');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',180,'Zamora');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',181,'Zaragoza');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',182,'Ain');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',183,'Aisne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',184,'Allier');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',185,'Alpes-de-Haute-Provence');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',186,'Hautes-Alpes');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',187,'Alpes-Maritimes');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',188,'Ardèche');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',189,'Ardennes');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',190,'Ariège');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',191,'Aube');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',192,'Aude');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',193,'Aveyron');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',194,'Bouches-du-Rhône');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',195,'Calvados');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',196,'Cantal');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',197,'Charente');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',198,'Charente-Maritime');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',199,'Cher');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',200,'Corrèze');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',201,'Corse-du-Sud');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',202,'Haute-Corse');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',203,'Côte-d\'Or');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',204,'Côtes-d\'Armor');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',205,'Creuse');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',206,'Dordogne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',207,'Doubs');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',208,'Drôme');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',209,'Eure');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',210,'Eure-et-Loir');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',211,'Finistère');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',212,'Gard');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',213,'Haute-Garonne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',214,'Gers');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',215,'Gironde');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',216,'Hérault');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',217,'Ille-et-Vilaine');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',218,'Indre');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',219,'Indre-et-Loire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',220,'Isère');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',221,'Jura');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',222,'Landes');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',223,'Loir-et-Cher');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',224,'Loire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',225,'Haute-Loire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',226,'Loire-Atlantique');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',227,'Loiret');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',228,'Lot');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',229,'Lot-et-Garonne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',230,'Lozère');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',231,'Maine-et-Loire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',232,'Manche');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',233,'Marne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',234,'Haute-Marne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',235,'Mayenne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',236,'Meurthe-et-Moselle');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',237,'Meuse');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',238,'Morbihan');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',239,'Moselle');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',240,'Nièvre');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',241,'Nord');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',242,'Oise');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',243,'Orne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',244,'Pas-de-Calais');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',245,'Puy-de-Dôme');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',246,'Pyrénées-Atlantiques');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',247,'Hautes-Pyrénées');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',248,'Pyrénées-Orientales');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',249,'Bas-Rhin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',250,'Haut-Rhin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',251,'Rhône');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',252,'Haute-Saône');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',253,'Saône-et-Loire');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',254,'Sarthe');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',255,'Savoie');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',256,'Haute-Savoie');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',257,'Paris');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',258,'Seine-Maritime');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',259,'Seine-et-Marne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',260,'Yvelines');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',261,'Deux-Sèvres');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',262,'Somme');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',263,'Tarn');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',264,'Tarn-et-Garonne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',265,'Var');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',266,'Vaucluse');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',267,'Vendée');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',268,'Vienne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',269,'Haute-Vienne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',270,'Vosges');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',271,'Yonne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',272,'Territoire-de-Belfort');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',273,'Essonne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',274,'Hauts-de-Seine');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',275,'Seine-Saint-Denis');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',276,'Val-de-Marne');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',277,'Val-d\'Oise');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',278,'Alba');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',279,'Arad');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',280,'Argeş');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',281,'Bacău');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',282,'Bihor');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',283,'Bistriţa-Năsăud');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',284,'Botoşani');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',285,'Braşov');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',286,'Brăila');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',287,'Bucureşti');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',288,'Buzău');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',289,'Caraş-Severin');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',290,'Călăraşi');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',291,'Cluj');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',292,'Constanţa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',293,'Covasna');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',294,'Dâmboviţa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',295,'Dolj');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',296,'Galaţi');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',297,'Giurgiu');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',298,'Gorj');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',299,'Harghita');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',300,'Hunedoara');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',301,'Ialomiţa');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',302,'Iaşi');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',303,'Ilfov');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',304,'Maramureş');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',305,'Mehedinţi');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',306,'Mureş');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',307,'Neamţ');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',308,'Olt');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',309,'Prahova');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',310,'Satu-Mare');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',311,'Sălaj');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',312,'Sibiu');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',313,'Suceava');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',314,'Teleorman');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',315,'Timiş');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',316,'Tulcea');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',317,'Vaslui');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',318,'Vâlcea');
INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES ('en_US',319,'Vrancea');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` char(3) NOT NULL DEFAULT '',
  `currency_to` char(3) NOT NULL DEFAULT '',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `FK_CURRENCY_RATE_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_currency_rate`
--

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES ('EUR','EUR',1.000000000000);
INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES ('EUR','USD',1.415000000000);
INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES ('USD','EUR',0.706700000000);
INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES ('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads` int(10) unsigned DEFAULT NULL,
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(20) NOT NULL DEFAULT '',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT` (`product_id`),
  KEY `DOWNLODABLE_LINK_PRODUCT_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_DOWNLODABLE_LINK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link`
--

LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_price`
--

LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_increment_id` varchar(50) NOT NULL DEFAULT '',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_sku` varchar(255) NOT NULL DEFAULT '',
  `link_section_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_CUSTOMER_ID` (`customer_id`),
  KEY `KEY_DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned DEFAULT '0',
  `link_hash` varchar(255) NOT NULL DEFAULT '',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0',
  `link_id` int(20) unsigned NOT NULL DEFAULT '0',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `is_shareable` smallint(1) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_file` varchar(255) NOT NULL DEFAULT '',
  `link_type` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ID` (`purchased_id`),
  KEY `DOWNLOADABLE_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADALBE_LINK_HASH` (`link_hash`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased_item`
--

LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_LINK_TITLE_STORE` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_LINK` (`link_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_title`
--

LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sample_url` varchar(255) NOT NULL DEFAULT '',
  `sample_file` varchar(255) NOT NULL DEFAULT '',
  `sample_type` varchar(20) NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLODABLE_SAMPLE_PRODUCT` (`product_id`),
  CONSTRAINT `FK_DOWNLODABLE_SAMPLE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample`
--

LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_SAMPLE_TITLE_STORE` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample_title`
--

LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_code` varchar(255) NOT NULL DEFAULT '',
  `attribute_model` varchar(255) DEFAULT NULL,
  `backend_model` varchar(255) DEFAULT NULL,
  `backend_type` enum('static','datetime','decimal','int','text','varchar') NOT NULL DEFAULT 'static',
  `backend_table` varchar(255) DEFAULT NULL,
  `frontend_model` varchar(255) DEFAULT NULL,
  `frontend_input` varchar(50) DEFAULT NULL,
  `frontend_label` varchar(255) DEFAULT NULL,
  `frontend_class` varchar(255) DEFAULT NULL,
  `source_model` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_value` text,
  `is_unique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_code`),
  KEY `IDX_USED_FOR_SORT_BY` (`entity_type_id`),
  KEY `IDX_USED_IN_PRODUCT_LISTING` (`entity_type_id`),
  CONSTRAINT `FK_eav_attribute` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (1,1,'website_id',NULL,'customer/customer_attribute_backend_website','static','','','select','Associate to Website','','customer/customer_attribute_source_website',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (2,1,'store_id',NULL,'customer/customer_attribute_backend_store','static','','','select','Create In','','customer/customer_attribute_source_store',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (3,1,'created_in',NULL,'','varchar','','','text','Created From','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (4,1,'prefix',NULL,'','varchar','','','text','Prefix','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (5,1,'firstname',NULL,'','varchar','','','text','First Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (6,1,'middlename',NULL,'','varchar','','','text','Middle Name/Initial','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (7,1,'lastname',NULL,'','varchar','','','text','Last Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (8,1,'suffix',NULL,'','varchar','','','text','Suffix','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (9,1,'email',NULL,'','static','','','text','Email','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (10,1,'group_id',NULL,'','static','','','select','Group','','customer/customer_attribute_source_group',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (11,1,'dob',NULL,'eav/entity_attribute_backend_datetime','datetime','','eav/entity_attribute_frontend_datetime','date','Date Of Birth','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (12,1,'password_hash',NULL,'customer/customer_attribute_backend_password','varchar','','','hidden','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (13,1,'default_billing',NULL,'customer/customer_attribute_backend_billing','int','','','text','Default Billing Address','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (14,1,'default_shipping',NULL,'customer/customer_attribute_backend_shipping','int','','','text','Default Shipping Address','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (15,1,'taxvat',NULL,'','varchar','','','text','Tax/VAT Number','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (16,1,'confirmation',NULL,'','varchar','','','text','Is Confirmed','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (17,1,'created_at',NULL,'','static','','','date','Created At','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (18,2,'prefix',NULL,'','varchar','','','text','Prefix','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (19,2,'firstname',NULL,'','varchar','','','text','First Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (20,2,'middlename',NULL,'','varchar','','','text','Middle Name/Initial','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (21,2,'lastname',NULL,'','varchar','','','text','Last Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (22,2,'suffix',NULL,'','varchar','','','text','Suffix','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (23,2,'company',NULL,'','varchar','','','text','Company','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (24,2,'street',NULL,'customer_entity/address_attribute_backend_street','text','','','multiline','Street Address','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (25,2,'city',NULL,'','varchar','','','text','City','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (26,2,'country_id',NULL,'','varchar','','','select','Country','','customer_entity/address_attribute_source_country',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (27,2,'region',NULL,'customer_entity/address_attribute_backend_region','varchar','','','text','State/Province','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (28,2,'region_id',NULL,'','int','','','hidden','State/Province','','customer_entity/address_attribute_source_region',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (29,2,'postcode',NULL,'','varchar','','','text','Zip/Postal Code','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (30,2,'telephone',NULL,'','varchar','','','text','Telephone','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (31,2,'fax',NULL,'','varchar','','','text','Fax','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (32,1,'gender',NULL,'','int','','','select','Gender','','eav/entity_attribute_source_table',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (33,3,'name',NULL,'','varchar','','','text','Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (34,3,'is_active',NULL,'','int','','','select','Is Active','','eav/entity_attribute_source_boolean',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (35,3,'url_key',NULL,'catalog/category_attribute_backend_urlkey','varchar','','','text','URL key','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (36,3,'description',NULL,'','text','','','textarea','Description','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (37,3,'image',NULL,'catalog/category_attribute_backend_image','varchar','','','image','Image','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (38,3,'meta_title',NULL,'','varchar','','','text','Page Title','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (39,3,'meta_keywords',NULL,'','text','','','textarea','Meta Keywords','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (40,3,'meta_description',NULL,'','text','','','textarea','Meta Description','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (41,3,'display_mode',NULL,'','varchar','','','select','Display Mode','','catalog/category_attribute_source_mode',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (42,3,'landing_page',NULL,'','int','','','select','CMS Block','','catalog/category_attribute_source_page',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (43,3,'is_anchor',NULL,'','int','','','select','Is Anchor','','eav/entity_attribute_source_boolean',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (44,3,'path',NULL,'','static','','','','Path','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (45,3,'position',NULL,'','static','','','','Position','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (46,3,'all_children',NULL,'','text','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (47,3,'path_in_store',NULL,'','text','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (48,3,'children',NULL,'','text','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (49,3,'url_path',NULL,'','varchar','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (50,3,'custom_design',NULL,'','varchar','','','select','Custom Design','','core/design_source_design',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (52,3,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active From','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (53,3,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active To','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (54,3,'page_layout',NULL,'','varchar','','','select','Page Layout','','catalog/category_attribute_source_layout',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (55,3,'custom_layout_update',NULL,'','text','','','textarea','Custom Layout Update','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (56,3,'level',NULL,'','static','','','','Level','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (57,3,'children_count',NULL,'','static','','','','Children Count','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (58,3,'available_sort_by',NULL,'catalog/category_attribute_backend_sortby','text','','','multiselect','Available Product Listing Sort By','','catalog/category_attribute_source_sortby',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (59,3,'default_sort_by',NULL,'catalog/category_attribute_backend_sortby','varchar','','','select','Default Product Listing Sort By','','catalog/category_attribute_source_sortby',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (60,4,'name',NULL,'','varchar','','','text','Name','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (61,4,'description',NULL,'','text','','','textarea','Description','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (62,4,'short_description',NULL,'','text','','','textarea','Short Description','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (63,4,'sku',NULL,'','static','','','text','SKU','','',1,0,'',1,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (64,4,'price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Price','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (65,4,'special_price',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Special Price','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (66,4,'special_from_date',NULL,'catalog/product_attribute_backend_startdate','datetime','','','date','Special Price From Date','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (67,4,'special_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Special Price To Date','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (68,4,'cost',NULL,'catalog/product_attribute_backend_price','decimal','','','price','Cost','','',0,1,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (69,4,'weight',NULL,'','decimal','','','text','Weight','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (70,4,'manufacturer',NULL,'','int','','','select','Manufacturer','','',0,1,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (71,4,'meta_title',NULL,'','varchar','','','text','Meta Title','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (72,4,'meta_keyword',NULL,'','text','','','textarea','Meta Keywords','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (73,4,'meta_description',NULL,'','varchar','','','textarea','Meta Description','','',0,0,'',0,'Maximum 255 chars');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (74,4,'image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Base Image','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (75,4,'small_image',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Small Image','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (76,4,'thumbnail',NULL,'','varchar','','catalog/product_attribute_frontend_image','media_image','Thumbnail','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (77,4,'media_gallery',NULL,'catalog/product_attribute_backend_media','varchar','','','gallery','Media Gallery','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (78,4,'old_id',NULL,'','int','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (79,4,'tier_price',NULL,'catalog/product_attribute_backend_tierprice','decimal','','','text','Tier Price','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (80,4,'color',NULL,'','int','','','select','Color','','',0,1,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (81,4,'news_from_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Set Product as New from Date','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (82,4,'news_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Set Product as New to Date','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (83,4,'gallery',NULL,'','varchar','','','gallery','Image Gallery','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (84,4,'status',NULL,'','int','','','select','Status','','catalog/product_status',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (85,4,'tax_class_id',NULL,'','int','','','select','Tax Class','','tax/class_source_product',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (86,4,'url_key',NULL,'catalog/product_attribute_backend_urlkey','varchar','','','text','URL key','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (87,4,'url_path',NULL,'','varchar','','','','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (88,4,'minimal_price',NULL,'','decimal','','','price','Minimal Price','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (89,4,'is_recurring',NULL,'','int','','','select','Enable Recurring Profile','','eav/entity_attribute_source_boolean',0,0,'',0,'Products with recurring profile participate in catalog as nominal items.');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (90,4,'recurring_profile',NULL,'catalog/product_attribute_backend_recurring','text','','','text','Recurring Payment Profile','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (91,4,'visibility',NULL,'','int','','','select','Visibility','','catalog/product_visibility',1,0,'4',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (92,4,'custom_design',NULL,'','varchar','','','select','Custom Design','','core/design_source_design',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (93,4,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active From','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (94,4,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime','','','date','Active To','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (95,4,'custom_layout_update',NULL,'','text','','','textarea','Custom Layout Update','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (96,4,'page_layout',NULL,'','varchar','','','select','Page Layout','','catalog/product_attribute_source_layout',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (97,4,'options_container',NULL,'','varchar','','','select','Display product options in','','catalog/entity_product_attribute_design_options_container',0,0,'container2',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (98,4,'required_options',NULL,'','static','','','text','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (99,4,'has_options',NULL,'','static','','','text','','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (100,4,'image_label',NULL,'','varchar','','','text','Image Label','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (101,4,'small_image_label',NULL,'','varchar','','','text','Small Image Label','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (102,4,'thumbnail_label',NULL,'','varchar','','','text','Thumbnail Label','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (103,4,'created_at',NULL,'eav/entity_attribute_backend_time_created','static','','','text','','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (104,4,'updated_at',NULL,'eav/entity_attribute_backend_time_updated','static','','','text','','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (105,3,'include_in_menu',NULL,'','int','','','select','Include in Navigation Menu','','eav/entity_attribute_source_boolean',1,0,'1',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (106,3,'custom_use_parent_settings',NULL,'','int','','','select','Use Parent Category Settings','','eav/entity_attribute_source_boolean',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (107,3,'custom_apply_to_products',NULL,'','int','','','select','Apply To Products','','eav/entity_attribute_source_boolean',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (108,3,'filter_price_range',NULL,'','int','','','text','Layered Navigation Price Step','','',0,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (109,4,'enable_googlecheckout',NULL,'','int','','','select','Is product available for purchase with Google Checkout','','eav/entity_attribute_source_boolean',0,0,'1',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (110,4,'gift_message_available',NULL,'giftmessage/entity_attribute_backend_boolean_config','varchar','','','select','Allow Gift Message','','giftmessage/entity_attribute_source_boolean_config',0,0,'2',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (111,4,'price_type',NULL,'','int','','','','','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (112,4,'sku_type',NULL,'','int','','','','','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (113,4,'weight_type',NULL,'','int','','','','','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (114,4,'price_view',NULL,'','int','','','select','Price View','','bundle/product_attribute_source_price_view',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (115,4,'shipment_type',NULL,'','int','','','','Shipment','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (116,4,'links_purchased_separately',NULL,'','int','','','','Links can be purchased separately','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (117,4,'samples_title',NULL,'','varchar','','','','Samples title','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (118,4,'links_title',NULL,'','varchar','','','','Links title','','',1,0,'',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (119,4,'links_exist',NULL,'','int','','','','','','',0,0,'0',0,'');
INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES (120,4,'is_imported',NULL,'','int','','','select','In feed','','eav/entity_attribute_source_boolean',0,0,'',0,'');
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  `default_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `attribute_set_id` (`attribute_set_id`,`attribute_group_name`),
  KEY `attribute_set_id_2` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_group` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_group`
--

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (1,1,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (2,2,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (3,3,'General Information',10,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (4,4,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (5,4,'Prices',2,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (6,4,'Meta Information',3,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (7,4,'Images',4,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (8,4,'Recurring Profile',5,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (9,4,'Design',6,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (10,3,'Display Settings',20,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (11,3,'Custom Design',30,0);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (12,5,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (13,6,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (14,7,'General',1,1);
INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES (15,8,'General',1,1);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE` (`attribute_id`),
  KEY `IDX_ATTRIBUTE_LABEL_STORE` (`store_id`),
  KEY `IDX_ATTRIBUTE_LABEL_ATTRIBUTE_STORE` (`attribute_id`,`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_LABEL_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_label`
--

LOCK TABLES `eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Attributes option (for source model)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES (1,32,0);
INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES (2,32,1);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_ATTRIBUTE_OPTION_VALUE_STORE` (`store_id`),
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ATTRIBUTE_OPTION_VALUE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Attribute option values per store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_value`
--

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES (1,1,0,'Male');
INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES (2,2,0,'Female');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `entity_type_id` (`entity_type_id`,`attribute_set_name`),
  KEY `entity_type_id_2` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_eav_attribute_set` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_set`
--

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (1,1,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (2,2,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (3,3,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (4,4,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (5,5,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (6,6,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (7,7,'Default',1);
INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES (8,8,'Default',1);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(8) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_id` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  KEY `FK_ENTITY_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ENTITY_STORE` (`store_id`),
  CONSTRAINT `FK_eav_entity` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Entityies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `attribute_set_id_2` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `attribute_group_id` (`attribute_group_id`,`attribute_id`),
  KEY `attribute_set_id_3` (`attribute_set_id`,`sort_order`),
  KEY `FK_EAV_ENTITY_ATTRIVUTE_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_GROUP` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (1,1,1,1,1,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (2,1,1,1,2,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (3,1,1,1,3,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (4,1,1,1,4,30);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (5,1,1,1,5,40);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (6,1,1,1,6,50);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (7,1,1,1,7,60);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (8,1,1,1,8,70);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (9,1,1,1,9,80);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (10,1,1,1,10,25);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (11,1,1,1,11,90);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (12,1,1,1,12,81);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (13,1,1,1,13,82);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (14,1,1,1,14,83);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (15,1,1,1,15,100);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (16,1,1,1,16,85);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (17,1,1,1,17,86);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (18,2,2,2,18,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (19,2,2,2,19,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (20,2,2,2,20,30);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (21,2,2,2,21,40);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (22,2,2,2,22,50);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (23,2,2,2,23,60);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (24,2,2,2,24,70);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (25,2,2,2,25,80);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (26,2,2,2,26,90);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (27,2,2,2,27,100);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (28,2,2,2,28,100);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (29,2,2,2,29,110);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (30,2,2,2,30,120);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (31,2,2,2,31,130);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (32,1,1,1,32,110);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (33,3,3,3,33,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (34,3,3,3,34,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (35,3,3,3,35,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (36,3,3,3,36,4);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (37,3,3,3,37,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (38,3,3,3,38,6);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (39,3,3,3,39,7);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (40,3,3,3,40,8);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (41,3,3,10,41,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (42,3,3,10,42,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (43,3,3,10,43,30);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (44,3,3,3,44,12);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (45,3,3,3,45,13);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (46,3,3,3,46,14);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (47,3,3,3,47,15);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (48,3,3,3,48,16);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (49,3,3,3,49,17);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (50,3,3,11,50,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (51,3,3,11,51,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (52,3,3,11,52,30);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (53,3,3,11,53,40);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (54,3,3,11,54,50);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (55,3,3,11,55,60);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (56,3,3,3,56,24);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (57,3,3,3,57,25);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (58,3,3,10,58,40);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (59,3,3,10,59,50);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (60,4,4,4,60,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (61,4,4,4,61,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (62,4,4,4,62,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (63,4,4,4,63,4);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (64,4,4,5,64,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (65,4,4,5,65,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (66,4,4,5,66,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (67,4,4,5,67,4);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (68,4,4,5,68,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (69,4,4,4,69,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (70,4,4,6,71,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (71,4,4,6,72,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (72,4,4,6,73,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (73,4,4,7,74,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (74,4,4,7,75,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (75,4,4,7,76,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (76,4,4,7,77,4);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (77,4,4,4,78,6);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (78,4,4,5,79,6);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (79,4,4,4,81,7);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (80,4,4,4,82,8);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (81,4,4,7,83,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (82,4,4,4,84,9);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (83,4,4,5,85,7);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (84,4,4,4,86,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (85,4,4,4,87,11);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (86,4,4,5,88,8);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (87,4,4,8,89,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (88,4,4,8,90,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (89,4,4,4,91,12);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (90,4,4,9,92,1);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (91,4,4,9,93,2);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (92,4,4,9,94,3);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (93,4,4,9,95,4);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (94,4,4,9,96,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (95,4,4,9,97,6);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (96,4,4,4,98,13);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (97,4,4,4,99,14);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (98,4,4,4,100,15);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (99,4,4,4,101,16);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (100,4,4,4,102,17);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (101,4,4,4,103,18);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (102,4,4,4,104,19);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (103,3,3,3,105,10);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (104,3,3,11,106,5);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (105,3,3,11,107,6);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (106,3,3,10,108,51);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (107,4,4,5,109,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (108,4,4,4,110,20);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (109,4,4,4,111,21);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (110,4,4,4,112,22);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (111,4,4,4,113,23);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (112,4,4,5,114,21);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (113,4,4,4,115,24);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (114,4,4,4,116,25);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (115,4,4,4,117,26);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (116,4,4,4,118,27);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (117,4,4,4,119,28);
INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES (118,4,4,4,120,29);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DATETIME_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DATETIME_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datetime values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_datetime`
--

LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_DECIMAL_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Decimal values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_decimal`
--

LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_INT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_INT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_INT_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Integer values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_int`
--

LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_prefix` varchar(20) NOT NULL DEFAULT '',
  `increment_last_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_store_id`),
  KEY `FK_eav_entity_store_entity_type` (`entity_type_id`),
  KEY `FK_eav_entity_store_store` (`store_id`),
  CONSTRAINT `FK_eav_entity_store_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eav_entity_store_store` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_store`
--

LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_TEXT_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_TEXT_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_TEXT_ENTITY` (`entity_id`),
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_text`
--

LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_code` varchar(50) NOT NULL DEFAULT '',
  `entity_model` varchar(255) NOT NULL,
  `attribute_model` varchar(255) NOT NULL,
  `entity_table` varchar(255) NOT NULL DEFAULT '',
  `value_table_prefix` varchar(255) NOT NULL DEFAULT '',
  `entity_id_field` varchar(255) NOT NULL DEFAULT '',
  `is_data_sharing` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `data_sharing_key` varchar(100) DEFAULT 'default',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `increment_model` varchar(255) NOT NULL DEFAULT '',
  `increment_per_store` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `increment_pad_length` tinyint(8) unsigned NOT NULL DEFAULT '8',
  `increment_pad_char` char(1) NOT NULL DEFAULT '0',
  `additional_attribute_table` varchar(255) NOT NULL DEFAULT '',
  `entity_attribute_collection` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_type_id`),
  KEY `entity_name` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (1,'customer','customer/customer','customer/attribute','customer/entity','','',1,'default',1,'eav/entity_increment_numeric',0,8,'0','customer/eav_attribute','customer/attribute_collection');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (2,'customer_address','customer/address','customer/attribute','customer/address_entity','','',1,'default',2,'',0,8,'0','customer/eav_attribute','customer/address_attribute_collection');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (3,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category','','',1,'default',3,'',0,8,'0','catalog/eav_attribute','catalog/category_attribute_collection');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (4,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product','','',1,'default',4,'',0,8,'0','catalog/eav_attribute','catalog/product_attribute_collection');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (5,'order','sales/order','','sales/order','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','','');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (6,'invoice','sales/order_invoice','','sales/invoice','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','','');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (7,'creditmemo','sales/order_creditmemo','','sales/creditmemo','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','','');
INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES (8,'shipment','sales/order_shipment','','sales/shipment','','',1,'default',0,'eav/entity_increment_numeric',1,8,'0','','');
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY_TYPE` (`entity_type_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ATTRIBUTE` (`attribute_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_STORE` (`store_id`),
  KEY `FK_ATTRIBUTE_VARCHAR_ENTITY` (`entity_id`),
  KEY `value_by_attribute` (`attribute_id`,`value`),
  KEY `value_by_entity_type` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varchar values of attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_varchar`
--

LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `fieldset_id` smallint(5) unsigned DEFAULT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_FORM_ATTRIBUTE` (`type_id`,`attribute_id`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_FORM_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_element`
--

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (1,1,1,5,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (2,1,1,7,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (3,1,1,9,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (4,2,2,5,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (5,2,2,7,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (6,2,2,9,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (7,3,3,19,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (8,3,3,21,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (9,3,3,23,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (10,3,3,30,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (11,3,3,31,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (12,3,4,24,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (13,3,4,25,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (14,3,4,27,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (15,3,4,29,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (16,3,4,26,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (17,4,NULL,19,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (18,4,NULL,21,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (19,4,NULL,23,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (20,4,NULL,9,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (21,4,NULL,24,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (22,4,NULL,25,5);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (23,4,NULL,27,6);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (24,4,NULL,29,7);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (25,4,NULL,26,8);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (26,4,NULL,30,9);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (27,4,NULL,31,10);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (28,5,NULL,19,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (29,5,NULL,21,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (30,5,NULL,23,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (31,5,NULL,9,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (32,5,NULL,24,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (33,5,NULL,25,5);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (34,5,NULL,27,6);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (35,5,NULL,29,7);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (36,5,NULL,26,8);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (37,5,NULL,30,9);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (38,5,NULL,31,10);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (39,6,NULL,19,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (40,6,NULL,21,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (41,6,NULL,23,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (42,6,NULL,24,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (43,6,NULL,25,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (44,6,NULL,27,5);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (45,6,NULL,29,6);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (46,6,NULL,26,7);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (47,6,NULL,30,8);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (48,6,NULL,31,9);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (49,7,NULL,19,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (50,7,NULL,21,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (51,7,NULL,23,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (52,7,NULL,24,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (53,7,NULL,25,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (54,7,NULL,27,5);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (55,7,NULL,29,6);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (56,7,NULL,26,7);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (57,7,NULL,30,8);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (58,7,NULL,31,9);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (59,8,5,5,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (60,8,5,7,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (61,8,5,9,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (62,8,6,23,0);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (63,8,6,30,1);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (64,8,6,24,2);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (65,8,6,25,3);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (66,8,6,27,4);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (67,8,6,29,5);
INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES (68,8,6,26,6);
/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL,
  `code` char(64) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_FORM_FIELDSET_CODE` (`type_id`,`code`),
  KEY `IDX_FORM_TYPE` (`type_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset`
--

LOCK TABLES `eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (1,1,'general',1);
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (2,2,'general',1);
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (3,3,'contact',1);
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (4,3,'address',2);
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (5,8,'general',1);
INSERT INTO `eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES (6,8,'address',2);
/*!40000 ALTER TABLE `eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_FORM_FIELDSET` (`fieldset_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_FORM_FIELDSET` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset_label`
--

LOCK TABLES `eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset_label` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (1,0,'Personal Information');
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (2,0,'Account Information');
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (3,0,'Contact Information');
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (4,0,'Address');
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (5,0,'Personal Information');
INSERT INTO `eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES (6,0,'Address Information');
/*!40000 ALTER TABLE `eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(64) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_FORM_TYPE_CODE` (`code`,`theme`,`store_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type`
--

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (1,'customer_account_create','customer_account_create',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (2,'customer_account_edit','customer_account_edit',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (3,'customer_address_edit','customer_address_edit',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (4,'checkout_onepage_register','checkout_onepage_register',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (5,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (6,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (7,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES (8,'checkout_multishipping_register','checkout_multishipping_register',1,'',0);
/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE` (`entity_type_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_FORM_TYPE` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type_entity`
--

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (1,1);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (2,1);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (4,1);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (5,1);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (8,1);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (3,2);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (4,2);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (5,2);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (6,2);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (7,2);
INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES (8,2);
/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `find_feed_import_codes`
--

DROP TABLE IF EXISTS `find_feed_import_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `find_feed_import_codes` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `import_code` varchar(255) NOT NULL,
  `eav_code` varchar(255) NOT NULL,
  `is_imported` int(10) unsigned NOT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `find_feed_import_codes`
--

LOCK TABLES `find_feed_import_codes` WRITE;
/*!40000 ALTER TABLE `find_feed_import_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `find_feed_import_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(7) unsigned NOT NULL DEFAULT '0',
  `sender` varchar(255) NOT NULL DEFAULT '',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_message`
--

LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_attributes`
--

DROP TABLE IF EXISTS `googlebase_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` smallint(5) unsigned NOT NULL,
  `gbase_attribute` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  KEY `GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`),
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ATTRIBUTES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googlebase_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_attributes`
--

LOCK TABLES `googlebase_attributes` WRITE;
/*!40000 ALTER TABLE `googlebase_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_items`
--

DROP TABLE IF EXISTS `googlebase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `gbase_item_id` varchar(255) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `impr` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  KEY `GOOGLEBASE_ITEMS_STORE_ID` (`store_id`),
  CONSTRAINT `GOOGLEBASE_ITEMS_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `GOOGLEBASE_ITEMS_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_items`
--

LOCK TABLES `googlebase_items` WRITE;
/*!40000 ALTER TABLE `googlebase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlebase_types`
--

DROP TABLE IF EXISTS `googlebase_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlebase_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` smallint(5) unsigned NOT NULL,
  `gbase_itemtype` varchar(255) NOT NULL,
  `target_country` varchar(2) NOT NULL DEFAULT 'US',
  PRIMARY KEY (`type_id`),
  KEY `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  CONSTRAINT `GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlebase_types`
--

LOCK TABLES `googlebase_types` WRITE;
/*!40000 ALTER TABLE `googlebase_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlebase_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlecheckout_api_debug`
--

DROP TABLE IF EXISTS `googlecheckout_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dir` enum('in','out') DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlecheckout_api_debug`
--

LOCK TABLES `googlecheckout_api_debug` WRITE;
/*!40000 ALTER TABLE `googlecheckout_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlecheckout_notification`
--

DROP TABLE IF EXISTS `googlecheckout_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_notification` (
  `serial_number` varchar(30) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlecheckout_notification`
--

LOCK TABLES `googlecheckout_notification` WRITE;
/*!40000 ALTER TABLE `googlecheckout_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(50) NOT NULL DEFAULT '',
  `store_id` smallint(5) unsigned NOT NULL,
  `control_script` text,
  `tracking_script` text,
  `conversion_script` text,
  `conversion_page` varchar(255) NOT NULL DEFAULT '',
  `additional_data` text,
  PRIMARY KEY (`code_id`),
  KEY `GOOGLEOPTIMIZER_CODE_STORE` (`store_id`),
  CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googleoptimizer_code`
--

LOCK TABLES `googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_event`
--

DROP TABLE IF EXISTS `index_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_pk` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `old_data` mediumtext,
  `new_data` mediumtext,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `IDX_UNIQUE_EVENT` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_event`
--

LOCK TABLES `index_event` WRITE;
/*!40000 ALTER TABLE `index_event` DISABLE KEYS */;
INSERT INTO `index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES (1,'save','catalog_category',1,'2013-03-06 13:43:36','a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}','a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}');
INSERT INTO `index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES (2,'save','catalog_category',2,'2013-03-06 13:43:37','a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}','a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}');
/*!40000 ALTER TABLE `index_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process`
--

DROP TABLE IF EXISTS `index_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indexer_code` varchar(32) NOT NULL,
  `status` enum('pending','working','require_reindex') NOT NULL DEFAULT 'pending',
  `started_at` datetime DEFAULT NULL,
  `ended_at` datetime DEFAULT NULL,
  `mode` enum('real_time','manual') NOT NULL DEFAULT 'real_time',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `IDX_CODE` (`indexer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process`
--

LOCK TABLES `index_process` WRITE;
/*!40000 ALTER TABLE `index_process` DISABLE KEYS */;
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (1,'catalog_product_attribute','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (2,'catalog_product_price','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (3,'catalog_url','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (4,'catalog_product_flat','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (5,'catalog_category_flat','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (6,'catalog_category_product','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (7,'catalogsearch_fulltext','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (8,'cataloginventory_stock','require_reindex',NULL,NULL,'real_time');
INSERT INTO `index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES (9,'tag_summary','require_reindex',NULL,NULL,'real_time');
/*!40000 ALTER TABLE `index_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process_event`
--

DROP TABLE IF EXISTS `index_process_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process_event` (
  `process_id` int(10) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `status` enum('new','working','done','error') NOT NULL DEFAULT 'new',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `FK_INDEX_EVNT_PROCESS` (`event_id`),
  CONSTRAINT `FK_INDEX_EVNT_PROCESS` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INDEX_PROCESS_EVENT` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process_event`
--

LOCK TABLES `index_process_event` WRITE;
/*!40000 ALTER TABLE `index_process_event` DISABLE KEYS */;
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (3,1,'done');
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (3,2,'done');
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (6,1,'done');
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (6,2,'done');
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (7,1,'done');
INSERT INTO `index_process_event` (`process_id`, `event_id`, `status`) VALUES (7,2,'done');
/*!40000 ALTER TABLE `index_process_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_customer`
--

DROP TABLE IF EXISTS `log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_at` datetime DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customers log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_customer`
--

LOCK TABLES `log_customer` WRITE;
/*!40000 ALTER TABLE `log_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_quote`
--

DROP TABLE IF EXISTS `log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote log data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_quote`
--

LOCK TABLES `log_quote` WRITE;
/*!40000 ALTER TABLE `log_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary`
--

DROP TABLE IF EXISTS `log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL,
  `type_id` smallint(5) unsigned DEFAULT NULL,
  `visitor_count` int(11) NOT NULL DEFAULT '0',
  `customer_count` int(11) NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summary log information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary`
--

LOCK TABLES `log_summary` WRITE;
/*!40000 ALTER TABLE `log_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary_type`
--

DROP TABLE IF EXISTS `log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_code` varchar(64) NOT NULL DEFAULT '',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0',
  `period_type` enum('MINUTE','HOUR','DAY','WEEK','MONTH') NOT NULL DEFAULT 'MINUTE',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Type of summary information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary_type`
--

LOCK TABLES `log_summary_type` WRITE;
/*!40000 ALTER TABLE `log_summary_type` DISABLE KEYS */;
INSERT INTO `log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES (1,'hour',1,'HOUR');
INSERT INTO `log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES (2,'day',1,'DAY');
/*!40000 ALTER TABLE `log_summary_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url`
--

DROP TABLE IF EXISTS `log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `visit_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`url_id`),
  KEY `IDX_VISITOR` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='URL visiting history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url`
--

LOCK TABLES `log_url` WRITE;
/*!40000 ALTER TABLE `log_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url_info`
--

DROP TABLE IF EXISTS `log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Detale information about url visit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url_info`
--

LOCK TABLES `log_url_info` WRITE;
/*!40000 ALTER TABLE `log_url_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_url_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor`
--

DROP TABLE IF EXISTS `log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` char(64) NOT NULL DEFAULT '',
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System visitors log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor`
--

LOCK TABLES `log_visitor` WRITE;
/*!40000 ALTER TABLE `log_visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_info`
--

DROP TABLE IF EXISTS `log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `http_referer` varchar(255) DEFAULT NULL,
  `http_user_agent` varchar(255) DEFAULT NULL,
  `http_accept_charset` varchar(255) DEFAULT NULL,
  `http_accept_language` varchar(255) DEFAULT NULL,
  `server_addr` bigint(20) DEFAULT NULL,
  `remote_addr` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional information by visitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_info`
--

LOCK TABLES `log_visitor_info` WRITE;
/*!40000 ALTER TABLE `log_visitor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_online`
--

DROP TABLE IF EXISTS `log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_type` char(1) NOT NULL,
  `remote_addr` bigint(20) NOT NULL,
  `first_visit_at` datetime DEFAULT NULL,
  `last_visit_at` datetime DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `last_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_VISIT_TIME` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_CUSTOMER` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_online`
--

LOCK TABLES `log_visitor_online` WRITE;
/*!40000 ALTER TABLE `log_visitor_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(7) unsigned DEFAULT NULL,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `problem_error_code` int(3) unsigned DEFAULT '0',
  `problem_error_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`problem_id`),
  KEY `FK_PROBLEM_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_PROBLEM_QUEUE` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`),
  CONSTRAINT `FK_PROBLEM_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_problem`
--

LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(7) unsigned NOT NULL DEFAULT '0',
  `newsletter_type` int(3) DEFAULT NULL,
  `newsletter_text` text,
  `newsletter_styles` text,
  `newsletter_subject` varchar(200) DEFAULT NULL,
  `newsletter_sender_name` varchar(200) DEFAULT NULL,
  `newsletter_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `queue_status` int(3) unsigned NOT NULL DEFAULT '0',
  `queue_start_at` datetime DEFAULT NULL,
  `queue_finish_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `FK_QUEUE_TEMPLATE` (`template_id`),
  CONSTRAINT `FK_QUEUE_TEMPLATE` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue`
--

LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `subscriber_id` int(7) unsigned NOT NULL DEFAULT '0',
  `letter_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`queue_link_id`),
  KEY `FK_QUEUE_LINK_SUBSCRIBER` (`subscriber_id`),
  KEY `FK_QUEUE_LINK_QUEUE` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SEND_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_QUEUE_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_QUEUE_LINK_SUBSCRIBER` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter queue to subscriber link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_link`
--

LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(7) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LINK_QUEUE` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_store_link`
--

LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT '0',
  `change_status_at` datetime DEFAULT NULL,
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `subscriber_email` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `subscriber_status` int(3) NOT NULL DEFAULT '0',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL',
  PRIMARY KEY (`subscriber_id`),
  KEY `FK_SUBSCRIBER_CUSTOMER` (`customer_id`),
  KEY `FK_NEWSLETTER_SUBSCRIBER_STORE` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscriber`
--

LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_template` (
  `template_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(150) DEFAULT NULL,
  `template_text` text,
  `template_text_preprocessed` text COMMENT 'deprecated since 1.4.0.1',
  `template_styles` text,
  `template_type` int(3) unsigned DEFAULT NULL,
  `template_subject` varchar(200) DEFAULT NULL,
  `template_sender_name` varchar(200) DEFAULT NULL,
  `template_sender_email` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `template_actual` tinyint(1) unsigned DEFAULT '1',
  `added_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_actual` (`template_actual`),
  KEY `added_at` (`added_at`),
  KEY `modified_at` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_template`
--

LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paygate_authorizenet_debug`
--

DROP TABLE IF EXISTS `paygate_authorizenet_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paygate_authorizenet_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_body` text,
  `response_body` text,
  `request_serialized` text,
  `result_serialized` text,
  `request_dump` text,
  `result_dump` text,
  PRIMARY KEY (`debug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paygate_authorizenet_debug`
--

LOCK TABLES `paygate_authorizenet_debug` WRITE;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paygate_authorizenet_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_api_debug`
--

DROP TABLE IF EXISTS `paypal_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_api_debug`
--

LOCK TABLES `paypal_api_debug` WRITE;
/*!40000 ALTER TABLE `paypal_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `filename` varchar(24) NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `UNQ_REPORT_DATE_ACCOUNT` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report`
--

LOCK TABLES `paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(19) NOT NULL,
  `invoice_id` varchar(127) DEFAULT NULL,
  `paypal_reference_id` varchar(19) NOT NULL,
  `paypal_reference_id_type` enum('ODR','TXN','SUB','PAP','') NOT NULL,
  `transaction_event_code` char(5) NOT NULL DEFAULT '',
  `transaction_initiation_date` datetime DEFAULT NULL,
  `transaction_completion_date` datetime DEFAULT NULL,
  `transaction_debit_or_credit` enum('CR','DR') NOT NULL DEFAULT 'CR',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `gross_transaction_currency` char(3) NOT NULL DEFAULT '',
  `fee_debit_or_credit` enum('CR','DR') NOT NULL,
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `fee_currency` char(3) NOT NULL,
  `custom_field` varchar(255) DEFAULT NULL,
  `consumer_id` varchar(127) NOT NULL DEFAULT '',
  PRIMARY KEY (`row_id`),
  KEY `IDX_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_PAYPAL_SETTLEMENT_ROW_REPORT` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report_row`
--

LOCK TABLES `paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypaluk_api_debug`
--

DROP TABLE IF EXISTS `paypaluk_api_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypaluk_api_debug` (
  `debug_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `debug_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_body` text,
  `response_body` text,
  PRIMARY KEY (`debug_id`),
  KEY `debug_at` (`debug_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypaluk_api_debug`
--

LOCK TABLES `paypaluk_api_debug` WRITE;
/*!40000 ALTER TABLE `paypaluk_api_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypaluk_api_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `date_posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_closed` datetime DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `answers_display` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`poll_id`),
  KEY `FK_POLL_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` (`poll_id`, `poll_title`, `votes_count`, `store_id`, `date_posted`, `date_closed`, `active`, `closed`, `answers_display`) VALUES (1,'What is your favorite color',5,1,'2013-03-06 15:45:02',NULL,1,0,NULL);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_title` varchar(255) NOT NULL DEFAULT '',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `answer_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_id`),
  KEY `FK_POLL_PARENT` (`poll_id`),
  CONSTRAINT `FK_POLL_PARENT` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES (1,1,'Green',4,0);
INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES (2,1,'Red',1,0);
INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES (3,1,'Black',0,0);
INSERT INTO `poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES (4,1,'Magenta',0,0);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_store`
--

DROP TABLE IF EXISTS `poll_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `FK_POLL_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POLL_STORE_POLL` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_store`
--

LOCK TABLES `poll_store` WRITE;
/*!40000 ALTER TABLE `poll_store` DISABLE KEYS */;
INSERT INTO `poll_store` (`poll_id`, `store_id`) VALUES (1,1);
/*!40000 ALTER TABLE `poll_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vote_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vote_id`),
  KEY `FK_POLL_ANSWER` (`poll_answer_id`),
  CONSTRAINT `FK_POLL_ANSWER` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_vote`
--

LOCK TABLES `poll_vote` WRITE;
/*!40000 ALTER TABLE `poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_price_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_PRICE_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_price`
--

LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_date` datetime DEFAULT NULL,
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`alert_stock_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_CUSTOMER` (`customer_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_PRODUCT` (`product_id`),
  KEY `FK_PRODUCT_ALERT_STOCK_WEBSITE` (`website_id`),
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_stock`
--

LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rating_code` varchar(64) NOT NULL DEFAULT '',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `IDX_CODE` (`rating_code`),
  KEY `FK_RATING_ENTITY` (`entity_id`),
  CONSTRAINT `FK_RATING_ENTITY_KEY` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES (1,1,'Quality',0);
INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES (2,1,'Value',0);
INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES (3,1,'Price',0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `IDX_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_entity`
--

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES (1,'product');
INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES (2,'product_review');
INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES (3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `FK_RATING_OPTION_RATING` (`rating_id`),
  CONSTRAINT `FK_RATING_OPTION_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option`
--

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (1,1,'1',1,1);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (2,1,'2',2,2);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (3,1,'3',3,3);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (4,1,'4',4,4);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (5,1,'5',5,5);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (6,2,'1',1,1);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (7,2,'2',2,2);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (8,2,'3',3,3);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (9,2,'4',4,4);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (10,2,'5',5,5);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (11,3,'1',1,1);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (12,3,'2',2,2);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (13,3,'3',3,3);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (14,3,'4',4,4);
INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES (15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remote_ip` varchar(16) NOT NULL DEFAULT '',
  `remote_ip_long` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) unsigned DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `review_id` bigint(20) unsigned DEFAULT NULL,
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `value` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `FK_RATING_OPTION_VALUE_OPTION` (`option_id`),
  KEY `FK_RATING_OPTION_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_RATING_OPTION_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VALUE_OPTION` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote`
--

LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `percent` tinyint(3) NOT NULL DEFAULT '0',
  `percent_approved` tinyint(3) DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_RATING_OPTION_VALUE_AGGREGATE` (`rating_id`),
  KEY `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_OPTION_VALUE_AGGREGATE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote_aggregated`
--

LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_STORE_RATING` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_store`
--

LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `FK_RATING_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_RATING_TITLE` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_title`
--

LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_compared_product_index`
--

LOCK TABLES `report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logged_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event_type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subtype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `IDX_EVENT_TYPE` (`event_type_id`),
  KEY `IDX_SUBJECT` (`subject_id`),
  KEY `IDX_OBJECT` (`object_id`),
  KEY `IDX_SUBTYPE` (`subtype`),
  KEY `FK_REPORT_EVENT_STORE` (`store_id`),
  CONSTRAINT `FK_REPORT_EVENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_EVENT_TYPE` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event`
--

LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(64) NOT NULL,
  `customer_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event_types`
--

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (1,'catalog_product_view',1);
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (2,'sendfriend_product',1);
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (3,'catalog_product_compare_add_product',1);
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (4,'checkout_cart_add_product',1);
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (5,'wishlist_add_product',1);
INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES (6,'wishlist_share',1);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_BY_VISITOR` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_BY_CUSTOMER` (`customer_id`,`product_id`),
  KEY `IDX_STORE` (`store_id`),
  KEY `IDX_SORT_ADDED_AT` (`added_at`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_index`
--

LOCK TABLES `report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0',
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `FK_REVIEW_ENTITY` (`entity_id`),
  KEY `FK_REVIEW_STATUS` (`status_id`),
  KEY `FK_REVIEW_PARENT_PRODUCT` (`entity_pk_value`),
  CONSTRAINT `FK_REVIEW_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `nickname` varchar(128) NOT NULL DEFAULT '',
  `customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `FK_REVIEW_DETAIL_REVIEW` (`review_id`),
  KEY `FK_REVIEW_DETAIL_STORE` (`store_id`),
  KEY `FK_REVIEW_DETAIL_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_detail`
--

LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `entity_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES (1,'product');
INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES (2,'customer');
INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES (3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0',
  `entity_type` tinyint(4) NOT NULL DEFAULT '0',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0',
  `rating_summary` tinyint(4) NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`primary_id`),
  KEY `FK_REVIEW_ENTITY_SUMMARY_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity_summary`
--

LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_status` (
  `status_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` (`status_id`, `status_code`) VALUES (1,'Approved');
INSERT INTO `review_status` (`status_id`, `status_code`) VALUES (2,'Pending');
INSERT INTO `review_status` (`status_id`, `status_code`) VALUES (3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `FK_REVIEW_STORE_STORE` (`store_id`),
  CONSTRAINT `FK_REVIEW_STORE_REVIEW` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STORE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_store`
--

LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_DAILY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--

LOCK TABLES `sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_MONTHLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_PRODUCT` (`period`,`store_id`,`product_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_PRODUCT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ORDERED_AGGREGATED_YEARLY_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement`
--

DROP TABLE IF EXISTS `sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `method_code` varchar(32) NOT NULL,
  `reference_id` varchar(32) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `agreement_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agreement_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `FK_BILLING_AGREEMENT_STORE` (`store_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement`
--

LOCK TABLES `sales_billing_agreement` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `UNQ_BILLING_AGREEMENT_ORDER` (`agreement_id`,`order_id`),
  KEY `FK_BILLING_AGREEMENT_ORDER_ORDER` (`order_id`),
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BILLING_AGREEMENT_ORDER_AGREEMENT` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement_order`
--

LOCK TABLES `sales_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_adjustment` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `adjustment` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `creditmemo_status` int(10) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `invoice_id` int(10) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo`
--

LOCK TABLES `sales_flat_creditmemo` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_comment`
--

LOCK TABLES `sales_flat_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `creditmemo_status` int(10) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `invoice_id` int(10) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_grid`
--

LOCK TABLES `sales_flat_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_row_total` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_item`
--

LOCK TABLES `sales_flat_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice`
--

DROP TABLE IF EXISTS `sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `is_used_for_refund` tinyint(1) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `can_void_flag` tinyint(1) unsigned DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice`
--

LOCK TABLES `sales_flat_invoice` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` tinyint(1) unsigned DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_comment`
--

LOCK TABLES `sales_flat_invoice_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `state` int(10) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` char(3) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_grid`
--

LOCK TABLES `sales_flat_invoice_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `base_row_total` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `weee_tax_applied` text,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_item`
--

LOCK TABLES `sales_flat_invoice_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order`
--

DROP TABLE IF EXISTS `sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `protect_code` varchar(255) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `base_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_discount_canceled` decimal(12,4) DEFAULT NULL,
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL,
  `base_discount_refunded` decimal(12,4) DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL,
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `base_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_tax_canceled` decimal(12,4) DEFAULT NULL,
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_to_order_rate` decimal(12,4) DEFAULT NULL,
  `base_total_canceled` decimal(12,4) DEFAULT NULL,
  `base_total_invoiced` decimal(12,4) DEFAULT NULL,
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL,
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL,
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL,
  `base_total_paid` decimal(12,4) DEFAULT NULL,
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL,
  `base_total_refunded` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `discount_canceled` decimal(12,4) DEFAULT NULL,
  `discount_invoiced` decimal(12,4) DEFAULT NULL,
  `discount_refunded` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `shipping_canceled` decimal(12,4) DEFAULT NULL,
  `shipping_invoiced` decimal(12,4) DEFAULT NULL,
  `shipping_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL,
  `store_to_base_rate` decimal(12,4) DEFAULT NULL,
  `store_to_order_rate` decimal(12,4) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `subtotal_canceled` decimal(12,4) DEFAULT NULL,
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL,
  `subtotal_refunded` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `tax_canceled` decimal(12,4) DEFAULT NULL,
  `tax_invoiced` decimal(12,4) DEFAULT NULL,
  `tax_refunded` decimal(12,4) DEFAULT NULL,
  `total_canceled` decimal(12,4) DEFAULT NULL,
  `total_invoiced` decimal(12,4) DEFAULT NULL,
  `total_offline_refunded` decimal(12,4) DEFAULT NULL,
  `total_online_refunded` decimal(12,4) DEFAULT NULL,
  `total_paid` decimal(12,4) DEFAULT NULL,
  `total_qty_ordered` decimal(12,4) DEFAULT NULL,
  `total_refunded` decimal(12,4) DEFAULT NULL,
  `can_ship_partially` tinyint(1) unsigned DEFAULT NULL,
  `can_ship_partially_item` tinyint(1) unsigned DEFAULT NULL,
  `customer_is_guest` tinyint(1) unsigned DEFAULT NULL,
  `customer_note_notify` tinyint(1) unsigned DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `customer_group_id` smallint(5) DEFAULT NULL,
  `edit_increment` int(10) DEFAULT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `forced_do_shipment_with_invoice` tinyint(1) unsigned DEFAULT NULL,
  `gift_message_id` int(10) DEFAULT NULL,
  `payment_authorization_expiration` int(10) DEFAULT NULL,
  `paypal_ipn_customer_notified` int(10) DEFAULT NULL,
  `quote_address_id` int(10) DEFAULT NULL,
  `quote_id` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `adjustment_negative` decimal(12,4) DEFAULT NULL,
  `adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL,
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_total_due` decimal(12,4) DEFAULT NULL,
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `total_due` decimal(12,4) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `customer_dob` datetime DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `applied_rule_ids` varchar(255) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_firstname` varchar(255) DEFAULT NULL,
  `customer_lastname` varchar(255) DEFAULT NULL,
  `customer_middlename` varchar(255) DEFAULT NULL,
  `customer_prefix` varchar(255) DEFAULT NULL,
  `customer_suffix` varchar(255) DEFAULT NULL,
  `customer_taxvat` varchar(255) DEFAULT NULL,
  `discount_description` varchar(255) DEFAULT NULL,
  `ext_customer_id` varchar(255) DEFAULT NULL,
  `ext_order_id` varchar(255) DEFAULT NULL,
  `global_currency_code` char(3) DEFAULT NULL,
  `hold_before_state` varchar(255) DEFAULT NULL,
  `hold_before_status` varchar(255) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `original_increment_id` varchar(50) DEFAULT NULL,
  `relation_child_id` varchar(32) DEFAULT NULL,
  `relation_child_real_id` varchar(32) DEFAULT NULL,
  `relation_parent_id` varchar(32) DEFAULT NULL,
  `relation_parent_real_id` varchar(32) DEFAULT NULL,
  `remote_ip` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `store_currency_code` char(3) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `x_forwarded_for` varchar(255) DEFAULT NULL,
  `customer_note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_item_count` smallint(5) unsigned DEFAULT '0',
  `customer_gender` int(11) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STATE` (`state`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order`
--

LOCK TABLES `sales_flat_order` WRITE;
/*!40000 ALTER TABLE `sales_flat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_address`
--

DROP TABLE IF EXISTS `sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `customer_address_id` int(10) DEFAULT NULL,
  `quote_address_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_address`
--

LOCK TABLES `sales_flat_order_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_grid`
--

DROP TABLE IF EXISTS `sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `base_grand_total` decimal(12,4) DEFAULT NULL,
  `base_total_paid` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `total_paid` decimal(12,4) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `base_currency_code` char(3) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STATUS` (`status`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_TOTAL_PAID` (`total_paid`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_BILLING_NAME` (`billing_name`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_grid`
--

LOCK TABLES `sales_flat_order_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_item`
--

DROP TABLE IF EXISTS `sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_item_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `product_options` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000',
  `base_cost` decimal(12,4) DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `original_price` decimal(12,4) DEFAULT NULL,
  `base_original_price` decimal(12,4) DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `gift_message_id` int(10) DEFAULT NULL,
  `gift_message_available` int(10) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `ext_order_item_id` varchar(255) DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `locked_do_invoice` tinyint(1) unsigned DEFAULT NULL,
  `locked_do_ship` tinyint(1) unsigned DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL,
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL,
  `is_nominal` int(11) NOT NULL DEFAULT '0',
  `tax_canceled` decimal(12,4) DEFAULT NULL,
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL,
  `tax_refunded` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_ORDER` (`order_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_item`
--

LOCK TABLES `sales_flat_order_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_payment`
--

DROP TABLE IF EXISTS `sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `base_shipping_captured` decimal(12,4) DEFAULT NULL,
  `shipping_captured` decimal(12,4) DEFAULT NULL,
  `amount_refunded` decimal(12,4) DEFAULT NULL,
  `base_amount_paid` decimal(12,4) DEFAULT NULL,
  `amount_canceled` decimal(12,4) DEFAULT NULL,
  `base_amount_authorized` decimal(12,4) DEFAULT NULL,
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL,
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL,
  `base_shipping_amount` decimal(12,4) DEFAULT NULL,
  `shipping_amount` decimal(12,4) DEFAULT NULL,
  `amount_paid` decimal(12,4) DEFAULT NULL,
  `amount_authorized` decimal(12,4) DEFAULT NULL,
  `base_amount_ordered` decimal(12,4) DEFAULT NULL,
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL,
  `shipping_refunded` decimal(12,4) DEFAULT NULL,
  `base_amount_refunded` decimal(12,4) DEFAULT NULL,
  `amount_ordered` decimal(12,4) DEFAULT NULL,
  `base_amount_canceled` decimal(12,4) DEFAULT NULL,
  `ideal_transaction_checked` tinyint(1) unsigned DEFAULT NULL,
  `quote_payment_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `cc_exp_month` varchar(255) DEFAULT NULL,
  `cc_ss_start_year` varchar(255) DEFAULT NULL,
  `echeck_bank_name` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `cc_debug_request_body` varchar(255) DEFAULT NULL,
  `cc_secure_verify` varchar(255) DEFAULT NULL,
  `cybersource_token` varchar(255) DEFAULT NULL,
  `ideal_issuer_title` varchar(255) DEFAULT NULL,
  `protection_eligibility` varchar(255) DEFAULT NULL,
  `cc_approval` varchar(255) DEFAULT NULL,
  `cc_last4` varchar(255) DEFAULT NULL,
  `cc_status_description` varchar(255) DEFAULT NULL,
  `echeck_type` varchar(255) DEFAULT NULL,
  `paybox_question_number` varchar(255) DEFAULT NULL,
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL,
  `cc_ss_start_month` varchar(255) DEFAULT NULL,
  `echeck_account_type` varchar(255) DEFAULT NULL,
  `last_trans_id` varchar(255) DEFAULT NULL,
  `cc_cid_status` varchar(255) DEFAULT NULL,
  `cc_owner` varchar(255) DEFAULT NULL,
  `cc_type` varchar(255) DEFAULT NULL,
  `ideal_issuer_id` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `cc_exp_year` varchar(255) DEFAULT NULL,
  `cc_status` varchar(255) DEFAULT NULL,
  `echeck_routing_number` varchar(255) DEFAULT NULL,
  `account_status` varchar(255) DEFAULT NULL,
  `anet_trans_method` varchar(255) DEFAULT NULL,
  `cc_debug_response_body` varchar(255) DEFAULT NULL,
  `cc_ss_issue` varchar(255) DEFAULT NULL,
  `echeck_account_name` varchar(255) DEFAULT NULL,
  `cc_avs_status` varchar(255) DEFAULT NULL,
  `cc_number_enc` varchar(255) DEFAULT NULL,
  `cc_trans_id` varchar(255) DEFAULT NULL,
  `flo2cash_account_id` varchar(255) DEFAULT NULL,
  `paybox_request_number` varchar(255) DEFAULT NULL,
  `address_status` varchar(255) DEFAULT NULL,
  `additional_information` text,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_payment`
--

LOCK TABLES `sales_flat_order_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `status` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_status_history`
--

LOCK TABLES `sales_flat_order_status_history` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote`
--

DROP TABLE IF EXISTS `sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `converted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) unsigned DEFAULT '1',
  `is_virtual` tinyint(1) unsigned DEFAULT '0',
  `is_multi_shipping` tinyint(1) unsigned DEFAULT '0',
  `items_count` int(10) unsigned DEFAULT '0',
  `items_qty` decimal(12,4) DEFAULT '0.0000',
  `orig_order_id` int(10) unsigned DEFAULT '0',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000',
  `base_currency_code` varchar(255) DEFAULT NULL,
  `store_currency_code` varchar(255) DEFAULT NULL,
  `quote_currency_code` varchar(255) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(255) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT '0',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0',
  `customer_group_id` int(10) unsigned DEFAULT '0',
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_prefix` varchar(40) DEFAULT NULL,
  `customer_firstname` varchar(255) DEFAULT NULL,
  `customer_middlename` varchar(40) DEFAULT NULL,
  `customer_lastname` varchar(255) DEFAULT NULL,
  `customer_suffix` varchar(40) DEFAULT NULL,
  `customer_dob` datetime DEFAULT NULL,
  `customer_note` varchar(255) DEFAULT NULL,
  `customer_note_notify` tinyint(1) unsigned DEFAULT '1',
  `customer_is_guest` tinyint(1) unsigned DEFAULT '0',
  `remote_ip` varchar(32) DEFAULT NULL,
  `applied_rule_ids` varchar(255) DEFAULT NULL,
  `reserved_order_id` varchar(64) DEFAULT '',
  `password_hash` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `global_currency_code` varchar(255) DEFAULT NULL,
  `base_to_global_rate` decimal(12,4) DEFAULT NULL,
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL,
  `customer_taxvat` varchar(255) DEFAULT NULL,
  `customer_gender` varchar(255) DEFAULT NULL,
  `subtotal` decimal(12,4) DEFAULT NULL,
  `base_subtotal` decimal(12,4) DEFAULT NULL,
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL,
  `is_changed` int(10) unsigned DEFAULT NULL,
  `trigger_recollect` tinyint(1) NOT NULL DEFAULT '0',
  `ext_shipping_info` text,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER` (`customer_id`,`store_id`,`is_active`),
  KEY `FK_SALES_QUOTE_STORE` (`store_id`),
  KEY `IDX_IS_ACTIVE` (`is_active`),
  CONSTRAINT `FK_SALES_QUOTE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote`
--

LOCK TABLES `sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address`
--

DROP TABLE IF EXISTS `sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `save_in_address_book` tinyint(1) DEFAULT '0',
  `customer_address_id` int(10) unsigned DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `prefix` varchar(40) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `country_id` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `collect_shipping_rates` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_method` varchar(255) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_notes` text,
  `applied_taxes` text,
  `discount_description` varchar(255) DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL,
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address`
--

LOCK TABLES `sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applied_rule_ids` text,
  `additional_data` text,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `super_product_id` int(10) unsigned DEFAULT NULL,
  `parent_product_id` int(10) unsigned DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `free_shipping` int(10) unsigned DEFAULT NULL,
  `is_qty_decimal` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT NULL,
  `no_discount` int(10) unsigned DEFAULT NULL,
  `tax_percent` decimal(12,4) DEFAULT NULL,
  `base_price` decimal(12,4) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`address_item_id`),
  KEY `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` (`quote_address_id`),
  KEY `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` (`quote_item_id`),
  CONSTRAINT `FK_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address_item`
--

LOCK TABLES `sales_flat_quote_address_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `parent_item_id` int(10) unsigned DEFAULT NULL,
  `is_virtual` tinyint(1) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `applied_rule_ids` text,
  `additional_data` text,
  `free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_qty_decimal` tinyint(1) unsigned DEFAULT NULL,
  `no_discount` tinyint(1) unsigned DEFAULT '0',
  `weight` decimal(12,4) DEFAULT '0.0000',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000',
  `row_weight` decimal(12,4) DEFAULT '0.0000',
  `product_type` varchar(255) DEFAULT NULL,
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL,
  `tax_before_discount` decimal(12,4) DEFAULT NULL,
  `original_custom_price` decimal(12,4) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `base_cost` decimal(12,4) DEFAULT NULL,
  `price_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL,
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL,
  `gift_message_id` int(10) unsigned DEFAULT NULL,
  `weee_tax_applied` text,
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL,
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL,
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL,
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` (`parent_item_id`),
  KEY `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` (`product_id`),
  KEY `FK_SALES_QUOTE_ITEM_SALES_QUOTE` (`quote_id`),
  KEY `FK_SALES_QUOTE_ITEM_STORE` (`store_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_CATALOG_PRODUCT_ENTITY` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item`
--

LOCK TABLES `sales_flat_quote_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional options for quote item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item_option`
--

LOCK TABLES `sales_flat_quote_item_option` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `method` varchar(255) DEFAULT '',
  `cc_type` varchar(255) DEFAULT '',
  `cc_number_enc` varchar(255) DEFAULT '',
  `cc_last4` varchar(255) DEFAULT '',
  `cc_cid_enc` varchar(255) DEFAULT '',
  `cc_owner` varchar(255) DEFAULT '',
  `cc_exp_month` tinyint(2) unsigned DEFAULT '0',
  `cc_exp_year` smallint(4) unsigned DEFAULT '0',
  `cc_ss_owner` varchar(255) DEFAULT '',
  `cc_ss_start_month` tinyint(2) unsigned DEFAULT '0',
  `cc_ss_start_year` smallint(4) unsigned DEFAULT '0',
  `cybersource_token` varchar(255) DEFAULT '',
  `paypal_correlation_id` varchar(255) DEFAULT '',
  `paypal_payer_id` varchar(255) DEFAULT '',
  `paypal_payer_status` varchar(255) DEFAULT '',
  `po_number` varchar(255) DEFAULT '',
  `additional_data` text,
  `cc_ss_issue` varchar(255) DEFAULT NULL,
  `additional_information` text,
  `ideal_issuer_id` varchar(255) DEFAULT NULL,
  `ideal_issuer_list` text,
  PRIMARY KEY (`payment_id`),
  KEY `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` (`quote_id`),
  CONSTRAINT `FK_SALES_QUOTE_PAYMENT_SALES_QUOTE` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_payment`
--

LOCK TABLES `sales_flat_quote_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `carrier` varchar(255) DEFAULT NULL,
  `carrier_title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `method_description` text,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `error_message` text,
  `method_title` text,
  PRIMARY KEY (`rate_id`),
  KEY `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` (`address_id`),
  CONSTRAINT `FK_SALES_QUOTE_SHIPPING_RATE_ADDRESS` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--

LOCK TABLES `sales_flat_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment`
--

DROP TABLE IF EXISTS `sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `email_sent` tinyint(1) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `shipping_address_id` int(10) DEFAULT NULL,
  `billing_address_id` int(10) DEFAULT NULL,
  `shipment_status` int(10) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_PARENT` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment`
--

LOCK TABLES `sales_flat_shipment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `is_customer_notified` int(10) DEFAULT NULL,
  `is_visible_on_front` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_COMMENT_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_comment`
--

LOCK TABLES `sales_flat_shipment_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `total_qty` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `shipment_status` int(10) DEFAULT NULL,
  `increment_id` varchar(50) DEFAULT NULL,
  `order_increment_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_created_at` datetime DEFAULT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_STORE_ID` (`store_id`),
  KEY `IDX_TOTAL_QTY` (`total_qty`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_INCREMENT_ID` (`increment_id`),
  KEY `IDX_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  KEY `IDX_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_PARENT` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_grid`
--

LOCK TABLES `sales_flat_shipment_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `row_total` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `order_item_id` int(10) DEFAULT NULL,
  `additional_data` text,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ITEM_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_item`
--

LOCK TABLES `sales_flat_shipment_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `qty` decimal(12,4) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `number` text,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `carrier_code` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_TRACK_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_track`
--

LOCK TABLES `sales_flat_shipment_track` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated`
--

LOCK TABLES `sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `orders_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `invoiced_not_captured` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--

LOCK TABLES `sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_created`
--

LOCK TABLES `sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `percent` decimal(12,4) NOT NULL,
  `amount` decimal(12,4) NOT NULL,
  `priority` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `base_amount` decimal(12,4) NOT NULL,
  `process` smallint(6) NOT NULL,
  `base_real_amount` decimal(12,4) NOT NULL,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_ORDER_TAX` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax`
--

LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `txn_id` varchar(100) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(100) DEFAULT NULL,
  `txn_type` varchar(15) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `additional_information` blob,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_ORDER_PAYMENT_TXN` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_ORDER_ID` (`order_id`),
  KEY `IDX_PARENT_ID` (`parent_id`),
  KEY `IDX_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_PAYMENT` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_payment_transaction`
--

LOCK TABLES `sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile`
--

DROP TABLE IF EXISTS `sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(20) NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `method_code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reference_id` varchar(32) DEFAULT NULL,
  `subscriber_name` varchar(150) DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `internal_reference_id` varchar(42) NOT NULL,
  `schedule_description` varchar(255) NOT NULL,
  `suspension_threshold` smallint(6) unsigned DEFAULT NULL,
  `bill_failed_later` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `period_unit` varchar(20) NOT NULL,
  `period_frequency` tinyint(3) unsigned DEFAULT NULL,
  `period_max_cycles` tinyint(3) unsigned DEFAULT NULL,
  `billing_amount` double(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `trial_period_unit` varchar(20) DEFAULT NULL,
  `trial_period_frequency` tinyint(3) unsigned DEFAULT NULL,
  `trial_period_max_cycles` tinyint(3) unsigned DEFAULT NULL,
  `trial_billing_amount` double(12,4) unsigned DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `shipping_amount` decimal(12,4) unsigned DEFAULT NULL,
  `tax_amount` decimal(12,4) unsigned DEFAULT NULL,
  `init_amount` decimal(12,4) unsigned DEFAULT NULL,
  `init_may_fail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order_info` text NOT NULL,
  `order_item_info` text NOT NULL,
  `billing_address_info` text NOT NULL,
  `shipping_address_info` text,
  `profile_vendor_info` text,
  `additional_info` text,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `UNQ_INTERNAL_REF_ID` (`internal_reference_id`),
  KEY `IDX_RECURRING_PROFILE_CUSTOMER` (`customer_id`),
  KEY `IDX_RECURRING_PROFILE_STORE` (`store_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile`
--

LOCK TABLES `sales_recurring_profile` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_PROFILE_ORDER` (`profile_id`,`order_id`),
  KEY `IDX_ORDER` (`order_id`),
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RECURRING_PROFILE_ORDER_PROFILE` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile_order`
--

LOCK TABLES `sales_recurring_profile_order` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated`
--

LOCK TABLES `sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `online_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `offline_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--

LOCK TABLES `sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated`
--

LOCK TABLES `sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `shipping_description` varchar(255) NOT NULL DEFAULT '',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `total_shipping` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_shipping_actual` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_ORDER_STATUS` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--

LOCK TABLES `sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `from_date` date DEFAULT '0000-00-00',
  `to_date` date DEFAULT '0000-00-00',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0',
  `customer_group_ids` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions_serialized` mediumtext NOT NULL,
  `actions_serialized` mediumtext NOT NULL,
  `stop_rules_processing` tinyint(1) NOT NULL DEFAULT '1',
  `is_advanced` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `product_ids` text,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `simple_action` varchar(32) NOT NULL DEFAULT '',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_qty` decimal(12,4) unsigned DEFAULT NULL,
  `discount_step` int(10) unsigned NOT NULL,
  `simple_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apply_to_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `times_used` int(11) unsigned NOT NULL DEFAULT '0',
  `is_rss` tinyint(4) NOT NULL DEFAULT '0',
  `website_ids` text,
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`rule_id`),
  KEY `sort_order` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule`
--

LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `usage_limit` int(10) unsigned DEFAULT NULL,
  `usage_per_customer` int(10) unsigned DEFAULT NULL,
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration_date` datetime DEFAULT NULL,
  `is_primary` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_RULE_MAIN_COUPON` (`rule_id`,`is_primary`),
  KEY `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon`
--

LOCK TABLES `salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_COUPON_ID_CUSTOMER_ENTITY` (`coupon_id`),
  KEY `FK_SALESRULE_COUPON_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY` (`customer_id`),
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CUST_ID_CUST_ENTITY` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_CPN_CUST_CPN_ID_CUST_ENTITY` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_usage`
--

LOCK TABLES `salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` smallint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_customer_id`),
  KEY `rule_id` (`rule_id`,`customer_id`),
  KEY `customer_id` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_salesrule_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_salesrule_customer_rule` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `IDX_RULE_STORE` (`rule_id`,`store_id`),
  KEY `FK_SALESRULE_LABEL_STORE` (`store_id`),
  KEY `FK_SALESRULE_LABEL_RULE` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_LABEL_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_LABEL_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_label`
--

LOCK TABLES `salesrule_label` WRITE;
/*!40000 ALTER TABLE `salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL,
  `website_id` smallint(5) unsigned NOT NULL,
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `attribute_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_WEBSITE` (`website_id`),
  KEY `IDX_CUSTOMER_GROUP` (`customer_group_id`),
  KEY `IDX_ATTRIBUTE` (`attribute_id`),
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_product_attribute`
--

LOCK TABLES `salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  `website_id` smallint(5) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `IDX_REMOTE_ADDR` (`ip`),
  KEY `IDX_LOG_TIME` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendfriend_log`
--

LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) NOT NULL DEFAULT '0',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0',
  `dest_region_id` int(10) NOT NULL DEFAULT '0',
  `dest_zip` varchar(10) NOT NULL DEFAULT '',
  `condition_name` varchar(20) NOT NULL DEFAULT '',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `dest_country` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_tablerate`
--

LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_type` varchar(32) DEFAULT NULL,
  `sitemap_filename` varchar(32) DEFAULT NULL,
  `sitemap_path` tinytext,
  `sitemap_time` timestamp NULL DEFAULT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`sitemap_id`),
  KEY `FK_SITEMAP_STORE` (`store_id`),
  CONSTRAINT `FK_SITEMAP_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `first_customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `first_store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_properties`
--

DROP TABLE IF EXISTS `tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_properties` (
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `base_popularity` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `FK_TAG_PROPERTIES_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_PROPERTIES_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_PROPERTIES_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_properties`
--

LOCK TABLES `tag_properties` WRITE;
/*!40000 ALTER TABLE `tag_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_relation`
--

DROP TABLE IF EXISTS `tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_relation` (
  `tag_relation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_relation_id`),
  UNIQUE KEY `UNQ_TAG_CUSTOMER_PRODUCT_STORE` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_TAG` (`tag_id`),
  KEY `IDX_CUSTOMER` (`customer_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_TAG_RELATION_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_relation`
--

LOCK TABLES `tag_relation` WRITE;
/*!40000 ALTER TABLE `tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customers` int(11) unsigned NOT NULL DEFAULT '0',
  `products` int(11) unsigned NOT NULL DEFAULT '0',
  `uses` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  `historical_uses` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  `popularity` int(11) unsigned NOT NULL DEFAULT '0',
  `base_popularity` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'deprecated since 1.4.0.1',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `FK_TAG_SUMMARY_STORE` (`store_id`),
  KEY `IDX_TAG` (`tag_id`),
  CONSTRAINT `FK_TAG_SUMMARY_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_SUMMARY_TAG` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_rate_id` int(11) NOT NULL,
  `tax_calculation_rule_id` int(11) NOT NULL,
  `customer_tax_class_id` smallint(6) NOT NULL,
  `product_tax_class_id` smallint(6) NOT NULL,
  KEY `FK_TAX_CALCULATION_RULE` (`tax_calculation_rule_id`),
  KEY `FK_TAX_CALCULATION_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_CTC` (`customer_tax_class_id`),
  KEY `FK_TAX_CALCULATION_PTC` (`product_tax_class_id`),
  KEY `IDX_TAX_CALCULATION` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_TAX_CALCULATION_PTC` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_CTC` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RULE` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation`
--

LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
INSERT INTO `tax_calculation` (`tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES (1,1,3,2);
INSERT INTO `tax_calculation` (`tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES (2,1,3,2);
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_country_id` char(2) NOT NULL,
  `tax_region_id` mediumint(9) NOT NULL,
  `tax_postcode` varchar(21) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `zip_is_range` tinyint(1) DEFAULT NULL,
  `zip_from` int(11) unsigned DEFAULT NULL,
  `zip_to` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_TAX_CALCULATION_RATE_RANGE` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate`
--

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL);
INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES (2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_calculation_rate_id` int(11) NOT NULL,
  `store_id` smallint(5) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE` (`tax_calculation_rate_id`,`store_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_RATE` (`tax_calculation_rate_id`),
  KEY `FK_TAX_CALCULATION_RATE_TITLE_STORE` (`store_id`),
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_RATE` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate_title`
--

LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `priority` mediumint(9) NOT NULL,
  `position` mediumint(9) NOT NULL,
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rule`
--

LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
INSERT INTO `tax_calculation_rule` (`tax_calculation_rule_id`, `code`, `priority`, `position`) VALUES (1,'Retail Customer-Taxable Goods-Rate 1',1,1);
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `class_type` enum('CUSTOMER','PRODUCT') NOT NULL DEFAULT 'CUSTOMER',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES (2,'Taxable Goods','PRODUCT');
INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES (3,'Retail Customer','CUSTOMER');
INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES (4,'Shipping','PRODUCT');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period` date NOT NULL DEFAULT '0000-00-00',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `order_status` varchar(50) NOT NULL DEFAULT '',
  `percent` float(12,4) NOT NULL DEFAULT '0.0000',
  `orders_count` int(11) unsigned NOT NULL DEFAULT '0',
  `tax_base_amount_sum` float(12,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PERIOD_STORE_CODE_ORDER_STATUS` (`period`,`store_id`,`code`,`order_status`),
  KEY `IDX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_created`
--

LOCK TABLES `tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_discount`
--

DROP TABLE IF EXISTS `weee_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `customer_group_id` smallint(5) unsigned NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` (`customer_group_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_DISCOUNT_GROUP` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_discount`
--

LOCK TABLES `weee_discount` WRITE;
/*!40000 ALTER TABLE `weee_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(2) NOT NULL DEFAULT '',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `state` varchar(255) NOT NULL DEFAULT '*',
  `attribute_id` smallint(5) unsigned NOT NULL,
  `entity_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`value_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` (`website_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` (`entity_id`),
  KEY `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` (`country`),
  KEY `FK_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_COUNTRY` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_PRODUCT_ENTITY` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_WEEE_TAX_WEBSITE` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_tax`
--

LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parameters` text,
  PRIMARY KEY (`widget_id`),
  KEY `IDX_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance` (
  `instance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `package_theme` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `store_ids` varchar(255) NOT NULL DEFAULT '0',
  `widget_parameters` text,
  `sort_order` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance`
--

LOCK TABLES `widget_instance` WRITE;
/*!40000 ALTER TABLE `widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group` varchar(25) NOT NULL DEFAULT '',
  `layout_handle` varchar(255) NOT NULL DEFAULT '',
  `block_reference` varchar(255) NOT NULL DEFAULT '',
  `for` varchar(25) NOT NULL DEFAULT '',
  `entities` text,
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page`
--

LOCK TABLES `widget_instance_page` WRITE;
/*!40000 ALTER TABLE `widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `page_id` (`page_id`,`layout_update_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WIDGET_WIDGET_INSTANCE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page_layout`
--

LOCK TABLES `widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shared` tinyint(1) unsigned DEFAULT '0',
  `sharing_code` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_CUSTOMER` (`customer_id`),
  KEY `IDX_IS_SHARED` (`shared`),
  CONSTRAINT `FK_WISHLIST_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Wishlist main';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` smallint(5) unsigned DEFAULT NULL,
  `added_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST` (`wishlist_id`),
  KEY `IDX_PRODUCT` (`product_id`),
  KEY `IDX_STORE` (`store_id`),
  CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_STORE` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-06 18:00:29
