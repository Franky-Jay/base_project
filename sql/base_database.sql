/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : base_database

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-08-03 15:41:53
*/

SET FOREIGN_KEY_CHECKS=0;

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
