/*
Navicat MySQL Data Transfer

Source Server         : gulu
Source Server Version : 50629
Source Host           : 121.43.6.189:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-01-12 16:13:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `gule_order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(45) DEFAULT NULL COMMENT '订单号',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '市ID',
  `district_id` int(10) unsigned DEFAULT '0' COMMENT '区ID',
  `shop_id` int(10) unsigned DEFAULT NULL COMMENT '店铺ID 系统为1',
  `create_time` int(10) unsigned DEFAULT '0',
  `goods_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '总餐费',
  `freight_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '配送费',
  `box_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '餐盒费',
  `subsidy_amount` decimal(10,2) DEFAULT '0.00' COMMENT '公司补贴金额',
  `discount_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '优惠金额',
  `total_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单金额（未扣补贴/优惠）',
  `pay_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '实付金额',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '订单状态',
  `is_set_meal` tinyint(2) unsigned DEFAULT '0' COMMENT '是否团餐',
  `type` tinyint(2) unsigned DEFAULT '0' COMMENT '类型 1：自己发起的团餐 2：组长帮点的团餐 3：自己的单点订餐 4：组长帮点的单点订餐 5：系统自动点的单点订餐',
  `update_time` int(10) unsigned DEFAULT NULL,
  `address` varchar(255) DEFAULT '' COMMENT '配送地址',
  `name` varchar(30) DEFAULT '' COMMENT '联系姓名',
  `phone` varchar(11) DEFAULT '' COMMENT '联系手机',
  `payment` int(10) unsigned DEFAULT '0' COMMENT '支付方式',
  PRIMARY KEY (`id`),
  KEY `fk_order_company1_idx` (`company_id`),
  KEY `fk_order_shop1_idx` (`shop_id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_city1_idx` (`city_id`)
)
