CREATE DATABASE dimsdb;
USE dimsdb;


-- MySQL dump 10.13  Distrib 8.4.3, for Linux (x86_64)
--
-- Host: localhost    Database: i3db
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absentees`
--

DROP TABLE IF EXISTS `absentees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absentees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schoolyear` varchar(50) DEFAULT NULL,
  `caldate` varchar(50) DEFAULT NULL,
  `schoolcode` varchar(50) DEFAULT NULL,
  `studentsabsent` int DEFAULT NULL,
  `studentsenrolled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q4mtx9xbbvpy0qmrlq7rdm5uw` (`end_date`),
  UNIQUE KEY `UK_mbl3tb775vajt0nej812blqkc` (`start_date`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_issue`
--

DROP TABLE IF EXISTS `admin_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_issue` (
  `admin_issue_id` bigint NOT NULL AUTO_INCREMENT,
  `discription` varchar(255) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`admin_issue_id`),
  KEY `FKcjrpv3c025sri4uj2c6vcq9nx` (`category_category_id`),
  CONSTRAINT `FKcjrpv3c025sri4uj2c6vcq9nx` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_issue_custom_fields`
--

DROP TABLE IF EXISTS `admin_issue_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_issue_custom_fields` (
  `admin_issue_admin_issue_id` bigint NOT NULL,
  `custom_fields_custom_fields_id` bigint NOT NULL,
  KEY `FK44fw3oqx6d0pyt5a83856i59d` (`custom_fields_custom_fields_id`),
  KEY `FK73s08vou4c7ncdot6umtavnsl` (`admin_issue_admin_issue_id`),
  CONSTRAINT `FK44fw3oqx6d0pyt5a83856i59d` FOREIGN KEY (`custom_fields_custom_fields_id`) REFERENCES `custom_fields` (`custom_fields_id`),
  CONSTRAINT `FK73s08vou4c7ncdot6umtavnsl` FOREIGN KEY (`admin_issue_admin_issue_id`) REFERENCES `admin_issue` (`admin_issue_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `schoolcode` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `agents_id` bigint NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emp_stu_number` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `employee_number` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agents_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents_custom_fields`
--

