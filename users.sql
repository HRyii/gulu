/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : guluu

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-12-20 14:22:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'HRyii', 'hruiyi@eit360.com', '$2y$10$1UZWh8IlDB079cxK9pvCTOVmiq.X/iKMRNch05gQPPJ0/5BCeMEju', '1', '45PzlPBHcCELZAfeibzgUA60KIwsJvqhAF5jiNlYUTkGAaApWUjMPKFXKoXB', '2016-10-25 14:00:04', '2016-11-05 01:57:03');
INSERT INTO `users` VALUES ('2', 'Newell Mills', 'kquigley@example.com', '$2y$10$PNrZOd.ibKOMr2vCV2g5rOMB3XvqeoENeh.dvPPjP79f0GKG8MPMa', '1', 'SC5CoED2Dk', '2016-10-25 14:00:09', '2016-10-25 14:08:11');
INSERT INTO `users` VALUES ('3', 'Rosa Mann PhD', 'maia12@example.com', '$2y$10$A3jzDLA/kLBmqkeIm10CDu3756tJE3T3ewN2YZSDXz6OQ9xga7qEm', '0', 'b6aR8kslta', '2016-10-25 14:00:09', '2016-10-25 14:08:13');
INSERT INTO `users` VALUES ('4', 'Mr. Danial Tromp DVM', 'ewill@example.com', '$2y$10$9V3cQtDZvpUsZ7LOBYr5VuMj.calPH3BxYl.WOiY8nB689QyvP3Hy', '1', '9QRpTUUTKn', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('5', 'Amir Adams', 'estel.doyle@example.com', '$2y$10$wcqEtlsyMSk.PGZD0avDY.0IEGUMqwTtBQo8SqmbGzZBGG7zwqQOO', '0', 'w7yqXmgXcF', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('6', 'Grayson Stehr', 'ernser.vada@example.com', '$2y$10$L3FOByjNwpmizcCozCtBUeszqCshLDvYKFDIJcSLsYgKjF5/IiXwC', '0', 'HLObhAaCWn', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('7', 'Betsy Yundt', 'melissa89@example.net', '$2y$10$1ryR6BIojMeTHGiwhhAfp.Q1alMD5rQhJ/ZAGPhv37b1Ft/2dOGNS', '0', 'WXRfBFNhlD', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('8', 'Judy Parisian', 'fannie.green@example.net', '$2y$10$RYiH0WSXKN0..V5dvzTj6.MElJ9FtcwxZdCoOBmzKXkG6b7EXjc0u', '1', 'Dplmi9FszT', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('9', 'Mr. Colt Murazik Jr.', 'millie17@example.org', '$2y$10$qaFXzXzrWvjSxRG0GX5th.2fCQ/D4BBTo9iHoIXZTgDwshszvQpve', '0', 'g4uR21Ctd6', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('10', 'Frankie Willms Sr.', 'jmueller@example.org', '$2y$10$.tVjpJKTOQHp8Uu3IsO5H.2/Gj6SwWZOrs5pNdllyTXErNA9MtOz.', '1', 'ssAClQXbj9', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `users` VALUES ('11', 'Darby Reynolds', 'letitia80@example.net', '$2y$10$4aAGZfkH8v5C7dhGGf9j6ev0oPhjd.Xd3qHYDNyXi.RdgptPhz7zG', '1', '313RP4186M', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
