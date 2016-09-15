-- MySQL dump 10.13  Distrib 5.5.51, for Win64 (x86)
--
-- Host: localhost    Database: skyler
-- ------------------------------------------------------
-- Server version	5.5.51

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
-- Current Database: `skyler`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `skyler` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `skyler`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'editor'),(2,'publisher');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,22),(5,1,23),(6,1,24),(7,1,25),(8,1,26),(10,2,19),(11,2,20),(12,2,21),(13,2,22),(14,2,23),(15,2,24),(16,2,25),(17,2,26),(18,2,27);
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add tag',7,'add_tag'),(20,'Can change tag',7,'change_tag'),(21,'Can delete tag',7,'delete_tag'),(22,'Can add post tag',8,'add_posttag'),(23,'Can change post tag',8,'change_posttag'),(24,'Can delete post tag',8,'delete_posttag'),(25,'Can add post',9,'add_post'),(26,'Can change post',9,'change_post'),(27,'Can delete post',9,'delete_post');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$o0ghUZ6zQJJO$F6E2+7HP+Oe2u39MSSywDddyI3AmvnOSNbo/EUUSVII=','2016-09-15 15:31:39',1,'admin','','','dike.zhang@gmail.com',1,1,'2016-09-15 15:31:05'),(2,'pbkdf2_sha256$30000$pZn410MnnrlS$OqFmLg/dGpcanzXuXI8M+aj4SE9DJiidpj7Vc7H3Adc=',NULL,0,'anna','','','',0,1,'2016-09-15 15:32:03'),(3,'pbkdf2_sha256$30000$JHb6FQUYsZRZ$X/Xy0fkbY4LRAFx+lcwBRyoVmgnu7xXfqGuRP/dSBM0=',NULL,0,'martin','','','',0,1,'2016-09-15 15:32:56');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-09-15 15:32:03','2','anna',1,'[{\"added\": {}}]',3,1),(2,'2016-09-15 15:32:56','3','martin',1,'[{\"added\": {}}]',3,1),(3,'2016-09-15 15:33:34','1','editor',1,'[{\"added\": {}}]',4,1),(4,'2016-09-15 15:33:58','2','publisher',1,'[{\"added\": {}}]',4,1),(5,'2016-09-15 15:34:29','1','editor',2,'[]',4,1),(6,'2016-09-15 15:34:47','ce5b2703-e67e-43d3-b33c-f71aacaefbb8','database',1,'[{\"added\": {}}]',7,1),(7,'2016-09-15 15:34:55','0181d85d-3c01-47a5-8506-4b34a5839a10','javascript',1,'[{\"added\": {}}]',7,1),(8,'2016-09-15 15:35:39','5708e77a-53ba-4698-a494-0183403278c6','rename django app',1,'[{\"added\": {}}]',9,1),(9,'2016-09-15 15:36:01','ddbeeadf-a439-4cf4-9758-d2586ad3c04f','Adding Behavior to a Scope Object',1,'[{\"added\": {}}]',9,1),(10,'2016-09-15 15:36:15','d657e4b3-71a9-4c7a-8d7e-61a142cbba1b','rename django app_javascript',1,'[{\"added\": {}}]',8,1),(11,'2016-09-15 15:36:28','609a9b56-d53c-40ed-b17f-5473b4cca138','Adding Behavior to a Scope Object_database',1,'[{\"added\": {}}]',8,1),(12,'2016-09-15 20:31:23','5708e77a-53ba-4698-a494-0183403278c6','rename django app',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(13,'2016-09-15 20:37:36','5708e77a-53ba-4698-a494-0183403278c6','rename django app',2,'[{\"changed\": {\"fields\": [\"abstract\"]}}]',9,1),(14,'2016-09-15 20:38:49','5708e77a-53ba-4698-a494-0183403278c6','rename django app',2,'[{\"changed\": {\"fields\": [\"abstract\"]}}]',9,1),(15,'2016-09-15 20:38:59','ddbeeadf-a439-4cf4-9758-d2586ad3c04f','Adding Behavior to a Scope Object',2,'[{\"changed\": {\"fields\": [\"abstract\"]}}]',9,1),(16,'2016-09-15 20:54:03','ddbeeadf-a439-4cf4-9758-d2586ad3c04f','Adding Behavior to a Scope Object',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1),(17,'2016-09-15 20:54:09','5708e77a-53ba-4698-a494-0183403278c6','rename django app',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(9,'post','post'),(8,'post','posttag'),(7,'post','tag'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-15 15:30:24'),(2,'auth','0001_initial','2016-09-15 15:30:24'),(3,'admin','0001_initial','2016-09-15 15:30:24'),(4,'admin','0002_logentry_remove_auto_add','2016-09-15 15:30:24'),(5,'contenttypes','0002_remove_content_type_name','2016-09-15 15:30:24'),(6,'auth','0002_alter_permission_name_max_length','2016-09-15 15:30:25'),(7,'auth','0003_alter_user_email_max_length','2016-09-15 15:30:25'),(8,'auth','0004_alter_user_username_opts','2016-09-15 15:30:25'),(9,'auth','0005_alter_user_last_login_null','2016-09-15 15:30:25'),(10,'auth','0006_require_contenttypes_0002','2016-09-15 15:30:25'),(11,'auth','0007_alter_validators_add_error_messages','2016-09-15 15:30:25'),(12,'auth','0008_alter_user_username_max_length','2016-09-15 15:30:25'),(13,'post','0001_initial','2016-09-15 15:30:25'),(14,'sessions','0001_initial','2016-09-15 15:30:25'),(15,'post','0002_post_abstract','2016-09-15 20:37:08'),(16,'post','0003_auto_20160915_1638','2016-09-15 20:38:28'),(17,'post','0004_post_slug','2016-09-15 20:53:46'),(18,'post','0005_auto_20160915_1655','2016-09-15 20:55:18');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wr1ufauarn892c3nwjbyoem23qwewaa1','ZjE3NTBhMjdkZGZjN2NkYjRlNzY4OWRkYzhhYmYxM2YwMTFlMzViZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NTI2NTExNzNjMmM2OGFhZWIxNzBjMzE1MzBmN2I1NTdiYTY0NmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-29 15:31:39');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_post`
--

DROP TABLE IF EXISTS `post_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_post` (
  `id` varchar(64) NOT NULL,
  `title` varchar(60) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `abstract` longtext NOT NULL,
  `slug` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_post_slug_56a89051_uniq` (`slug`),
  KEY `post_post_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_post`
--

LOCK TABLES `post_post` WRITE;
/*!40000 ALTER TABLE `post_post` DISABLE KEYS */;
INSERT INTO `post_post` VALUES ('5708e77a-53ba-4698-a494-0183403278c6','rename django app','## EventLog Jasper log crashes on dev\r\n\r\n1. need put nrs logo resource in c:\\Temp\r\n\r\n\r\n### File list\r\n1. listEventLogComponent.xhtml -> eventLogDetailViewReportAction.runGeneralStaticReportSQLByDS(\'EventLogList_ds_01\', \'PDF\')\r\n2. EventLogDetailViewReportAction.java\r\n\r\n### Java\r\n\r\n```Java\r\n\r\npackage com.mcap.recovery.eventlog.report;\r\n\r\nimport java.util.Date;\r\n\r\n/**\r\n * the event log object to create jasper report\r\n * \r\n * @author epm34729\r\n *\r\n */\r\n```','2016-09-15 15:35:39','2016-09-15 20:54:09',1,'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.\r\n\r\nDonec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','rename-django-app'),('ddbeeadf-a439-4cf4-9758-d2586ad3c04f','Adding Behavior to a Scope Object','In order to react to events or execute computation in the view we must provide behavior to the scope. We add behavior to the scope by attaching methods to the $scope object. These methods are then available to be called from the template/view.\r\n\r\nThe following example uses a Controller to add a method, which doubles a number, to the scope:\r\n\r\nvar myApp = angular.module(\'myApp\',[]);\r\n\r\nmyApp.controller(\'DoubleController\', [\'$scope\', function($scope) {\r\n  $scope.double = function(value) { return value * 2; };\r\n}]);\r\nOnce the Controller has been attached to the DOM, the double method can be invoked in an Angular expression in the template:\r\n\r\n<div ng-controller=\"DoubleController\">\r\n  Two times <input ng-model=\"num\"> equals {{ double(num) }}\r\n</div>\r\nAs discussed in the Concepts section of this guide, any objects (or primitives) assigned to the scope become model properties. Any methods assigned to the scope are available in the template/view, and can be invoked via angular expressions and ng event handler directives (e.g. ngClick).','2016-09-15 15:36:01','2016-09-15 20:54:03',1,'Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.\r\n\r\nDonec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.','adding-behavior-scope-object');
/*!40000 ALTER TABLE `post_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_posttag`
--

DROP TABLE IF EXISTS `post_posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_posttag` (
  `id` varchar(64) NOT NULL,
  `post_id` varchar(64) NOT NULL,
  `tag_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_posttag_post_id_907a5d66_fk_post_post_id` (`post_id`),
  KEY `post_posttag_76f094bc` (`tag_id`),
  CONSTRAINT `post_posttag_tag_id_280fa83d_fk_post_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `post_tag` (`id`),
  CONSTRAINT `post_posttag_post_id_907a5d66_fk_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `post_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_posttag`
--

LOCK TABLES `post_posttag` WRITE;
/*!40000 ALTER TABLE `post_posttag` DISABLE KEYS */;
INSERT INTO `post_posttag` VALUES ('609a9b56-d53c-40ed-b17f-5473b4cca138','ddbeeadf-a439-4cf4-9758-d2586ad3c04f','ce5b2703-e67e-43d3-b33c-f71aacaefbb8'),('d657e4b3-71a9-4c7a-8d7e-61a142cbba1b','5708e77a-53ba-4698-a494-0183403278c6','0181d85d-3c01-47a5-8506-4b34a5839a10');
/*!40000 ALTER TABLE `post_posttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES ('0181d85d-3c01-47a5-8506-4b34a5839a10','2016-09-15 15:34:55','2016-09-15 15:34:55',1,'javascript'),('ce5b2703-e67e-43d3-b33c-f71aacaefbb8','2016-09-15 15:34:47','2016-09-15 15:34:47',1,'database');
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-15 17:40:12