DROP TABLE IF EXISTS `agents_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_custom_fields` (
  `agents_agent_id` bigint NOT NULL,
  `custom_fields_custom_fields_id` bigint NOT NULL,
  KEY `FK50im2niqaabop3ohiekmhtkc1` (`custom_fields_custom_fields_id`),
  CONSTRAINT `FK50im2niqaabop3ohiekmhtkc1` FOREIGN KEY (`custom_fields_custom_fields_id`) REFERENCES `custom_fields` (`custom_fields_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents_incident_type`
--

DROP TABLE IF EXISTS `agents_incident_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_incident_type` (
  `agents_agent_id` bigint NOT NULL,
  `incident_type_incident_type_id` bigint NOT NULL,
  KEY `FK2lf08iniaiciu4uws0jadpb7u` (`incident_type_incident_type_id`),
  CONSTRAINT `FK2lf08iniaiciu4uws0jadpb7u` FOREIGN KEY (`incident_type_incident_type_id`) REFERENCES `incident_type` (`incident_type_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents_team`
--

DROP TABLE IF EXISTS `agents_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_team` (
  `agents_agent_id` bigint NOT NULL,
  `team_teams_id` bigint NOT NULL,
  KEY `FKks7pgl9l0liriadurn1699tjw` (`team_teams_id`),
  CONSTRAINT `FKks7pgl9l0liriadurn1699tjw` FOREIGN KEY (`team_teams_id`) REFERENCES `teams` (`teams_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_table`
--

DROP TABLE IF EXISTS `asset_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asset_tag` varchar(255) DEFAULT NULL,
  `bluetooth_tag` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlwofej49rn7dapcy45wv1pr9q` (`user_userid`),
  CONSTRAINT `FKlwofej49rn7dapcy45wv1pr9q` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_tag`
--

DROP TABLE IF EXISTS `asset_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asset_tag` varchar(255) DEFAULT NULL,
  `bluetooth_tag` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `zones_school_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKth8pbl87cesldd105b38cgqw1` (`asset_tag`,`bluetooth_tag`),
  UNIQUE KEY `bluetooth_tag` (`bluetooth_tag`),
  KEY `FKo9id42g6tts4gtnx2kf4b1g7d` (`zones_school_id`),
  CONSTRAINT `FKo9id42g6tts4gtnx2kf4b1g7d` FOREIGN KEY (`zones_school_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `attachment_id` bigint NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `uploaded_at` date DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `business_hours`
--

DROP TABLE IF EXISTS `business_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_hours` (
  `business_id` bigint NOT NULL AUTO_INCREMENT,
  `holiday` varchar(255) DEFAULT NULL,
  `team_group` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `week_day_end_time` varchar(255) DEFAULT NULL,
  `week_day_start_time` varchar(255) DEFAULT NULL,
  `week_days` varchar(255) DEFAULT NULL,
  `week_end` varchar(255) DEFAULT NULL,
  `week_end_end_time` varchar(255) DEFAULT NULL,
  `week_end_start_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calculated_results`
--

DROP TABLE IF EXISTS `calculated_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculated_results` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `scenario` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `createdate` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `incident_type_incident_type_id` bigint DEFAULT NULL,
  `image` tinytext,
  `custom_fields_custom_fields_id` bigint DEFAULT NULL,
  `custom_field_values` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK1tyyngy7pcm6y7de1g1eyuq8h` (`incident_type_incident_type_id`),
  KEY `FKrlb7tj9epy31i7oa2vcaih4jb` (`custom_fields_custom_fields_id`),
  CONSTRAINT `FK1tyyngy7pcm6y7de1g1eyuq8h` FOREIGN KEY (`incident_type_incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  CONSTRAINT `FKrlb7tj9epy31i7oa2vcaih4jb` FOREIGN KEY (`custom_fields_custom_fields_id`) REFERENCES `custom_fields` (`custom_fields_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changed_tags`
--

DROP TABLE IF EXISTS `changed_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changed_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `existing_serial_id` varchar(255) DEFAULT NULL,
  `existing_tag_id` varchar(255) DEFAULT NULL,
  `new_serial_id` varchar(255) DEFAULT NULL,
  `new_tag_id` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ludx8f2yyl6qnrfsyqw2pr5p` (`user_userid`),
  CONSTRAINT `FK6ludx8f2yyl6qnrfsyqw2pr5p` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `connection_table`
--

DROP TABLE IF EXISTS `connection_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection_table` (
  `serial` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mac_address` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_index` (`serial`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_usage`
--

DROP TABLE IF EXISTS `content_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business_oriented` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `dynamic_safe_listing` varchar(255) DEFAULT NULL,
  `e_banking` varchar(255) DEFAULT NULL,
  `educational` varchar(255) DEFAULT NULL,
  `entertainment` varchar(255) DEFAULT NULL,
  `game_sites` varchar(255) DEFAULT NULL,
  `grade` int NOT NULL,
  `homemb` varchar(255) DEFAULT NULL,
  `media_content` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `schoolmb` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `web2global` varchar(255) DEFAULT NULL,
  `user_status` int DEFAULT '0',
  PRIMARY KEY (`id`,`date`),
  KEY `grade_date` (`grade`,`date`),
  KEY `user_status_index` (`user_status`),
  KEY `date_grade_userstatus` (`date`,`grade`,`user_status`),
  KEY `date_grade_userstatus_school` (`date`,`grade`,`user_status`,`school`)
) ;
/*!50100 PARTITION BY RANGE (to_days(`date`))
(PARTITION p_2023_01 VALUES LESS THAN (738886) ENGINE = InnoDB,
 PARTITION p_2023_02 VALUES LESS THAN (738917) ENGINE = InnoDB,
 PARTITION p_2023_03 VALUES LESS THAN (738945) ENGINE = InnoDB,
 PARTITION p_2023_04 VALUES LESS THAN (738976) ENGINE = InnoDB,
 PARTITION p_2023_05 VALUES LESS THAN (739006) ENGINE = InnoDB,
 PARTITION p_2023_06 VALUES LESS THAN (739037) ENGINE = InnoDB,
 PARTITION p_2023_07 VALUES LESS THAN (739067) ENGINE = InnoDB,
 PARTITION p_2023_08 VALUES LESS THAN (739098) ENGINE = InnoDB,
 PARTITION p_2023_09 VALUES LESS THAN (739129) ENGINE = InnoDB,
 PARTITION p_2023_10 VALUES LESS THAN (739159) ENGINE = InnoDB,
 PARTITION p_2023_11 VALUES LESS THAN (739190) ENGINE = InnoDB,
 PARTITION p_2023_12 VALUES LESS THAN (739220) ENGINE = InnoDB,
 PARTITION p_2024_01 VALUES LESS THAN (739251) ENGINE = InnoDB,
 PARTITION p_2024_02 VALUES LESS THAN (739282) ENGINE = InnoDB,
 PARTITION p_2024_03 VALUES LESS THAN (739311) ENGINE = InnoDB,
 PARTITION p_2024_04 VALUES LESS THAN (739342) ENGINE = InnoDB,
 PARTITION p_2024_05 VALUES LESS THAN (739372) ENGINE = InnoDB,
 PARTITION p_2024_06 VALUES LESS THAN (739403) ENGINE = InnoDB,
 PARTITION p_2024_07 VALUES LESS THAN (739433) ENGINE = InnoDB,
 PARTITION p_2024_08 VALUES LESS THAN (739464) ENGINE = InnoDB,
 PARTITION p_2024_09 VALUES LESS THAN (739495) ENGINE = InnoDB,
 PARTITION p_2024_10 VALUES LESS THAN (739525) ENGINE = InnoDB,
 PARTITION p_2024_11 VALUES LESS THAN (739556) ENGINE = InnoDB,
 PARTITION p_2024_12 VALUES LESS THAN (739586) ENGINE = InnoDB,
 PARTITION p_2025_01 VALUES LESS THAN (739617) ENGINE = InnoDB,
 PARTITION p_2025_02 VALUES LESS THAN (739648) ENGINE = InnoDB,
 PARTITION p_2025_03 VALUES LESS THAN (739676) ENGINE = InnoDB,
 PARTITION p_2025_04 VALUES LESS THAN (739707) ENGINE = InnoDB,
 PARTITION p_2025_05 VALUES LESS THAN (739737) ENGINE = InnoDB,
 PARTITION p_2025_06 VALUES LESS THAN (739768) ENGINE = InnoDB,
 PARTITION p_2025_07 VALUES LESS THAN (739798) ENGINE = InnoDB,
 PARTITION p_2025_08 VALUES LESS THAN (739829) ENGINE = InnoDB,
 PARTITION p_2025_09 VALUES LESS THAN (739860) ENGINE = InnoDB,
 PARTITION p_2025_10 VALUES LESS THAN (739890) ENGINE = InnoDB,
 PARTITION p_2025_11 VALUES LESS THAN (739921) ENGINE = InnoDB,
 PARTITION p_2025_12 VALUES LESS THAN (739951) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_attributes_definition`
--

DROP TABLE IF EXISTS `custom_attributes_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_attributes_definition` (
  `custom_attribute_id` bigint NOT NULL AUTO_INCREMENT,
  `custom_attribute_type` varchar(255) DEFAULT NULL,
  `datatype` int NOT NULL,
  `lastupdate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`custom_attribute_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_field_value`
--

DROP TABLE IF EXISTS `custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_value` (
  `custom_field_value_id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_field_custom_fields_id` bigint DEFAULT NULL,
  PRIMARY KEY (`custom_field_value_id`),
  KEY `FK5l7u018ag85mbxes24xskcjkk` (`custom_field_custom_fields_id`),
  CONSTRAINT `FK5l7u018ag85mbxes24xskcjkk` FOREIGN KEY (`custom_field_custom_fields_id`) REFERENCES `custom_fields` (`custom_fields_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `custom_fields_id` bigint NOT NULL AUTO_INCREMENT,
  `field_items` varchar(255) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `lable_name` varchar(255) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `saved_category` varchar(255) DEFAULT NULL,
  `saved_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`custom_fields_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_satisfaction_survey`
--

DROP TABLE IF EXISTS `customer_satisfaction_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_satisfaction_survey` (
  `survery_id` bigint NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `likelihood_to_recommend` int DEFAULT NULL,
  `overall_satisfaction` int DEFAULT NULL,
  `product_quality` int DEFAULT NULL,
  `service_quality` int DEFAULT NULL,
  `support_quality` int DEFAULT NULL,
  `survey_date` datetime(6) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`survery_id`),
  KEY `FK42mikjep5d5546yapsa5iyss0` (`user_userid`),
  CONSTRAINT `FK42mikjep5d5546yapsa5iyss0` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emp_stu_number` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_users`
--

DROP TABLE IF EXISTS `department_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_users` (
  `department_dept_id` bigint NOT NULL,
  `users_userid` bigint NOT NULL,
  PRIMARY KEY (`department_dept_id`,`users_userid`),
  KEY `FKsdf202bxsrk57dsg004t3iql1` (`users_userid`),
  CONSTRAINT `FKm8q43nb5hdcm0sg5kcd5hg45v` FOREIGN KEY (`department_dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `FKsdf202bxsrk57dsg004t3iql1` FOREIGN KEY (`users_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detailed_issue`
--

DROP TABLE IF EXISTS `detailed_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailed_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_details` tinytext,
  `text_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_custom_attribute`
--

DROP TABLE IF EXISTS `device_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_custom_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint DEFAULT NULL,
  `purchase_order_product_device_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlw1dovfsqn78ccb7ukgaty1ul` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FKqg1sslcv8iak7pydxxjprb0lb` (`purchase_order_product_device_id_id`),
  CONSTRAINT `FKlw1dovfsqn78ccb7ukgaty1ul` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`),
  CONSTRAINT `FKqg1sslcv8iak7pydxxjprb0lb` FOREIGN KEY (`purchase_order_product_device_id_id`) REFERENCES `purchase_order_product_devices` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_history`
--

DROP TABLE IF EXISTS `device_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `available_status` enum('Archive','Auctioned','Available','Disposed','Draft','InRepair','In_use','Lost','PendingTransfer','Received','Recycled','ReturnedToVendor','Sold','Stolen','Submitted','Surplus','UsedForParts','PendingDisposal') DEFAULT NULL,
  `date_type` datetime(6) DEFAULT NULL,
  `device_hold_status` bit(1) DEFAULT NULL,
  `notes` text,
  `serial_no` varchar(255) DEFAULT NULL,
  `tag_no` varchar(255) DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `site_id_id` bigint DEFAULT NULL,
  `strike_id` bigint DEFAULT NULL,
  `student_staff_id_id` bigint DEFAULT NULL,
  `user_id_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5nfikw77e31roir2bq40vhj3j` (`room_id`),
  KEY `FKrkcdbfusta8l9txkafftfg2gj` (`site_id_id`),
  KEY `FKpuuqxb2vxjlfpa8gaajiiwkpp` (`strike_id`),
  KEY `FKnkbp5645naf28fjlim6rwppix` (`student_staff_id_id`),
  KEY `FKeitbunlhiaj4qte35ojviclbp` (`user_id_userid`),
  KEY `idx_tag_no` (`tag_no`),
  KEY `idx_dh_tag_no_dh_hold_status` (`tag_no`,`device_hold_status`),
  KEY `idx_serial_device_hold` (`serial_no`,`device_hold_status`),
  KEY `idx_serial_no` (`serial_no`),
  KEY `idx_serialno_tagno` (`serial_no`,`tag_no`),
  CONSTRAINT `FK5nfikw77e31roir2bq40vhj3j` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKeitbunlhiaj4qte35ojviclbp` FOREIGN KEY (`user_id_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKnkbp5645naf28fjlim6rwppix` FOREIGN KEY (`student_staff_id_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FKpuuqxb2vxjlfpa8gaajiiwkpp` FOREIGN KEY (`strike_id`) REFERENCES `strikes` (`id`),
  CONSTRAINT `FKrkcdbfusta8l9txkafftfg2gj` FOREIGN KEY (`site_id_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_status`
--

DROP TABLE IF EXISTS `device_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_tag_controller`
--

DROP TABLE IF EXISTS `device_tag_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tag_controller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `device_controller` varchar(255) DEFAULT NULL,
  `serial_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10anh9yhn87wfnbeh6l7gxv11` (`user_userid`),
  CONSTRAINT `FK10anh9yhn87wfnbeh6l7gxv11` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_type`
--

DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_type_name` varchar(255) DEFAULT NULL,
  `type_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_notification`
--

DROP TABLE IF EXISTS `email_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `notification_level` int DEFAULT NULL,
  `scenario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `template_id` bigint NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `email_template_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `subject_line` varchar(255) DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `attachment_attachment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`template_id`),
  KEY `FKgu4jccw9mov4sb2vwx8nypado` (`attachment_attachment_id`),
  CONSTRAINT `FKgu4jccw9mov4sb2vwx8nypado` FOREIGN KEY (`attachment_attachment_id`) REFERENCES `attachment` (`attachment_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funding_source`
--

DROP TABLE IF EXISTS `funding_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funding_source` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `granted_authorities`
--

DROP TABLE IF EXISTS `granted_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `granted_authorities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `granted_authority_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_info`
--

DROP TABLE IF EXISTS `group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_info` (
  `group_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `htype` int NOT NULL DEFAULT '0',
  `holiday` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holiday_index` (`holiday`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ijob`
--

DROP TABLE IF EXISTS `ijob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ijob` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) DEFAULT NULL,
  `display` int DEFAULT '0',
  `jsondata` text,
  `name` varchar(255) DEFAULT NULL,
  `moduleid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_17klx8a9tyntni545xbom0dr3` (`name`),
  UNIQUE KEY `UKot0pv0rl9vmnh5409mnkrs7o7` (`name`,`userid`),
  KEY `FKjeiwdsnryuuxwtod17r156p35` (`moduleid`),
  KEY `FKk1qb22tpkbm8itnnlctqb1nhy` (`userid`),
  CONSTRAINT `FKjeiwdsnryuuxwtod17r156p35` FOREIGN KEY (`moduleid`) REFERENCES `modules` (`id`),
  CONSTRAINT `FKk1qb22tpkbm8itnnlctqb1nhy` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ijob_history`
--

DROP TABLE IF EXISTS `ijob_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ijob_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` datetime(6) DEFAULT NULL,
  `err_message` varchar(255) DEFAULT NULL,
  `is_success` int NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `ijob_id` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk7mw8mu7v2qae6n5wqn7jch7d` (`ijob_id`),
  KEY `FKfyr545ud0ge0usfk71q3nenuw` (`userid`),
  CONSTRAINT `FKfyr545ud0ge0usfk71q3nenuw` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKk7mw8mu7v2qae6n5wqn7jch7d` FOREIGN KEY (`ijob_id`) REFERENCES `ijob` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inactive`
--

DROP TABLE IF EXISTS `inactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inactive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `serial_id` varchar(225) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `grade` varchar(225) DEFAULT NULL,
  `site_name` varchar(225) DEFAULT NULL,
  `advisor_email` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `parent_email` varchar(255) DEFAULT NULL,
  `school_code` varchar(50) DEFAULT NULL,
  `loaddate` date NOT NULL DEFAULT '2025-01-27',
  PRIMARY KEY (`id`),
  KEY `serial_index` (`serial_id`),
  KEY `status_index` (`status`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident` (
  `incident_id` bigint NOT NULL AUTO_INCREMENT,
  `cc_list` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `serial_id` varchar(255) DEFAULT NULL,
  `site_id` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `issue_issue_id` bigint DEFAULT NULL,
  PRIMARY KEY (`incident_id`),
  KEY `FKc5yc4lf6655kj0vik8gyoc8s8` (`issue_issue_id`),
  CONSTRAINT `FKc5yc4lf6655kj0vik8gyoc8s8` FOREIGN KEY (`issue_issue_id`) REFERENCES `issue` (`issue_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_duration`
--

DROP TABLE IF EXISTS `incident_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_duration` (
  `duration_id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `duration_in_minits` int DEFAULT NULL,
  `logged_date` date DEFAULT NULL,
  `incident_incident_id` bigint DEFAULT NULL,
  PRIMARY KEY (`duration_id`),
  KEY `FKey2foay9p840vh40vxdxvmt3w` (`incident_incident_id`),
  CONSTRAINT `FKey2foay9p840vh40vxdxvmt3w` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_labor_events`
--

DROP TABLE IF EXISTS `incident_labor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_labor_events` (
  `incident_labor_events_id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `logged_date` date DEFAULT NULL,
  `incident_incident_id` bigint DEFAULT NULL,
  `labor_event_labor_event_id` bigint DEFAULT NULL,
  PRIMARY KEY (`incident_labor_events_id`),
  KEY `FKo3aam7rc4n0ct23sslggvb3a4` (`incident_incident_id`),
  KEY `FKetpc7fyjuqho717yitquv22sy` (`labor_event_labor_event_id`),
  CONSTRAINT `FKetpc7fyjuqho717yitquv22sy` FOREIGN KEY (`labor_event_labor_event_id`) REFERENCES `labor_event` (`labor_event_id`),
  CONSTRAINT `FKo3aam7rc4n0ct23sslggvb3a4` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_notes`
--

DROP TABLE IF EXISTS `incident_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_notes` (
  `incident_notes_id` bigint NOT NULL AUTO_INCREMENT,
  `logged_date` date DEFAULT NULL,
  `notes` text NOT NULL,
  `incident_incident_id` bigint DEFAULT NULL,
  PRIMARY KEY (`incident_notes_id`),
  KEY `FKtc33rr80fgf3irn2eb98creri` (`incident_incident_id`),
  CONSTRAINT `FKtc33rr80fgf3irn2eb98creri` FOREIGN KEY (`incident_incident_id`) REFERENCES `incident` (`incident_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_pictures`
--

DROP TABLE IF EXISTS `incident_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_pictures` (
  `incident_pictures_id` bigint NOT NULL AUTO_INCREMENT,
  `mediatype` int DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `incident_template_id` bigint NOT NULL,
  PRIMARY KEY (`incident_pictures_id`),
  KEY `FK474in8jubr4h2ubi8ewhkof1j` (`incident_template_id`),
  CONSTRAINT `FK474in8jubr4h2ubi8ewhkof1j` FOREIGN KEY (`incident_template_id`) REFERENCES `incident_template` (`incident_template_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template`
--

DROP TABLE IF EXISTS `incident_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_template` (
  `incident_template_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`incident_template_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_field`
--

DROP TABLE IF EXISTS `incident_template_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_template_field` (
  `i_template_field_id` bigint NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `incident_template_incident_template_id` bigint DEFAULT NULL,
  PRIMARY KEY (`i_template_field_id`),
  KEY `FKfwqnwqikqxrb0uqla2a0xpuh7` (`incident_template_incident_template_id`),
  CONSTRAINT `FKfwqnwqikqxrb0uqla2a0xpuh7` FOREIGN KEY (`incident_template_incident_template_id`) REFERENCES `incident_template` (`incident_template_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_field_value`
--

DROP TABLE IF EXISTS `incident_template_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_template_field_value` (
  `itf_id` bigint NOT NULL AUTO_INCREMENT,
  `field_value` varchar(255) DEFAULT NULL,
  `incident_template_field_i_template_field_id` bigint DEFAULT NULL,
  PRIMARY KEY (`itf_id`),
  KEY `FK1g6sffdfebha80aib1rqsse4j` (`incident_template_field_i_template_field_id`),
  CONSTRAINT `FK1g6sffdfebha80aib1rqsse4j` FOREIGN KEY (`incident_template_field_i_template_field_id`) REFERENCES `incident_template_field` (`i_template_field_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_template_tag`
--

DROP TABLE IF EXISTS `incident_template_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_template_tag` (
  `incident_template_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`incident_template_id`,`tag_id`),
  KEY `FKe0oj851t133din3g2ua9w28ua` (`tag_id`),
  CONSTRAINT `FKahba29v40oxllvdwvg80fudfc` FOREIGN KEY (`incident_template_id`) REFERENCES `incident_template` (`incident_template_id`),
  CONSTRAINT `FKe0oj851t133din3g2ua9w28ua` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_type`
--

DROP TABLE IF EXISTS `incident_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_type` (
  `incident_type_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` tinytext,
  `custom_fields_custom_fields_id` bigint DEFAULT NULL,
  `custom_field_values` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`incident_type_id`),
  KEY `FKrak93wvwc4yw1w0iwv5tk8op3` (`custom_fields_custom_fields_id`),
  CONSTRAINT `FKrak93wvwc4yw1w0iwv5tk8op3` FOREIGN KEY (`custom_fields_custom_fields_id`) REFERENCES `custom_fields` (`custom_fields_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident_value`
--

DROP TABLE IF EXISTS `incident_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_value` (
  `incident_value_id` bigint NOT NULL AUTO_INCREMENT,
  `value_info` varbinary(255) DEFAULT NULL,
  `incident_template_field_i_template_field_id` bigint DEFAULT NULL,
  PRIMARY KEY (`incident_value_id`),
  KEY `FK80u5hdg502qugenpfhe9redv4` (`incident_template_field_i_template_field_id`),
  CONSTRAINT `FK80u5hdg502qugenpfhe9redv4` FOREIGN KEY (`incident_template_field_i_template_field_id`) REFERENCES `incident_template_field` (`i_template_field_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `itype` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_itype_option` (`itype`,`option_value`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_category`
--

DROP TABLE IF EXISTS `inventory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_category` (
  `inventory_category_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inventory_category_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_user_settings`
--

DROP TABLE IF EXISTS `inventory_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_user_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settings_key` varchar(255) NOT NULL,
  `settings_value` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nq980rvqcuvt19ql34j207c7i` (`settings_key`),
  UNIQUE KEY `UK2dvs479tdgrm5k9sgprtq0y26` (`user_id`,`settings_key`),
  CONSTRAINT `FKjj1r5ye61fqg6lpvacsp985i4` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `isd_calendar`
--

DROP TABLE IF EXISTS `isd_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isd_calendar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `calendar_date` datetime(6) DEFAULT NULL,
  `date_description` varchar(255) DEFAULT NULL,
  `day_type` int NOT NULL,
  `holiday_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mmnu1uu39j1w79a1w9dbg4wwv` (`calendar_date`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_category_id` bigint DEFAULT NULL,
  `rule_rule_id` bigint DEFAULT NULL,
  `asset_selection` varchar(255) DEFAULT NULL,
  `assignee` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `priority` bigint DEFAULT NULL,
  `requester` varchar(255) DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `subject_line` varchar(255) DEFAULT NULL,
  `ticket_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `incident_type_incident_type_id` bigint DEFAULT NULL,
  `ticket_details_id` bigint DEFAULT NULL,
  `ticket_details` tinytext,
  `user_id` bigint DEFAULT NULL,
  `custom_field_values` varchar(255) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `asset_selection_id` bigint DEFAULT NULL,
  `assignee_id` bigint DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `requester_id` bigint DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `FKt6wt97lpxwbk3arl45qlvdkcg` (`category_category_id`),
  KEY `FK1c1nhfobpdaiqk087qo1sgye4` (`rule_rule_id`),
  KEY `FKl7f2mub7nysslfqm1n3s8jbtp` (`incident_type_incident_type_id`),
  KEY `FKpk0kisjld74owclya7ukx3dkb` (`ticket_details_id`),
  KEY `FKkh0elvmsowaj4q3f4q253ne7` (`asset_selection_id`),
  KEY `FK1vlympeo6tbfcf6sp2qfbjb5a` (`assignee_id`),
  KEY `FK3iwkqu84r7ig8b5qq4evvem2y` (`location_id`),
  KEY `FK2i64dt6ag5s96be5mkcju3vgg` (`requester_id`),
  CONSTRAINT `FK1c1nhfobpdaiqk087qo1sgye4` FOREIGN KEY (`rule_rule_id`) REFERENCES `rule` (`rule_id`),
  CONSTRAINT `FK1vlympeo6tbfcf6sp2qfbjb5a` FOREIGN KEY (`assignee_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FK2i64dt6ag5s96be5mkcju3vgg` FOREIGN KEY (`requester_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FK3iwkqu84r7ig8b5qq4evvem2y` FOREIGN KEY (`location_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKkh0elvmsowaj4q3f4q253ne7` FOREIGN KEY (`asset_selection_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl7f2mub7nysslfqm1n3s8jbtp` FOREIGN KEY (`incident_type_incident_type_id`) REFERENCES `incident_type` (`incident_type_id`),
  CONSTRAINT `FKpk0kisjld74owclya7ukx3dkb` FOREIGN KEY (`ticket_details_id`) REFERENCES `detailed_issue` (`id`),
  CONSTRAINT `FKt6wt97lpxwbk3arl45qlvdkcg` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_info`
--

DROP TABLE IF EXISTS `job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cron` varchar(255) DEFAULT NULL,
  `errormsg` text,
  `jsondata` text,
  `lastupdate` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `integration_id` bigint DEFAULT NULL,
  `html_code` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpgps4kmdaymtf2utfou9r5v6l` (`name`),
  KEY `FKihk2cyqndn3kmdw761a0ohasw` (`integration_id`),
  CONSTRAINT `FKihk2cyqndn3kmdw761a0ohasw` FOREIGN KEY (`integration_id`) REFERENCES `integrations` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_info_report`
--

DROP TABLE IF EXISTS `job_info_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_info_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `datetime` date DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `inactive` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `locationid` varchar(255) DEFAULT NULL,
  `missing_type` varchar(255) DEFAULT NULL,
  `notify` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `siteid` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `working_days` bigint DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_info_report_details`
--

DROP TABLE IF EXISTS `job_info_report_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_info_report_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labor_event`
--

DROP TABLE IF EXISTS `labor_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labor_event` (
  `labor_event_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `total_time` varchar(255) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `date_info` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `ticket_id` int NOT NULL,
  `time_spent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`labor_event_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `license_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `item_no` varchar(255) DEFAULT NULL,
  `model_no` varchar(255) DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `remaining` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_no` bigint DEFAULT NULL,
  `inventory_category_id` bigint DEFAULT NULL,
  `site_id` bigint DEFAULT NULL,
  `license_vendor_id` bigint DEFAULT NULL,
  `vendor_product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`license_id`),
  KEY `FKokoeii4gqsr0wxfukv7wupi40` (`inventory_category_id`),
  KEY `FKmbf3adsc07fojx8lntdfc9v9k` (`site_id`),
  KEY `FKq5tflqy58b9sqgasnsxss20s2` (`license_vendor_id`),
  KEY `FKk9vj58pqhakg111hseybsyefj` (`vendor_product_id`),
  CONSTRAINT `FKk9vj58pqhakg111hseybsyefj` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_product` (`vendor_product_id`),
  CONSTRAINT `FKmbf3adsc07fojx8lntdfc9v9k` FOREIGN KEY (`site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKokoeii4gqsr0wxfukv7wupi40` FOREIGN KEY (`inventory_category_id`) REFERENCES `inventory_category` (`inventory_category_id`),
  CONSTRAINT `FKq5tflqy58b9sqgasnsxss20s2` FOREIGN KEY (`license_vendor_id`) REFERENCES `license_vendor` (`license_vendor_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_assignment`
--

DROP TABLE IF EXISTS `license_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_assignment` (
  `assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_date` datetime(6) DEFAULT NULL,
  `hold_status` bit(1) DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `from_site_id` bigint DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `site_id` bigint DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `FKmrxr0re9mk4b1dgwwttl3a1oa` (`from_site_id`),
  KEY `FKadpdhyk30bfpno7r13thlqtp5` (`room_id`),
  KEY `FKiahwwmhv7udjh75574g0dfh58` (`user_id`),
  KEY `FKjixb1l8x77cehgiej5kpdukvg` (`site_id`),
  CONSTRAINT `FKadpdhyk30bfpno7r13thlqtp5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKiahwwmhv7udjh75574g0dfh58` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKjixb1l8x77cehgiej5kpdukvg` FOREIGN KEY (`site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKmrxr0re9mk4b1dgwwttl3a1oa` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_history`
--

DROP TABLE IF EXISTS `license_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_history` (
  `license_history_id` bigint NOT NULL AUTO_INCREMENT,
  `available_quantity` bigint DEFAULT NULL,
  `hold_status` enum('Assigned','Received','Submitted') DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `parent_license_history_id` bigint DEFAULT NULL,
  `received_quantity` bigint DEFAULT NULL,
  `ticket_no` varchar(255) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_site_id` bigint DEFAULT NULL,
  `license_inventory_id` bigint DEFAULT NULL,
  `student_and_staff_for_inventory_id` bigint DEFAULT NULL,
  `to_site_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `student_staff_for_inventory_id` bigint DEFAULT NULL,
  PRIMARY KEY (`license_history_id`),
  KEY `FKsoxxyifgqq93vmo6xlhh71wwe` (`from_site_id`),
  KEY `FKlmb31ql3jfp4qc8ky8jgcim2k` (`license_inventory_id`),
  KEY `FKoy1j3rpivo40g0566qfcf5f48` (`student_and_staff_for_inventory_id`),
  KEY `FKn7ef4vsvw3o0mj149u1t7wxsp` (`to_site_id`),
  KEY `FKm1yufcqupslwcmt6mjbf3oqo2` (`user_id`),
  KEY `FKpdgocdopwxxthkii19mii0o54` (`student_staff_for_inventory_id`),
  CONSTRAINT `FKlmb31ql3jfp4qc8ky8jgcim2k` FOREIGN KEY (`license_inventory_id`) REFERENCES `license_inventory` (`license_inventory_id`),
  CONSTRAINT `FKm1yufcqupslwcmt6mjbf3oqo2` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKn7ef4vsvw3o0mj149u1t7wxsp` FOREIGN KEY (`to_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKoy1j3rpivo40g0566qfcf5f48` FOREIGN KEY (`student_and_staff_for_inventory_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FKpdgocdopwxxthkii19mii0o54` FOREIGN KEY (`student_staff_for_inventory_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FKsoxxyifgqq93vmo6xlhh71wwe` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_inventory`
--

DROP TABLE IF EXISTS `license_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_inventory` (
  `license_inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `license_purchase_order_no` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `remaining` bigint DEFAULT NULL,
  `total_no` bigint DEFAULT NULL,
  `site_id` bigint DEFAULT NULL,
  `license_vendor_id` bigint DEFAULT NULL,
  `vendor_product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`license_inventory_id`),
  KEY `FKlt1ck0wqrn3lh55fssd0g6u17` (`site_id`),
  KEY `FKfpf7swwwpcv74q1s9ce73pkb6` (`license_vendor_id`),
  KEY `FKb7obgo42dtrr5dia7f1qh0bap` (`vendor_product_id`),
  CONSTRAINT `FKb7obgo42dtrr5dia7f1qh0bap` FOREIGN KEY (`vendor_product_id`) REFERENCES `vendor_product` (`vendor_product_id`),
  CONSTRAINT `FKfpf7swwwpcv74q1s9ce73pkb6` FOREIGN KEY (`license_vendor_id`) REFERENCES `license_vendor` (`license_vendor_id`),
  CONSTRAINT `FKlt1ck0wqrn3lh55fssd0g6u17` FOREIGN KEY (`site_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_key`
--

DROP TABLE IF EXISTS `license_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_key` (
  `license_key_id` bigint NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) DEFAULT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `license_id` bigint DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `license_holder_id` bigint DEFAULT NULL,
  `license_holder_type` bigint DEFAULT NULL,
  `license_inventory_id` bigint DEFAULT NULL,
  PRIMARY KEY (`license_key_id`),
  KEY `FKjjc6me5opl2t7ppvxpvo4o8v6` (`license_id`),
  KEY `FKsqs63e7weg0n1l6sdilg1mglq` (`license_inventory_id`),
  CONSTRAINT `FKjjc6me5opl2t7ppvxpvo4o8v6` FOREIGN KEY (`license_id`) REFERENCES `license` (`license_id`),
  CONSTRAINT `FKsqs63e7weg0n1l6sdilg1mglq` FOREIGN KEY (`license_inventory_id`) REFERENCES `license_inventory` (`license_inventory_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_key_history`
--

DROP TABLE IF EXISTS `license_key_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_key_history` (
  `license_key_history_id` bigint NOT NULL AUTO_INCREMENT,
  `license_holder_id` bigint DEFAULT NULL,
  `license_holder_type` bigint DEFAULT NULL,
  `license_key` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `license_inventory_id` bigint DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`license_key_history_id`),
  KEY `FKpnlpb8d4bm7k8k1grbu6g3fo1` (`license_inventory_id`),
  KEY `FK6micq4br1ipunj4fvlwl0caos` (`user_userid`),
  CONSTRAINT `FK6micq4br1ipunj4fvlwl0caos` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKpnlpb8d4bm7k8k1grbu6g3fo1` FOREIGN KEY (`license_inventory_id`) REFERENCES `license_inventory` (`license_inventory_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_vendor`
--

DROP TABLE IF EXISTS `license_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_vendor` (
  `license_vendor_id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`license_vendor_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `school_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp2sr8hi9qk4nvb62a3sab4m8e` (`email`,`name`,`user_type`,`school_code`),
  KEY `FKhju8rrbci5ivnnsrpx87dx3sr` (`school_code`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdmdata`
--

DROP TABLE IF EXISTS `mdmdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdmdata` (
  `mdm_id` bigint NOT NULL DEFAULT '0',
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
  `classification` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  KEY `last_check_in_index` (`last_check_in`),
  KEY `mac_address_index` (`mac_address`),
  KEY `serial_number_index` (`serial_number`),
  KEY `mdm_composite_index` (`last_check_in`,`mac_address`),
  KEY `idxloaddate` (`loaddate`),
  KEY `idx_serialnumber_loaddate` (`serial_number`,`loaddate`),
  KEY `idx_serial_loaddate` (`serial_number`,`loaddate`),
  KEY `idx_mac_loaddate` (`mac_address`,`loaddate`),
  KEY `idx_macaddres_serial_loaddate` (`mac_address`,`serial_number`,`loaddate`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `non_net_work_data`
--

DROP TABLE IF EXISTS `non_net_work_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_net_work_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `asset_tag_id` bigint DEFAULT NULL,
  `battery` int DEFAULT NULL,
  `strength` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6u1yt5bgdedag9i85wicc1jau` (`asset_tag_id`),
  CONSTRAINT `FK6u1yt5bgdedag9i85wicc1jau` FOREIGN KEY (`asset_tag_id`) REFERENCES `asset_tag` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `notes_status` int NOT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `student_or_employee_id` varchar(255) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK3yaqj2y14qu9or322nj41dvit` (`user_userid`),
  CONSTRAINT `FK3yaqj2y14qu9or322nj41dvit` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_assignment`
--

DROP TABLE IF EXISTS `part_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_assignment` (
  `part_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `assigned_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hold_status` bit(1) DEFAULT NULL,
  `quantity` bigint NOT NULL,
  `from_site_id` bigint DEFAULT NULL,
  `part_inventory_id` bigint DEFAULT NULL,
  `to_site_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`part_assignment_id`),
  KEY `FKed2jx3jogx5vl58g7s70c1qag` (`from_site_id`),
  KEY `FKmluax1t4tmpthopcyf8coaudu` (`part_inventory_id`),
  KEY `FK39edlpva33wfno8cuasj63dij` (`to_site_id`),
  KEY `FKs30brsvxppenfvf4hw3lpt6pp` (`user_id`),
  CONSTRAINT `FK39edlpva33wfno8cuasj63dij` FOREIGN KEY (`to_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKed2jx3jogx5vl58g7s70c1qag` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKmluax1t4tmpthopcyf8coaudu` FOREIGN KEY (`part_inventory_id`) REFERENCES `part_inventory` (`part_inventory_id`),
  CONSTRAINT `FKs30brsvxppenfvf4hw3lpt6pp` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_category`
--

DROP TABLE IF EXISTS `part_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `part_category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_history`
--

DROP TABLE IF EXISTS `part_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_history` (
  `part_history_id` bigint NOT NULL AUTO_INCREMENT,
  `available_quantity` bigint DEFAULT NULL,
  `hold_status` enum('Assigned','Received','Submitted') DEFAULT NULL,
  `parent_part_history_id` bigint DEFAULT NULL,
  `received_quantity` bigint DEFAULT NULL,
  `ticket_no` varchar(255) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_site_id` bigint DEFAULT NULL,
  `part_inventory_id` bigint DEFAULT NULL,
  `student_and_staff_for_inventory_id` bigint DEFAULT NULL,
  `to_site_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`part_history_id`),
  KEY `FKqddtk7imt4q7foso8hdwrh5dx` (`from_site_id`),
  KEY `FKr5r8uj5wbfn52titx3c4ylil9` (`part_inventory_id`),
  KEY `FKmofee978mbi4mo3ka9cwrjg0k` (`student_and_staff_for_inventory_id`),
  KEY `FKp3de6kild4n2vgc9g095sf91f` (`to_site_id`),
  KEY `FKnt00x03hrjh46yo1am25llnmr` (`user_id`),
  CONSTRAINT `FKmofee978mbi4mo3ka9cwrjg0k` FOREIGN KEY (`student_and_staff_for_inventory_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FKnt00x03hrjh46yo1am25llnmr` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKp3de6kild4n2vgc9g095sf91f` FOREIGN KEY (`to_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKqddtk7imt4q7foso8hdwrh5dx` FOREIGN KEY (`from_site_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKr5r8uj5wbfn52titx3c4ylil9` FOREIGN KEY (`part_inventory_id`) REFERENCES `part_inventory` (`part_inventory_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_inventory`
--

DROP TABLE IF EXISTS `part_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_inventory` (
  `part_inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `purchase_cost` double DEFAULT NULL,
  `quantity_in_stock` bigint NOT NULL,
  `remaining` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location_id` bigint DEFAULT NULL,
  `part_type_id` bigint DEFAULT NULL,
  `part_purchase_order_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`part_inventory_id`),
  KEY `FKkyxjjpq7vpc2luw1pu10qq6gl` (`location_id`),
  KEY `FKs609rmqurh0q14lr7cc6w774c` (`part_type_id`),
  CONSTRAINT `FKkyxjjpq7vpc2luw1pu10qq6gl` FOREIGN KEY (`location_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKs609rmqurh0q14lr7cc6w774c` FOREIGN KEY (`part_type_id`) REFERENCES `part_type` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_manufacturer`
--

DROP TABLE IF EXISTS `part_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_manufacturer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `part_manufacturer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `part_type`
--

DROP TABLE IF EXISTS `part_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_no` varchar(255) DEFAULT NULL,
  `is_consumable` bit(1) DEFAULT NULL,
  `model_no` varchar(255) DEFAULT NULL,
  `part_type_name` varchar(255) DEFAULT NULL,
  `part_category_id` bigint DEFAULT NULL,
  `part_manufacturer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb0o9dw5fv9rgmsr0tu4dwylwp` (`part_category_id`),
  KEY `FKplppmwn5f5x9srq0usb1f2rrl` (`part_manufacturer_id`),
  CONSTRAINT `FKb0o9dw5fv9rgmsr0tu4dwylwp` FOREIGN KEY (`part_category_id`) REFERENCES `part_category` (`id`),
  CONSTRAINT `FKplppmwn5f5x9srq0usb1f2rrl` FOREIGN KEY (`part_manufacturer_id`) REFERENCES `part_manufacturer` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pidata`
--

DROP TABLE IF EXISTS `pidata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pidata` (
  `pi_id` bigint NOT NULL AUTO_INCREMENT,
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
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pidata_latest`
--

DROP TABLE IF EXISTS `pidata_latest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pidata_latest` (
  `client_ip_address` text,
  `client_mac_address` text NOT NULL,
  `association_time` datetime DEFAULT NULL,
  `ap_name` text,
  `device_name` text,
  `ssid` text,
  `protocol` text,
  `session_duration` text,
  `map_location` text,
  `source` varchar(255) DEFAULT NULL,
  `loaddate` date NOT NULL,
  PRIMARY KEY (`loaddate`,`client_mac_address`(255)),
  KEY `idx_loaddate` (`loaddate`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_policy_id` bigint DEFAULT NULL,
  `moduleid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjgm9opqd5c8fg239dwvk1k3c5` (`moduleid`),
  CONSTRAINT `FKjgm9opqd5c8fg239dwvk1k3c5` FOREIGN KEY (`moduleid`) REFERENCES `modules` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `suggested_price` varchar(255) DEFAULT NULL,
  `device_type_id` bigint DEFAULT NULL,
  `manufacturer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1bb1ecw5gjignuvobkee6bibq` (`device_type_id`),
  KEY `FK89igr5j06uw5ps04djxgom0l1` (`manufacturer_id`),
  CONSTRAINT `FK1bb1ecw5gjignuvobkee6bibq` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`id`),
  CONSTRAINT `FK89igr5j06uw5ps04djxgom0l1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_custom_attribute`
--

DROP TABLE IF EXISTS `product_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_custom_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attribute_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrx769avmpd9158cfr4qj27tny` (`custom_attribute_id`),
  CONSTRAINT `FKrx769avmpd9158cfr4qj27tny` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_custom_attributes`
--

DROP TABLE IF EXISTS `product_custom_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_custom_attributes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbtg716wyqqojrv2fh4k6fvdlo` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FK9j8xriibhki91t7a68uyvovgn` (`product_id`),
  CONSTRAINT `FK9j8xriibhki91t7a68uyvovgn` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKbtg716wyqqojrv2fh4k6fvdlo` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_settings`
--

DROP TABLE IF EXISTS `project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settings_key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `jsondata` text,
  `image_date` longblob,
  `image_data` blob,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actual_delivery_date` datetime(6) DEFAULT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `no_of_devices` bigint DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `status` enum('CLOSED','DRAFT','OPEN') DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20jcn7pw6hvx0uo0sh4y1d9xv` (`vendor_id`),
  CONSTRAINT `FK20jcn7pw6hvx0uo0sh4y1d9xv` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_custom_attribute`
--

DROP TABLE IF EXISTS `purchase_order_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_custom_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `custom_attributes_definition_custom_attribute_id` bigint DEFAULT NULL,
  `purchase_order_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9k5kqrr133qoko3mn5yk95ep` (`custom_attributes_definition_custom_attribute_id`),
  KEY `FKf69ub2jvtmn60fqfklyihs326` (`purchase_order_id_id`),
  CONSTRAINT `FK9k5kqrr133qoko3mn5yk95ep` FOREIGN KEY (`custom_attributes_definition_custom_attribute_id`) REFERENCES `custom_attributes_definition` (`custom_attribute_id`),
  CONSTRAINT `FKf69ub2jvtmn60fqfklyihs326` FOREIGN KEY (`purchase_order_id_id`) REFERENCES `purchase_order` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_product_devices`
--

DROP TABLE IF EXISTS `purchase_order_product_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_product_devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  `status` enum('Archive','Auctioned','Available','Disposed','Draft','InRepair','In_use','Lost','PendingTransfer','Received','Recycled','ReturnedToVendor','Sold','Stolen','Submitted','Surplus','UsedForParts','PendingDisposal') DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `warranty_end_date` datetime(6) DEFAULT NULL,
  `device_tag_controller_id` bigint DEFAULT NULL,
  `purchase_order_product_shipping_details_id_id` bigint DEFAULT NULL,
  `room_id_id` bigint DEFAULT NULL,
  `school_id_id` bigint DEFAULT NULL,
  `student_and_staff_for_inventory_id_id` bigint DEFAULT NULL,
  `user_id_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o5wnj1t6txdudtbgsm1r7l2rr` (`tag`),
  KEY `idx_popd_room_status` (`room_id_id`,`status`),
  KEY `FKhq9kg48rxbrg6j4qdg3uhoo3y` (`device_tag_controller_id`),
  KEY `FK2rrpd6noivubrkvnoybrvdccy` (`purchase_order_product_shipping_details_id_id`),
  KEY `FKcyqj1rnfeml4cpbn2gvt3w4j4` (`school_id_id`),
  KEY `FKqs64ew0dw4ncbiui59gc9gxui` (`student_and_staff_for_inventory_id_id`),
  KEY `FKat5fr87cnj9yh1u1hu4c6w275` (`user_id_userid`),
  KEY `idx_popd_tag` (`tag`),
  CONSTRAINT `FK2rrpd6noivubrkvnoybrvdccy` FOREIGN KEY (`purchase_order_product_shipping_details_id_id`) REFERENCES `purchase_order_product_shipping_details` (`id`),
  CONSTRAINT `FKat5fr87cnj9yh1u1hu4c6w275` FOREIGN KEY (`user_id_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKcyqj1rnfeml4cpbn2gvt3w4j4` FOREIGN KEY (`school_id_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKhq9kg48rxbrg6j4qdg3uhoo3y` FOREIGN KEY (`device_tag_controller_id`) REFERENCES `device_tag_controller` (`id`),
  CONSTRAINT `FKpqxhm4s17twb9q3o6ljewpog0` FOREIGN KEY (`room_id_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKqs64ew0dw4ncbiui59gc9gxui` FOREIGN KEY (`student_and_staff_for_inventory_id_id`) REFERENCES `student_and_staff_for_inventory` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_product_shipping_details`
--

DROP TABLE IF EXISTS `purchase_order_product_shipping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_product_shipping_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_date` datetime(6) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `received_tags` int DEFAULT NULL,
  `shipping_quantity` int DEFAULT NULL,
  `purchase_order_product_id_id` bigint DEFAULT NULL,
  `site_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjjxafk07khde2jerue6pcsk4t` (`purchase_order_product_id_id`),
  KEY `FKafc8qsmm48uql9pp33k5e8ksa` (`site_id_id`),
  CONSTRAINT `FKafc8qsmm48uql9pp33k5e8ksa` FOREIGN KEY (`site_id_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKjjxafk07khde2jerue6pcsk4t` FOREIGN KEY (`purchase_order_product_id_id`) REFERENCES `purchaseorderproducts` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchaseorderproducts`
--

DROP TABLE IF EXISTS `purchaseorderproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorderproducts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_code` varchar(255) DEFAULT NULL,
  `ordered_quantity` bigint DEFAULT NULL,
  `purchase_price` varchar(255) DEFAULT NULL,
  `received_quantity` bigint DEFAULT NULL,
  `status` enum('CLOSED','DRAFT','OPEN') DEFAULT NULL,
  `funding_source_id` bigint DEFAULT NULL,
  `product_number_id` bigint DEFAULT NULL,
  `purchase_order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq61bglngm4fe68pbl58hb3xni` (`funding_source_id`),
  KEY `FKhw02rd66279ltmx7wdifj5m27` (`product_number_id`),
  KEY `FKc8x6j42iccbq20naeqhg9htod` (`purchase_order_id`),
  CONSTRAINT `FKc8x6j42iccbq20naeqhg9htod` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`),
  CONSTRAINT `FKhw02rd66279ltmx7wdifj5m27` FOREIGN KEY (`product_number_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKq61bglngm4fe68pbl58hb3xni` FOREIGN KEY (`funding_source_id`) REFERENCES `funding_source` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `release_notes`
--

DROP TABLE IF EXISTS `release_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release_notes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `note` text,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result_table`
--

DROP TABLE IF EXISTS `result_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `mdm_status` int NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parent_tag` varchar(255) DEFAULT NULL,
  `pi_status` int NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `room_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_check_status` int NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `zone_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `device_days_old` int DEFAULT NULL,
  `transfer` varchar(255) DEFAULT NULL,
  `user_status` int DEFAULT '0',
  `calc_mdm` int DEFAULT '0',
  `calc_network` int DEFAULT '0',
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
  KEY `name` (`name`),
  KEY `user_status_index` (`user_status`),
  KEY `include_user_status` (`date`,`mdm_status`,`secondary_check_status`,`location`,`product_type`,`grade`,`site_name`,`user_status`),
  KEY `idx_result_table_optimization` (`date`,`mdm_status`,`secondary_check_status`,`user_status`,`location`,`site_name`,`product_type`,`grade`,`department`),
  KEY `idx_result_table_optimization_manufacture` (`date`,`mdm_status`,`secondary_check_status`,`user_status`,`location`,`site_name`,`product_type`,`grade`,`manufacture`),
  KEY `manufacture_index` (`manufacture`),
  KEY `idx_date_macaddress` (`date`,`mac_address`),
  KEY `idx_result_table_mac_date_status` (`mac_address`,`date`,`secondary_check_status`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_granted_authorities`
--

DROP TABLE IF EXISTS `role_granted_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_granted_authorities` (
  `role_roleid` bigint NOT NULL,
  `granted_authorities_id` bigint NOT NULL,
  UNIQUE KEY `UK7a9ha2828dr6w1qq7o0kusl9` (`role_roleid`,`granted_authorities_id`),
  KEY `FKny95rdq0mejjxpk6blx7sudo8` (`granted_authorities_id`),
  CONSTRAINT `FKny95rdq0mejjxpk6blx7sudo8` FOREIGN KEY (`granted_authorities_id`) REFERENCES `granted_authorities` (`id`),
  CONSTRAINT `FKs0uhwx8y5ipfevp41eofhlb1r` FOREIGN KEY (`role_roleid`) REFERENCES `role` (`roleid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_policy`
--

DROP TABLE IF EXISTS `role_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_policy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission` enum('CREATE','DELETE','READONLY','UPDATE') NOT NULL,
  `policy_id_id` bigint DEFAULT NULL,
  `role_roleid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKroj6gl1mgp7ngbi1xaeb0jpa5` (`permission`,`role_roleid`,`policy_id_id`),
  KEY `FKr7j0h4rhyn67y22d2sbqslijk` (`policy_id_id`),
  KEY `FK7q9hy018neqh5n6ms7b0ldgtc` (`role_roleid`),
  CONSTRAINT `FK7q9hy018neqh5n6ms7b0ldgtc` FOREIGN KEY (`role_roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `FKr7j0h4rhyn67y22d2sbqslijk` FOREIGN KEY (`policy_id_id`) REFERENCES `policies` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `zones_school_id` bigint DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKregr57mee5otrxytf1j4odxhf` (`name`,`zones_school_id`),
  KEY `idx_room_zone_school` (`zones_school_id`),
  KEY `FKf5vbgyps3ubaknn710nk2m5o5` (`type_id`),
  CONSTRAINT `FKf5vbgyps3ubaknn710nk2m5o5` FOREIGN KEY (`type_id`) REFERENCES `room_type` (`id`),
  CONSTRAINT `FKif7dh87vfk3d9ifpdedb1i5qm` FOREIGN KEY (`zones_school_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `rule_id` bigint NOT NULL AUTO_INCREMENT,
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
  `email_template_template_id` bigint DEFAULT NULL,
  `incident_template_incident_template_id` bigint DEFAULT NULL,
  `team_team_id` bigint DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  `text_input` varchar(255) DEFAULT NULL,
  `actions` varchar(255) DEFAULT NULL,
  `drop_down` varchar(255) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `filed_selection` varchar(255) DEFAULT NULL,
  `numerical_input` int NOT NULL,
  `oprators` varchar(255) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `UK_grpcpo2gw6wgy36qqfd5miag3` (`incident_template_incident_template_id`),
  UNIQUE KEY `UK_p6wa6fbd80trmg15pd7q477ag` (`team_team_id`),
  UNIQUE KEY `UK_iwoui3gxhfxrcqol0b6kg9t2v` (`user_userid`),
  KEY `FKsfbsbwpkgpaoc4xgk0tkfwy62` (`email_template_template_id`),
  CONSTRAINT `FKf9xo2ut9jvrrepcjp50l0rbo5` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKo14nhfcr8xwul1cg6388kexjf` FOREIGN KEY (`incident_template_incident_template_id`) REFERENCES `incident_template` (`incident_template_id`),
  CONSTRAINT `FKolj51uqolbg7n2xv3ey995jie` FOREIGN KEY (`team_team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `FKsfbsbwpkgpaoc4xgk0tkfwy62` FOREIGN KEY (`email_template_template_id`) REFERENCES `email_template` (`template_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenarios` (
  `date` date DEFAULT NULL,
  `scenario` varchar(10) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `stype` varchar(255) DEFAULT NULL,
  `first_notification` int DEFAULT NULL,
  `second_notification` int DEFAULT NULL,
  `third_notification` int DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_type`
--

DROP TABLE IF EXISTS `school_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_level_agreement`
--

DROP TABLE IF EXISTS `service_level_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_level_agreement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business_hours_end` varchar(255) DEFAULT NULL,
  `business_hours_start` varchar(255) DEFAULT NULL,
  `days_of_week` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `resolution_time_in_minutes` int DEFAULT NULL,
  `response_time_in_minutes` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_level_agreement_status`
--

DROP TABLE IF EXISTS `service_level_agreement_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_level_agreement_status` (
  `slas_id` bigint NOT NULL AUTO_INCREMENT,
  `business_hours` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `linked_teams` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resolution_time` varchar(255) DEFAULT NULL,
  `response_time` varchar(255) DEFAULT NULL,
  `sla` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`slas_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_labels`
--

DROP TABLE IF EXISTS `setting_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_labels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `setting_type` varchar(255) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKk1c0klvoy97tacl2pfc6ob7r8` (`setting_type`,`setting_value`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` bigint NOT NULL,
  `asset` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsi1moniwvv1ooat4easrubupq` (`school_id`),
  CONSTRAINT `FKsi1moniwvv1ooat4easrubupq` FOREIGN KEY (`school_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `strikes`
--

DROP TABLE IF EXISTS `strikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strikes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cost` bigint NOT NULL,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `strike_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  UNIQUE KEY `UKlv76h0culvv35q3i0pscdc74j` (`name`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advisor_email_address` varchar(255) DEFAULT NULL,
  `advisor_name` varchar(255) DEFAULT NULL,
  `broad_band_at_home` int NOT NULL,
  `cell_internet` varchar(255) DEFAULT NULL,
  `guardian_email_address` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `home_internet` varchar(255) DEFAULT NULL,
  `ipad_opt_in_out` varchar(255) DEFAULT NULL,
  `last_update` varchar(255) DEFAULT NULL,
  `optin_percent` int NOT NULL,
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
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_and_staff_for_inventory`
--

DROP TABLE IF EXISTS `student_and_staff_for_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_and_staff_for_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advisor_name` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `department_dept_id` bigint DEFAULT NULL,
  `school_id` bigint DEFAULT NULL,
  `staff_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnecsywlrp5b5nykcpvco0ig3h` (`staff_id`,`school_id`),
  UNIQUE KEY `UK8ptgf7pf1omqufrogx1ecfqqn` (`student_id`,`school_id`),
  KEY `FKqnchsg5gn0769udhlfqg37xt2` (`department_dept_id`),
  KEY `FKpmvt4kaesw70g9hida3it8a28` (`school_id`),
  CONSTRAINT `FKpmvt4kaesw70g9hida3it8a28` FOREIGN KEY (`school_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKqnchsg5gn0769udhlfqg37xt2` FOREIGN KEY (`department_dept_id`) REFERENCES `department` (`dept_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_student_staff_school_update` AFTER UPDATE ON `student_and_staff_for_inventory` FOR EACH ROW BEGIN
    -- Only proceed if school_id was changed
    IF NEW.school_id != OLD.school_id THEN
        -- Check grade condition
        IF NEW.grade IN ('KG', 'P2', 'P3', 'P4','01','02','03') THEN
            -- Send email using MySQL event notification
            INSERT INTO trigger_email_notifications (
                recipient,
                subject,
                message,
                created_at
            ) VALUES (
                'isd@swensa.com', -- Replace with actual email
                CONCAT('School Change Alert for Grade ', NEW.grade),
                CONCAT('Student/Staff ID: ', COALESCE(NEW.student_id, NEW.staff_id), 
                      ' Name: ', NEW.name,
                      ' Grade: ', NEW.grade,
                      ' has been moved to a new school.'),
                NOW()
            );
        ELSE
            -- Perform the original update operations
            UPDATE purchase_order_product_devices 
            SET school_id_id = NEW.school_id
            WHERE student_and_staff_for_inventory_id_id = NEW.id;
            
            -- Insert new device history records
            INSERT INTO device_history (
                available_status,
                date_type,
                device_hold_status,
                notes,
                serial_no,
                tag_no,
                room_id,
                site_id_id,
                strike_id,
                student_staff_id_id,
                user_id_userid
            )
            SELECT 
                dh.available_status,
                NOW(),
                1,
                "Updated from trigger",
                dh.serial_no,
                dh.tag_no,
                dh.room_id,
                NEW.school_id,
                dh.strike_id,
                dh.student_staff_id_id,
                dh.user_id_userid
            FROM device_history dh
            WHERE dh.student_staff_id_id = NEW.id 
            AND dh.device_hold_status = 1;
            
            -- Update previous records' device_hold_status
            UPDATE device_history 
            SET device_hold_status = 0
            WHERE student_staff_id_id = NEW.id 
            AND device_hold_status = 1
            AND id NOT IN (
                SELECT id FROM (
                    SELECT MAX(id)

 as id
                    FROM device_history
                    WHERE student_staff_id_id = NEW.id
                    GROUP BY serial_no
                ) as latest
            );
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_strikes_history`
--

DROP TABLE IF EXISTS `student_strikes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_strikes_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `student_strikes_history_notes` text,
  `tag_no` varchar(255) DEFAULT NULL,
  `strike_id` bigint DEFAULT NULL,
  `student_staffid_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlnsvo1k69ehdkdvwo8kxi9by3` (`strike_id`),
  KEY `FKjtv6erm43h06a8pxol2dmgvja` (`student_staffid_id`),
  KEY `FKcdmsj4ca1okf3wi00g0suoyuo` (`user_id`),
  CONSTRAINT `FKcdmsj4ca1okf3wi00g0suoyuo` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKjtv6erm43h06a8pxol2dmgvja` FOREIGN KEY (`student_staffid_id`) REFERENCES `student_and_staff_for_inventory` (`id`),
  CONSTRAINT `FKlnsvo1k69ehdkdvwo8kxi9by3` FOREIGN KEY (`strike_id`) REFERENCES `strikes` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_members` (
  `team_member_id` bigint NOT NULL AUTO_INCREMENT,
  `team_team_id` bigint DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  PRIMARY KEY (`team_member_id`),
  UNIQUE KEY `UK_cm2y4471pgpf06uelfwcv68sf` (`user_userid`),
  KEY `FK2ym1sj502875uhxqysx3xlmbb` (`team_team_id`),
  CONSTRAINT `FK2ym1sj502875uhxqysx3xlmbb` FOREIGN KEY (`team_team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `FK6lf97bvwlfljwd1dee6crgq66` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `teams_id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `agentd_permission` varchar(255) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_name` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` bigint DEFAULT NULL,
  `modified_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teams_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_status` (
  `ticket_status_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sla` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ticket_status_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipweb`
--

DROP TABLE IF EXISTS `tipweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipweb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `parent_tag` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `room_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `loaddate` date DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serialIndex` (`serial`),
  KEY `locationid_loaddate` (`location_id`,`loaddate`),
  KEY `tag` (`tag`),
  KEY `idc_location_loaddate` (`location`,`loaddate`),
  KEY `idx_loaddate` (`loaddate`),
  KEY `idx_serial_loaddate` (`serial`,`loaddate`),
  KEY `idx_producttype` (`product_type`),
  KEY `idx_serial_producttype` (`serial`,`product_type`),
  KEY `idx_product_type` (`product_type`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipweb_archive`
--

DROP TABLE IF EXISTS `tipweb_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipweb_archive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serial` (`serial`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_devices`
--

DROP TABLE IF EXISTS `transfer_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serial_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `device_status_id` bigint DEFAULT NULL,
  `transfer_history_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ao78cmksufs9u6d49o4s4b4g` (`device_status_id`),
  KEY `FKejk8anxge5c7896nnaruu7f0k` (`transfer_history_id`),
  CONSTRAINT `FK5ao78cmksufs9u6d49o4s4b4g` FOREIGN KEY (`device_status_id`) REFERENCES `device_status` (`id`),
  CONSTRAINT `FKejk8anxge5c7896nnaruu7f0k` FOREIGN KEY (`transfer_history_id`) REFERENCES `transfer_history` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_history`
--

DROP TABLE IF EXISTS `transfer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_type` datetime(6) DEFAULT NULL,
  `devices_quantity` bigint DEFAULT NULL,
  `status` enum('CLOSED','DRAFT','OPEN') DEFAULT NULL,
  `total_devices` bigint DEFAULT NULL,
  `from_site_id_id` bigint DEFAULT NULL,
  `to_site_id_id` bigint DEFAULT NULL,
  `created_by_userid` bigint DEFAULT NULL,
  `received_by_userid` bigint DEFAULT NULL,
  `received_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9jto1an1k7k2hc5fbprdku0xx` (`from_site_id_id`),
  KEY `FKlfw93aw0mdw1qgt5aauyh2ta9` (`to_site_id_id`),
  KEY `FK71ca4kk9c3un9li5hsk7hof79` (`created_by_userid`),
  KEY `FKjl7myrwsafohxqphqjku007xl` (`received_by_userid`),
  CONSTRAINT `FK71ca4kk9c3un9li5hsk7hof79` FOREIGN KEY (`created_by_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK9jto1an1k7k2hc5fbprdku0xx` FOREIGN KEY (`from_site_id_id`) REFERENCES `zones_school` (`id`),
  CONSTRAINT `FKjl7myrwsafohxqphqjku007xl` FOREIGN KEY (`received_by_userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKlfw93aw0mdw1qgt5aauyh2ta9` FOREIGN KEY (`to_site_id_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_email_notifications`
--

DROP TABLE IF EXISTS `trigger_email_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_email_notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_category`
--

DROP TABLE IF EXISTS `usage_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_category` (
  `usage_category_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ctype` int DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usage_category_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_data`
--

DROP TABLE IF EXISTS `usage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_data` (
  `campus_code` varchar(255) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `ctype` varchar(255) NOT NULL,
  `educationalweb2` varchar(255) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `iseductional` varchar(255) NOT NULL,
  `mb` varchar(255) DEFAULT NULL,
  `mobility` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(255) NOT NULL,
  `utilization` varchar(255) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  KEY `id` (`id`),
  KEY `user` (`user`),
  KEY `grade_time` (`grade`,`time`),
  KEY `grade_time_category` (`grade`,`time`,`category`),
  KEY `grade_time_campus_name` (`grade`,`time`,`campus_name`),
  KEY `grade_time_category_description` (`grade`,`time`,`category_description`),
  KEY `grade_time_campus_name_utilization` (`grade`,`time`,`campus_name`,`utilization`),
  KEY `time` (`time`),
  KEY `category` (`category`,`time`),
  KEY `campus_name` (`campus_name`,`utilization`)
) ;
/*!50100 PARTITION BY RANGE (unix_timestamp(`time`))
(PARTITION may1 VALUES LESS THAN (1682899200) ENGINE = InnoDB,
 PARTITION may2 VALUES LESS THAN (1682985600) ENGINE = InnoDB,
 PARTITION may3 VALUES LESS THAN (1683072000) ENGINE = InnoDB,
 PARTITION may4 VALUES LESS THAN (1683158400) ENGINE = InnoDB,
 PARTITION may5 VALUES LESS THAN (1683244800) ENGINE = InnoDB,
 PARTITION may6 VALUES LESS THAN (1683331200) ENGINE = InnoDB,
 PARTITION may7 VALUES LESS THAN (1683417600) ENGINE = InnoDB,
 PARTITION may8 VALUES LESS THAN (1683504000) ENGINE = InnoDB,
 PARTITION may9 VALUES LESS THAN (1683590400) ENGINE = InnoDB,
 PARTITION may10 VALUES LESS THAN (1683676800) ENGINE = InnoDB,
 PARTITION may11 VALUES LESS THAN (1683763200) ENGINE = InnoDB,
 PARTITION may12 VALUES LESS THAN (1683849600) ENGINE = InnoDB,
 PARTITION may13 VALUES LESS THAN (1683936000) ENGINE = InnoDB,
 PARTITION may14 VALUES LESS THAN (1684022400) ENGINE = InnoDB,
 PARTITION may15 VALUES LESS THAN (1684108800) ENGINE = InnoDB,
 PARTITION may16 VALUES LESS THAN (1684195200) ENGINE = InnoDB,
 PARTITION may17 VALUES LESS THAN (1684281600) ENGINE = InnoDB,
 PARTITION may18 VALUES LESS THAN (1684368000) ENGINE = InnoDB,
 PARTITION may19 VALUES LESS THAN (1684454400) ENGINE = InnoDB,
 PARTITION may20 VALUES LESS THAN (1684540800) ENGINE = InnoDB,
 PARTITION may21 VALUES LESS THAN (1684627200) ENGINE = InnoDB,
 PARTITION may22 VALUES LESS THAN (1684713600) ENGINE = InnoDB,
 PARTITION may23 VALUES LESS THAN (1684800000) ENGINE = InnoDB,
 PARTITION may24 VALUES LESS THAN (1684886400) ENGINE = InnoDB,
 PARTITION may25 VALUES LESS THAN (1684972800) ENGINE = InnoDB,
 PARTITION may26 VALUES LESS THAN (1685059200) ENGINE = InnoDB,
 PARTITION may27 VALUES LESS THAN (1685145600) ENGINE = InnoDB,
 PARTITION may28 VALUES LESS THAN (1685232000) ENGINE = InnoDB,
 PARTITION may29 VALUES LESS THAN (1685318400) ENGINE = InnoDB,
 PARTITION may30 VALUES LESS THAN (1685404800) ENGINE = InnoDB,
 PARTITION may31 VALUES LESS THAN (1685491200) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_data_result`
--

DROP TABLE IF EXISTS `usage_data_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_data_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `result` text,
  `sequence` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category` (`category`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_statistic`
--

DROP TABLE IF EXISTS `usage_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_statistic` (
  `usage_statistic_id` bigint NOT NULL AUTO_INCREMENT,
  `band_width` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `device_in_school` bit(1) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `is_student` bit(1) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `usage_category_usage_category_id` bigint DEFAULT NULL,
  `zones_school_id` bigint DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `scount` bigint DEFAULT NULL,
  `ctype` int DEFAULT NULL,
  PRIMARY KEY (`usage_statistic_id`),
  UNIQUE KEY `unique_network_data` (`usage_category_usage_category_id`,`zones_school_id`,`date`,`grade`,`device_in_school`,`user`,`is_student`),
  KEY `idx_bw_user_date_zs` (`band_width`,`user`,`date`,`zones_school_id`),
  KEY `idx_zones_date_grade_student` (`zones_school_id`,`date`,`grade`,`is_student`),
  KEY `idx_device_bw_zones` (`device_in_school`,`band_width`,`zones_school_id`),
  KEY `idx_date` (`date`),
  KEY `idx_zsid_date_grade_isstudent` (`zones_school_id`,`date`,`grade`,`is_student`),
  KEY `idx_zsid_dinschool_bw` (`zones_school_id`,`device_in_school`,`band_width`),
  KEY `idx_grade` (`grade`),
  KEY `idx_isstudent` (`is_student`),
  KEY `idx_usage_statistic_zones_school_id` (`zones_school_id`),
  CONSTRAINT `FKhmj1qc8xoux5wbemmyyrelble` FOREIGN KEY (`usage_category_usage_category_id`) REFERENCES `usage_category` (`usage_category_id`),
  CONSTRAINT `FKm92khfxm9vnex1dhwtej0r7qm` FOREIGN KEY (`zones_school_id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usage_vpn`
--

DROP TABLE IF EXISTS `usage_vpn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_vpn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `connected` date DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_department`
--

DROP TABLE IF EXISTS `user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_department` (
  `userid` bigint NOT NULL,
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`userid`,`dept_id`),
  KEY `FKjdq54vxaf49ny9ohf12f2rer` (`dept_id`),
  CONSTRAINT `FKcrt2fxiq623bda6qtw4bwg95l` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKjdq54vxaf49ny9ohf12f2rer` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `userid` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  PRIMARY KEY (`userid`,`group_id`),
  KEY `FK9ej2am5bdj52esgddq0v4ff7i` (`group_id`),
  CONSTRAINT `FK9ej2am5bdj52esgddq0v4ff7i` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`group_id`),
  CONSTRAINT `FKccgbsuq4pyes7iuhgphlg37do` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_report_search_templates`
--

DROP TABLE IF EXISTS `user_report_search_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_report_search_templates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report_search_template` json DEFAULT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlcqsqjauvo78fxsoprmc10xwv` (`user_id`),
  CONSTRAINT `FKlcqsqjauvo78fxsoprmc10xwv` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `userid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FKbo5ik0bthje7hum554xb17ry6` (`roleid`),
  CONSTRAINT `FKbo5ik0bthje7hum554xb17ry6` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `FKd0xwi6psywvnj59btfns0alnm` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_type` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `location` text,
  `range_values` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_userid` bigint DEFAULT NULL,
  `criteria_setting` varchar(255) DEFAULT 'With Settings',
  PRIMARY KEY (`id`),
  KEY `FK3g9b16uyqu9bk7oddt7j3o9eb` (`user_userid`),
  CONSTRAINT `FK3g9b16uyqu9bk7oddt7j3o9eb` FOREIGN KEY (`user_userid`) REFERENCES `user` (`userid`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_sites`
--

DROP TABLE IF EXISTS `user_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sites` (
  `userid` bigint NOT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`userid`,`id`),
  KEY `FKwpuyb9upjpfok3fgb7k7vax3` (`id`),
  CONSTRAINT `FKohdmetl2bpy7ue6vj38p6puiy` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FKwpuyb9upjpfok3fgb7k7vax3` FOREIGN KEY (`id`) REFERENCES `zones_school` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_product`
--

DROP TABLE IF EXISTS `vendor_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_product` (
  `vendor_product_id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `license_vendor_id` bigint DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `is_open_source` bit(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_product_id`),
  KEY `FKpvyv35psxxbthmqaig2rnu7ho` (`license_vendor_id`),
  CONSTRAINT `FKpvyv35psxxbthmqaig2rnu7ho` FOREIGN KEY (`license_vendor_id`) REFERENCES `license_vendor` (`license_vendor_id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones_school`
--

DROP TABLE IF EXISTS `zones_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones_school` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `campus_code` varchar(255) DEFAULT NULL,
  `school_code` varchar(255) DEFAULT NULL,
  `school_name_in_tipweb` varchar(255) DEFAULT NULL,
  `school_name_in_web` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_joqo3vl2q8rikyt4idu5ohpbs` (`school_code`),
  KEY `idx_school_name_in_tipweb` (`school_name_in_tipweb`),
  KEY `FKkrsg2j8h6miwb5n78betchgnu` (`zone_id`),
  CONSTRAINT `FKkrsg2j8h6miwb5n78betchgnu` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09 10:58:20


-- INSERT INTO `project_settings`    VALUES (1,'dashboard_usage','0',NULL),(2,'dashboard_monthly_notification','0',NULL),(3,'dashboard_average_age','0',NULL),(4,'logo_light','lisd_light.png',NULL),(5,'logo_dark','lisd_dark.png',NULL),(6,'dashboard_daily_notification','0',NULL),(7,'Authentication','local','{\"url\": \"ldap://lisd-dc1.lisd.local:389\",\"domain\": \"lisd.local\" }'),(8,'SSL','1','');
INSERT INTO `project_settings`    VALUES (1,'dashboard_usage','0',NULL,NULL, NULL),(2,'dashboard_monthly_notification','0',NULL,NULL,NULL),(3,'dashboard_average_age','0',NULL,NULL,NULL),(4,'logo_lig ht','lisd_light.png',NULL,NULL,NULL),(5,'logo_dark','lisd_dark.png',NULL,NULL,NULL),(6,'dashboard_daily_notification','0',NULL,NULL,NULL),(7,'Authentication','local','{ "url": "", "domain": "", "grantedAuthorities": { "admin": [], "observer": [] } }' ,NULL,NULL),(8,'SSL','1','',NULL,NULL), (9,'Customer', 'pisd','NULL',NULL,NULL);

INSERT INTO `role` VALUES (1,'Admin','Admin');

INSERT INTO `modules` VALUES (1,'Insights'),(2,'Inventory'),(3,'Incident'),(4,'All');
INSERT INTO `policies` VALUES (1,'All',0,4);
INSERT INTO `role_policy` VALUES (783,'CREATE',1,1),(784,'UPDATE',1,1),(785,'DELETE',1,1);
insert into granted_authorities (granted_authority_name) value ('Admin');
insert into role_granted_authorities values (1, 1);

INSERT INTO `zones` VALUES (1,'All');

-- insert into user (active,email,password) values ('','dims','$2a$10$RLK49pM5EirlpvdQ7EeoheAJwIxM5Rowf6dEKA6/z8mnl1WUDGed2');

-- SET FOREIGN_KEY_CHECKS = 0;
-- insert into user_role (userid,roleid) values (1,1);
-- SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `integrations` VALUES (1,'Incident IQ Inventory','INVENTORY','Incident IQ','INCIDENTIQ'),(2,'Inventory','INVENTORY','TipWeb','TIPWEB'),(3,'Ipads and MacBooks','MDM','JAMF','JAMF'),(4,'Chromebooks','MDM','Google','GOOGLE'),(5,'Windows','MDM','Microsoft','INTUNE'),(6,'Meraki Controller','MDM','Cisco Meraki','MDM_MERAKI'),(7,'WL Controller','NETWORK','Cisco WLC','WLC'),(8,'Meraki Controller','NETWORK','Cisco Meraki','NETWORK_MERAKI');

-- INSERT INTO `setting_labels` VALUES (26,'deviceType','Chromebook'),(24,'deviceType','DESKTOP-APPLE'),(27,'deviceType','DESKTOP-WINDOWS'),(22,'deviceType','IPAD'),(25,'deviceType','LAPTOPS-APPLE'),(28,'deviceType','LAPTOPS-WINDOWS'),(23,'deviceType','TV-APPLE'),(9,'grade','01'),(10,'grade','02'),(11,'grade','03'),(12,'grade','04'),(13,'grade','05'),(14,'grade','06'),(15,'grade','07'),(16,'grade','08'),(17,'grade','09'),(18,'grade','10'),(19,'grade','11'),(20,'grade','12'),(21,'grade','GD'),(8,'grade','KG'),(5,'grade','P2'),(6,'grade','P3'),(7,'grade','P4'),(3,'role','Room'),(1,'role','Staff'),(2,'role','Student'),(4,'role','Transfer');

alter table asset_tag add constraint bluetooth_tag unique (bluetooth_tag);
