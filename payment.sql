/*
Navicat MySQL Data Transfer

Source Server         : gulu
Source Server Version : 50629
Source Host           : 121.43.6.189:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-01-12 16:40:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '支付方式名',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `is_show` tinyint(1) unsigned DEFAULT NULL COMMENT '是否显示',
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
