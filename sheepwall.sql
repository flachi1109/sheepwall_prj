-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: sheepwall
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add app behavior log',7,'add_appbehaviorlog'),(20,'Can change app behavior log',7,'change_appbehaviorlog'),(21,'Can delete app behavior log',7,'delete_appbehaviorlog'),(22,'Can add mobile_os_vulns',8,'add_mobile_os_vulns'),(23,'Can change mobile_os_vulns',8,'change_mobile_os_vulns'),(24,'Can delete mobile_os_vulns',8,'delete_mobile_os_vulns'),(25,'Can add wifi user',9,'add_wifiuser'),(26,'Can change wifi user',9,'change_wifiuser'),(27,'Can delete wifi user',9,'delete_wifiuser'),(28,'Can add mac_ip',10,'add_mac_ip'),(29,'Can change mac_ip',10,'change_mac_ip'),(30,'Can delete mac_ip',10,'delete_mac_ip');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'sheepwall_app','appbehaviorlog'),(10,'sheepwall_app','mac_ip'),(8,'sheepwall_app','mobile_os_vulns'),(9,'sheepwall_app','wifiuser');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-03-15 07:16:12.393142'),(2,'auth','0001_initial','2017-03-15 07:16:16.194005'),(3,'admin','0001_initial','2017-03-15 07:16:16.965336'),(4,'admin','0002_logentry_remove_auto_add','2017-03-15 07:16:17.023956'),(5,'contenttypes','0002_remove_content_type_name','2017-03-15 07:16:17.486110'),(6,'auth','0002_alter_permission_name_max_length','2017-03-15 07:16:17.789950'),(7,'auth','0003_alter_user_email_max_length','2017-03-15 07:16:18.081329'),(8,'auth','0004_alter_user_username_opts','2017-03-15 07:16:18.109705'),(9,'auth','0005_alter_user_last_login_null','2017-03-15 07:16:18.341358'),(10,'auth','0006_require_contenttypes_0002','2017-03-15 07:16:18.357971'),(11,'auth','0007_alter_validators_add_error_messages','2017-03-15 07:16:18.397103'),(12,'auth','0008_alter_user_username_max_length','2017-03-15 07:16:18.730520'),(13,'sessions','0001_initial','2017-03-15 07:16:18.962760'),(14,'sheepwall_app','0001_initial','2017-03-15 07:16:19.682251'),(15,'sheepwall_app','0002_auto_20170305_1212','2017-03-15 07:16:20.053719'),(16,'sheepwall_app','0003_appbehaviorlog_access_date','2017-03-15 07:16:20.302255'),(17,'sheepwall_app','0004_auto_20170305_1324','2017-03-15 07:16:20.324361'),(18,'sheepwall_app','0005_auto_20170306_0721','2017-03-15 07:16:21.354295'),(19,'sheepwall_app','0006_wifiuser_mac_addr','2017-03-15 07:16:21.569738'),(20,'sheepwall_app','0007_auto_20170306_0831','2017-03-15 07:16:21.846095'),(21,'sheepwall_app','0008_auto_20170305_1443','2017-03-15 07:16:24.457740'),(22,'sheepwall_app','0009_auto_20170308_1342','2017-03-15 07:16:25.071003'),(23,'sheepwall_app','0010_remove_appbehaviorlog_app_content','2017-03-15 07:16:25.281658'),(24,'sheepwall_app','0011_auto_20170310_0658','2017-03-15 07:16:26.126652'),(25,'sheepwall_app','0012_auto_20170310_0720','2017-03-15 07:16:26.581695'),(26,'sheepwall_app','0013_mobile_os_vulns','2017-03-15 07:16:26.725394'),(27,'sheepwall_app','0014_auto_20170313_1237','2017-03-15 07:16:27.246239'),(28,'sheepwall_app','0015_auto_20170313_1240','2017-03-15 07:16:28.057142'),(29,'sheepwall_app','0016_auto_20170313_1244','2017-03-15 07:16:28.537864'),(30,'sheepwall_app','0017_auto_20170317_0154','2017-03-17 08:20:59.080153'),(31,'sheepwall_app','0018_auto_20170320_0721','2017-03-20 07:21:47.488546'),(32,'sheepwall_app','0019_auto_20170320_0722','2017-03-20 07:22:50.997140'),(33,'sheepwall_app','0020_mac_ip','2017-03-30 03:33:58.851948');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_ip`
--

DROP TABLE IF EXISTS `mac_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_ip` (
  `IP` varchar(255) DEFAULT NULL,
  `Mac` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_ip`
