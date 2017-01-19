/*
Navicat MySQL Data Transfer

Source Server         : gulu
Source Server Version : 50629
Source Host           : 121.43.6.189:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-01-13 15:26:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_bill
-- ----------------------------
DROP TABLE IF EXISTS `gulu_user_bill`;
CREATE TABLE `user_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(2) unsigned DEFAULT NULL COMMENT '类型：1：充值 2：订餐',
  `amount` decimal(10,2) unsigned DEFAULT NULL,
  `foreign_id` int(10) unsigned DEFAULT NULL COMMENT '对应类型的记录ID',
  `balance` decimal(10,0) DEFAULT '0' COMMENT '账户结余',
  `create_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_bill_user1_idx` (`user_id`)
)
