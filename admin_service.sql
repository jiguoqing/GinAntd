/*
 Navicat Premium Data Transfer

 Source Server         : dockerMysql
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 127.0.0.1:30002
 Source Schema         : admin_service

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 17/07/2020 10:15:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_address
-- ----------------------------
DROP TABLE IF EXISTS `sys_address`;
CREATE TABLE `sys_address` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `country_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '国家ID',
  `province_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `city_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '市区ID',
  `town_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '区ID',
  `zip_code` char(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_address
-- ----------------------------
BEGIN;
INSERT INTO `sys_address` VALUES (1, 1, 2, 3, 4, '888888', '2020-07-10 04:44:50', '2020-07-10 04:47:29');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单名',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单URL地址',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '用户列表', '/user/list', '2020-07-10 04:39:29', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES (2, '角色列表', '/role/list', '2020-07-10 04:39:50', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES (3, '首页', '/welcome', '2020-07-10 04:40:46', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL COMMENT '地区名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_region
-- ----------------------------
BEGIN;
INSERT INTO `sys_region` VALUES (1, '广东省', '2020-07-10 12:46:29', '2020-07-10 04:46:30');
INSERT INTO `sys_region` VALUES (2, '深圳市', '2020-07-10 12:46:41', '2020-07-10 12:46:52');
INSERT INTO `sys_region` VALUES (3, '宝安区', '2020-07-10 12:46:49', '2020-07-10 12:46:54');
INSERT INTO `sys_region` VALUES (4, '新安街道', '2020-07-10 12:47:22', '2020-07-10 12:47:25');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `desc` varchar(128) NOT NULL DEFAULT '' COMMENT '描述信息',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 'root', '超级管理员', '2020-07-10 04:40:56', '2020-07-10 04:42:01');
INSERT INTO `sys_role` VALUES (2, 'manager', '经理', '2020-07-10 04:41:06', '2020-07-10 04:42:09');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1, 1, '2020-07-10 04:42:57', '0000-00-00 00:00:00');
INSERT INTO `sys_role_menu` VALUES (2, 1, 2, '2020-07-10 04:43:02', '0000-00-00 00:00:00');
INSERT INTO `sys_role_menu` VALUES (3, 1, 3, '2020-07-10 04:43:06', '0000-00-00 00:00:00');
INSERT INTO `sys_role_menu` VALUES (4, 2, 2, '2020-07-10 04:43:10', '0000-00-00 00:00:00');
INSERT INTO `sys_role_menu` VALUES (5, 2, 1, '2020-07-10 04:43:14', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `nick_name` varchar(32) NOT NULL DEFAULT '' COMMENT '别名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `address_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '地址ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `salt_str` varchar(32) NOT NULL DEFAULT '' COMMENT '密码加盐值',
  `avatar` varchar(256) NOT NULL DEFAULT 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png',
  `desc` varchar(128) NOT NULL DEFAULT '描述' COMMENT '描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'root', '超级管理员', '10086', 1, '2020-07-10 04:43:40', '2020-07-17 01:55:23', '', '', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '描述', 1);
INSERT INTO `sys_user` VALUES (2, 'zhangsan', '普通用户', '10010', 2, '2020-07-10 04:44:10', '2020-07-17 01:55:23', '', '', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '描述', 1);
INSERT INTO `sys_user` VALUES (3, 'TerryFei', '普通用户', '10010', 2, '2020-07-10 04:44:10', '2020-07-17 01:55:23', '', '', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '描述', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `role_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2020-07-10 04:44:29', '0000-00-00 00:00:00');
INSERT INTO `sys_user_role` VALUES (2, 2, 2, '2020-07-10 04:44:33', '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
