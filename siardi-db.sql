-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table si_ardi.auth_groups_users
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE IF NOT EXISTS `auth_groups_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_groups_users: ~11 rows (approximately)
DELETE FROM `auth_groups_users`;
/*!40000 ALTER TABLE `auth_groups_users` DISABLE KEYS */;
INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
	(1, 1, 'user', '2022-08-28 22:10:02'),
	(2, 2, 'user', '2022-08-31 09:55:29'),
	(3, 3, 'admin', '2022-08-31 10:42:54'),
	(4, 4, 'user', '2022-09-07 15:32:17'),
	(5, 5, 'user', '2022-09-08 09:55:35'),
	(6, 6, 'user', '2022-09-08 09:56:08'),
	(7, 7, 'user', '2022-09-08 09:56:28'),
	(8, 8, 'user', '2022-09-08 09:56:48'),
	(9, 9, 'user', '2022-09-08 09:57:09'),
	(10, 10, 'user', '2022-09-08 09:57:34'),
	(11, 11, 'user', '2022-09-08 09:57:52');
/*!40000 ALTER TABLE `auth_groups_users` ENABLE KEYS */;

-- Dumping structure for table si_ardi.auth_identities
DROP TABLE IF EXISTS `auth_identities`;
CREATE TABLE IF NOT EXISTS `auth_identities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `secret2` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text,
  `force_reset` tinyint(1) NOT NULL DEFAULT '0',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_secret` (`type`,`secret`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_identities: ~11 rows (approximately)
DELETE FROM `auth_identities`;
/*!40000 ALTER TABLE `auth_identities` DISABLE KEYS */;
INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'email_password', NULL, 'zakisarjudin@gmail.com', '$2y$10$169QQpY/fJnnmsQRz/TMHuSmFVi7WVzBmAgPRtkS7rMRTTe2P3LMy', NULL, NULL, 0, '2022-09-07 10:36:37', '2022-08-28 22:10:02', '2022-09-07 10:36:37'),
	(3, 2, 'email_password', NULL, 'zackyesddark@yahoo.com', '$2y$10$169QQpY/fJnnmsQRz/TMHuSmFVi7WVzBmAgPRtkS7rMRTTe2P3LMy', NULL, NULL, 0, '2022-09-09 04:55:09', '2022-08-31 09:55:29', '2022-09-09 04:55:09'),
	(4, 3, 'email_password', NULL, 'administrator@gmail.com', '$2y$10$Q0ysP5aaSADW.BPehX6exulqvkhuP9Wu3MIKpb6QZIeOaQxtA59hO', NULL, NULL, 0, '2022-09-07 22:37:47', '2022-08-31 10:42:54', '2022-09-07 22:37:47'),
	(5, 4, 'email_password', NULL, 'hermawan@gmail.com', '$2y$10$h95ZsIuMsGYUywyW3no2pextWRdTpTAX14qRhiIc52jM.PQghFfmK', NULL, NULL, 0, '2022-09-07 20:48:58', '2022-09-07 15:32:17', '2022-09-07 20:48:58'),
	(6, 5, 'email_password', NULL, 'andry@gmail.com', '$2y$10$MrfggTeCZeNCg505guwyjO3byJBsZKA1Ft6kQBu6UN..zHtbAmjVO', NULL, NULL, 0, NULL, '2022-09-08 09:55:35', '2022-09-08 09:55:35'),
	(7, 6, 'email_password', NULL, 'vincent@gmail.com', '$2y$10$5Go8rm4udRaNYZW.v7G3ROS/5L6gjruHtTcGZSRzjKuJhjJVXyjVy', NULL, NULL, 0, NULL, '2022-09-08 09:56:08', '2022-09-08 09:56:08'),
	(8, 7, 'email_password', NULL, 'urayarif@gmail.com', '$2y$10$eX4xNjjABM0R./e5/8a6xumYOCfaWV497vow1De3TKTSoiCv0luL.', NULL, NULL, 0, NULL, '2022-09-08 09:56:28', '2022-09-08 09:56:28'),
	(9, 8, 'email_password', NULL, 'sonia@gmail.com', '$2y$10$wLW4UHFZVfyOech9N7QCmuJEPVkt4xfwCGvpuXUQJnyz2IN3sa6JW', NULL, NULL, 0, NULL, '2022-09-08 09:56:48', '2022-09-08 09:56:48'),
	(10, 9, 'email_password', NULL, 'andini@gmail.com', '$2y$10$pmnI2DVHgKbf6Ls2N0mYtuekznOOCehe.YTJbATp7iJInuptzXeRu', NULL, NULL, 0, NULL, '2022-09-08 09:57:09', '2022-09-08 09:57:09'),
	(11, 10, 'email_password', NULL, 'eva@gmail.com', '$2y$10$z6d2oSFpDr7LP0oKond9IuFaCG.sgJWdh0MftJJACOr7gpdZG4iNO', NULL, NULL, 0, NULL, '2022-09-08 09:57:34', '2022-09-08 09:57:34'),
	(12, 11, 'email_password', NULL, 'cristin@gmail.com', '$2y$10$7CBDCjslEoaebdtTvyPCnurqL0q/JQE3.UoPna8VJRutaS6kWCW/a', NULL, NULL, 0, NULL, '2022-09-08 09:57:52', '2022-09-08 09:57:52');
/*!40000 ALTER TABLE `auth_identities` ENABLE KEYS */;

-- Dumping structure for table si_ardi.auth_logins
DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE IF NOT EXISTS `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_logins: ~55 rows (approximately)
DELETE FROM `auth_logins`;
/*!40000 ALTER TABLE `auth_logins` DISABLE KEYS */;
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
	(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zakisarjudin@gmail.com', NULL, '2022-08-28 22:06:57', 0),
	(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zakisarjudin@gmail.com', 1, '2022-08-28 22:10:45', 1),
	(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 10:11:03', 1),
	(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 10:16:58', 1),
	(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 10:28:20', 1),
	(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'adminstrator@kominfolandak.com', NULL, '2022-08-31 10:39:55', 0),
	(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 10:50:49', 1),
	(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 10:50:57', 1),
	(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 11:00:59', 1),
	(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 11:01:10', 1),
	(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 14:02:06', 1),
	(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 14:46:17', 1),
	(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 16:02:39', 1),
	(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahooe.com', NULL, '2022-08-31 16:02:50', 0),
	(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', NULL, '2022-08-31 16:02:58', 0),
	(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', NULL, '2022-08-31 16:03:09', 0),
	(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-08-31 16:14:08', 1),
	(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 16:14:19', 1),
	(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 16:15:36', 1),
	(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 16:15:49', 1),
	(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-08-31 16:41:45', 1),
	(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 05:23:45', 1),
	(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 05:25:53', 1),
	(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 05:32:15', 1),
	(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 07:14:55', 1),
	(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 07:21:26', 1),
	(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 07:25:20', 1),
	(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 07:56:55', 1),
	(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 09:19:19', 1),
	(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 09:23:01', 1),
	(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 09:25:51', 1),
	(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-01 14:57:23', 1),
	(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 17:02:12', 1),
	(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-01 17:04:32', 1),
	(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-04 07:49:51', 1),
	(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-04 16:46:36', 1),
	(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-04 17:20:10', 1),
	(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-04 17:20:45', 1),
	(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-05 06:05:59', 1),
	(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-05 14:07:09', 1),
	(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-06 09:31:00', 1),
	(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 08:28:15', 1),
	(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 08:30:55', 1),
	(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zakisarjudin@gmail.com', 1, '2022-09-07 10:36:37', 1),
	(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 11:21:26', 1),
	(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 13:57:30', 1),
	(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'hermawan@gmail.com', 4, '2022-09-07 15:38:56', 1),
	(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'hermawan@gmail.com', 4, '2022-09-07 15:39:11', 1),
	(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'hermawan@gmail.com', 4, '2022-09-07 18:27:37', 1),
	(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'hermawan@gmail.com', 4, '2022-09-07 18:47:23', 1),
	(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 18:47:45', 1),
	(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-07 20:22:02', 1),
	(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'hermawan@gmail.com', 4, '2022-09-07 20:48:58', 1),
	(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'administrator@gmail.com', 3, '2022-09-07 22:37:47', 1),
	(55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-07 22:38:48', 1),
	(56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-08 04:46:38', 1),
	(57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-08 07:07:19', 1),
	(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-08 07:15:35', 1),
	(59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-08 09:58:02', 1),
	(60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-08 10:47:56', 1),
	(61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'email_password', 'zackyesddark@yahoo.com', 2, '2022-09-09 04:55:09', 1);
/*!40000 ALTER TABLE `auth_logins` ENABLE KEYS */;

-- Dumping structure for table si_ardi.auth_permissions_users
DROP TABLE IF EXISTS `auth_permissions_users`;
CREATE TABLE IF NOT EXISTS `auth_permissions_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_permissions_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_permissions_users: ~0 rows (approximately)
DELETE FROM `auth_permissions_users`;
/*!40000 ALTER TABLE `auth_permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permissions_users` ENABLE KEYS */;

-- Dumping structure for table si_ardi.auth_remember_tokens
DROP TABLE IF EXISTS `auth_remember_tokens`;
CREATE TABLE IF NOT EXISTS `auth_remember_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `auth_remember_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_remember_tokens: ~0 rows (approximately)
DELETE FROM `auth_remember_tokens`;
/*!40000 ALTER TABLE `auth_remember_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_remember_tokens` ENABLE KEYS */;

-- Dumping structure for table si_ardi.auth_token_logins
DROP TABLE IF EXISTS `auth_token_logins`;
CREATE TABLE IF NOT EXISTS `auth_token_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.auth_token_logins: ~0 rows (approximately)
DELETE FROM `auth_token_logins`;
/*!40000 ALTER TABLE `auth_token_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_token_logins` ENABLE KEYS */;

-- Dumping structure for table si_ardi.downloads
DROP TABLE IF EXISTS `downloads`;
CREATE TABLE IF NOT EXISTS `downloads` (
  `download_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `history_file_name` varchar(200) NOT NULL,
  `history_file_size` varchar(200) DEFAULT NULL,
  `history_file_extension` varchar(200) DEFAULT NULL,
  `history_folder_name` varchar(200) DEFAULT NULL,
  `history_uploader_username` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`download_id`),
  KEY `FK_downloads_users` (`user_id`),
  KEY `FK_downloads_files` (`file_id`),
  CONSTRAINT `FK_downloads_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.downloads: ~31 rows (approximately)
DELETE FROM `downloads`;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` (`download_id`, `user_id`, `file_id`, `history_file_name`, `history_file_size`, `history_file_extension`, `history_folder_name`, `history_uploader_username`, `created_at`) VALUES
	(1, 2, 12, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '236.829', 'jpeg', 'Sekretariat', 'zackyes', '2022-09-07 10:27:26'),
	(2, 2, 12, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '236.829', 'jpeg', 'Sekretariat', 'zackyes', '2022-09-07 11:23:44'),
	(3, 2, 12, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '236.829', 'jpeg', 'Sekretariat', 'zackyes', '2022-09-07 11:24:24'),
	(4, 2, 3, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:25:05'),
	(5, 2, 3, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:25:05'),
	(6, 2, 3, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:15'),
	(7, 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:20'),
	(8, 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:20'),
	(9, 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:24'),
	(10, 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:29'),
	(11, 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 11:26:29'),
	(12, 2, 14, 'BEM license.png', '384.860', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 11:28:07'),
	(13, 2, 14, 'BEM license.png', '384.860', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 11:28:08'),
	(14, 2, 15, '—Pngtree—s hand logo design vector_5323753.jpg', '1,226.366', 'jpg', 'Statistik dan Persandian', 'zackyes', '2022-09-07 11:31:13'),
	(15, 2, 3, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', '242513', 'jpeg', 'Hubungan Masyarakat', 'zackyes', '2022-09-07 14:25:53'),
	(16, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:27'),
	(17, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:28'),
	(18, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:32'),
	(19, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:33'),
	(20, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:35'),
	(21, 2, 21, 'tppasn-alur buat surat.png', '42.966', 'png', 'Teknologi Informasi dan Komunikasi', 'zackyes', '2022-09-07 14:36:36'),
	(22, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 15:47:23'),
	(23, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:28:12'),
	(24, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:28:13'),
	(25, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:29:12'),
	(26, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:36:30'),
	(27, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:36:30'),
	(28, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:37:56'),
	(29, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:37:56'),
	(30, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:38:22'),
	(31, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:40:22'),
	(32, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:40:25'),
	(33, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:40:27'),
	(34, 4, 24, 'standar pengembangan aplikasi.xlsx', '11.333', 'xlsx', 'Sekretariat', 'hermawan', '2022-09-07 18:41:19');
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;

-- Dumping structure for table si_ardi.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` varchar(100) NOT NULL DEFAULT '',
  `file_extension` varchar(100) NOT NULL,
  `access_modifier` enum('public','private') NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `FK_files_folders` (`folder_id`),
  KEY `FK_files_users` (`user_id`),
  CONSTRAINT `FK_files_folders` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`folder_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_files_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.files: ~9 rows (approximately)
DELETE FROM `files`;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` (`file_id`, `uuid`, `user_id`, `folder_id`, `file_name`, `file_path`, `file_size`, `file_extension`, `access_modifier`, `created_at`) VALUES
	(1, '3b1742fe-29fb-11ed-b41d-80fa5b4693a8', 2, 2, 'Laporan Kinerja Bulan Januari', 'tes', '385', 'docx', 'public', '2022-09-01 20:37:26'),
	(2, '502f4e5b-2cb6-11ed-9921-80fa5b4693a8', 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', 'uploads/user-files/2022-09/SIARDI_63154A79DEF20/', '242513', 'jpeg', 'public', '2022-09-05 08:01:45'),
	(3, '8b8156f0-2cb7-11ed-9921-80fa5b4693a8', 2, 2, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', 'uploads/user-files/2022-09/SIARDI_63154C8AE717B/', '242513', 'jpeg', 'public', '2022-09-05 08:10:34'),
	(12, '9ea94334-2ce9-11ed-9921-80fa5b4693a8', 2, 1, 'WhatsApp Image 2022-08-31 at 11.15.21 AM.jpeg', 'uploads/user-files/2022-09/SIARDI_6315A08DD8334/', '236.829', 'jpeg', 'public', '2022-09-05 14:09:01'),
	(17, 'f941f3e5-2e7a-11ed-b1e9-80fa5b4693a8', 2, 4, '5485457.jpg', 'uploads/user-files/2022-09/SIARDI_631841E8C04CE/', '247.253', 'jpg', 'private', '2022-09-07 14:02:00'),
	(19, '68cb4a9b-2e7b-11ed-b1e9-80fa5b4693a8', 2, 2, 'struktur organisasi.png', 'uploads/user-files/2022-09/SIARDI_631842A3E26F7/', '127.593', 'png', 'private', '2022-09-07 14:05:07'),
	(20, '78b5f8b9-2e7b-11ed-b1e9-80fa5b4693a8', 2, 3, 'kategori-jabatn.png', 'uploads/user-files/2022-09/SIARDI_631842BE99E2D/', '68.597', 'png', 'private', '2022-09-07 14:05:34'),
	(24, '63aa5439-2e89-11ed-b1e9-80fa5b4693a8', 4, 1, 'standar pengembangan aplikasi.xlsx', 'uploads/user-files/2022-09/SIARDI_63185A1843BB5/', '11.333', 'xlsx', 'public', '2022-09-07 15:45:12'),
	(27, '85e46d8d-2efa-11ed-a9f5-80fa5b4693a8', 2, 2, '282_Arrow_Set.jpg', 'uploads/user-files/2022-09/SIARDI_631917E60CABB/', '293.679', 'jpg', 'public', '2022-09-08 05:15:02'),
	(28, '9cc2319c-2efa-11ed-a9f5-80fa5b4693a8', 2, 2, '5485457.jpg', 'uploads/user-files/2022-09/SIARDI_6319180C65E2D/', '247.253', 'jpg', 'public', '2022-09-08 05:15:40');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- Dumping structure for table si_ardi.folders
DROP TABLE IF EXISTS `folders`;
CREATE TABLE IF NOT EXISTS `folders` (
  `folder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_folder_id` int(10) unsigned DEFAULT NULL,
  `folder_name` varchar(200) NOT NULL,
  `folder_description` varchar(200) DEFAULT NULL,
  `folder_icon` varchar(200) NOT NULL DEFAULT 'bxs-folder-open',
  `folder_slug` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `folder_slug` (`folder_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.folders: ~4 rows (approximately)
DELETE FROM `folders`;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` (`folder_id`, `parent_folder_id`, `folder_name`, `folder_description`, `folder_icon`, `folder_slug`, `created_at`) VALUES
	(1, NULL, 'Sekretariat', 'Bidang Sekretariat', 'bxs-folder-open', 'sekretariat', '2022-09-01 20:39:28'),
	(2, NULL, 'Hubungan Masyarakat', 'Bidang Humas dan Media Informasi Publik', 'bxs-folder-open', 'humas', '2022-09-01 20:40:05'),
	(3, NULL, 'Teknologi Informasi dan Komunikasi', 'Bidang Teknologi Informasi dan Komunikasi', 'bxs-folder-open', 'tik', '2022-09-01 20:41:03'),
	(4, NULL, 'Statistik dan Persandian', 'Bidang Statistik dan Persandian', 'bxs-folder-open', 'sp', '2022-09-01 20:41:32');
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;

-- Dumping structure for table si_ardi.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menu_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(200) NOT NULL,
  `menu_route` varchar(200) NOT NULL,
  `menu_description` varchar(255) NOT NULL,
  `menu_icon` varchar(200) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.menus: ~9 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`menu_id`, `menu_name`, `menu_route`, `menu_description`, `menu_icon`) VALUES
	(1, 'Dashboard', '/admin/dashboard', 'Dashboard for admin', 'bx bxs-dashboard'),
	(2, 'Menu Management', 'menu-management', 'Menu Management', 'bx bx-menu'),
	(3, 'Role Management', 'role-management', 'Role Management', 'bx bx-lock-open'),
	(4, 'User Management', 'user-management', 'User Management', 'bx bxs-user-account'),
	(5, 'Folder Management', 'folder-management', 'Folder Management', 'bx bx-folder'),
	(6, 'DBase Management', 'database-management', 'Database Management', 'bx bxs-data'),
	(100, 'Dashboard', '/user/dashboard', 'Dashboard for user', 'bx bxs-dashboard'),
	(101, 'My File', 'my-file', 'My File', 'bx bx-file'),
	(102, 'Browse File', 'browse-file', 'File Browser', 'bx bx-search');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table si_ardi.menu_accesses
DROP TABLE IF EXISTS `menu_accesses`;
CREATE TABLE IF NOT EXISTS `menu_accesses` (
  `menu_access_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(200) NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`menu_access_id`),
  KEY `FK_menu_accesses_menus` (`menu_id`),
  CONSTRAINT `FK_menu_accesses_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.menu_accesses: ~9 rows (approximately)
DELETE FROM `menu_accesses`;
/*!40000 ALTER TABLE `menu_accesses` DISABLE KEYS */;
INSERT INTO `menu_accesses` (`menu_access_id`, `group`, `menu_id`) VALUES
	(1, 'admin', 1),
	(2, 'admin', 2),
	(3, 'admin', 3),
	(4, 'admin', 4),
	(5, 'admin', 5),
	(6, 'admin', 6),
	(7, 'user', 100),
	(8, 'user', 101),
	(9, 'user', 102);
/*!40000 ALTER TABLE `menu_accesses` ENABLE KEYS */;

-- Dumping structure for table si_ardi.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.migrations: ~8 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
	(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1661742355, 1),
	(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1661742355, 1),
	(3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1661742355, 1),
	(4, '2022-08-31-101814', 'App\\Database\\Migrations\\AddMenus', 'default', 'App', 1661941617, 2),
	(5, '2022-08-31-101818', 'App\\Database\\Migrations\\AddSubMenus', 'default', 'App', 1661941617, 2),
	(6, '2022-08-31-102221', 'App\\Database\\Migrations\\AddMenuAccesses', 'default', 'App', 1661941617, 2),
	(11, '2022-09-01-103831', 'App\\Database\\Migrations\\Folders', 'default', 'App', 1662038941, 3),
	(12, '2022-09-01-103952', 'App\\Database\\Migrations\\Files', 'default', 'App', 1662038942, 3),
	(13, '2022-09-04-005052', 'App\\Database\\Migrations\\Downloads', 'default', 'App', 1662284875, 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table si_ardi.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.settings: ~0 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table si_ardi.sub_menus
DROP TABLE IF EXISTS `sub_menus`;
CREATE TABLE IF NOT EXISTS `sub_menus` (
  `sub_menu_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `sub_menu_name` varchar(200) NOT NULL,
  `sub_menu_route` varchar(200) NOT NULL,
  PRIMARY KEY (`sub_menu_id`),
  KEY `FK_sub_menus_menus` (`menu_id`),
  CONSTRAINT `FK_sub_menus_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.sub_menus: ~6 rows (approximately)
DELETE FROM `sub_menus`;
/*!40000 ALTER TABLE `sub_menus` DISABLE KEYS */;
INSERT INTO `sub_menus` (`sub_menu_id`, `menu_id`, `sub_menu_name`, `sub_menu_route`) VALUES
	(1, 2, 'Menu', '/admin/menu-management/menu'),
	(2, 2, 'Sub Menu', '/admin/menu-management/sub-menu'),
	(100, 101, 'Upload File', '/user/my-file/upload-file'),
	(101, 101, 'Download History', '/user/my-file/download-history'),
	(102, 102, 'By Folder', '/user/browse-file/by-folder'),
	(103, 102, 'By User', '/user/browse-file/by-user');
/*!40000 ALTER TABLE `sub_menus` ENABLE KEYS */;

-- Dumping structure for table si_ardi.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table si_ardi.users: ~30 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'zakisarjudin', NULL, NULL, 1, '2022-09-07 11:21:11', '2022-08-28 22:10:02', '2022-08-28 22:10:02', NULL),
	(2, 'zackyes', NULL, NULL, 1, '2022-09-09 04:59:24', '2022-08-31 09:55:29', '2022-08-31 09:55:29', NULL),
	(3, 'administrator', NULL, NULL, 1, '2022-09-07 22:37:58', '2022-08-31 10:42:54', '2022-08-31 10:42:54', NULL),
	(4, 'hermawan', NULL, NULL, 1, '2022-09-07 20:49:05', '2022-09-07 15:32:17', '2022-09-07 15:32:17', NULL),
	(5, 'andry', NULL, NULL, 1, '2022-09-08 09:55:41', '2022-09-08 09:55:34', '2022-09-08 09:55:35', NULL),
	(6, 'vincent', NULL, NULL, 1, '2022-09-08 09:56:09', '2022-09-08 09:56:08', '2022-09-08 09:56:08', NULL),
	(7, 'urayarif', NULL, NULL, 1, '2022-09-08 09:56:28', '2022-09-08 09:56:27', '2022-09-08 09:56:28', NULL),
	(8, 'sonia', NULL, NULL, 1, '2022-09-08 09:56:49', '2022-09-08 09:56:48', '2022-09-08 09:56:48', NULL),
	(9, 'andini', NULL, NULL, 1, '2022-09-08 09:57:10', '2022-09-08 09:57:09', '2022-09-08 09:57:09', NULL),
	(10, 'eva', NULL, NULL, 1, '2022-09-08 09:57:35', '2022-09-08 09:57:34', '2022-09-08 09:57:34', NULL),
	(11, 'cristin', NULL, NULL, 1, '2022-09-08 09:57:53', '2022-09-08 09:57:52', '2022-09-08 09:57:52', NULL),
	(12, 'testing1', NULL, NULL, 1, '2022-10-03 14:00:00', NULL, NULL, NULL),
	(13, 'testing2', NULL, NULL, 1, '2022-10-04 14:00:00', NULL, NULL, NULL),
	(14, 'testing3', NULL, NULL, 1, '2022-10-05 14:00:00', NULL, NULL, NULL),
	(15, 'testing4', NULL, NULL, 1, '2022-10-06 14:00:00', NULL, NULL, NULL),
	(16, 'testing5', NULL, NULL, 1, '2022-10-07 14:00:00', NULL, NULL, NULL),
	(17, 'testing6', NULL, NULL, 1, '2022-10-08 14:00:00', NULL, NULL, NULL),
	(18, 'testing7', NULL, NULL, 1, '2022-10-09 14:00:00', NULL, NULL, NULL),
	(19, 'testing8', NULL, NULL, 1, '2022-10-10 14:00:00', NULL, NULL, NULL),
	(20, 'testing9', NULL, NULL, 1, '2022-10-11 14:00:00', NULL, NULL, NULL),
	(21, 'testing10', NULL, NULL, 1, '2022-10-12 14:00:00', NULL, NULL, NULL),
	(22, 'testing11', NULL, NULL, 1, '2022-10-13 14:00:00', NULL, NULL, NULL),
	(23, 'testing12', NULL, NULL, 1, '2022-10-14 14:00:00', NULL, NULL, NULL),
	(24, 'testing13', NULL, NULL, 1, '2022-10-15 14:00:00', NULL, NULL, NULL),
	(25, 'testing14', NULL, NULL, 1, '2022-10-16 14:00:00', NULL, NULL, NULL),
	(26, 'testing15', NULL, NULL, 1, '2022-10-17 14:00:00', NULL, NULL, NULL),
	(27, 'testing16', NULL, NULL, 1, '2022-10-18 14:00:00', NULL, NULL, NULL),
	(28, 'testing17', NULL, NULL, 1, '2022-10-19 14:00:00', NULL, NULL, NULL),
	(29, 'testing18', NULL, NULL, 1, '2022-10-20 14:00:00', NULL, NULL, NULL),
	(30, 'testing19', NULL, NULL, 1, '2022-10-21 14:00:00', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view si_ardi.view_downloads
DROP VIEW IF EXISTS `view_downloads`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_downloads` (
	`download_id` INT(10) UNSIGNED NOT NULL,
	`user_id` INT(10) UNSIGNED NOT NULL,
	`file_id` INT(10) UNSIGNED NOT NULL,
	`history_file_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`history_file_size` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`history_file_extension` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`history_folder_name` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`history_uploader_username` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NOT NULL,
	`username` VARCHAR(30) NULL COLLATE 'utf8_general_ci',
	`availability` VARCHAR(255) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view si_ardi.view_files
DROP VIEW IF EXISTS `view_files`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_files` (
	`file_id` INT(10) UNSIGNED NOT NULL,
	`uuid` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`user_id` INT(10) UNSIGNED NOT NULL,
	`folder_id` INT(10) UNSIGNED NOT NULL,
	`file_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`file_path` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`file_size` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`file_extension` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`access_modifier` ENUM('public','private') NOT NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NOT NULL,
	`folder_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`folder_slug` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`uploader` VARCHAR(30) NULL COLLATE 'utf8_general_ci',
	`download_count` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view si_ardi.view_folders
DROP VIEW IF EXISTS `view_folders`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_folders` (
	`folder_id` INT(10) UNSIGNED NOT NULL,
	`parent_folder_id` INT(10) UNSIGNED NULL,
	`folder_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`folder_description` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`folder_icon` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`folder_slug` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`created_at` DATETIME NOT NULL,
	`file_count` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view si_ardi.view_sub_menus
DROP VIEW IF EXISTS `view_sub_menus`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_sub_menus` (
	`sub_menu_id` INT(5) UNSIGNED NOT NULL,
	`menu_id` INT(10) UNSIGNED NOT NULL,
	`sub_menu_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`sub_menu_route` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`menu_name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view si_ardi.view_user_files
DROP VIEW IF EXISTS `view_user_files`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_user_files` (
	`id` INT(11) UNSIGNED NOT NULL,
	`username` VARCHAR(30) NULL COLLATE 'utf8_general_ci',
	`status` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`status_message` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`active` TINYINT(1) NOT NULL,
	`last_active` DATETIME NULL,
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL,
	`deleted_at` DATETIME NULL,
	`file_count` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for trigger si_ardi.files_before_insert
DROP TRIGGER IF EXISTS `files_before_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `files_before_insert` BEFORE INSERT ON `files` FOR EACH ROW BEGIN
  IF new.uuid IS NULL THEN
    SET new.uuid = uuid();
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view si_ardi.view_downloads
DROP VIEW IF EXISTS `view_downloads`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_downloads`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_downloads` AS SELECT a.*, b.username, IFNULL(c.uuid, NULL) AS availability FROM downloads a JOIN users b ON a.user_id = b.id LEFT JOIN files c ON a.file_id = c.file_id ;

-- Dumping structure for view si_ardi.view_files
DROP VIEW IF EXISTS `view_files`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_files`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_files` AS SELECT a.*, b.folder_name, b.folder_slug, c.username AS uploader, COUNT(d.download_id) AS download_count FROM files a JOIN folders b ON a.folder_id = b.folder_id JOIN users c ON a.user_id = c.id 
LEFT JOIN downloads d ON a.file_id = d.file_id GROUP BY a.file_id ;

-- Dumping structure for view si_ardi.view_folders
DROP VIEW IF EXISTS `view_folders`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_folders`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_folders` AS SELECT a.*, COUNT(b.file_id) AS file_count FROM folders a LEFT JOIN files b ON a.folder_id = b.folder_id GROUP BY a.folder_id ;

-- Dumping structure for view si_ardi.view_sub_menus
DROP VIEW IF EXISTS `view_sub_menus`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_sub_menus`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_sub_menus` AS SELECT a.*, b.menu_name FROM sub_menus a JOIN menus b ON a.menu_id = b.menu_id ORDER BY a.sub_menu_id ;

-- Dumping structure for view si_ardi.view_user_files
DROP VIEW IF EXISTS `view_user_files`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_user_files`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_user_files` AS SELECT a.*, COUNT(c.file_id) AS file_count FROM users a LEFT JOIN files c ON a.id = c.user_id GROUP BY a.id ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