--

LOCK TABLES `mac_ip` WRITE;
/*!40000 ALTER TABLE `mac_ip` DISABLE KEYS */;
INSERT INTO `mac_ip` VALUES ('172.16.0.38','70-48-0f-52-c7-76',99);
/*!40000 ALTER TABLE `mac_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheepwall_app_appbehaviorlog`
--

DROP TABLE IF EXISTS `sheepwall_app_appbehaviorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheepwall_app_appbehaviorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_ip_addr` char(39) NOT NULL,
  `application` varchar(30) DEFAULT NULL,
  `behavior` varchar(20) DEFAULT NULL,
  `target_url` varchar(200) NOT NULL,
  `access_time` varchar(15) DEFAULT NULL,
  `access_date` date NOT NULL,
  `account` varchar(20) DEFAULT NULL,
  `keyword` varchar(25) DEFAULT NULL,
  `receiver_addr` varchar(20) DEFAULT NULL,
  `sender_addr` varchar(20) DEFAULT NULL,
  `filesize` varchar(40) DEFAULT NULL,
  `body` varchar(60) DEFAULT NULL,
  `filename` varchar(40) DEFAULT NULL,
  `softversion` varchar(40) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `subject` varchar(40) DEFAULT NULL,
  `client` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1332 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheepwall_app_appbehaviorlog`
--

LOCK TABLES `sheepwall_app_appbehaviorlog` WRITE;
/*!40000 ALTER TABLE `sheepwall_app_appbehaviorlog` DISABLE KEYS */;
INSERT INTO `sheepwall_app_appbehaviorlog` VALUES (1,'172.16.0.11','微信','收消息','','08:29:00','2017-04-08','544917854',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(2,'172.16.0.11','微信','发消息','','08:29:50','2017-04-08','544917854',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(3,'172.16.0.11','百度贴吧','发帖','','09:10:50','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'有没有一起去踏青的啊？',NULL,'Android'),(4,'172.16.0.11','QQ','登录','','09:15:23','2017-04-08','981029662',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(5,'172.16.0.11','QQ','收消息','','09:15:25','2017-04-08','981029662',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(6,'172.16.0.12','微信','登录','','10:11:39','2017-04-08','390890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(7,'172.16.0.12','QQ','登录','','10:11:50','2017-04-08','287889032',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(8,'172.16.0.12','QQ','收消息','','10:12:00','2017-04-08','287889032',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(9,'172.16.0.12','铁血军事','搜索','','11:14:22','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F16战斗机',NULL,'Android'),(10,'172.16.0.12','优酷','在线播放','','13:15:00','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'我的团长我的兵',NULL,'Android'),(11,'172.16.0.13','QQ','发消息','','13:36:00','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Android'),(12,'172.16.0.13','微信','收消息','','13:38:02','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(13,'172.16.0.13','百度帖吧','评论','','14:44:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'个人觉得碧螺春很不错',NULL,'Android'),(14,'172.16.0.13','360搜索','搜索','','15:25:10','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'热播电视剧',NULL,'Android'),(15,'172.16.0.13','乐视视频','在线播放','','15:30:01','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'三生三世十里桃花',NULL,'Android'),(16,'172.16.0.14','腾讯微博','搜索','','11:06:59','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'人民日报',NULL,'Android'),(17,'172.16.0.14','微信','发消息','','11:12:34','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(18,'172.16.0.14','爱奇艺','搜索','','11:20:22','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'射雕英雄传',NULL,'Android'),(19,'172.16.0.14','百度帖吧','发帖','','11:28:33','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'最强大脑里水叔为什么那么有才？',NULL,'Android'),(21,'172.16.0.14','微信','收消息','','11:39:13','2017-04-08','908102349',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(22,'172.16.0.15','新浪微盘','下载','','12:23:40','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'很全的文学常识',NULL,'Android'),(23,'172.16.0.15','爱奇艺','在线播放','','12:24:47','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NBA总决赛经典：雷阿伦惊天三分，助热火詹皇两连冠！',NULL,'Android'),(24,'172.16.0.15','乐视视频','搜索','','12:29:38','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'脱口秀',NULL,'Android'),(25,'172.16.0.15','新浪微盘','下载文件','','12:30:44','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,'《谁的乱世》中华历史题材手游.apk',NULL,NULL,NULL,'Android'),(26,'172.16.0.15','微信','登陆','','13:45:13','2017-04-08','926692736',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(27,'172.16.0.16','阿里旺旺','登录','','16:35:16','2017-04-08','jia18810092389',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(28,'172.16.0.16','QQ','收消息','','16:38:22','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(29,'172.16.0.16','阿里旺旺','接收图片','','16:40:56','2017-04-08',NULL,NULL,NULL,NULL,'158KB',NULL,NULL,NULL,NULL,NULL,'Android'),(30,'172.16.0.16','腾讯微博','搜索','','17:33:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'意林杂志',NULL,'Android'),(31,'172.16.0.16','腾讯视频','在线播放','','19:33:07','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'因为遇见你',NULL,'Android'),(32,'172.16.0.17','QQ','登陆','','10:34:09','2017-04-08','368976290',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(33,'172.16.0.17','天涯社区','登陆','','11:56:20','2017-04-08','忆A5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(34,'172.16.0.17','QQ','发消息','','11:58:30','2017-04-08','368976290',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(35,'172.16.0.17','天涯社区','搜索','','12:57:51','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'精选帖子',NULL,'Android'),(36,'172.16.0.17','百度贴吧','评论','','13:45:23','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'李校长威武',NULL,'Android'),(37,'172.16.0.18','天涯社区','登陆','','12:57:51','2017-04-08','大雪飞~',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'Android'),(38,'172.16.0.18','爱奇艺','搜索','','15:56:34','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'老爸当家',NULL,'Android'),(39,'172.16.0.18','百度帖吧','发帖','','17:30:04','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'求推荐！！北京周边景区',NULL,'Android'),(40,'172.16.0.18','微信','收消息','','17:30:09','2017-04-08','689748990',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(41,'172.16.0.18','微信','发消息','','17:30:56','2017-04-08','689748990',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Android'),(42,'172.16.0.19','爱奇艺','搜索','','09:22:34','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云巅之上',NULL,'IOS'),(43,'172.16.0.19','微信','发消息','','09:22:50','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(44,'172.16.0.19','人人','登陆','','11:01:20','2017-04-08','13678209903',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(45,'172.16.0.19','百度帖吧','搜索','','11:20:03','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'人文趣事',NULL,'IOS'),(46,'172.16.0.19','微信','收消息','','12:00:07','2017-04-08','11024307720',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(47,'172.16.0.20','QQ','收消息','','11:10:04','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'IOS'),(48,'172.16.0.20','新浪微盘','下载文件','','11:23:44','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,'《阻碍人生的三个不利心态》.pdf',NULL,NULL,NULL,'IOS'),(49,'172.16.0.20','乐视视频','在线播放','','12:45:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'鸡毛飞上天',NULL,'IOS'),(50,'172.16.0.20','QQ','发消息','','13:22:04','2017-04-08','6003479239',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'IOS'),(51,'172.16.0.20','微信','收消息','','13:38:45','2017-04-08','8934609012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(52,'172.16.0.27','360搜索','搜索','','14:56:23','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'歌手排行榜',NULL,'WEB'),(53,'172.16.0.27','搜狗搜索','搜索','','15:56:59','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'梁静茹',NULL,'WEB'),(54,'172.16.0.27','139邮箱','登陆','','16:04:34','2017-04-08',NULL,NULL,NULL,'mina722·139.com',NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(55,'172.16.0.27','139邮箱','发邮件','','16:07:09','2017-04-08',NULL,NULL,'lilan@139.com','mina722·139.com','136KB',NULL,'《译者指南》.pdf',NULL,NULL,'转发：把你昨天下载的那本书发我吧','WEB'),(56,'172.16.0.27','QQ','收消息','','16:12:24','2017-04-08','11311509870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(57,'172.16.0.28','铁血军事','评论','','10:14:25','2017-04-08','远处的山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'默默关注下。。',NULL,'WEB'),(58,'172.16.0.28','腾讯视频','在线播放','','10:45:05','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'朗读者',NULL,'WEB'),(59,'172.16.0.28','百度帖吧','评论','','11:47:21','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'还没见过内蒙的大草原',NULL,'WEB'),(60,'172.16.0.28','360搜索','搜索','','12:34:44','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'乐器大全',NULL,'WEB'),(61,'172.16.0.28','微信','发消息','','12:58:01','2017-04-08','990289783',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(62,'172.16.0.29','新浪微盘','下载文件','','10:36:02','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,'最合理的颜色搭配.pdf',NULL,NULL,NULL,'WEB'),(63,'172.16.0.29','乐视视频','在线播放','','10:38:22','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'欢乐喜剧人',NULL,'WEB'),(64,'172.16.0.29','百度帖吧','搜索','','11:40:43','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'设计类论坛',NULL,'WEB'),(65,'172.16.0.29','百度帖吧','发帖','','11:45:24','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'有没有设计类书推荐的',NULL,'WEB'),(66,'172.16.0.29','优酷','在线播放','','13:11:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'奇葩大会',NULL,'WEB'),(67,'172.16.0.30','百度云','下载文件','','09:23:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,'全家福.png',NULL,NULL,NULL,'WEB'),(68,'172.16.0.30','爱奇艺','在线播放','','09:50:11','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'特警力量',NULL,'WEB'),(69,'172.16.0.30','天涯社区','登陆','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','11:00:12','2017-04-08','不是不绅士',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(70,'172.16.0.30','QQ','收消息','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','11:00:50','2017-04-08','1288902365',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(71,'172.16.0.30','天涯社区','搜索','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','11:02:32','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'精选帖子',NULL,'WEB'),(72,'172.16.0.21','微信','收消息','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','12:11:11','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'IOS'),(73,'172.16.0.21','新浪邮箱','登陆','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','12:13:56','2017-04-08',NULL,NULL,NULL,'kkly@sina.com',NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(74,'172.16.0.21','铁血军事','评论','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','14:09:59','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'楼主真是血性汉子',NULL,'IOS'),(75,'172.16.0.21','搜狗搜索','搜索','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','14:30:33','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'乐视',NULL,'IOS'),(76,'172.16.0.21','乐视视频','在线播放','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','15:30:32','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'跨界冰雪王',NULL,'IOS'),(77,'172.16.0.22','铁血军事','评论','','13:56:03','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'楼主帖子不错，收藏了',NULL,'IOS'),(78,'172.16.0.22','爱奇艺','搜索','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','11:36:22','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'爸爸去哪',NULL,'IOS'),(79,'172.16.0.22','百度贴吧','搜索','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','13:02:45','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'足球吧',NULL,'IOS'),(80,'172.16.0.22','腾讯微博','搜索','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','13:22:32','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'歌手',NULL,'IOS'),(81,'172.16.0.22','QQ','收消息','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','13:26:30','2017-04-08','1200892507',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(82,'172.16.0.23','微信','发消息','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','07:29:02','2017-04-08','224370928',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(83,'172.16.0.23','腾讯视频','在线播放','\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n','12:24:00','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'看球听歌：詹皇演绎最强者',NULL,'IOS'),(84,'172.16.0.23','微信','收消息','','13:33:06','2017-04-08','224370928',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(85,'172.16.0.23','百度贴吧','搜索','','13:50:12','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'萌宠',NULL,'IOS'),(86,'172.16.0.23','乐视视频','搜索','','16:58:10','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NBA',NULL,'IOS'),(87,'172.16.0.24','腾讯视频','在线播放','','09:32:48','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'浦东发现死亡鲸鱼',NULL,'IOS'),(88,'172.16.0.24','微信','收消息','','10:14:23','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'IOS'),(89,'172.16.0.24','铁血军事','搜索','','14:09:08','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'军校',NULL,'IOS'),(90,'172.16.0.24','铁血军事','评论','','14:12:03','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'又长见识了，哈哈',NULL,'IOS'),(91,'172.16.0.24','QQ','收消息','','16:03:23','2017-04-08','278009812',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(92,'172.16.0.25','微信','登陆','','11:45:01','2017-04-08','882097639',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(93,'172.16.0.25','189邮箱','登陆','','11:50:04','2017-04-08',NULL,NULL,NULL,'fash_li@189.com',NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(94,'172.16.0.25','新浪微盘','下载','','12:30:12','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'现代文化巨匠全集文集',NULL,'IOS'),(95,'172.16.0.25','西祠胡同','搜索','','13:11:11','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'IOS'),(96,'172.16.0.25','乐视视频','在线播放','','13:50:00','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'舌尖上的中国第二季',NULL,'WEB'),(97,'172.16.0.26','微信','发消息','','07:40:31','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'WEB'),(98,'172.16.0.26','搜狐社区','搜索','','08:50:30','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关于理财',NULL,'WEB'),(99,'172.16.0.26','139邮箱','登陆','','11:22:10','2017-04-08',NULL,NULL,NULL,'wangzhichen@139.com',NULL,NULL,NULL,NULL,NULL,NULL,'WEB'),(100,'172.16.0.26','乐视视频','搜索','','13:29:09','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'危城',NULL,'WEB'),(101,'172.16.0.26','微信','收消息','','17:36:02','2017-04-08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'WEB');
/*!40000 ALTER TABLE `sheepwall_app_appbehaviorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheepwall_app_mac_ip`
--

DROP TABLE IF EXISTS `sheepwall_app_mac_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheepwall_app_mac_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(255) DEFAULT NULL,
  `Mac` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheepwall_app_mac_ip`
--

LOCK TABLES `sheepwall_app_mac_ip` WRITE;
/*!40000 ALTER TABLE `sheepwall_app_mac_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheepwall_app_mac_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheepwall_app_mobile_os_vulns`
--

DROP TABLE IF EXISTS `sheepwall_app_mobile_os_vulns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheepwall_app_mobile_os_vulns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os_type` varchar(10) DEFAULT NULL,
  `version_num` varchar(10) DEFAULT NULL,
  `vulns_detail` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheepwall_app_mobile_os_vulns`
--

LOCK TABLES `sheepwall_app_mobile_os_vulns` WRITE;
/*!40000 ALTER TABLE `sheepwall_app_mobile_os_vulns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheepwall_app_mobile_os_vulns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheepwall_app_wifiuser`
--

DROP TABLE IF EXISTS `sheepwall_app_wifiuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheepwall_app_wifiuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechat_nickname` varchar(40) DEFAULT NULL,
  `wechat_head_img` varchar(200) DEFAULT NULL,
  `os_type` varchar(10) DEFAULT NULL,
  `mac_addr` varchar(20) DEFAULT NULL,
  `local_ip` char(39) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheepwall_app_wifiuser`
--

LOCK TABLES `sheepwall_app_wifiuser` WRITE;
/*!40000 ALTER TABLE `sheepwall_app_wifiuser` DISABLE KEYS */;
INSERT INTO `sheepwall_app_wifiuser` VALUES (1,'记忆承载将来','','Android','F4-CB-52-33-2A-6B','172.16.0.11'),(2,'amao','','Android','F4-CB-52-5C-3B-77','172.16.0.12'),(3,'余音未静','','Android','F4-CB-52-5A-66-1A','172.16.0.13'),(4,'笑看人生','','Android','AC-C1-EE-89-1A-9D','172.16.0.14'),(5,'蓝色的天空','','Android','22-80-58-2D-24-3B','172.16.0.15'),(6,'小雪儿','','Android','12-5D-20-0A-8C-6D','172.16.0.16'),(7,'雪玲珑','','Android','68-3E-34-4A-8D-22','172.16.0.17'),(8,'从容岁月','','Android','68-3E-34-4E-8D-F2','172.16.0.18'),(9,'快乐天使','','IOS','A8-88-08-E5-16-8B','172.16.0.19'),(10,'西城楼阁','','IOS','A8-88-08-A5-88-8B','172.16.0.20'),(11,'独家记忆','','IOS','70-48-9D-89-7A-65','172.16.0.21'),(12,'美好生活','','IOS','70-48-9D-52-C7-76','172.16.0.22'),(13,'泽轩','','IOS','70-48-9D-11-AA-5B','172.16.0.23'),(14,'joker','','IOS','70-48-9D-5C-3A-11','172.16.0.24'),(15,'一生有你','','IOS','70-48-9D-48-9B-2D','172.16.0.25'),(16,'开心老爸','','Windows','70-48-9D-31-6B-2A','172.16.0.26'),(17,'淡雅清茶','','Windows','10-1A-3F-33-25-3A','172.16.0.27'),(18,'五分呗','','Windows','11-78-1A-3B-7D-99','172.16.0.28'),(19,'不落的太阳','','Windows','30-65-EC-7A-66-29','172.16.0.29'),(20,'心语心愿','','Windows','1A-3D-67-9C-11-56','172.16.0.30');
/*!40000 ALTER TABLE `sheepwall_app_wifiuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-30 13:57:34
