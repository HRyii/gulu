/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : gulu

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-01-17 15:38:02
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of corp_user
-- ----------------------------
INSERT INTO `corp_user` VALUES ('1', 'HRyii', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', '2016-10-25 14:00:04', '2016-10-25 14:00:04');
INSERT INTO `corp_user` VALUES ('17', '吴家辉', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', null, null);
INSERT INTO `corp_user` VALUES ('20', 'jiahao', '$2y$10$A273OYRA7/uMvCI4r0jukOaQv702dcDsf9MzF4Us6ZJLUeYeUOdAi', '0', null, '1', null, null);

-- ----------------------------
-- Table structure for gulu_admin
-- ----------------------------
DROP TABLE IF EXISTS `gulu_admin`;
CREATE TABLE `gulu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_admin
-- ----------------------------

-- ----------------------------
-- Table structure for gulu_company
-- ----------------------------
DROP TABLE IF EXISTS `gulu_company`;
CREATE TABLE `gulu_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) DEFAULT NULL COMMENT '公司编号',
  `district_id` int(10) NOT NULL COMMENT '地区ID',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `logo` varchar(255) NOT NULL COMMENT '公司LOGO',
  `people` int(10) NOT NULL COMMENT '公司人数',
  `charger` varchar(50) NOT NULL COMMENT '负责人',
  `charger_phone` varchar(20) NOT NULL COMMENT '负责人电话',
  `balance` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '余额',
  `ratio` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `business_number` varchar(50) NOT NULL COMMENT '营业执照号',
  `business_pic` varchar(255) NOT NULL COMMENT '营业执照号证件',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `delivery_time` varchar(20) NOT NULL DEFAULT '0' COMMENT '送餐时间如 12:25',
  `create_user` int(11) NOT NULL COMMENT '申请人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '公司状态',
  `display` tinyint(4) DEFAULT NULL COMMENT '是否被删除',
  `mon_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期一补贴金额',
  `tue_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期二补贴金额',
  `wed_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期三补贴金额',
  `thu_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期四补贴金额',
  `fri_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期五补贴金额',
  `sat_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期六补贴金额',
  `sun_subsidy` decimal(10,2) DEFAULT NULL COMMENT '星期日补贴金额',
  `debt_limit` decimal(10,0) DEFAULT NULL COMMENT '员工欠费上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_company
-- ----------------------------
INSERT INTO `gulu_company` VALUES ('1', null, '3', '饭时咕噜', '/uploads/20170116\\732bcbb2cc38f4d8ee018401fff9d70c.png', '10', '曾生', '18025816893', '0', '0', '44001434654', '/uploads/20170116\\d274e23f285de26beaa0adb6beb846a9.png', '地址', '0', '1', '2017-01-16 15:45:55', '0', null, '5.00', '6.00', '7.00', '8.00', '9.00', '4.00', '3.00', null);
INSERT INTO `gulu_company` VALUES ('2', null, '1943', '饭时', '/uploads/20170117\\188bebe466e59d3e042153e79b06bfc6.png', '1', '11', '1', '0', '0', '11', '/uploads/20170117\\4379db102abecae25f50b9a65c118874.png', '地址', '09:30', '19', '2017-01-17 10:32:17', '0', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for gulu_company_bill
-- ----------------------------
DROP TABLE IF EXISTS `gulu_company_bill`;
CREATE TABLE `gulu_company_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(10) NOT NULL COMMENT '公司id',
  `type` tinyint(4) NOT NULL COMMENT '类型：1：充值 2：补贴',
  `amount` decimal(10,0) NOT NULL COMMENT '金额',
  `foreign_id` int(10) NOT NULL COMMENT '对应类型的记录ID',
  `pay_type` int(10) NOT NULL COMMENT '支付方式',
  `balance` decimal(10,0) NOT NULL COMMENT '账户结余',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_id` int(10) NOT NULL COMMENT '操作人ID',
  `create_time` int(10) NOT NULL COMMENT '通过时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_company_bill
-- ----------------------------
INSERT INTO `gulu_company_bill` VALUES ('1', '1', '1', '100', '1', '1', '110', '充值了100元', '17', '1482238350');
INSERT INTO `gulu_company_bill` VALUES ('2', '1', '2', '100', '1', '2', '110', '充值了100元', '17', '1482238350');

-- ----------------------------
-- Table structure for gulu_company_group
-- ----------------------------
DROP TABLE IF EXISTS `gulu_company_group`;
CREATE TABLE `gulu_company_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `create_user_id` int(10) NOT NULL COMMENT '用户id',
  `company_id` int(10) NOT NULL COMMENT '公司id',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_company_group
-- ----------------------------
INSERT INTO `gulu_company_group` VALUES ('1', '分组一', '17', '1', '1482238350');
INSERT INTO `gulu_company_group` VALUES ('2', '分组二', '20', '1', '1482238350');
INSERT INTO `gulu_company_group` VALUES ('3', '鹿晗的组', '17', '1', '1484041708');
INSERT INTO `gulu_company_group` VALUES ('4', '鹿晗的组', '17', '1', '1484038318');
INSERT INTO `gulu_company_group` VALUES ('5', '鹿晗的组', '17', '1', '1484041011');
INSERT INTO `gulu_company_group` VALUES ('6', '鹿晗的组', '17', '1', '1484041032');
INSERT INTO `gulu_company_group` VALUES ('7', '鹿晗的组', '17', '1', '1484041052');
INSERT INTO `gulu_company_group` VALUES ('8', '鹿晗的组', '17', '1', '1484041685');
INSERT INTO `gulu_company_group` VALUES ('9', '鹿晗的组', '17', '1', '1484041702');
INSERT INTO `gulu_company_group` VALUES ('10', '鹿晗的组', '17', '1', '1484041708');

-- ----------------------------
-- Table structure for gulu_company_group_user
-- ----------------------------
DROP TABLE IF EXISTS `gulu_company_group_user`;
CREATE TABLE `gulu_company_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `group_id` int(10) NOT NULL COMMENT '分组id',
  `company_id` int(10) NOT NULL COMMENT '公司id',
  `is_leader` tinyint(4) NOT NULL COMMENT '是否组长',
  `create_time` int(10) NOT NULL COMMENT '通过时间',
  `status` tinyint(4) NOT NULL COMMENT '是否同意加入该组，0：未同意，1：同意',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_company_group_user
-- ----------------------------
INSERT INTO `gulu_company_group_user` VALUES ('3', '17', '2', '1', '0', '1482805117', '0');
INSERT INTO `gulu_company_group_user` VALUES ('4', '21', '2', '1', '0', '0', '1');
INSERT INTO `gulu_company_group_user` VALUES ('5', '20', '2', '1', '0', '0', '1');
INSERT INTO `gulu_company_group_user` VALUES ('6', '22', '2', '1', '1', '0', '1');
INSERT INTO `gulu_company_group_user` VALUES ('7', '20', '7', '1', '0', '1484041052', '0');
INSERT INTO `gulu_company_group_user` VALUES ('8', '21', '7', '1', '0', '1484041052', '0');
INSERT INTO `gulu_company_group_user` VALUES ('9', '17', '9', '1', '1', '1484041702', '1');
INSERT INTO `gulu_company_group_user` VALUES ('10', '20', '9', '1', '0', '1484041702', '0');
INSERT INTO `gulu_company_group_user` VALUES ('11', '21', '9', '1', '0', '1484041703', '0');
INSERT INTO `gulu_company_group_user` VALUES ('12', '17', '10', '1', '1', '1484041708', '1');
INSERT INTO `gulu_company_group_user` VALUES ('13', '20', '10', '1', '0', '1484041708', '0');
INSERT INTO `gulu_company_group_user` VALUES ('14', '21', '10', '1', '0', '1484041708', '0');

-- ----------------------------
-- Table structure for gulu_company_user
-- ----------------------------
DROP TABLE IF EXISTS `gulu_company_user`;
CREATE TABLE `gulu_company_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `company_id` int(10) NOT NULL COMMENT '公司id',
  `apply_time` int(10) NOT NULL COMMENT '申请时间',
  `pass_time` int(10) DEFAULT NULL COMMENT '通过时间',
  `status` tinyint(4) NOT NULL COMMENT '审核状态 0审核中 1审核通过',
  `mon_subsidy` decimal(10,2) NOT NULL COMMENT '星期一补贴金额',
  `tue_subsidy` decimal(10,2) NOT NULL COMMENT '星期二补贴金额',
  `wed_subsidy` decimal(10,2) NOT NULL COMMENT '星期三补贴金额',
  `thu_subsidy` decimal(10,2) NOT NULL COMMENT '星期四补贴金额',
  `fri_subsidy` decimal(10,2) NOT NULL COMMENT '星期五补贴金额',
  `sat_subsidy` decimal(10,2) NOT NULL COMMENT '星期六补贴金额',
  `sun_subsidy` decimal(10,2) NOT NULL COMMENT '星期日补贴金额',
  `enable` tinyint(1) unsigned DEFAULT '1' COMMENT '补贴是否启用 0：不启用 1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_company_user
-- ----------------------------
INSERT INTO `gulu_company_user` VALUES ('1', '1', '20', '1482546562', '1', '1', '7.00', '6.00', '5.00', '4.00', '3.00', '2.00', '1.00', '1');
INSERT INTO `gulu_company_user` VALUES ('3', '1', '1', '1482546562', '1484638143', '1', '5.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `gulu_company_user` VALUES ('4', '20', '1', '1482546562', '1484636241', '1', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '3.00', '1');
INSERT INTO `gulu_company_user` VALUES ('6', '17', '1', '1482546562', '1484636241', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '0.00', '1');
INSERT INTO `gulu_company_user` VALUES ('8', '1', '17', '1482546562', '1482546562', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `gulu_company_user` VALUES ('9', '1', '22', '1482546562', '1', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `gulu_company_user` VALUES ('10', '1', '23', '1482546562', '1', '1', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');

-- ----------------------------
-- Table structure for gulu_menu
-- ----------------------------
DROP TABLE IF EXISTS `gulu_menu`;
CREATE TABLE `gulu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `gulu_menu_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `gulu_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_menu
-- ----------------------------
INSERT INTO `gulu_menu` VALUES ('1', '0', '2', '账号列表', 'account/user/index', '1000', '1');
INSERT INTO `gulu_menu` VALUES ('2', '0', '2', '角色列表', 'account/role/index', '800', '1');
INSERT INTO `gulu_menu` VALUES ('3', '0', '4', '公司主页', 'company/index/index', '800', '1');
INSERT INTO `gulu_menu` VALUES ('4', '0', '4', '申请公司', 'company/Corporate/apply', '800', '1');
INSERT INTO `gulu_menu` VALUES ('5', '0', '4', '审核公司列表', 'company/Corporate/check', '800', '1');
INSERT INTO `gulu_menu` VALUES ('7', '0', '5', '人员分组', 'company/user/group', '800', '1');
INSERT INTO `gulu_menu` VALUES ('8', '0', '5', '人员审核', 'company/user/checked', '800', '1');
INSERT INTO `gulu_menu` VALUES ('10', '0', '9', '员工各人配额设置', 'company/subsidy/index', '800', '1');
INSERT INTO `gulu_menu` VALUES ('11', '0', '9', '默认公司配额设置', 'company/subsidy/companyset', '800', '1');
INSERT INTO `gulu_menu` VALUES ('14', '0', '12', '资金流水', 'company/bill/index', '800', '1');
INSERT INTO `gulu_menu` VALUES ('15', '0', '12', '公司充值', 'company/bill/pay', '800', '1');
INSERT INTO `gulu_menu` VALUES ('16', '0', '12', '公司财务人员设置', 'company/bill/setfinancer', '800', '1');

-- ----------------------------
-- Table structure for gulu_module
-- ----------------------------
DROP TABLE IF EXISTS `gulu_module`;
CREATE TABLE `gulu_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_module
-- ----------------------------
INSERT INTO `gulu_module` VALUES ('1', '仪表板', '仪表板', 'dashboard/index/index', 'dashboard', '1000', '1');
INSERT INTO `gulu_module` VALUES ('2', '账号管理', '账号管理', '', 'users', '800', '1');
INSERT INTO `gulu_module` VALUES ('3', '公司后台', '公司后台', '', 'company', '800', '1');
INSERT INTO `gulu_module` VALUES ('4', '公司管理', '公司管理', '', 'company', '800', '1');
INSERT INTO `gulu_module` VALUES ('5', '人员管理', '人员管理', '', 'company', '800', '1');
INSERT INTO `gulu_module` VALUES ('7', '消费记录', '消费记录', 'company/consume/Index', 'company', '800', '1');
INSERT INTO `gulu_module` VALUES ('9', '配额设置', '配额设置', '', 'company', '800', '1');
INSERT INTO `gulu_module` VALUES ('12', '公司财务管理', '公司财务管理', '', 'company', '800', '1');

-- ----------------------------
-- Table structure for gulu_order
-- ----------------------------
DROP TABLE IF EXISTS `gulu_order`;
CREATE TABLE `gulu_order` (
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
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gulu_order
-- ----------------------------
INSERT INTO `gulu_order` VALUES ('80', '20161224151129181935', '17', '1', '2', '3', '1', '1482563489', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1482563489', '1', 'LU', '1314357971', '0');
INSERT INTO `gulu_order` VALUES ('88', '20170105112000323861', '1', '1', '2', '3', '1', '1483586400', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1483586400', '2', 'LU', '1314357971', '0');
INSERT INTO `gulu_order` VALUES ('96', '20170105152822635709', '20', '1', '2', '3', '1', '1483601302', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1483601302', '3', '1', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('104', '20170105153852594649', '21', '1', '2', '3', '1', '1483601932', '40.00', '0.00', '0.00', '4.00', '0.00', '40.00', '36.00', '1', '0', '3', '1483601932', '4', '2', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('112', '20170106094129966081', '17', '1', '2', '3', '1', '1483666889', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483666889', '5', '3', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('120', '20170106094910073927', '21', '1', '2', '3', '1', '1483667350', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483667350', '6', '4', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('105', '20170105160441883955', '20', '1', '2', '3', '1', '1483603481', '40.00', '0.00', '0.00', '4.00', '0.00', '40.00', '36.00', '1', '0', '3', '1483603481', '7', '5', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('113', '20170106094200161211', '24', '1', '2', '3', '1', '1483666920', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483666920', '8', '6', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('121', '20170106095030027145', '1', '1', '2', '3', '1', '1483667430', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483667430', '9', '7', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('129', '20170106141950198813', '17', '1', '2', '3', '1', '1483683590', '40.00', '0.00', '0.00', '5.80', '0.00', '40.00', '34.20', '1', '0', '3', '1483683590', '10', '8', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('1', '20161224151129181935', '17', '1', '2', '3', '1', '1482563489', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1482563489', '1', 'LU', '1314357971', '0');
INSERT INTO `gulu_order` VALUES ('2', '20170105112000323861', '1', '1', '2', '3', '1', '1483586400', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1483586400', '2', 'LU', '1314357971', '0');
INSERT INTO `gulu_order` VALUES ('3', '20170105152822635709', '20', '1', '2', '3', '1', '1483601302', '2.00', '0.00', '0.00', '2.00', '0.00', '2.00', '0.00', '1', '0', '3', '1483601302', '3', '1', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('4', '20170105153852594649', '21', '1', '2', '3', '1', '1483601932', '40.00', '0.00', '0.00', '4.00', '0.00', '40.00', '36.00', '1', '0', '3', '1483601932', '4', '2', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('5', '20170106094129966081', '17', '1', '2', '3', '1', '1483666889', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483666889', '5', '3', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('6', '20170106094910073927', '21', '1', '2', '3', '1', '1483667350', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483667350', '6', '4', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('7', '20170105160441883955', '20', '1', '2', '3', '1', '1483603481', '40.00', '0.00', '0.00', '4.00', '0.00', '40.00', '36.00', '1', '0', '3', '1483603481', '7', '5', '13545678908', '1');
INSERT INTO `gulu_order` VALUES ('8', '20170106094200161211', '24', '1', '2', '3', '1', '1483666920', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483666920', '8', '6', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('9', '20170106095030027145', '1', '1', '2', '3', '1', '1483667430', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '3', '1483667430', '9', '7', '13545678908', '3');
INSERT INTO `gulu_order` VALUES ('10', '20170106141950198813', '17', '1', '2', '3', '1', '1483683590', '40.00', '0.00', '0.00', '5.80', '0.00', '40.00', '34.20', '1', '0', '3', '1483683590', '10', '8', '13545678908', '1');

-- ----------------------------
-- Table structure for gulu_permission
-- ----------------------------
DROP TABLE IF EXISTS `gulu_permission`;
CREATE TABLE `gulu_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_permission
-- ----------------------------
INSERT INTO `gulu_permission` VALUES ('2', '1', 'account_user_create', '创建账号', '创建账号');
INSERT INTO `gulu_permission` VALUES ('3', '1', 'account_user_update', '更新账号', '更新账号');
INSERT INTO `gulu_permission` VALUES ('4', '1', 'account_user_delete', '删除账号', '删除账号');
INSERT INTO `gulu_permission` VALUES ('5', '1', 'account_user_reset', '重置用户账号密码', '重置用户账号密码');
INSERT INTO `gulu_permission` VALUES ('6', '1', 'account_user_enable', '启用或停用用户账号', '启用或停用用户账号');
INSERT INTO `gulu_permission` VALUES ('7', '1', 'account_user_role_assign', '为账号分配角色', '为账号分配角色');
INSERT INTO `gulu_permission` VALUES ('8', '2', 'account_role_create', '创建新角色', '创建新角色');
INSERT INTO `gulu_permission` VALUES ('9', '2', 'account_role_update', '更新角色', '更新角色');
INSERT INTO `gulu_permission` VALUES ('10', '2', 'account_role_perm_assign', '为角色分配权限', '为角色分配权限');
INSERT INTO `gulu_permission` VALUES ('11', '2', 'account_role_delete', '删除角色', '删除角色');
INSERT INTO `gulu_permission` VALUES ('12', '3', 'company_account', '注册账号', '注册公司账号');
INSERT INTO `gulu_permission` VALUES ('13', '4', 'company_corporate_apply', '申请公司', '申请公司，填写公司资料');
INSERT INTO `gulu_permission` VALUES ('14', '4', 'company_corporate_set', '审核公司列表', '审核公司列表');
INSERT INTO `gulu_permission` VALUES ('15', '4', 'company_corporate_changeset', '修改配餐地址及方式设置', '修改公司配餐地址及方式设置');
INSERT INTO `gulu_permission` VALUES ('16', '10', 'company_subsidy_companyset', '配额设置', '默认配额设置');
INSERT INTO `gulu_permission` VALUES ('17', '11', 'company_subsidy_changeset', '修改配额设置', '修改默认配额设置');
INSERT INTO `gulu_permission` VALUES ('18', '10', 'company_subsidy_usercreate', '员工各人配额设置', '员工各人配额设置');
INSERT INTO `gulu_permission` VALUES ('19', '10', 'company_subsidy_update', '修改员工各人配额设置', '修改员工各人配额设置');
INSERT INTO `gulu_permission` VALUES ('20', '10', 'company_subsidy_index', '每日补贴金额列表', '每日补贴金额列表');
INSERT INTO `gulu_permission` VALUES ('21', '10', 'company_subsidy_userdelete', '删除员工各人配额设置', '删除员工各人配额设置');
INSERT INTO `gulu_permission` VALUES ('22', '7', 'company_user_group', '人员分组显示', '人员分组显示');
INSERT INTO `gulu_permission` VALUES ('23', '7', 'company_consume_index', '人员消费记录', '人员消费记录');
INSERT INTO `gulu_permission` VALUES ('24', '16', 'company_bill_setfinancer', '公司财务人员账号设置', '公司财务人员账号设置');
INSERT INTO `gulu_permission` VALUES ('25', '3', 'company_index_index', '公司主页', '公司主页');
INSERT INTO `gulu_permission` VALUES ('26', '14', 'company_bill_index', '公司资金流水', '公司资金流水');
INSERT INTO `gulu_permission` VALUES ('27', '15', 'company_bill_pay', '公司充值', '公司充值');
INSERT INTO `gulu_permission` VALUES ('28', '3', 'company_corporate_checked', '审核公司', '审核公司');
INSERT INTO `gulu_permission` VALUES ('29', '8', 'company_user_checked', '人员审核', '人员审核');
INSERT INTO `gulu_permission` VALUES ('30', '8', 'company_user_index', '人员列表', '人员列表');
INSERT INTO `gulu_permission` VALUES ('31', '5', 'company_corporate_check', '公司申请列表', '公司申请列表');
INSERT INTO `gulu_permission` VALUES ('32', '10', 'company_subsidy_status', '关闭补贴', '关闭补贴');
INSERT INTO `gulu_permission` VALUES ('33', '10', 'company_user_delete', '删除人员', '删除人员');
INSERT INTO `gulu_permission` VALUES ('34', '10', 'company_user_check', '审核人员', '审核人员');

-- ----------------------------
-- Table structure for gulu_role
-- ----------------------------
DROP TABLE IF EXISTS `gulu_role`;
CREATE TABLE `gulu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_role
-- ----------------------------
INSERT INTO `gulu_role` VALUES ('1', 'admin', '超级管理员', '运维人员', '2017-01-16 15:34:56', null);
INSERT INTO `gulu_role` VALUES ('2', 'op', '运维人员', '运维人员', '2017-01-16 15:34:56', null);
INSERT INTO `gulu_role` VALUES ('3', 'tech', '技术支持', '技术支持', '2017-01-16 15:34:56', null);

-- ----------------------------
-- Table structure for gulu_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `gulu_role_permission`;
CREATE TABLE `gulu_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_role_permission
-- ----------------------------
INSERT INTO `gulu_role_permission` VALUES ('1', '2');
INSERT INTO `gulu_role_permission` VALUES ('1', '3');
INSERT INTO `gulu_role_permission` VALUES ('1', '4');
INSERT INTO `gulu_role_permission` VALUES ('1', '5');
INSERT INTO `gulu_role_permission` VALUES ('1', '6');
INSERT INTO `gulu_role_permission` VALUES ('1', '7');
INSERT INTO `gulu_role_permission` VALUES ('1', '8');
INSERT INTO `gulu_role_permission` VALUES ('1', '9');
INSERT INTO `gulu_role_permission` VALUES ('1', '10');
INSERT INTO `gulu_role_permission` VALUES ('1', '11');
INSERT INTO `gulu_role_permission` VALUES ('1', '12');
INSERT INTO `gulu_role_permission` VALUES ('1', '13');
INSERT INTO `gulu_role_permission` VALUES ('1', '14');
INSERT INTO `gulu_role_permission` VALUES ('1', '15');
INSERT INTO `gulu_role_permission` VALUES ('1', '16');
INSERT INTO `gulu_role_permission` VALUES ('1', '17');
INSERT INTO `gulu_role_permission` VALUES ('1', '18');
INSERT INTO `gulu_role_permission` VALUES ('1', '19');
INSERT INTO `gulu_role_permission` VALUES ('1', '20');
INSERT INTO `gulu_role_permission` VALUES ('1', '21');
INSERT INTO `gulu_role_permission` VALUES ('1', '22');
INSERT INTO `gulu_role_permission` VALUES ('1', '23');
INSERT INTO `gulu_role_permission` VALUES ('1', '24');
INSERT INTO `gulu_role_permission` VALUES ('1', '25');
INSERT INTO `gulu_role_permission` VALUES ('1', '26');
INSERT INTO `gulu_role_permission` VALUES ('1', '27');
INSERT INTO `gulu_role_permission` VALUES ('1', '28');
INSERT INTO `gulu_role_permission` VALUES ('1', '29');
INSERT INTO `gulu_role_permission` VALUES ('1', '30');
INSERT INTO `gulu_role_permission` VALUES ('1', '31');
INSERT INTO `gulu_role_permission` VALUES ('1', '32');
INSERT INTO `gulu_role_permission` VALUES ('1', '33');
INSERT INTO `gulu_role_permission` VALUES ('1', '34');
INSERT INTO `gulu_role_permission` VALUES ('1', '35');
INSERT INTO `gulu_role_permission` VALUES ('1', '36');
INSERT INTO `gulu_role_permission` VALUES ('1', '37');
INSERT INTO `gulu_role_permission` VALUES ('1', '38');
INSERT INTO `gulu_role_permission` VALUES ('1', '39');
INSERT INTO `gulu_role_permission` VALUES ('1', '40');
INSERT INTO `gulu_role_permission` VALUES ('1', '41');
INSERT INTO `gulu_role_permission` VALUES ('1', '42');
INSERT INTO `gulu_role_permission` VALUES ('1', '43');
INSERT INTO `gulu_role_permission` VALUES ('1', '44');
INSERT INTO `gulu_role_permission` VALUES ('1', '45');
INSERT INTO `gulu_role_permission` VALUES ('1', '46');

-- ----------------------------
-- Table structure for gulu_table
-- ----------------------------
DROP TABLE IF EXISTS `gulu_table`;
CREATE TABLE `gulu_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_table
-- ----------------------------

-- ----------------------------
-- Table structure for gulu_user
-- ----------------------------
DROP TABLE IF EXISTS `gulu_user`;
CREATE TABLE `gulu_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_user
-- ----------------------------
INSERT INTO `gulu_user` VALUES ('1', 'dev', '$2y$10$DzjEWQZJVgDZpnnK6Pit5.CVrNU.fZeIply75Aw/keCHFXPaf/zoS', '1', null, '2017-01-16 15:34:56', null);
INSERT INTO `gulu_user` VALUES ('6', 'test', '$2y$10$jqWf1hljI7/oz7P9byKUdu7.wooyPC4nNyxts/umXdh5x6e6B/XNy', '1', null, '2017-01-16 15:45:55', null);
INSERT INTO `gulu_user` VALUES ('7', 'fanshi', '$2y$10$NrWJXkDIS.FZiT9627TzyOcqkq/MxEfS4L.P1lTufbqsXb.ky6rwK', '1', null, '2017-01-17 09:16:19', null);
INSERT INTO `gulu_user` VALUES ('8', '1', '$2y$10$gdY6ajjF9DFqaPnEsT5BNeYgpsP1w6fNdmXAzNecrV9aOMSJo5W3.', '1', null, '2017-01-17 09:20:26', null);
INSERT INTO `gulu_user` VALUES ('9', 'hi', '$2y$10$R0EW.p2jR1ncqTsEADwdjepsySUfbKpAwB2vi8pzCBu7CcCskW3ma', '1', null, '2017-01-17 10:20:44', null);
INSERT INTO `gulu_user` VALUES ('10', 'hh', '$2y$10$5FmROt7V.2GdBlcNU4ExXedXb9V47hK4rCm2PYUcqDT1sLv8AKqeS', '1', null, '2017-01-17 10:23:29', null);
INSERT INTO `gulu_user` VALUES ('11', 'hihi', '$2y$10$L2V0htob0nHWNwkqVigEPuOpcn6MpFB7/pM..i8brh7KE2n.Yf5Km', '1', null, '2017-01-17 10:25:15', null);
INSERT INTO `gulu_user` VALUES ('12', 'hihi', '$2y$10$g6auW2ZMYw3m0OIPlKv2xewibrS2nIh2ZZ3.hKN92E6ZphaGxCN0O', '1', null, '2017-01-17 10:26:11', null);
INSERT INTO `gulu_user` VALUES ('13', 'hihi', '$2y$10$gaNOh07vYQ1vRiMgbM12RuPQTY5t1p81EpyuHYg.4qn2oCgcVtZZq', '1', null, '2017-01-17 10:26:25', null);
INSERT INTO `gulu_user` VALUES ('14', 'hihi', '$2y$10$E.jRZxLdGmuSN9j9lXEm9OOGtDjSzN38FCQmHEnNDx9yToovDvdS.', '1', null, '2017-01-17 10:27:33', null);
INSERT INTO `gulu_user` VALUES ('15', 'hihi', '$2y$10$mjOx1.mBfzYsl83yFzQwoe9qgCFxUeaJlw07EL41FMwAr17hx6P9i', '1', null, '2017-01-17 10:27:52', null);
INSERT INTO `gulu_user` VALUES ('16', 'hello', '$2y$10$A.hlcSlgngtOJxuAfuJoguY3F/3iT/tVo9wxcIhif3E0PUfYeKuIi', '1', null, '2017-01-17 10:29:30', null);
INSERT INTO `gulu_user` VALUES ('17', 'yy', '$2y$10$2iNDNTPI86MNmDYosQSgN.0DNwZRhmXNyhgAz112qhyFbVPFU9OsW', '1', null, '2017-01-17 10:31:31', null);
INSERT INTO `gulu_user` VALUES ('18', 'yy', '$2y$10$11rTjhJ9aGMGzFthE/gO5.mfz4qVdMx1I6WzyXc/p8sxCTFrxCwJK', '1', null, '2017-01-17 10:32:05', null);
INSERT INTO `gulu_user` VALUES ('19', 'yy', '$2y$10$qHzVMXK5f4QZXMd5vgtZI.U/Gamkzw1HFrTwKHzAhhYZ.icak0KTK', '1', null, '2017-01-17 10:32:17', null);

-- ----------------------------
-- Table structure for gulu_users
-- ----------------------------
DROP TABLE IF EXISTS `gulu_users`;
CREATE TABLE `gulu_users` (
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
-- Records of gulu_users
-- ----------------------------
INSERT INTO `gulu_users` VALUES ('1', 'HRyii', 'hruiyi@eit360.com', '$2y$10$1UZWh8IlDB079cxK9pvCTOVmiq.X/iKMRNch05gQPPJ0/5BCeMEju', '1', '45PzlPBHcCELZAfeibzgUA60KIwsJvqhAF5jiNlYUTkGAaApWUjMPKFXKoXB', '2016-10-25 14:00:04', '2016-11-05 01:57:03');
INSERT INTO `gulu_users` VALUES ('2', 'Newell Mills', 'kquigley@example.com', '$2y$10$PNrZOd.ibKOMr2vCV2g5rOMB3XvqeoENeh.dvPPjP79f0GKG8MPMa', '1', 'SC5CoED2Dk', '2016-10-25 14:00:09', '2016-10-25 14:08:11');
INSERT INTO `gulu_users` VALUES ('3', 'Rosa Mann PhD', 'maia12@example.com', '$2y$10$A3jzDLA/kLBmqkeIm10CDu3756tJE3T3ewN2YZSDXz6OQ9xga7qEm', '0', 'b6aR8kslta', '2016-10-25 14:00:09', '2016-10-25 14:08:13');
INSERT INTO `gulu_users` VALUES ('4', 'Mr. Danial Tromp DVM', 'ewill@example.com', '$2y$10$9V3cQtDZvpUsZ7LOBYr5VuMj.calPH3BxYl.WOiY8nB689QyvP3Hy', '1', '9QRpTUUTKn', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('5', 'Amir Adams', 'estel.doyle@example.com', '$2y$10$wcqEtlsyMSk.PGZD0avDY.0IEGUMqwTtBQo8SqmbGzZBGG7zwqQOO', '0', 'w7yqXmgXcF', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('6', 'Grayson Stehr', 'ernser.vada@example.com', '$2y$10$L3FOByjNwpmizcCozCtBUeszqCshLDvYKFDIJcSLsYgKjF5/IiXwC', '0', 'HLObhAaCWn', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('7', 'Betsy Yundt', 'melissa89@example.net', '$2y$10$1ryR6BIojMeTHGiwhhAfp.Q1alMD5rQhJ/ZAGPhv37b1Ft/2dOGNS', '0', 'WXRfBFNhlD', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('8', 'Judy Parisian', 'fannie.green@example.net', '$2y$10$RYiH0WSXKN0..V5dvzTj6.MElJ9FtcwxZdCoOBmzKXkG6b7EXjc0u', '1', 'Dplmi9FszT', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('9', 'Mr. Colt Murazik Jr.', 'millie17@example.org', '$2y$10$qaFXzXzrWvjSxRG0GX5th.2fCQ/D4BBTo9iHoIXZTgDwshszvQpve', '0', 'g4uR21Ctd6', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('10', 'Frankie Willms Sr.', 'jmueller@example.org', '$2y$10$.tVjpJKTOQHp8Uu3IsO5H.2/Gj6SwWZOrs5pNdllyTXErNA9MtOz.', '1', 'ssAClQXbj9', '2016-10-25 14:00:09', '2016-10-25 14:00:09');
INSERT INTO `gulu_users` VALUES ('11', 'Darby Reynolds', 'letitia80@example.net', '$2y$10$4aAGZfkH8v5C7dhGGf9j6ev0oPhjd.Xd3qHYDNyXi.RdgptPhz7zG', '1', '313RP4186M', '2016-10-25 14:00:09', '2016-10-25 14:00:09');

-- ----------------------------
-- Table structure for gulu_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `gulu_user_bill`;
CREATE TABLE `gulu_user_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(2) unsigned DEFAULT NULL COMMENT '类型：1：充值 2：订餐',
  `amount` decimal(10,2) unsigned DEFAULT NULL,
  `foreign_id` int(10) unsigned DEFAULT NULL COMMENT '对应类型的记录ID',
  `balance` decimal(10,0) DEFAULT '0' COMMENT '账户结余',
  `create_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_bill_user1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gulu_user_bill
-- ----------------------------

-- ----------------------------
-- Table structure for gulu_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `gulu_user_profile`;
CREATE TABLE `gulu_user_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cellphone` varchar(11) NOT NULL DEFAULT '',
  `wechat` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `identify` varchar(255) NOT NULL DEFAULT '',
  `gender` enum('男','女') NOT NULL,
  `birthday` date NOT NULL DEFAULT '1970-01-01',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_user_profile
-- ----------------------------

-- ----------------------------
-- Table structure for gulu_user_role
-- ----------------------------
DROP TABLE IF EXISTS `gulu_user_role`;
CREATE TABLE `gulu_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gulu_user_role
-- ----------------------------
INSERT INTO `gulu_user_role` VALUES ('1', '1', '2017-01-16 15:34:56');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', 'alipay', '0', '1', '0');
INSERT INTO `payment` VALUES ('2', 'wechat', '0', '1', '0');

-- ----------------------------
-- Table structure for phinxlog
-- ----------------------------
DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phinxlog
-- ----------------------------
INSERT INTO `phinxlog` VALUES ('20161212040314', 'CreateUserTable', '2017-01-16 07:34:54', '2017-01-16 07:34:54', '0');
INSERT INTO `phinxlog` VALUES ('20161212040449', 'CreateRoleTable', '2017-01-16 07:34:54', '2017-01-16 07:34:54', '0');
INSERT INTO `phinxlog` VALUES ('20161212040539', 'CreateUserRoleTable', '2017-01-16 07:34:54', '2017-01-16 07:34:54', '0');
INSERT INTO `phinxlog` VALUES ('20161212040809', 'CreateUserProfileTable', '2017-01-16 07:34:54', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161212040831', 'CreateAdminTable', '2017-01-16 07:34:55', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161212040847', 'CreatePermissionTable', '2017-01-16 07:34:55', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161212040857', 'CreateRolePermissionTable', '2017-01-16 07:34:55', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161212040947', 'CreateModuleTable', '2017-01-16 07:34:55', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161212040950', 'CreateMenuTable', '2017-01-16 07:34:55', '2017-01-16 07:34:55', '0');
INSERT INTO `phinxlog` VALUES ('20161213060107', 'InsertUserTable', '2017-01-16 07:34:55', '2017-01-16 07:34:56', '0');
INSERT INTO `phinxlog` VALUES ('20161216091404', 'CreateTableTable', '2017-01-16 07:34:56', '2017-01-16 07:34:56', '0');
INSERT INTO `phinxlog` VALUES ('20170108013221', 'CreateCompanyTable', '2017-01-16 07:34:56', '2017-01-16 07:34:56', '0');
INSERT INTO `phinxlog` VALUES ('20170108013311', 'CreateCompanyGroupTable', '2017-01-16 07:34:56', '2017-01-16 07:34:56', '0');
INSERT INTO `phinxlog` VALUES ('20170108013319', 'CreateCompanyGroupUserTable', '2017-01-16 07:34:56', '2017-01-16 07:34:56', '0');
INSERT INTO `phinxlog` VALUES ('20170108013329', 'CreateCompanyUserTable', '2017-01-16 07:34:56', '2017-01-16 07:34:57', '0');
INSERT INTO `phinxlog` VALUES ('20170108013357', 'CreateOrderTable', '2017-01-16 07:34:57', '2017-01-16 07:34:57', '0');
INSERT INTO `phinxlog` VALUES ('20170108013429', 'CreateCompanyBillTable', '2017-01-16 07:34:57', '2017-01-16 07:34:57', '0');
