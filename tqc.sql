/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.41 : Database - tqc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tqc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tqc`;

/*Table structure for table `google_users` */

DROP TABLE IF EXISTS `google_users`;

CREATE TABLE `google_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `google_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified` tinyint(1) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `picture_url` text,
  `role` enum('student','supervisor','problem','problemmaintenance','problemsolver') DEFAULT 'student',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `google_id` (`google_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `google_users` */

insert  into `google_users`(`id`,`user_id`,`google_id`,`email`,`email_verified`,`name`,`given_name`,`family_name`,`picture_url`,`role`,`last_login`,`created_at`,`updated_at`) values 
(1,'EI101','110067925225148368632','jayanthan.ei23@bitsathy.ac.in',1,'JAYANTHAN S K','JAYANTHAN','S K','https://lh3.googleusercontent.com/a/ACg8ocKIPJ8lSrtZ99A8NoTTdXutCUCJ_NEuF6C3ErgFs5H1ZXWdG5Ub=s96-c','student','2025-03-18 09:10:07','2025-03-18 09:10:07','2025-03-18 09:10:07'),
(2,'ME101','100445767380229394918','yogeshkumar.me23@bitsathy.ac.in',1,'YOGESH KUMAR S','YOGESH KUMAR','S','https://lh3.googleusercontent.com/a/ACg8ocKBM1QJFOlfn9JNu56mYngJT_yr9H_1lYOMa57FWprqia96dw=s96-c','student','2025-03-18 09:10:07','2025-03-18 09:10:07','2025-03-18 09:10:07'),
(3,'CS101','113878430152990325630','raksith.cs23@bitsathy.ac.in',1,'RAKSITH S S','RAKSITH','S S','https://lh3.googleusercontent.com/a/ACg8ocIy6GYpN2ERqqGtOz3oY9hUV3xcAWsm98AkQ5dFDUGhJnxEkg=s96-c','problem','2025-03-19 09:36:47','2025-03-18 09:10:07','2025-03-19 09:36:47'),
(4,'AL101','108466155066633628839','mithunram.al23@bitsathy.ac.in',1,'MITHUNRAM S U','MITHUNRAM','S U','https://lh3.googleusercontent.com/a/ACg8ocL-N5vvIFf1rCwD0Aj0mvuYkszoZY_hzMNgZKevCZeFmiM-iQ=s96-c','problemmaintenance','2025-03-18 09:10:07','2025-03-18 09:10:07','2025-03-18 09:10:07'),
(5,'ME102','113493572680549530318','tharunkumar.me23@bitsathy.ac.in',1,'THARUN KUMAR P','THARUN KUMAR','P','https://lh3.googleusercontent.com/a/ACg8ocIND6OywxqTGDdUe4VGzDHCqI3lyG7ixO711CdpaJyWKs9XsA=s96-c','problemsolver','2025-03-18 09:10:07','2025-03-18 09:10:07','2025-03-18 09:10:07');

/*Table structure for table `master_login` */

DROP TABLE IF EXISTS `master_login`;

CREATE TABLE `master_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','supervisor','problem','problemmaintenance','problemsolver') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_login` */

insert  into `master_login`(`id`,`user_id`,`name`,`email`,`password`,`role`) values 
(1,'EI101','Jayanthan','1@gmail.com','123','student'),
(2,'ME101','Yogesh','2@gmail.com','123','supervisor'),
(3,'CS101','Raksith','3@gmail.com','123','problem'),
(4,'AD101','Kavin','4@gmail.com','123','problemmaintenance'),
(5,'AL101','Varshan','5@gmail.com','123','problemsolver');

/*Table structure for table `master_problem` */

DROP TABLE IF EXISTS `master_problem`;

CREATE TABLE `master_problem` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) DEFAULT NULL,
  `problem_title` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Media_Upload` varchar(255) DEFAULT NULL,
  `Questions_1` varchar(2055) DEFAULT NULL,
  `Questions_2` varchar(2055) DEFAULT NULL,
  `Questions_3` varchar(2055) DEFAULT NULL,
  `Questions_4` varchar(2055) DEFAULT NULL,
  `Questions_5` varchar(2055) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `status` enum('Accepted','Rejected') DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_problem` */

insert  into `master_problem`(`id`,`Category`,`problem_title`,`Description`,`Media_Upload`,`Questions_1`,`Questions_2`,`Questions_3`,`Questions_4`,`Questions_5`,`created_at`,`created_by`,`status`,`remarks`) values 
(1,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Rejected',''),
(2,'Time Management','asdfgh','kjhgfds','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','dfghjk','jhg','gre','rew','fre','2025-03-18 09:46:42','YourUser','Rejected',NULL),
(3,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(4,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(5,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(6,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(7,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(8,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(9,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(10,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(11,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(12,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(13,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(14,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(15,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(16,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(17,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL),
(18,'Time Management','sw','DSADSA','http://localhost:4000/uploads/Media_Upload-1742357060116.jpg','DW','WSAD','WD','WQD','WQD','2025-03-19 09:34:20','YourUser',NULL,NULL),
(19,'Mismanagement','aX','SAAX','http://localhost:4000/uploads/Media_Upload-1742270202529.jpg','sad','asd','asd','aDS','ASD','2025-03-18 09:26:42','YourUser','Accepted',NULL);

/*Table structure for table `master_prsolving` */

DROP TABLE IF EXISTS `master_prsolving`;

CREATE TABLE `master_prsolving` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `problem_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `media_upload` varchar(255) NOT NULL,
  `questions` varchar(2055) NOT NULL,
  `status_pr` enum('pending','in_progress','completed') NOT NULL DEFAULT 'pending',
  `deadline` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_prsolving` */

/*Table structure for table `master_supervisor` */

DROP TABLE IF EXISTS `master_supervisor`;

CREATE TABLE `master_supervisor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `problem_title` varchar(255) DEFAULT NULL,
  `status` enum('Accepted','Rejected') DEFAULT NULL,
  `remarks` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_supervisor` */

insert  into `master_supervisor`(`id`,`category`,`problem_title`,`status`,`remarks`,`created_at`,`created_by`) values 
(1,'React','Component Rendering Issue','Accepted',NULL,'2025-03-17 12:01:06','Your Name'),
(2,'Database','MySQL Connection Error','Rejected',NULL,'2025-03-17 12:01:06','Your Name');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
