/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.36 : Database - tqc
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `google_users` */

insert  into `google_users`(`id`,`google_id`,`email`,`email_verified`,`name`,`given_name`,`family_name`,`picture_url`,`role`,`last_login`,`created_at`,`updated_at`) values 
(1,'110067925225148368632','jayanthan.ei23@bitsathy.ac.in',1,'JAYANTHAN S K','JAYANTHAN','S K','https://lh3.googleusercontent.com/a/ACg8ocKIPJ8lSrtZ99A8NoTTdXutCUCJ_NEuF6C3ErgFs5H1ZXWdG5Ub=s96-c','student','2025-03-13 16:11:46','2025-03-13 12:52:21','2025-03-13 16:11:46'),
(2,'100445767380229394918','yogeshkumar.me23@bitsathy.ac.in',1,'YOGESH KUMAR S','YOGESH KUMAR','S','https://lh3.googleusercontent.com/a/ACg8ocKBM1QJFOlfn9JNu56mYngJT_yr9H_1lYOMa57FWprqia96dw=s96-c','student','2025-03-14 11:13:01','2025-03-13 13:28:36','2025-03-14 11:13:01');

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
  `Questions 1` varchar(2055) NOT NULL,
  `Questions 2` varchar(2055) NOT NULL,
  `Questions 3` varchar(2055) NOT NULL,
  `Questions 4` varchar(2055) NOT NULL,
  `Questions 5` varchar(2055) NOT NULL,
  `created_at` timestamp NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` enum('Accepted','Rejected') DEFAULT NULL,
  `Remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_problem` */

insert  into `master_problem`(`id`,`Category`,`Problem Title`,`Description`,`Media_Upload`,`Questions 1`,`Questions 2`,`Questions 3`,`Questions 4`,`Questions 5`,`created_at`,`created_by`,`status`,`Remarks`) values 
(1,'Productivity failure','Water leakage','Unintended escape of water from pipes, fixtures, or structures, leading to potential damage and waste in AS block.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, I have analyzed the error messages and identified potential causes related to dependency conflicts, missing packages, and incorrect API requests.','The problem arose while setting up Google authentication in the React application using @react-oauth/google','The problem occurred in the Login.jsx file inside the React project.','The issue involves dependency resolution errors, a missing jwt-decode package, an outdated Vite optimize dependency, and an Axios 404 error while handling Google login.','The error appeared during the project setup and while running the development server with npm start','2025-03-13 14:21:49','Jayanthan',NULL,NULL),
(2,'Productivity failure','Google Login Failure','Unintended escape of water from pipes, fixtures, or structures, leading to potential damage and waste in AS block.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked API configuration and dependencies.','It started after updating npm packages.','Issue occurred in the Login.jsx file.','Dependency conflict and missing jwt-decode package.','Error appeared while running the dev server.','2025-03-13 14:26:26','admin',NULL,NULL),
(3,'Database','MySQL Connection Error','Cannot connect to MySQL database','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked MySQL service and connection string.','Started after updating MySQL Workbench.','Occurred on the backend server.','Issue with database credentials or permissions.','Happened while executing SQL queries.','2025-03-13 14:26:26','developer1',NULL,NULL),
(4,'Frontend','Vite Dependency Error','Vite fails to optimize dependencies','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, tried clearing Vite cache.','Started after adding a new dependency.','Occurred in the React frontend.','Caused by outdated package versions.','Error showed up when running npm run dev.','2025-03-13 14:26:26','frontend_dev',NULL,NULL),
(5,'Backend','Axios Request Failure','Backend API returns a 500 error','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked API logs and response data.','Began after modifying API endpoints.','Happened in the Express.js backend.','Issue with request payload format.','Error triggered during API testing.','2025-03-13 14:26:26','backend_dev',NULL,NULL),
(6,'Linux','Flutter Setup Issues','Unable to install Flutter on Arch Linux','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, reviewed installation steps.','Started during Flutter environment setup.','Happened on an Arch Linux system.','Caused by missing dependencies.','Error appeared while running flutter doctor.','2025-03-13 14:26:26','sysadmin',NULL,NULL),
(7,'React','Component Rendering Issue','React component fails to update state','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked useState and useEffect hooks.','Started after changing component logic.','Issue appears in the Dashboard component.','Caused by incorrect state mutation.','Error happens when clicking a button.','2025-03-13 14:26:26','react_dev',NULL,NULL),
(8,'Node.js','JWT Token Expiry Issue','JWT tokens expire too soon','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked JWT expiration settings.','Started after modifying authentication logic.','Occurred in the Node.js backend.','Issue with token generation parameters.','Users get logged out unexpectedly.','2025-03-13 14:26:26','backend_team',NULL,NULL),
(9,'Deployment','Docker Container Crashes','Docker container exits unexpectedly','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, reviewed Docker logs and configs.','Started after updating the Dockerfile.','Happened on a production server.','Issue with resource limits or dependencies.','Container restarts after a few seconds.','2025-03-13 14:26:26','devops_admin',NULL,NULL),
(10,'Android','Gradle Build Failure','Android project fails to build in Android Studio','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, tried cleaning and rebuilding the project.','Started after updating dependencies.','Issue occurs in the Android project.','Caused by incompatible Gradle versions.','Build fails with missing class errors.','2025-03-13 14:26:26','android_dev',NULL,NULL),
(11,'Git','Merge Conflict Issue','Unable to merge branches due to conflicts','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc07dstq61zZdkkjXOgu6yRKP69bfnjcDX1ArKJ01OR-oIJ_v7j14mMkk&s','Yes, checked conflicting files.','Started after a team member pushed changes.','Occurred in the main project repository.','Caused by conflicting code changes.','Merge fails with conflict error message.','2025-03-13 14:26:26','team_lead',NULL,NULL);

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
  `status` enum('Accepted','Rejected') DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `master_supervisor` */

insert  into `master_supervisor`(`id`,`Category`,`Problem Title`,`status`,`Remarks`,`created_at`,`created_by`) values 
(2,'React','Component Rendering Issue','Accepted',NULL,'2025-03-14 15:47:23','Your Name'),
(3,'React','Component Rendering Issue','Accepted',NULL,'2025-03-14 15:48:10','Your Name'),
(4,'Database','MySQL Connection Error','Rejected',NULL,'2025-03-14 15:48:28','Your Name'),
(5,'Database','MySQL Connection Error','Rejected',NULL,'2025-03-14 15:59:29','Your Name');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
