-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: defectdojo
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `auditlog_logentry`
--

DROP TABLE IF EXISTS `auditlog_logentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_logentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_repr` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` smallint(5) unsigned NOT NULL,
  `changes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `remote_addr` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `auditlog_logentry_actor_id_959271d2_fk_auth_user_id` (`actor_id`),
  KEY `auditlog_logentry_content_type_id_75830218_fk_django_co` (`content_type_id`),
  KEY `auditlog_logentry_object_id_09c2eee8` (`object_id`),
  KEY `auditlog_logentry_object_pk_6e3219c0` (`object_pk`),
  CONSTRAINT `auditlog_logentry_actor_id_959271d2_fk_auth_user_id` FOREIGN KEY (`actor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auditlog_logentry_content_type_id_75830218_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_logentry`
--

LOCK TABLES `auditlog_logentry` WRITE;
/*!40000 ALTER TABLE `auditlog_logentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog_logentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add api access',8,'add_apiaccess'),(30,'Can change api access',8,'change_apiaccess'),(31,'Can delete api access',8,'delete_apiaccess'),(32,'Can view api access',8,'view_apiaccess'),(33,'Can add api key',9,'add_apikey'),(34,'Can change api key',9,'change_apikey'),(35,'Can delete api key',9,'delete_apikey'),(36,'Can view api key',9,'view_apikey'),(37,'Can add log entry',10,'add_logentry'),(38,'Can change log entry',10,'change_logentry'),(39,'Can delete log entry',10,'delete_logentry'),(40,'Can view log entry',10,'view_logentry'),(41,'Can add alerts',11,'add_alerts'),(42,'Can change alerts',11,'change_alerts'),(43,'Can delete alerts',11,'delete_alerts'),(44,'Can view alerts',11,'view_alerts'),(45,'Can add app_ analysis',12,'add_app_analysis'),(46,'Can change app_ analysis',12,'change_app_analysis'),(47,'Can delete app_ analysis',12,'delete_app_analysis'),(48,'Can view app_ analysis',12,'view_app_analysis'),(49,'Can add benchmark_ category',13,'add_benchmark_category'),(50,'Can change benchmark_ category',13,'change_benchmark_category'),(51,'Can delete benchmark_ category',13,'delete_benchmark_category'),(52,'Can view benchmark_ category',13,'view_benchmark_category'),(53,'Can add benchmark_ product',14,'add_benchmark_product'),(54,'Can change benchmark_ product',14,'change_benchmark_product'),(55,'Can delete benchmark_ product',14,'delete_benchmark_product'),(56,'Can view benchmark_ product',14,'view_benchmark_product'),(57,'Can add benchmark_ product_ summary',15,'add_benchmark_product_summary'),(58,'Can change benchmark_ product_ summary',15,'change_benchmark_product_summary'),(59,'Can delete benchmark_ product_ summary',15,'delete_benchmark_product_summary'),(60,'Can view benchmark_ product_ summary',15,'view_benchmark_product_summary'),(61,'Can add benchmark_ requirement',16,'add_benchmark_requirement'),(62,'Can change benchmark_ requirement',16,'change_benchmark_requirement'),(63,'Can delete benchmark_ requirement',16,'delete_benchmark_requirement'),(64,'Can view benchmark_ requirement',16,'view_benchmark_requirement'),(65,'Can add benchmark_ type',17,'add_benchmark_type'),(66,'Can change benchmark_ type',17,'change_benchmark_type'),(67,'Can delete benchmark_ type',17,'delete_benchmark_type'),(68,'Can view benchmark_ type',17,'view_benchmark_type'),(69,'Can add burp raw request response',18,'add_burprawrequestresponse'),(70,'Can change burp raw request response',18,'change_burprawrequestresponse'),(71,'Can delete burp raw request response',18,'delete_burprawrequestresponse'),(72,'Can view burp raw request response',18,'view_burprawrequestresponse'),(73,'Can add check_ list',19,'add_check_list'),(74,'Can change check_ list',19,'change_check_list'),(75,'Can delete check_ list',19,'delete_check_list'),(76,'Can view check_ list',19,'view_check_list'),(77,'Can add child_ rule',20,'add_child_rule'),(78,'Can change child_ rule',20,'change_child_rule'),(79,'Can delete child_ rule',20,'delete_child_rule'),(80,'Can view child_ rule',20,'view_child_rule'),(81,'Can add contact',21,'add_contact'),(82,'Can change contact',21,'change_contact'),(83,'Can delete contact',21,'delete_contact'),(84,'Can view contact',21,'view_contact'),(85,'Can add cred_ mapping',22,'add_cred_mapping'),(86,'Can change cred_ mapping',22,'change_cred_mapping'),(87,'Can delete cred_ mapping',22,'delete_cred_mapping'),(88,'Can view cred_ mapping',22,'view_cred_mapping'),(89,'Can add cred_ user',23,'add_cred_user'),(90,'Can change cred_ user',23,'change_cred_user'),(91,'Can delete cred_ user',23,'delete_cred_user'),(92,'Can view cred_ user',23,'view_cred_user'),(93,'Can add cwe',24,'add_cwe'),(94,'Can change cwe',24,'change_cwe'),(95,'Can delete cwe',24,'delete_cwe'),(96,'Can view cwe',24,'view_cwe'),(97,'Can add development_ environment',25,'add_development_environment'),(98,'Can change development_ environment',25,'change_development_environment'),(99,'Can delete development_ environment',25,'delete_development_environment'),(100,'Can view development_ environment',25,'view_development_environment'),(101,'Can add dojo meta',26,'add_dojometa'),(102,'Can change dojo meta',26,'change_dojometa'),(103,'Can delete dojo meta',26,'delete_dojometa'),(104,'Can view dojo meta',26,'view_dojometa'),(105,'Can add endpoint',27,'add_endpoint'),(106,'Can change endpoint',27,'change_endpoint'),(107,'Can delete endpoint',27,'delete_endpoint'),(108,'Can view endpoint',27,'view_endpoint'),(109,'Can add endpoint_ params',28,'add_endpoint_params'),(110,'Can change endpoint_ params',28,'change_endpoint_params'),(111,'Can delete endpoint_ params',28,'delete_endpoint_params'),(112,'Can view endpoint_ params',28,'view_endpoint_params'),(113,'Can add engagement',29,'add_engagement'),(114,'Can change engagement',29,'change_engagement'),(115,'Can delete engagement',29,'delete_engagement'),(116,'Can view engagement',29,'view_engagement'),(117,'Can add engagement_ presets',30,'add_engagement_presets'),(118,'Can change engagement_ presets',30,'change_engagement_presets'),(119,'Can delete engagement_ presets',30,'delete_engagement_presets'),(120,'Can view engagement_ presets',30,'view_engagement_presets'),(121,'Can add engagement_ type',31,'add_engagement_type'),(122,'Can change engagement_ type',31,'change_engagement_type'),(123,'Can delete engagement_ type',31,'delete_engagement_type'),(124,'Can view engagement_ type',31,'view_engagement_type'),(125,'Can add field rule',32,'add_fieldrule'),(126,'Can change field rule',32,'change_fieldrule'),(127,'Can delete field rule',32,'delete_fieldrule'),(128,'Can view field rule',32,'view_fieldrule'),(129,'Can add finding',33,'add_finding'),(130,'Can change finding',33,'change_finding'),(131,'Can delete finding',33,'delete_finding'),(132,'Can view finding',33,'view_finding'),(133,'Can add finding_ template',34,'add_finding_template'),(134,'Can change finding_ template',34,'change_finding_template'),(135,'Can delete finding_ template',34,'delete_finding_template'),(136,'Can view finding_ template',34,'view_finding_template'),(137,'Can add finding image',35,'add_findingimage'),(138,'Can change finding image',35,'change_findingimage'),(139,'Can delete finding image',35,'delete_findingimage'),(140,'Can view finding image',35,'view_findingimage'),(141,'Can add finding image access token',36,'add_findingimageaccesstoken'),(142,'Can change finding image access token',36,'change_findingimageaccesstoken'),(143,'Can delete finding image access token',36,'delete_findingimageaccesstoken'),(144,'Can view finding image access token',36,'view_findingimageaccesstoken'),(145,'Can add ip scan',37,'add_ipscan'),(146,'Can change ip scan',37,'change_ipscan'),(147,'Can delete ip scan',37,'delete_ipscan'),(148,'Can view ip scan',37,'view_ipscan'),(149,'Can add jir a_ clone',38,'add_jira_clone'),(150,'Can change jir a_ clone',38,'change_jira_clone'),(151,'Can delete jir a_ clone',38,'delete_jira_clone'),(152,'Can view jir a_ clone',38,'view_jira_clone'),(153,'Can add jir a_ conf',39,'add_jira_conf'),(154,'Can change jir a_ conf',39,'change_jira_conf'),(155,'Can delete jir a_ conf',39,'delete_jira_conf'),(156,'Can view jir a_ conf',39,'view_jira_conf'),(157,'Can add jir a_ details_ cache',40,'add_jira_details_cache'),(158,'Can change jir a_ details_ cache',40,'change_jira_details_cache'),(159,'Can delete jir a_ details_ cache',40,'delete_jira_details_cache'),(160,'Can view jir a_ details_ cache',40,'view_jira_details_cache'),(161,'Can add jir a_ issue',41,'add_jira_issue'),(162,'Can change jir a_ issue',41,'change_jira_issue'),(163,'Can delete jir a_ issue',41,'delete_jira_issue'),(164,'Can view jir a_ issue',41,'view_jira_issue'),(165,'Can add jir a_p key',42,'add_jira_pkey'),(166,'Can change jir a_p key',42,'change_jira_pkey'),(167,'Can delete jir a_p key',42,'delete_jira_pkey'),(168,'Can view jir a_p key',42,'view_jira_pkey'),(169,'Can add language_ type',43,'add_language_type'),(170,'Can change language_ type',43,'change_language_type'),(171,'Can delete language_ type',43,'delete_language_type'),(172,'Can view language_ type',43,'view_language_type'),(173,'Can add languages',44,'add_languages'),(174,'Can change languages',44,'change_languages'),(175,'Can delete languages',44,'delete_languages'),(176,'Can view languages',44,'view_languages'),(177,'Can add network_ locations',45,'add_network_locations'),(178,'Can change network_ locations',45,'change_network_locations'),(179,'Can delete network_ locations',45,'delete_network_locations'),(180,'Can view network_ locations',45,'view_network_locations'),(181,'Can add notes',46,'add_notes'),(182,'Can change notes',46,'change_notes'),(183,'Can delete notes',46,'delete_notes'),(184,'Can view notes',46,'view_notes'),(185,'Can add notifications',47,'add_notifications'),(186,'Can change notifications',47,'change_notifications'),(187,'Can delete notifications',47,'delete_notifications'),(188,'Can view notifications',47,'view_notifications'),(189,'Can add objects',48,'add_objects'),(190,'Can change objects',48,'change_objects'),(191,'Can delete objects',48,'delete_objects'),(192,'Can view objects',48,'view_objects'),(193,'Can add objects_ engagement',49,'add_objects_engagement'),(194,'Can change objects_ engagement',49,'change_objects_engagement'),(195,'Can delete objects_ engagement',49,'delete_objects_engagement'),(196,'Can view objects_ engagement',49,'view_objects_engagement'),(197,'Can add objects_ review',50,'add_objects_review'),(198,'Can change objects_ review',50,'change_objects_review'),(199,'Can delete objects_ review',50,'delete_objects_review'),(200,'Can view objects_ review',50,'view_objects_review'),(201,'Can add product',51,'add_product'),(202,'Can change product',51,'change_product'),(203,'Can delete product',51,'delete_product'),(204,'Can view product',51,'view_product'),(205,'Can add product_ line',52,'add_product_line'),(206,'Can change product_ line',52,'change_product_line'),(207,'Can delete product_ line',52,'delete_product_line'),(208,'Can view product_ line',52,'view_product_line'),(209,'Can add product_ type',53,'add_product_type'),(210,'Can change product_ type',53,'change_product_type'),(211,'Can delete product_ type',53,'delete_product_type'),(212,'Can view product_ type',53,'view_product_type'),(213,'Can add regulation',54,'add_regulation'),(214,'Can change regulation',54,'change_regulation'),(215,'Can delete regulation',54,'delete_regulation'),(216,'Can view regulation',54,'view_regulation'),(217,'Can add report',55,'add_report'),(218,'Can change report',55,'change_report'),(219,'Can delete report',55,'delete_report'),(220,'Can view report',55,'view_report'),(221,'Can add report_ type',56,'add_report_type'),(222,'Can change report_ type',56,'change_report_type'),(223,'Can delete report_ type',56,'delete_report_type'),(224,'Can view report_ type',56,'view_report_type'),(225,'Can add risk_ acceptance',57,'add_risk_acceptance'),(226,'Can change risk_ acceptance',57,'change_risk_acceptance'),(227,'Can delete risk_ acceptance',57,'delete_risk_acceptance'),(228,'Can view risk_ acceptance',57,'view_risk_acceptance'),(229,'Can add rule',58,'add_rule'),(230,'Can change rule',58,'change_rule'),(231,'Can delete rule',58,'delete_rule'),(232,'Can view rule',58,'view_rule'),(233,'Can add scan',59,'add_scan'),(234,'Can change scan',59,'change_scan'),(235,'Can delete scan',59,'delete_scan'),(236,'Can view scan',59,'view_scan'),(237,'Can add scan settings',60,'add_scansettings'),(238,'Can change scan settings',60,'change_scansettings'),(239,'Can delete scan settings',60,'delete_scansettings'),(240,'Can view scan settings',60,'view_scansettings'),(241,'Can add stub_ finding',61,'add_stub_finding'),(242,'Can change stub_ finding',61,'change_stub_finding'),(243,'Can delete stub_ finding',61,'delete_stub_finding'),(244,'Can view stub_ finding',61,'view_stub_finding'),(245,'Can add system_ settings',62,'add_system_settings'),(246,'Can change system_ settings',62,'change_system_settings'),(247,'Can delete system_ settings',62,'delete_system_settings'),(248,'Can view system_ settings',62,'view_system_settings'),(249,'Can add test',63,'add_test'),(250,'Can change test',63,'change_test'),(251,'Can delete test',63,'delete_test'),(252,'Can view test',63,'view_test'),(253,'Can add test_ type',64,'add_test_type'),(254,'Can change test_ type',64,'change_test_type'),(255,'Can delete test_ type',64,'delete_test_type'),(256,'Can view test_ type',64,'view_test_type'),(257,'Can add testing_ guide',65,'add_testing_guide'),(258,'Can change testing_ guide',65,'change_testing_guide'),(259,'Can delete testing_ guide',65,'delete_testing_guide'),(260,'Can view testing_ guide',65,'view_testing_guide'),(261,'Can add testing_ guide_ category',66,'add_testing_guide_category'),(262,'Can change testing_ guide_ category',66,'change_testing_guide_category'),(263,'Can delete testing_ guide_ category',66,'delete_testing_guide_category'),(264,'Can view testing_ guide_ category',66,'view_testing_guide_category'),(265,'Can add tool_ configuration',67,'add_tool_configuration'),(266,'Can change tool_ configuration',67,'change_tool_configuration'),(267,'Can delete tool_ configuration',67,'delete_tool_configuration'),(268,'Can view tool_ configuration',67,'view_tool_configuration'),(269,'Can add tool_ product_ history',68,'add_tool_product_history'),(270,'Can change tool_ product_ history',68,'change_tool_product_history'),(271,'Can delete tool_ product_ history',68,'delete_tool_product_history'),(272,'Can view tool_ product_ history',68,'view_tool_product_history'),(273,'Can add tool_ product_ settings',69,'add_tool_product_settings'),(274,'Can change tool_ product_ settings',69,'change_tool_product_settings'),(275,'Can delete tool_ product_ settings',69,'delete_tool_product_settings'),(276,'Can view tool_ product_ settings',69,'view_tool_product_settings'),(277,'Can add tool_ type',70,'add_tool_type'),(278,'Can change tool_ type',70,'change_tool_type'),(279,'Can delete tool_ type',70,'delete_tool_type'),(280,'Can view tool_ type',70,'view_tool_type'),(281,'Can add user contact info',71,'add_usercontactinfo'),(282,'Can change user contact info',71,'change_usercontactinfo'),(283,'Can delete user contact info',71,'delete_usercontactinfo'),(284,'Can view user contact info',71,'view_usercontactinfo'),(285,'Can add va',72,'add_va'),(286,'Can change va',72,'change_va'),(287,'Can delete va',72,'delete_va'),(288,'Can view va',72,'view_va'),(289,'Can add dojo_ user',73,'add_dojo_user'),(290,'Can change dojo_ user',73,'change_dojo_user'),(291,'Can delete dojo_ user',73,'delete_dojo_user'),(292,'Can view dojo_ user',73,'view_dojo_user'),(293,'Can add note history',74,'add_notehistory'),(294,'Can change note history',74,'change_notehistory'),(295,'Can delete note history',74,'delete_notehistory'),(296,'Can view note history',74,'view_notehistory'),(297,'Can add sonarqube_ issue',75,'add_sonarqube_issue'),(298,'Can change sonarqube_ issue',75,'change_sonarqube_issue'),(299,'Can delete sonarqube_ issue',75,'delete_sonarqube_issue'),(300,'Can view sonarqube_ issue',75,'view_sonarqube_issue'),(301,'Can add sonarqube_ product',76,'add_sonarqube_product'),(302,'Can change sonarqube_ product',76,'change_sonarqube_product'),(303,'Can delete sonarqube_ product',76,'delete_sonarqube_product'),(304,'Can view sonarqube_ product',76,'view_sonarqube_product'),(305,'Can add sonarqube_ issue_ transition',77,'add_sonarqube_issue_transition'),(306,'Can change sonarqube_ issue_ transition',77,'change_sonarqube_issue_transition'),(307,'Can delete sonarqube_ issue_ transition',77,'delete_sonarqube_issue_transition'),(308,'Can view sonarqube_ issue_ transition',77,'view_sonarqube_issue_transition'),(309,'Can add note_ type',78,'add_note_type'),(310,'Can change note_ type',78,'change_note_type'),(311,'Can delete note_ type',78,'delete_note_type'),(312,'Can view note_ type',78,'view_note_type'),(313,'Can add banner conf',79,'add_bannerconf'),(314,'Can change banner conf',79,'change_bannerconf'),(315,'Can delete banner conf',79,'delete_bannerconf'),(316,'Can view banner conf',79,'view_bannerconf'),(317,'Can add githu b_ clone',80,'add_github_clone'),(318,'Can change githu b_ clone',80,'change_github_clone'),(319,'Can delete githu b_ clone',80,'delete_github_clone'),(320,'Can view githu b_ clone',80,'view_github_clone'),(321,'Can add githu b_ conf',81,'add_github_conf'),(322,'Can change githu b_ conf',81,'change_github_conf'),(323,'Can delete githu b_ conf',81,'delete_github_conf'),(324,'Can view githu b_ conf',81,'view_github_conf'),(325,'Can add githu b_ details_ cache',82,'add_github_details_cache'),(326,'Can change githu b_ details_ cache',82,'change_github_details_cache'),(327,'Can delete githu b_ details_ cache',82,'delete_github_details_cache'),(328,'Can view githu b_ details_ cache',82,'view_github_details_cache'),(329,'Can add githu b_p key',83,'add_github_pkey'),(330,'Can change githu b_p key',83,'change_github_pkey'),(331,'Can delete githu b_p key',83,'delete_github_pkey'),(332,'Can view githu b_p key',83,'view_github_pkey'),(333,'Can add githu b_ issue',84,'add_github_issue'),(334,'Can change githu b_ issue',84,'change_github_issue'),(335,'Can delete githu b_ issue',84,'delete_github_issue'),(336,'Can view githu b_ issue',84,'view_github_issue'),(337,'Can add question',85,'add_question'),(338,'Can change question',85,'change_question'),(339,'Can delete question',85,'delete_question'),(340,'Can view question',85,'view_question'),(341,'Can add text question',86,'add_textquestion'),(342,'Can change text question',86,'change_textquestion'),(343,'Can delete text question',86,'delete_textquestion'),(344,'Can view text question',86,'view_textquestion'),(345,'Can add choice',87,'add_choice'),(346,'Can change choice',87,'change_choice'),(347,'Can delete choice',87,'delete_choice'),(348,'Can view choice',87,'view_choice'),(349,'Can add choice question',88,'add_choicequestion'),(350,'Can change choice question',88,'change_choicequestion'),(351,'Can delete choice question',88,'delete_choicequestion'),(352,'Can view choice question',88,'view_choicequestion'),(353,'Can add Engagement Survey',89,'add_engagement_survey'),(354,'Can change Engagement Survey',89,'change_engagement_survey'),(355,'Can delete Engagement Survey',89,'delete_engagement_survey'),(356,'Can view Engagement Survey',89,'view_engagement_survey'),(357,'Can add Answered Engagement Survey',90,'add_answered_survey'),(358,'Can change Answered Engagement Survey',90,'change_answered_survey'),(359,'Can delete Answered Engagement Survey',90,'delete_answered_survey'),(360,'Can view Answered Engagement Survey',90,'view_answered_survey'),(361,'Can add General Engagement Survey',91,'add_general_survey'),(362,'Can change General Engagement Survey',91,'change_general_survey'),(363,'Can delete General Engagement Survey',91,'delete_general_survey'),(364,'Can view General Engagement Survey',91,'view_general_survey'),(365,'Can add answer',92,'add_answer'),(366,'Can change answer',92,'change_answer'),(367,'Can delete answer',92,'delete_answer'),(368,'Can view answer',92,'view_answer'),(369,'Can add text answer',93,'add_textanswer'),(370,'Can change text answer',93,'change_textanswer'),(371,'Can delete text answer',93,'delete_textanswer'),(372,'Can view text answer',93,'view_textanswer'),(373,'Can add choice answer',94,'add_choiceanswer'),(374,'Can change choice answer',94,'change_choiceanswer'),(375,'Can delete choice answer',94,'delete_choiceanswer'),(376,'Can view choice answer',94,'view_choiceanswer'),(377,'Can add endpoint_ status',95,'add_endpoint_status'),(378,'Can change endpoint_ status',95,'change_endpoint_status'),(379,'Can delete endpoint_ status',95,'delete_endpoint_status'),(380,'Can view endpoint_ status',95,'view_endpoint_status'),(381,'Can add search entry',96,'add_searchentry'),(382,'Can change search entry',96,'change_searchentry'),(383,'Can delete search entry',96,'delete_searchentry'),(384,'Can view search entry',96,'view_searchentry'),(385,'Can add tag',97,'add_tag'),(386,'Can change tag',97,'change_tag'),(387,'Can delete tag',97,'delete_tag'),(388,'Can view tag',97,'view_tag'),(389,'Can add tagged item',98,'add_taggeditem'),(390,'Can change tagged item',98,'change_taggeditem'),(391,'Can delete tagged item',98,'delete_taggeditem'),(392,'Can view tagged item',98,'view_taggeditem'),(393,'Can add custom field',99,'add_customfield'),(394,'Can change custom field',99,'change_customfield'),(395,'Can delete custom field',99,'delete_customfield'),(396,'Can view custom field',99,'view_customfield'),(397,'Can add custom field value',100,'add_customfieldvalue'),(398,'Can change custom field value',100,'change_customfieldvalue'),(399,'Can delete custom field value',100,'delete_customfieldvalue'),(400,'Can view custom field value',100,'view_customfieldvalue'),(401,'Can add Token',101,'add_token'),(402,'Can change Token',101,'change_token'),(403,'Can delete Token',101,'delete_token'),(404,'Can view Token',101,'view_token'),(405,'Can add token',102,'add_tokenproxy'),(406,'Can change token',102,'change_tokenproxy'),(407,'Can delete token',102,'delete_tokenproxy'),(408,'Can view token',102,'view_tokenproxy'),(409,'Can add task result',103,'add_taskresult'),(410,'Can change task result',103,'change_taskresult'),(411,'Can delete task result',103,'delete_taskresult'),(412,'Can view task result',103,'view_taskresult'),(413,'Can add association',104,'add_association'),(414,'Can change association',104,'change_association'),(415,'Can delete association',104,'delete_association'),(416,'Can view association',104,'view_association'),(417,'Can add code',105,'add_code'),(418,'Can change code',105,'change_code'),(419,'Can delete code',105,'delete_code'),(420,'Can view code',105,'view_code'),(421,'Can add nonce',106,'add_nonce'),(422,'Can change nonce',106,'change_nonce'),(423,'Can delete nonce',106,'delete_nonce'),(424,'Can view nonce',106,'view_nonce'),(425,'Can add user social auth',107,'add_usersocialauth'),(426,'Can change user social auth',107,'change_usersocialauth'),(427,'Can delete user social auth',107,'delete_usersocialauth'),(428,'Can view user social auth',107,'view_usersocialauth'),(429,'Can add partial',108,'add_partial'),(430,'Can change partial',108,'change_partial'),(431,'Can delete partial',108,'delete_partial'),(432,'Can view partial',108,'view_partial');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$7fiXeHoq7lCY$JiUHnbgg5oq9SWNjLA1Ar+GWP0uU6xNHBi8z6PzGGGw=',NULL,1,'admin','Admin','User','admin@defectdojo.local',1,1,'2020-11-01 10:39:07.705584');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_customfield`
--

DROP TABLE IF EXISTS `custom_field_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_customfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `field_choices` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `mask` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_field_customfield_name_content_type_id_b1c45d0b_uniq` (`name`,`content_type_id`),
  KEY `custom_field_customf_content_type_id_9c09147c_fk_django_co` (`content_type_id`),
  CONSTRAINT `custom_field_customf_content_type_id_9c09147c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_customfield`
--

LOCK TABLES `custom_field_customfield` WRITE;
/*!40000 ALTER TABLE `custom_field_customfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_customfieldvalue`
--

DROP TABLE IF EXISTS `custom_field_customfieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_customfieldvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_field_customfieldvalue_field_id_object_id_909be84d_uniq` (`field_id`,`object_id`),
  KEY `custom_field_customf_content_type_id_f805435e_fk_django_co` (`content_type_id`),
  CONSTRAINT `custom_field_customf_content_type_id_f805435e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `custom_field_customf_field_id_842b2a60_fk_custom_fi` FOREIGN KEY (`field_id`) REFERENCES `custom_field_customfield` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_customfieldvalue`
--

LOCK TABLES `custom_field_customfieldvalue` WRITE;
/*!40000 ALTER TABLE `custom_field_customfieldvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_customfieldvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_encoding` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` longtext COLLATE utf8mb4_unicode_ci,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext COLLATE utf8mb4_unicode_ci,
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  `task_args` longtext COLLATE utf8mb4_unicode_ci,
  `task_kwargs` longtext COLLATE utf8mb4_unicode_ci,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `worker` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_date_done_49edada6` (`date_done`),
  KEY `django_celery_results_taskresult_status_cbbed23a` (`status`),
  KEY `django_celery_results_taskresult_task_name_90987df3` (`task_name`),
  KEY `django_celery_results_taskresult_worker_f8711389` (`worker`),
  KEY `django_celery_results_taskresult_date_created_099f3424` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(10,'auditlog','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(101,'authtoken','token'),(102,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(99,'custom_field','customfield'),(100,'custom_field','customfieldvalue'),(103,'django_celery_results','taskresult'),(11,'dojo','alerts'),(92,'dojo','answer'),(90,'dojo','answered_survey'),(12,'dojo','app_analysis'),(79,'dojo','bannerconf'),(13,'dojo','benchmark_category'),(14,'dojo','benchmark_product'),(15,'dojo','benchmark_product_summary'),(16,'dojo','benchmark_requirement'),(17,'dojo','benchmark_type'),(18,'dojo','burprawrequestresponse'),(19,'dojo','check_list'),(20,'dojo','child_rule'),(87,'dojo','choice'),(94,'dojo','choiceanswer'),(88,'dojo','choicequestion'),(21,'dojo','contact'),(22,'dojo','cred_mapping'),(23,'dojo','cred_user'),(24,'dojo','cwe'),(25,'dojo','development_environment'),(73,'dojo','dojo_user'),(26,'dojo','dojometa'),(27,'dojo','endpoint'),(28,'dojo','endpoint_params'),(95,'dojo','endpoint_status'),(29,'dojo','engagement'),(30,'dojo','engagement_presets'),(89,'dojo','engagement_survey'),(31,'dojo','engagement_type'),(32,'dojo','fieldrule'),(33,'dojo','finding'),(34,'dojo','finding_template'),(35,'dojo','findingimage'),(36,'dojo','findingimageaccesstoken'),(91,'dojo','general_survey'),(80,'dojo','github_clone'),(81,'dojo','github_conf'),(82,'dojo','github_details_cache'),(84,'dojo','github_issue'),(83,'dojo','github_pkey'),(37,'dojo','ipscan'),(38,'dojo','jira_clone'),(39,'dojo','jira_conf'),(40,'dojo','jira_details_cache'),(41,'dojo','jira_issue'),(42,'dojo','jira_pkey'),(43,'dojo','language_type'),(44,'dojo','languages'),(45,'dojo','network_locations'),(78,'dojo','note_type'),(74,'dojo','notehistory'),(46,'dojo','notes'),(47,'dojo','notifications'),(48,'dojo','objects'),(49,'dojo','objects_engagement'),(50,'dojo','objects_review'),(51,'dojo','product'),(52,'dojo','product_line'),(53,'dojo','product_type'),(85,'dojo','question'),(54,'dojo','regulation'),(55,'dojo','report'),(56,'dojo','report_type'),(57,'dojo','risk_acceptance'),(58,'dojo','rule'),(59,'dojo','scan'),(60,'dojo','scansettings'),(75,'dojo','sonarqube_issue'),(77,'dojo','sonarqube_issue_transition'),(76,'dojo','sonarqube_product'),(61,'dojo','stub_finding'),(62,'dojo','system_settings'),(63,'dojo','test'),(64,'dojo','test_type'),(65,'dojo','testing_guide'),(66,'dojo','testing_guide_category'),(93,'dojo','textanswer'),(86,'dojo','textquestion'),(67,'dojo','tool_configuration'),(68,'dojo','tool_product_history'),(69,'dojo','tool_product_settings'),(70,'dojo','tool_type'),(71,'dojo','usercontactinfo'),(72,'dojo','va'),(5,'sessions','session'),(6,'sites','site'),(104,'social_django','association'),(105,'social_django','code'),(106,'social_django','nonce'),(108,'social_django','partial'),(107,'social_django','usersocialauth'),(97,'tagging','tag'),(98,'tagging','taggeditem'),(8,'tastypie','apiaccess'),(9,'tastypie','apikey'),(96,'watson','searchentry');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-01 10:38:21.013388'),(2,'auth','0001_initial','2020-11-01 10:38:21.117670'),(3,'admin','0001_initial','2020-11-01 10:38:21.374796'),(4,'admin','0002_logentry_remove_auto_add','2020-11-01 10:38:21.437375'),(5,'admin','0003_logentry_add_action_flag_choices','2020-11-01 10:38:21.451204'),(6,'auditlog','0001_initial','2020-11-01 10:38:21.482147'),(7,'auditlog','0002_auto_support_long_primary_keys','2020-11-01 10:38:21.587766'),(8,'auditlog','0003_logentry_remote_addr','2020-11-01 10:38:21.625702'),(9,'auditlog','0004_logentry_detailed_object_repr','2020-11-01 10:38:21.665245'),(10,'auditlog','0005_logentry_additional_data_verbose_name','2020-11-01 10:38:21.679986'),(11,'auditlog','0006_object_pk_index','2020-11-01 10:38:21.732844'),(12,'auditlog','0007_object_pk_type','2020-11-01 10:38:21.851411'),(13,'contenttypes','0002_remove_content_type_name','2020-11-01 10:38:21.924387'),(14,'auth','0002_alter_permission_name_max_length','2020-11-01 10:38:21.959424'),(15,'auth','0003_alter_user_email_max_length','2020-11-01 10:38:21.977961'),(16,'auth','0004_alter_user_username_opts','2020-11-01 10:38:21.991531'),(17,'auth','0005_alter_user_last_login_null','2020-11-01 10:38:22.025601'),(18,'auth','0006_require_contenttypes_0002','2020-11-01 10:38:22.028857'),(19,'auth','0007_alter_validators_add_error_messages','2020-11-01 10:38:22.041884'),(20,'auth','0008_alter_user_username_max_length','2020-11-01 10:38:22.076873'),(21,'auth','0009_alter_user_last_name_max_length','2020-11-01 10:38:22.113538'),(22,'auth','0010_alter_group_name_max_length','2020-11-01 10:38:22.131220'),(23,'auth','0011_update_proxy_permissions','2020-11-01 10:38:22.144182'),(24,'authtoken','0001_initial','2020-11-01 10:38:22.171774'),(25,'authtoken','0002_auto_20160226_1747','2020-11-01 10:38:22.267399'),(26,'authtoken','0003_tokenproxy','2020-11-01 10:38:22.273078'),(27,'custom_field','0001_initial','2020-11-01 10:38:22.360292'),(28,'custom_field','0002_auto_20150119_2032','2020-11-01 10:38:22.542471'),(29,'custom_field','0003_customfield_mask','2020-11-01 10:38:22.578670'),(30,'custom_field','0004_django2_upgrade','2020-11-01 10:38:22.604743'),(31,'django_celery_results','0001_initial','2020-11-01 10:38:22.628202'),(32,'django_celery_results','0002_add_task_name_args_kwargs','2020-11-01 10:38:22.713959'),(33,'django_celery_results','0003_auto_20181106_1101','2020-11-01 10:38:22.721078'),(34,'django_celery_results','0004_auto_20190516_0412','2020-11-01 10:38:22.796896'),(35,'django_celery_results','0005_taskresult_worker','2020-11-01 10:38:22.836243'),(36,'django_celery_results','0006_taskresult_date_created','2020-11-01 10:38:22.908942'),(37,'django_celery_results','0007_remove_taskresult_hidden','2020-11-01 10:38:22.957266'),(38,'dojo','0001_initial','2020-11-01 10:38:33.165415'),(39,'dojo','0002_auto_20190503_1817','2020-11-01 10:38:37.295515'),(40,'dojo','0003_test_title','2020-11-01 10:38:37.389801'),(41,'dojo','0004_cve_field','2020-11-01 10:38:37.554866'),(42,'dojo','0005_repo_field','2020-11-01 10:38:37.618159'),(43,'dojo','0006_django2_upgrade','2020-11-01 10:38:39.107779'),(44,'dojo','0007_note_additions','2020-11-01 10:38:39.723389'),(45,'dojo','0008_finding_mitigation','2020-11-01 10:38:39.986424'),(46,'dojo','0009_endpoint_remediation','2020-11-01 10:38:40.118385'),(47,'dojo','0010_jira_conf_configuration_name','2020-11-01 10:38:40.156150'),(48,'dojo','0011_finding_template_activity','2020-11-01 10:38:40.191158'),(49,'dojo','0012_jira_finding_age','2020-11-01 10:38:40.602392'),(50,'dojo','0013_jira_info_level','2020-11-01 10:38:40.650779'),(51,'dojo','0014_jira_conf_resolution_mappings','2020-11-01 10:38:40.716358'),(52,'dojo','0015_findingimage_caption','2020-11-01 10:38:40.802274'),(53,'dojo','0016_increase_filepath_length','2020-11-01 10:38:40.877905'),(54,'dojo','0017_auto_20190827_1421','2020-11-01 10:38:40.939397'),(55,'dojo','0018_sonarqube_api_integration','2020-11-01 10:38:41.362743'),(56,'dojo','0019_notetype_additions','2020-11-01 10:38:41.696921'),(57,'dojo','0020_system_settings_allow_anonymous_survey_repsonse','2020-11-01 10:38:41.805526'),(58,'dojo','0021_cve_index','2020-11-01 10:38:41.981842'),(59,'dojo','0022_google_sheet_sync_additions','2020-11-01 10:38:42.131713'),(60,'dojo','0023_SAST_track_unique_vulnerabilities','2020-11-01 10:38:43.106884'),(61,'dojo','0024_cve_fix_1553','2020-11-01 10:38:43.206849'),(62,'dojo','0025_jira_security_issuetype','2020-11-01 10:38:43.224174'),(63,'dojo','0026_login_banner','2020-11-01 10:38:43.248236'),(64,'dojo','0027_jira_issue_type_settings','2020-11-01 10:38:43.269662'),(65,'dojo','0028_finding_indices','2020-11-01 10:38:43.923660'),(66,'dojo','0029_cve_regex','2020-11-01 10:38:44.000576'),(67,'dojo','0030_prod_type_meta','2020-11-01 10:38:44.018841'),(68,'dojo','0031_finding_component','2020-11-01 10:38:44.526002'),(69,'dojo','0032_system_settings_enable_auditlog','2020-11-01 10:38:44.566564'),(70,'dojo','0033_remove_finding_duplicate_list','2020-11-01 10:38:44.650029'),(71,'dojo','0034_add_github_support','2020-11-01 10:38:44.916470'),(72,'dojo','0035_push_all_issues_help_text_rename_gh_fields','2020-11-01 10:38:45.289367'),(73,'dojo','0036_system_settings_email_address','2020-11-01 10:38:45.332153'),(74,'dojo','0037_email_notification_overhaul','2020-11-01 10:38:46.051311'),(75,'dojo','0038_timezone_update','2020-11-01 10:38:46.104311'),(76,'dojo','0039_test_version','2020-11-01 10:38:46.207960'),(77,'dojo','0040_finding_cwe_index','2020-11-01 10:38:46.295797'),(78,'dojo','0041_engagement_survey_import','2020-11-01 10:38:47.955289'),(79,'dojo','0042_risk_acceptance_improvements','2020-11-01 10:38:49.197414'),(80,'dojo','0043_finding_hash_code_index','2020-11-01 10:38:49.807463'),(81,'dojo','0044_required_prod_type','2020-11-01 10:38:49.982789'),(82,'dojo','0045_slack_help_text','2020-11-01 10:38:50.014439'),(83,'dojo','0046_endpoint_status','2020-11-01 10:38:50.454409'),(84,'dojo','0047_jira_minimum_severity_default','2020-11-01 10:38:50.832910'),(85,'dojo','0048_sla_notifications','2020-11-01 10:38:51.051807'),(86,'dojo','0049_create_endpoint_status','2020-11-01 10:38:51.467775'),(87,'dojo','0050_deduplication_on_engagement','2020-11-01 10:38:51.536591'),(88,'dojo','0051_regulation_categories','2020-11-01 10:38:51.581524'),(89,'dojo','0052_cvssv3_field','2020-11-01 10:38:51.790126'),(90,'dojo','0053_engagement_notes','2020-11-01 10:38:51.912511'),(91,'dojo','0054_dojometa_finding','2020-11-01 10:38:52.183632'),(92,'dojo','0055_notifications_jira_update_verbose_name','2020-11-01 10:38:52.279305'),(93,'dojo','0056_index_component_name','2020-11-01 10:38:52.362210'),(94,'dojo','0057_ms_teams','2020-11-01 10:38:53.704665'),(95,'dojo','0058_document_finding_model','2020-11-01 10:39:00.423655'),(96,'dojo','0059_product_type_authorized_users','2020-11-01 10:39:00.527076'),(97,'dojo','0060_false_p_dedupe_indices','2020-11-01 10:39:00.759596'),(98,'sessions','0001_initial','2020-11-01 10:39:00.785194'),(99,'sites','0001_initial','2020-11-01 10:39:00.820288'),(100,'sites','0002_alter_domain_unique','2020-11-01 10:39:00.844152'),(101,'default','0001_initial','2020-11-01 10:39:01.115174'),(102,'social_auth','0001_initial','2020-11-01 10:39:01.121708'),(103,'default','0002_add_related_name','2020-11-01 10:39:01.567471'),(104,'social_auth','0002_add_related_name','2020-11-01 10:39:01.574427'),(105,'default','0003_alter_email_max_length','2020-11-01 10:39:01.596340'),(106,'social_auth','0003_alter_email_max_length','2020-11-01 10:39:01.602668'),(107,'default','0004_auto_20160423_0400','2020-11-01 10:39:01.663561'),(108,'social_auth','0004_auto_20160423_0400','2020-11-01 10:39:01.669526'),(109,'social_auth','0005_auto_20160727_2333','2020-11-01 10:39:01.695554'),(110,'social_django','0006_partial','2020-11-01 10:39:01.724805'),(111,'social_django','0007_code_timestamp','2020-11-01 10:39:01.782258'),(112,'social_django','0008_partial_timestamp','2020-11-01 10:39:01.835292'),(113,'social_django','0009_auto_20191118_0520','2020-11-01 10:39:02.024770'),(114,'social_django','0010_uid_db_index','2020-11-01 10:39:02.099466'),(115,'tagging','0001_initial','2020-11-01 10:39:02.272747'),(116,'tagging','0002_on_delete','2020-11-01 10:39:02.680076'),(117,'tagging','0003_adapt_max_tag_length','2020-11-01 10:39:02.726779'),(118,'tastypie','0001_initial','2020-11-01 10:39:02.856665'),(119,'tastypie','0002_api_access_url_length','2020-11-01 10:39:02.928092'),(120,'watson','0001_initial','2020-11-01 10:39:03.212001'),(121,'social_django','0003_alter_email_max_length','2020-11-01 10:39:03.232688'),(122,'social_django','0004_auto_20160423_0400','2020-11-01 10:39:03.238902'),(123,'social_django','0001_initial','2020-11-01 10:39:03.244168'),(124,'social_django','0005_auto_20160727_2333','2020-11-01 10:39:03.249720'),(125,'social_django','0002_add_related_name','2020-11-01 10:39:03.255228');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_alerts`
--

DROP TABLE IF EXISTS `dojo_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_alerts_user_id_id_e1383cf6_fk_auth_user_id` (`user_id_id`),
  CONSTRAINT `dojo_alerts_user_id_id_e1383cf6_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_alerts`
--

LOCK TABLES `dojo_alerts` WRITE;
/*!40000 ALTER TABLE `dojo_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_answer`
--

DROP TABLE IF EXISTS `dojo_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `answered_survey_id` int(11) NOT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_answer_answered_survey_id_e56eb444_fk_dojo_answ` (`answered_survey_id`),
  KEY `dojo_answer_polymorphic_ctype_id_2d5e4049_fk_django_co` (`polymorphic_ctype_id`),
  KEY `dojo_answer_question_id_d01edef0_fk_dojo_question_id` (`question_id`),
  CONSTRAINT `dojo_answer_answered_survey_id_e56eb444_fk_dojo_answ` FOREIGN KEY (`answered_survey_id`) REFERENCES `dojo_answered_survey` (`id`),
  CONSTRAINT `dojo_answer_polymorphic_ctype_id_2d5e4049_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `dojo_answer_question_id_d01edef0_fk_dojo_question_id` FOREIGN KEY (`question_id`) REFERENCES `dojo_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_answer`
--

LOCK TABLES `dojo_answer` WRITE;
/*!40000 ALTER TABLE `dojo_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_answered_survey`
--

DROP TABLE IF EXISTS `dojo_answered_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_answered_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `answered_on` date DEFAULT NULL,
  `engagement_id` int(11) DEFAULT NULL,
  `responder_id` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_answered_survey_engagement_id_af2662e6_fk_dojo_enga` (`engagement_id`),
  KEY `dojo_answered_survey_responder_id_58c240b2_fk_auth_user_id` (`responder_id`),
  KEY `dojo_answered_survey_assignee_id_16fbe300_fk_auth_user_id` (`assignee_id`),
  KEY `dojo_answered_survey_survey_id_bf9be736_fk_dojo_enga` (`survey_id`),
  CONSTRAINT `dojo_answered_survey_assignee_id_16fbe300_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_answered_survey_engagement_id_af2662e6_fk_dojo_enga` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_answered_survey_responder_id_58c240b2_fk_auth_user_id` FOREIGN KEY (`responder_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_answered_survey_survey_id_bf9be736_fk_dojo_enga` FOREIGN KEY (`survey_id`) REFERENCES `dojo_engagement_survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_answered_survey`
--

LOCK TABLES `dojo_answered_survey` WRITE;
/*!40000 ALTER TABLE `dojo_answered_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_answered_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_app_analysis`
--

DROP TABLE IF EXISTS `dojo_app_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_app_analysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confidence` int(11) DEFAULT NULL,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_found` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_app_analysis_product_id_49351fd5_fk_dojo_product_id` (`product_id`),
  KEY `dojo_app_analysis_user_id_43cd434c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_app_analysis_product_id_49351fd5_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_app_analysis_user_id_43cd434c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_app_analysis`
--

LOCK TABLES `dojo_app_analysis` WRITE;
/*!40000 ALTER TABLE `dojo_app_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_app_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_bannerconf`
--

DROP TABLE IF EXISTS `dojo_bannerconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_bannerconf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_enable` tinyint(1) DEFAULT NULL,
  `banner_message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_bannerconf`
--

LOCK TABLES `dojo_bannerconf` WRITE;
/*!40000 ALTER TABLE `dojo_bannerconf` DISABLE KEYS */;
INSERT INTO `dojo_bannerconf` VALUES (1,0,'');
/*!40000 ALTER TABLE `dojo_bannerconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_category`
--

DROP TABLE IF EXISTS `dojo_benchmark_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `references` longtext COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_benchmark_categ_type_id_6f3979cc_fk_dojo_benc` (`type_id`),
  CONSTRAINT `dojo_benchmark_categ_type_id_6f3979cc_fk_dojo_benc` FOREIGN KEY (`type_id`) REFERENCES `dojo_benchmark_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_category`
--

LOCK TABLES `dojo_benchmark_category` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_category` DISABLE KEYS */;
INSERT INTO `dojo_benchmark_category` VALUES (1,'V7: Cryptography Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* That all cryptographic modules fail in a secure manner and that errors are handled correctly.\r\n* That a suitable random number generator is used when randomness is required.\r\n* That access to keys is managed in a secure way.','* [OWASP Testing Guide 4.0: Testing for weak Cryptography](https://www.owasp.org/index.php/Testing_for_weak_Cryptography)\r\n* [OWASP Cheat Sheet: Cryptographic Storage](https://www.owasp.org/index.php/Cryptographic_Storage_Cheat_Sheet)',1,'2018-04-03 20:10:41.006000','2018-04-03 20:10:41.006000',1),(2,'V2: Authentication Verification Requirements','Authentication is the act of establishing, or confirming, something (or someone) as authentic, that is, that claims made by or about the thing are true. Ensure that a verified application satisfies the following high level requirements:\r\n\r\nVerifies the digital identity of the sender of a communication. Ensures that only those authorised are able to authenticate and credentials are transported in a secure manner.','* https://www.owasp.org/index.php/Testing_for_authentication\r\n* https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet\r\n* https://www.owasp.org/index.php/Forgot_Password_Cheat_Sheet\r\n* https://www.owasp.org/index.php/Choosing_and_Using_Security_Questions_Cheat_Sheet',1,'2018-04-09 20:12:01.803000','2018-04-09 20:12:01.803000',1),(3,'V1: Architecture, Design and Threat Modeling Requirements','In a perfect world, security would be considered throughout all phases of development. In reality however, security is often only a consideration at a late stage in the SDLC. Besides the technical controls, the ASVS requires processes to be in place that ensure that the security has been explicitly addressed when planning the architecture of the application or API, and that the functional and security roles of all components are known. Since single page applications and act as clients to remote API or services, it must be ensured that appropriate security standards are also applied to those services - testing the app in isolation is not sufficient.\r\n\r\nThe category lists requirements pertaining to architecture and design of the app. As such, this is the only category that does not map to technical test cases in the OWASP Testing Guide. To cover topics such as threat modelling, secure SDLC, key management, users of the ASVS should consult the respective OWASP projects and/or other standards such as the ones linked below.','* https://www.owasp.org/index.php/Application_Security_Architecture_Cheat_Sheet\r\n* https://www.owasp.org/index.php/Attack_Surface_Analysis_Cheat_Sheet\r\n* https://www.owasp.org/index.php/Application_Security_Architecture_Cheat_Sheet\r\n* https://www.owasp.org/index.php/Application_Threat_Modeling\r\n* https://www.owasp.org/index.php/Secure_SDLC_Cheat_Sheet\r\n* https://www.microsoft.com/en-us/sdl/\r\n* http://csrc.nist.gov/publications/nistpubs/800-57/sp800-57-Part1-revised2_Mar08-2007.pdf',1,'2018-04-10 17:20:51.811000','2018-04-10 17:20:51.811000',1),(4,'V3: Session Management Verification Requirements','One of the core components of any web-based application is the mechanism by which it controls and maintains the state for a user interacting with it. This is referred to this as Session Management and is defined as the set of all controls governing state-full interaction between a user and the web-based application.\r\n\r\nEnsure that a verified application satisfies the following high level session management requirements:\r\n\r\n* Sessions are unique to each individual and cannot be guessed or shared\r\n* Sessions are invalidated when no longer required and timed out during periods of inactivity.','* https://www.owasp.org/index.php/Testing_for_Session_Management\r\n* https://www.owasp.org/index.php/Session_Management_Cheat_Sheet',1,'2018-04-10 17:24:33.975000','2018-04-10 17:24:33.975000',1),(5,'V4: Access Control Verification Requirements','Authorization is the concept of allowing access to resources only to those permitted to use them. Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* Persons accessing resources holds valid credentials to do so.\r\n* Users are associated with a well-defined set of roles and privileges.\r\n* Role and permission metadata is protected from replay or tampering.','* [OWASP Testing Guide 4.0: Authorization](https://www.owasp.org/index.php/Testing_for_Authorization)\r\n* [OWASP Cheat Sheet: Access Control](https://www.owasp.org/index.php/Access_Control_Cheat_Sheet)',1,'2018-04-10 18:46:47.356000','2018-04-10 18:46:47.356000',1),(6,'V5: Input Validation and Output Encoding Verification Requirements','The most common web application security weakness is the failure to properly validate input coming from the client or from the environment before using it. This weakness leads to almost all of the major vulnerabilities in web applications, such as cross site scripting, SQL injection, interpreter injection, locale/Unicode attacks, file system attacks, and buffer overflows.\r\n\r\nEnsure that a verified application satisfies the following high level requirements:\r\n\r\n* All input is validated to be correct and fit for the intended purpose.\r\n* Data from an external entity or client should never be trusted and should be handled accordingly.','* [OWASP Testing Guide 4.0: Input Validation Testing](https://www.owasp.org/index.php/Testing_for_Input_Validation)\r\n* [OWASP Cheat Sheet: Input Validation](https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet)\r\n* [OWASP Testing Guide 4.0: Testing for HTTP Parameter Pollution](https://www.owasp.org/index.php/Testing_for_HTTP_Parameter_pollution_%28OTG-INPVAL-004%29)\r\n* [OWASP LDAP Injection Cheat Sheet ](https://www.owasp.org/index.php/LDAP_Injection_Prevention_Cheat_Sheet)\r\n* [OWASP Testing Guide 4.0: Client Side Testing ](https://www.owasp.org/index.php/Client_Side_Testing)\r\n* [OWASP Cross Site Scripting Prevention Cheat Sheet ](https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet)\r\n* [OWASP DOM Based Cross Site Scripting Prevention Cheat Sheet ](https://www.owasp.org/index.php/DOM_based_XSS_Prevention_Cheat_Sheet)\r\n* [OWASP Java Encoding Project](https://www.owasp.org/index.php/OWASP_Java_Encoder_Project)\r\n\r\nFor more information on auto-escaping, please see:\r\n\r\n* [Reducing XSS by way of Automatic Context-Aware Escaping in Template Systems](http://googleonlinesecurity.blogspot.com/2009/03/reducing-xss-by-way-of-automatic.html)\r\n* [AngularJS Strict Contextual Escaping](https://docs.angularjs.org/api/ng/service/$sce)\r\n* [ReactJS Escaping](https://reactjs.org/docs/introducing-jsx.html#jsx-prevents-injection-attacks)\r\n* [Improperly Controlled Modification of Dynamically-Determined Object Attributes](https://cwe.mitre.org/data/definitions/915.html)',1,'2018-04-10 18:56:42.504000','2018-04-10 18:56:42.504000',1),(7,'V8: Error Handling and Logging Verification Requirements','The primary objective of error handling and logging is to provide a useful reaction by the user, administrators, and incident response teams. The objective is not to create massive amounts of logs, but high quality logs, with more signal than discarded noise.\r\n\r\nHigh quality logs will often contain sensitive data, and must be protected as per local data privacy laws or directives. This should include:\r\n\r\n* Not collecting or logging sensitive information if not specifically required.\r\n* Ensuring all logged information is handled securely and protected as per its data classification.\r\n* Ensuring that logs are not forever, but have an absolute lifetime that is as short as possible.\r\n\r\nIf logs contain private or sensitive data, the definition of which varies from country to country, the logs become some of the most sensitive information held by the application and thus very attractive to attackers in their own right.','* [OWASP Testing Guide 4.0 content: Testing for Error Handling](https://www.owasp.org/index.php/Testing_for_Error_Handling)',1,'2018-04-10 19:13:25.863000','2018-04-10 19:13:25.863000',1),(8,'V9: Data Protection Verification Requirements','There are three key elements to sound data protection: Confidentiality, Integrity and Availability (CIA). This standard assumes that data protection is enforced on a trusted system, such as a server, which has been hardened and has sufficient protections.\r\n\r\nApplications have to assume that all user devices are compromised in some way. Where an application transmits or stores sensitive information on insecure devices, such as shared computers, phones and tablets, the application is responsible for ensuring data stored on these devices is encrypted and cannot be easily illicitly obtained, altered or disclosed.\r\n\r\nEnsure that a verified application satisfies the following high level data protection requirements:\r\n\r\n*	Confidentiality: Data should be protected from unauthorised observation or disclosure both in transit and when stored.\r\n*	Integrity: Data should be protected being maliciously created, altered or deleted by unauthorized attackers.\r\n*	Availability: Data should be available to authorized users as required','* [Consider using Security Headers website to check security and anti-caching headers](https://securityheaders.io)\r\n* [OWASP Secure Headers project](https://www.owasp.org/index.php/OWASP_Secure_Headers_Project)\r\n* [User Privacy Protection Cheat Sheet](https://www.owasp.org/index.php/User_Privacy_Protection_Cheat_Sheet)',1,'2018-04-10 20:02:38.179000','2018-04-10 20:02:38.179000',1),(9,'V10: Communications Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* That TLS is used where sensitive data is transmitted.\r\n* That strong algorithms and ciphers are used at all times.','* [OWASP TLS Cheat Sheet. ](https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet)\r\n* [Notes on Approved modes of TLS. In the past, the ASVS referred to the US standard FIPS 140-2, but as a global standard, applying US standards this can be difficult, contradictory, or confusing to apply. A better method of achieving compliance with 10.8 would be to review guides such as (https://wiki.mozilla.org/Security/Server_Side_TLS), generate known good configurations (https://mozilla.github.io/server-side-tls/ssl-config-generator/), and use known TLS evaluation tools, such as sslyze, various vulnerability scanners or trusted TLS online assessment services to obtain a desired level of security. In general, we see non-compliance for this section being the use of outdated or insecure ciphers and algorithms, the lack of perfect forward secrecy, outdated or insecure SSL protocols, weak preferred ciphers, and so on.]\r\n* [Certificate pinning. For more information please review ](https://tools.ietf.org/html/rfc7469.)The rationale behind certificate pinning for production and backup keys is business continuity - see (https://noncombatant.org/2015/05/01/about-http-public-key-pinning/)\r\n* [OWASP Certificate Pinning Cheat Sheet](https://www.owasp.org/index.php/Pinning_Cheat_Sheet)\r\n* [OWASP Certificate and Public Key Pinning](https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning)\r\n* [Time of first use (TOFU) Pinning](https://developer.mozilla.org/en/docs/Web/Security/Public_Key_Pinning)\r\n* [Pre-loading HTTP Strict Transport Security](https://www.chromium.org/hsts)',1,'2018-04-11 01:34:58.018000','2018-04-11 01:34:58.018000',1),(10,'V13: Malicious Code Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* Malicious activity is handled securely and properly as to not affect the rest of the application.\r\n* Do not have time bombs or other time based attacks built into them\r\n* Do not phone home to malicious or unauthorized destinations\r\n* Applications do not have back doors, Easter eggs, salami attacks, or logic flaws that can be controlled by an attacker\r\n\r\nMalicious code is extremely rare, and is difficult to detect. Manual line by line code review can assist looking for logic bombs, but even the most experienced code reviewer will struggle to find malicious code even if they know it exists. This section is not possible to complete without access to source code, including as many third party libraries as possible.','',1,'2018-04-11 01:48:58.751000','2018-04-11 01:48:58.751000',1),(11,'V15: Business Logic Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* The business logic flow is sequential and in order\r\n* Business logic includes limits to detect and prevent automated attacks, such as continuous small funds transfers, or adding a million friends one at a time, and so on.\r\n* High value business logic flows have considered abuse cases and malicious actors, and have protections against spoofing, tampering, repudiation, information disclosure, and elevation of privilege attacks.','* [OWASP Testing Guide 4.0: Business Logic Testing ](https://www.owasp.org/index.php/Testing_for_business_logic)\r\n* [OWASP Cheat Sheet](https://www.owasp.org/index.php/Business_Logic_Security_Cheat_Sheet)',1,'2018-04-11 01:51:36.593000','2018-04-11 01:51:36.593000',1),(12,'V16: File and Resources Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\r\n\r\n* Untrusted file data should be handled accordingly and in a secure manner\r\n* Obtained from untrusted sources are stored outside the webroot and limited permissions.','',1,'2018-04-11 02:00:52.815000','2018-04-11 02:00:52.815000',1),(13,'V18: API and Web Service Verification Requirements','Ensure that a verified application that uses RESTful or SOAP based web services has:\r\n\r\n* Adequate authentication, session management and authorization of all web services\r\n* Input validation of all parameters that transit from a lower to higher trust level\r\n* Basic interoperability of SOAP web services layer to promote API use','* [OWASP Testing Guide 4.0: Configuration and Deployment Management Testing](https://www.owasp.org/index.php/Testing_for_configuration_management)\r\n* [OWASP Cross-Site Request Forgery cheat sheet](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)\r\n* [JSON Web Tokens (and Signing)](https://jwt.io/)',1,'2018-04-11 02:13:07.053000','2018-04-11 02:13:07.053000',1),(14,'V19: Configuration Verification Requirements','* Up to date libraries and platform(s).\r\n* A secure by default configuration.\r\n* Sufficient hardening that user initiated changes to default configuration do not unnecessarily expose or create security weaknesses or flaws to underlying systems.','* [OWASP Testing Guide 4.0: Configuration and Deployment Management Testing](https://www.owasp.org/index.php/Testing_for_configuration_management)',1,'2018-04-11 02:13:45.949000','2018-04-11 02:13:45.949000',1),(15,'V20: Internet of Things Verification Requirements','Embedded/IoT devices should:\r\n\r\n* Have the same level of security controls within the device as found in the server, by enforcing security controls in a trusted environment.\r\n* Sensitive data stored on the device should be done so in a secure manner.\r\n* All sensitive data transmitted from the device should utilize transport layer security.','* [OWASP Internet of Things Top 10](https://www.owasp.org/images/7/71/Internet_of_Things_Top_Ten_2014-OWASP.pdf)\r\n* [OWASP Internet of Things Project](https://www.owasp.org/index.php/OWASP_Internet_of_Things_Project)\r\n* [Trudy TCP Proxy Tool](https://github.com/praetorian-inc/trudy)',1,'2018-04-11 02:14:27.877000','2018-04-11 02:14:27.877000',1),(16,'V13: API and Web Service Verification Requirements','Ensure that a verified application that uses trusted service layer APIs (commonly using JSON or XML or GraphQL) has:\n\n* Adequate authentication, session management and authorization of all web services.\n* Input validation of all parameters that transit from a lower to higher trust level.\n* Effective security controls for all API types, including cloud and Serverless API\n\nPlease read this chapter in combination with all other chapters at this same level; we no longer duplicate authentication or API session management concerns.','## References\n\nFor more information, see also:\n\n* [OWASP Serverless Top 10](https://www.owasp.org/images/5/5c/OWASP-Top-10-Serverless-Interpretation-en.pdf)\n* [OWASP Serverless Project](https://www.owasp.org/index.php/OWASP_Serverless_Top_10_Project)\n* [OWASP Testing Guide 4.0: Configuration and Deployment Management Testing](https://www.owasp.org/index.php/Testing_for_configuration_management)\n* [OWASP Cross-Site Request Forgery cheat sheet](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.md#triple-submit-cookie)\n* [OWASP XML External Entity Prevention Cheat Sheet - General Guidance](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.md#general-guidance)* [JSON Web Tokens (and Signing)](https://jwt.io/)\n* [REST Security Cheat Sheet](https://www.owasp.org/index.php/REST_Security_Cheat_Sheet)\n* [JSON Schema](https://json-schema.org/specification.html)\n* [XML DTD Entity Attacks](https://www.vsecurity.com//download/publications/XMLDTDEntityAttacks.pdf)\n* [Orange Tsai - A new era of SSRF Exploiting URL Parser In Trending Programming Languages](https://www.blackhat.com/docs/us-17/thursday/us-17-Tsai-A-New-Era-Of-SSRF-Exploiting-URL-Parser-In-Trending-Programming-Languages.pdf)',1,'2019-03-27 15:18:24.271000','2019-03-27 15:18:24.271000',2),(17,'V10: Malicious Code Verification Requirements','Ensure that code satisfies the following high level requirements:\n\n* Malicious activity is handled securely and properly  to not affect the rest of the application.\n* Does not have time bombs or other time-based attacks.\n* Does not \"phone home\" to malicious or unauthorized destinations.\n* Does not have back doors, Easter eggs, salami attacks, rootkits, or unauthorized code that can be controlled by an attacker.\n\nFinding malicious code is proof of the negative, which is impossible to completely validate. Best efforts should be undertaken to ensure that the code has no inherent malicious code or unwanted functionality.','## References\n\n* [Hostile Sub-Domain Takeover, Detectify Labs](https://labs.detectify.com/2014/10/21/hostile-subdomain-takeover-using-herokugithubdesk-more/)\n* [Hijacking of abandoned subdomains part 2, Detectify Labs](https://labs.detectify.com/2014/12/08/hijacking-of-abandoned-subdomains-part-2/)',1,'2019-03-27 15:18:24.271000','2019-03-27 15:18:24.271000',2),(18,'V14: Configuration Verification Requirements','Ensure that a verified application has:\n\n* A secure, repeatable, automatable build environment.\n* Hardened third party library, dependency and configuration management such that out of date or insecure components are not included by the application.\n* A secure-by-default configuration, such that administrators and users have to weaken the default security posture.\n\nConfiguration of the application out of the box should be safe to be on the Internet, which means a safe out of the box configuration.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Testing for HTTP Verb Tampering]( https://www.owasp.org/index.php/Testing_for_HTTP_Verb_Tampering_%28OTG-INPVAL-003%29)\n* Adding Content-Disposition to API responses helps prevent many attacks based on misunderstanding on the MIME type between client and server, and the \"filename\" option specifically helps prevent [Reflected File Download attacks.](https://www.blackhat.com/docs/eu-14/materials/eu-14-Hafif-Reflected-File-Download-A-New-Web-Attack-Vector.pdf)\n* [Content Security Policy Cheat Sheet](https://www.owasp.org/index.php?title=Content_Security_Policy_Cheat_Sheet)\n* [Exploiting CORS misconfiguration for BitCoins and Bounties](https://portswigger.net/blog/exploiting-cors-misconfigurations-for-bitcoins-and-bounties)\n* [OWASP Testing Guide 4.0: Configuration and Deployment Management Testing](https://www.owasp.org/index.php/Testing_for_configuration_management)\n* [Sandboxing third party components](https://www.owasp.org/index.php/3rd_Party_Javascript_Management_Cheat_Sheet#Sandboxing_Content)',1,'2019-03-27 15:18:24.271000','2019-03-27 15:18:24.271000',2),(19,'V6: Stored Cryptography Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\n\n* All cryptographic modules fail in a secure manner and that errors are handled correctly.\n* A suitable random number generator is used.\n* Access to keys is securely managed.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Testing for weak Cryptography](https://www.owasp.org/index.php/Testing_for_weak_Cryptography)\n* [OWASP Cheat Sheet: Cryptographic Storage](https://www.owasp.org/index.php/Cryptographic_Storage_Cheat_Sheet)\n* [FIPS 140-2](https://csrc.nist.gov/publications/detail/fips/140/2/final)',1,'2019-03-27 15:18:24.272000','2019-03-27 15:18:24.272000',2),(20,'V9: Communications Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\n\n* TLS or strong encryption is always used, regardless of the sensitivity of the data being transmitted\n* The most recent, leading configuration advice is used to enable and order preferred algorithms and ciphers\n* Weak or soon to be deprecated algorithms and ciphers are ordered as a last resort\n* Deprecated or known insecure algorithms and ciphers are disabled.\n\nLeading industry advice on secure TLS configuration changes frequently, often due to catastrophic breaks in existing algorithms and ciphers. Always use the most recent versions of TLS configuration review tools (such as SSLyze or other TLS scanners) to configure the preferred order and algorithm selection. Configuration should be periodically checked to ensure that secure communications configuration is always present and effective.','## References\n\nFor more information, see also:\n\n* [OWASP – TLS Cheat Sheet](https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet)\n* Notes on “Approved modes of TLS”. In the past, the ASVS referred to the US standard FIPS 140-2, but as a global standard, applying US standards can be difficult, contradictory, or confusing to apply. A better method of achieving compliance with 9.1.3 would be to review guides such as [Mozilla\'s Server Side TLS](https://wiki.mozilla.org/Security/Server_Side_TLS) or  [generate known good configurations](https://mozilla.github.io/server-side-tls/ssl-config-generator/), and use known TLS evaluation tools, such as sslyze, various vulnerability scanners or trusted TLS online assessment services to obtain a desired level of security. In general, we see non-compliance for this section being the use of outdated or insecure ciphers and algorithms, the lack of perfect forward secrecy, outdated or insecure SSL protocols, weak preferred ciphers, and so on.',1,'2019-03-27 15:18:24.272000','2019-03-27 15:18:24.272000',2),(21,'V4: Access Control Verification Requirements','Authorization is the concept of allowing access to resources only to those permitted to use them. Ensure that a verified application satisfies the following high level requirements:\n\n* Persons accessing resources hold valid credentials to do so.\n* Users are associated with a well-defined set of roles and privileges.\n* Role and permission metadata is protected from replay or tampering.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Authorization](https://www.owasp.org/index.php/Testing_for_Authorization)\n* [OWASP Cheat Sheet: Access Control](https://www.owasp.org/index.php/Access_Control_Cheat_Sheet)\n* [OWASP CSRF Cheat Sheet](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)\n* [OWASP REST Cheat Sheet](https://www.owasp.org/index.php/REST_Security_Cheat_Sheet)',1,'2019-03-27 15:18:24.272000','2019-03-27 15:18:24.272000',2),(22,'V3: Session Management Verification Requirements','One of the core components of any web-based application or stateful API is the mechanism by which it controls and maintains the state for a user or device interacting with it. Session management changes a stateless protocol to stateful, which is critical for differentiating different users or devices.\n\nEnsure that a verified application satisfies the following high-level session management requirements:\n\n* Sessions are unique to each individual and cannot be guessed or shared.\n* Sessions are invalidated when no longer required and timed out during periods of inactivity.\n\nAs previously noted, these requirements have been adapted to be a compliant subset of selected NIST 800-63b controls, focused around common threats and commonly exploited authentication weaknesses. Previous verification requirements have been retired, de-duped, or in most cases adapted to be strongly aligned with the intent of mandatory [NIST 800-63b](https://pages.nist.gov/800-63-3/sp800-63b.htmlx) requirements.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Session Management Testing](https://www.owasp.org/index.php/Testing_for_Session_Management)\n* [OWASP Session Management Cheat Sheet](https://www.owasp.org/index.php/Session_Management_Cheat_Sheet)\n* [Set-Cookie __Host- prefix details](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie#Directives)',1,'2019-03-27 15:18:24.272000','2019-03-27 15:18:24.272000',2),(23,'V7: Error Handling and Logging Verification Requirements','The primary objective of error handling and logging is to provide useful information for the user, administrators, and incident response teams. The objective is not to create massive amounts of logs, but high quality logs, with more signal than discarded noise.\n\nHigh quality logs will often contain sensitive data, and must be protected as per local data privacy laws or directives. This should include:\n\n* Not collecting or logging sensitive information unless specifically required.\n* Ensuring all logged information is handled securely and protected as per its data classification.\n* Ensuring that logs are not stored forever, but have an absolute lifetime that is as short as possible.\n\nIf logs contain private or sensitive data, the definition of which varies from country to country, the logs become some of the most sensitive information held by the application and thus very attractive to attackers in their own right.\n\nIt is also important to ensure that the application fails securely and that errors do not disclose unnecessary information.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0 content: Testing for Error Handling](https://www.owasp.org/index.php/Testing_for_Error_Handling)',1,'2019-03-27 15:18:24.273000','2019-03-27 15:18:24.273000',2),(24,'V8: Data Protection Verification Requirements','There are three key elements to sound data protection: Confidentiality, Integrity and Availability (CIA). This standard assumes that data protection is enforced on a trusted system, such as a server, which has been hardened and has sufficient protections.\n\nApplications have to assume that all user devices are compromised in some way. Where an application transmits or stores sensitive information on insecure devices, such as shared computers, phones and tablets, the application is responsible for ensuring data stored on these devices is encrypted and cannot be easily illicitly obtained, altered or disclosed.\n\nEnsure that a verified application satisfies the following high level data protection requirements:\n\n* Confidentiality: Data should be protected from unauthorized observation or disclosure both in transit and when stored.\n* Integrity: Data should be protected from being maliciously created, altered or deleted by unauthorized attackers.\n* Availability: Data should be available to authorized users as required.','## References\n\nFor more information, see also:\n\n* [Consider using Security Headers website to check security and anti-caching headers](https://securityheaders.io)\n* [OWASP Secure Headers project](https://www.owasp.org/index.php/OWASP_Secure_Headers_Project)\n* [OWASP Privacy Risks Project](https://www.owasp.org/index.php/OWASP_Top_10_Privacy_Risks_Project)\n* [OWASP User Privacy Protection Cheat Sheet](https://www.owasp.org/index.php/User_Privacy_Protection_Cheat_Sheet)\n* [European Union General Data Protection Regulation (GDPR) overview](https://edps.europa.eu/data-protection_en)\n* [European Union Data Protection Supervisor - Internet Privacy Engineering Network](https://edps.europa.eu/data-protection/ipen-internet-privacy-engineering-network_en)',1,'2019-03-27 15:18:24.273000','2019-03-27 15:18:24.273000',2),(25,'V2: Authentication Verification Requirements','Authentication is the act of establishing, or confirming, someone (or something) as authentic and that claims made by a person or about a device are correct, resistant to impersonation, and prevent recovery or interception of passwords.\n\nWhen the ASVS was first released, username + password was the most common form of authentication outside of high security systems. Multi-factor authentication (MFA) was commonly accepted in security circles but rarely required elsewhere. As the number of password breaches increased, the idea that usernames are somehow confidential and passwords unknown, rendered many security controls untenable. For example, NIST 800-63 considers usernames and knowledge based authentication (KBA) as public information, SMS and email notifications as [\"restricted\" authenticator types](https://pages.nist.gov/800-63-FAQ/#q-b1) , and passwords as pre-breached. This reality renders knowledge based authenticators, SMS and email recovery, password history, complexity, and rotation controls useless. These controls always have been less than helpful, often forcing users to come up with weak passwords every few months, but with the release of over 5 billion username and password breaches, it\'s time to move on.\n\nOf all the sections in the ASVS, the authentication and session management chapters have changed the most. Adoption of effective, evidence-based leading practice will be challenging for many, and that\'s perfectly okay. We have to start the transition to a post-password future now.','## References\n\nFor more information, see also:\n\n* [NIST 800-63 - Digital Identity Guidelines](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63-3.pdf)\n* [NIST 800-63 A - Enrollment and Identity Proofing](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63a.pdf)\n* [NIST 800-63 B - Authentication and Lifecycle Management](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63b.pdf)\n* [NIST 800-63 C - Federation and Assertions](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-63c.pdf)\n* [NIST 800-63 FAQ](https://pages.nist.gov/800-63-FAQ/)\n* [OWASP Testing Guide 4.0: Testing for Authentication](https://www.owasp.org/index.php/Testing_for_authentication)\n* [OWASP Cheat Sheet - Password storage](https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet)\n* [OWASP Cheat Sheet - Forgot password](https://www.owasp.org/index.php/Forgot_Password_Cheat_Sheet)\n* [OWASP Cheat Sheet - Choosing and using security questions](https://www.owasp.org/index.php/Choosing_and_Using_Security_Questions_Cheat_Sheet)',1,'2019-03-27 15:18:24.274000','2019-03-27 15:18:24.274000',2),(26,'V12: File and Resources Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\n\n* Untrusted file data should be handled accordingly and in a secure manner.\n* Untrusted file data obtained from untrusted sources are stored outside the web root and with limited permissions.','## References\n\nFor more information, see also:\n\n* [File Extension Handling for Sensitive Information](https://www.owasp.org/index.php/Unrestricted_File_Upload)\n* [Reflective file download by Oren Hafif](https://www.trustwave.com/Resources/SpiderLabs-Blog/Reflected-File-Download---A-New-Web-Attack-Vector/)\n* [OWASP Third Party JavaScript Management Cheat Sheet](https://www.owasp.org/index.php/3rd_Party_Javascript_Management_Cheat_Sheet)',1,'2019-03-27 15:18:24.274000','2019-03-27 15:18:24.274000',2),(27,'V1: Architecture, Design and Threat Modeling Requirements','Security architecture has almost become a lost art in many organizations. The days of the enterprise architect have passed in the age of DevSecOps. The application security field must catch up and adopt agile security principles while re-introducing leading security architecture principles to software practitioners. Architecture is not an implementation, but a way of thinking about a problem that has potentially many different answers, and no one single \"correct\" answer. All too often, security is seen as inflexible and demanding that developers fix code in a particular way, when the developers may know a much better way to solve the problem. There is no single, simple solution for architecture, and to pretend otherwise is a disservice to the software engineering field.\n\nA specific implementation of a web application is likely to be revised continuously throughout its lifetime, but the overall architecture will likely rarely change but evolve slowly. Security architecture is identical - we need authentication today, we will require authentication tomorrow, and we will need it five years from now. If we make sound decisions today, we can save a lot of effort, time, and money if we select and re-use architecturally compliant solutions. For example, a decade ago, multifactor authentication was rarely implemented.\n\nIf developers had invested in a single, secure identity provider model, such as SAML federated identity, the identity provider could be updated to incorporate new requirements such as NIST 800-63 compliance, while not changing the interfaces of the original application. If many applications shared the same security architecture and thus that same component, they all benefit from this upgrade at once. However, SAML will not always remain as the best or most suitable authentication solution - it might need to be swapped out for other solutions as requirements change. Changes like this are either complicated, so costly as to necessitate a complete re-write, or outright impossible without security architecture.\n\nIn this chapter, the ASVS covers off the primary aspects of any sound security architecture: availability, confidentiality, processing integrity, non-repudiation, and privacy. Each of these security principles must be built in and be innate to all applications. It is critical to \"shift left\", starting with developer enablement with secure coding checklists, mentoring and training, coding and testing, building, deployment, configuration, and operations, and finishing with follow up independent testing to assure that all of the security controls are present and functional. The last step used to be everything we did as an industry, but that is no longer sufficient when developers push code into production tens or hundreds of times a day. Application security professionals must keep up with agile techniques, which means adopting developer tools, learning to code, and working with developers rather than criticizing the project months after everyone else has moved on.','## References\n\nFor more information, see also:\n\n* [OWASP Threat Modeling Cheat Sheet](https://www.owasp.org/index.php/Threat_Modeling_Cheat_Sheet)\n* [OWASP Attack Surface Analysis Cheat Sheet](https://www.owasp.org/index.php/Attack_Surface_Analysis_Cheat_Sheet)\n* [OWASP Threat modeling](https://www.owasp.org/index.php/Application_Threat_Modeling)\n* [OWASP Secure SDLC Cheat Sheet](https://www.owasp.org/index.php/Secure_SDLC_Cheat_Sheet)\n* [Microsoft SDL](https://www.microsoft.com/en-us/sdl/)\n* [NIST SP 800-57](https://csrc.nist.gov/publications/detail/sp/800-57-part-1/rev-4/final)',1,'2019-03-27 15:18:24.275000','2019-03-27 15:18:24.275000',2),(28,'V5: Validation, Sanitization and Encoding Verification Requirements','The most common web application security weakness is the failure to properly validate input coming from the client or the environment before directly using it without any output encoding. This weakness leads to almost all of the significant vulnerabilities in web applications, such as Cross-Site Scripting (XSS), SQL injection, interpreter injection, locale/Unicode attacks, file system attacks, and buffer overflows.\n\nEnsure that a verified application satisfies the following high-level requirements:\n\n* Input validation and output encoding architecture have an agreed pipeline to prevent injection attacks.\n* Input data is strongly typed, validated, range or length checked, or at worst, sanitized or filtered.\n* Output data is encoded or escaped as per the context of the data as close to the interpreter as possible.\n\nWith modern web application architecture, output encoding is more important than ever. It is difficult to provide robust input validation in certain scenarios, so the use of safer API such as parameterized queries, auto-escaping templating frameworks, or carefully chosen output encoding is critical to the security of the application.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Input Validation Testing](https://www.owasp.org/index.php/Testing_for_Input_Validation)\n* [OWASP Cheat Sheet: Input Validation](https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet)\n* [OWASP Testing Guide 4.0: Testing for HTTP Parameter Pollution](https://www.owasp.org/index.php/Testing_for_HTTP_Parameter_pollution_%28OTG-INPVAL-004%29)\n* [OWASP LDAP Injection Cheat Sheet](https://www.owasp.org/index.php/LDAP_Injection_Prevention_Cheat_Sheet)\n* [OWASP Testing Guide 4.0: Client Side Testing](https://www.owasp.org/index.php/Client_Side_Testing)\n* [OWASP Cross Site Scripting Prevention Cheat Sheet](https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet)\n* [OWASP DOM Based Cross Site Scripting Prevention Cheat Sheet](https://www.owasp.org/index.php/DOM_based_XSS_Prevention_Cheat_Sheet)\n* [OWASP Java Encoding Project](https://www.owasp.org/index.php/OWASP_Java_Encoder_Project)\n* [OWASP Mass Assignment Prevention Cheat Sheet](https://www.owasp.org/index.php/Mass_Assignment_Cheat_Sheet)\n* [DOMPurify - Client-side HTML Sanitization Library](https://github.com/cure53/DOMPurify)\n* [XML External Entity (XXE) Prevention Cheat Sheet](https://www.owasp.org/index.php/XML_External_Entity_(XXE)_Prevention_Cheat_Sheet))\n\nFor more information on auto-escaping, please see:\n\n* [Reducing XSS by way of Automatic Context-Aware Escaping in Template Systems](https://googleonlinesecurity.blogspot.com/2009/03/reducing-xss-by-way-of-automatic.html)\n* [AngularJS Strict Contextual Escaping](https://docs.angularjs.org/api/ng/service/$sce)\n* [AngularJS ngBind](https://docs.angularjs.org/api/ng/directive/ngBind)\n* [Angular Sanitization](https://angular.io/guide/security#sanitization-and-security-contexts)\n* [Angular Template Security](https://angular.io/guide/template-syntax#content-security)\n* [ReactJS Escaping](https://reactjs.org/docs/introducing-jsx.html#jsx-prevents-injection-attacks)\n* [Improperly Controlled Modification of Dynamically-Determined Object Attributes](https://cwe.mitre.org/data/definitions/915.html)\n\nFor more information on deserialization, please see:\n\n* [OWASP Deserialization Cheat Sheet](https://www.owasp.org/index.php/Deserialization_Cheat_Sheet)\n* [OWASP Deserialization of Untrusted Data Guide](https://www.owasp.org/index.php/Deserialization_of_untrusted_data)',1,'2019-03-27 15:18:24.276000','2019-03-27 15:18:24.276000',2),(29,'V11: Business Logic Verification Requirements','Ensure that a verified application satisfies the following high level requirements:\n\n* The business logic flow is sequential, processed in order, and cannot be bypassed.\n* Business logic includes limits to detect and prevent automated attacks, such as continuous small funds transfers, or adding a million friends one at a time, and so on.\n* High value business logic flows have considered abuse cases and malicious actors, and have protections against spoofing, tampering, repudiation, information disclosure, and elevation of privilege attacks.','## References\n\nFor more information, see also:\n\n* [OWASP Testing Guide 4.0: Business Logic Testing](https://www.owasp.org/index.php/Testing_for_business_logic)\n* [OWASP Cheat Sheet](https://www.owasp.org/index.php/Business_Logic_Security_Cheat_Sheet)\n* Anti-automation can be achieved in many ways, including the use of [OWASP AppSensor](https://www.owasp.org/index.php/OWASP_AppSensor_Project) and [OWASP Automated Threats to Web Applications](https://www.owasp.org/index.php/OWASP_Automated_Threats_to_Web_Applications)\n* [OWASP AppSensor](https://www.owasp.org/index.php/OWASP_AppSensor_Project) can also help with Attack Detection and Response.\n* [OWASP Cornucopia](https://www.owasp.org/index.php/OWASP_Cornucopia)',1,'2019-03-27 15:18:24.276000','2019-03-27 15:18:24.276000',2);
/*!40000 ALTER TABLE `dojo_benchmark_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_product`
--

DROP TABLE IF EXISTS `dojo_benchmark_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_fail` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `control_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_benchmark_product_product_id_control_id_74aa5f00_uniq` (`product_id`,`control_id`),
  KEY `dojo_benchmark_produ_control_id_d490126f_fk_dojo_benc` (`control_id`),
  CONSTRAINT `dojo_benchmark_produ_control_id_d490126f_fk_dojo_benc` FOREIGN KEY (`control_id`) REFERENCES `dojo_benchmark_requirement` (`id`),
  CONSTRAINT `dojo_benchmark_product_product_id_e6d826ef_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_product`
--

LOCK TABLES `dojo_benchmark_product` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_benchmark_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_product_notes`
--

DROP TABLE IF EXISTS `dojo_benchmark_product_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_product_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark_product_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_benchmark_product_n_benchmark_product_id_not_c9cede98_uniq` (`benchmark_product_id`,`notes_id`),
  KEY `dojo_benchmark_product_notes_notes_id_291a8ec0_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_benchmark_produ_benchmark_product_id_ba0c01ee_fk_dojo_benc` FOREIGN KEY (`benchmark_product_id`) REFERENCES `dojo_benchmark_product` (`id`),
  CONSTRAINT `dojo_benchmark_product_notes_notes_id_291a8ec0_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_product_notes`
--

LOCK TABLES `dojo_benchmark_product_notes` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_product_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_benchmark_product_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_product_summary`
--

DROP TABLE IF EXISTS `dojo_benchmark_product_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_product_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desired_level` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_level` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asvs_level_1_benchmark` int(11) NOT NULL,
  `asvs_level_1_score` int(11) NOT NULL,
  `asvs_level_2_benchmark` int(11) NOT NULL,
  `asvs_level_2_score` int(11) NOT NULL,
  `asvs_level_3_benchmark` int(11) NOT NULL,
  `asvs_level_3_score` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `benchmark_type_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_benchmark_product_s_product_id_benchmark_typ_244f675b_uniq` (`product_id`,`benchmark_type_id`),
  KEY `dojo_benchmark_produ_benchmark_type_id_2a8c91b5_fk_dojo_benc` (`benchmark_type_id`),
  CONSTRAINT `dojo_benchmark_produ_benchmark_type_id_2a8c91b5_fk_dojo_benc` FOREIGN KEY (`benchmark_type_id`) REFERENCES `dojo_benchmark_type` (`id`),
  CONSTRAINT `dojo_benchmark_produ_product_id_be9e5f8a_fk_dojo_prod` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_product_summary`
--

LOCK TABLES `dojo_benchmark_product_summary` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_product_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_benchmark_product_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_requirement`
--

DROP TABLE IF EXISTS `dojo_benchmark_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objective_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objective` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `references` longtext COLLATE utf8mb4_unicode_ci,
  `level_1` tinyint(1) NOT NULL,
  `level_2` tinyint(1) NOT NULL,
  `level_3` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_benchmark_requi_category_id_fecf2b24_fk_dojo_benc` (`category_id`),
  CONSTRAINT `dojo_benchmark_requi_category_id_fecf2b24_fk_dojo_benc` FOREIGN KEY (`category_id`) REFERENCES `dojo_benchmark_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_requirement`
--

LOCK TABLES `dojo_benchmark_requirement` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_requirement` DISABLE KEYS */;
INSERT INTO `dojo_benchmark_requirement` VALUES (1,'7.2','Verify that all cryptographic modules fail securely, and errors are handled in a way that does not enable Padding Oracle.','',1,1,1,1,'2018-04-03 20:15:18.704000','2018-04-03 20:15:18.704000',1),(2,'7.6','Verify that all random numbers, random file names, random GUIDs, and random strings are generated using the cryptographic modules approved random number generator when these random values are intended to be not guessable by an attacker.\",','',1,1,1,1,'2018-04-04 16:18:25.062000','2018-04-04 16:18:25.062000',1),(3,'7.7','Verify that cryptographic algorithms used by the application have been validated against FIPS 140-2 or an equivalent standard.','',1,0,0,1,'2018-04-04 20:33:28.144000','2018-04-04 20:33:28.144000',1),(4,'2.1','Verify all pages and resources are protected by server-side authentication, except those specifically intended to be public.','',1,1,1,1,'2018-04-09 20:45:11.236000','2018-04-09 20:45:11.236000',2),(5,'1.1','All app components are identified and known to be needed.','',1,1,1,1,'2018-04-10 17:28:55.814000','2018-04-10 17:28:55.814000',3),(6,'1.2','Security controls are never enforced only on the client side, but on the respective remote endpoints.','',0,1,1,1,'2018-04-10 17:30:00.194000','2018-04-10 17:30:00.194000',3),(7,'1.3','A high-level architecture for the application and all connected remote services has been defined and security has been addressed in that architecture.','',0,1,1,1,'2018-04-10 17:30:17.885000','2018-04-10 17:30:17.885000',3),(8,'1.4','Data considered sensitive in the context of the application is clearly identified.','',0,0,1,1,'2018-04-10 17:30:49.731000','2018-04-10 17:30:49.731000',3),(9,'1.5','All app components are defined in terms of the business functions and/or security functions they provide.','',0,0,1,1,'2018-04-10 17:31:32.897000','2018-04-10 17:31:32.897000',3),(11,'1.6','A threat model for the application and the associated remote services has been produced that identifies potential threats and countermeasures.','',0,0,1,1,'2018-04-10 17:32:20.155000','2018-04-10 17:32:20.155000',3),(12,'1.7','All security controls have a centralized implementation.','',0,1,1,1,'2018-04-10 17:32:36.102000','2018-04-10 17:32:36.102000',3),(13,'1.8','Components are segregated from each other via a defined security control, such as network segmentation, firewall rules, or cloud based security group','',0,1,1,1,'2018-04-10 17:33:12.108000','2018-04-10 17:33:12.108000',3),(14,'1.9','A mechanism for enforcing updates of the application exists.','',0,1,1,1,'2018-04-10 17:33:27.254000','2018-04-10 17:33:27.254000',3),(15,'1.10','Security is addressed within all parts of the software development lifecycle.','',0,1,1,1,'2018-04-10 17:34:04.115000','2018-04-10 17:34:04.115000',3),(16,'1.11','All application components, libraries, modules, frameworks, platform, and operating systems are free from known vulnerabilities','',0,1,1,1,'2018-04-10 17:34:34.079000','2018-04-10 17:34:34.079000',3),(17,'1.12','There is an explicit policy for how cryptographic keys (if any) are managed, and the lifecycle of cryptographic keys is enforced. Ideally, follow a key management standard such as NIST SP 800-57.','',0,1,1,1,'2018-04-10 17:35:02.776000','2018-04-10 17:35:02.776000',3),(18,'2.2','Verify that the application does not automatically fill in credentials either as hidden fields, URL arguments, Ajax requests, or in forms, as this implies plain text, reversible or de-cryptable password storage. Random time limited nonces are acceptable as stand ins, such as to protect change password forms or forgot password forms.','',1,1,1,1,'2018-04-10 18:25:49.774000','2018-04-10 18:25:49.774000',2),(19,'2.6','Verify all authentication controls fail securely to ensure attackers cannot log in.','',1,1,1,1,'2018-04-10 18:26:06.655000','2018-04-10 18:26:06.655000',2),(20,'2.7','Verify password entry fields allow, or encourage, the use of passphrases, and do not prevent long passphrases or highly complex passwords being entered.','',1,1,1,1,'2018-04-10 18:26:27.024000','2018-04-10 18:26:27.024000',2),(21,'2.8','Verify all identity functions (e.g. forgot password, change password, change email, manage 2FA token, etc.) have the security controls, as the primary authentication mechanism (e.g. login form).','',1,1,1,1,'2018-04-10 18:26:54.741000','2018-04-10 18:26:54.741000',2),(22,'2.9','Verify that the changing password functionality includes the old password, the new password, and a password confirmation.','',1,1,1,1,'2018-04-10 18:27:12.001000','2018-04-10 18:27:12.001000',2),(23,'2.12','Verify that all authentication decisions can be logged, without storing sensitive session identifiers or passwords. This should include requests with relevant metadata needed for security investigations.','',0,1,1,1,'2018-04-10 18:27:39.646000','2018-04-10 18:27:39.646000',2),(24,'2.13','Verify that account passwords are one way hashed with a salt, and there is sufficient work factor to defeat brute force and password hash recovery attacks.','',0,1,1,1,'2018-04-10 18:27:58.290000','2018-04-10 18:27:58.290000',2),(25,'2.16','Verify that all application data is transmitted over an encrypted channel (e.g. TLS).','',1,1,1,1,'2018-04-10 18:28:25.068000','2018-04-10 18:28:25.068000',2),(26,'2.17','Verify that the forgotten password function and other recovery paths do not reveal the current password and that the new password is not sent in clear text to the user. A one time password reset link should be used instead.','',1,1,1,1,'2018-04-10 18:28:43.876000','2018-04-10 18:28:43.876000',2),(27,'2.18','Verify that information enumeration is not possible via login, password reset, or forgot account functionality.','',0,1,1,1,'2018-04-10 18:29:00.197000','2018-04-10 18:29:00.197000',2),(28,'2.19','Verify there are no default passwords in use for the application framework or any components used by the application (such as admin/password).','',1,1,1,1,'2018-04-10 18:29:18.605000','2018-04-10 18:29:18.605000',2),(29,'2.20','Verify that anti-automation is in place to prevent breached credential testing, brute forcing, and account lockout attacks.','',0,1,1,1,'2018-04-10 18:29:38.078000','2018-04-10 18:29:38.078000',2),(30,'2.21','Verify that all authentication credentials for accessing services external to the application are encrypted and stored in a protected location.','',0,1,1,1,'2018-04-10 18:32:22.961000','2018-04-10 18:32:22.961000',2),(31,'2.22','Verify that forgotten password and other recovery paths use a TOTP or other soft token, mobile push, or other offline recovery mechanism. The use of SMS has been deprecated by NIST and should not be used.','',0,1,1,1,'2018-04-10 18:32:40.617000','2018-04-10 18:32:40.617000',2),(32,'2.23','Verify that account lockout is divided into soft and hard lock status, and these are not mutually exclusive. If an account is temporarily soft locked out due to a brute force attack, this should not reset the hard lock status.','',0,1,1,1,'2018-04-10 18:32:58.589000','2018-04-10 18:32:58.589000',2),(33,'2.24','Verify that if secret questions are required, the questions do not violate privacy laws and are sufficiently strong to protect accounts from malicious recovery.','',1,1,1,1,'2018-04-10 18:33:18.505000','2018-04-10 18:33:18.505000',2),(34,'2.25','Verify that high value applications can be configured to disallow the use of a configurable number of previous passwords.','',0,1,1,1,'2018-04-10 18:33:39.421000','2018-04-10 18:33:39.421000',2),(35,'2.26','Verify that sensitive operations (e.g. change password, change email address, add new biller, etc.) require re-authentication (e.g. password or 2FA token). This is in addition to CSRF measures, not instead.','',0,1,1,1,'2018-04-10 18:33:54.755000','2018-04-10 18:33:54.755000',2),(36,'2.27','Verify that measures are in place to block the use of commonly chosen passwords and weak pass-phrases.','',0,1,1,1,'2018-04-10 18:34:13.132000','2018-04-10 18:34:13.132000',2),(37,'2.28','Verify that all authentication challenges, whether successful or failed, should respond in the same average response time.','',0,0,1,1,'2018-04-10 18:34:34.548000','2018-04-10 18:34:34.548000',2),(38,'2.29','Verify that secrets, API keys, and passwords are not included in the source code, or online source code repositories.','',0,1,1,1,'2018-04-10 18:34:51.315000','2018-04-10 18:34:51.315000',2),(39,'2.31','Verify that users can enrol and use TOTP verification, two-factor, biometric (Touch ID or similar), or equivalent multi-factor authentication mechanism that provides protection against single factor credential disclosure.','',0,1,1,1,'2018-04-10 18:35:10.531000','2018-04-10 18:35:10.531000',2),(40,'2.32','Verify that access to administrative interfaces are strictly controlled and not accessible to untrusted parties.','',1,1,1,1,'2018-04-10 18:35:27.514000','2018-04-10 18:35:27.514000',2),(41,'3.1','Verify that the application is compatible with browser based and third party password managers, unless prohibited by risk based policy.','',1,1,1,1,'2018-04-10 18:35:45.088000','2018-04-10 18:35:45.088000',2),(42,'3.2','Verify that sessions are invalidated when the user logs out.','',1,1,1,1,'2018-04-10 18:41:15.085000','2018-04-10 18:41:15.085000',4),(43,'3.3','Verify that sessions timeout after a specified period of inactivity.','',0,0,1,1,'2018-04-10 18:41:32.640000','2018-04-10 18:41:32.640000',4),(44,'3.4','Verify that sessions timeout after an administratively-configurable maximum time period regardless of activity (an absolute timeout).','',0,1,1,1,'2018-04-10 18:41:55.478000','2018-04-10 18:41:55.478000',4),(45,'3.5','Verify that all pages that require authentication have easy and visible access to logout functionality.','',1,1,1,1,'2018-04-10 18:42:16.654000','2018-04-10 18:42:16.654000',4),(46,'3.6','Test that the session ID is never disclosed in URLs, error messages, or logs. This includes verifying that the application does not support URL rewriting of session cookies.','',0,0,1,1,'2018-04-10 18:42:36.712000','2018-04-10 18:42:36.712000',4),(47,'3.7','Verify that all successful authentication and re-authentication generates a new session and session id.','',1,1,1,1,'2018-04-10 18:42:57.702000','2018-04-10 18:42:57.702000',4),(48,'3.10','Verify that only session ids generated by the application framework are recognised as active by the application.','',0,1,1,1,'2018-04-10 18:43:19.341000','2018-04-10 18:43:19.341000',4),(49,'3.11','Test session IDs against criteria such as their randomness, uniqueness, resistance to statistical and cryptographic analysis and information leakage.','',1,1,1,1,'2018-04-10 18:43:34.658000','2018-04-10 18:43:34.658000',4),(50,'3.12','Verify that session IDs stored in cookies are scoped using the \'path\' attribute; and have the \'HttpOnly\' and \'Secure\' cookie flags enabled.','',1,1,1,1,'2018-04-10 18:43:54.012000','2018-04-10 18:43:54.012000',4),(51,'3.17','Verify that the application tracks all active sessions. And allows users to terminate sessions selectively or globally from their account.','',0,1,1,1,'2018-04-10 18:44:17.203000','2018-04-10 18:44:17.203000',4),(52,'3.18','Verify for high value applications that the user is prompted with the option to terminate all other active sessions after a successful change password process.','',0,0,1,1,'2018-04-10 18:44:43.442000','2018-04-10 18:44:43.442000',4),(53,'4.1','Verify that the principle of least privilege exists - users should only be able to access functions, data files, URLs, controllers, services, and other resources, for which they possess specific authorization. This implies protection against spoofing and elevation of privilege.','',1,1,1,1,'2018-04-10 18:47:21.960000','2018-04-10 18:47:21.960000',5),(54,'4.4','Verify that access to sensitive records is protected, such that only authorized objects or data is accessible to each user (for example, protect against users tampering with a parameter to see or alter another user\'s account).','',1,1,1,1,'2018-04-10 18:47:38.680000','2018-04-10 18:47:38.680000',5),(55,'4.5','Verify that directory browsing is disabled unless deliberately desired. Additionally, applications should not allow discovery or disclosure of file or directory metadata, such as Thumbs.db, .DS_Store, .git or .svn folders.','',1,1,1,1,'2018-04-10 18:47:55.745000','2018-04-10 18:47:55.745000',5),(56,'4.8','Verify that access controls fail securely.','',1,1,1,1,'2018-04-10 18:48:13.764000','2018-04-10 18:48:13.764000',5),(57,'4.9','Verify that the same access control rules implied by the presentation layer are enforced on the server side.','',1,1,1,1,'2018-04-10 18:48:35.093000','2018-04-10 18:48:35.093000',5),(58,'4.10','Verify that all user and data attributes and policy information used by access controls cannot be manipulated by end users unless specifically authorized.','',0,1,1,1,'2018-04-10 18:48:59.652000','2018-04-10 18:48:59.652000',5),(59,'4.11','Verify that there is a centralized mechanism (including libraries that call external authorization services) for protecting access to each type of protected resource.','',0,0,1,1,'2018-04-10 18:49:17.626000','2018-04-10 18:49:17.626000',5),(60,'4.12','Verify that all access control decisions can be logged and all failed decisions are logged.','',0,1,1,1,'2018-04-10 18:49:32.763000','2018-04-10 18:49:32.763000',5),(61,'4.13','Verify that the application or framework uses strong random anti-CSRF tokens or has another transaction protection mechanism.','',1,1,1,1,'2018-04-10 18:50:06.400000','2018-04-10 18:50:06.400000',5),(62,'4.4','Verify the system can protect against aggregate or continuous access of secured functions, resources, or data. For example, consider the use of a resource governor to limit the number of edits per hour or to prevent the entire database from being scraped by an individual user.','',0,1,1,1,'2018-04-10 18:50:21.788000','2018-04-10 18:50:21.788000',5),(63,'4.15','Verify the application has additional authorization (such as step up or adaptive authentication) for lower value systems, and / or segregation of duties for high value applications to enforce anti-fraud controls as per the risk of application and past fraud.','',0,1,1,1,'2018-04-10 18:50:45.601000','2018-04-10 18:50:45.601000',5),(64,'4.16','Verify that the application correctly enforces context-sensitive authorisation so as to not allow unauthorised manipulation by means of parameter tampering.','',1,1,1,1,'2018-04-10 18:51:03.440000','2018-04-10 18:51:03.440000',5),(65,'5.3','Verify that server side input validation failures result in request rejection and are logged.','',1,1,1,1,'2018-04-10 18:57:40.844000','2018-04-10 18:57:40.844000',6),(66,'5.5','Verify that input validation routines are enforced on the server side.','',1,1,1,1,'2018-04-10 18:58:04.519000','2018-04-10 18:58:04.519000',6),(67,'5.6','Verify that a centralized input validation control mechanism is used by the application.','',1,1,1,1,'2018-04-10 18:58:25.176000','2018-04-10 18:58:25.176000',6),(68,'5.10','Verify that all database queries are protected by the use of parameterized queries or proper ORM usage to avoid SQL injection.','',1,1,1,1,'2018-04-10 18:58:40.885000','2018-04-10 18:58:40.885000',6),(69,'5.11','Verify that the application is not susceptible to LDAP Injection, or that security controls prevent LDAP Injection.','',1,1,1,1,'2018-04-10 18:58:57.395000','2018-04-10 18:58:57.395000',6),(70,'5.12','Verify that the application is not susceptible to OS Command Injection, or that security controls prevent OS Command Injection.','',1,1,1,1,'2018-04-10 18:59:13.557000','2018-04-10 18:59:13.557000',6),(71,'5.13','Verify that the application is not susceptible to Remote File Inclusion (RFI) or Local File Inclusion (LFI) when content is used that is a path to a file.','',1,1,1,1,'2018-04-10 18:59:30.868000','2018-04-10 18:59:30.868000',6),(72,'5.14','Verify that the application is not susceptible XPath injection or XML injection attacks.','',1,1,1,1,'2018-04-10 18:59:46.106000','2018-04-10 18:59:46.106000',6),(73,'5.15','Verify that all string variables placed into HTML or other web client code are either properly contextually encoded manually, or utilize templates that automatically contextually encode to ensure the application is not susceptible to reflected, stored or DOM Cross-Site Scripting (XSS) attacks.','',1,1,1,1,'2018-04-10 19:00:01.972000','2018-04-10 19:00:01.972000',6),(74,'5.16','Verify that the application does not contain mass parameter assignment (AKA automatic variable binding) vulnerabilities.','',0,1,1,1,'2018-04-10 19:00:21.221000','2018-04-10 19:00:21.221000',6),(75,'5.17','Verify that the application has defenses against HTTP parameter pollution attacks, particularly if the application framework makes no distinction about the source of request parameters (GET, POST, cookies, headers, environment, etc.)','',0,1,1,1,'2018-04-10 19:00:40.335000','2018-04-10 19:00:40.335000',6),(76,'5.19','Verify that all input data is validated, not only HTML form fields but all sources of input such as REST calls, query parameters, HTTP headers, cookies, batch files, RSS feeds, etc; using positive validation (whitelisting), then lesser forms of validation such as grey listing (eliminating known bad strings), or rejecting bad inputs (blacklisting).','',0,1,1,1,'2018-04-10 19:00:58.444000','2018-04-10 19:00:58.444000',6),(77,'5.20','Verify that structured data is strongly typed and validated against a defined schema including allowed characters, length and pattern (e.g. credit card numbers or telephone, or validating that two related fields are reasonable, such as validating suburbs and zip or post codes match).','',0,1,1,1,'2018-04-10 19:03:55.078000','2018-04-10 19:03:55.078000',6),(78,'5.21','Verify that unstructured data is sanitized to enforce generic safety measures such as allowed characters and length, and characters potentially harmful in given context should be escaped (e.g. natural names with Unicode or apostrophes, such as O\'Hara)','',0,1,1,1,'2018-04-10 19:04:35.073000','2018-04-10 19:04:35.073000',6),(79,'5.22','Verify that all untrusted HTML input from WYSIWYG editors or similar is properly sanitized with an HTML sanitizer library or framework feature.','',1,1,1,1,'2018-04-10 19:05:00.216000','2018-04-10 19:05:00.216000',6),(80,'5.24','Verify that where data is transferred from one DOM context to another, the transfer uses safe JavaScript methods, such as using innerText or .val to ensure the application is not susceptible to DOM Cross-Site Scripting (XSS) attacks.','',0,1,1,1,'2018-04-10 19:05:18.980000','2018-04-10 19:05:18.980000',6),(81,'5.25','Verify when parsing JSON in browsers or JavaScript based backends, that JSON.parse is used to parse the JSON document. Do not use eval() to parse JSON.','',0,1,1,1,'2018-04-10 19:05:35.060000','2018-04-10 19:05:35.060000',6),(82,'5.27','Verify the application for Server Side Request Forgery vulnerabilities.','',1,1,1,1,'2018-04-10 19:06:00.580000','2018-04-10 19:06:00.580000',6),(83,'5.28','Verify that the application correctly restricts XML parsers to only use the most restrictive configuration possible and to ensure that dangerous features such as resolving external entities are disabled.','',1,1,1,1,'2018-04-10 19:06:21.358000','2018-04-10 19:06:21.358000',6),(84,'5.29','Verify that deserialization of untrusted data is avoided or is extensively protected when deserialization cannot be avoided.','',1,1,1,1,'2018-04-10 19:06:39.454000','2018-04-10 19:06:39.454000',6),(85,'7.8','Verify that cryptographic modules operate in their approved mode according to their published security policies.','',0,0,1,1,'2018-04-10 19:08:31.176000','2018-04-10 19:08:31.176000',1),(86,'7.9','Verify that there is an explicit policy for how cryptographic keys are managed (e.g., generated, distributed, revoked, and expired). Verify that this key lifecycle is properly enforced.','',0,1,1,1,'2018-04-10 19:09:24.942000','2018-04-10 19:09:24.942000',1),(87,'7.11','Verify that all consumers of cryptographic services do not have direct access to key material. Isolate cryptographic processes, including master secrets and consider the use of a virtualized or physical hardware key vault (HSM).','',0,0,1,1,'2018-04-10 19:09:46.054000','2018-04-10 19:09:46.054000',1),(88,'7.12','Verify that Personally Identifiable Information (PII) and other sensitive data is stored encrypted while at rest.','',0,1,1,1,'2018-04-10 19:10:03.771000','2018-04-10 19:10:03.771000',1),(89,'7.13','Verify that sensitive passwords or key material maintained in memory is overwritten with zeros as soon as it is no longer required, to mitigate memory dumping attacks.','',0,1,1,1,'2018-04-10 19:10:34.846000','2018-04-10 19:10:34.846000',1),(90,'7.14','Verify that all keys and passwords are replaceable, and are generated or replaced at installation time.','',0,1,1,1,'2018-04-10 19:11:48.314000','2018-04-10 19:11:48.314000',1),(91,'7.15','Verify that random numbers are created with proper entropy even when the application is under heavy load, or that the application degrades gracefully in such circumstances.','',0,0,1,1,'2018-04-10 19:12:08.197000','2018-04-10 19:12:08.197000',1),(92,'8.1','Verify that the application does not output error messages or stack traces containing sensitive data that could assist an attacker, including session id, software/framework versions and personal information.','',1,1,1,1,'2018-04-10 19:14:27.314000','2018-04-10 19:14:27.314000',7),(93,'8.2','Verify that error handling logic in security controls denies access by default.','',0,1,1,1,'2018-04-10 19:14:48.444000','2018-04-10 19:14:48.444000',7),(94,'8.3','Verify security logging controls provide the ability to log success and particularly failure events that are identified as security-relevant.','',0,1,1,1,'2018-04-10 19:22:17.918000','2018-04-10 19:22:17.918000',7),(95,'8.4','Verify that each log event includes necessary information that would allow for a detailed investigation of the timeline when an event happens.','',0,1,1,1,'2018-04-10 19:22:36.882000','2018-04-10 19:22:36.882000',7),(96,'8.5','Verify that all events that include untrusted data will not execute as code in the intended log viewing software.','',0,1,1,1,'2018-04-10 19:22:52.630000','2018-04-10 19:22:52.630000',7),(97,'8.6','Verify that security logs are protected from unauthorized access and modification.','',0,1,1,1,'2018-04-10 19:23:13.084000','2018-04-10 19:23:13.084000',7),(98,'8.7','Verify that the application does not log sensitive data as defined under local privacy laws or regulations, organizational sensitive data as defined by a risk assessment, or sensitive authentication data that could assist an attacker, including user\'s session identifiers, passwords, hashes, or API tokens.','',0,1,1,1,'2018-04-10 19:23:39.729000','2018-04-10 19:23:39.729000',7),(99,'8.8','Verify that all non-printable symbols and field separators are properly encoded in log entries, to prevent log injection.','',0,0,1,1,'2018-04-10 19:23:54.556000','2018-04-10 19:23:54.556000',7),(100,'8.9','Verify that log fields from trusted and untrusted sources are distinguishable in log entries.','',0,0,1,1,'2018-04-10 19:24:17.081000','2018-04-10 19:24:17.081000',7),(101,'8.10','Verify that an audit log or similar allows for non-repudiation of key transactions.','',1,1,1,1,'2018-04-10 19:24:36.013000','2018-04-10 19:24:36.013000',7),(102,'8.11','Verify that security logs have some form of integrity checking or controls to prevent unauthorized modification.','',0,0,1,1,'2018-04-10 19:24:52.621000','2018-04-10 19:24:52.621000',7),(103,'8.12','Verify that security logs have some form of integrity checking or controls to prevent unauthorized modification.','',0,0,1,1,'2018-04-10 19:25:36.714000','2018-04-10 19:25:36.714000',7),(104,'8.13','Verify that time sources are synchronized to the correct time and time zone.','',1,1,1,1,'2018-04-10 19:25:56.051000','2018-04-10 19:25:56.051000',7),(105,'9.1','Verify that all forms containing sensitive information have disabled client side caching, including autocomplete features.','',1,1,1,1,'2018-04-10 20:03:10.119000','2018-04-10 20:03:10.119000',8),(106,'9.2','Verify that the list of sensitive data processed by the application is identified, and that there is an explicit policy for how access to this data must be controlled, encrypted and enforced under relevant data protection directives.','',0,0,1,1,'2018-04-10 20:03:30.746000','2018-04-10 20:03:30.746000',8),(107,'9.3','Verify that all sensitive data is sent to the server in the HTTP message body or headers (i.e., URL parameters are never used to send sensitive data).','',1,1,1,1,'2018-04-10 20:03:47.350000','2018-04-10 20:03:47.350000',8),(108,'9.4','Verify that the application sets sufficient anti-caching headers such that any sensitive and personal information displayed by the application or entered by the user should not be cached on disk by mainstream modern browsers (e.g. visit about:cache to review disk cache).','',1,1,1,1,'2018-04-10 20:04:04.636000','2018-04-10 20:04:04.636000',8),(109,'9.5','Verify that on the server, all cached or temporary copies of sensitive data stored are protected from unauthorized access or purged/invalidated after the authorized user accesses the sensitive data.','',0,1,1,1,'2018-04-10 20:04:20.860000','2018-04-10 20:04:20.860000',8),(110,'9.6','Verify that there is a method to remove each type of sensitive data from the application at the end of the required retention policy.','',0,0,1,1,'2018-04-10 20:04:35.940000','2018-04-10 20:04:35.940000',8),(111,'9.7','Verify the application minimizes the number of parameters in a request, such as hidden fields, Ajax variables, cookies and header values.','',0,1,1,1,'2018-04-10 20:04:55.217000','2018-04-10 20:04:55.217000',8),(112,'9.8','Verify the application has the ability to detect and alert on abnormal numbers of requests for data harvesting for an example screen scraping.','',0,0,1,1,'2018-04-10 20:05:10.438000','2018-04-10 20:05:10.438000',8),(113,'9.9','Verify that data stored in client side storage (such as HTML5 local storage, session storage, IndexedDB, regular cookies or Flash cookies) does not contain sensitive data or PII.','',1,1,1,1,'2018-04-10 20:05:27.568000','2018-04-10 20:05:27.568000',8),(114,'9.10','Verify accessing sensitive data is logged, if the data is collected under relevant data protection directives or where logging of accesses is required.','',0,1,1,1,'2018-04-10 20:05:52.280000','2018-04-10 20:05:52.280000',8),(115,'9.11','Verify that sensitive information maintained in memory is overwritten with zeros as soon as it is no longer required, to mitigate memory dumping attacks.','',0,1,1,1,'2018-04-10 20:06:09.895000','2018-04-10 20:06:09.895000',8),(116,'9.14','Verify that authenticated data is cleared from client storage, such as the browser DOM, after the client or session is terminated.','',0,1,1,1,'2018-04-10 20:06:26.799000','2018-04-10 20:06:26.799000',8),(117,'10.1','Verify that a path can be built from a trusted CA to each Transport Layer Security (TLS) server certificate, and that each server certificate is valid.','',1,1,1,1,'2018-04-11 01:35:42.155000','2018-04-11 01:35:42.155000',9),(118,'10.2','Verify that TLS is used for all connections (including both external and backend connections) that are authenticated or that involve sensitive data or functions, and does not fall back to insecure or unencrypted protocols. Ensure the strongest alternative is the preferred algorithm.','',1,1,1,1,'2018-04-11 01:35:59.132000','2018-04-11 01:35:59.132000',9),(119,'10.3','Verify that backend TLS connection failures are logged.','',0,0,1,1,'2018-04-11 01:36:33.439000','2018-04-11 01:36:33.439000',9),(120,'10.4','Verify that certificate paths are built and verified for all client certificates using configured trust anchors and revocation information.','',0,0,1,1,'2018-04-11 01:36:51.266000','2018-04-11 01:36:51.266000',9),(121,'10.5','Verify that all connections to external systems that involve sensitive information or functions are authenticated.','',0,1,1,1,'2018-04-11 01:37:07.994000','2018-04-11 01:37:07.994000',9),(122,'10.6','Verify that there is a single standard TLS implementation that is used by the application that is configured to operate in an approved mode of operation.','',0,0,1,1,'2018-04-11 01:37:24.291000','2018-04-11 01:37:24.291000',9),(123,'10.7','Verify that TLS certificate public key pinning (HPKP) is implemented with production and backup public keys. For more information, please see the references below.','',0,1,1,1,'2018-04-11 01:37:47.739000','2018-04-11 01:37:47.739000',9),(124,'10.8','Verify that HTTP Strict Transport Security headers are included on all requests and for all subdomains, such as Strict-Transport-Security: max-age=15724800; includeSubdomains','',1,1,1,1,'2018-04-11 01:38:13.649000','2018-04-11 01:38:13.649000',9),(125,'10.9','Verify that production website URL has been submitted to preloaded list of Strict Transport Security domains maintained by web browser vendors. Please see the references below.','',0,0,1,1,'2018-04-11 01:38:36.954000','2018-04-11 01:38:36.954000',9),(126,'10.11','Verify that perfect forward secrecy is configured to mitigate passive attackers recording traffic.','',1,1,1,1,'2018-04-11 01:39:02.098000','2018-04-11 01:39:02.098000',9),(127,'10.11','Verify that proper certification revocation, such as Online Certificate Status Protocol (OCSP) Stapling, is enabled and configured.','',1,1,1,1,'2018-04-11 01:39:21.912000','2018-04-11 01:39:21.912000',9),(128,'10.13','Verify that only strong algorithms, ciphers, and protocols are used, through all the certificate hierarchy, including root and intermediary certificates of your selected certifying authority.','',1,1,1,1,'2018-04-11 01:39:36.467000','2018-04-11 01:39:36.467000',9),(129,'10.14','Verify that the TLS settings are in line with current leading practice, particularly as common configurations, ciphers, and algorithms become insecure.','',1,1,1,1,'2018-04-11 01:39:56.601000','2018-04-11 01:39:56.601000',9),(130,'13.1','Verify all malicious activity is adequately sandboxed, containerized or isolated to delay and deter attackers from attacking other applications.','',1,1,1,1,'2018-04-11 01:49:41.661000','2018-04-11 01:49:41.661000',10),(131,'13.2','Verify that the application source code, and as many third party libraries as possible, does not contain back doors, Easter eggs, and logic flaws in authentication, access control, input validation, and the business logic of high value transactions.','',1,1,1,1,'2018-04-11 01:49:58.364000','2018-04-11 01:49:58.364000',10),(132,'15.1','Verify the application will only process business logic flows in sequential step order, with all steps being processed in realistic human time, and not process out of order, skipped steps, process steps from another user, or too quickly submitted transactions.','',0,1,1,1,'2018-04-11 01:52:09.853000','2018-04-11 01:52:09.853000',11),(133,'15.2','Verify the application has business limits and correctly enforces on a per user basis, with configurable alerting and automated reactions to automated or unusual attack.','',0,1,1,1,'2018-04-11 01:52:27.128000','2018-04-11 01:52:27.128000',11),(134,'16.1','Verify that URL redirects and forwards only allow whitelisted destinations, or show a warning when redirecting to potentially untrusted content.','',1,1,1,1,'2018-04-11 02:04:17.964000','2018-04-11 02:04:17.964000',12),(135,'16.2','Verify that untrusted file data submitted to the application is not used directly with file I/O commands, particularly to protect against path traversal, local file include, file mime type, reflective file download, and OS command injection vulnerabilities.','',1,1,1,1,'2018-04-11 02:04:34.163000','2018-04-11 02:04:34.163000',12),(136,'16.3','Verify that files obtained from untrusted sources are validated to be of expected type and scanned by antivirus scanners to prevent upload of known malicious content.','',1,1,1,1,'2018-04-11 02:04:59.568000','2018-04-11 02:04:59.568000',12),(137,'16.4','Verify that untrusted data is not used within inclusion, class loader, or reflection capabilities to prevent remote/local code execution vulnerabilities.','',1,1,1,1,'2018-04-11 02:07:18.554000','2018-04-11 02:07:18.554000',12),(138,'16.5','Verify that untrusted data is not used within cross-domain resource sharing (CORS) to protect against arbitrary remote content.','',1,1,1,1,'2018-04-11 02:07:38.656000','2018-04-11 02:07:38.656000',12),(139,'16.6','Verify that files obtained from untrusted sources are stored outside the webroot, with limited permissions, preferably with strong validation.','',0,1,1,1,'2018-04-11 02:07:55.938000','2018-04-11 02:07:55.938000',12),(140,'16.7','Verify that the web or application server is configured by default to deny access to remote resources or systems outside the web or application server.','',0,1,1,1,'2018-04-11 02:08:14.968000','2018-04-11 02:08:14.968000',12),(141,'16.8','Verify the application code does not execute uploaded data obtained from untrusted sources.','',1,1,1,1,'2018-04-11 02:08:32.429000','2018-04-11 02:08:32.429000',12),(142,'16.9','Verify that unsupported, insecure or deprecated client-side technologies are not used, such as NSAPI plugins, Flash, Shockwave, Active-X, Silverlight, NACL, or client-side Java applets.','',1,1,1,1,'2018-04-11 02:08:48.347000','2018-04-11 02:08:48.347000',12),(143,'16.10','Verify that the cross-domain resource sharing (CORS) Access-Control-Allow-Origin header does not simply reflect the request\'s origin header or support the \"null\" origin.','',1,1,1,1,'2018-04-11 02:09:04.768000','2018-04-11 02:09:04.768000',12),(144,'20.1','Verify that application layer debugging interfaces such USB or serial are disabled.','',1,1,1,1,'2018-04-11 11:07:50.720000','2018-04-11 11:07:50.720000',15),(145,'20.2','Verify that cryptographic keys are unique to each individual device.','',1,1,1,1,'2018-04-11 11:08:10.405000','2018-04-11 11:08:10.405000',15),(146,'20.3','Verify that memory protection controls such as ASLR and DEP are enabled by the embedded/IoT operating system, if applicable.','',1,1,1,1,'2018-04-11 11:08:25.227000','2018-04-11 11:08:25.227000',15),(147,'20.4','Verify that on-chip debugging interfaces such as JTAG or SWD are disabled or that available protection mechanism is enabled and configured appropriately.','',1,1,1,1,'2018-04-11 11:08:45.697000','2018-04-11 11:08:45.697000',15),(148,'20.5','Verify that physical debug headers are not present on the device.','',1,1,1,1,'2018-04-11 11:09:32.824000','2018-04-11 11:09:32.824000',15),(149,'20.6','Verify that sensitive data is not stored unencrypted on the device.','',1,1,1,1,'2018-04-11 11:09:51.965000','2018-04-11 11:09:51.965000',15),(150,'20.7','Verify that the device prevents leaking of sensitive information.','',1,1,1,1,'2018-04-11 11:10:12.639000','2018-04-11 11:10:12.639000',15),(151,'20.8','Verify that the firmware apps protect data-in-transit using transport security.','',1,1,1,1,'2018-04-11 11:10:46.813000','2018-04-11 11:10:46.813000',15),(152,'20.9','Verify that the firmware apps validate the digital signature of server connections.','',1,1,1,1,'2018-04-11 11:11:09.379000','2018-04-11 11:11:09.379000',15),(153,'20.10','Verify that wireless communications are mutually authenticated.','',1,1,1,1,'2018-04-11 11:11:30.500000','2018-04-11 11:11:30.500000',15),(154,'20.11','Verify that wireless communications are sent over an encrypted channel.','',1,1,1,1,'2018-04-11 11:11:50.655000','2018-04-11 11:11:50.655000',15),(155,'20.12','Verify that the firmware apps pin the digital signature to a trusted server(s).','',0,1,1,1,'2018-04-11 11:12:07.233000','2018-04-11 11:12:07.233000',15),(156,'20.13','Verify the presence of physical tamper resistance and/or tamper detection features, including epoxy.','',0,1,1,1,'2018-04-11 11:12:26.824000','2018-04-11 11:12:26.824000',15),(157,'20.14','Verify that identifying markings on chips have been removed.','',0,1,1,1,'2018-04-11 11:12:58.929000','2018-04-11 11:12:58.929000',15),(158,'20.15','Verify that any available Intellectual Property protection technologies provided by the chip manufacturer are enabled.','',0,1,1,1,'2018-04-11 11:13:14.702000','2018-04-11 11:13:14.702000',15),(159,'20.16','Verify security controls are in place to hinder firmware reverse engineering (e.g., removal of verbose debugging strings).','',0,1,1,1,'2018-04-11 11:13:35.583000','2018-04-11 11:13:35.583000',15),(160,'20.17','Verify the device validates the boot image signature before loading.','',0,1,1,1,'2018-04-11 11:13:53.410000','2018-04-11 11:13:53.410000',15),(161,'20.18','Verify that the firmware update process is not vulnerable to time-of-check vs time-of-use attacks.','',0,1,1,1,'2018-04-11 11:14:09.524000','2018-04-11 11:14:09.524000',15),(162,'20.19','Verify the device uses code signing and validates firmware upgrade files before installing.','',0,1,1,1,'2018-04-11 11:14:25.357000','2018-04-11 11:14:25.357000',15),(163,'20.20','Verify that the device cannot be downgraded to old versions of valid firmware.','',0,1,1,1,'2018-04-11 11:14:43.403000','2018-04-11 11:14:43.403000',15),(164,'20.21','Verify usage of cryptographically secure pseudo-random number generator on embedded device (e.g., using chip-provided random number generators).','',0,1,1,1,'2018-04-11 11:14:59.985000','2018-04-11 11:14:59.985000',15),(165,'20.22','Verify that the device wipes firmware and sensitive data upon detection of tampering or receipt of invalid message.','',0,0,1,1,'2018-04-11 11:15:22.134000','2018-04-11 11:15:22.134000',15),(166,'20.23','Verify that only microcontrollers that support disabling debugging interfaces (e.g. JTAG, SWD) are used.','',0,0,1,1,'2018-04-11 11:15:33.559000','2018-04-11 11:15:33.559000',15),(167,'20.24','Verify that only microcontrollers that provide substantial protection from de-capping and side channel attacks are used.','',0,0,1,1,'2018-04-11 11:15:47.863000','2018-04-11 11:15:47.863000',15),(168,'20.25','Verify that sensitive traces are not exposed to outer layers of the printed circuit board.','',0,0,1,1,'2018-04-11 11:16:00.608000','2018-04-11 11:16:00.608000',15),(169,'20.26','Verify that inter-chip communication is encrypted.','',0,0,1,1,'2018-04-11 11:16:13.105000','2018-04-11 11:16:13.105000',15),(170,'20.27','Verify the device uses code signing and validates code before execution.','',0,0,1,1,'2018-04-11 11:16:25.973000','2018-04-11 11:16:25.973000',15),(171,'20.27','Verify that sensitive information maintained in memory is overwritten with zeros as soon as it is no longer required.','',0,0,1,1,'2018-04-11 11:16:43.811000','2018-04-11 11:16:43.811000',15),(172,'20.29','Verify that the firmware apps utilize kernel containers for isolation between apps.','',0,0,1,1,'2018-04-11 11:17:01.716000','2018-04-11 11:17:01.716000',15),(173,'19.1','Verify that all components are up to date with proper security configuration(s) and version(s). This should include removal of unneeded configurations and folders such as sample applications, platform documentation, and default or example users.','',1,1,1,1,'2018-04-11 11:24:21.828000','2018-04-11 11:24:21.828000',14),(174,'19.2','Verify that communications between components, such as between the application server and the database server, are encrypted, particularly when the components are in different containers or on different systems.','',0,1,1,1,'2018-04-11 11:24:39.890000','2018-04-11 11:24:39.890000',14),(175,'19.3','Verify that communications between components, such as between the application server and the database server, is authenticated using an account with the least necessary privileges.','',0,1,1,1,'2018-04-11 11:24:56.630000','2018-04-11 11:24:56.630000',14),(176,'19.4','Verify application deployments are adequately sandboxed, containerized or isolated to delay and deter attackers from attacking other applications.','',0,1,1,1,'2018-04-11 11:25:18.922000','2018-04-11 11:25:18.922000',14),(177,'19.5','Verify that the application build and deployment processes are performed in a secure and repeatable method, such as CI / CD automation and automated configuration management.','',0,1,1,1,'2018-04-11 11:27:01.661000','2018-04-11 11:27:01.661000',14),(178,'19.6','Verify that authorised administrators have the capability to verify the integrity of all security-relevant configurations to detect tampering.','',0,0,1,1,'2018-04-11 11:27:21.360000','2018-04-11 11:27:21.360000',14),(179,'19.7','Verify that all application components are signed.','',0,0,1,1,'2018-04-11 11:27:38.293000','2018-04-11 11:27:38.294000',14),(180,'19.8','Verify that third party components come from trusted repositories.','',0,0,1,1,'2018-04-11 11:27:56.079000','2018-04-11 11:27:56.079000',14),(181,'19.9','Verify that build processes for system level languages have all security flags enabled, such as ASLR, DEP, and security checks.','',0,0,1,1,'2018-04-11 11:28:15.183000','2018-04-11 11:28:15.183000',14),(182,'19.10','Verify that all application assets are hosted by the application, such as JavaScript libraries, CSS stylesheets and web fonts are hosted by the application rather than rely on a CDN or external provider.','',0,0,1,1,'2018-04-11 11:28:31.535000','2018-04-11 11:28:31.535000',14),(183,'19.11','Verify that all application components, services, and servers each use their own low privilege service account, that is not shared between applications nor used by administrators.','',0,1,1,1,'2018-04-11 11:28:48.369000','2018-04-11 11:28:48.369000',14),(184,'18.1','Verify that the same encoding style is used between the client and the server.','',1,1,1,1,'2018-04-11 11:29:30.653000','2018-04-11 11:29:30.653000',13),(185,'18.2','Verify that access to administration and management functions within the Web Service Application is limited to web service administrators.','',1,1,1,1,'2018-04-11 11:29:47.034000','2018-04-11 11:29:47.034000',13),(186,'18.3','Verify that XML or JSON schema is in place and verified before accepting input.','',1,1,1,1,'2018-04-11 11:30:10.128000','2018-04-11 11:30:10.128000',13),(187,'18.4','Verify that all input is limited to an appropriate size limit.','',1,1,1,1,'2018-04-11 11:30:27.140000','2018-04-11 11:30:27.141000',13),(188,'18.5','Verify that SOAP based web services are compliant with Web Services-Interoperability (WS-I) Basic Profile at minimum. This essentially means TLS encryption.','',1,1,1,1,'2018-04-11 11:30:45.544000','2018-04-11 11:30:45.544000',13),(189,'18.7','Verify that the REST service is protected from Cross-Site Request Forgery via the use of at least one or more of the following: double submit cookie pattern, CSRF nonces, ORIGIN request header checks, and referrer request header checks.','',1,1,1,1,'2018-04-11 11:31:06.094000','2018-04-11 11:31:06.094000',13),(190,'18.8','Verify the REST service explicitly check the incoming Content-Type to be the expected one, such as application/xml or application/json.','',0,1,1,1,'2018-04-11 11:31:24.980000','2018-04-11 11:31:24.980000',13),(191,'18.9','Verify that the message payload is signed to ensure reliable transport between client and service, using JSON Web Signing or WS-Security for SOAP requests.','',0,1,1,1,'2018-04-11 11:31:45.167000','2018-04-11 11:31:45.167000',13),(192,'18.10','Verify that alternative and less secure access paths do not exist.','',0,1,1,1,'2018-04-11 11:32:13.509000','2018-04-11 11:32:13.509000',13),(193,'13.1.2','Verify that access to administration and management functions is limited to authorized administrators.','',1,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(194,'13.1.3','Verify API URLs do not expose sensitive information, such as the API key, session tokens etc.','',1,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(195,'13.1.4','Verify that authorization decisions are made at both the URI, enforced by programmatic or declarative security at the controller or router, and at the resource level, enforced by model-based permissions.','',0,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(196,'13.1.5','Verify that requests containing unexpected or missing content types are rejected with appropriate headers (HTTP response status 406 Unacceptable or 415 Unsupported Media Type).','',0,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(197,'13.2.1','Verify that enabled RESTful HTTP methods are a valid choice for the user or action, such as preventing normal users using DELETE or PUT on protected API or resources.','',1,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(198,'13.2.2','Verify that JSON schema validation is in place and verified before accepting input.','',1,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(199,'13.2.3','Verify that RESTful web services that utilize cookies are protected from Cross-Site Request Forgery via the use of at least one or more of the following: triple or double submit cookie pattern (see [references](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)), CSRF nonces, or ORIGIN request header checks.','',1,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(200,'13.2.4','Verify that REST services have anti-automation controls to protect against excessive calls, especially if the API is unauthenticated.','',0,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(201,'13.2.5','Verify that REST services explicitly check the incoming Content-Type to be the expected one, such as application/xml or application/JSON.','',0,1,1,1,'2019-03-27 21:40:32.962000','2019-03-27 21:40:32.962000',16),(202,'13.2.6','Verify that the message headers and payload are trustworthy and not modified in transit. Requiring strong encryption for transport (TLS only) may be sufficient in many cases as it provides both confidentiality and integrity protection. Per-message digital signatures can provide additional assurance on top of the transport protections for high-security applications but bring with them additional complexity and risks to weigh against the benefits.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',16),(203,'13.3.1','Verify that XSD schema validation takes place to ensure a properly formed XML document, followed by validation of each input field before any processing of that data takes place.','',1,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',16),(204,'13.3.2','Verify that the message payload is signed using WS-Security to ensure reliable transport between client and service.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',16),(205,'13.4.1','Verify that query whitelisting or a combination of depth limiting and amount limiting should be used to prevent GraphQL or data layer expression denial of service (DoS) as a result of expensive, nested queries. For more advanced scenarios, query cost analysis should be used.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',16),(206,'13.4.2','Verify that GraphQL or other data layer authorization logic should be implemented at the business logic layer instead of the GraphQL layer.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',16),(207,'10.1.1','Verify that a code analysis tool is in use that can detect potentially malicious code, such as time functions, unsafe file operations and network connections.','',0,0,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',17),(208,'10.2.1','Verify that the application source code and third party libraries do not contain unauthorized phone home or data collection capabilities. Where such functionality exists, obtain the user\'s permission for it to operate  before collecting any data.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',17),(209,'10.2.2','Verify that the application does not ask for unnecessary or excessive permissions to privacy related features or sensors, such as contacts, cameras, microphones, or location.','',0,1,1,1,'2019-03-27 21:40:32.963000','2019-03-27 21:40:32.963000',17),(210,'10.2.3','Verify that the application source code and third party libraries do not contain back doors, such as hard-coded or additional undocumented accounts or keys, code obfuscation, undocumented binary blobs, rootkits, or anti-debugging, insecure debugging features, or otherwise out of date, insecure, or hidden functionality that could be used maliciously if discovered.','',0,0,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(211,'10.2.4','Verify that the application source code and third party libraries does not contain time bombs by searching for date and time related functions.','',0,0,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(212,'10.2.5','Verify that the application source code and third party libraries does not contain malicious code, such as salami attacks, logic bypasses, or logic bombs.','',0,0,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(213,'10.2.6','Verify that the application source code and third party libraries do not contain Easter eggs or any other potentially unwanted functionality.','',0,0,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(214,'10.3.1','Verify that if the application has a client or server auto-update feature, updates should be obtained over secure channels and digitally signed. The update code must validate the digital signature of the update before installing or executing the update.','',1,1,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(215,'10.3.2','Verify that the application employs integrity protections, such as code signing or sub-resource integrity. The application must not load or execute code from untrusted sources, such as loading includes, modules, plugins, code, or libraries from untrusted sources or the Internet.','',1,1,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(216,'10.3.3','Verify that the application has protection from sub-domain takeovers if the application relies upon DNS entries or DNS sub-domains, such as expired domain names, out of date DNS pointers or CNAMEs, expired projects at public source code repos, or transient cloud APIs, serverless functions, or storage buckets (autogen-bucket-id.cloud.example.com) or similar. Protections can include ensuring that DNS names used by applications are regularly checked for expiry or change.','',1,1,1,1,'2019-03-27 21:40:32.964000','2019-03-27 21:40:32.964000',17),(217,'14.1.1','Verify that the application build and deployment processes are performed in a secure and repeatable way, such as CI / CD automation, automated configuration management, and automated deployment scripts.','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(218,'14.1.2','Verify that compiler flags are configured to enable all available buffer overflow protections and warnings, including stack randomization, data execution prevention, and to break the build if an unsafe pointer, memory, format string, integer, or string operations are found.','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(219,'14.1.3','Verify that server configuration is hardened as per the recommendations of the application server and frameworks in use.','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(220,'14.1.4','Verify that the application, configuration, and all dependencies can be re-deployed using automated deployment scripts, built from a documented and tested runbook in a reasonable time, or restored from backups in a timely fashion.','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(221,'14.1.5','Verify that authorized administrators can verify the integrity of all security-relevant configurations to detect tampering.','',0,0,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(222,'14.2.1','Verify that all components are up to date, preferably using a dependency checker during build or compile time. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(223,'14.2.2','Verify that all unneeded features, documentation, samples, configurations are removed, such as sample applications, platform documentation, and default or example users.','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(224,'14.2.3','Verify that if application assets, such as JavaScript libraries, CSS stylesheets or web fonts, are hosted externally on a content delivery network (CDN) or external provider, Subresource Integrity (SRI) is used to validate the integrity of the asset.','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(225,'14.2.4','Verify that third party components come from pre-defined, trusted and continually maintained repositories. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(226,'14.2.5','Verify that an inventory catalog is maintained of all third party libraries in use. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(227,'14.2.6','Verify that the attack surface is reduced by sandboxing or encapsulating third party libraries to expose only the required behaviour into the application. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(228,'14.3.1','Verify that web or application server and framework error messages are configured to deliver user actionable, customized responses to eliminate any unintended security disclosures.','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(229,'14.3.2','Verify that web or application server and application framework debug modes are disabled in production to eliminate debug features, developer consoles, and unintended security disclosures.','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(230,'14.3.3','Verify that the HTTP headers or any part of the HTTP response do not expose detailed version information of system components.','',1,1,1,1,'2019-03-27 21:40:32.965000','2019-03-27 21:40:32.965000',18),(231,'14.4.1','Verify that every HTTP response contains a content type header specifying a safe character set (e.g., UTF-8, ISO 8859-1).','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(232,'14.4.2','Verify that all API responses contain Content-Disposition: attachment; filename=\"api.json\" (or other appropriate filename for the content type).','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(233,'14.4.3','Verify that a content security policy (CSPv2) is in place that helps mitigate impact for XSS attacks like HTML, DOM, JSON, and JavaScript injection vulnerabilities.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(234,'14.4.4','Verify that all responses contain X-Content-Type-Options: nosniff.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(235,'14.4.5','Verify that HTTP Strict Transport Security headers are included on all responses and for all subdomains, such as Strict-Transport-Security: max-age=15724800; includeSubdomains.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(236,'14.4.6','Verify that a suitable \"Referrer-Policy\" header is included, such as \"no-referrer\" or \"same-origin\".','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(237,'14.4.7','Verify that a suitable X-Frame-Options or Content-Security-Policy: frame-ancestors header is in use for sites where content should not be embedded in a third-party site.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(238,'14.5.1','Verify that the application server only accepts the HTTP methods in use by the application or API, including pre-flight OPTIONS.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(239,'14.5.2','Verify that the supplied Origin header is not used for authentication or access control decisions, as the Origin header can easily be changed by an attacker.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(240,'14.5.3','Verify that the cross-domain resource sharing (CORS) Access-Control-Allow-Origin header uses a strict white-list of trusted domains to match against and does not support the \"null\" origin.','',1,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(241,'14.5.4','Verify that HTTP headers added by a trusted proxy or SSO devices, such as a bearer token, are authenticated by the application.','',0,1,1,1,'2019-03-27 21:40:32.966000','2019-03-27 21:40:32.966000',18),(242,'6.1.1','Verify that regulated private data is stored encrypted while at rest, such as personally identifiable information (PII), sensitive personal information, or data assessed likely to be subject to EU\'s GDPR.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(243,'6.1.2','Verify that regulated health data is stored encrypted while at rest, such as medical records, medical device details, or de-anonymized research records.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(244,'6.1.3','Verify that regulated financial data is stored encrypted while at rest, such as financial accounts, defaults or credit history, tax records, pay history, beneficiaries, or de-anonymized market or research records.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(245,'6.2.1','Verify that all cryptographic modules fail securely, and errors are handled in a way that does not enable Padding Oracle attacks.','',1,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(246,'6.2.2','Verify that industry proven or government approved cryptographic algorithms, modes, and libraries are used, instead of custom coded cryptography. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(247,'6.2.3','Verify that encryption initialization vector, cipher configuration, and block modes are configured securely using the latest advice.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(248,'6.2.4','Verify that random number, encryption or hashing algorithms, key lengths, rounds, ciphers or modes, can be reconfigured, upgraded, or swapped at any time, to protect against cryptographic breaks. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(249,'6.2.5','Verify that known insecure block modes (i.e. ECB, etc.), padding modes (i.e. PKCS#1 v1.5, etc.), ciphers with small block sizes (i.e. Triple-DES, Blowfish, etc.), and weak hashing algorithms (i.e. MD5, SHA1, etc.) are not used unless required for backwards compatibility.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(250,'6.2.6','Verify that nonces, initialization vectors, and other single use numbers must not be used more than once with a given encryption key. The method of generation must be appropriate for the algorithm being used.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(251,'6.2.7','Verify that encrypted data is authenticated via signatures, authenticated cipher modes, or HMAC to ensure that ciphertext is not altered by an unauthorized party.','',0,0,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(252,'6.2.8','Verify that all cryptographic operations are constant-time, with no \'short-circuit\' operations in comparisons, calculations, or returns, to avoid leaking information.','',0,0,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(253,'6.3.1','Verify that all random numbers, random file names, random GUIDs, and random strings are generated using the cryptographic module\'s approved cryptographically secure random number generator when these random values are intended to be not guessable by an attacker.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(254,'6.3.2','Verify that random GUIDs are created using the GUID v4 algorithm, and a cryptographically-secure pseudo-random number generator (CSPRNG). GUIDs created using other pseudo-random number generators may be predictable.','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(255,'6.3.3','Verify that random numbers are created with proper entropy even when the application is under heavy load, or that the application degrades gracefully in such circumstances.','',0,0,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(256,'6.4.1','Verify that a secrets management solution such as a key vault is used to securely create, store, control access to and destroy secrets. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.967000','2019-03-27 21:40:32.967000',19),(257,'6.4.2','Verify that key material is not exposed to the application but instead uses an isolated security module like a vault for cryptographic operations. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.968000','2019-03-27 21:40:32.968000',19),(258,'9.1.1','Verify that secured TLS is used for all client connectivity, and does not fall back to insecure or unencrypted protocols. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.968000','2019-03-27 21:40:32.968000',20),(259,'9.1.2','Verify using online or up to date TLS testing tools that only strong algorithms, ciphers, and protocols are enabled, with the strongest algorithms and ciphers set as preferred.','',1,1,1,1,'2019-03-27 21:40:32.968000','2019-03-27 21:40:32.968000',20),(260,'9.1.3','Verify that old versions of SSL and TLS protocols, algorithms, ciphers, and configuration are disabled, such as SSLv2, SSLv3, or TLS 1.0 and TLS 1.1. The latest version of TLS should be the preferred cipher suite.','',1,1,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(261,'9.2.1','Verify that connections to and from the server use trusted TLS certificates. Where internally generated or self-signed certificates are used, the server must be configured to only trust specific internal CAs and specific self-signed certificates. All others should be rejected.','',0,1,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(262,'9.2.2','Verify that encrypted communications such as TLS is used for all inbound and outbound connections, including for management ports, monitoring, authentication, API, or web service calls, database, cloud, serverless, mainframe, external, and partner connections. The server must not fall back to insecure or unencrypted protocols.','',0,1,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(263,'9.2.3','Verify that all encrypted connections to external systems that involve sensitive information or functions are authenticated.','',0,1,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(264,'9.2.4','Verify that proper certification revocation, such as Online Certificate Status Protocol (OCSP) Stapling, is enabled and configured.','',0,1,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(265,'9.2.5','Verify that backend TLS connection failures are logged.','',0,0,1,1,'2019-03-27 21:40:32.969000','2019-03-27 21:40:32.969000',20),(266,'4.1.1','Verify that the application enforces access control rules on a trusted service layer, especially if client-side access control is present and could be bypassed.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(267,'4.1.2','Verify that all user and data attributes and policy information used by access controls cannot be manipulated by end users unless specifically authorized.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(268,'4.1.3','Verify that the principle of least privilege exists - users should only be able to access functions, data files, URLs, controllers, services, and other resources, for which they possess specific authorization. This implies protection against spoofing and elevation of privilege. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(269,'4.1.4','Verify that the principle of deny by default exists whereby new users/roles start with minimal or no permissions and users/roles do not receive access to new features until access is explicitly assigned.  ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(270,'4.1.5','Verify that access controls fail securely including when an exception occurs. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(271,'4.2.1','Verify that sensitive data and APIs are protected against direct object attacks targeting creation, reading, updating and deletion of records, such as creating or updating someone else\'s record, viewing everyone\'s records, or deleting all records.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(272,'4.2.2','Verify that the application or framework enforces a strong anti-CSRF mechanism to protect authenticated functionality, and effective anti-automation or anti-CSRF protects unauthenticated functionality.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(273,'4.3.1','Verify administrative interfaces use appropriate multi-factor authentication to prevent unauthorized use.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(274,'4.3.2','Verify that directory browsing is disabled unless deliberately desired. Additionally, applications should not allow discovery or disclosure of file or directory metadata, such as Thumbs.db, .DS_Store, .git or .svn folders.','',1,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(275,'4.3.3','Verify the application has additional authorization (such as step up or adaptive authentication) for lower value systems, and / or segregation of duties for high value applications to enforce anti-fraud controls as per the risk of application and past fraud.','',0,1,1,1,'2019-03-27 21:40:32.970000','2019-03-27 21:40:32.970000',21),(276,'3.1.1','Verify the application never reveals session tokens in URL parameters or error messages.','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(277,'3.2.1','Verify the application generates a new session token on user authentication. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(278,'3.2.2','Verify that session tokens possess at least 64 bits of entropy. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(279,'3.2.3','Verify the application only stores session tokens in the browser using secure methods such as appropriately secured cookies (see section 3.4) or HTML 5 session storage.','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(280,'3.2.4','Verify that session token are generated using approved cryptographic algorithms. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(281,'3.3.1','Verify that logout and expiration invalidate the session token, such that the back button or a downstream relying party does not resume an authenticated session, including across relying parties. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(282,'3.3.2','If authenticators permit users to remain logged in, verify that re-authentication occurs periodically both when actively used or after an idle period. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(283,'3.3.3','Verify that the application terminates all other active sessions after a successful password change, and that this is effective across the application, federated login (if present), and any relying parties.','',0,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(284,'3.3.4','Verify that users are able to view and log out of any or all currently active sessions and devices.','',0,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(285,'3.4.1','Verify that cookie-based session tokens have the \'Secure\' attribute set. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(286,'3.4.2','Verify that cookie-based session tokens have the \'HttpOnly\' attribute set. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(287,'3.4.3','Verify that cookie-based session tokens utilize the \'SameSite\' attribute to limit exposure to cross-site request forgery attacks. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.971000','2019-03-27 21:40:32.971000',22),(288,'3.4.4','Verify that cookie-based session tokens use \"__Host-\" prefix (see references) to provide session cookie confidentiality.','',1,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(289,'3.4.5','Verify that if the application is published under a domain name with other applications that set or use session cookies that might override or disclose the session cookies, set the path attribute in cookie-based session tokens using the most precise path possible. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(290,'3.5.1','Verify the application does not treat OAuth and refresh tokens &mdash; on their own &mdash; as the presence of the subscriber and allows users to terminate trust relationships with linked applications.','',0,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(291,'3.5.2','Verify the application uses session tokens rather than static API secrets and keys, except with legacy implementations.','',0,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(292,'3.5.3','Verify that stateless session tokens use digital signatures, encryption, and other countermeasures to protect against tampering, enveloping, replay, null cipher, and key substitution attacks.','',0,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(293,'3.6.1','Verify that relying parties specify the maximum authentication time to CSPs and that CSPs re-authenticate the subscriber if they haven\'t used a session within that period.','',0,0,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(294,'3.6.2','Verify that CSPs inform relying parties of the last authentication event, to allow RPs to determine if they need to re-authenticate the user.','',0,0,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(295,'3.7.1','Verify the application ensures a valid login session or requires re-authentication or secondary verification before allowing any sensitive transactions or account modifications.','',1,1,1,1,'2019-03-27 21:40:32.972000','2019-03-27 21:40:32.972000',22),(296,'7.1.1','Verify that the application does not log credentials or payment details. Session tokens should only be stored in logs in an irreversible, hashed form. ([C9, C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(297,'7.1.2','Verify that the application does not log other sensitive data as defined under local privacy laws or relevant security policy. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(298,'7.1.3','Verify that the application logs security relevant events including successful and failed authentication events, access control failures, deserialization failures and input validation failures. ([C5, C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(299,'7.1.4','Verify that each log event includes necessary information that would allow for a detailed investigation of the timeline when an event happens. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(300,'7.2.1','Verify that all authentication decisions are logged, without storing sensitive session identifiers or passwords. This should include requests with relevant metadata needed for security investigations.','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(301,'7.2.2','Verify that all access control decisions can be logged and all failed decisions are logged. This should include requests with relevant metadata needed for security investigations.','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(302,'7.3.1','Verify that the application appropriately encodes user-supplied data to prevent log injection. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(303,'7.3.2','Verify that all events are protected from injection when viewed in log viewing software. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(304,'7.3.3','Verify that security logs are protected from unauthorized access and modification. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(305,'7.3.4','Verify that time sources are synchronized to the correct time and time zone. Strongly consider logging only in UTC if systems are global to assist with post-incident forensic analysis. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(306,'7.4.1','Verify that a generic message is shown when an unexpected or security sensitive error occurs, potentially with a unique ID which support personnel can use to investigate.  ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(307,'7.4.2','Verify that exception handling (or a functional equivalent) is used across the codebase to account for expected and unexpected error conditions. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(308,'7.4.3','Verify that a \"last resort\" error handler is defined which will catch all unhandled exceptions. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.973000','2019-03-27 21:40:32.973000',23),(309,'8.1.1','Verify the application protects sensitive data from being cached in server components such as load balancers and application caches.','',0,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(310,'8.1.2','Verify that all cached or temporary copies of sensitive data stored on the server are protected from unauthorized access or purged/invalidated after the authorized user accesses the sensitive data.','',0,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(311,'8.1.3','Verify the application minimizes the number of parameters in a request, such as hidden fields, Ajax variables, cookies and header values.','',0,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(312,'8.1.4','Verify the application can detect and alert on abnormal numbers of requests, such as by IP, user, total per hour or day, or whatever makes sense for the application.','',0,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(313,'8.1.5','Verify that regular backups of important data are performed and that test restoration of data is performed.','',0,0,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(314,'8.1.6','Verify that backups are stored securely to prevent data from being stolen or corrupted.','',0,0,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(315,'8.2.1','Verify the application sets sufficient anti-caching headers so that sensitive data is not cached in modern browsers.','',1,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(316,'8.2.2','Verify that data stored in client side storage (such as HTML5 local storage, session storage, IndexedDB, regular cookies or Flash cookies) does not contain sensitive data or PII.','',1,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(317,'8.2.3','Verify that authenticated data is cleared from client storage, such as the browser DOM, after the client or session is terminated.','',1,1,1,1,'2019-03-27 21:40:32.974000','2019-03-27 21:40:32.974000',24),(318,'8.3.1','Verify that sensitive data is sent to the server in the HTTP message body or headers, and that query string parameters from any HTTP verb do not contain sensitive data.','',1,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(319,'8.3.2','Verify that users have a method to remove or export their data on demand.','',1,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(320,'8.3.3','Verify that users are provided clear language regarding collection and use of supplied personal information and that users have provided opt-in consent for the use of that data before it is used in any way.','',1,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(321,'8.3.4','Verify that all sensitive data created and processed by the application has been identified, and ensure that a policy is in place on how to deal with sensitive data. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(322,'8.3.5','Verify accessing sensitive data is audited (without logging the sensitive data itself), if the data is collected under relevant data protection directives or where logging of access is required.','',0,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(323,'8.3.6','Verify that sensitive information contained in memory is overwritten as soon as it is no longer required to mitigate memory dumping attacks, using zeroes or random data.','',0,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(324,'8.3.7','Verify that sensitive or private information that is required to be encrypted, is encrypted using approved algorithms that provide both confidentiality and integrity. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(325,'8.3.8','Verify that sensitive personal information is subject to data retention classification, such that old or out of date data is deleted automatically, on a schedule, or as the situation requires.','',0,1,1,1,'2019-03-27 21:40:32.975000','2019-03-27 21:40:32.975000',24),(326,'2.1.1','Verify that user set passwords are at least 12 characters in length. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(327,'2.1.2','Verify that passwords 64 characters or longer are permitted. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(328,'2.1.3','Verify that passwords can contain spaces and truncation is not performed. Consecutive multiple spaces MAY optionally be coalesced. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(329,'2.1.4','Verify that Unicode characters are permitted in passwords. A single Unicode code point is considered a character, so 12 emoji or 64 kanji characters should be valid and permitted.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(330,'2.1.5','Verify users can change their password.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(331,'2.1.6','Verify that password change functionality requires the user\'s current and new password.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(332,'2.1.7','Verify that passwords submitted during account registration, login, and password change are checked against a set of breached passwords either locally (such as the top 1,000 or 10,000 most common passwords which match the system\'s password policy) or using an external API. If using an API a zero knowledge proof or other mechanism should be used to ensure that the plain text password is not sent or used in verifying the breach status of the password. If the password is breached, the application must require the user to set a new non-breached password. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(333,'2.1.8','Verify that a password strength meter is provided to help users set a stronger password.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(334,'2.1.9','Verify that there are no password composition rules limiting the type of characters permitted. There should be no requirement for upper or lower case or numbers or special characters. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(335,'2.1.10','Verify that there are no periodic credential rotation or password history requirements.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(336,'2.1.11','Verify that \"paste\" functionality, browser password helpers, and external password managers are permitted.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(337,'2.1.12','Verify that the user can choose to either temporarily view the entire masked password, or temporarily view the last typed character of the password on platforms that do not have this as native functionality.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(338,'2.2.1','Verify that anti-automation controls are effective at mitigating breached credential testing, brute force, and account lockout attacks. Such controls include blocking the most common breached passwords, soft lockouts, rate limiting, CAPTCHA, ever increasing delays between attempts, IP address restrictions, or risk-based restrictions such as location, first login on a device, recent attempts to unlock the account, or similar. Verify that no more than 100 failed attempts per hour is possible on a single account.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(339,'2.2.2','Verify that the use of weak authenticators (such as SMS and email) is limited to secondary verification and transaction approval and not as a replacement for more secure authentication methods. Verify that stronger methods are offered before weak methods, users are aware of the risks, or that proper measures are in place to limit the risks of account compromise.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(340,'2.2.3','Verify that secure notifications are sent to users after updates to authentication details, such as credential resets, email or address changes, logging in from unknown or risky locations. The use of push notifications - rather than SMS or email - is preferred, but in the absence of push notifications, SMS or email is acceptable as long as no sensitive information is disclosed in the notification.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(341,'2.2.4','Verify impersonation resistance against phishing, such as the use of multi-factor authentication, cryptographic devices with intent (such as connected keys with a push to authenticate), or at higher AAL levels, client-side certificates.','',0,0,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(342,'2.2.5','Verify that where a credential service provider (CSP) and the application verifying authentication are separated, mutually authenticated TLS is in place between the two endpoints.','',0,0,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(343,'2.2.6','Verify replay resistance through the mandated use of OTP devices, cryptographic authenticators, or lookup codes.','',0,0,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(344,'2.2.7','Verify intent to authenticate by requiring the entry of an OTP token or user-initiated action such as a button press on a FIDO hardware key.','',0,0,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.976000',25),(345,'2.3.1','Verify system generated initial passwords or activation codes SHOULD be securely randomly generated, SHOULD be at least 6 characters long, and MAY contain letters and numbers, and expire after a short period of time. These initial secrets must not be permitted to become the long term password.','',1,1,1,1,'2019-03-27 21:40:32.976000','2019-03-27 21:40:32.977000',25),(346,'2.3.2','Verify that enrollment and use of subscriber-provided authentication devices are supported, such as a U2F or FIDO tokens.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(347,'2.3.3','Verify that renewal instructions are sent with sufficient time to renew time bound authenticators.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(348,'2.4.1','Verify that passwords are stored in a form that is resistant to offline attacks. Passwords SHALL be salted and hashed using an approved one-way key derivation or password hashing function. Key derivation and password hashing functions take a password, a salt, and a cost factor as inputs when generating a password hash. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(349,'2.4.2','Verify that the salt is at least 32 bits in length and be chosen arbitrarily to minimize salt value collisions among stored hashes. For each credential, a unique salt value and the resulting hash SHALL be stored. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(350,'2.4.3','Verify that if PBKDF2 is used, the iteration count SHOULD be as large as verification server performance will allow, typically at least 100,000 iterations. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(351,'2.4.4','Verify that if bcrypt is used, the work factor SHOULD be as large as verification server performance will allow, typically at least 13. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(352,'2.4.5','Verify that an additional iteration of a key derivation function is performed, using a salt value that is secret and known only to the verifier. Generate the salt value using an approved random bit generator [SP 800-90Ar1] and provide at least the minimum security strength specified in the latest revision of SP 800-131A. The secret salt value SHALL be stored separately from the hashed passwords (e.g., in a specialized device like a hardware security module).','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(353,'2.5.1','Verify that a system generated initial activation or recovery secret is not sent in clear text to the user. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(354,'2.5.2','Verify password hints or knowledge-based authentication (so-called \"secret questions\") are not present.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(355,'2.5.3','Verify password credential recovery does not reveal the current password in any way. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(356,'2.5.4','Verify shared or default accounts are not present (e.g. \"root\", \"admin\", or \"sa\").','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(357,'2.5.5','Verify that if an authentication factor is changed or replaced, that the user is notified of this event.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(358,'2.5.6','Verify forgotten password, and other recovery paths use a secure recovery mechanism, such as TOTP or other soft token, mobile push, or another offline recovery mechanism. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(359,'2.5.7','Verify that if OTP or multi-factor authentication factors are lost, that evidence of identity proofing is performed at the same level as during enrollment.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(360,'2.6.1','Verify that lookup secrets can be used only once.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(361,'2.6.2','Verify that lookup secrets have sufficient randomness (112 bits of entropy), or if less than 112 bits of entropy, salted with a unique and random 32-bit salt and hashed with an approved one-way hash.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(362,'2.6.3','Verify that lookup secrets are resistant to offline attacks, such as predictable values.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(363,'2.7.1','Verify that clear text out of band (NIST \"restricted\") authenticators, such as SMS or PSTN, are not offered by default, and stronger alternatives such as push notifications are offered first.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(364,'2.7.2','Verify that the out of band verifier expires out of band authentication requests, codes, or tokens after 10 minutes.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(365,'2.7.3','Verify that the out of band verifier authentication requests, codes, or tokens are only usable once, and only for the original authentication request.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(366,'2.7.4','Verify that the out of band authenticator and verifier communicates over a secure independent channel.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(367,'2.7.5','Verify that the out of band verifier retains only a hashed version of the authentication code.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(368,'2.7.6','Verify that the initial authentication code is generated by a secure random number generator, containing at least 20 bits of entropy (typically a six digital random number is sufficient).','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(369,'2.8.1','Verify that time-based OTPs have a defined lifetime before expiring.','',1,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(370,'2.8.2','Verify that symmetric keys used to verify submitted OTPs are highly protected, such as by using a hardware security module or secure operating system based key storage.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(371,'2.8.3','Verify that approved cryptographic algorithms are used in the generation, seeding, and verification.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(372,'2.8.4','Verify that time-based OTP can be used only once within the validity period.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(373,'2.8.5','Verify that if a time-based multi factor OTP token is re-used during the validity period, it is logged and rejected with secure notifications being sent to the holder of the device.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(374,'2.8.6','Verify physical single factor OTP generator can be revoked in case of theft or other loss. Ensure that revocation is immediately effective across logged in sessions, regardless of location.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(375,'2.8.7','Verify that biometric authenticators are limited to use only as secondary factors in conjunction with either something you have and something you know.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(376,'2.9.1','Verify that cryptographic keys used in verification are stored securely and protected against disclosure, such as using a TPM or HSM, or an OS service that can use this secure storage.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(377,'2.9.2','Verify that the challenge nonce is at least 64 bits in length, and statistically unique or unique over the lifetime of the cryptographic device.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(378,'2.9.3','Verify that approved cryptographic algorithms are used in the generation, seeding, and verification.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(379,'2.10.1','Verify that integration secrets do not rely on unchanging passwords, such as API keys or shared privileged accounts.','',0,1,1,1,'2019-03-27 21:40:32.977000','2019-03-27 21:40:32.977000',25),(380,'2.10.2','Verify that if passwords are required, the credentials are not a default account.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',25),(381,'2.10.3','Verify that passwords are stored with sufficient protection to prevent offline recovery attacks, including local system access.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',25),(382,'2.10.4','Verify passwords, integrations with databases and third-party systems, seeds and internal secrets, and API keys are managed securely and not included in the source code or stored within source code repositories. Such storage SHOULD resist offline attacks. The use of a secure software key store (L1), hardware trusted platform module (TPM), or a hardware security module (L3) is recommended for password storage.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',25),(383,'12.1.1','Verify that the application will not accept large files that could fill up storage or cause a denial of service attack.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(384,'12.1.2','Verify that compressed files are checked for \"zip bombs\" - small input files that will decompress into huge files thus exhausting file storage limits.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(385,'12.1.3','Verify that a file size quota and maximum number of files per user is enforced to ensure that a single user cannot fill up the storage with too many files, or excessively large files.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(386,'12.2.1','Verify that files obtained from untrusted sources are validated to be of expected type based on the file\'s content.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(387,'12.3.1','Verify that user-submitted filename metadata is not used directly with system or framework file and URL API to protect against path traversal.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(388,'12.3.2','Verify that user-submitted filename metadata is validated or ignored to prevent the disclosure, creation, updating or removal of local files (LFI).','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(389,'12.3.3','Verify that user-submitted filename metadata is validated or ignored to prevent the disclosure or execution of remote files (RFI), which may also lead to SSRF.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(390,'12.3.4','Verify that the application protects against reflective file download (RFD) by validating or ignoring user-submitted filenames in a JSON, JSONP, or URL parameter, the response Content-Type header should be set to text/plain, and the Content-Disposition header should have a fixed filename.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(391,'12.3.5','Verify that untrusted file metadata is not used directly with system API or libraries, to protect against OS command injection.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(392,'12.3.6','Verify that the application does not include and execute functionality from untrusted sources, such as unverified content distribution networks, JavaScript libraries, node npm libraries, or server-side DLLs.','',0,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(393,'12.4.1','Verify that files obtained from untrusted sources are stored outside the web root, with limited permissions, preferably with strong validation.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(394,'12.4.2','Verify that files obtained from untrusted sources are scanned by antivirus scanners to prevent upload of known malicious content.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(395,'12.5.1','Verify that the web tier is configured to serve only files with specific file extensions to prevent unintentional information and source code leakage. For example, backup files (e.g. .bak), temporary working files (e.g. .swp), compressed files (.zip, .tar.gz, etc) and other extensions commonly used by editors should be blocked unless required.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(396,'12.5.2','Verify that direct requests to uploaded files will never be executed as HTML/JavaScript content.','',1,1,1,1,'2019-03-27 21:40:32.978000','2019-03-27 21:40:32.978000',26),(397,'12.6.1','Verify that the web or application server is configured with a whitelist of resources or systems to which the server can send requests or load data/files from.','',1,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',26),(398,'1.1.1','Verify the use of a secure software development lifecycle that addresses security in all stages of development. ([C1](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(399,'1.1.2','Verify the use of threat modeling for every design change or sprint planning to identify threats, plan for countermeasures, facilitate appropriate risk responses, and guide security testing.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(400,'1.1.3','Verify that all user stories and features contain functional security constraints, such as \"As a user, I should be able to view and edit my profile. I should not be able to view or edit anyone else\'s profile\"','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(401,'1.1.4','Verify documentation and justification of all the application\'s trust boundaries, components, and significant data flows.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(402,'1.1.5','Verify definition and security analysis of the application\'s high-level architecture and all connected remote services. ([C1](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(403,'1.1.6','Verify implementation of centralized, simple (economy of design), vetted, secure, and reusable security controls to avoid duplicate, missing, ineffective, or insecure controls. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(404,'1.1.7','Verify availability of a secure coding checklist, security requirements, guideline, or policy to all developers and testers.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(405,'1.2.1','Verify the use of unique or special low-privilege operating system accounts for all application components, services, and servers. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(406,'1.2.2','Verify that communications between application components, including APIs, middleware and data layers, are authenticated. Components should have the least necessary privileges needed. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(407,'1.2.3','Verify that the application uses a single vetted authentication mechanism that is known to be secure, can be extended to include strong authentication, and has sufficient logging and monitoring to detect account abuse or breaches.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(408,'1.2.4','Verify that all authentication pathways and identity management APIs implement consistent authentication security control strength, such that there are no weaker alternatives per the risk of the application.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(409,'1.4.1','Verify that trusted enforcement points such as at access control gateways, servers, and serverless functions enforce access controls. Never enforce access controls on the client.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(410,'1.4.2','Verify that the chosen access control solution is flexible enough to meet the application\'s needs.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(411,'1.4.3','Verify enforcement of the principle of least privilege in functions, data files, URLs, controllers, services, and other resources. This implies protection against spoofing and elevation of privilege.','',0,1,1,1,'2019-03-27 21:40:32.979000','2019-03-27 21:40:32.979000',27),(412,'1.4.4','Verify the application uses a single and well-vetted access control mechanism for accessing protected data and resources. All requests must pass through this single mechanism to avoid copy and paste or insecure alternative paths. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(413,'1.4.5','Verify that attribute or feature-based access control is used whereby the code checks the user\'s authorization for a feature/data item rather than just their role. Permissions should still be allocated using roles. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(414,'1.5.1','Verify that input and output requirements clearly define how to handle and process data based on type, content, and applicable laws, regulations, and other policy compliance.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(415,'1.5.2','Verify that serialization is not used when communicating with untrusted clients. If this is not possible, ensure that adequate integrity controls (and possibly encryption if sensitive data is sent) are enforced to prevent deserialization attacks including object injection.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(416,'1.5.3','Verify that input validation is enforced on a trusted service layer. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(417,'1.5.4','Verify that output encoding occurs close to or by the interpreter for which it is intended. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(418,'1.6.1','Verify that there is an explicit policy for management of cryptographic keys and that a cryptographic key lifecycle follows a key management standard such as NIST SP 800-57.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(419,'1.6.2','Verify that consumers of cryptographic services protect key material and other secrets by using key vaults or API based alternatives.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(420,'1.6.3','Verify that all keys and passwords are replaceable and are part of a well-defined process to re-encrypt sensitive data.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(421,'1.6.4','Verify that symmetric keys, passwords, or API secrets generated by or shared with clients are used only in protecting low risk secrets, such as encrypting local storage, or temporary ephemeral uses such as parameter obfuscation. Sharing secrets with clients is clear-text equivalent and architecturally should be treated as such.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(422,'1.7.1','Verify that a common logging format and approach is used across the system.  ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(423,'1.7.2','Verify that logs are securely transmitted to a preferably remote system for analysis, detection, alerting, and escalation. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(424,'1.8.1','Verify that all sensitive data is identified and classified into protection levels.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(425,'1.8.2','Verify that all protection levels have an associated set of protection requirements, such as encryption requirements, integrity requirements, retention, privacy and other confidentiality requirements, and that these are applied in the architecture.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(426,'1.9.1','Verify the application encrypts communications between components, particularly when these components are in different containers, systems, sites, or cloud providers. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(427,'1.9.2','Verify that application components verify the authenticity of each side in a communication link to prevent person-in-the-middle attacks. For example, application components should validate TLS certificates and chains.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(428,'1.10.1','Verify that a source code control system is in use, with procedures to ensure that check-ins are accompanied by issues or change tickets. The source code control system should have access control and identifiable users to allow traceability of any changes.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(429,'1.11.1','Verify the definition and documentation of all application components in terms of the business or security functions they provide.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(430,'1.11.2','Verify that all high-value business logic flows, including authentication, session management and access control, do not share unsynchronized state.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(431,'1.11.3','Verify that all high-value business logic flows, including authentication, session management and access control are thread safe and resistant to time-of-check and time-of-use race conditions.','',0,0,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(432,'1.12.1','Verify that user-uploaded files are stored outside of the web root.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(433,'1.12.2','Verify that user-uploaded files - if required to be displayed or downloaded from the application - are served by either octet stream downloads, or from an unrelated domain, such as a cloud file storage bucket. Implement a suitable content security policy to reduce the risk from XSS vectors or other attacks from the uploaded file.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(434,'1.14.1','Verify the segregation of components of differing trust levels through well-defined security controls, firewall rules, API gateways, reverse proxies, cloud-based security groups, or similar mechanisms.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(435,'1.14.2','Verify that if deploying binaries to untrusted devices makes use of binary signatures, trusted connections, and verified endpoints.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(436,'1.14.3','Verify that the build pipeline warns of out-of-date or insecure components and takes appropriate actions.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(437,'1.14.4','Verify that the build pipeline contains a build step to automatically build and verify the secure deployment of the application, particularly if the application infrastructure is software defined, such as cloud environment build scripts.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(438,'1.14.5','Verify that application deployments adequately sandbox, containerize and/or isolate at the network level to delay and deter attackers from attacking other applications, especially when they are performing sensitive or dangerous actions such as deserialization. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(439,'1.14.6','Verify the application does not use unsupported, insecure, or deprecated client-side technologies such as NSAPI plugins, Flash, Shockwave, ActiveX, Silverlight, NACL, or client-side Java applets.','',0,1,1,1,'2019-03-27 21:40:32.980000','2019-03-27 21:40:32.980000',27),(440,'5.1.1','Verify that the application has defenses against HTTP parameter pollution attacks, particularly if the application framework makes no distinction about the source of request parameters (GET, POST, cookies, headers, or environment variables).','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(441,'5.1.2','Verify that frameworks protect against mass parameter assignment attacks, or that the application has countermeasures to protect against unsafe parameter assignment, such as marking fields private or similar. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(442,'5.1.3','Verify that all input (HTML form fields, REST requests, URL parameters, HTTP headers, cookies, batch files, RSS feeds, etc) is validated using positive validation (whitelisting). ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(443,'5.1.4','Verify that structured data is strongly typed and validated against a defined schema including allowed characters, length and pattern (e.g. credit card numbers or telephone, or validating that two related fields are reasonable, such as checking that suburb and zip/postcode match). ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(444,'5.1.5','Verify that URL redirects and forwards only allow whitelisted destinations, or show a warning when redirecting to potentially untrusted content.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(445,'5.2.1','Verify that all untrusted HTML input from WYSIWYG editors or similar is properly sanitized with an HTML sanitizer library or framework feature. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(446,'5.2.2','Verify that unstructured data is sanitized to enforce safety measures such as allowed characters and length.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(447,'5.2.3','Verify that the application sanitizes user input before passing to mail systems to protect against SMTP or IMAP injection.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(448,'5.2.4','Verify that the application avoids the use of eval() or other dynamic code execution features. Where there is no alternative, any user input being included must be sanitized or sandboxed before being executed.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(449,'5.2.5','Verify that the application protects against template injection attacks by ensuring that any user input being included is sanitized or sandboxed.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(450,'5.2.6','Verify that the application protects against SSRF attacks, by validating or sanitizing untrusted data or HTTP file metadata, such as filenames and URL input fields, use whitelisting of protocols, domains, paths and ports.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(451,'5.2.7','Verify that the application sanitizes, disables, or sandboxes user-supplied SVG scriptable content, especially as they relate to XSS resulting from inline scripts, and foreignObject.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(452,'5.2.8','Verify that the application sanitizes, disables, or sandboxes user-supplied scriptable or expression template language content, such as Markdown, CSS or XSL stylesheets, BBCode, or similar.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(453,'5.3.1','Verify that output encoding is relevant for the interpreter and context required. For example, use encoders specifically for HTML values, HTML attributes, JavaScript, URL Parameters, HTTP headers, SMTP, and others as the context requires, especially from untrusted inputs (e.g. names with Unicode or apostrophes, such as ?? or O\'Hara). ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(454,'5.3.2','Verify that output encoding preserves the user\'s chosen character set and locale, such that any Unicode character point is valid and safely handled. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(455,'5.3.3','Verify that context-aware, preferably automated - or at worst, manual - output escaping protects against reflected, stored, and DOM based XSS. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(456,'5.3.4','Verify that data selection or database queries (e.g. SQL, HQL, ORM, NoSQL) use parameterized queries, ORMs, entity frameworks, or are otherwise protected from database injection attacks. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(457,'5.3.5','Verify that where parameterized or safer mechanisms are not present, context-specific output encoding is used to protect against injection attacks, such as the use of SQL escaping to protect against SQL injection. ([C3, C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(458,'5.3.6','Verify that the application projects against JavaScript or JSON injection attacks, including for eval attacks, remote JavaScript includes, CSP bypasses, DOM XSS, and JavaScript expression evaluation. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(459,'5.3.7','Verify that the application protects against LDAP Injection vulnerabilities, or that specific security controls to prevent LDAP Injection have been implemented. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(460,'5.3.8','Verify that the application protects against OS command injection and that operating system calls use parameterized OS queries or use contextual command line output encoding. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(461,'5.3.9','Verify that the application protects against Local File Inclusion (LFI) or Remote File Inclusion (RFI) attacks.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(462,'5.3.10','Verify that the application protects against XPath injection or XML injection attacks. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(463,'5.4.1','Verify that the application uses memory-safe string, safer memory copy and pointer arithmetic to detect or prevent stack, buffer, or heap overflows.','',0,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(464,'5.4.2','Verify that format strings do not take potentially hostile input, and are constant.','',0,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(465,'5.4.3','Verify that sign, range, and input validation techniques are used to prevent integer overflows.','',0,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(466,'5.5.1','Verify that serialized objects use integrity checks or are encrypted to prevent hostile object creation or data tampering. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(467,'5.5.2','Verify that the application correctly restricts XML parsers to only use the most restrictive configuration possible and to ensure that unsafe features such as resolving external entities are disabled to prevent XXE.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(468,'5.5.3','Verify that deserialization of untrusted data is avoided or is protected in both custom code and third-party libraries (such as JSON, XML and YAML parsers).','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(469,'5.5.4','Verify that when parsing JSON in browsers or JavaScript-based backends, JSON.parse is used to parse the JSON document. Do not use eval() to parse JSON.','',1,1,1,1,'2019-03-27 21:40:32.981000','2019-03-27 21:40:32.981000',28),(470,'11.1.1','Verify the application will only process business logic flows for the same user in sequential step order and without skipping steps.','',1,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(471,'11.1.2','Verify the application will only process business logic flows with all steps being processed in realistic human time, i.e. transactions are not submitted too quickly.','',1,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(472,'11.1.3','Verify the application has appropriate limits for specific business actions or transactions which are correctly enforced on a per user basis.','',1,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(473,'11.1.4','Verify the application has sufficient anti-automation controls to detect and protect against data exfiltration, excessive business logic requests, excessive file uploads or denial of service attacks.','',1,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(474,'11.1.5','Verify the application has business logic limits or validation to protect against likely business risks or threats, identified using threat modelling or similar methodologies.','',1,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(475,'11.1.6','Verify the application does not suffer from \"time of check to time of use\" (TOCTOU) issues or other race conditions for sensitive operations.','',0,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(476,'11.1.7','Verify the application monitors for unusual events or activity from a business logic perspective. For example, attempts to perform actions out of order or actions which a normal user would never attempt. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))','',0,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29),(477,'11.1.8','Verify the application has configurable alerting when automated attacks or unusual activity is detected.','',0,1,1,1,'2019-03-27 21:40:32.982000','2019-03-27 21:40:32.982000',29);
/*!40000 ALTER TABLE `dojo_benchmark_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_requirement_cwe_mapping`
--

DROP TABLE IF EXISTS `dojo_benchmark_requirement_cwe_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_requirement_cwe_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark_requirement_id` int(11) NOT NULL,
  `cwe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_benchmark_requireme_benchmark_requirement_id_79db9dc8_uniq` (`benchmark_requirement_id`,`cwe_id`),
  KEY `dojo_benchmark_requi_cwe_id_a2a8b465_fk_dojo_cwe_` (`cwe_id`),
  CONSTRAINT `dojo_benchmark_requi_benchmark_requiremen_2d482655_fk_dojo_benc` FOREIGN KEY (`benchmark_requirement_id`) REFERENCES `dojo_benchmark_requirement` (`id`),
  CONSTRAINT `dojo_benchmark_requi_cwe_id_a2a8b465_fk_dojo_cwe_` FOREIGN KEY (`cwe_id`) REFERENCES `dojo_cwe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_requirement_cwe_mapping`
--

LOCK TABLES `dojo_benchmark_requirement_cwe_mapping` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_requirement_cwe_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_benchmark_requirement_cwe_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_requirement_testing_guide`
--

DROP TABLE IF EXISTS `dojo_benchmark_requirement_testing_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_requirement_testing_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark_requirement_id` int(11) NOT NULL,
  `testing_guide_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_benchmark_requireme_benchmark_requirement_id_762207ce_uniq` (`benchmark_requirement_id`,`testing_guide_id`),
  KEY `dojo_benchmark_requi_testing_guide_id_42745782_fk_dojo_test` (`testing_guide_id`),
  CONSTRAINT `dojo_benchmark_requi_benchmark_requiremen_8c32e498_fk_dojo_benc` FOREIGN KEY (`benchmark_requirement_id`) REFERENCES `dojo_benchmark_requirement` (`id`),
  CONSTRAINT `dojo_benchmark_requi_testing_guide_id_42745782_fk_dojo_test` FOREIGN KEY (`testing_guide_id`) REFERENCES `dojo_testing_guide` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_requirement_testing_guide`
--

LOCK TABLES `dojo_benchmark_requirement_testing_guide` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_requirement_testing_guide` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_benchmark_requirement_testing_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_benchmark_type`
--

DROP TABLE IF EXISTS `dojo_benchmark_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_benchmark_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benchmark_source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_benchmark_type`
--

LOCK TABLES `dojo_benchmark_type` WRITE;
/*!40000 ALTER TABLE `dojo_benchmark_type` DISABLE KEYS */;
INSERT INTO `dojo_benchmark_type` VALUES (1,'OWASP ASVS','v. 3.1','OWASP ASVS','2018-04-03 20:05:56.066000','2018-04-03 20:10:06.519000',1),(2,'OWASP ASVS','v. 4.0.1','OWASP ASVS','2019-03-27 10:44:17.930000','2019-03-27 10:44:17.930000',1);
/*!40000 ALTER TABLE `dojo_benchmark_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_burprawrequestresponse`
--

DROP TABLE IF EXISTS `dojo_burprawrequestresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_burprawrequestresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `burpRequestBase64` longblob NOT NULL,
  `burpResponseBase64` longblob NOT NULL,
  `finding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_burprawrequestr_finding_id_57e40ea9_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_burprawrequestr_finding_id_57e40ea9_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_burprawrequestresponse`
--

LOCK TABLES `dojo_burprawrequestresponse` WRITE;
/*!40000 ALTER TABLE `dojo_burprawrequestresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_burprawrequestresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list`
--

DROP TABLE IF EXISTS `dojo_check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_management` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption_crypto` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_management` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_and_access_control` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_input_sanitization_validation` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sensitive_data` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engagement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_check_list_engagement_id_b355442d_fk_dojo_engagement_id` (`engagement_id`),
  CONSTRAINT `dojo_check_list_engagement_id_b355442d_fk_dojo_engagement_id` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list`
--

LOCK TABLES `dojo_check_list` WRITE;
/*!40000 ALTER TABLE `dojo_check_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_auth_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_auth_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_auth_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_auth_iss_check_list_id_finding_id_a739d923_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_auth_finding_id_16bd75f3_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_auth_check_list_id_2dba8563_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_auth_finding_id_16bd75f3_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_auth_issues`
--

LOCK TABLES `dojo_check_list_auth_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_auth_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_auth_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_author_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_author_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_author_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_author_i_check_list_id_finding_id_f0ec88df_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_auth_finding_id_3f21bfea_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_auth_check_list_id_e6c71988_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_auth_finding_id_3f21bfea_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_author_issues`
--

LOCK TABLES `dojo_check_list_author_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_author_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_author_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_config_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_config_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_config_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_config_i_check_list_id_finding_id_85968d05_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_conf_finding_id_578e5b18_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_conf_check_list_id_f2098ac3_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_conf_finding_id_578e5b18_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_config_issues`
--

LOCK TABLES `dojo_check_list_config_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_config_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_config_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_crypto_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_crypto_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_crypto_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_crypto_i_check_list_id_finding_id_02951fb1_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_cryp_finding_id_24b00425_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_cryp_check_list_id_7ea6170c_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_cryp_finding_id_24b00425_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_crypto_issues`
--

LOCK TABLES `dojo_check_list_crypto_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_crypto_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_crypto_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_data_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_data_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_data_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_data_iss_check_list_id_finding_id_186d3499_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_data_finding_id_1c00b79e_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_data_check_list_id_8d6192b6_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_data_finding_id_1c00b79e_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_data_issues`
--

LOCK TABLES `dojo_check_list_data_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_data_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_data_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_other_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_other_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_other_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_other_is_check_list_id_finding_id_bee34dcd_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_othe_finding_id_18e26e59_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_othe_check_list_id_dd93a085_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_othe_finding_id_18e26e59_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_other_issues`
--

LOCK TABLES `dojo_check_list_other_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_other_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_other_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_sensitive_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_sensitive_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_sensitive_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_sensitiv_check_list_id_finding_id_a01f1852_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_sens_finding_id_ebe36305_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_sens_check_list_id_191cee65_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_sens_finding_id_ebe36305_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_sensitive_issues`
--

LOCK TABLES `dojo_check_list_sensitive_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_sensitive_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_sensitive_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_check_list_session_issues`
--

DROP TABLE IF EXISTS `dojo_check_list_session_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_check_list_session_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_check_list_session__check_list_id_finding_id_fbf59e4f_uniq` (`check_list_id`,`finding_id`),
  KEY `dojo_check_list_sess_finding_id_c6a3346e_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_check_list_sess_check_list_id_83de6984_fk_dojo_chec` FOREIGN KEY (`check_list_id`) REFERENCES `dojo_check_list` (`id`),
  CONSTRAINT `dojo_check_list_sess_finding_id_c6a3346e_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_check_list_session_issues`
--

LOCK TABLES `dojo_check_list_session_issues` WRITE;
/*!40000 ALTER TABLE `dojo_check_list_session_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_check_list_session_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_child_rule`
--

DROP TABLE IF EXISTS `dojo_child_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_child_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_object` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_rule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_child_rule_parent_rule_id_e80ec686_fk_dojo_rule_id` (`parent_rule_id`),
  CONSTRAINT `dojo_child_rule_parent_rule_id_e80ec686_fk_dojo_rule_id` FOREIGN KEY (`parent_rule_id`) REFERENCES `dojo_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_child_rule`
--

LOCK TABLES `dojo_child_rule` WRITE;
/*!40000 ALTER TABLE `dojo_child_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_child_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_choice`
--

DROP TABLE IF EXISTS `dojo_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `label` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_choice`
--

LOCK TABLES `dojo_choice` WRITE;
/*!40000 ALTER TABLE `dojo_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_choiceanswer`
--

DROP TABLE IF EXISTS `dojo_choiceanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_choiceanswer` (
  `answer_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_ptr_id`),
  CONSTRAINT `dojo_choiceanswer_answer_ptr_id_e9da2254_fk_dojo_answer_id` FOREIGN KEY (`answer_ptr_id`) REFERENCES `dojo_answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_choiceanswer`
--

LOCK TABLES `dojo_choiceanswer` WRITE;
/*!40000 ALTER TABLE `dojo_choiceanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_choiceanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_choiceanswer_answer`
--

DROP TABLE IF EXISTS `dojo_choiceanswer_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_choiceanswer_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choiceanswer_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_choiceanswer_answer_choiceanswer_id_choice_id_cd3baaf9_uniq` (`choiceanswer_id`,`choice_id`),
  KEY `dojo_choiceanswer_answer_choice_id_01fe177e_fk_dojo_choice_id` (`choice_id`),
  CONSTRAINT `dojo_choiceanswer_an_choiceanswer_id_4e3041c6_fk_dojo_choi` FOREIGN KEY (`choiceanswer_id`) REFERENCES `dojo_choiceanswer` (`answer_ptr_id`),
  CONSTRAINT `dojo_choiceanswer_answer_choice_id_01fe177e_fk_dojo_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `dojo_choice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_choiceanswer_answer`
--

LOCK TABLES `dojo_choiceanswer_answer` WRITE;
/*!40000 ALTER TABLE `dojo_choiceanswer_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_choiceanswer_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_choicequestion`
--

DROP TABLE IF EXISTS `dojo_choicequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_choicequestion` (
  `question_ptr_id` int(11) NOT NULL,
  `multichoice` tinyint(1) NOT NULL,
  PRIMARY KEY (`question_ptr_id`),
  CONSTRAINT `dojo_choicequestion_question_ptr_id_8530277c_fk_dojo_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `dojo_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_choicequestion`
--

LOCK TABLES `dojo_choicequestion` WRITE;
/*!40000 ALTER TABLE `dojo_choicequestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_choicequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_choicequestion_choices`
--

DROP TABLE IF EXISTS `dojo_choicequestion_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_choicequestion_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choicequestion_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_choicequestion_choi_choicequestion_id_choice_8a20af0b_uniq` (`choicequestion_id`,`choice_id`),
  KEY `dojo_choicequestion_choices_choice_id_f075edcc_fk_dojo_choice_id` (`choice_id`),
  CONSTRAINT `dojo_choicequestion__choicequestion_id_9bd1f187_fk_dojo_choi` FOREIGN KEY (`choicequestion_id`) REFERENCES `dojo_choicequestion` (`question_ptr_id`),
  CONSTRAINT `dojo_choicequestion_choices_choice_id_f075edcc_fk_dojo_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `dojo_choice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_choicequestion_choices`
--

LOCK TABLES `dojo_choicequestion_choices` WRITE;
/*!40000 ALTER TABLE `dojo_choicequestion_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_choicequestion_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_contact`
--

DROP TABLE IF EXISTS `dojo_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_globally_read_only` tinyint(1) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_contact`
--

LOCK TABLES `dojo_contact` WRITE;
/*!40000 ALTER TABLE `dojo_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_cred_mapping`
--

DROP TABLE IF EXISTS `dojo_cred_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_cred_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_authn_provider` tinyint(1) NOT NULL,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cred_id_id` int(11) NOT NULL,
  `engagement_id` int(11) DEFAULT NULL,
  `finding_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_cred_mapping_cred_id_id_78730a86_fk_dojo_cred_user_id` (`cred_id_id`),
  KEY `dojo_cred_mapping_engagement_id_7e4d1759_fk_dojo_engagement_id` (`engagement_id`),
  KEY `dojo_cred_mapping_finding_id_21c79f3f_fk_dojo_finding_id` (`finding_id`),
  KEY `dojo_cred_mapping_product_id_4340a500_fk_dojo_product_id` (`product_id`),
  KEY `dojo_cred_mapping_test_id_3e91c3e5_fk_dojo_test_id` (`test_id`),
  CONSTRAINT `dojo_cred_mapping_cred_id_id_78730a86_fk_dojo_cred_user_id` FOREIGN KEY (`cred_id_id`) REFERENCES `dojo_cred_user` (`id`),
  CONSTRAINT `dojo_cred_mapping_engagement_id_7e4d1759_fk_dojo_engagement_id` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_cred_mapping_finding_id_21c79f3f_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_cred_mapping_product_id_4340a500_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_cred_mapping_test_id_3e91c3e5_fk_dojo_test_id` FOREIGN KEY (`test_id`) REFERENCES `dojo_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_cred_mapping`
--

LOCK TABLES `dojo_cred_mapping` WRITE;
/*!40000 ALTER TABLE `dojo_cred_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_cred_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_cred_user`
--

DROP TABLE IF EXISTS `dojo_cred_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_cred_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authentication` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_authentication` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logout_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `environment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_cred_user_environment_id_d71dccd3_fk_dojo_deve` (`environment_id`),
  CONSTRAINT `dojo_cred_user_environment_id_d71dccd3_fk_dojo_deve` FOREIGN KEY (`environment_id`) REFERENCES `dojo_development_environment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_cred_user`
--

LOCK TABLES `dojo_cred_user` WRITE;
/*!40000 ALTER TABLE `dojo_cred_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_cred_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_cred_user_notes`
--

DROP TABLE IF EXISTS `dojo_cred_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_cred_user_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cred_user_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_cred_user_notes_cred_user_id_notes_id_49bb4a4e_uniq` (`cred_user_id`,`notes_id`),
  KEY `dojo_cred_user_notes_notes_id_044d7ff6_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_cred_user_notes_cred_user_id_d12be78b_fk_dojo_cred_user_id` FOREIGN KEY (`cred_user_id`) REFERENCES `dojo_cred_user` (`id`),
  CONSTRAINT `dojo_cred_user_notes_notes_id_044d7ff6_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_cred_user_notes`
--

LOCK TABLES `dojo_cred_user_notes` WRITE;
/*!40000 ALTER TABLE `dojo_cred_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_cred_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_cwe`
--

DROP TABLE IF EXISTS `dojo_cwe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_cwe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_cwe`
--

LOCK TABLES `dojo_cwe` WRITE;
/*!40000 ALTER TABLE `dojo_cwe` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_cwe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_development_environment`
--

DROP TABLE IF EXISTS `dojo_development_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_development_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_development_environment`
--

LOCK TABLES `dojo_development_environment` WRITE;
/*!40000 ALTER TABLE `dojo_development_environment` DISABLE KEYS */;
INSERT INTO `dojo_development_environment` VALUES (1,'Development'),(2,'Staging'),(3,'Production'),(4,'Test'),(5,'Pre-prod'),(6,'Lab');
/*!40000 ALTER TABLE `dojo_development_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_dojometa`
--

DROP TABLE IF EXISTS `dojo_dojometa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_dojometa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endpoint_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `finding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_dojometa_endpoint_id_name_e5402341_uniq` (`endpoint_id`,`name`),
  UNIQUE KEY `dojo_dojometa_product_id_name_5dd79327_uniq` (`product_id`,`name`),
  UNIQUE KEY `dojo_dojometa_finding_id_name_3706aea6_uniq` (`finding_id`,`name`),
  CONSTRAINT `dojo_dojometa_endpoint_id_a3bc8d24_fk_dojo_endpoint_id` FOREIGN KEY (`endpoint_id`) REFERENCES `dojo_endpoint` (`id`),
  CONSTRAINT `dojo_dojometa_finding_id_5699162b_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_dojometa_product_id_c4fb13bb_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_dojometa`
--

LOCK TABLES `dojo_dojometa` WRITE;
/*!40000 ALTER TABLE `dojo_dojometa` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_dojometa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_endpoint`
--

DROP TABLE IF EXISTS `dojo_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_endpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fqdn` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fragment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `mitigated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_endpoint_product_id_b86dc143_fk_dojo_product_id` (`product_id`),
  CONSTRAINT `dojo_endpoint_product_id_b86dc143_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_endpoint`
--

LOCK TABLES `dojo_endpoint` WRITE;
/*!40000 ALTER TABLE `dojo_endpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_endpoint_endpoint_params`
--

DROP TABLE IF EXISTS `dojo_endpoint_endpoint_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_endpoint_endpoint_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint_id` int(11) NOT NULL,
  `endpoint_params_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_endpoint_endpoint_p_endpoint_id_endpoint_par_bcc0fc63_uniq` (`endpoint_id`,`endpoint_params_id`),
  KEY `dojo_endpoint_endpoi_endpoint_params_id_a46a98fe_fk_dojo_endp` (`endpoint_params_id`),
  CONSTRAINT `dojo_endpoint_endpoi_endpoint_id_518e469d_fk_dojo_endp` FOREIGN KEY (`endpoint_id`) REFERENCES `dojo_endpoint` (`id`),
  CONSTRAINT `dojo_endpoint_endpoi_endpoint_params_id_a46a98fe_fk_dojo_endp` FOREIGN KEY (`endpoint_params_id`) REFERENCES `dojo_endpoint_params` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_endpoint_endpoint_params`
--

LOCK TABLES `dojo_endpoint_endpoint_params` WRITE;
/*!40000 ALTER TABLE `dojo_endpoint_endpoint_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_endpoint_endpoint_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_endpoint_endpoint_status`
--

DROP TABLE IF EXISTS `dojo_endpoint_endpoint_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_endpoint_endpoint_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint_id` int(11) NOT NULL,
  `endpoint_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_endpoint_endpoint_s_endpoint_id_endpoint_sta_0c7d7bb1_uniq` (`endpoint_id`,`endpoint_status_id`),
  KEY `dojo_endpoint_endpoi_endpoint_status_id_5a3e49ce_fk_dojo_endp` (`endpoint_status_id`),
  CONSTRAINT `dojo_endpoint_endpoi_endpoint_id_88f2236d_fk_dojo_endp` FOREIGN KEY (`endpoint_id`) REFERENCES `dojo_endpoint` (`id`),
  CONSTRAINT `dojo_endpoint_endpoi_endpoint_status_id_5a3e49ce_fk_dojo_endp` FOREIGN KEY (`endpoint_status_id`) REFERENCES `dojo_endpoint_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_endpoint_endpoint_status`
--

LOCK TABLES `dojo_endpoint_endpoint_status` WRITE;
/*!40000 ALTER TABLE `dojo_endpoint_endpoint_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_endpoint_endpoint_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_endpoint_params`
--

DROP TABLE IF EXISTS `dojo_endpoint_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_endpoint_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_endpoint_params`
--

LOCK TABLES `dojo_endpoint_params` WRITE;
/*!40000 ALTER TABLE `dojo_endpoint_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_endpoint_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_endpoint_status`
--

DROP TABLE IF EXISTS `dojo_endpoint_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_endpoint_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `mitigated` tinyint(1) NOT NULL,
  `mitigated_time` datetime(6) DEFAULT NULL,
  `false_positive` tinyint(1) NOT NULL,
  `out_of_scope` tinyint(1) NOT NULL,
  `risk_accepted` tinyint(1) NOT NULL,
  `endpoint_id` int(11) DEFAULT NULL,
  `finding_id` int(11) DEFAULT NULL,
  `mitigated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_endpoint_status_endpoint_id_8dbac69c_fk_dojo_endpoint_id` (`endpoint_id`),
  KEY `dojo_endpoint_status_finding_id_394d34c7_fk_dojo_finding_id` (`finding_id`),
  KEY `dojo_endpoint_status_mitigated_by_id_2b3764a0_fk_auth_user_id` (`mitigated_by_id`),
  CONSTRAINT `dojo_endpoint_status_endpoint_id_8dbac69c_fk_dojo_endpoint_id` FOREIGN KEY (`endpoint_id`) REFERENCES `dojo_endpoint` (`id`),
  CONSTRAINT `dojo_endpoint_status_finding_id_394d34c7_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_endpoint_status_mitigated_by_id_2b3764a0_fk_auth_user_id` FOREIGN KEY (`mitigated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_endpoint_status`
--

LOCK TABLES `dojo_endpoint_status` WRITE;
/*!40000 ALTER TABLE `dojo_endpoint_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_endpoint_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement`
--

DROP TABLE IF EXISTS `dojo_engagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_contacted` date DEFAULT NULL,
  `target_start` date NOT NULL,
  `target_end` date NOT NULL,
  `reason` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `tracker` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_strategy` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `threat_model` tinyint(1) NOT NULL,
  `api_test` tinyint(1) NOT NULL,
  `pen_test` tinyint(1) NOT NULL,
  `check_list` tinyint(1) NOT NULL,
  `status` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `progress` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tmodel_path` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `risk_path` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `done_testing` tinyint(1) NOT NULL,
  `engagement_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `build_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit_hash` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_tag` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_code_management_uri` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deduplication_on_engagement` tinyint(1) NOT NULL,
  `build_server_id` int(11) DEFAULT NULL,
  `eng_type_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `orchestration_engine_id` int(11) DEFAULT NULL,
  `preset_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `report_type_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `source_code_management_server_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_engagement_build_server_id_853213a1_fk_dojo_tool` (`build_server_id`),
  KEY `dojo_engagement_eng_type_id_cd0b3236_fk_dojo_engagement_type_id` (`eng_type_id`),
  KEY `dojo_engagement_lead_id_9e4157e6_fk_auth_user_id` (`lead_id`),
  KEY `dojo_engagement_orchestration_engine_a6819398_fk_dojo_tool` (`orchestration_engine_id`),
  KEY `dojo_engagement_preset_id_23b34ce6_fk_dojo_engagement_presets_id` (`preset_id`),
  KEY `dojo_engagement_product_id_c46b1b11_fk_dojo_product_id` (`product_id`),
  KEY `dojo_engagement_report_type_id_7d9d1533_fk_dojo_report_type_id` (`report_type_id`),
  KEY `dojo_engagement_requester_id_10b1f365_fk_dojo_contact_id` (`requester_id`),
  KEY `dojo_engagement_source_code_manageme_6b0edb25_fk_dojo_tool` (`source_code_management_server_id`),
  CONSTRAINT `dojo_engagement_build_server_id_853213a1_fk_dojo_tool` FOREIGN KEY (`build_server_id`) REFERENCES `dojo_tool_configuration` (`id`),
  CONSTRAINT `dojo_engagement_eng_type_id_cd0b3236_fk_dojo_engagement_type_id` FOREIGN KEY (`eng_type_id`) REFERENCES `dojo_engagement_type` (`id`),
  CONSTRAINT `dojo_engagement_lead_id_9e4157e6_fk_auth_user_id` FOREIGN KEY (`lead_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_engagement_orchestration_engine_a6819398_fk_dojo_tool` FOREIGN KEY (`orchestration_engine_id`) REFERENCES `dojo_tool_configuration` (`id`),
  CONSTRAINT `dojo_engagement_preset_id_23b34ce6_fk_dojo_engagement_presets_id` FOREIGN KEY (`preset_id`) REFERENCES `dojo_engagement_presets` (`id`),
  CONSTRAINT `dojo_engagement_product_id_c46b1b11_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_engagement_report_type_id_7d9d1533_fk_dojo_report_type_id` FOREIGN KEY (`report_type_id`) REFERENCES `dojo_report_type` (`id`),
  CONSTRAINT `dojo_engagement_requester_id_10b1f365_fk_dojo_contact_id` FOREIGN KEY (`requester_id`) REFERENCES `dojo_contact` (`id`),
  CONSTRAINT `dojo_engagement_source_code_manageme_6b0edb25_fk_dojo_tool` FOREIGN KEY (`source_code_management_server_id`) REFERENCES `dojo_tool_configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement`
--

LOCK TABLES `dojo_engagement` WRITE;
/*!40000 ALTER TABLE `dojo_engagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_notes`
--

DROP TABLE IF EXISTS `dojo_engagement_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engagement_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_engagement_notes_engagement_id_notes_id_83509bc8_uniq` (`engagement_id`,`notes_id`),
  KEY `dojo_engagement_notes_notes_id_339d985b_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_engagement_note_engagement_id_6d165427_fk_dojo_enga` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_engagement_notes_notes_id_339d985b_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_notes`
--

LOCK TABLES `dojo_engagement_notes` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_presets`
--

DROP TABLE IF EXISTS `dojo_engagement_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_engagement_presets_product_id_89236f9b_fk_dojo_product_id` (`product_id`),
  CONSTRAINT `dojo_engagement_presets_product_id_89236f9b_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_presets`
--

LOCK TABLES `dojo_engagement_presets` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_presets_network_locations`
--

DROP TABLE IF EXISTS `dojo_engagement_presets_network_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_presets_network_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engagement_presets_id` int(11) NOT NULL,
  `network_locations_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_engagement_presets__engagement_presets_id_ne_252f5175_uniq` (`engagement_presets_id`,`network_locations_id`),
  KEY `dojo_engagement_pres_network_locations_id_1b734374_fk_dojo_netw` (`network_locations_id`),
  CONSTRAINT `dojo_engagement_pres_engagement_presets_i_425440a9_fk_dojo_enga` FOREIGN KEY (`engagement_presets_id`) REFERENCES `dojo_engagement_presets` (`id`),
  CONSTRAINT `dojo_engagement_pres_network_locations_id_1b734374_fk_dojo_netw` FOREIGN KEY (`network_locations_id`) REFERENCES `dojo_network_locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_presets_network_locations`
--

LOCK TABLES `dojo_engagement_presets_network_locations` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_presets_network_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_presets_network_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_presets_test_type`
--

DROP TABLE IF EXISTS `dojo_engagement_presets_test_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_presets_test_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engagement_presets_id` int(11) NOT NULL,
  `test_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_engagement_presets__engagement_presets_id_te_baaa34f3_uniq` (`engagement_presets_id`,`test_type_id`),
  KEY `dojo_engagement_pres_test_type_id_3047de45_fk_dojo_test` (`test_type_id`),
  CONSTRAINT `dojo_engagement_pres_engagement_presets_i_17559a74_fk_dojo_enga` FOREIGN KEY (`engagement_presets_id`) REFERENCES `dojo_engagement_presets` (`id`),
  CONSTRAINT `dojo_engagement_pres_test_type_id_3047de45_fk_dojo_test` FOREIGN KEY (`test_type_id`) REFERENCES `dojo_test_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_presets_test_type`
--

LOCK TABLES `dojo_engagement_presets_test_type` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_presets_test_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_presets_test_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_risk_acceptance`
--

DROP TABLE IF EXISTS `dojo_engagement_risk_acceptance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_risk_acceptance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engagement_id` int(11) NOT NULL,
  `risk_acceptance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_engagement_risk_acc_engagement_id_risk_accep_a11e336b_uniq` (`engagement_id`,`risk_acceptance_id`),
  KEY `dojo_engagement_risk_risk_acceptance_id_f4fc1f25_fk_dojo_risk` (`risk_acceptance_id`),
  CONSTRAINT `dojo_engagement_risk_engagement_id_adc6b70d_fk_dojo_enga` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_engagement_risk_risk_acceptance_id_f4fc1f25_fk_dojo_risk` FOREIGN KEY (`risk_acceptance_id`) REFERENCES `dojo_risk_acceptance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_risk_acceptance`
--

LOCK TABLES `dojo_engagement_risk_acceptance` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_risk_acceptance` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_risk_acceptance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_survey`
--

DROP TABLE IF EXISTS `dojo_engagement_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_survey`
--

LOCK TABLES `dojo_engagement_survey` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_survey` DISABLE KEYS */;
INSERT INTO `dojo_engagement_survey` VALUES (2,'Infrastructure','Questions regarding the products physical infrastructure.',1),(3,'Testing Preparation','Tell us about the specific components that make up your application.',1),(4,'Access Control','Tell us about the access control configured for your application.',1),(5,'Information Flow / Dependency Modeling','Tell us how is your application used.',1),(6,'Information Management','Tell us what kind of data you are storing/managing.',1),(7,'Inventory','Give us detail about your application.',1);
/*!40000 ALTER TABLE `dojo_engagement_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_survey_questions`
--

DROP TABLE IF EXISTS `dojo_engagement_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_survey_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engagement_survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_engagement_survey_q_engagement_survey_id_que_5a4bb321_uniq` (`engagement_survey_id`,`question_id`),
  KEY `dojo_engagement_surv_question_id_72a9edb3_fk_dojo_ques` (`question_id`),
  CONSTRAINT `dojo_engagement_surv_engagement_survey_id_3144e169_fk_dojo_enga` FOREIGN KEY (`engagement_survey_id`) REFERENCES `dojo_engagement_survey` (`id`),
  CONSTRAINT `dojo_engagement_surv_question_id_72a9edb3_fk_dojo_ques` FOREIGN KEY (`question_id`) REFERENCES `dojo_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_survey_questions`
--

LOCK TABLES `dojo_engagement_survey_questions` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_survey_questions` DISABLE KEYS */;
INSERT INTO `dojo_engagement_survey_questions` VALUES (1,2,3),(2,2,4),(3,2,5),(4,2,6),(5,2,7),(6,2,8),(7,2,9),(8,2,10),(9,2,11),(10,2,12),(18,3,13),(11,3,37),(12,3,38),(13,3,39),(14,3,40),(15,3,41),(16,3,42),(17,3,43),(19,4,14),(20,4,15),(21,4,16),(22,4,17),(23,4,18),(24,4,19),(25,4,20),(27,5,21),(28,5,22),(29,5,23),(26,5,24),(30,6,25),(31,6,26),(32,6,27),(33,6,28),(34,6,29),(35,6,30),(36,6,31),(37,7,32),(38,7,33),(39,7,34),(40,7,35),(41,7,36);
/*!40000 ALTER TABLE `dojo_engagement_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_engagement_type`
--

DROP TABLE IF EXISTS `dojo_engagement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_engagement_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_engagement_type`
--

LOCK TABLES `dojo_engagement_type` WRITE;
/*!40000 ALTER TABLE `dojo_engagement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_engagement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_fieldrule`
--

DROP TABLE IF EXISTS `dojo_fieldrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_fieldrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_fieldrule`
--

LOCK TABLES `dojo_fieldrule` WRITE;
/*!40000 ALTER TABLE `dojo_fieldrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_fieldrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding`
--

DROP TABLE IF EXISTS `dojo_finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `cwe` int(11) DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mitigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `impact` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `steps_to_reproduce` longtext COLLATE utf8mb4_unicode_ci,
  `severity_justification` longtext COLLATE utf8mb4_unicode_ci,
  `refs` longtext COLLATE utf8mb4_unicode_ci,
  `is_template` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `false_p` tinyint(1) NOT NULL,
  `duplicate` tinyint(1) NOT NULL,
  `out_of_scope` tinyint(1) NOT NULL,
  `under_review` tinyint(1) NOT NULL,
  `under_defect_review` tinyint(1) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `mitigated` datetime(6) DEFAULT NULL,
  `numerical_severity` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_reviewed` datetime(6) DEFAULT NULL,
  `line_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourcefilepath` longtext COLLATE utf8mb4_unicode_ci,
  `sourcefile` longtext COLLATE utf8mb4_unicode_ci,
  `param` longtext COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci,
  `hash_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `file_path` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `static_finding` tinyint(1) NOT NULL,
  `dynamic_finding` tinyint(1) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `scanner_confidence` int(11) DEFAULT NULL,
  `defect_review_requested_by_id` int(11) DEFAULT NULL,
  `duplicate_finding_id` int(11) DEFAULT NULL,
  `last_reviewed_by_id` int(11) DEFAULT NULL,
  `mitigated_by_id` int(11) DEFAULT NULL,
  `reporter_id` int(11) NOT NULL,
  `review_requested_by_id` int(11) DEFAULT NULL,
  `test_id` int(11) NOT NULL,
  `cve` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_Mitigated` tinyint(1) NOT NULL,
  `jira_change` datetime(6) DEFAULT NULL,
  `jira_creation` datetime(6) DEFAULT NULL,
  `sonarqube_issue_id` int(11) DEFAULT NULL,
  `nb_occurences` int(11) DEFAULT NULL,
  `sast_sink_object` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sast_source_file_path` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sast_source_line` int(11) DEFAULT NULL,
  `sast_source_object` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id_from_tool` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvssv3` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `dojo_findin_cve_dccd4b_idx` (`cve`),
  KEY `dojo_findin_false_p_aac0c7_idx` (`false_p`),
  KEY `dojo_findin_verifie_beb0fc_idx` (`verified`),
  KEY `dojo_findin_mitigat_946a13_idx` (`mitigated`),
  KEY `dojo_findin_active_d51077_idx` (`active`),
  KEY `dojo_findin_date_8e9143_idx` (`date`),
  KEY `dojo_findin_out_of__26856e_idx` (`out_of_scope`),
  KEY `dojo_findin_numeric_83d93b_idx` (`numerical_severity`),
  KEY `dojo_findin_title_78f900_idx` (`title`),
  KEY `dojo_findin_cwe_a8da22_idx` (`cwe`),
  KEY `dojo_findin_hash_co_09df6a_idx` (`hash_code`),
  KEY `dojo_findin_unique__f76d47_idx` (`unique_id_from_tool`),
  KEY `dojo_findin_line_fea329_idx` (`line`),
  KEY `dojo_findin_compone_920323_idx` (`component_name`),
  KEY `dojo_finding_defect_review_reques_430aded6_fk_auth_user` (`defect_review_requested_by_id`),
  KEY `dojo_finding_duplicate_finding_id_9ff391c5_fk_dojo_finding_id` (`duplicate_finding_id`),
  KEY `dojo_finding_last_reviewed_by_id_59206af6_fk_auth_user_id` (`last_reviewed_by_id`),
  KEY `dojo_finding_mitigated_by_id_8798e688_fk_auth_user_id` (`mitigated_by_id`),
  KEY `dojo_finding_reporter_id_dec2fe8c_fk_auth_user_id` (`reporter_id`),
  KEY `dojo_finding_review_requested_by_id_f9160cdd_fk_auth_user_id` (`review_requested_by_id`),
  KEY `dojo_finding_sonarqube_issue_id_48bb7cfd_fk_dojo_sona` (`sonarqube_issue_id`),
  KEY `dojo_finding_test_id_ef8ec5fc_fk_dojo_test_id` (`test_id`),
  KEY `dojo_findin_duplica_f60788_idx` (`duplicate`),
  KEY `dojo_findin_is_Miti_aaa533_idx` (`is_Mitigated`),
  CONSTRAINT `dojo_finding_defect_review_reques_430aded6_fk_auth_user` FOREIGN KEY (`defect_review_requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_finding_duplicate_finding_id_9ff391c5_fk_dojo_finding_id` FOREIGN KEY (`duplicate_finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_finding_last_reviewed_by_id_59206af6_fk_auth_user_id` FOREIGN KEY (`last_reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_finding_mitigated_by_id_8798e688_fk_auth_user_id` FOREIGN KEY (`mitigated_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_finding_reporter_id_dec2fe8c_fk_auth_user_id` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_finding_review_requested_by_id_f9160cdd_fk_auth_user_id` FOREIGN KEY (`review_requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_finding_sonarqube_issue_id_48bb7cfd_fk_dojo_sona` FOREIGN KEY (`sonarqube_issue_id`) REFERENCES `dojo_sonarqube_issue` (`id`),
  CONSTRAINT `dojo_finding_test_id_ef8ec5fc_fk_dojo_test_id` FOREIGN KEY (`test_id`) REFERENCES `dojo_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding`
--

LOCK TABLES `dojo_finding` WRITE;
/*!40000 ALTER TABLE `dojo_finding` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_endpoint_status`
--

DROP TABLE IF EXISTS `dojo_finding_endpoint_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_endpoint_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `endpoint_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_endpoint_st_finding_id_endpoint_stat_672a04ab_uniq` (`finding_id`,`endpoint_status_id`),
  KEY `dojo_finding_endpoin_endpoint_status_id_e2ab85e6_fk_dojo_endp` (`endpoint_status_id`),
  CONSTRAINT `dojo_finding_endpoin_endpoint_status_id_e2ab85e6_fk_dojo_endp` FOREIGN KEY (`endpoint_status_id`) REFERENCES `dojo_endpoint_status` (`id`),
  CONSTRAINT `dojo_finding_endpoin_finding_id_460c968c_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_endpoint_status`
--

LOCK TABLES `dojo_finding_endpoint_status` WRITE;
/*!40000 ALTER TABLE `dojo_finding_endpoint_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_endpoint_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_endpoints`
--

DROP TABLE IF EXISTS `dojo_finding_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_endpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `endpoint_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_endpoints_finding_id_endpoint_id_adf9ab95_uniq` (`finding_id`,`endpoint_id`),
  KEY `dojo_finding_endpoints_endpoint_id_1bac236e_fk_dojo_endpoint_id` (`endpoint_id`),
  CONSTRAINT `dojo_finding_endpoints_endpoint_id_1bac236e_fk_dojo_endpoint_id` FOREIGN KEY (`endpoint_id`) REFERENCES `dojo_endpoint` (`id`),
  CONSTRAINT `dojo_finding_endpoints_finding_id_774c79c3_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_endpoints`
--

LOCK TABLES `dojo_finding_endpoints` WRITE;
/*!40000 ALTER TABLE `dojo_finding_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_found_by`
--

DROP TABLE IF EXISTS `dojo_finding_found_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_found_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `test_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_found_by_finding_id_test_type_id_08c6f274_uniq` (`finding_id`,`test_type_id`),
  KEY `dojo_finding_found_by_test_type_id_92ea65b9_fk_dojo_test_type_id` (`test_type_id`),
  CONSTRAINT `dojo_finding_found_by_finding_id_7e19e13f_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_finding_found_by_test_type_id_92ea65b9_fk_dojo_test_type_id` FOREIGN KEY (`test_type_id`) REFERENCES `dojo_test_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_found_by`
--

LOCK TABLES `dojo_finding_found_by` WRITE;
/*!40000 ALTER TABLE `dojo_finding_found_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_found_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_images`
--

DROP TABLE IF EXISTS `dojo_finding_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `findingimage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_images_finding_id_findingimage_id_78aa351a_uniq` (`finding_id`,`findingimage_id`),
  KEY `dojo_finding_images_findingimage_id_fc8a23e4_fk_dojo_find` (`findingimage_id`),
  CONSTRAINT `dojo_finding_images_finding_id_7d81f16b_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_finding_images_findingimage_id_fc8a23e4_fk_dojo_find` FOREIGN KEY (`findingimage_id`) REFERENCES `dojo_findingimage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_images`
--

LOCK TABLES `dojo_finding_images` WRITE;
/*!40000 ALTER TABLE `dojo_finding_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_notes`
--

DROP TABLE IF EXISTS `dojo_finding_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_notes_finding_id_notes_id_c7e27224_uniq` (`finding_id`,`notes_id`),
  KEY `dojo_finding_notes_notes_id_7dc9c8d8_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_finding_notes_finding_id_701fd3e2_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_finding_notes_notes_id_7dc9c8d8_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_notes`
--

LOCK TABLES `dojo_finding_notes` WRITE;
/*!40000 ALTER TABLE `dojo_finding_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_reviewers`
--

DROP TABLE IF EXISTS `dojo_finding_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_reviewers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finding_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_finding_reviewers_finding_id_user_id_a76197a9_uniq` (`finding_id`,`user_id`),
  KEY `dojo_finding_reviewers_user_id_b7df5e76_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_finding_reviewers_finding_id_2586a449_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_finding_reviewers_user_id_b7df5e76_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_reviewers`
--

LOCK TABLES `dojo_finding_reviewers` WRITE;
/*!40000 ALTER TABLE `dojo_finding_reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_finding_template`
--

DROP TABLE IF EXISTS `dojo_finding_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_finding_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cwe` int(11) DEFAULT NULL,
  `severity` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `mitigation` longtext COLLATE utf8mb4_unicode_ci,
  `impact` longtext COLLATE utf8mb4_unicode_ci,
  `refs` longtext COLLATE utf8mb4_unicode_ci,
  `numerical_severity` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_match` tinyint(1) NOT NULL,
  `template_match_title` tinyint(1) NOT NULL,
  `cve` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used` datetime(6) DEFAULT NULL,
  `cvssv3` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_finding_template`
--

LOCK TABLES `dojo_finding_template` WRITE;
/*!40000 ALTER TABLE `dojo_finding_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_finding_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_findingimage`
--

DROP TABLE IF EXISTS `dojo_findingimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_findingimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_findingimage`
--

LOCK TABLES `dojo_findingimage` WRITE;
/*!40000 ALTER TABLE `dojo_findingimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_findingimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_findingimageaccesstoken`
--

DROP TABLE IF EXISTS `dojo_findingimageaccesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_findingimageaccesstoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_findingimageacc_image_id_4672c03b_fk_dojo_find` (`image_id`),
  KEY `dojo_findingimageaccesstoken_user_id_834e1fb9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_findingimageacc_image_id_4672c03b_fk_dojo_find` FOREIGN KEY (`image_id`) REFERENCES `dojo_findingimage` (`id`),
  CONSTRAINT `dojo_findingimageaccesstoken_user_id_834e1fb9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_findingimageaccesstoken`
--

LOCK TABLES `dojo_findingimageaccesstoken` WRITE;
/*!40000 ALTER TABLE `dojo_findingimageaccesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_findingimageaccesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_general_survey`
--

DROP TABLE IF EXISTS `dojo_general_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_general_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_responses` int(11) NOT NULL,
  `generated` datetime(6) DEFAULT NULL,
  `expiration` datetime(6) NOT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_general_survey_survey_id_b78be3ea_fk_dojo_enga` (`survey_id`),
  CONSTRAINT `dojo_general_survey_survey_id_b78be3ea_fk_dojo_enga` FOREIGN KEY (`survey_id`) REFERENCES `dojo_engagement_survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_general_survey`
--

LOCK TABLES `dojo_general_survey` WRITE;
/*!40000 ALTER TABLE `dojo_general_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_general_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_github_clone`
--

DROP TABLE IF EXISTS `dojo_github_clone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_github_clone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `github_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_clone_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_github_clone`
--

LOCK TABLES `dojo_github_clone` WRITE;
/*!40000 ALTER TABLE `dojo_github_clone` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_github_clone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_github_conf`
--

DROP TABLE IF EXISTS `dojo_github_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_github_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_name` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_github_conf`
--

LOCK TABLES `dojo_github_conf` WRITE;
/*!40000 ALTER TABLE `dojo_github_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_github_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_github_details_cache`
--

DROP TABLE IF EXISTS `dojo_github_details_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_github_details_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `github_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `github_resolution` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_github_details_cache`
--

LOCK TABLES `dojo_github_details_cache` WRITE;
/*!40000 ALTER TABLE `dojo_github_details_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_github_details_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_github_issue`
--

DROP TABLE IF EXISTS `dojo_github_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_github_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `finding_id` (`finding_id`),
  CONSTRAINT `dojo_github_issue_finding_id_1e1bc13b_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_github_issue`
--

LOCK TABLES `dojo_github_issue` WRITE;
/*!40000 ALTER TABLE `dojo_github_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_github_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_github_pkey`
--

DROP TABLE IF EXISTS `dojo_github_pkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_github_pkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `git_project` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `git_push_notes` tinyint(1) NOT NULL,
  `git_conf_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_github_pkey_product_id_f57940d0_fk_dojo_product_id` (`product_id`),
  KEY `dojo_github_pkey_git_conf_id_160cc5cb_fk_dojo_github_conf_id` (`git_conf_id`),
  CONSTRAINT `dojo_github_pkey_git_conf_id_160cc5cb_fk_dojo_github_conf_id` FOREIGN KEY (`git_conf_id`) REFERENCES `dojo_github_conf` (`id`),
  CONSTRAINT `dojo_github_pkey_product_id_f57940d0_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_github_pkey`
--

LOCK TABLES `dojo_github_pkey` WRITE;
/*!40000 ALTER TABLE `dojo_github_pkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_github_pkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_ipscan`
--

DROP TABLE IF EXISTS `dojo_ipscan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_ipscan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `services` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_ipscan_scan_id_78a5df0f_fk_dojo_scan_id` (`scan_id`),
  CONSTRAINT `dojo_ipscan_scan_id_78a5df0f_fk_dojo_scan_id` FOREIGN KEY (`scan_id`) REFERENCES `dojo_scan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_ipscan`
--

LOCK TABLES `dojo_ipscan` WRITE;
/*!40000 ALTER TABLE `dojo_ipscan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_ipscan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_jira_clone`
--

DROP TABLE IF EXISTS `dojo_jira_clone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_jira_clone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jira_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_clone_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_jira_clone`
--

LOCK TABLES `dojo_jira_clone` WRITE;
/*!40000 ALTER TABLE `dojo_jira_clone` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_jira_clone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_jira_conf`
--

DROP TABLE IF EXISTS `dojo_jira_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_jira_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_issue_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `epic_name_id` int(11) NOT NULL,
  `open_status_key` int(11) NOT NULL,
  `close_status_key` int(11) NOT NULL,
  `low_mapping_severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_mapping_severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `high_mapping_severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `critical_mapping_severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finding_text` longtext COLLATE utf8mb4_unicode_ci,
  `configuration_name` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_mapping_severity` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted_mapping_resolution` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `false_positive_mapping_resolution` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_jira_sla_notification` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_jira_conf`
--

LOCK TABLES `dojo_jira_conf` WRITE;
/*!40000 ALTER TABLE `dojo_jira_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_jira_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_jira_details_cache`
--

DROP TABLE IF EXISTS `dojo_jira_details_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_jira_details_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jira_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_resolution` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_jira_details_cache`
--

LOCK TABLES `dojo_jira_details_cache` WRITE;
/*!40000 ALTER TABLE `dojo_jira_details_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_jira_details_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_jira_issue`
--

DROP TABLE IF EXISTS `dojo_jira_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_jira_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jira_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engagement_id` int(11) DEFAULT NULL,
  `finding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `engagement_id` (`engagement_id`),
  UNIQUE KEY `finding_id` (`finding_id`),
  CONSTRAINT `dojo_jira_issue_engagement_id_7a0ee6d2_fk_dojo_engagement_id` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_jira_issue_finding_id_b39928b0_fk_dojo_finding_id` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_jira_issue`
--

LOCK TABLES `dojo_jira_issue` WRITE;
/*!40000 ALTER TABLE `dojo_jira_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_jira_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_jira_pkey`
--

DROP TABLE IF EXISTS `dojo_jira_pkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_jira_pkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `push_all_issues` tinyint(1) NOT NULL,
  `enable_engagement_epic_mapping` tinyint(1) NOT NULL,
  `push_notes` tinyint(1) NOT NULL,
  `conf_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_jira_sla_notification` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_jira_pkey_conf_id_771dd26b_fk_dojo_jira_conf_id` (`conf_id`),
  KEY `dojo_jira_pkey_product_id_8ee60ba5_fk_dojo_product_id` (`product_id`),
  CONSTRAINT `dojo_jira_pkey_conf_id_771dd26b_fk_dojo_jira_conf_id` FOREIGN KEY (`conf_id`) REFERENCES `dojo_jira_conf` (`id`),
  CONSTRAINT `dojo_jira_pkey_product_id_8ee60ba5_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_jira_pkey`
--

LOCK TABLES `dojo_jira_pkey` WRITE;
/*!40000 ALTER TABLE `dojo_jira_pkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_jira_pkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_language_type`
--

DROP TABLE IF EXISTS `dojo_language_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_language_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_language_type`
--

LOCK TABLES `dojo_language_type` WRITE;
/*!40000 ALTER TABLE `dojo_language_type` DISABLE KEYS */;
INSERT INTO `dojo_language_type` VALUES (1,'ActionScript','#F2D7D5'),(2,'Python','#006400'),(3,'Ruby','#cd5c5c'),(4,'ABAP','#F9EBEA'),(5,'Ada','#E6B0AA'),(6,'ADSO/IDSM','#D98880'),(7,'Agda','#CD6155'),(8,'AMPLE','#C0392B'),(9,'Ant','#A93226'),(10,'ANTLR Grammar','#641E16'),(11,'Apex Trigger','#FDEDEC'),(12,'Arduino Sketch','#FADBD8'),(13,'AsciiDoc','#F1948A'),(14,'ASP','#E74C3C'),(15,'ASP.NET','#CB4335'),(16,'AspectJ','#943126'),(17,'Assembly','#78281F'),(18,'AutoHotkey','#F5EEF8'),(19,'awk','#EBDEF0'),(20,'Blade','#D7BDE2'),(21,'Bourne Again Shell','#C39BD3'),(22,'Bourne Shell','#AF7AC5'),(23,'BrightScript','#884EA0'),(24,'C','#6C3483'),(25,'C Shell','#5B2C6F'),(26,'C#','#4A235A'),(27,'C++','#F4ECF7'),(28,'C/C++ Header','#E8DAEF'),(29,'CCS','#D2B4DE'),(30,'Chapel','#BB8FCE'),(31,'Clean','#8E44AD'),(32,'Clojure','#7D3C98'),(33,'ClojureC','#7D3C98'),(34,'ClojureScript','#5B2C6F'),(35,'CMake','#4A235A'),(36,'COBOL','#EAF2F8'),(37,'CoffeeScript','#D4E6F1'),(38,'ColdFusion','#D6EAF8'),(39,'ColdFusion CFScript','#A9CCE3'),(40,'Coq','#7FB3D5'),(41,'Crystal','#5499C7'),(42,'CSON','#1A5276'),(43,'CSS','#EBF5FB'),(44,'Cucumber','#D4E6F1'),(45,'CUDA','#7FB3D5'),(46,'Cython','#5499C7'),(47,'D','#2980B9'),(48,'DAL','#2471A3'),(49,'Dart','#1A5276'),(50,'diff','#154360'),(51,'DITA','#EBF5FB'),(52,'DOS Batch','#AED6F1'),(53,'Drools','#85C1E9'),(54,'DTD','#5DADE2'),(55,'dtrace','#2980B9'),(56,'ECPP','#2471A3'),(57,'EEx','#1F618D'),(58,'Elixir','#154360'),(59,'Elm','#EBF5FB'),(60,'ERB','#D6EAF8'),(61,'Erlang','#AED6F1'),(62,'Expect','#85C1E9'),(63,'F#','#5DADE2'),(64,'F# Script','#3498DB'),(65,'Fish Shell','#2E86C1'),(66,'Focus','#2874A6'),(67,'Forth','#1B4F72'),(68,'Fortran 77','#E8F8F5'),(69,'Fortran 90','#D1F2EB'),(70,'Freemarker Template','#'),(71,'GDScript','#A3E4D7'),(72,'Gencat NLS','#76D7C4'),(73,'Glade','#48C9B0'),(74,'GLSL','#1ABC9C'),(75,'Go','#17A589'),(76,'Grails','#148F77'),(77,'GraphQL','#117864'),(78,'Groovy','#0E6251'),(79,'Haml','#E8F6F3'),(80,'Handlebars','#A3E4D7'),(81,'Harbour','#76D7C4'),(82,'Haskell','#48C9B0'),(83,'Haxe','#1ABC9C'),(84,'HCL','#17A589'),(85,'HLSL','#148F77'),(86,'HTML','#117864'),(87,'IDL','#0E6251'),(88,'Idris','#0B5345'),(89,'InstallShield','#D4EFDF'),(90,'Java','#A9DFBF'),(91,'JavaScript','#7DCEA0'),(92,'JavaServer Faces','#52BE80'),(93,'JCL','#27AE60'),(94,'JSON','#229954'),(95,'JSP','#1E8449'),(97,'JSX','#196F3D'),(98,'Julia','#0B5345'),(99,'Kermit','#800000'),(100,'Korn Shell','#A52A2A'),(101,'Kotlin','#A0522D'),(102,'Lean','#8B4513'),(103,'LESS','#D2691E'),(104,'lex','#CD853F'),(105,'LFE','#DAA520'),(106,'liquid','#F4A460'),(107,'Lisp','#BC8F8F'),(108,'Literate Idris','#D2B48C'),(109,'LiveLink OScript','#DEB887'),(110,'Logtalk','#F5DEB3'),(111,'Lua','#FFDEAD'),(112,'m4','#FFE4C4'),(113,'make','#FFEBCD'),(114,'Mako','#FFF8DC'),(115,'Markdown','#2F4F4F'),(116,'Mathematica','#708090'),(117,'MATLAB','#778899'),(118,'Maven','#696969'),(119,'Modula3','#808080'),(120,'MSBuild script','#A9A9A9'),(121,'MUMPS','#FFE4E1'),(122,'Mustache','#FFF0F5'),(123,'MXML','#FAEBD7'),(124,'NAnt script','#FFFFF0'),(125,'NASTRAN DMAP','#FFFAF0'),(126,'Nemerle','#FDF5E6'),(127,'Nim','#F5F5DC'),(128,'Objective C','#cc00cc'),(129,'Objective C++','#ff9966'),(130,'OCaml','#F8F8FF'),(131,'OpenCL','#F0F8FF'),(132,'Oracle Forms','#F0FFFF'),(133,'Oracle PL/SQL','#F5FFFA'),(134,'Oracle Reports','#F0FFF0'),(135,'Pascal','#FFFAFA'),(136,'Pascal/Puppet','#C71585'),(137,'Patran Command Language','#DB7093'),(138,'Perl','#FF1493'),(139,'PHP','#FF69B4'),(140,'PHP/Pascal','#FFB6C1'),(141,'PL/I','#FFC0CB'),(143,'PL/M','#4B0082'),(144,'PowerBuilder','#800080'),(145,'PowerShell','#8B008B'),(146,'ProGuard','#9932CC'),(147,'Prolog','#9400D3'),(148,'Protocol Buffers','#8A2BE2'),(149,'Pug','#9370DB'),(150,'PureScript','#BA55D3'),(151,'QML','#FF00FF'),(152,'Qt','#FF00FF'),(153,'Qt Linguist','#DA70D6'),(154,'Qt Project','#EE82EE'),(155,'R','#DDA0DD'),(156,'Racket','#D8BFD8'),(157,'RAML','#E6E6FA'),(158,'RapydScript','#483D8B'),(159,'Razor','#6A5ACD'),(160,'Rexx','#7B68EE'),(161,'RobotFramework','#191970'),(162,'Ruby','#000080'),(163,'Ruby HTML','#00008B'),(164,'Rust','#0000CD'),(165,'SAS','#0000FF'),(166,'Sass','#4169E1'),(167,'Scala','#4682B4'),(168,'Scheme','#6495ED'),(169,'sed','#1E90FF'),(170,'SKILL','#B0C4DE'),(171,'SKILL++','#00BFFF'),(172,'Skylark','#87CEEB'),(173,'Slice','#87CEFA'),(174,'Slim','#ADD8E6'),(175,'Smalltalk','#B0E0E6'),(176,'Smarty','#008080'),(177,'Softbridge Basic','#008B8B'),(179,'Solidity','#5F9EA0'),(180,'Specman e','#20B2AA'),(181,'SQL','#00CED1'),(182,'SQL Data','#48D1CC'),(183,'SQL Stored Procedure','#40E0D0'),(184,'Standard ML','#AFEEEE'),(185,'Stata','#66CDAA'),(186,'Stylus','#7FFFD4'),(187,'Swift','#00FFFF'),(188,'SWIG','#00FFFF'),(189,'Tcl/Tk','#E0FFFF'),(190,'Teamcenter met','#6B8E23'),(191,'Teamcenter mth','#556B2F'),(192,'TeX','#808000'),(193,'TITAN Project File Information','#2E8B57'),(194,'Titanium Style Sheet','#3CB371'),(195,'TOML','#8FBC8F'),(196,'TTCN','#00FA9A'),(197,'Twig','#006400'),(198,'TypeScript','#228B22'),(199,'Unity-Prefab','#00FF00'),(200,'Vala','#32CD32'),(201,'Vala Header','#FFFF00'),(202,'Velocity Template Language','#BDB76B'),(203,'Verilog-SystemVerilog','#F0E68C'),(204,'VHDL','#EEE8AA'),(205,'vim script','#FFDAB9'),(206,'Visual Basic','#FFE4B5'),(207,'Visual Fox Pro','#FFEFD5'),(208,'Visualforce Component','#FAFAD2'),(209,'Visualforce Page','#FFFACD'),(210,'Vuejs Component','#FFFFE0'),(211,'Windows Message File','#FF8C00'),(212,'Windows Module Definition','#FFA500'),(213,'Windows Resource File','#FFD700'),(214,'WiX include','#FF4500'),(215,'WiX source','#FF6347'),(216,'WiX string localization','#FF7F50'),(217,'XAML','#8B0000'),(218,'xBase','#FF0000'),(219,'xBase Header','#B22222'),(220,'XHTML','#DC143C'),(221,'XMI','#CD5C5C'),(222,'XML','#F08080'),(223,'XQuery','#E9967A'),(224,'XSD','#FA8072'),(225,'XSLT','#FFA07A'),(226,'yacc','#f0ffff'),(227,'YAML','#c1cdcd'),(228,'zsh','#8b7d6b');
/*!40000 ALTER TABLE `dojo_language_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_languages`
--

DROP TABLE IF EXISTS `dojo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `files` int(11) DEFAULT NULL,
  `blank` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `language_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_languages_language_id_product_id_c04ef155_uniq` (`language_id`,`product_id`),
  KEY `dojo_languages_product_id_cb09d7b2_fk_dojo_product_id` (`product_id`),
  KEY `dojo_languages_user_id_6d43f9ad_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_languages_language_id_86aa174b_fk_dojo_language_type_id` FOREIGN KEY (`language_id`) REFERENCES `dojo_language_type` (`id`),
  CONSTRAINT `dojo_languages_product_id_cb09d7b2_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_languages_user_id_6d43f9ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_languages`
--

LOCK TABLES `dojo_languages` WRITE;
/*!40000 ALTER TABLE `dojo_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_network_locations`
--

DROP TABLE IF EXISTS `dojo_network_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_network_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_network_locations`
--

LOCK TABLES `dojo_network_locations` WRITE;
/*!40000 ALTER TABLE `dojo_network_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_network_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_note_type`
--

DROP TABLE IF EXISTS `dojo_note_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_note_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_single` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_note_type`
--

LOCK TABLES `dojo_note_type` WRITE;
/*!40000 ALTER TABLE `dojo_note_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_note_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_notehistory`
--

DROP TABLE IF EXISTS `dojo_notehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_notehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  `current_editor_id` int(11) DEFAULT NULL,
  `note_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_notehistory_current_editor_id_e42c528b_fk_auth_user_id` (`current_editor_id`),
  KEY `dojo_notehistory_note_type_id_068f6e41_fk_dojo_note_type_id` (`note_type_id`),
  CONSTRAINT `dojo_notehistory_current_editor_id_e42c528b_fk_auth_user_id` FOREIGN KEY (`current_editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_notehistory_note_type_id_068f6e41_fk_dojo_note_type_id` FOREIGN KEY (`note_type_id`) REFERENCES `dojo_note_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_notehistory`
--

LOCK TABLES `dojo_notehistory` WRITE;
/*!40000 ALTER TABLE `dojo_notehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_notehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_notes`
--

DROP TABLE IF EXISTS `dojo_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `edit_time` datetime(6),
  `edited` tinyint(1) NOT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `private` tinyint(1) NOT NULL,
  `note_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_notes_author_id_58e606cd_fk_auth_user_id` (`author_id`),
  KEY `dojo_notes_editor_id_f9df331b_fk_auth_user_id` (`editor_id`),
  KEY `dojo_notes_note_type_id_fa51439f_fk_dojo_note_type_id` (`note_type_id`),
  CONSTRAINT `dojo_notes_author_id_58e606cd_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_notes_editor_id_f9df331b_fk_auth_user_id` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_notes_note_type_id_fa51439f_fk_dojo_note_type_id` FOREIGN KEY (`note_type_id`) REFERENCES `dojo_note_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_notes`
--

LOCK TABLES `dojo_notes` WRITE;
/*!40000 ALTER TABLE `dojo_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_notes_history`
--

DROP TABLE IF EXISTS `dojo_notes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_notes_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes_id` int(11) NOT NULL,
  `notehistory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_notes_history_notes_id_notehistory_id_e60a3e40_uniq` (`notes_id`,`notehistory_id`),
  KEY `dojo_notes_history_notehistory_id_595577dd_fk_dojo_note` (`notehistory_id`),
  CONSTRAINT `dojo_notes_history_notehistory_id_595577dd_fk_dojo_note` FOREIGN KEY (`notehistory_id`) REFERENCES `dojo_notehistory` (`id`),
  CONSTRAINT `dojo_notes_history_notes_id_14cb3933_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_notes_history`
--

LOCK TABLES `dojo_notes_history` WRITE;
/*!40000 ALTER TABLE `dojo_notes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_notes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_notifications`
--

DROP TABLE IF EXISTS `dojo_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_added` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engagement_added` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_added` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scan_added` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_created` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jira_update` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upcoming_engagement` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stale_engagement` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_close_engagement` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_mentioned` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_review` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_requested` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sla_breach` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notifications_user_product` (`user_id`,`product_id`),
  KEY `dojo_notifications_product_id_5c8ed571_fk_dojo_product_id` (`product_id`),
  CONSTRAINT `dojo_notifications_product_id_5c8ed571_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_notifications_user_id_cc05e2b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_notifications`
--

LOCK TABLES `dojo_notifications` WRITE;
/*!40000 ALTER TABLE `dojo_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_objects`
--

DROP TABLE IF EXISTS `dojo_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artifact` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_objects_product_id_e42ff3d7_fk_dojo_product_id` (`product_id`),
  KEY `dojo_objects_review_status_id_5c2837fd_fk_dojo_objects_review_id` (`review_status_id`),
  CONSTRAINT `dojo_objects_product_id_e42ff3d7_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_objects_review_status_id_5c2837fd_fk_dojo_objects_review_id` FOREIGN KEY (`review_status_id`) REFERENCES `dojo_objects_review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_objects`
--

LOCK TABLES `dojo_objects` WRITE;
/*!40000 ALTER TABLE `dojo_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_objects_engagement`
--

DROP TABLE IF EXISTS `dojo_objects_engagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_objects_engagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `build_id` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `full_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentUnchanged` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engagement_id` int(11) NOT NULL,
  `object_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_objects_engagem_engagement_id_b6632ca9_fk_dojo_enga` (`engagement_id`),
  KEY `dojo_objects_engagement_object_id_id_7fa1e24f_fk_dojo_objects_id` (`object_id_id`),
  CONSTRAINT `dojo_objects_engagem_engagement_id_b6632ca9_fk_dojo_enga` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_objects_engagement_object_id_id_7fa1e24f_fk_dojo_objects_id` FOREIGN KEY (`object_id_id`) REFERENCES `dojo_objects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_objects_engagement`
--

LOCK TABLES `dojo_objects_engagement` WRITE;
/*!40000 ALTER TABLE `dojo_objects_engagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_objects_engagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_objects_review`
--

DROP TABLE IF EXISTS `dojo_objects_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_objects_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_objects_review`
--

LOCK TABLES `dojo_objects_review` WRITE;
/*!40000 ALTER TABLE `dojo_objects_review` DISABLE KEYS */;
INSERT INTO `dojo_objects_review` VALUES (1,'Untracked','2018-03-16 15:21:36.057000'),(2,'Manual Code Review Required','2018-03-17 14:21:58.541000'),(3,'Manual Code Review and Create Test','2018-03-20 20:50:31.509000');
/*!40000 ALTER TABLE `dojo_objects_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product`
--

DROP TABLE IF EXISTS `dojo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_manager` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tech_contact` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `tid` int(11) NOT NULL,
  `prod_numeric_grade` int(11) DEFAULT NULL,
  `business_criticality` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lifecycle` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_records` int(10) unsigned DEFAULT NULL,
  `revenue` decimal(15,2) DEFAULT NULL,
  `external_audience` tinyint(1) NOT NULL,
  `internet_accessible` tinyint(1) NOT NULL,
  `prod_type_id` int(11) NOT NULL,
  `product_manager_id` int(11) DEFAULT NULL,
  `team_manager_id` int(11) DEFAULT NULL,
  `technical_contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dojo_product_product_manager_id_c901fc76_fk_auth_user_id` (`product_manager_id`),
  KEY `dojo_product_team_manager_id_bc210ec1_fk_auth_user_id` (`team_manager_id`),
  KEY `dojo_product_technical_contact_id_b85df8dd_fk_auth_user_id` (`technical_contact_id`),
  KEY `dojo_product_prod_type_id_a20da098_fk_dojo_product_type_id` (`prod_type_id`),
  CONSTRAINT `dojo_product_prod_type_id_a20da098_fk_dojo_product_type_id` FOREIGN KEY (`prod_type_id`) REFERENCES `dojo_product_type` (`id`),
  CONSTRAINT `dojo_product_product_manager_id_c901fc76_fk_auth_user_id` FOREIGN KEY (`product_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_product_team_manager_id_bc210ec1_fk_auth_user_id` FOREIGN KEY (`team_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_product_technical_contact_id_b85df8dd_fk_auth_user_id` FOREIGN KEY (`technical_contact_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product`
--

LOCK TABLES `dojo_product` WRITE;
/*!40000 ALTER TABLE `dojo_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product_authorized_users`
--

DROP TABLE IF EXISTS `dojo_product_authorized_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product_authorized_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_product_authorized_users_product_id_user_id_c0f6e8b1_uniq` (`product_id`,`user_id`),
  KEY `dojo_product_authorized_users_user_id_befb02f3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_product_authori_product_id_ffcb106e_fk_dojo_prod` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_product_authorized_users_user_id_befb02f3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product_authorized_users`
--

LOCK TABLES `dojo_product_authorized_users` WRITE;
/*!40000 ALTER TABLE `dojo_product_authorized_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_product_authorized_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product_line`
--

DROP TABLE IF EXISTS `dojo_product_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product_line`
--

LOCK TABLES `dojo_product_line` WRITE;
/*!40000 ALTER TABLE `dojo_product_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_product_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product_regulations`
--

DROP TABLE IF EXISTS `dojo_product_regulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product_regulations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `regulation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_product_regulations_product_id_regulation_id_5e720195_uniq` (`product_id`,`regulation_id`),
  KEY `dojo_product_regulat_regulation_id_9db67b7d_fk_dojo_regu` (`regulation_id`),
  CONSTRAINT `dojo_product_regulat_regulation_id_9db67b7d_fk_dojo_regu` FOREIGN KEY (`regulation_id`) REFERENCES `dojo_regulation` (`id`),
  CONSTRAINT `dojo_product_regulations_product_id_d3876323_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product_regulations`
--

LOCK TABLES `dojo_product_regulations` WRITE;
/*!40000 ALTER TABLE `dojo_product_regulations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_product_regulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product_type`
--

DROP TABLE IF EXISTS `dojo_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `critical_product` tinyint(1) NOT NULL,
  `key_product` tinyint(1) NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product_type`
--

LOCK TABLES `dojo_product_type` WRITE;
/*!40000 ALTER TABLE `dojo_product_type` DISABLE KEYS */;
INSERT INTO `dojo_product_type` VALUES (1,'Research and Development',0,0,NULL,NULL);
/*!40000 ALTER TABLE `dojo_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_product_type_authorized_users`
--

DROP TABLE IF EXISTS `dojo_product_type_authorized_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_product_type_authorized_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_product_type_author_product_type_id_user_id_5e40a8e2_uniq` (`product_type_id`,`user_id`),
  KEY `dojo_product_type_au_user_id_1e2f0f0a_fk_auth_user` (`user_id`),
  CONSTRAINT `dojo_product_type_au_product_type_id_dba7ff5f_fk_dojo_prod` FOREIGN KEY (`product_type_id`) REFERENCES `dojo_product_type` (`id`),
  CONSTRAINT `dojo_product_type_au_user_id_1e2f0f0a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_product_type_authorized_users`
--

LOCK TABLES `dojo_product_type_authorized_users` WRITE;
/*!40000 ALTER TABLE `dojo_product_type_authorized_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_product_type_authorized_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_question`
--

DROP TABLE IF EXISTS `dojo_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `optional` tinyint(1) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_question_polymorphic_ctype_id_73e9e2c1_fk_django_co` (`polymorphic_ctype_id`),
  CONSTRAINT `dojo_question_polymorphic_ctype_id_73e9e2c1_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_question`
--

LOCK TABLES `dojo_question` WRITE;
/*!40000 ALTER TABLE `dojo_question` DISABLE KEYS */;
INSERT INTO `dojo_question` VALUES (3,'2015-03-30 19:31:16.000000','2015-03-30 19:31:16.000000',1,0,'What kind of infrastructure will you be using (cloud servers, load balancers, dedicated hardware, etc)?',86),(4,'2015-03-30 19:31:30.000000','2015-03-30 19:31:30.000000',1,0,'Will there be a staging/pre-prod environment?',86),(5,'2015-03-30 19:31:45.000000','2015-03-30 19:31:45.000000',1,0,'How many servers/regions will be used for production?',86),(6,'2015-03-30 19:52:57.000000','2015-03-30 19:52:57.000000',1,0,'What kind of OS and other software will these servers run?',86),(7,'2015-03-30 19:53:37.000000','2015-03-30 19:53:37.000000',1,0,'Where does the product live? (Public cloud, private cloud, dedicated, etc.)',86),(8,'2015-03-30 19:54:20.000000','2015-03-30 19:54:20.000000',1,0,'If public cloud, are regions and environments separated into different accounts? Who manages the accounts?',86),(9,'2015-03-30 19:54:34.000000','2015-03-30 19:54:34.000000',1,0,'How will your servers talk to one another, if at all?',86),(10,'2015-03-30 19:54:48.000000','2015-03-30 19:54:48.000000',1,0,'How will you manage this infrastructure?',86),(11,'2015-03-30 19:55:00.000000','2015-03-30 19:55:00.000000',1,0,'What is your patching schedule?',86),(12,'2015-03-30 19:55:20.000000','2015-03-30 19:55:20.000000',1,0,'How will admin users (e.g., Ops) authenticate to the servers (LDAP based login, SSH Keys, local access)?',86),(13,'2015-03-30 19:56:24.000000','2015-03-30 19:56:24.000000',1,0,'What components do you have as part of your product (Web UI, REST API, command line app, mobile app, etc.)?',86),(14,'2015-03-30 19:57:22.000000','2015-03-30 19:57:22.000000',1,0,'What access control limitations are in place?',86),(15,'2015-03-30 19:57:34.000000','2015-03-30 19:57:34.000000',1,0,'How is access control enforced? (IP whitelists, role-based access controls, etc.)',86),(16,'2015-03-30 19:57:55.000000','2015-03-30 19:57:55.000000',1,0,'What Identity roles (if any) are utilized by the app and how many people are estimated to be inside those groups?',86),(17,'2015-03-30 19:58:36.000000','2015-03-30 19:58:36.000000',1,0,'What is the criteria for being added to these groups?  Are they audited and auto-purged?',86),(18,'2015-03-30 20:00:35.000000','2015-03-30 20:00:35.000000',1,0,'Are you logging all sensitive user actions, such as user registration, permission modification, login attempts, admin functions, etc.?',86),(19,'2015-03-30 20:00:46.000000','2015-03-30 20:00:46.000000',1,0,'What identifying information are you logging?',86),(20,'2015-03-30 20:00:58.000000','2015-03-30 20:00:58.000000',1,0,'Where are these logs stored?',86),(21,'2015-03-30 20:02:18.000000','2015-03-30 20:02:18.000000',1,0,'How does an end user interact with the product? Do they visit it in their browser, use a proxy or a special CLI tool, log in through a terminal server, etc?',86),(22,'2015-03-30 20:02:32.000000','2015-03-30 20:02:32.000000',1,0,'How public-facing is this product? (customer tool, open source project, etc.)',86),(23,'2015-03-30 20:02:46.000000','2015-03-30 20:02:46.000000',1,0,'When does information cross a privacy boundary within your application flow? For instance public cloud -> private cloud, public internet -> public cloud, etc.',86),(24,'2015-03-30 20:02:57.000000','2015-03-30 20:02:57.000000',1,0,'What services/products does your product consume? What services/products consume it?',86),(25,'2015-03-30 20:04:46.000000','2015-03-30 20:04:46.000000',1,0,'What customer or corporate information does your product consume?',86),(26,'2015-03-30 20:05:10.000000','2015-03-30 20:05:10.000000',1,0,'What information does the product store?',86),(27,'2015-03-30 20:05:22.000000','2015-03-30 20:05:22.000000',1,0,'Where, how, and for how long is it stored?',86),(28,'2015-03-30 20:05:32.000000','2015-03-30 20:05:32.000000',1,0,'Is encryption / hashing used where appropriate?',86),(29,'2015-03-30 20:05:43.000000','2015-03-30 20:05:43.000000',1,0,'Are you rolling your own identification system? If so, have you considered integrating with SSO instead?',86),(30,'2015-03-30 20:05:57.000000','2015-03-30 20:05:57.000000',1,0,'What information does the product send to the user?',86),(31,'2015-03-30 20:06:15.000000','2015-03-30 20:06:15.000000',1,0,'If you’re managing passwords or keys across multiple servers/endpoints, where and how is that information stored?',86),(32,'2015-03-30 20:08:08.000000','2015-03-30 20:08:08.000000',1,0,'What third party tools and libraries are you using? Please provide a package dump as well (apt, pip, bower, etc.)',86),(33,'2015-03-30 20:08:19.000000','2015-03-30 20:08:19.000000',1,0,'What ports should be open on each node, and what services do they expose?',86),(34,'2015-03-30 20:08:30.000000','2015-03-30 20:08:30.000000',1,0,'What service accounts are you utilizing, and what roles do they have?',86),(35,'2015-03-30 20:08:43.000000','2015-03-30 20:08:43.000000',1,0,'What DNS entries do you have set up? (Most importantly, public-facing systems)',86),(36,'2015-03-30 20:08:54.000000','2015-03-30 20:08:54.000000',1,0,'What type of monitoring are you doing? (IDS, cloud monitoring, custom log parsing script, etc.)',86),(37,'2015-03-30 20:10:15.000000','2015-03-30 20:10:15.000000',1,0,'List the IPs for all infrastructure utilized for the environment in question.',86),(38,'2015-03-30 20:10:30.000000','2015-03-30 20:10:30.000000',1,0,'List of endpoints and documentation for any APIs created by your product.',86),(39,'2015-03-30 20:10:42.000000','2015-03-30 20:10:42.000000',1,0,'Locations of any web UIs or other important URLs',86),(40,'2015-03-30 20:10:52.000000','2015-03-30 20:10:52.000000',1,0,'List of any service accounts or other access requests relevant to your product',86),(41,'2015-03-30 20:11:04.000000','2015-03-30 20:11:04.000000',1,0,'The contact information of QE who are testing the products.',86),(42,'2015-03-30 20:11:17.000000','2015-03-30 20:11:17.000000',1,0,'The list of people that should be notified for our security testing.',86),(43,'2015-03-30 20:11:30.000000','2015-03-30 20:11:30.000000',1,0,'Any security testing that we should not run, and/or times when you would prefer we not test.',86);
/*!40000 ALTER TABLE `dojo_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_regulation`
--

DROP TABLE IF EXISTS `dojo_regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_regulation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronym` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurisdiction` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acronym` (`acronym`),
  UNIQUE KEY `dojo_regulation_name_fb736107_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_regulation`
--

LOCK TABLES `dojo_regulation` WRITE;
/*!40000 ALTER TABLE `dojo_regulation` DISABLE KEYS */;
INSERT INTO `dojo_regulation` VALUES (1,'Payment Card Industry Data Security Standard','PCI DSS','finance','United States','The Payment Card Industry Data Security Standard (PCI DSS) is a proprietary information security standard for organizations that handle branded credit cards from the major card schemes including Visa, MasterCard, American Express, Discover, and JCB.','http://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard'),(2,'Health Insurance Portability and Accountability Act','HIPAA','medical','United States','The Health Insurance Portability and Accountability Act of 1996 (HIPAA) was enacted by the United States Congress and signed by President Bill Clinton in 1996. It has been known as the Kennedy–Kassebaum Act or Kassebaum-Kennedy Act after two of its leading sponsors. Title I of HIPAA protects health insurance coverage for workers and their families when they change or lose their jobs. Title II of HIPAA, known as the Administrative Simplification (AS) provisions, requires the establishment of national standards for electronic health care transactions and national identifiers for providers, health insurance plans, and employers.','http://en.wikipedia.org/wiki/Health_Insurance_Portability_and_Accountability_Act'),(3,'Family Educational Rights and Privacy Act','FERPA','education','United States','The Family Educational Rights and Privacy Act of 1974 (FERPA) is a United States federal law that gives parents access to their child\'s education records, an opportunity to seek to have the records amended, and some control over the disclosure of information from the records. With several exceptions, schools must have a student\'s consent prior to the disclosure of education records after that student is 18 years old. The law applies only to educational agencies and institutions that receive funding under a program administered by the U.S. Department of Education. Other regulations under this act, effective starting January 3, 2012, allow for greater disclosures of personal and directory student identifying information and regulate student IDs and e-mail addresses.','http://en.wikipedia.org/wiki/Family_Educational_Rights_and_Privacy_Act'),(4,'Sarbanes–Oxley Act','SOX','finance','United States','The Sarbanes–Oxley Act of 2002 (SOX) is a United States federal law that set new or enhanced standards for all U.S. public company boards, management and public accounting firms. There are also a number of provisions of the Act that also apply to privately held companies, for example the willful destruction of evidence to impede a Federal investigation.','http://en.wikipedia.org/wiki/Sarbanes%E2%80%93Oxley_Act'),(5,'Gramm–Leach–Bliley Act','GLBA','finance','United States','The Gramm–Leach–Bliley Act (GLBA) is an act of the 106th United States Congress. It repealed part of the Glass–Steagall Act of 1933, removing barriers in the market among banking companies, securities companies and insurance companies that prohibited any one institution from acting as any combination of an investment bank, a commercial bank, and an insurance company. With the bipartisan passage of the Gramm–Leach–Bliley Act, commercial banks, investment banks, securities firms, and insurance companies were allowed to consolidate. Furthermore, it failed to give to the SEC or any other financial regulatory agency the authority to regulate large investment bank holding companies.','http://en.wikipedia.org/wiki/Gramm%E2%80%93Leach%E2%80%93Bliley_Act'),(6,'Personal Information Protection and Electronic Documents Act','PIPEDA','privacy','Canada','The Personal Information Protection and Electronic Documents Act (PIPEDA) is a Canadian law relating to data privacy. It governs how private sector organizations collect, use and disclose personal information in the course of commercial business. In addition, the Act contains various provisions to facilitate the use of electronic documents. PIPEDA became law on 13 April 2000 to promote consumer trust in electronic commerce. The act was also intended to reassure the European Union that the Canadian privacy law was adequate to protect the personal information of European citizens.','http://en.wikipedia.org/wiki/Personal_Information_Protection_and_Electronic_Documents_Act'),(7,'Data Protection Act 1998','DPA','privacy','United Kingdom','The Data Protection Act 1998 (DPA) is an Act of Parliament of the United Kingdom of Great Britain and Northern Ireland which defines UK law on the processing of data on identifiable living people. It is the main piece of legislation that governs the protection of personal data in the UK. Although the Act itself does not mention privacy, it was enacted to bring British law into line with the EU data protection directive of 1995 which required Member States to protect people\'s fundamental rights and freedoms and in particular their right to privacy with respect to the processing of personal data. In practice it provides a way for individuals to control information about themselves. Most of the Act does not apply to domestic use, for example keeping a personal address book. Anyone holding personal data for other purposes is legally obliged to comply with this Act, subject to some exemptions. The Act defines eight data protection principles. It also requires companies and individuals to keep personal information to themselves.','http://en.wikipedia.org/wiki/Data_Protection_Act_1998'),(8,'Children\'s Online Privacy Protection Act','COPPA','privacy','United States','The Children\'s Online Privacy Protection Act of 1998 (COPPA) is a United States federal law that applies to the online collection of personal information by persons or entities under U.S. jurisdiction from children under 13 years of age. It details what a website operator must include in a privacy policy, when and how to seek verifiable consent from a parent or guardian, and what responsibilities an operator has to protect children\'s privacy and safety online including restrictions on the marketing to those under 13. While children under 13 can legally give out personal information with their parents\' permission, many websites disallow underage children from using their services altogether due to the amount of cash and work involved in the law compliance.','http://en.wikipedia.org/wiki/Children%27s_Online_Privacy_Protection_Act'),(9,'California Security Breach Information Act','CA SB-1386','privacy','United States, California','In the United States, the California Security Breach Information Act (SB-1386) is a California state law requiring organizations that maintain personal information about individuals to inform those individuals if the security of their information is compromised. The Act stipulates that if there\'s a security breach of a database containing personal data, the responsible organization must notify each individual for whom it maintained information. The Act, which went into effect July 1, 2003, was created to help stem the increasing incidence of identity theft.','http://en.wikipedia.org/wiki/California_S.B._1386'),(10,'California Online Privacy Protection Act','OPPA','privacy','United States, California','The California Online Privacy Protection Act of 2003 (OPPA), effective as of July 1, 2004, is a California State Law. According to this law, operators of commercial websites that collect Personally identifiable information from California\'s residents are required to conspicuously post and comply with a privacy policy that meets certain requirements.','http://en.wikipedia.org/wiki/Online_Privacy_Protection_Act'),(11,'Data Protection Directive','Directive 95/46/EC','privacy','European Union','The Data Protection Directive (officially Directive 95/46/EC on the protection of individuals with regard to the processing of personal data and on the free movement of such data) is a European Union directive adopted in 1995 which regulates the processing of personal data within the European Union. It is an important component of EU privacy and human rights law.','http://en.wikipedia.org/wiki/Data_Protection_Directive'),(12,'Directive on Privacy and Electronic Communications','Directive 2002/58/EC','privacy','European Union','Directive 2002/58 on Privacy and Electronic Communications, otherwise known as E-Privacy Directive, is an EU directive on data protection and privacy in the digital age. It presents a continuation of earlier efforts, most directly the Data Protection Directive. It deals with the regulation of a number of important issues such as confidentiality of information, treatment of traffic data, spam and cookies. This Directive has been amended by Directive 2009/136, which introduces several changes, especially in what concerns cookies, that are now subject to prior consent.','http://en.wikipedia.org/wiki/Directive_on_Privacy_and_Electronic_Communications'),(13,'General Data Protection Regulation','GDPR','privacy','EU & EU Data Extra-Territorial Applicability','The General Data Protection Regulation (GDPR) (EU) 2016/679 is a regulation in EU law on data protection and privacy for all individuals within the European Union (EU) and the European Economic Area (EEA). It also addresses the export of personal data outside the EU and EEA. The GDPR aims primarily to give control to citizens and residents over their personal data and to simplify the regulatory environment for international business by unifying the regulation within the EU.\r\n\r\nSuperseding the Data Protection Directive 95/46/EC, the regulation contains provisions and requirements pertaining to the processing of personally identifiable information of data subjects inside the European Union, and applies to all enterprises, regardless of location, that are doing business with the European Economic Area. Business processes that handle personal data must be built with data protection by design and by default, meaning that personal data must be stored using pseudonymisation or full anonymisation, and use the highest-possible privacy settings by default, so that the data is not available publicly without explicit consent, and cannot be used to identify a subject without additional information stored separately. No personal data may be processed unless it is done under a lawful basis specified by the regulation, or if the data controller or processor has received explicit, opt-in consent from the data\'s owner. The data owner has the right to revoke this permission at any time.','https://www.eugdpr.org/');
/*!40000 ALTER TABLE `dojo_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_report`
--

DROP TABLE IF EXISTS `dojo_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `done_datetime` datetime(6) DEFAULT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_report_requester_id_54302db3_fk_auth_user_id` (`requester_id`),
  CONSTRAINT `dojo_report_requester_id_54302db3_fk_auth_user_id` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_report`
--

LOCK TABLES `dojo_report` WRITE;
/*!40000 ALTER TABLE `dojo_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_report_type`
--

DROP TABLE IF EXISTS `dojo_report_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_report_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_report_type`
--

LOCK TABLES `dojo_report_type` WRITE;
/*!40000 ALTER TABLE `dojo_report_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_report_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_risk_acceptance`
--

DROP TABLE IF EXISTS `dojo_risk_acceptance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_risk_acceptance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `accepted_by` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compensating_control` longtext COLLATE utf8mb4_unicode_ci,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_risk_acceptance_owner_id_a9a7a3bf_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `dojo_risk_acceptance_owner_id_a9a7a3bf_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_risk_acceptance`
--

LOCK TABLES `dojo_risk_acceptance` WRITE;
/*!40000 ALTER TABLE `dojo_risk_acceptance` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_risk_acceptance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_risk_acceptance_accepted_findings`
--

DROP TABLE IF EXISTS `dojo_risk_acceptance_accepted_findings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_risk_acceptance_accepted_findings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_acceptance_id` int(11) NOT NULL,
  `finding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_risk_acceptance_acc_risk_acceptance_id_findi_652baae0_uniq` (`risk_acceptance_id`,`finding_id`),
  KEY `dojo_risk_acceptance_finding_id_4dee47f3_fk_dojo_find` (`finding_id`),
  CONSTRAINT `dojo_risk_acceptance_finding_id_4dee47f3_fk_dojo_find` FOREIGN KEY (`finding_id`) REFERENCES `dojo_finding` (`id`),
  CONSTRAINT `dojo_risk_acceptance_risk_acceptance_id_9be38374_fk_dojo_risk` FOREIGN KEY (`risk_acceptance_id`) REFERENCES `dojo_risk_acceptance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_risk_acceptance_accepted_findings`
--

LOCK TABLES `dojo_risk_acceptance_accepted_findings` WRITE;
/*!40000 ALTER TABLE `dojo_risk_acceptance_accepted_findings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_risk_acceptance_accepted_findings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_risk_acceptance_notes`
--

DROP TABLE IF EXISTS `dojo_risk_acceptance_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_risk_acceptance_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_acceptance_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_risk_acceptance_not_risk_acceptance_id_notes_cf36b7d8_uniq` (`risk_acceptance_id`,`notes_id`),
  KEY `dojo_risk_acceptance_notes_notes_id_670b5212_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_risk_acceptance_notes_notes_id_670b5212_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`),
  CONSTRAINT `dojo_risk_acceptance_risk_acceptance_id_4c8801d7_fk_dojo_risk` FOREIGN KEY (`risk_acceptance_id`) REFERENCES `dojo_risk_acceptance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_risk_acceptance_notes`
--

LOCK TABLES `dojo_risk_acceptance_notes` WRITE;
/*!40000 ALTER TABLE `dojo_risk_acceptance_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_risk_acceptance_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_rule`
--

DROP TABLE IF EXISTS `dojo_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_object` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applies_to` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied_field` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_rule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_rule_parent_rule_id_a702812f_fk_dojo_rule_id` (`parent_rule_id`),
  CONSTRAINT `dojo_rule_parent_rule_id_a702812f_fk_dojo_rule_id` FOREIGN KEY (`parent_rule_id`) REFERENCES `dojo_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_rule`
--

LOCK TABLES `dojo_rule` WRITE;
/*!40000 ALTER TABLE `dojo_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_rule_child_rules`
--

DROP TABLE IF EXISTS `dojo_rule_child_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_rule_child_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_rule_id` int(11) NOT NULL,
  `to_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_rule_child_rules_from_rule_id_to_rule_id_3e2849fe_uniq` (`from_rule_id`,`to_rule_id`),
  KEY `dojo_rule_child_rules_to_rule_id_fb42d09d_fk_dojo_rule_id` (`to_rule_id`),
  CONSTRAINT `dojo_rule_child_rules_from_rule_id_03c79c3b_fk_dojo_rule_id` FOREIGN KEY (`from_rule_id`) REFERENCES `dojo_rule` (`id`),
  CONSTRAINT `dojo_rule_child_rules_to_rule_id_fb42d09d_fk_dojo_rule_id` FOREIGN KEY (`to_rule_id`) REFERENCES `dojo_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_rule_child_rules`
--

LOCK TABLES `dojo_rule_child_rules` WRITE;
/*!40000 ALTER TABLE `dojo_rule_child_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_rule_child_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_scan`
--

DROP TABLE IF EXISTS `dojo_scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_scan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `protocol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `baseline` tinyint(1) NOT NULL,
  `scan_settings_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_scan_scan_settings_id_6203523b_fk_dojo_scansettings_id` (`scan_settings_id`),
  CONSTRAINT `dojo_scan_scan_settings_id_6203523b_fk_dojo_scansettings_id` FOREIGN KEY (`scan_settings_id`) REFERENCES `dojo_scansettings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_scan`
--

LOCK TABLES `dojo_scan` WRITE;
/*!40000 ALTER TABLE `dojo_scan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_scansettings`
--

DROP TABLE IF EXISTS `dojo_scansettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_scansettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addresses` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(6) NOT NULL,
  `frequency` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_scansettings_product_id_274c1237_fk_dojo_product_id` (`product_id`),
  KEY `dojo_scansettings_user_id_8c6f73f1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_scansettings_product_id_274c1237_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_scansettings_user_id_8c6f73f1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_scansettings`
--

LOCK TABLES `dojo_scansettings` WRITE;
/*!40000 ALTER TABLE `dojo_scansettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_scansettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_sonarqube_issue`
--

DROP TABLE IF EXISTS `dojo_sonarqube_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_sonarqube_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_sonarqube_issue`
--

LOCK TABLES `dojo_sonarqube_issue` WRITE;
/*!40000 ALTER TABLE `dojo_sonarqube_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_sonarqube_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_sonarqube_issue_transition`
--

DROP TABLE IF EXISTS `dojo_sonarqube_issue_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_sonarqube_issue_transition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `finding_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sonarqube_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transitions` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sonarqube_issue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_sonarqube_issue_sonarqube_issue_id_6c1a90a2_fk_dojo_sona` (`sonarqube_issue_id`),
  CONSTRAINT `dojo_sonarqube_issue_sonarqube_issue_id_6c1a90a2_fk_dojo_sona` FOREIGN KEY (`sonarqube_issue_id`) REFERENCES `dojo_sonarqube_issue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_sonarqube_issue_transition`
--

LOCK TABLES `dojo_sonarqube_issue_transition` WRITE;
/*!40000 ALTER TABLE `dojo_sonarqube_issue_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_sonarqube_issue_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_sonarqube_product`
--

DROP TABLE IF EXISTS `dojo_sonarqube_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_sonarqube_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sonarqube_project_key` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sonarqube_tool_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_sonarqube_product_product_id_37bb6c2c_fk_dojo_product_id` (`product_id`),
  KEY `dojo_sonarqube_produ_sonarqube_tool_confi_0d626821_fk_dojo_tool` (`sonarqube_tool_config_id`),
  CONSTRAINT `dojo_sonarqube_produ_sonarqube_tool_confi_0d626821_fk_dojo_tool` FOREIGN KEY (`sonarqube_tool_config_id`) REFERENCES `dojo_tool_configuration` (`id`),
  CONSTRAINT `dojo_sonarqube_product_product_id_37bb6c2c_fk_dojo_product_id` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_sonarqube_product`
--

LOCK TABLES `dojo_sonarqube_product` WRITE;
/*!40000 ALTER TABLE `dojo_sonarqube_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_sonarqube_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_stub_finding`
--

DROP TABLE IF EXISTS `dojo_stub_finding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_stub_finding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `severity` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `reporter_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_stub_finding_test_id_90eb0c4e_fk_dojo_test_id` (`test_id`),
  KEY `dojo_stub_finding_reporter_id_332cdb8d_fk_auth_user_id` (`reporter_id`),
  CONSTRAINT `dojo_stub_finding_reporter_id_332cdb8d_fk_auth_user_id` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_stub_finding_test_id_90eb0c4e_fk_dojo_test_id` FOREIGN KEY (`test_id`) REFERENCES `dojo_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_stub_finding`
--

LOCK TABLES `dojo_stub_finding` WRITE;
/*!40000 ALTER TABLE `dojo_stub_finding` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_stub_finding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_system_settings`
--

DROP TABLE IF EXISTS `dojo_system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable_deduplication` tinyint(1) NOT NULL,
  `delete_dupulicates` tinyint(1) NOT NULL,
  `max_dupes` int(11) DEFAULT NULL,
  `enable_jira` tinyint(1) NOT NULL,
  `enable_jira_web_hook` tinyint(1) NOT NULL,
  `jira_minimum_severity` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jira_labels` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_slack_notifications` tinyint(1) NOT NULL,
  `slack_channel` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slack_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slack_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_mail_notifications` tinyint(1) NOT NULL,
  `mail_notifications_from` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_notifications_to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_finding_severity_naming` tinyint(1) NOT NULL,
  `false_positive_history` tinyint(1) NOT NULL,
  `url_prefix` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_endpoint_uri` tinyint(1) NOT NULL,
  `enable_product_grade` tinyint(1) NOT NULL,
  `product_grade` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_grade_a` int(11) NOT NULL,
  `product_grade_b` int(11) NOT NULL,
  `product_grade_c` int(11) NOT NULL,
  `product_grade_d` int(11) NOT NULL,
  `product_grade_f` int(11) NOT NULL,
  `enable_benchmark` tinyint(1) NOT NULL,
  `enable_template_match` tinyint(1) NOT NULL,
  `engagement_auto_close` tinyint(1) NOT NULL,
  `engagement_auto_close_days` int(11) NOT NULL,
  `enable_finding_sla` tinyint(1) NOT NULL,
  `sla_critical` int(11) NOT NULL,
  `sla_high` int(11) NOT NULL,
  `sla_medium` int(11) NOT NULL,
  `sla_low` int(11) NOT NULL,
  `allow_anonymous_survey_repsonse` tinyint(1) NOT NULL,
  `credentials` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_widths` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drive_folder_ID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_google_sheets` tinyint(1),
  `enable_auditlog` tinyint(1) NOT NULL,
  `enable_github` tinyint(1) NOT NULL,
  `email_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_msteams_notifications` tinyint(1) NOT NULL,
  `msteams_url` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_system_settings`
--

LOCK TABLES `dojo_system_settings` WRITE;
/*!40000 ALTER TABLE `dojo_system_settings` DISABLE KEYS */;
INSERT INTO `dojo_system_settings` VALUES (1,0,0,NULL,0,0,'Low',NULL,0,'','','',0,'from@example.com','',0,0,'','','UTC',0,0,'def grade_product(crit, high, med, low):\r\n    health=100\r\n    if crit > 0:\r\n        health = 40\r\n        health = health - ((crit - 1) * 5)\r\n    if high > 0:\r\n        if health == 100:\r\n            health = 60\r\n        health = health - ((high - 1) * 3)\r\n    if med > 0:\r\n        if health == 100:\r\n            health = 80\r\n        health = health - ((med - 1) * 2)\r\n    if low > 0:\r\n        if health == 100:\r\n            health = 95\r\n        health = health - low\r\n\r\n    if health < 5:\r\n        health = 5\r\n\r\n    return health',90,80,70,60,59,1,0,0,3,1,7,30,90,120,0,'','','',0,1,0,'',0,'');
/*!40000 ALTER TABLE `dojo_system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_test`
--

DROP TABLE IF EXISTS `dojo_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `target_start` datetime(6) NOT NULL,
  `target_end` datetime(6) NOT NULL,
  `estimated_time` time(6) DEFAULT NULL,
  `actual_time` time(6) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `engagement_id` int(11) NOT NULL,
  `environment_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `test_type_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_test_engagement_id_46ff752d_fk_dojo_engagement_id` (`engagement_id`),
  KEY `dojo_test_environment_id_619c73f4_fk_dojo_deve` (`environment_id`),
  KEY `dojo_test_lead_id_6b38617c_fk_auth_user_id` (`lead_id`),
  KEY `dojo_test_test_type_id_d0f5d576_fk_dojo_test_type_id` (`test_type_id`),
  CONSTRAINT `dojo_test_engagement_id_46ff752d_fk_dojo_engagement_id` FOREIGN KEY (`engagement_id`) REFERENCES `dojo_engagement` (`id`),
  CONSTRAINT `dojo_test_environment_id_619c73f4_fk_dojo_deve` FOREIGN KEY (`environment_id`) REFERENCES `dojo_development_environment` (`id`),
  CONSTRAINT `dojo_test_lead_id_6b38617c_fk_auth_user_id` FOREIGN KEY (`lead_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dojo_test_test_type_id_d0f5d576_fk_dojo_test_type_id` FOREIGN KEY (`test_type_id`) REFERENCES `dojo_test_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_test`
--

LOCK TABLES `dojo_test` WRITE;
/*!40000 ALTER TABLE `dojo_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_test_notes`
--

DROP TABLE IF EXISTS `dojo_test_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_test_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_test_notes_test_id_notes_id_c968d79e_uniq` (`test_id`,`notes_id`),
  KEY `dojo_test_notes_notes_id_6789be4f_fk_dojo_notes_id` (`notes_id`),
  CONSTRAINT `dojo_test_notes_notes_id_6789be4f_fk_dojo_notes_id` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`),
  CONSTRAINT `dojo_test_notes_test_id_16d6acce_fk_dojo_test_id` FOREIGN KEY (`test_id`) REFERENCES `dojo_test` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_test_notes`
--

LOCK TABLES `dojo_test_notes` WRITE;
/*!40000 ALTER TABLE `dojo_test_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_test_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_test_type`
--

DROP TABLE IF EXISTS `dojo_test_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_test_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `static_tool` tinyint(1) NOT NULL,
  `dynamic_tool` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_test_type`
--

LOCK TABLES `dojo_test_type` WRITE;
/*!40000 ALTER TABLE `dojo_test_type` DISABLE KEYS */;
INSERT INTO `dojo_test_type` VALUES (1,'API Test',0,0),(2,'Static Check',0,0),(3,'Pen Test',0,0),(4,'Web Application Test',0,0),(5,'Security Research',0,0),(6,'Threat Modeling',0,0),(7,'Manual Code Review',0,0),(100,'Acunetix Scan',0,0),(101,'Anchore Engine Scan',0,0),(102,'AppSpider Scan',0,0),(103,'Arachni Scan',0,0),(104,'AWS Prowler Scanner',0,0),(105,'AWS Scout2 Scanner',0,0),(106,'Bandit Scan',0,0),(107,'Blackduck Hub Scan',0,0),(108,'Brakeman Scan',0,0),(109,'Bundler-Audit Scan',0,0),(110,'Burp Scan',0,0),(111,'Checkmarx Scan',0,0),(112,'Clair Scan',0,0),(113,'Clair Klar Scan',0,0),(114,'Cobalt.io Scan',0,0),(115,'Contrast Scan',0,0),(116,'Crashtest Security Scan',0,0),(117,'DawnScanner Scan',0,0),(118,'Dependency Check Scan',0,0),(119,'Fortify',0,0),(120,'Generic Findings Import',0,0),(121,'Gosec Scanner',0,0),(122,'IBM AppScan DAST',0,0),(123,'Immuniweb Scan',0,0),(124,'Kiuwan Scan',0,0),(125,'Microfocus Webinspect Scan',0,0),(126,'MobSF Scanner',0,0),(127,'Mozilla Observatory Scan',0,0),(128,'Nessus Scan',0,0),(129,'Netsparker Scan',0,0),(130,'Nexpose Scan',0,0),(131,'Nikto Scan',0,0),(132,'Nmap Scan',0,0),(133,'NPM Audit Scan',0,0),(134,'Node Security Platform Scan',0,0),(135,'Openscap Vulnerability Scan',0,0),(136,'OpenVAS CSV',0,0),(137,'PHP Security Audit v2',0,0),(138,'PHP Symfony Security Checker',0,0),(139,'Qualys Scan',0,0),(140,'Qualys Webapp Scan',0,0),(141,'Retire.js Scan',0,0),(142,'Safety Scan',0,0),(143,'SKF Scan',0,0),(144,'Snyk Scan',0,0),(145,'Sonatype Application Scan',0,0),(146,'SSL Labs Scan',0,0),(147,'Sslscan',0,0),(148,'SonarQube',0,0),(149,'SpotBugs',0,0),(150,'Trufflehog',0,0),(151,'Trustwave',0,0),(152,'Twistlock Image Scan',0,0),(153,'VCG Scan',0,0),(154,'Veracode Scan',0,0),(155,'Wapiti Scan',0,0),(156,'Wpscan',0,0),(157,'Whitesource Scan',0,0),(158,'ZAP Scan',0,0),(159,'Sslyze Scan',0,0),(160,'Testssl Scan',0,0),(161,'JFrog Xray Scan',0,0),(162,'Hadolint Dockerfile check',0,0),(163,'Aqua Scan',0,0),(164,'Dependency Track Finding Packaging Format (FPF) Export',0,0),(165,'Trivy Scan',0,0),(166,'Xanitizer Scan',0,0),(167,'HackerOne Cases',0,0),(168,'Outpost24 Scan',0,0),(169,'Blackduck Component Risk',0,0),(170,'DSOP Scan',0,0),(171,'Burp Suite Enterprise',0,0),(172,'Anchore Enterprise Policy Check',0,0),(173,'Harbor Vulnerability Scan',0,0),(174,'Gitleaks Scan',0,0),(175,'Choctaw Hog Scan',0,0),(176,'GitLab SAST Report',0,0),(177,'Qualys Infrastructure Scan (WebGUI XML)',0,0),(178,'BugCrowd ',0,0),(179,'Yarn Audit Scan',0,0),(180,'ESLint Scan',0,0),(181,'CCVS Report',0,0),(182,'HuskyCI Report',0,0),(183,'AWS Security Hub Scan',0,0),(184,'Risk Recon API Importer',0,0),(185,'DrHeader JSON Importer',0,0),(186,'SSLyze 3 Scan (JSON)',0,0);
/*!40000 ALTER TABLE `dojo_test_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_testing_guide`
--

DROP TABLE IF EXISTS `dojo_testing_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_testing_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `how_to_test` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `results_expected` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `testing_guide_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_testing_guide_testing_guide_catego_e62cdc6c_fk_dojo_test` (`testing_guide_category_id`),
  CONSTRAINT `dojo_testing_guide_testing_guide_catego_e62cdc6c_fk_dojo_test` FOREIGN KEY (`testing_guide_category_id`) REFERENCES `dojo_testing_guide_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_testing_guide`
--

LOCK TABLES `dojo_testing_guide` WRITE;
/*!40000 ALTER TABLE `dojo_testing_guide` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_testing_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_testing_guide_category`
--

DROP TABLE IF EXISTS `dojo_testing_guide_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_testing_guide_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_testing_guide_category`
--

LOCK TABLES `dojo_testing_guide_category` WRITE;
/*!40000 ALTER TABLE `dojo_testing_guide_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_testing_guide_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_textanswer`
--

DROP TABLE IF EXISTS `dojo_textanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_textanswer` (
  `answer_ptr_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`answer_ptr_id`),
  CONSTRAINT `dojo_textanswer_answer_ptr_id_8e61ff51_fk_dojo_answer_id` FOREIGN KEY (`answer_ptr_id`) REFERENCES `dojo_answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_textanswer`
--

LOCK TABLES `dojo_textanswer` WRITE;
/*!40000 ALTER TABLE `dojo_textanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_textanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_textquestion`
--

DROP TABLE IF EXISTS `dojo_textquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_textquestion` (
  `question_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`question_ptr_id`),
  CONSTRAINT `dojo_textquestion_question_ptr_id_551ddcb7_fk_dojo_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `dojo_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_textquestion`
--

LOCK TABLES `dojo_textquestion` WRITE;
/*!40000 ALTER TABLE `dojo_textquestion` DISABLE KEYS */;
INSERT INTO `dojo_textquestion` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43);
/*!40000 ALTER TABLE `dojo_textquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_tool_configuration`
--

DROP TABLE IF EXISTS `dojo_tool_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_tool_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssh` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tool_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_tool_configurat_tool_type_id_9b38ecad_fk_dojo_tool` (`tool_type_id`),
  CONSTRAINT `dojo_tool_configurat_tool_type_id_9b38ecad_fk_dojo_tool` FOREIGN KEY (`tool_type_id`) REFERENCES `dojo_tool_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_tool_configuration`
--

LOCK TABLES `dojo_tool_configuration` WRITE;
/*!40000 ALTER TABLE `dojo_tool_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_tool_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_tool_product_history`
--

DROP TABLE IF EXISTS `dojo_tool_product_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_tool_product_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_scan` datetime(6) NOT NULL,
  `succesfull` tinyint(1) NOT NULL,
  `configuration_details` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_tool_product_hi_product_id_8a7cf946_fk_dojo_tool` (`product_id`),
  CONSTRAINT `dojo_tool_product_hi_product_id_8a7cf946_fk_dojo_tool` FOREIGN KEY (`product_id`) REFERENCES `dojo_tool_product_settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_tool_product_history`
--

LOCK TABLES `dojo_tool_product_history` WRITE;
/*!40000 ALTER TABLE `dojo_tool_product_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_tool_product_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_tool_product_settings`
--

DROP TABLE IF EXISTS `dojo_tool_product_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_tool_product_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tool_project_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `tool_configuration_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_tool_product_se_product_id_193aebd7_fk_dojo_prod` (`product_id`),
  KEY `dojo_tool_product_se_tool_configuration_i_d5a13b73_fk_dojo_tool` (`tool_configuration_id`),
  CONSTRAINT `dojo_tool_product_se_product_id_193aebd7_fk_dojo_prod` FOREIGN KEY (`product_id`) REFERENCES `dojo_product` (`id`),
  CONSTRAINT `dojo_tool_product_se_tool_configuration_i_d5a13b73_fk_dojo_tool` FOREIGN KEY (`tool_configuration_id`) REFERENCES `dojo_tool_configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_tool_product_settings`
--

LOCK TABLES `dojo_tool_product_settings` WRITE;
/*!40000 ALTER TABLE `dojo_tool_product_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_tool_product_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_tool_product_settings_notes`
--

DROP TABLE IF EXISTS `dojo_tool_product_settings_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_tool_product_settings_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_product_settings_id` int(11) NOT NULL,
  `notes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dojo_tool_product_settin_tool_product_settings_id_7037284f_uniq` (`tool_product_settings_id`,`notes_id`),
  KEY `dojo_tool_product_se_notes_id_540b4ef9_fk_dojo_note` (`notes_id`),
  CONSTRAINT `dojo_tool_product_se_notes_id_540b4ef9_fk_dojo_note` FOREIGN KEY (`notes_id`) REFERENCES `dojo_notes` (`id`),
  CONSTRAINT `dojo_tool_product_se_tool_product_setting_dc9c78c6_fk_dojo_tool` FOREIGN KEY (`tool_product_settings_id`) REFERENCES `dojo_tool_product_settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_tool_product_settings_notes`
--

LOCK TABLES `dojo_tool_product_settings_notes` WRITE;
/*!40000 ALTER TABLE `dojo_tool_product_settings_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_tool_product_settings_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_tool_type`
--

DROP TABLE IF EXISTS `dojo_tool_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_tool_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_tool_type`
--

LOCK TABLES `dojo_tool_type` WRITE;
/*!40000 ALTER TABLE `dojo_tool_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_tool_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_usercontactinfo`
--

DROP TABLE IF EXISTS `dojo_usercontactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_usercontactinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cell_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter_username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_user_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block_execution` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `dojo_usercontactinfo_user_id_de596942_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_usercontactinfo`
--

LOCK TABLES `dojo_usercontactinfo` WRITE;
/*!40000 ALTER TABLE `dojo_usercontactinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_usercontactinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dojo_va`
--

DROP TABLE IF EXISTS `dojo_va`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dojo_va` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `start` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dojo_va_result_id_d63948a2_fk_dojo_test_id` (`result_id`),
  KEY `dojo_va_user_id_54c1c984_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dojo_va_result_id_d63948a2_fk_dojo_test_id` FOREIGN KEY (`result_id`) REFERENCES `dojo_test` (`id`),
  CONSTRAINT `dojo_va_user_id_54c1c984_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dojo_va`
--

LOCK TABLES `dojo_va` WRITE;
/*!40000 ALTER TABLE `dojo_va` DISABLE KEYS */;
/*!40000 ALTER TABLE `dojo_va` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tag`
--

DROP TABLE IF EXISTS `tagging_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tag`
--

LOCK TABLES `tagging_tag` WRITE;
/*!40000 ALTER TABLE `tagging_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_taggeditem`
--

DROP TABLE IF EXISTS `tagging_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagging_taggeditem_tag_id_content_type_id_o_3d53f09d_uniq` (`tag_id`,`content_type_id`,`object_id`),
  KEY `tagging_taggeditem_object_id_0d0d5e42` (`object_id`),
  KEY `tagging_taggeditem_content_type_id_ede1c265_fk_django_co` (`content_type_id`),
  CONSTRAINT `tagging_taggeditem_content_type_id_ede1c265_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `tagging_taggeditem_tag_id_f008ca79_fk_tagging_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tagging_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_taggeditem`
--

LOCK TABLES `tagging_taggeditem` WRITE;
/*!40000 ALTER TABLE `tagging_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_key_17b411bb` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_8c8fa920_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watson_searchentry`
--

DROP TABLE IF EXISTS `watson_searchentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watson_searchentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine_slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id_int` int(11) DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_encoded` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watson_searchentry_content_type_id_bd552f03_fk_django_co` (`content_type_id`),
  KEY `watson_searchentry_engine_slug_516fbb0c` (`engine_slug`),
  KEY `watson_searchentry_object_id_int_b04aab9e` (`object_id_int`),
  FULLTEXT KEY `watson_searchentry_fulltext` (`title`,`description`,`content`),
  FULLTEXT KEY `watson_searchentry_title` (`title`),
  FULLTEXT KEY `watson_searchentry_description` (`description`),
  FULLTEXT KEY `watson_searchentry_content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watson_searchentry`
--

LOCK TABLES `watson_searchentry` WRITE;
/*!40000 ALTER TABLE `watson_searchentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `watson_searchentry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 10:50:38
