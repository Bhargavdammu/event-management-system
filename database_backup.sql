-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: event_management
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add registration',7,'add_registration'),(26,'Can change registration',7,'change_registration'),(27,'Can delete registration',7,'delete_registration'),(28,'Can view registration',7,'view_registration'),(29,'Can add event',8,'add_event'),(30,'Can change event',8,'change_event'),(31,'Can delete event',8,'delete_event'),(32,'Can view event',8,'view_event'),(33,'Can add ticket',9,'add_ticket'),(34,'Can change ticket',9,'change_ticket'),(35,'Can delete ticket',9,'delete_ticket'),(36,'Can view ticket',9,'view_ticket'),(37,'Can add user',10,'add_customuser'),(38,'Can change user',10,'change_customuser'),(39,'Can delete user',10,'delete_customuser'),(40,'Can view user',10,'view_customuser'),(41,'Can add waitlist',11,'add_waitlist'),(42,'Can change waitlist',11,'change_waitlist'),(43,'Can delete waitlist',11,'delete_waitlist'),(44,'Can view waitlist',11,'view_waitlist'),(45,'Can add payment',12,'add_payment'),(46,'Can change payment',12,'change_payment'),(47,'Can delete payment',12,'delete_payment'),(48,'Can view payment',12,'view_payment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$QQZMAbruAupOD91oK3IPLR$ff8zWUkP/WIeCes6gRtIol+v/tD3PKWlamZQBTFDFio=','2025-02-13 14:22:51.054925',1,'bhargavdammu','','','bhargavdammu2@gmail.com',1,1,'2025-02-13 14:21:42.080596');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-02-13 16:30:21.244525','1','Tech Conference 2025',1,'[{\"added\": {}}]',8,1),(2,'2025-02-14 04:30:46.654967','4','Cybersecurity & Data Privacy Conference 2025',1,'[{\"added\": {}}]',8,1),(3,'2025-02-14 04:38:44.726470','5','India Tech Startup Expo 2025',1,'[{\"added\": {}}]',8,1),(4,'2025-02-14 13:02:09.621741','5','India Tech Startup Expo 2025',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(5,'2025-02-14 13:02:26.964325','5','India Tech Startup Expo 2025',2,'[]',8,1),(6,'2025-02-14 13:03:43.440415','4','Cybersecurity & Data Privacy Conference 2025',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(7,'2025-02-14 13:03:57.935404','5','India Tech Startup Expo 2025',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(8,'2025-02-14 13:04:08.619980','2','AI & Future Tech Summit 2025',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(9,'2025-02-14 13:04:17.336104','1','Tech Conference 2025',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(10,'2025-02-14 13:47:28.067937','6','National AI & Robotics Innovation Summit 2025',1,'[{\"added\": {}}]',8,1),(11,'2025-02-14 15:20:33.784113','7','India Cloud Computing & DevOps Summit 2025',1,'[{\"added\": {}}]',8,1),(12,'2025-02-14 17:57:56.014890','1','Tech Conference 2025',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(13,'2025-02-14 17:58:45.849790','5','India Tech Startup Expo 2025',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',8,1),(14,'2025-02-15 11:37:48.082139','8','Smart Cities & IoT India Expo 2025',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'events','event'),(12,'events','payment'),(7,'events','registration'),(9,'events','ticket'),(11,'events','waitlist'),(6,'sessions','session'),(10,'users','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-13 14:17:05.315493'),(2,'auth','0001_initial','2025-02-13 14:17:06.861005'),(3,'admin','0001_initial','2025-02-13 14:17:07.252183'),(4,'admin','0002_logentry_remove_auto_add','2025-02-13 14:17:07.271829'),(5,'admin','0003_logentry_add_action_flag_choices','2025-02-13 14:17:07.287652'),(6,'contenttypes','0002_remove_content_type_name','2025-02-13 14:17:07.558038'),(7,'auth','0002_alter_permission_name_max_length','2025-02-13 14:17:07.731886'),(8,'auth','0003_alter_user_email_max_length','2025-02-13 14:17:07.776454'),(9,'auth','0004_alter_user_username_opts','2025-02-13 14:17:07.796349'),(10,'auth','0005_alter_user_last_login_null','2025-02-13 14:17:07.929608'),(11,'auth','0006_require_contenttypes_0002','2025-02-13 14:17:07.938233'),(12,'auth','0007_alter_validators_add_error_messages','2025-02-13 14:17:07.956188'),(13,'auth','0008_alter_user_username_max_length','2025-02-13 14:17:08.118373'),(14,'auth','0009_alter_user_last_name_max_length','2025-02-13 14:17:08.286044'),(15,'auth','0010_alter_group_name_max_length','2025-02-13 14:17:08.327185'),(16,'auth','0011_update_proxy_permissions','2025-02-13 14:17:08.345128'),(17,'auth','0012_alter_user_first_name_max_length','2025-02-13 14:17:08.522878'),(18,'sessions','0001_initial','2025-02-13 14:17:08.615684'),(19,'events','0001_initial','2025-02-13 14:31:42.956385'),(20,'users','0001_initial','2025-02-13 14:41:24.371487'),(21,'users','0002_customuser_role','2025-02-13 14:53:14.741423'),(22,'events','0002_event_created_at_alter_event_title','2025-02-13 15:05:31.648760'),(23,'events','0003_alter_event_created_at','2025-02-13 15:08:34.629874'),(24,'events','0004_event_image','2025-02-14 03:04:09.610475'),(25,'events','0005_remove_event_created_at_remove_event_created_by_and_more','2025-02-14 04:26:55.335172'),(28,'users','0003_remove_customuser_role_customuser_phone_number_and_more','2025-02-14 12:58:24.906838'),(32,'events','0006_alter_event_category_alter_event_image','2025-02-14 18:19:52.369528'),(33,'events','0007_waitlist','2025-02-14 18:19:52.728780'),(34,'events','0008_ticket_ticket_id_alter_event_category_and_more','2025-02-14 18:19:52.982315'),(35,'events','0009_remove_ticket_ticket_id_ticket_qr_code_and_more','2025-02-14 18:19:53.272075'),(36,'events','0010_event_price','2025-02-14 18:19:53.401722'),(37,'events','0011_ticket_ticket_id_alter_ticket_price','2025-02-14 18:19:53.876780'),(38,'events','0012_rename_price_event_price_regular_event_capacity_and_more','2025-02-15 17:13:17.506069'),(39,'events','0013_ticket_payment_status_payment','2025-02-16 03:01:57.923738');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m2sllzmstn4drpqka33y0y9it9knvqyn','.eJxVjEEOwiAQRe_C2pCBkhFcuvcMZBgGqRqalHbVeHdt0oVu_3vvbyrSutS4dpnjmNVFOXX63RLxU9oO8oPafdI8tWUek94VfdCub1OW1_Vw_w4q9fqtrTXGUvGcQFB4oMS2iBB6kxFCMRgSkAvZIUigjGfDQGgd8wDBW_X-APx_OB4:1tjYjI:8ztCO9RAqimviU_T8VBkqpbpQuApIn_fNWalZ5MuJCQ','2025-03-02 07:06:16.321971');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_event`
--

DROP TABLE IF EXISTS `events_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `location` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price_regular` decimal(10,2) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `capacity` int unsigned NOT NULL,
  `price_vip` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `events_event_chk_1` CHECK ((`capacity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_event`
--

LOCK TABLES `events_event` WRITE;
/*!40000 ALTER TABLE `events_event` DISABLE KEYS */;
INSERT INTO `events_event` VALUES (1,'Tech Conference 2025','A conference about the latest in technology.','Hyderabad','2025-02-20 06:00:00.000000','event_images/default_event_0qR5qIP.jpg',0.00,NULL,100,0.00),(2,'AI & Future Tech Summit 2025','Join industry leaders, AI experts, and tech enthusiasts at the AI & Future Tech Summit 2025! This event will feature keynote speeches, panel discussions, and hands-on workshops on the latest advancements in artificial intelligence, machine learning, and emerging technologies. Network with professionals and gain insights into the future of tech innovation.','New Delhi, India','2025-04-05 09:20:00.000000','event_images/default_event_Ew5otqU.jpg',0.00,NULL,100,0.00),(4,'Cybersecurity & Data Privacy Conference 2025','The Cybersecurity & Data Privacy Conference 2025 brings together industry experts, ethical hackers, and cybersecurity professionals to discuss the latest threats, security solutions, and data privacy regulations. Learn from top security analysts, attend live hacking demonstrations, and explore strategies to protect digital assets in an evolving cyber landscape.','Mumbai, India','2025-05-15 11:30:00.000000','event_images/default_event.jpg',0.00,NULL,100,0.00),(5,'India Tech Startup Expo 2025','India Tech Startup Expo 2025 is the ultimate platform for startups, investors, and tech enthusiasts to connect, innovate, and grow. Explore groundbreaking innovations in AI, fintech, health tech, and SaaS. Attend insightful panel discussions, startup pitch sessions, and networking opportunities with industry leaders and venture capitalists.','New Delhi, India','2025-02-25 10:40:00.000000','event_images/default_event_bqUh4gR.jpg',0.00,NULL,100,0.00),(6,'National AI & Robotics Innovation Summit 2025','The National AI & Robotics Innovation Summit 2025 brings together researchers, developers, and industry leaders to explore the latest advancements in artificial intelligence and robotics. The event features expert-led keynotes, hands-on workshops, and live demonstrations of cutting-edge AI-powered robotics solutions. Connect with innovators and discover how AI is transforming industries.','Bengaluru, India','2025-03-20 06:00:00.000000','event_images/default_event_uwjK955.jpg',0.00,NULL,100,0.00),(7,'India Cloud Computing & DevOps Summit 2025','The India Cloud Computing & DevOps Summit 2025 is a premier event for cloud architects, developers, and IT professionals. Dive into discussions on cloud-native technologies, DevOps best practices, Kubernetes, and CI/CD automation. Learn from industry experts, attend hands-on workshops, and explore the future of cloud and DevOps innovation.','Hyderabad, India','2025-04-01 12:00:00.000000','default_event.jpg',0.00,NULL,100,0.00),(8,'Smart Cities & IoT India Expo 2025','The Smart Cities & IoT India Expo 2025 is a premier conference and exhibition focused on the role of the Internet of Things (IoT) in transforming urban infrastructure. Experts, policymakers, and tech leaders will discuss smart city innovations, sustainable urban planning, IoT-based automation, and AI-driven city solutions. Join us to explore the future of smart, connected cities!','Greater Noida, India','2025-03-30 12:45:00.000000','event_images/default_event_GLRReHT.jpg',25.00,'tech',100,0.00);
/*!40000 ALTER TABLE `events_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_payment`
--

DROP TABLE IF EXISTS `events_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `ticket_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `events_payment_user_id_a861d73e_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `events_payment_ticket_id_8e216c48_fk_events_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `events_ticket` (`id`),
  CONSTRAINT `events_payment_user_id_a861d73e_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_payment`
--

LOCK TABLES `events_payment` WRITE;
/*!40000 ALTER TABLE `events_payment` DISABLE KEYS */;
INSERT INTO `events_payment` VALUES (1,0.00,'Completed','2025-02-16 04:30:26.664285',8,2),(2,0.00,'Completed','2025-02-16 04:30:56.338574',9,2),(3,0.00,'Pending','2025-02-16 04:31:09.097064',10,2),(4,0.00,'Completed','2025-02-16 04:31:29.266150',11,2),(5,0.00,'Completed','2025-02-16 04:33:20.852196',12,2),(6,0.00,'Completed','2025-02-16 04:33:53.109644',13,2),(7,0.00,'Completed','2025-02-16 04:34:16.571250',14,2),(8,0.00,'Completed','2025-02-16 05:01:41.009095',15,2),(9,0.00,'Completed','2025-02-16 06:02:25.974303',16,4),(10,0.00,'Completed','2025-02-16 06:02:38.426071',17,4),(11,0.00,'Completed','2025-02-16 06:02:49.847779',18,4),(12,0.00,'Completed','2025-02-16 06:02:58.541044',19,4);
/*!40000 ALTER TABLE `events_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_registration`
--

DROP TABLE IF EXISTS `events_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `registered_at` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_registration_event_id_75b6f198_fk_events_event_id` (`event_id`),
  KEY `events_registration_user_id_2a61b516_fk_auth_user_id` (`user_id`),
  CONSTRAINT `events_registration_event_id_75b6f198_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_registration`
--

LOCK TABLES `events_registration` WRITE;
/*!40000 ALTER TABLE `events_registration` DISABLE KEYS */;
INSERT INTO `events_registration` VALUES (11,'2025-02-14 03:57:43.397970',1,1),(12,'2025-02-14 03:57:47.944809',2,1),(15,'2025-02-14 11:39:43.962192',4,1),(16,'2025-02-14 11:46:15.298666',5,1),(17,'2025-02-14 13:49:29.766444',6,1),(18,'2025-02-14 15:20:44.267521',7,1),(19,'2025-02-15 11:38:04.698754',8,1),(30,'2025-02-15 17:35:36.713364',1,2),(31,'2025-02-15 17:35:40.053066',4,2),(32,'2025-02-15 17:35:43.615303',5,2),(33,'2025-02-15 17:51:15.959647',8,2),(34,'2025-02-16 02:04:26.647722',2,2),(35,'2025-02-16 03:13:12.747925',6,2),(36,'2025-02-16 04:33:17.290578',7,2),(37,'2025-02-16 06:02:16.588215',1,4),(38,'2025-02-16 06:02:22.073685',6,4),(39,'2025-02-16 06:03:13.894873',2,4);
/*!40000 ALTER TABLE `events_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_ticket`
--

DROP TABLE IF EXISTS `events_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_type` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `issued_at` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `ticket_id` char(32) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `events_ticket_event_id_a43e217d_fk_events_event_id` (`event_id`),
  KEY `events_ticket_user_id_1e3922f7_fk_auth_user_id` (`user_id`),
  CONSTRAINT `events_ticket_event_id_a43e217d_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_ticket`
--

LOCK TABLES `events_ticket` WRITE;
/*!40000 ALTER TABLE `events_ticket` DISABLE KEYS */;
INSERT INTO `events_ticket` VALUES (1,'Regular',10.00,'2025-02-14 16:15:03.458025',1,1,'qrcodes/ticket_cf41f6aa-0b9f-4d80-b3e9-9d437bd4d2f1.png','cf41f6aa0b9f4d80b3e99d437bd4d2f1','Pending'),(8,'VIP',0.00,'2025-02-16 04:30:26.550903',1,2,'qrcodes/ticket_ca4184ca-4082-417e-8798-26c6ef1d4782.png','ca4184ca4082417e879826c6ef1d4782','Completed'),(9,'VIP',0.00,'2025-02-16 04:30:56.287960',2,2,'qrcodes/ticket_a4f6cdb1-bc9a-40f7-bd9a-7433005de237.png','a4f6cdb1bc9a40f7bd9a7433005de237','Completed'),(10,'VIP',0.00,'2025-02-16 04:31:09.039617',8,2,'qrcodes/ticket_12f32aed-3516-4124-942c-887b3b94f7a4.png','12f32aed35164124942c887b3b94f7a4','Pending'),(11,'VIP',0.00,'2025-02-16 04:31:29.217570',6,2,'qrcodes/ticket_48174a57-9696-4eac-ba4c-d4a4551f27fd.png','48174a5796964eacba4cd4a4551f27fd','Completed'),(12,'VIP',0.00,'2025-02-16 04:33:20.816675',7,2,'qrcodes/ticket_7dbc0a5d-4c5d-4d4a-8067-ce2f195d6ace.png','7dbc0a5d4c5d4d4a8067ce2f195d6ace','Completed'),(13,'Regular',0.00,'2025-02-16 04:33:53.076456',1,2,'qrcodes/ticket_7b61da85-ed31-477d-bb83-26738bbbb97c.png','7b61da85ed31477dbb8326738bbbb97c','Completed'),(14,'VIP',0.00,'2025-02-16 04:34:16.533548',4,2,'qrcodes/ticket_19acfbf6-b686-4305-b350-375acad0e819.png','19acfbf6b6864305b350375acad0e819','Completed'),(15,'VIP',0.00,'2025-02-16 05:01:40.963322',5,2,'qrcodes/ticket_87789517-1571-40c4-8c27-121d7ef3cbad.png','87789517157140c48c27121d7ef3cbad','Completed'),(16,'VIP',0.00,'2025-02-16 06:02:25.891391',6,4,'qrcodes/ticket_9e4ef485-aaef-4f4c-800c-b1b141879f9c.png','9e4ef485aaef4f4c800cb1b141879f9c','Completed'),(17,'Regular',0.00,'2025-02-16 06:02:38.391913',1,4,'qrcodes/ticket_7f8720cf-fe5c-4817-a89d-ee8766dc9c48.png','7f8720cffe5c4817a89dee8766dc9c48','Completed'),(18,'Regular',0.00,'2025-02-16 06:02:49.808341',2,4,'qrcodes/ticket_1ce781be-ee36-48fd-b7ac-c899dedd9093.png','1ce781beee3648fdb7acc899dedd9093','Completed'),(19,'VIP',0.00,'2025-02-16 06:02:58.507418',2,4,'qrcodes/ticket_49761120-aaa3-4a77-8a3d-a39ac6663932.png','49761120aaa34a778a3da39ac6663932','Completed');
/*!40000 ALTER TABLE `events_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_waitlist`
--

DROP TABLE IF EXISTS `events_waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_waitlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `joined_at` datetime(6) NOT NULL,
  `event_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_waitlist_event_id_3daef000_fk_events_event_id` (`event_id`),
  KEY `events_waitlist_user_id_f87b0521_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `events_waitlist_event_id_3daef000_fk_events_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`id`),
  CONSTRAINT `events_waitlist_user_id_f87b0521_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_waitlist`
--

LOCK TABLES `events_waitlist` WRITE;
/*!40000 ALTER TABLE `events_waitlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_waitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (1,'pbkdf2_sha256$870000$mQKXBlIEclzYzeoGRFWiCs$NRRNad0MLtAIx+zBSw06Mhzoy5n2d3yC0aGaSsP3yB8=','2025-02-16 07:05:44.733803',1,'bhargavdammu','','','bhargavdammu2@gmail.com',1,1,'2025-02-13 15:26:18.301080',NULL),(2,'pbkdf2_sha256$870000$UfZ5to6aczT2rYL0oLA2jP$Ym/bn+Z2wq7F8aELiQNbgbuTCe8tfnL9xgSdYBSdU8o=','2025-02-16 07:06:00.728803',0,'jaya','','','bhargavdammu5@gmail.com',0,1,'2025-02-15 16:57:57.625441',NULL),(4,'pbkdf2_sha256$870000$Ip0ayXC1mky8RRRHRdX78d$6RLYFg0+4EGQe8GJ3iRZYwR9tdzBZPksm73wRs3MQ6Y=','2025-02-16 07:06:16.313397',0,'Nand','','','bhargavdammu5@gmail.com',0,1,'2025-02-16 06:02:03.519950',NULL);
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-16 13:09:33
