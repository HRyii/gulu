/*
Navicat MySQL Data Transfer

Source Server         : gulu
Source Server Version : 50629
Source Host           : 121.43.6.189:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-01-18 08:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT '0' COMMENT '公司ID',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `realname` varchar(20) DEFAULT '',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `balance` decimal(8,2) DEFAULT '0.00' COMMENT '余额',
  `notify_type` int(10) unsigned DEFAULT '0' COMMENT '通知方式',
  `openid` varchar(60) DEFAULT NULL,
  `sex` tinyint(2) unsigned DEFAULT '0',
  `headimgurl` varchar(255) DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT '0',
  `district_id` int(10) unsigned DEFAULT '0',
  `mon_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `tue_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `wed_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `thu_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `fri_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `sat_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `sun_subsidy` decimal(4,2) unsigned DEFAULT '0.00',
  `app_key` varchar(200) DEFAULT '' COMMENT '加密密钥',
  `point` int(11) DEFAULT '0' COMMENT '积分',
  `token` char(32) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_user_company1_idx` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('24', '0', null, '', '13555625957', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'rYReNdPQCcEm088L');
INSERT INTO `user` VALUES ('17', '1', 'LU', '超级柠檬片', '13143357971', '84.80', null, null, null, '123', null, '0', null, null, null, null, null, null, null, '', '0', '123456');
INSERT INTO `user` VALUES ('25', '0', null, '', '13555625953', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'sK8kyJmKHjW8oA6k');
INSERT INTO `user` VALUES ('26', '0', null, '', '13555625952', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'z8yEJ5wYO0IDiZmt');
INSERT INTO `user` VALUES ('27', '0', null, '', '13286120375', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'nEaHUGNGYB7ED6lQezxoC9u5f87qDWfr');
INSERT INTO `user` VALUES ('20', '1', 'sscsdl', 'sscsdl', '13555625954', '62.40', null, null, null, '../image/wx.jpg', null, '0', null, null, null, null, null, null, null, '', '0', 'GDI6kSuwNjb3GG9b4beRyyLAeZCiHe6t');
INSERT INTO `user` VALUES ('28', '0', null, '', '13286120376', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', '1jEunjAItScNyxxkmu728dXzBL8BGLV8');
INSERT INTO `user` VALUES ('21', null, '测试员1', '测试员1', '13555625951', '3.00', null, null, null, null, null, '0', null, null, null, null, null, null, null, '', '0', '86xt97D7uyOc1lEs');
INSERT INTO `user` VALUES ('29', '0', null, '', '13286120388', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'SGtWI0jBb45Oin8xypzIPtYl53u9vF4N');
INSERT INTO `user` VALUES ('22', '1', null, '镇长', '13286120374', null, null, null, null, '../image/wx.jpg', null, '0', null, null, null, null, null, null, null, '', '0', 'X7Z99aKeF8GClulTnfDH3nPuRJYVPb2c');
INSERT INTO `user` VALUES ('30', '0', null, '', '13422527040', '0.00', '0', null, '0', null, '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '0', 'fQZRB5as9wwUK2CcfLjTNnAg4GFOb9nR');
INSERT INTO `user` VALUES ('23', null, null, '', '13286123740', null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '', '0', 'VXUmJAs0gd6MB2GH');
