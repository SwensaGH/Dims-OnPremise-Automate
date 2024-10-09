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
  `zones_school_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment`
--
DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `category`
--
DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `incident_type_incident_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FKeiel7nqjxu4kmefso9tm9qcsu` (`pid`),
  KEY `FK1tyyngy7pcm6y7de1g1eyuq8h` (`incident_type_incident_type_id`),
  CONSTRAINT `FK1tyyngy7pcm6y7de1g1eyuq8h` FOREIGN KEY (`incident_type_incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  CONSTRAINT `FKeiel7nqjxu4kmefso9tm9qcsu` FOREIGN KEY (`pid`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `connection_table`
--

DROP TABLE IF EXISTS `connection_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connection_table` (
  `serial` varchar(255) DEFAULT NULL,
  `mac_address` varchar(500) DEFAULT NULL
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_index` (`serial`)
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
  `user_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grade_date` (`grade`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1103774 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_attributes_definition`
--
DROP TABLE IF EXISTS `custom_attributes_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attributes_definition` (
  `custom_attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `custom_attribute_type` varchar(255) DEFAULT NULL,
  `lastupdate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `datatype` int(11) NOT NULL,
  PRIMARY KEY (`custom_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_satisfaction_survey`
--
DROP TABLE IF EXISTS `customer_satisfaction_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_satisfaction_survey` (
  `survery_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `likelihood_to_recommend` int(11) DEFAULT NULL,
  `overall_satisfaction` int(11) DEFAULT NULL,
  `product_quality` int(11) DEFAULT NULL,
  `service_quality` int(11) DEFAULT NULL,
  `support_quality` int(11) DEFAULT NULL,
  `survey_date` datetime(6) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`survery_id`),
  KEY `FK42mikjep5d5546yapsa5iyss0` (`user_userid`),
  CONSTRAINT `FK42mikjep5d5546yapsa5iyss0` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--
DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_users`
--
DROP TABLE IF EXISTS `department_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_users` (
  `department_dept_id` bigint(20) NOT NULL,
  `users_userid` bigint(20) NOT NULL,
  PRIMARY KEY (`department_dept_id`,`users_userid`),
  KEY `FKsdf202bxsrk57dsg004t3iql1` (`users_userid`),
  CONSTRAINT `FKm8q43nb5hdcm0sg5kcd5hg45v` FOREIGN KEY (`department_dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `FKsdf202bxsrk57dsg004t3iql1` FOREIGN KEY (`users_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_custom_attribute`
--
DROP TABLE IF EXISTS `device_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_custom_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attribute_id` bigint(20) NOT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint(20) DEFAULT NULL,
  `purchase_order_product_device_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg3xv050mf9gqp083a9fsq90ek` (`custom_attribute_id`),
  KEY `FKlw1dovfsqn78ccb7ukgaty1ul` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FKqg1sslcv8iak7pydxxjprb0lb` (`purchase_order_product_device_id_id`),
  CONSTRAINT `FKqg1sslcv8iak7pydxxjprb0lb` FOREIGN KEY (`purchase_order_product_device_id_id`) REFERENCES `purchase_order_product_devices` (`id`),
  CONSTRAINT `FKg3xv050mf9gqp083a9fsq90ek` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`),
  CONSTRAINT `FKlw1dovfsqn78ccb7ukgaty1ul` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_history`
--
DROP TABLE IF EXISTS `device_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available_status` enum('Auctioned','Available','Disposed','InRepair','In_use','Lost','PendingTransfer','Received','Recycled','ReturnedToVendor','Sold','Stolen','Surplus','UsedForParts') DEFAULT NULL,
  `date_type` datetime(6) DEFAULT NULL,
  `device_hold_status` bit(1) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `tag_no` varchar(255) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `site_id_id` bigint(20) DEFAULT NULL,
  `student_staff_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5nfikw77e31roir2bq40vhj3j` (`room_id`),
  KEY `FKrkcdbfusta8l9txkafftfg2gj` (`site_id_id`),
  KEY `FKnkbp5645naf28fjlim6rwppix` (`student_staff_id_id`),
  CONSTRAINT `FKnkbp5645naf28fjlim6rwppix` FOREIGN KEY (`student_staff_id_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FK5nfikw77e31roir2bq40vhj3j` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKrkcdbfusta8l9txkafftfg2gj` FOREIGN KEY (`site_id_id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_status`
--
DROP TABLE IF EXISTS `device_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_type`
--
DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_type_name` varchar(255) DEFAULT NULL,
  `type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_notification`
--

DROP TABLE IF EXISTS `email_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_notification` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `notification_level` int(11) DEFAULT NULL,
  `scenario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--
DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `email_template_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_source`
--
DROP TABLE IF EXISTS `funding_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_info`
--
DROP TABLE IF EXISTS `group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_info` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `htype` int(11) NOT NULL DEFAULT '0',
  `holiday` datetime(6)  DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holiday_index` (`holiday`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inactive`
--
DROP TABLE IF EXISTS `inactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inactive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advisor_email` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `parent_email` varchar(255) DEFAULT NULL,
  `school_code` varchar(255) DEFAULT NULL,
  `serial_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `serial_index` (`serial_id`),
  KEY `status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_duration`
--
DROP TABLE IF EXISTS `incident_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_duration` (
  `duration_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `duration_in_minits` int(11) DEFAULT NULL,
  `logged_date` date DEFAULT NULL,
  `incident_incident_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`duration_id`),
  KEY `FKey2foay9p840vh40vxdxvmt3w` (`incident_incident_id`),
  CONSTRAINT `FKey2foay9p840vh40vxdxvmt3w` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_labor_events`
--
DROP TABLE IF EXISTS `incident_labor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_labor_events` (
  `incident_labor_events_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `logged_date` date DEFAULT NULL,
  `incident_incident_id` bigint(20) DEFAULT NULL,
  `labor_event_labor_event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`incident_labor_events_id`),
  KEY `FKo3aam7rc4n0ct23sslggvb3a4` (`incident_incident_id`),
  KEY `FKetpc7fyjuqho717yitquv22sy` (`labor_event_labor_event_id`),
  CONSTRAINT `FKetpc7fyjuqho717yitquv22sy` FOREIGN KEY (`labor_event_labor_event_id`) REFERENCES `labor_event` (`labor_event_id`),
  CONSTRAINT `FKo3aam7rc4n0ct23sslggvb3a4` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_notes`
--
DROP TABLE IF EXISTS `incident_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_notes` (
  `incident_notes_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logged_date` date DEFAULT NULL,
  `notes` text NOT NULL,
  `incident_incident_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`incident_notes_id`),
  KEY `FKtc33rr80fgf3irn2eb98creri` (`incident_incident_id`),
  CONSTRAINT `FKtc33rr80fgf3irn2eb98creri` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_pictures`
--
DROP TABLE IF EXISTS `incident_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_pictures` (
  `incident_pictures_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mediatype` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `incident_template_id` bigint(20) NOT NULL,
  PRIMARY KEY (`incident_pictures_id`),
  KEY `FK474in8jubr4h2ubi8ewhkof1j` (`incident_template_id`),
  CONSTRAINT `FK474in8jubr4h2ubi8ewhkof1j` FOREIGN KEY (`incident_template_id`) REFERENCES `incident_template` (`incident_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template`
--
DROP TABLE IF EXISTS `incident_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_template` (
  `incident_template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `inactive` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`incident_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_category`
--
DROP TABLE IF EXISTS `incident_template_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_template_category` (
  `incident_template_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`incident_template_id`,`category_id`),
  KEY `FK7f3u114hxwwikv07bu0lery3h` (`category_id`),
  CONSTRAINT `FK6x9ckxoo7v7n7a7tl56wjq6pp` FOREIGN KEY (`incident_template_id`) REFERENCES `incident_template` (`incident_template_id`),
  CONSTRAINT `FK7f3u114hxwwikv07bu0lery3h` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_field_value`
--
DROP TABLE IF EXISTS `incident_template_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_template_field_value` (
  `itf_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_value` varchar(255) DEFAULT NULL,
  `incident_template_field_i_template_field_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`itf_id`),
  KEY `FK1g6sffdfebha80aib1rqsse4j` (`incident_template_field_i_template_field_id`),
  CONSTRAINT `FK1g6sffdfebha80aib1rqsse4j` FOREIGN KEY (`incident_template_field_i_template_field_id`) REFERENCES `incident_template_field` (`i_template_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_tag`
--

DROP TABLE IF EXISTS `incident_template_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_template_tag` (
  `incident_template_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`incident_template_id`,`tag_id`),
  KEY `FKe0oj851t133din3g2ua9w28ua` (`tag_id`),
  CONSTRAINT `FKahba29v40oxllvdwvg80fudfc` FOREIGN KEY (`incident_template_id`) REFERENCES `incident_template` (`incident_template_id`),
  CONSTRAINT `FKe0oj851t133din3g2ua9w28ua` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_type`
--
DROP TABLE IF EXISTS `incident_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_type` (
  `incident_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`incident_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_value`
--
DROP TABLE IF EXISTS `incident_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_value` (
  `incident_value_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value_info` varbinary(255) DEFAULT NULL,
  `incident_template_field_i_template_field_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`incident_value_id`),
  KEY `FK80u5hdg502qugenpfhe9redv4` (`incident_template_field_i_template_field_id`),
  CONSTRAINT `FK80u5hdg502qugenpfhe9redv4` FOREIGN KEY (`incident_template_field_i_template_field_id`) REFERENCES `incident_template_field` (`i_template_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `inventory_category`
--
DROP TABLE IF EXISTS `inventory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_category` (
  `inventory_category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inventory_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `issue`
--
DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_category_id` bigint(20) DEFAULT NULL,
  `rule_rule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `FKt6wt97lpxwbk3arl45qlvdkcg` (`category_category_id`),
  KEY `FK1c1nhfobpdaiqk087qo1sgye4` (`rule_rule_id`),
  CONSTRAINT `FK1c1nhfobpdaiqk087qo1sgye4` FOREIGN KEY (`rule_rule_id`) REFERENCES `rule` (`rule_id`),
  CONSTRAINT `FKt6wt97lpxwbk3arl45qlvdkcg` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `html_code` text,
  PRIMARY KEY (`id`),
  KEY `FKihk2cyqndn3kmdw761a0ohasw` (`integration_id`),
  CONSTRAINT `FKihk2cyqndn3kmdw761a0ohasw` FOREIGN KEY (`integration_id`) REFERENCES `integrations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_info_report`
--
DROP TABLE IF EXISTS `job_info_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_info_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datetime` date DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `inactive` int(11) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `locationid` varchar(255) DEFAULT NULL,
  `missing_type` varchar(255) DEFAULT NULL,
  `notify` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `siteid` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `working_days` bigint(20) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `job_info_report_details`
--
DROP TABLE IF EXISTS `job_info_report_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_info_report_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `notify_email` varchar(255) DEFAULT NULL,
  `notify_type` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labor_event`
--
DROP TABLE IF EXISTS `labor_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labor_event` (
  `labor_event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `total_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`labor_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license`
--
DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `license_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `item_no` varchar(255) DEFAULT NULL,
  `model_no` varchar(255) DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `remaining` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_no` bigint(20) DEFAULT NULL,
  `inventory_category_id` bigint(20) DEFAULT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  `license_vendor_id` bigint(20) DEFAULT NULL,
  `vendor_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`license_id`),
  KEY `FKokoeii4gqsr0wxfukv7wupi40` (`inventory_category_id`),
  KEY `FKmbf3adsc07fojx8lntdfc9v9k` (`site_id`),
  KEY `FKq5tflqy58b9sqgasnsxss20s2` (`license_vendor_id`),
  KEY `FKk9vj58pqhakg111hseybsyefj` (`vendor_product_id`),
  CONSTRAINT `FKk9vj58pqhakg111hseybsyefj` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_product` (`vendor_product_id`),
  CONSTRAINT `FKmbf3adsc07fojx8lntdfc9v9k` FOREIGN KEY (`site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKokoeii4gqsr0wxfukv7wupi40` FOREIGN KEY (`inventory_category_id`) REFERENCES `inventory_category` (`inventory_category_id`),
  CONSTRAINT `FKq5tflqy58b9sqgasnsxss20s2` FOREIGN KEY (`license_vendor_id`) REFERENCES `license_vendor` (`license_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `license_assignment`
--
DROP TABLE IF EXISTS `license_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_assignment` (
  `assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_date` datetime(6) DEFAULT NULL,
  `hold_status` bit(1) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `from_site_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `FKmrxr0re9mk4b1dgwwttl3a1oa` (`from_site_id`),
  KEY `FKadpdhyk30bfpno7r13thlqtp5` (`room_id`),
  KEY `FKiahwwmhv7udjh75574g0dfh58` (`user_id`),
  KEY `FKjixb1l8x77cehgiej5kpdukvg` (`site_id`),
  CONSTRAINT `FKjixb1l8x77cehgiej5kpdukvg` FOREIGN KEY (`site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKadpdhyk30bfpno7r13thlqtp5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKiahwwmhv7udjh75574g0dfh58` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKmrxr0re9mk4b1dgwwttl3a1oa` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_key`
--
DROP TABLE IF EXISTS `license_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_key` (
  `license_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) DEFAULT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `license_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`license_key_id`),
  KEY `FKjjc6me5opl2t7ppvxpvo4o8v6` (`license_id`),
  CONSTRAINT `FKjjc6me5opl2t7ppvxpvo4o8v6` FOREIGN KEY (`license_id`) REFERENCES `license` (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_vendor`
--
DROP TABLE IF EXISTS `license_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_vendor` (
  `license_vendor_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`license_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `managers`
--
DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `school_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp2sr8hi9qk4nvb62a3sab4m8e` (`email`,`name`,`user_type`,`school_code`),
  KEY `FKhju8rrbci5ivnnsrpx87dx3sr` (`school_code`),
  CONSTRAINT `FKhju8rrbci5ivnnsrpx87dx3sr` FOREIGN KEY (`school_code`) REFERENCES `zones_school` (`school_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manufacturer`
--
DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `source` varchar(50) NOT NULL,
  `loaddate` date NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  KEY `last_check_in_index` (`last_check_in`),
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_number_index` (`serial_number`),
  KEY `mdm_composite_index` (`last_check_in`,`mac_address`)
  KEY `idxloaddate` (`loaddate`)
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
-- Table structure for table `part_assignment`
--
DROP TABLE IF EXISTS `part_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_assignment` (
  `part_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hold_status` bit(1) DEFAULT NULL,
  `quantity` bigint(20) NOT NULL,
  `from_site_id` bigint(20) DEFAULT NULL,
  `part_inventory_id` bigint(20) DEFAULT NULL,
  `to_site_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`part_assignment_id`),
  KEY `FKed2jx3jogx5vl58g7s70c1qag` (`from_site_id`),
  KEY `FKmluax1t4tmpthopcyf8coaudu` (`part_inventory_id`),
  KEY `FK39edlpva33wfno8cuasj63dij` (`to_site_id`),
  KEY `FKs30brsvxppenfvf4hw3lpt6pp` (`user_id`),
  CONSTRAINT `FKs30brsvxppenfvf4hw3lpt6pp` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK39edlpva33wfno8cuasj63dij` FOREIGN KEY (`to_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKed2jx3jogx5vl58g7s70c1qag` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKmluax1t4tmpthopcyf8coaudu` FOREIGN KEY (`part_inventory_id`) REFERENCES `part_inventory` (`part_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `part_inventory`
--
DROP TABLE IF EXISTS `part_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_inventory` (
  `part_inventory_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `is_consumable` bit(1) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `quantity_in_stock` bigint(20) NOT NULL,
  `remaining` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`part_inventory_id`),
  KEY `FKkyxjjpq7vpc2luw1pu10qq6gl` (`location_id`),
  CONSTRAINT `FKkyxjjpq7vpc2luw1pu10qq6gl` FOREIGN KEY (`location_id`) REFERENCES `zones_school` (`id`)
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
  `client_mac_address` varchar(18) NOT NULL,
  `association_time` datetime DEFAULT NULL,
  `ap_name` text,
  `device_name` text,
  `ssid` text,
  `protocol` text,
  `session_duration` text,
  `map_location` text,
  `source` varchar(50) NOT NULL,
  `loaddate` date NOT NULL,
  PRIMARY KEY (`loaddate`,`client_mac_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `product`
--
DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `suggested_price` varchar(255) DEFAULT NULL,
  `device_type_id` bigint(20) DEFAULT NULL,
  `manufacturer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1bb1ecw5gjignuvobkee6bibq` (`device_type_id`),
  KEY `FK89igr5j06uw5ps04djxgom0l1` (`manufacturer_id`),
  CONSTRAINT `FK89igr5j06uw5ps04djxgom0l1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`),
  CONSTRAINT `FK1bb1ecw5gjignuvobkee6bibq` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `product_custom_attributes`
--
DROP TABLE IF EXISTS `product_custom_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_custom_attributes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbtg716wyqqojrv2fh4k6fvdlo` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FK9j8xriibhki91t7a68uyvovgn` (`product_id`),
  CONSTRAINT `FK9j8xriibhki91t7a68uyvovgn` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKbtg716wyqqojrv2fh4k6fvdlo` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`)
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
  `image_date` longblob,
   `image_data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `purchase_order`
--
DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_delivery_date` datetime(6) DEFAULT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `no_of_devices` bigint(20) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `status` enum('CLOSED','OPEN') DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20jcn7pw6hvx0uo0sh4y1d9xv` (`vendor_id`),
  CONSTRAINT `FK20jcn7pw6hvx0uo0sh4y1d9xv` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_custom_attribute`
--
DROP TABLE IF EXISTS `purchase_order_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_custom_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attribute_id` bigint(20) NOT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint(20) DEFAULT NULL,
  `purchase_order_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7gkgtmoaqhba0r8fmwos170wk` (`custom_attribute_id`),
  KEY `FK9k5kqrr133qoko3mn5yk95ep` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FKf69ub2jvtmn60fqfklyihs326` (`purchase_order_id_id`),
  CONSTRAINT `FKf69ub2jvtmn60fqfklyihs326` FOREIGN KEY (`purchase_order_id_id`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `FK7gkgtmoaqhba0r8fmwos170wk` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`),
  CONSTRAINT `FK9k5kqrr133qoko3mn5yk95ep` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `purchase_order_product_devices`
--
DROP TABLE IF EXISTS `purchase_order_product_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_product_devices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  `status` enum('Auctioned','Available','Disposed','InRepair','In_use','Lost','PendingTransfer','Received','Recycled','ReturnedToVendor','Sold','Stolen','Surplus','UsedForParts') DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `warranty_end_date` datetime(6) DEFAULT NULL,
  `purchase_order_product_shipping_details_id_id` bigint(20) DEFAULT NULL,
  `room_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o5wnj1t6txdudtbgsm1r7l2rr` (`tag`),
  KEY `FK2rrpd6noivubrkvnoybrvdccy` (`purchase_order_product_shipping_details_id_id`),
  KEY `FKpqxhm4s17twb9q3o6ljewpog0` (`room_id_id`),
  CONSTRAINT `FKpqxhm4s17twb9q3o6ljewpog0` FOREIGN KEY (`room_id_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FK2rrpd6noivubrkvnoybrvdccy` FOREIGN KEY (`purchase_order_product_shipping_details_id_id`) REFERENCES `purchase_order_product_shipping_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `purchase_order_product_shipping_details`
--
DROP TABLE IF EXISTS `purchase_order_product_shipping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_product_shipping_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_date` datetime(6) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `received_tags` int(11) DEFAULT NULL,
  `shipping_quantity` int(11) DEFAULT NULL,
  `purchase_order_product_id_id` bigint(20) DEFAULT NULL,
  `site_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjjxafk07khde2jerue6pcsk4t` (`purchase_order_product_id_id`),
  KEY `FKafc8qsmm48uql9pp33k5e8ksa` (`site_id_id`),
  CONSTRAINT `FKafc8qsmm48uql9pp33k5e8ksa` FOREIGN KEY (`site_id_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKjjxafk07khde2jerue6pcsk4t` FOREIGN KEY (`purchase_order_product_id_id`) REFERENCES `purchaseorderproducts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchaseorderproducts`
--
DROP TABLE IF EXISTS `purchaseorderproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_code` varchar(255) DEFAULT NULL,
  `ordered_quantity` bigint(20) DEFAULT NULL,
  `purchase_price` varchar(255) DEFAULT NULL,
  `received_quantity` bigint(20) DEFAULT NULL,
  `status` enum('CLOSED','OPEN') DEFAULT NULL,
  `funding_source_id` bigint(20) DEFAULT NULL,
  `product_number_id` bigint(20) DEFAULT NULL,
  `purchase_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq61bglngm4fe68pbl58hb3xni` (`funding_source_id`),
  KEY `FKhw02rd66279ltmx7wdifj5m27` (`product_number_id`),
  KEY `FKc8x6j42iccbq20naeqhg9htod` (`purchase_order_id`),
  CONSTRAINT `FKc8x6j42iccbq20naeqhg9htod` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `FKhw02rd66279ltmx7wdifj5m27` FOREIGN KEY (`product_number_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKq61bglngm4fe68pbl58hb3xni` FOREIGN KEY (`funding_source_id`) REFERENCES `funding_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `user_status` int(11) DEFAULT '0',
  `calc_mdm` int(11) DEFAULT '0',
  `calc_network` int(11) DEFAULT '0',
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
  KEY `idx_result_table_optimization` (`date`,`mdm_status`,`secondary_check_status`,`user_status`,`location`,`site_name`,`product_type`,`grade`,`department`),
  KEY `idx_result_table_optimization_manufacture` (`date`,`mdm_status`,`secondary_check_status`,`user_status`,`location`,`site_name`,`product_type`,`grade`,`manufacture`),
  KEY `user_status_index` (`user_status`),
  KEY `include_user_status` (`date`,`secondary_check_status`,`mdm_status`,`location`,`product_type`,`grade`,`site_name`,`user_status`)
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
-- Table structure for table `room`
--
DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `zones_school_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKif7dh87vfk3d9ifpdedb1i5qm` (`zones_school_id`),
  CONSTRAINT `FKif7dh87vfk3d9ifpdedb1i5qm` FOREIGN KEY (`zones_school_id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rule`
--
DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conditions` text,
  `creation_trigger` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enddate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `resolution_trigger` bit(1) DEFAULT NULL,
  `servicelevelagreement` text,
  `shedule_trigger` bit(1) DEFAULT NULL,
  `stale_trigger` bit(1) DEFAULT NULL,
  `startdate` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_trigger` bit(1) DEFAULT NULL,
  `email_template_template_id` bigint(20) DEFAULT NULL,
  `incident_template_incident_template_id` bigint(20) DEFAULT NULL,
  `team_team_id` bigint(20) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `UK_grpcpo2gw6wgy36qqfd5miag3` (`incident_template_incident_template_id`),
  UNIQUE KEY `UK_p6wa6fbd80trmg15pd7q477ag` (`team_team_id`),
  UNIQUE KEY `UK_iwoui3gxhfxrcqol0b6kg9t2v` (`user_userid`),
  KEY `FKsfbsbwpkgpaoc4xgk0tkfwy62` (`email_template_template_id`),
  CONSTRAINT `FKf9xo2ut9jvrrepcjp50l0rbo5` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKo14nhfcr8xwul1cg6388kexjf` FOREIGN KEY (`incident_template_incident_template_id`) REFERENCES `incident_template` (`incident_template_id`),
  CONSTRAINT `FKolj51uqolbg7n2xv3ey995jie` FOREIGN KEY (`team_team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `FKsfbsbwpkgpaoc4xgk0tkfwy62` FOREIGN KEY (`email_template_template_id`) REFERENCES `email_template` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenarios` (
  `date` date DEFAULT NULL,
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
-- Table structure for table `school_type`
--
DROP TABLE IF EXISTS `school_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_level_agreement`
--
DROP TABLE IF EXISTS `service_level_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_level_agreement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_hours_end` varchar(255) DEFAULT NULL,
  `business_hours_start` varchar(255) DEFAULT NULL,
  `days_of_week` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `resolution_time_in_minutes` int(11) DEFAULT NULL,
  `response_time_in_minutes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `setting_labels`
--
DROP TABLE IF EXISTS `setting_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_labels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_type` varchar(255) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKk1c0klvoy97tacl2pfc6ob7r8` (`setting_type`,`setting_value`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `storage`
--
DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `id` bigint(20) NOT NULL,
  `asset` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsi1moniwvv1ooat4easrubupq` (`school_id`),
  CONSTRAINT `FKsi1moniwvv1ooat4easrubupq` FOREIGN KEY (`school_id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `student_and_staff_for_inventory`
--
DROP TABLE IF EXISTS `student_and_staff_for_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_and_staff_for_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `department_dept_id` bigint(20) DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnchsg5gn0769udhlfqg37xt2` (`department_dept_id`),
  KEY `FKpmvt4kaesw70g9hida3it8a28` (`school_id`),
  CONSTRAINT `FKpmvt4kaesw70g9hida3it8a28` FOREIGN KEY (`school_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKqnchsg5gn0769udhlfqg37xt2` FOREIGN KEY (`department_dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--
DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `team`
--
DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_members`
--
DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `team_member_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `team_team_id` bigint(20) DEFAULT NULL,
  `user_userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`team_member_id`),
  UNIQUE KEY `UK_cm2y4471pgpf06uelfwcv68sf` (`user_userid`),
  KEY `FK2ym1sj502875uhxqysx3xlmbb` (`team_team_id`),
  CONSTRAINT `FK6lf97bvwlfljwd1dee6crgq66` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK2ym1sj502875uhxqysx3xlmbb` FOREIGN KEY (`team_team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `source` varchar(50) NOT NULL,
  `loaddate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `serialIndex` (`serial`)
  KEY `locationid_loaddate` (`location_id`,`loaddate`),
  KEY `tag` (`tag`)
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
-- Table structure for table `transfer_devices`
--
DROP TABLE IF EXISTS `transfer_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_devices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `device_status_id` bigint(20) DEFAULT NULL,
  `transfer_history_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ao78cmksufs9u6d49o4s4b4g` (`device_status_id`),
  KEY `FKejk8anxge5c7896nnaruu7f0k` (`transfer_history_id`),
  CONSTRAINT `FKejk8anxge5c7896nnaruu7f0k` FOREIGN KEY (`transfer_history_id`) REFERENCES `transfer_history` (`id`),
  CONSTRAINT `FK5ao78cmksufs9u6d49o4s4b4g` FOREIGN KEY (`device_status_id`) REFERENCES `device_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `transfer_history`
--
DROP TABLE IF EXISTS `transfer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_type` datetime(6) DEFAULT NULL,
  `devices_quantity` bigint(20) DEFAULT NULL,
  `status` enum('CLOSED','OPEN') DEFAULT NULL,
  `total_devices` bigint(20) DEFAULT NULL,
  `from_site_id_id` bigint(20) DEFAULT NULL,
  `to_site_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9jto1an1k7k2hc5fbprdku0xx` (`from_site_id_id`),
  KEY `FKlfw93aw0mdw1qgt5aauyh2ta9` (`to_site_id_id`),
  CONSTRAINT `FKlfw93aw0mdw1qgt5aauyh2ta9` FOREIGN KEY (`to_site_id_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FK9jto1an1k7k2hc5fbprdku0xx` FOREIGN KEY (`from_site_id_id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_category`
--
DROP TABLE IF EXISTS `usage_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_category` (
  `usage_category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usage_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
-- Table structure for table `usage_statistic`
--
DROP TABLE IF EXISTS `usage_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_statistic` (
  `usage_statistic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usage_category_usage_category_id` bigint(20) DEFAULT NULL,
  `zones_school_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `band_width` int(11) DEFAULT NULL,
  `device_in_school` tinyint(1) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `is_student` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`usage_statistic_id`),
  KEY `usage_category_usage_category_id_idx` (`usage_category_usage_category_id`),
  KEY `zones_school_id_idx` (`zones_school_id`),
  CONSTRAINT `FKm92khfxm9vnex1dhwtej0r7qm` FOREIGN KEY (`zones_school_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKhmj1qc8xoux5wbemmyyrelble` FOREIGN KEY (`usage_category_usage_category_id`) REFERENCES `usage_category` (`usage_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62908921 DEFAULT CHARSET=utf8mb4;
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
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
)ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_department`
--
DROP TABLE IF EXISTS `user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_department` (
  `userid` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`,`dept_id`),
  KEY `FKjdq54vxaf49ny9ohf12f2rer` (`dept_id`),
  CONSTRAINT `FKcrt2fxiq623bda6qtw4bwg95l` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKjdq54vxaf49ny9ohf12f2rer` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--
DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `userid` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`,`group_id`),
  KEY `FK9ej2am5bdj52esgddq0v4ff7i` (`group_id`),
  CONSTRAINT `FKccgbsuq4pyes7iuhgphlg37do` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK9ej2am5bdj52esgddq0v4ff7i` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `user_sites`
--
DROP TABLE IF EXISTS `user_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_sites` (
  `userid` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`,`id`),
  KEY `FKwpuyb9upjpfok3fgb7k7vax3` (`id`),
  CONSTRAINT `FKohdmetl2bpy7ue6vj38p6puiy` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKwpuyb9upjpfok3fgb7k7vax3` FOREIGN KEY (`id`) REFERENCES `zones_school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `vendor`
--
DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_product`
--
DROP TABLE IF EXISTS `vendor_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_product` (
  `vendor_product_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `license_vendor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`vendor_product_id`),
  KEY `FKpvyv35psxxbthmqaig2rnu7ho` (`license_vendor_id`),
  CONSTRAINT `FKpvyv35psxxbthmqaig2rnu7ho` FOREIGN KEY (`license_vendor_id`) REFERENCES `license_vendor` (`license_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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


--- INSERT INTO `project_settings`    VALUES (1,'dashboard_usage','0',NULL),(2,'dashboard_monthly_notification','0',NULL),(3,'dashboard_average_age','0',NULL),(4,'logo_light','lisd_light.png',NULL),(5,'logo_dark','lisd_dark.png',NULL),(6,'dashboard_daily_notification','0',NULL),(7,'Authentication','local','{\"url\": \"ldap://lisd-dc1.lisd.local:389\",\"domain\": \"lisd.local\" }'),(8,'SSL','1','');
INSERT INTO `project_settings`    VALUES (1,'dashboard_usage','0',NULL,NULL),(2,'dashboard_monthly_notification','0',NULL,NULL),(3,'dashboard_average_age','0',NULL,NULL),(4,'logo_lig ht','lisd_light.png',NULL,NULL),(5,'logo_dark','lisd_dark.png',NULL,NULL),(6,'dashboard_daily_notification','0',NULL,NULL),(7,'Authentication','local',NULL,NULL),(8,'SSL','1','',NULL);

INSERT INTO `role` VALUES (1,'Admin','Admin');

INSERT INTO `zones` VALUES (1,'All');

-- insert into user (active,email,password) values ('','dims','$2a$10$RLK49pM5EirlpvdQ7EeoheAJwIxM5Rowf6dEKA6/z8mnl1WUDGed2');

-- SET FOREIGN_KEY_CHECKS = 0;
-- insert into user_role (userid,roleid) values (1,1);
-- SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `integrations` VALUES (1,'Incident IQ Inventory','INVENTORY','Incident IQ','INCIDENTIQ'),(2,'Inventory','INVENTORY','TipWeb','TIPWEB'),(3,'Ipads and MacBooks','MDM','JAMF','JAMF'),(4,'Chromebooks','MDM','Google','GOOGLE'),(5,'Windows','MDM','Microsoft','INTUNE'),(6,'Meraki Controller','MDM','Cisco Meraki','MDM_MERAKI'),(7,'WL Controller','NETWORK','Cisco WLC','WLC'),(8,'Meraki Controller','NETWORK','Cisco Meraki','NETWORK_MERAKI');

-- INSERT INTO `setting_labels` VALUES (26,'deviceType','Chromebook'),(24,'deviceType','DESKTOP-APPLE'),(27,'deviceType','DESKTOP-WINDOWS'),(22,'deviceType','IPAD'),(25,'deviceType','LAPTOPS-APPLE'),(28,'deviceType','LAPTOPS-WINDOWS'),(23,'deviceType','TV-APPLE'),(9,'grade','01'),(10,'grade','02'),(11,'grade','03'),(12,'grade','04'),(13,'grade','05'),(14,'grade','06'),(15,'grade','07'),(16,'grade','08'),(17,'grade','09'),(18,'grade','10'),(19,'grade','11'),(20,'grade','12'),(21,'grade','GD'),(8,'grade','KG'),(5,'grade','P2'),(6,'grade','P3'),(7,'grade','P4'),(3,'role','Room'),(1,'role','Staff'),(2,'role','Student'),(4,'role','Transfer');

alter table asset_tag add constraint bluetooth_tag unique (bluetooth_tag);
