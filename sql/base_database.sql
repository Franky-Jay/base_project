/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : base_database

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-09-01 09:41:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_menu`
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `pId` varchar(36) DEFAULT NULL COMMENT '所属上级',
  `open` varchar(10) DEFAULT NULL COMMENT '是否展开',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:菜单,2:按钮)',
  `uri` varchar(100) DEFAULT NULL COMMENT 'URI路径',
  `classpath` varchar(100) DEFAULT NULL COMMENT '控制层类全路径(类全路径:方法名)，与AOP注解配置一致',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `iconOpen` varchar(50) DEFAULT NULL COMMENT '打开时的图标',
  `iconClose` varchar(50) DEFAULT NULL COMMENT '关闭时的图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  `islist` int(11) DEFAULT NULL COMMENT '是否查询列表\r\n            0否1是',
  `business_code` varchar(50) DEFAULT NULL COMMENT '业务数据编码\r\n            查询列表必填，并且需要配置查询规则\r\n            与AOP注解配置一致',
  `lastmodifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能权限(资源)';

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES ('03', '0', 'true', '系统管理', null, null, null, null, '../resources/assets/css/img/diy/1_open.png', '../resources/assets/css/img/diy/1_close.png', null, '2017-08-08 13:36:00', '2', null, null, '2017-08-08 23:11:12');
INSERT INTO `base_menu` VALUES ('04', '03', null, '用户列表', null, null, null, null, null, null, null, '2017-08-08 18:17:32', null, null, null, '2017-08-08 18:17:32');
INSERT INTO `base_menu` VALUES ('05', '04', null, '新增', null, null, null, '../resources/assets/css/img/diy/3.png', null, null, null, '2017-08-08 18:17:52', null, null, null, '2017-08-08 19:12:00');
INSERT INTO `base_menu` VALUES ('06', '04', null, '修改', null, null, null, '../resources/assets/css/img/diy/6.png', null, null, null, '2017-08-08 18:18:05', null, null, null, '2017-08-08 19:12:25');
INSERT INTO `base_menu` VALUES ('07', '04', null, '删除', null, null, null, '../resources/assets/css/img/diy/9.png', null, null, null, '2017-08-08 18:18:16', null, null, null, '2017-08-08 19:13:43');
INSERT INTO `base_menu` VALUES ('09', '0', null, '客户管理', null, null, null, null, '../resources/assets/css/img/diy/1_open.png', '../resources/assets/css/img/diy/1_close.png', null, '2017-08-08 19:09:11', '1', null, null, '2017-08-08 23:11:15');
INSERT INTO `base_menu` VALUES ('10', '09', null, '意向库', null, null, null, 'button ico_open', null, null, null, '2017-08-08 19:09:21', null, null, null, '2017-08-08 19:15:03');
INSERT INTO `base_menu` VALUES ('11', '09', null, '公共库', null, null, null, '../resources/assets/css/img/diy/9.png', '', '', null, '2017-08-08 19:09:23', null, null, null, '2017-08-08 19:28:13');
INSERT INTO `base_menu` VALUES ('12', '10', null, '新增', null, null, null, '../resources/assets/css/img/diy/3.png', null, null, null, '2017-08-08 19:09:26', null, null, null, '2017-08-08 19:11:46');
INSERT INTO `base_menu` VALUES ('13', '10', null, '修改', null, null, null, '../resources/assets/css/img/diy/6.png', null, null, null, '2017-08-08 19:10:18', null, null, null, '2017-08-08 19:11:54');

-- ----------------------------
-- Table structure for `com_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `com_dictionary`;
CREATE TABLE `com_dictionary` (
  `id` varchar(100) NOT NULL,
  `typename` varchar(20) DEFAULT '',
  `typecode` varchar(20) DEFAULT '',
  `datakey` varchar(100) DEFAULT NULL,
  `datavalue` varchar(2000) DEFAULT NULL,
  `orders` varchar(255) DEFAULT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of com_dictionary
-- ----------------------------
INSERT INTO `com_dictionary` VALUES ('1a143cecb2844b3aa6e7228ba679a5ea', '按钮', 'menu.button', '修改', '修改', '2', '2017-08-08 23:09:22', '2017-08-08 23:09:22');
INSERT INTO `com_dictionary` VALUES ('39585f76076249f18225dcb9c0e89a4f', '按钮', 'menu.button', '新增', '新增', '1', '2017-08-08 23:07:40', '2017-08-08 23:08:59');
INSERT INTO `com_dictionary` VALUES ('718755a932ce4ea5beee09d9e7bfcf78', '按钮', 'menu.button', '查询', '查询', '4', '2017-08-08 23:09:48', '2017-08-08 23:12:12');
INSERT INTO `com_dictionary` VALUES ('97c1759b6ce04908a93294de3a0f9502', '按钮', 'menu.button', '删除', '删除', '3', '2017-08-08 23:09:36', '2017-08-08 23:09:36');

-- ----------------------------
-- Table structure for `uid_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `uid_sequence`;
CREATE TABLE `uid_sequence` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stub` (`stub`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uid_sequence
-- ----------------------------
INSERT INTO `uid_sequence` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lasttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '超级管理员', 'admin', '272211eaa2b3462f8e8ca2b761a66ec1', '39985e28fc45f1aeff893ad96a57a9b1', '2017-08-02 10:42:04', '2017-08-02 11:26:33');
INSERT INTO `user` VALUES ('2', '普通管理员', 'lingdu', '3e2dd3d4a8b04c5d9c6822cd91899aec', '24f520ee45b1619414ca13906b005038', '2017-08-02 11:17:44', '2017-08-02 11:26:35');
INSERT INTO `user` VALUES ('96f02c56858b431a83e7cc4931f12ee5', '测试员', 'test', '48ae127a49434aecad36e4a5c718764e', '55324c60694c578e84c42842a179cfec', '2017-08-02 11:26:50', '2017-08-02 11:26:50');
