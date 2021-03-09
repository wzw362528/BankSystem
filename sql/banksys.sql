/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.30 : Database - banksys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banksys` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `banksys`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_admin` */

insert  into `t_admin`(`admin_id`,`admin_name`,`admin_password`) values (1,'admin','admin');

/*Table structure for table `t_log` */

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `operated` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实际操作',
  `userId` int(20) NOT NULL COMMENT '用户编号',
  `balance` double DEFAULT NULL COMMENT '操作金额',
  `times` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`userId`),
  CONSTRAINT `t_log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_log` */

insert  into `t_log`(`id`,`operated`,`userId`,`balance`,`times`) values (61,'存款',24,500,'2020-09-30 00:30:37'),(62,'存款',24,500,'2020-09-30 00:33:36'),(63,'存款',25,10000000,'2020-09-30 15:09:14'),(64,'取款',25,500000,'2020-09-30 15:09:41'),(65,'取款',25,10000,'2020-09-30 15:21:57'),(66,'取款',25,50000,'2020-09-30 15:22:01'),(67,'取款',25,400000,'2020-09-30 15:22:05'),(68,'取款',25,40000,'2020-09-30 15:22:09'),(69,'存款',24,500,'2020-10-03 15:37:45'),(70,'取款',24,500,'2020-10-03 15:37:54'),(71,'存款',24,500,'2020-10-03 18:17:17'),(72,'存款',24,500,'2020-10-03 18:17:28'),(73,'取款',24,500,'2020-10-03 18:17:32'),(74,'转账',24,500,'2020-10-03 18:17:37'),(75,'存款',24,500,'2020-10-03 18:21:17'),(76,'转账',24,500,'2020-10-03 18:22:53'),(77,'存款',24,500,'2020-10-03 21:00:48'),(78,'取款',24,1000,'2020-10-03 21:00:58'),(79,'转账',24,1000,'2020-10-03 21:01:08'),(80,'存款',24,500,'2020-10-04 11:58:22'),(81,'取款',24,500,'2020-10-04 11:58:29'),(82,'转账',24,500,'2020-10-04 11:58:36');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `balance` double DEFAULT NULL COMMENT '账户金额',
  `user_flag` int(4) DEFAULT '1' COMMENT '使用标记',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`username`,`password`,`balance`,`user_flag`) values (24,'aaa','47bce5c74f589f4867dbd57e9ca9f808',11000,1),(25,'Jerry','09a630e07af043e4cae879dd60db1cac',9002000,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
