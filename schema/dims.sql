CREATE DATABASE dimsdb;
USE dimsdb;

-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: testims
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_year` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q4mtx9xbbvpy0qmrlq7rdm5uw` (`end_date`),
  UNIQUE KEY `UK_mbl3tb775vajt0nej812blqkc` (`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `schoolcode` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowed`
--

DROP TABLE IF EXISTS `allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `new_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ankdates`
--

DROP TABLE IF EXISTS `ankdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ankdates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_date` datetime(6) DEFAULT NULL,
  `date_description` varchar(255) DEFAULT NULL,
  `day_type` int(11) DEFAULT NULL,
  `holiday_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_table`
--

DROP TABLE IF EXISTS `asset_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_tag` varchar(255) DEFAULT NULL,
  `bluetooth_tag` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlwofej49rn7dapcy45wv1pr9q` (`user_userid`),
  CONSTRAINT `FKlwofej49rn7dapcy45wv1pr9q` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_tag`
--

DROP TABLE IF EXISTS `asset_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_tag` varchar(255) DEFAULT NULL,
  `bluetooth_tag` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calculated_results`
--

DROP TABLE IF EXISTS `calculated_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculated_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `scenario` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_table`
--

DROP TABLE IF EXISTS `connection_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connection_table` (
  `serial` varchar(255) DEFAULT NULL,
  `mac_address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_usage`
--

DROP TABLE IF EXISTS `content_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_usage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_oriented` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `dynamic_safe_listing` varchar(255) DEFAULT NULL,
  `e_banking` varchar(255) DEFAULT NULL,
  `educational` varchar(255) DEFAULT NULL,
  `entertainment` varchar(255) DEFAULT NULL,
  `game_sites` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `homemb` varchar(255) DEFAULT NULL,
  `media_content` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `schoolmb` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `web2global` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_date` (`grade`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1103774 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_notification`
--

DROP TABLE IF EXISTS `email_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `notification_level` int(11) DEFAULT NULL,
  `scenario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htype` int(11) NOT NULL DEFAULT '0',
  `holiday` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holiday_index` (`holiday`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `itype` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_itype_option` (`itype`,`option_value`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isd_calendar`
--

DROP TABLE IF EXISTS `isd_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isd_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calendar_date` datetime(6) DEFAULT NULL,
  `date_description` varchar(255) DEFAULT NULL,
  `day_type` int(11) NOT NULL,
  `holiday_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mmnu1uu39j1w79a1w9dbg4wwv` (`calendar_date`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isd_dates`
--

DROP TABLE IF EXISTS `isd_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isd_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_date` datetime(6) DEFAULT NULL,
  `date_description` varchar(255) DEFAULT NULL,
  `day_type` int(11) DEFAULT NULL,
  `holiday_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_info`
--

DROP TABLE IF EXISTS `job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron` varchar(255) DEFAULT NULL,
  `errormsg` text,
  `jsondata` text,
  `lastupdate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `integration_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKihk2cyqndn3kmdw761a0ohasw` (`integration_id`),
  CONSTRAINT `FKihk2cyqndn3kmdw761a0ohasw` FOREIGN KEY (`integration_id`) REFERENCES `integrations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdm_raw_data`
--

DROP TABLE IF EXISTS `mdm_raw_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdm_raw_data` (
  `mdm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(500) DEFAULT NULL,
  `last_check_in` datetime DEFAULT NULL,
  `mac_address` varchar(500) DEFAULT NULL,
  `serial_number` varchar(500) DEFAULT NULL,
  `ip_address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mdm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8418994 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdmdata`
--

DROP TABLE IF EXISTS `mdmdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdmdata` (
  `mdm_id` bigint(20) NOT NULL DEFAULT '0',
  `model` varchar(500) DEFAULT NULL,
  `last_check_in` datetime DEFAULT NULL,
  `mac_address` varchar(500) DEFAULT NULL,
  `serial_number` varchar(500) DEFAULT NULL,
  `ip_address` varchar(500) DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  KEY `last_check_in_index` (`last_check_in`),
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_number_index` (`serial_number`),
  KEY `mdm_composite_index` (`last_check_in`,`mac_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `non_net_work_data`
--

DROP TABLE IF EXISTS `non_net_work_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `non_net_work_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `asset_tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6u1yt5bgdedag9i85wicc1jau` (`asset_tag_id`),
  CONSTRAINT `FK6u1yt5bgdedag9i85wicc1jau` FOREIGN KEY (`asset_tag_id`) REFERENCES `asset_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_status` int(11) NOT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `student_or_employee_id` varchar(255) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK3yaqj2y14qu9or322nj41dvit` (`user_userid`),
  CONSTRAINT `FK3yaqj2y14qu9or322nj41dvit` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_results`
--

DROP TABLE IF EXISTS `notification_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `scenario` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pidata`
--

DROP TABLE IF EXISTS `pidata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pidata` (
  `pi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ap_name` varchar(255) DEFAULT NULL,
  `association_time` datetime(6) DEFAULT NULL,
  `client_ip_address` varchar(255) DEFAULT NULL,
  `client_mac_address` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `map_location` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `session_duration` varchar(255) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pidata_latest`
--

DROP TABLE IF EXISTS `pidata_latest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pidata_latest` (
  `client_ip_address` text,
  `client_mac_address` text,
  `association_time` datetime DEFAULT NULL,
  `ap_name` text,
  `device_name` text,
  `ssid` text,
  `protocol` text,
  `session_duration` text,
  `map_location` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_settings`
--

DROP TABLE IF EXISTS `project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settings_key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `jsondata` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `release_notes`
--

DROP TABLE IF EXISTS `release_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `note` text,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result_table`
--

DROP TABLE IF EXISTS `result_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ap_name` varchar(255) DEFAULT NULL,
  `asset_id` varchar(255) DEFAULT NULL,
  `asset_type` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `funding_source` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `last_audit_scan_date` datetime(6) DEFAULT NULL,
  `last_scan_date` datetime(6) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `manufacture` varchar(255) DEFAULT NULL,
  `mdm_status` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parent_tag` varchar(255) DEFAULT NULL,
  `pi_status` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `room_description` varchar(255) DEFAULT NULL,
  `secondary_check_status` int(11) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `zone_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `device_days_old` int(11) DEFAULT NULL,
  `transfer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_index` (`date`),
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_index` (`serial`),
  KEY `location_id` (`location_id`),
  KEY `tags_index` (`tag`),
  KEY `composite_index` (`date`,`secondary_check_status`,`mdm_status`),
  KEY `composite_index_with_zone` (`date`,`secondary_check_status`,`mdm_status`,`zone_id`),
  KEY `result_table_index_school` (`date`,`mdm_status`,`secondary_check_status`,`site_name`),
  KEY `location_search_index` (`date`,`mdm_status`,`secondary_check_status`,`location`),
  KEY `product_type_index` (`date`,`mdm_status`,`secondary_check_status`,`product_type`),
  KEY `grade_search_index` (`date`,`mdm_status`,`secondary_check_status`,`grade`),
  KEY `grade_search_with_zone_index` (`date`,`mdm_status`,`secondary_check_status`,`grade`,`zone_id`),
  KEY `grade_search_with_sitename_index` (`date`,`mdm_status`,`secondary_check_status`,`grade`,`site_name`),
  KEY `product_type_search_with_sitename_index` (`date`,`mdm_status`,`secondary_check_status`,`product_type`,`site_name`),
  KEY `product_type_search_with_zone_index` (`date`,`mdm_status`,`secondary_check_status`,`product_type`,`zone_id`),
  KEY `location_search_with_zone_index` (`date`,`mdm_status`,`secondary_check_status`,`location`,`zone_id`),
  KEY `location_search_with_siteName_index` (`date`,`mdm_status`,`secondary_check_status`,`location`,`site_name`),
  KEY `location_product_type_index` (`date`,`mdm_status`,`secondary_check_status`,`location`,`product_type`),
  KEY `location_product_type_grade_index` (`date`,`mdm_status`,`secondary_check_status`,`location`,`product_type`,`grade`),
  KEY `location_product_type_grade_index_with_siteName` (`date`,`mdm_status`,`secondary_check_status`,`location`,`product_type`,`grade`,`site_name`),
  KEY `location_product_type_grade_index_with_zone` (`date`,`mdm_status`,`secondary_check_status`,`location`,`product_type`,`grade`,`zone_id`),
  KEY `date_sitename_zoneid_index` (`date`,`mdm_status`,`secondary_check_status`,`zone_id`,`site_name`),
  KEY `date_sitename_product_type_zoneid_index` (`date`,`mdm_status`,`secondary_check_status`,`product_type`,`zone_id`,`site_name`),
  KEY `date_sitename_location_zoneid_index` (`date`,`mdm_status`,`secondary_check_status`,`location`,`zone_id`,`site_name`),
  KEY `location_date` (`date`,`location`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31011611 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenarios` (
  `date` datetime DEFAULT NULL,
  `scenario` varchar(10) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `stype` varchar(255) DEFAULT NULL,
  `first_notification` int(11) DEFAULT NULL,
  `second_notification` int(11) DEFAULT NULL,
  `third_notification` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `six_columns_student`
--

DROP TABLE IF EXISTS `six_columns_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `six_columns_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cell_internet` varchar(255) DEFAULT NULL,
  `home_internet` varchar(255) DEFAULT NULL,
  `ipad_opt_in_out` varchar(255) DEFAULT NULL,
  `last_update` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113784 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advisor_email_address` varchar(255) DEFAULT NULL,
  `advisor_name` varchar(255) DEFAULT NULL,
  `broad_band_at_home` int(11) NOT NULL,
  `cell_internet` varchar(255) DEFAULT NULL,
  `guardian_email_address` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `home_internet` varchar(255) DEFAULT NULL,
  `ipad_opt_in_out` varchar(255) DEFAULT NULL,
  `last_update` varchar(255) DEFAULT NULL,
  `optin_percent` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `student_campus_id` varchar(255) DEFAULT NULL,
  `student_campus_name` varchar(255) DEFAULT NULL,
  `student_email_address` varchar(255) DEFAULT NULL,
  `student_first_name` varchar(255) DEFAULT NULL,
  `student_gender` varchar(255) DEFAULT NULL,
  `student_grade` varchar(255) DEFAULT NULL,
  `student_has_ipad` varchar(255) DEFAULT NULL,
  `student_home_bound` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `student_last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57031 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_content_usage`
--

DROP TABLE IF EXISTS `test_content_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_content_usage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_oriented` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `dynamic_safe_listing` varchar(255) DEFAULT NULL,
  `e_banking` varchar(255) DEFAULT NULL,
  `educational` varchar(255) DEFAULT NULL,
  `entertainment` varchar(255) DEFAULT NULL,
  `game_sites` varchar(255) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `homemb` varchar(255) DEFAULT NULL,
  `media_content` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `schoolmb` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `web2global` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_date` (`grade`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipweb`
--

DROP TABLE IF EXISTS `tipweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipweb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(255) DEFAULT NULL,
  `asset_type` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `funding_source` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `last_audit_scan_date` datetime(6) DEFAULT NULL,
  `last_scan_date` datetime(6) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `manufacture` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_tag` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `room_description` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serialIndex` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=111231 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipweb_archive`
--

DROP TABLE IF EXISTS `tipweb_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipweb_archive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=96618 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_data`
--

DROP TABLE IF EXISTS `usage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_data` (
  `campus_code` varchar(255) DEFAULT NULL,
  `campus_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `ctype` varchar(255) DEFAULT NULL,
  `educationalweb2` varchar(255) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `iseductional` varchar(255) DEFAULT NULL,
  `mb` double(20,6) DEFAULT NULL,
  `mobility` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `utilization` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `category` (`category`,`time`),
  KEY `campus_name` (`campus_name`,`utilization`),
  KEY `grade_time` (`grade`,`time`),
  KEY `grade_time_category` (`grade`,`time`,`category`),
  KEY `grade_time_campus_name` (`grade`,`time`,`campus_name`),
  KEY `grade_time_category_description` (`grade`,`time`,`category_description`),
  KEY `grade_time_campus_name_utilization` (`grade`,`time`,`campus_name`,`utilization`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_data_old`
--

DROP TABLE IF EXISTS `usage_data_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_data_old` (
  `campus_code` varchar(255) DEFAULT NULL,
  `campus_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `ctype` varchar(255) DEFAULT NULL,
  `educationalweb2` varchar(255) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `iseductional` varchar(255) DEFAULT NULL,
  `mb` double(20,6) DEFAULT NULL,
  `mobility` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `utilization` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `category` (`category`,`time`),
  KEY `campus_name` (`campus_name`,`utilization`),
  KEY `grade_time` (`grade`,`time`),
  KEY `grade_time_category` (`grade`,`time`,`category`),
  KEY `grade_time_campus_name` (`grade`,`time`,`campus_name`),
  KEY `grade_time_category_description` (`grade`,`time`,`category_description`),
  KEY `grade_time_campus_name_utilization` (`grade`,`time`,`campus_name`,`utilization`)
) ENGINE=InnoDB AUTO_INCREMENT=131071 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_data_result`
--

DROP TABLE IF EXISTS `usage_data_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_data_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `result` varchar(20000) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`),
  CONSTRAINT `FKbo5ik0bthje7hum554xb17ry6` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `FKd0xwi6psywvnj59btfns0alnm` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_type` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `location` text,
  `range_values` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  `criteria_setting` varchar(255) DEFAULT 'With Settings',
  PRIMARY KEY (`id`),
  KEY `FK3g9b16uyqu9bk7oddt7j3o9eb` (`user_userid`),
  CONSTRAINT `FK3g9b16uyqu9bk7oddt7j3o9eb` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones_school`
--

DROP TABLE IF EXISTS `zones_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_name_in_tipweb` varchar(255) DEFAULT NULL,
  `school_name_in_web` varchar(255) DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `campus_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkrsg2j8h6miwb5n78betchgnu` (`zone_id`),
  CONSTRAINT `FKkrsg2j8h6miwb5n78betchgnu` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;


INSERT INTO `project_settings` VALUES (1,'dashboard_usage','0',NULL),(2,'dashboard_monthly_notification','0',NULL),(3,'dashboard_average_age','0',NULL),(4,'logo_light','lisd_light.png',NULL),(5,'logo_dark','lisd_dark.png',NULL),(6,'dashboard_daily_notification','0',NULL),(7,'Authentication','local','{\"url\": \"ldap://lisd-dc1.lisd.local:389\",\"domain\": \"lisd.local\" }'),(8,'SSL','','');

INSERT INTO `role` VALUES (1,'Admin','Admin');

INSERT INTO `zones` VALUES (1,'All');

-- insert into user (active,email,password) values ('','dims','$2a$10$RLK49pM5EirlpvdQ7EeoheAJwIxM5Rowf6dEKA6/z8mnl1WUDGed2');

-- SET FOREIGN_KEY_CHECKS = 0;
-- insert into user_role (userid,roleid) values (1,1);
-- SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `integrations` VALUES (1,'Incident IQ Inventory','INVENTORY','Incident IQ','INCIDENTIQ'),(2,'Inventory','INVENTORY','TipWeb','TIPWEB'),(3,'Ipads and MacBooks','MDM','JAMF','JAMF'),(4,'Chromebooks','MDM','Google','GOOGLE'),(5,'Windows','MDM','Microsoft','INTUNE'),(6,'Meraki Controller','MDM','Cisco Meraki','Meraki'),(7,'WL Controller','NETWORK','Cisco WLC','WLC'),(8,'Meraki Controller','NETWORK','Cisco Meraki','Meraki');

-- INSERT INTO `setting_labels` VALUES (26,'deviceType','Chromebook'),(24,'deviceType','DESKTOP-APPLE'),(27,'deviceType','DESKTOP-WINDOWS'),(22,'deviceType','IPAD'),(25,'deviceType','LAPTOPS-APPLE'),(28,'deviceType','LAPTOPS-WINDOWS'),(23,'deviceType','TV-APPLE'),(9,'grade','01'),(10,'grade','02'),(11,'grade','03'),(12,'grade','04'),(13,'grade','05'),(14,'grade','06'),(15,'grade','07'),(16,'grade','08'),(17,'grade','09'),(18,'grade','10'),(19,'grade','11'),(20,'grade','12'),(21,'grade','GD'),(8,'grade','KG'),(5,'grade','P2'),(6,'grade','P3'),(7,'grade','P4'),(3,'role','Room'),(1,'role','Staff'),(2,'role','Student'),(4,'role','Transfer');


