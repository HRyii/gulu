/*
Navicat MySQL Data Transfer

Source Server         : gulu
Source Server Version : 50629
Source Host           : 121.43.6.189:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-01-12 16:39:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for corp_user
-- ----------------------------
DROP TABLE IF EXISTS `corp_user`;
CREATE TABLE `corp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `corp_id` int(10) unsigned NOT NULL,
  `token_id` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of corp_user
-- ----------------------------
INSERT INTO `corp_user` VALUES ('1', 'HRyii', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', '2016-10-25 14:00:04', '2016-10-25 14:00:04');
INSERT INTO `corp_user` VALUES ('17', '吴家辉', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', null, null);
INSERT INTO `corp_user` VALUES ('20', 'jiahao', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', null, null);
