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

/*Table structure for table `master_login` */

DROP TABLE IF EXISTS `master_login`;

CREATE TABLE `master_login` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_login` */

insert  into `master_login`(`id`,`email`,`password`,`role`) values 
(1,'jayanthan.ei23@bitsathy.ac.in','jayanthan','student'),
(2,'test1@bitsathy.ac.in','test1','supervisor'),
(3,'test2@bitsathy.ac.in','test2','problem'),
(4,'test3@bitsathy.ac.in','test3','maintainanace');

/*Table structure for table `master_maintain` */

DROP TABLE IF EXISTS `master_maintain`;

CREATE TABLE `master_maintain` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `Problem Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Media_Upload` varchar(255) NOT NULL,
  `Questions` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  `status_maintain` enum('') NOT NULL,
  `created_at` timestamp NOT NULL,
  `accepted_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_maintain` */

/*Table structure for table `master_problem` */

DROP TABLE IF EXISTS `master_problem`;

CREATE TABLE `master_problem` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `Problem Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Media_Upload` varchar(255) NOT NULL,
  `Questions` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_problem` */

/*Table structure for table `master_prsolving` */

DROP TABLE IF EXISTS `master_prsolving`;

CREATE TABLE `master_prsolving` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `Problem Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Media_Upload` varchar(255) NOT NULL,
  `Questions` varchar(255) NOT NULL,
  `status_pr` enum('') NOT NULL,
  `deadline` datetime NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_prsolving` */

/*Table structure for table `master_supervisor` */

DROP TABLE IF EXISTS `master_supervisor`;

CREATE TABLE `master_supervisor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) DEFAULT NULL,
  `Problem Title` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Media_Upload` varchar(255) DEFAULT NULL,
  `Questions` varchar(255) DEFAULT NULL,
  `status` enum('Accepted','Rejected') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_supervisor` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
