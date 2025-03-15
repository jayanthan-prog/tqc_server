/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.41 : Database - tqcfinal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tqcfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tqcfinal`;

/*Table structure for table `google_users` */

DROP TABLE IF EXISTS `google_users`;

CREATE TABLE `google_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified` tinyint(1) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `picture_url` text,
  `role` varchar(50) DEFAULT 'student',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `google_id` (`google_id`),
  UNIQUE KEY `email` (`email`),
  KEY `email_2` (`email`),
  KEY `google_id_2` (`google_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `google_users` */

insert  into `google_users`(`id`,`google_id`,`email`,`email_verified`,`name`,`given_name`,`family_name`,`picture_url`,`role`,`last_login`,`created_at`,`updated_at`) values 
(1,'110067925225148368632','jayanthan.ei23@bitsathy.ac.in',1,'JAYANTHAN S K','JAYANTHAN','S K','https://lh3.googleusercontent.com/a/ACg8ocKIPJ8lSrtZ99A8NoTTdXutCUCJ_NEuF6C3ErgFs5H1ZXWdG5Ub=s96-c','student','2025-03-13 16:11:46','2025-03-13 12:52:21','2025-03-13 16:11:46'),
(2,'100445767380229394918','yogeshkumar.me23@bitsathy.ac.in',1,'YOGESH KUMAR S','YOGESH KUMAR','S','https://lh3.googleusercontent.com/a/ACg8ocKBM1QJFOlfn9JNu56mYngJT_yr9H_1lYOMa57FWprqia96dw=s96-c','student','2025-03-14 11:13:01','2025-03-13 13:28:36','2025-03-14 11:13:01'),
(3,'113878430152990325630','raksith.cs23@bitsathy.ac.in',1,'RAKSITH S S','RAKSITH','S S','https://lh3.googleusercontent.com/a/ACg8ocIy6GYpN2ERqqGtOz3oY9hUV3xcAWsm98AkQ5dFDUGhJnxEkg=s96-c','student','2025-03-15 15:19:11','2025-03-15 15:19:11','2025-03-15 15:19:11');

/*Table structure for table `master_login` */

DROP TABLE IF EXISTS `master_login`;

CREATE TABLE `master_login` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('problem raiser','problem solver','superviser','maintainance') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_login` */

insert  into `master_login`(`id`,`name`,`email`,`role`) values 
(1,'jayanthan','jayanthan.ei23@bitsathy.ac.in','problem raiser'),
(2,'test1','test1@bitsathy.ac.in','maintainance'),
(3,'test2','test2@bitsathy.ac.in','problem solver'),
(4,'test3','test3@bitsathy.ac.in','superviser');

/*Table structure for table `master_maintain` */

DROP TABLE IF EXISTS `master_maintain`;

CREATE TABLE `master_maintain` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  `status` enum('Accepted','Rejected') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `master_maintain_created_by_foreign` (`created_by`),
  CONSTRAINT `master_maintain_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `master_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_maintain` */

/*Table structure for table `pr_bank` */

DROP TABLE IF EXISTS `pr_bank`;

CREATE TABLE `pr_bank` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` int unsigned NOT NULL,
  `problem_tilte` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `media_upload` varchar(1000) NOT NULL,
  `question1` varchar(1000) NOT NULL,
  `question2` varchar(1000) NOT NULL,
  `question3` varchar(1000) NOT NULL,
  `question4` varchar(1000) NOT NULL,
  `question5` varchar(255) NOT NULL,
  `problem_severity` enum('') NOT NULL,
  `status` enum('Accepted','Rejected') NOT NULL,
  `Remarks` varchar(255) NOT NULL,
  `Deadline` date NOT NULL,
  `rp` int NOT NULL,
  `assign_to` enum('PR TEAM','OTHERS') NOT NULL,
  `assign_by` int unsigned NOT NULL,
  `maintainance` int unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pr_bank_maintainance_foreign` (`maintainance`),
  KEY `pr_bank_category_foreign` (`category`),
  KEY `pr_bank_created_by_foreign` (`created_by`),
  CONSTRAINT `pr_bank_category_foreign` FOREIGN KEY (`category`) REFERENCES `superviser` (`id`),
  CONSTRAINT `pr_bank_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `master_login` (`id`),
  CONSTRAINT `pr_bank_maintainance_foreign` FOREIGN KEY (`maintainance`) REFERENCES `master_maintain` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pr_bank` */

/*Table structure for table `problem_raiser` */

DROP TABLE IF EXISTS `problem_raiser`;

CREATE TABLE `problem_raiser` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` int unsigned NOT NULL,
  `problem_tilte` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `media_upload` varchar(1000) NOT NULL,
  `question1` varchar(1000) NOT NULL,
  `question2` varchar(1000) NOT NULL,
  `question3` varchar(1000) NOT NULL,
  `question4` varchar(1000) NOT NULL,
  `question5` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_raiser_created_by_foreign` (`created_by`),
  CONSTRAINT `problem_raiser_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `master_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `problem_raiser` */

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question1` varchar(1000) NOT NULL,
  `question2` bigint NOT NULL,
  `question3` varchar(1000) NOT NULL,
  `question4` varchar(1000) NOT NULL,
  `question5` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `questions` */

/*Table structure for table `superviser` */

DROP TABLE IF EXISTS `superviser`;

CREATE TABLE `superviser` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` int unsigned NOT NULL,
  `problem_tilte` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `media_upload` varchar(1000) NOT NULL,
  `question1` varchar(1000) NOT NULL,
  `question2` varchar(1000) NOT NULL,
  `question3` varchar(1000) NOT NULL,
  `question4` varchar(1000) NOT NULL,
  `question5` varchar(255) NOT NULL,
  `problem_severity` enum('') NOT NULL,
  `status` enum('Accepted','Rejected') NOT NULL,
  `Remarks` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `superviser_category_foreign` (`category`),
  KEY `superviser_updated_by_foreign` (`updated_by`),
  CONSTRAINT `superviser_category_foreign` FOREIGN KEY (`category`) REFERENCES `problem_raiser` (`id`),
  CONSTRAINT `superviser_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `master_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `superviser` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
