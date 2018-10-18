/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : che

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-10-18 11:49:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `pass` varchar(255) NOT NULL COMMENT '密码',
  `phone` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表日期',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'xueninyuan@126.com', '4297f44b13955235245b2497399d7a93', '15958644204', '2018-10-12 09:48:25', '1');
INSERT INTO `admin` VALUES ('2', 'xueninyuan@126', '4297f44b13955235245b2497399d7a93', '15958644204', '2018-10-12 09:48:25', '9');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  KEY `role_id` (`role_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', '1');
INSERT INTO `admin_role` VALUES ('9', '2');

-- ----------------------------
-- Table structure for classs
-- ----------------------------
DROP TABLE IF EXISTS `classs`;
CREATE TABLE `classs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名字',
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classs
-- ----------------------------
INSERT INTO `classs` VALUES ('1', '精品界面', '0');
INSERT INTO `classs` VALUES ('2', '推荐界面', '0');
INSERT INTO `classs` VALUES ('3', '今日精品', '1');
INSERT INTO `classs` VALUES ('4', '昨日精品', '1');
INSERT INTO `classs` VALUES ('5', '今日推荐', '2');
INSERT INTO `classs` VALUES ('6', '昨日推荐', '2');
INSERT INTO `classs` VALUES ('7', '电器', '3');
INSERT INTO `classs` VALUES ('8', '食物', '3');
INSERT INTO `classs` VALUES ('9', '电器', '4');
INSERT INTO `classs` VALUES ('10', '食物', '4');
INSERT INTO `classs` VALUES ('11', '电器', '5');
INSERT INTO `classs` VALUES ('12', '食物', '5');
INSERT INTO `classs` VALUES ('13', '电器', '6');
INSERT INTO `classs` VALUES ('14', '食物', '6');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `diji` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `content` varchar(255) NOT NULL,
  `cla1` varchar(255) NOT NULL COMMENT '分类',
  `cla2` varchar(255) NOT NULL,
  `cla3` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '打算', '0', '0', '1', '2018-10-15 09:18:29', '2018-10-15 09:18:29', null, '打算', '1', '3', '7');
INSERT INTO `goods` VALUES ('2', '打算', '0', '0', '1', '2018-10-15 09:18:29', '2018-10-15 09:18:29', null, '打算', '1', '3', '7');
INSERT INTO `goods` VALUES ('3', '打算', '0', '0', '1', '2018-10-15 09:18:29', '2018-10-15 09:18:29', null, '打算', '1', '3', '8');
INSERT INTO `goods` VALUES ('4', '打算', '0', '0', '1', '2018-10-15 09:18:29', '2018-10-15 09:18:29', null, '打算', '1', '3', '8');
INSERT INTO `goods` VALUES ('5', '打算', '0', '0', '1', '2018-10-15 09:18:41', '2018-10-15 09:18:41', null, '打算', '1', '4', '9');
INSERT INTO `goods` VALUES ('6', '打算', '0', '0', '1', '2018-10-15 09:18:41', '2018-10-15 09:18:41', null, '打算', '1', '4', '9');
INSERT INTO `goods` VALUES ('7', '打算', '0', '0', '1', '2018-10-15 09:18:43', '2018-10-15 09:18:43', null, '打算', '1', '4', '10');
INSERT INTO `goods` VALUES ('8', '打算', '0', '0', '1', '2018-10-15 09:18:45', '2018-10-15 09:18:45', null, '打算', '2', '4', '10');
INSERT INTO `goods` VALUES ('9', '打算', '0', '0', '1', '2018-10-15 09:19:03', '2018-10-15 09:19:03', null, '打算', '2', '5', '11');
INSERT INTO `goods` VALUES ('10', '打算', '0', '0', '1', '2018-10-15 09:19:05', '2018-10-15 09:19:05', null, '打算', '2', '5', '11');
INSERT INTO `goods` VALUES ('11', '打算', '0', '0', '1', '2018-10-15 09:19:06', '2018-10-15 09:19:06', null, '打算', '2', '5', '12');
INSERT INTO `goods` VALUES ('16', '20woa ', '0', '0', '1', '2018-10-15 09:19:08', '2018-10-15 09:19:08', null, '打算打算da', '2', '5', '12');
INSERT INTO `goods` VALUES ('17', '啊大大打算啊', '0', '0', '1', '2018-10-15 09:19:13', '2018-10-15 09:19:13', null, 'das', '2', '5', '12');
INSERT INTO `goods` VALUES ('18', '啊大大', '0', '0', '1', '2018-10-15 09:19:15', '2018-10-15 09:19:15', null, 'das', '2', '6', '13');
INSERT INTO `goods` VALUES ('19', '20', '0', '0', '1', '2018-10-15 09:19:16', '2018-10-15 09:19:16', null, 'da', '2', '6', '14');
INSERT INTO `goods` VALUES ('20', '20', '0', '0', '1', '2018-10-15 09:19:19', '2018-10-15 09:19:19', null, 'das', '2', '6', '14');
INSERT INTO `goods` VALUES ('21', 'dasdacz', '0', '0', '1', '2018-10-15 10:13:06', '2018-10-15 10:13:06', null, 'kjh', '1', '4', '9');
INSERT INTO `goods` VALUES ('22', 'da', '0', '0', '1', '2018-10-16 14:56:32', '2018-10-16 14:56:32', null, 'da', '2', '6', '14');

-- ----------------------------
-- Table structure for good_img
-- ----------------------------
DROP TABLE IF EXISTS `good_img`;
CREATE TABLE `good_img` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_img
-- ----------------------------

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pri_name` varchar(255) NOT NULL COMMENT '权限名称',
  `url_path` varchar(255) NOT NULL COMMENT '对应的URL地址，多个地址用,隔开',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '商品模块', '', '0');
INSERT INTO `privilege` VALUES ('2', '商品列表', 'goods/design', '1');
INSERT INTO `privilege` VALUES ('3', '添加商品', 'goods/create,goods/design', '2');
INSERT INTO `privilege` VALUES ('4', '修改商品', 'goods/edit,goods/update', '2');
INSERT INTO `privilege` VALUES ('5', '删除商品', 'goods/delete', '2');
INSERT INTO `privilege` VALUES ('6', '管理员模块', '', '0');
INSERT INTO `privilege` VALUES ('7', '管理员列表', 'istrators/design', '6');
INSERT INTO `privilege` VALUES ('8', '添加管理员', 'istrators/create,istrators/design', '7');
INSERT INTO `privilege` VALUES ('9', '修改管理员', 'istrators/edit,istrators/update', '7');
INSERT INTO `privilege` VALUES ('10', '删除管理员', 'istrators/delete', '7');
INSERT INTO `privilege` VALUES ('26', '权限列表', 'privilege/design', '6');
INSERT INTO `privilege` VALUES ('27', '添加权限', 'privilege/create,privilege/design', '26');
INSERT INTO `privilege` VALUES ('28', '删除权限', 'privilege/delete', '26');
INSERT INTO `privilege` VALUES ('29', '修改权限', 'privilege/edit,privilege/update', '26');
INSERT INTO `privilege` VALUES ('35', '角色列表', 'role/design', '6');
INSERT INTO `privilege` VALUES ('36', '添加角色', 'role/create,role/design', '35');
INSERT INTO `privilege` VALUES ('37', '删除角色', 'role/delete', '35');
INSERT INTO `privilege` VALUES ('38', '修改角色', 'role/edit,role/update', '35');

-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES ('1', '127.0.0.1', '1', '/goods/design', '2018-10-16 08:23:22');
INSERT INTO `pv` VALUES ('3', '127.0.0.1', '1', '/goods/design', '2018-10-16 08:23:26');
INSERT INTO `pv` VALUES ('4', '127.0.0.1', '1', '/', '2018-10-16 08:23:44');
INSERT INTO `pv` VALUES ('5', '127.0.0.1', '1', '/', '2018-10-16 08:24:14');
INSERT INTO `pv` VALUES ('6', '127.0.0.1', '1', '/', '2018-10-16 09:41:11');
INSERT INTO `pv` VALUES ('7', '127.0.0.1', '1', '/', '2018-10-16 09:42:05');
INSERT INTO `pv` VALUES ('8', '127.0.0.1', '1', '/goods/design', '2018-10-16 09:44:09');
INSERT INTO `pv` VALUES ('9', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:44:14');
INSERT INTO `pv` VALUES ('10', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:50:37');
INSERT INTO `pv` VALUES ('11', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:51:34');
INSERT INTO `pv` VALUES ('12', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:52:28');
INSERT INTO `pv` VALUES ('13', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:54:12');
INSERT INTO `pv` VALUES ('14', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:54:47');
INSERT INTO `pv` VALUES ('15', '127.0.0.1', '1', '/goods/create', '2018-10-16 09:55:03');
INSERT INTO `pv` VALUES ('16', '127.0.0.1', '1', '/', '2018-10-16 10:44:32');
INSERT INTO `pv` VALUES ('17', '127.0.0.1', '1', '/goods/design', '2018-10-16 10:44:34');
INSERT INTO `pv` VALUES ('18', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:44:36');
INSERT INTO `pv` VALUES ('19', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:45:31');
INSERT INTO `pv` VALUES ('20', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:46:39');
INSERT INTO `pv` VALUES ('21', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:52:43');
INSERT INTO `pv` VALUES ('22', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:53:54');
INSERT INTO `pv` VALUES ('23', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:58:11');
INSERT INTO `pv` VALUES ('24', '127.0.0.1', '1', '/goods/create', '2018-10-16 10:58:30');
INSERT INTO `pv` VALUES ('25', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:00:53');
INSERT INTO `pv` VALUES ('26', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:03:36');
INSERT INTO `pv` VALUES ('27', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:05:48');
INSERT INTO `pv` VALUES ('28', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:06:23');
INSERT INTO `pv` VALUES ('29', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:06:54');
INSERT INTO `pv` VALUES ('30', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:07:42');
INSERT INTO `pv` VALUES ('31', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:08:20');
INSERT INTO `pv` VALUES ('32', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:08:24');
INSERT INTO `pv` VALUES ('33', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:08:26');
INSERT INTO `pv` VALUES ('34', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:08:56');
INSERT INTO `pv` VALUES ('35', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:12:09');
INSERT INTO `pv` VALUES ('36', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:15:28');
INSERT INTO `pv` VALUES ('37', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:17:20');
INSERT INTO `pv` VALUES ('38', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:20:26');
INSERT INTO `pv` VALUES ('39', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:21:38');
INSERT INTO `pv` VALUES ('40', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:22:00');
INSERT INTO `pv` VALUES ('41', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:24:08');
INSERT INTO `pv` VALUES ('42', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:27:23');
INSERT INTO `pv` VALUES ('43', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:31:20');
INSERT INTO `pv` VALUES ('44', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:32:27');
INSERT INTO `pv` VALUES ('45', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:38:51');
INSERT INTO `pv` VALUES ('46', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:39:40');
INSERT INTO `pv` VALUES ('47', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:41:33');
INSERT INTO `pv` VALUES ('48', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:47:15');
INSERT INTO `pv` VALUES ('49', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:50:57');
INSERT INTO `pv` VALUES ('50', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:52:33');
INSERT INTO `pv` VALUES ('51', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:53:40');
INSERT INTO `pv` VALUES ('52', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:54:59');
INSERT INTO `pv` VALUES ('53', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:56:35');
INSERT INTO `pv` VALUES ('54', '127.0.0.1', '1', '/goods/create', '2018-10-16 11:59:22');
INSERT INTO `pv` VALUES ('55', '127.0.0.1', '1', '/', '2018-10-16 13:18:06');
INSERT INTO `pv` VALUES ('56', '127.0.0.1', '1', '/goods/design', '2018-10-16 13:18:08');
INSERT INTO `pv` VALUES ('57', '127.0.0.1', '1', '/goods/create', '2018-10-16 13:18:10');
INSERT INTO `pv` VALUES ('58', '127.0.0.1', '1', '/', '2018-10-16 14:21:08');
INSERT INTO `pv` VALUES ('59', '127.0.0.1', '1', '/goods/design', '2018-10-16 14:21:11');
INSERT INTO `pv` VALUES ('60', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:21:12');
INSERT INTO `pv` VALUES ('61', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:23:46');
INSERT INTO `pv` VALUES ('62', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:28:13');
INSERT INTO `pv` VALUES ('63', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:40:34');
INSERT INTO `pv` VALUES ('64', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:41:05');
INSERT INTO `pv` VALUES ('65', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:41:26');
INSERT INTO `pv` VALUES ('66', '127.0.0.1', '1', '/goods/ajax_get_cat?id=2', '2018-10-16 14:56:30');
INSERT INTO `pv` VALUES ('67', '127.0.0.1', '1', '/goods/ajax_get_cat?id=6', '2018-10-16 14:56:30');
INSERT INTO `pv` VALUES ('68', '127.0.0.1', '1', '/goods/insert', '2018-10-16 14:56:32');
INSERT INTO `pv` VALUES ('69', '127.0.0.1', '1', '/goods/design', '2018-10-16 14:56:33');
INSERT INTO `pv` VALUES ('70', '127.0.0.1', '1', '/goods/edit?id=22', '2018-10-16 14:56:36');
INSERT INTO `pv` VALUES ('71', '127.0.0.1', '1', '/goods/ajax_get_cat?id=2', '2018-10-16 14:56:37');
INSERT INTO `pv` VALUES ('72', '127.0.0.1', '1', '/goods/ajax_get_cat?id=6', '2018-10-16 14:56:37');
INSERT INTO `pv` VALUES ('73', '127.0.0.1', '1', '/goods/design', '2018-10-16 14:56:41');
INSERT INTO `pv` VALUES ('74', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:59:36');
INSERT INTO `pv` VALUES ('75', '127.0.0.1', '1', '/goods/create', '2018-10-16 14:59:49');
INSERT INTO `pv` VALUES ('76', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:00:03');
INSERT INTO `pv` VALUES ('77', '127.0.0.1', '1', '/goods/create', '2018-10-16 15:01:01');
INSERT INTO `pv` VALUES ('78', '127.0.0.1', '1', '/goods/create', '2018-10-16 15:01:03');
INSERT INTO `pv` VALUES ('79', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:01:16');
INSERT INTO `pv` VALUES ('80', '127.0.0.1', '1', '/goods/design', '2018-10-16 15:01:16');
INSERT INTO `pv` VALUES ('81', '127.0.0.1', '1', '/goods/design', '2018-10-16 15:01:40');
INSERT INTO `pv` VALUES ('82', '127.0.0.1', '1', '/goods/create', '2018-10-16 15:02:05');
INSERT INTO `pv` VALUES ('83', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:02:49');
INSERT INTO `pv` VALUES ('84', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:04:30');
INSERT INTO `pv` VALUES ('85', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:05:32');
INSERT INTO `pv` VALUES ('86', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:11:29');
INSERT INTO `pv` VALUES ('87', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:12:35');
INSERT INTO `pv` VALUES ('88', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:18:55');
INSERT INTO `pv` VALUES ('89', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:21:10');
INSERT INTO `pv` VALUES ('90', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:21:19');
INSERT INTO `pv` VALUES ('91', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:21:50');
INSERT INTO `pv` VALUES ('92', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:22:05');
INSERT INTO `pv` VALUES ('93', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:22:28');
INSERT INTO `pv` VALUES ('94', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:22:40');
INSERT INTO `pv` VALUES ('95', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:23:29');
INSERT INTO `pv` VALUES ('96', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:27:52');
INSERT INTO `pv` VALUES ('97', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:36:13');
INSERT INTO `pv` VALUES ('98', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:36:57');
INSERT INTO `pv` VALUES ('99', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:37:58');
INSERT INTO `pv` VALUES ('100', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:39:05');
INSERT INTO `pv` VALUES ('101', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:43:15');
INSERT INTO `pv` VALUES ('102', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:43:31');
INSERT INTO `pv` VALUES ('103', '127.0.0.1', '1', '/goods/insert', '2018-10-16 15:43:56');
INSERT INTO `pv` VALUES ('104', '127.0.0.1', '1', '/', '2018-10-16 16:18:52');
INSERT INTO `pv` VALUES ('105', '127.0.0.1', '1', '/goods/design', '2018-10-16 16:18:54');
INSERT INTO `pv` VALUES ('106', '127.0.0.1', '1', '/goods/create', '2018-10-16 16:18:56');
INSERT INTO `pv` VALUES ('107', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:19:13');
INSERT INTO `pv` VALUES ('108', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:19:43');
INSERT INTO `pv` VALUES ('109', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:20:05');
INSERT INTO `pv` VALUES ('110', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:22:05');
INSERT INTO `pv` VALUES ('111', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:23:17');
INSERT INTO `pv` VALUES ('112', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:25:09');
INSERT INTO `pv` VALUES ('113', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:27:23');
INSERT INTO `pv` VALUES ('114', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:28:21');
INSERT INTO `pv` VALUES ('115', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:29:42');
INSERT INTO `pv` VALUES ('116', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:30:18');
INSERT INTO `pv` VALUES ('117', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:30:47');
INSERT INTO `pv` VALUES ('118', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:31:47');
INSERT INTO `pv` VALUES ('119', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:32:17');
INSERT INTO `pv` VALUES ('120', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:32:27');
INSERT INTO `pv` VALUES ('121', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:33:04');
INSERT INTO `pv` VALUES ('122', '127.0.0.1', '1', '/goods/design', '2018-10-16 16:33:04');
INSERT INTO `pv` VALUES ('123', '127.0.0.1', '1', '/goods/create', '2018-10-16 16:33:27');
INSERT INTO `pv` VALUES ('124', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 16:33:30');
INSERT INTO `pv` VALUES ('125', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 16:33:30');
INSERT INTO `pv` VALUES ('126', '127.0.0.1', '1', '/goods/insert', '2018-10-16 16:33:46');
INSERT INTO `pv` VALUES ('127', '127.0.0.1', '1', '/goods/design', '2018-10-16 16:33:47');
INSERT INTO `pv` VALUES ('128', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 16:34:17');
INSERT INTO `pv` VALUES ('129', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 16:34:18');
INSERT INTO `pv` VALUES ('130', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 16:34:19');
INSERT INTO `pv` VALUES ('131', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 16:36:28');
INSERT INTO `pv` VALUES ('132', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 16:36:29');
INSERT INTO `pv` VALUES ('133', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 16:36:30');
INSERT INTO `pv` VALUES ('134', '127.0.0.1', '1', '/', '2018-10-16 19:46:05');
INSERT INTO `pv` VALUES ('135', '127.0.0.1', '1', '/goods/design', '2018-10-16 19:46:07');
INSERT INTO `pv` VALUES ('136', '127.0.0.1', '1', '/goods/create', '2018-10-16 19:46:09');
INSERT INTO `pv` VALUES ('137', '127.0.0.1', '1', '/goods/design', '2018-10-16 19:46:10');
INSERT INTO `pv` VALUES ('138', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:46:12');
INSERT INTO `pv` VALUES ('139', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:46:12');
INSERT INTO `pv` VALUES ('140', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:46:13');
INSERT INTO `pv` VALUES ('141', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:47:24');
INSERT INTO `pv` VALUES ('142', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:47:25');
INSERT INTO `pv` VALUES ('143', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:47:25');
INSERT INTO `pv` VALUES ('144', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:49:58');
INSERT INTO `pv` VALUES ('145', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:49:58');
INSERT INTO `pv` VALUES ('146', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:49:58');
INSERT INTO `pv` VALUES ('147', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:50:25');
INSERT INTO `pv` VALUES ('148', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:50:26');
INSERT INTO `pv` VALUES ('149', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:50:26');
INSERT INTO `pv` VALUES ('150', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:55:51');
INSERT INTO `pv` VALUES ('151', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:55:52');
INSERT INTO `pv` VALUES ('152', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:55:52');
INSERT INTO `pv` VALUES ('153', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:56:01');
INSERT INTO `pv` VALUES ('154', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:56:02');
INSERT INTO `pv` VALUES ('155', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:56:02');
INSERT INTO `pv` VALUES ('156', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:56:08');
INSERT INTO `pv` VALUES ('157', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:56:09');
INSERT INTO `pv` VALUES ('158', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:56:09');
INSERT INTO `pv` VALUES ('159', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:57:52');
INSERT INTO `pv` VALUES ('160', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:57:53');
INSERT INTO `pv` VALUES ('161', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:57:53');
INSERT INTO `pv` VALUES ('162', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 19:58:19');
INSERT INTO `pv` VALUES ('163', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 19:58:20');
INSERT INTO `pv` VALUES ('164', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 19:58:20');
INSERT INTO `pv` VALUES ('165', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:06:10');
INSERT INTO `pv` VALUES ('166', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:06:10');
INSERT INTO `pv` VALUES ('167', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:07:10');
INSERT INTO `pv` VALUES ('168', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:07:10');
INSERT INTO `pv` VALUES ('169', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:07:11');
INSERT INTO `pv` VALUES ('170', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:07:29');
INSERT INTO `pv` VALUES ('171', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:07:29');
INSERT INTO `pv` VALUES ('172', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:07:54');
INSERT INTO `pv` VALUES ('173', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:07:54');
INSERT INTO `pv` VALUES ('174', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:07:55');
INSERT INTO `pv` VALUES ('175', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:07:56');
INSERT INTO `pv` VALUES ('176', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:08:02');
INSERT INTO `pv` VALUES ('177', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:08:03');
INSERT INTO `pv` VALUES ('178', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:08:03');
INSERT INTO `pv` VALUES ('179', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:08:06');
INSERT INTO `pv` VALUES ('180', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:08:17');
INSERT INTO `pv` VALUES ('181', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:08:17');
INSERT INTO `pv` VALUES ('182', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:08:18');
INSERT INTO `pv` VALUES ('183', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:12:04');
INSERT INTO `pv` VALUES ('184', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:12:05');
INSERT INTO `pv` VALUES ('185', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:12:05');
INSERT INTO `pv` VALUES ('186', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:12:07');
INSERT INTO `pv` VALUES ('187', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:12:13');
INSERT INTO `pv` VALUES ('188', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:12:13');
INSERT INTO `pv` VALUES ('189', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:12:14');
INSERT INTO `pv` VALUES ('190', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:12:14');
INSERT INTO `pv` VALUES ('191', '127.0.0.1', '1', '/goods/edit?id=24', '2018-10-16 20:12:16');
INSERT INTO `pv` VALUES ('192', '127.0.0.1', '1', '/goods/update?id=24', '2018-10-16 20:12:24');
INSERT INTO `pv` VALUES ('193', '127.0.0.1', '1', '/goods/update?id=24', '2018-10-16 20:13:07');
INSERT INTO `pv` VALUES ('194', '127.0.0.1', '1', '/goods/update?id=24', '2018-10-16 20:14:00');
INSERT INTO `pv` VALUES ('195', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:14:00');
INSERT INTO `pv` VALUES ('196', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:15:12');
INSERT INTO `pv` VALUES ('197', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:18:13');
INSERT INTO `pv` VALUES ('198', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:18:14');
INSERT INTO `pv` VALUES ('199', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:18:14');
INSERT INTO `pv` VALUES ('200', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:18:32');
INSERT INTO `pv` VALUES ('201', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:18:33');
INSERT INTO `pv` VALUES ('202', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:18:56');
INSERT INTO `pv` VALUES ('203', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:18:57');
INSERT INTO `pv` VALUES ('204', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:18:57');
INSERT INTO `pv` VALUES ('205', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:22:02');
INSERT INTO `pv` VALUES ('206', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:22:02');
INSERT INTO `pv` VALUES ('207', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:22:10');
INSERT INTO `pv` VALUES ('208', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:22:10');
INSERT INTO `pv` VALUES ('209', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:22:11');
INSERT INTO `pv` VALUES ('210', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:24:16');
INSERT INTO `pv` VALUES ('211', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:24:16');
INSERT INTO `pv` VALUES ('212', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:24:21');
INSERT INTO `pv` VALUES ('213', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:24:21');
INSERT INTO `pv` VALUES ('214', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:24:21');
INSERT INTO `pv` VALUES ('215', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:24:29');
INSERT INTO `pv` VALUES ('216', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:24:29');
INSERT INTO `pv` VALUES ('217', '127.0.0.1', '1', '/goods/delete?id=23', '2018-10-16 20:25:56');
INSERT INTO `pv` VALUES ('218', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:25:56');
INSERT INTO `pv` VALUES ('219', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:27:36');
INSERT INTO `pv` VALUES ('220', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:27:37');
INSERT INTO `pv` VALUES ('221', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:27:37');
INSERT INTO `pv` VALUES ('222', '127.0.0.1', '1', '/goods/update?id=25', '2018-10-16 20:27:42');
INSERT INTO `pv` VALUES ('223', '127.0.0.1', '1', '/goods/edit?id=25', '2018-10-16 20:27:43');
INSERT INTO `pv` VALUES ('224', '127.0.0.1', '1', '/goods/ajax_get_cat?id=1', '2018-10-16 20:27:43');
INSERT INTO `pv` VALUES ('225', '127.0.0.1', '1', '/goods/ajax_get_cat?id=4', '2018-10-16 20:27:44');
INSERT INTO `pv` VALUES ('226', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:37:32');
INSERT INTO `pv` VALUES ('227', '127.0.0.1', '1', '/goods/delete?id=24', '2018-10-16 20:37:35');
INSERT INTO `pv` VALUES ('228', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:37:35');
INSERT INTO `pv` VALUES ('229', '127.0.0.1', '1', '/goods/delete?id=25', '2018-10-16 20:38:32');
INSERT INTO `pv` VALUES ('230', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:39:10');
INSERT INTO `pv` VALUES ('231', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:40:21');
INSERT INTO `pv` VALUES ('232', '127.0.0.1', '1', '/goods/delete?id=25', '2018-10-16 20:40:23');
INSERT INTO `pv` VALUES ('233', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:44:57');
INSERT INTO `pv` VALUES ('234', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:44:58');
INSERT INTO `pv` VALUES ('235', '127.0.0.1', '1', '/goods/delete?id=25', '2018-10-16 20:45:01');
INSERT INTO `pv` VALUES ('236', '127.0.0.1', '1', '/goods/design', '2018-10-16 20:45:02');
INSERT INTO `pv` VALUES ('237', '127.0.0.1', '1', '/', '2018-10-17 08:06:48');
INSERT INTO `pv` VALUES ('238', '127.0.0.1', '1', '/', '2018-10-17 08:09:27');
INSERT INTO `pv` VALUES ('239', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:09:33');
INSERT INTO `pv` VALUES ('240', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:14:21');
INSERT INTO `pv` VALUES ('241', '127.0.0.1', '1', '/', '2018-10-17 08:14:23');
INSERT INTO `pv` VALUES ('242', '127.0.0.1', '1', '/', '2018-10-17 08:14:24');
INSERT INTO `pv` VALUES ('243', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:14:30');
INSERT INTO `pv` VALUES ('244', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:15:34');
INSERT INTO `pv` VALUES ('245', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:15:37');
INSERT INTO `pv` VALUES ('246', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:16:03');
INSERT INTO `pv` VALUES ('247', '127.0.0.1', '1', '/goods/create', '2018-10-17 08:16:06');
INSERT INTO `pv` VALUES ('248', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:16:08');
INSERT INTO `pv` VALUES ('249', '127.0.0.1', '1', '/goods/edit?id=22', '2018-10-17 08:16:10');
INSERT INTO `pv` VALUES ('250', '127.0.0.1', '1', '/goods/ajax_get_cat?id=2', '2018-10-17 08:16:11');
INSERT INTO `pv` VALUES ('251', '127.0.0.1', '1', '/goods/design', '2018-10-17 08:16:11');
INSERT INTO `pv` VALUES ('252', '127.0.0.1', '1', '/', '2018-10-17 08:41:35');
INSERT INTO `pv` VALUES ('253', '127.0.0.1', '1', '/', '2018-10-17 08:41:53');
INSERT INTO `pv` VALUES ('254', '127.0.0.1', '1', '/', '2018-10-17 08:42:00');
INSERT INTO `pv` VALUES ('255', '127.0.0.1', '1', '/', '2018-10-17 08:57:41');
INSERT INTO `pv` VALUES ('256', '127.0.0.1', '1', '/', '2018-10-17 08:57:50');
INSERT INTO `pv` VALUES ('257', '127.0.0.1', '1', '/', '2018-10-17 08:59:32');
INSERT INTO `pv` VALUES ('258', '127.0.0.1', '2', '/', '2018-10-17 09:01:17');
INSERT INTO `pv` VALUES ('259', '127.0.0.1', '2', '/', '2018-10-17 09:12:41');
INSERT INTO `pv` VALUES ('260', '127.0.0.1', '2', '/', '2018-10-17 09:13:17');
INSERT INTO `pv` VALUES ('261', '127.0.0.1', '2', '/', '2018-10-17 09:13:18');
INSERT INTO `pv` VALUES ('262', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:13:19');
INSERT INTO `pv` VALUES ('263', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:14:28');
INSERT INTO `pv` VALUES ('264', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:14:41');
INSERT INTO `pv` VALUES ('265', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:19:45');
INSERT INTO `pv` VALUES ('266', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:23:28');
INSERT INTO `pv` VALUES ('267', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:24:18');
INSERT INTO `pv` VALUES ('268', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:26:53');
INSERT INTO `pv` VALUES ('269', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:27:30');
INSERT INTO `pv` VALUES ('270', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:31:15');
INSERT INTO `pv` VALUES ('271', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:31:29');
INSERT INTO `pv` VALUES ('272', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:38:37');
INSERT INTO `pv` VALUES ('273', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:38:40');
INSERT INTO `pv` VALUES ('274', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:39:06');
INSERT INTO `pv` VALUES ('275', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:39:27');
INSERT INTO `pv` VALUES ('276', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:39:43');
INSERT INTO `pv` VALUES ('277', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:39:56');
INSERT INTO `pv` VALUES ('278', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:40:21');
INSERT INTO `pv` VALUES ('279', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:41:09');
INSERT INTO `pv` VALUES ('280', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:46:10');
INSERT INTO `pv` VALUES ('281', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:46:44');
INSERT INTO `pv` VALUES ('282', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:47:09');
INSERT INTO `pv` VALUES ('283', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:47:35');
INSERT INTO `pv` VALUES ('284', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:47:51');
INSERT INTO `pv` VALUES ('285', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:49:13');
INSERT INTO `pv` VALUES ('286', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:50:31');
INSERT INTO `pv` VALUES ('287', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:51:13');
INSERT INTO `pv` VALUES ('288', '127.0.0.1', '2', '/istrators/design', '2018-10-17 09:52:08');
INSERT INTO `pv` VALUES ('289', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:52:12');
INSERT INTO `pv` VALUES ('290', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:52:54');
INSERT INTO `pv` VALUES ('291', '127.0.0.1', '2', '/istrators/create', '2018-10-17 09:56:31');
INSERT INTO `pv` VALUES ('292', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:00:55');
INSERT INTO `pv` VALUES ('293', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:01:16');
INSERT INTO `pv` VALUES ('294', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:02:03');
INSERT INTO `pv` VALUES ('295', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:02:17');
INSERT INTO `pv` VALUES ('296', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:02:25');
INSERT INTO `pv` VALUES ('297', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:07:06');
INSERT INTO `pv` VALUES ('298', '127.0.0.1', '2', '/goods/insert', '2018-10-17 10:10:02');
INSERT INTO `pv` VALUES ('299', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:10:02');
INSERT INTO `pv` VALUES ('300', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:10:05');
INSERT INTO `pv` VALUES ('301', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:10:07');
INSERT INTO `pv` VALUES ('302', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:10:21');
INSERT INTO `pv` VALUES ('303', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:11:36');
INSERT INTO `pv` VALUES ('304', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:11:38');
INSERT INTO `pv` VALUES ('305', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:11:40');
INSERT INTO `pv` VALUES ('306', '127.0.0.1', '2', '/goods/insert', '2018-10-17 10:11:53');
INSERT INTO `pv` VALUES ('307', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:11:53');
INSERT INTO `pv` VALUES ('308', '127.0.0.1', '2', '/goods/create', '2018-10-17 10:12:30');
INSERT INTO `pv` VALUES ('309', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:12:33');
INSERT INTO `pv` VALUES ('310', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:12:34');
INSERT INTO `pv` VALUES ('311', '127.0.0.1', '2', '/goods/insert', '2018-10-17 10:13:17');
INSERT INTO `pv` VALUES ('312', '127.0.0.1', '2', '/goods/design', '2018-10-17 10:13:17');
INSERT INTO `pv` VALUES ('313', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:13:22');
INSERT INTO `pv` VALUES ('314', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:13:24');
INSERT INTO `pv` VALUES ('315', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:13:34');
INSERT INTO `pv` VALUES ('316', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:15:05');
INSERT INTO `pv` VALUES ('317', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:17:58');
INSERT INTO `pv` VALUES ('318', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:18:41');
INSERT INTO `pv` VALUES ('319', '127.0.0.1', '2', '/', '2018-10-17 10:22:42');
INSERT INTO `pv` VALUES ('320', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:22:46');
INSERT INTO `pv` VALUES ('321', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:23:11');
INSERT INTO `pv` VALUES ('322', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:23:26');
INSERT INTO `pv` VALUES ('323', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:24:46');
INSERT INTO `pv` VALUES ('324', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:24:47');
INSERT INTO `pv` VALUES ('325', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:25:12');
INSERT INTO `pv` VALUES ('326', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:37:42');
INSERT INTO `pv` VALUES ('327', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:39:29');
INSERT INTO `pv` VALUES ('328', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:39:46');
INSERT INTO `pv` VALUES ('329', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:40:25');
INSERT INTO `pv` VALUES ('330', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:40:32');
INSERT INTO `pv` VALUES ('331', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:40:35');
INSERT INTO `pv` VALUES ('332', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:40:36');
INSERT INTO `pv` VALUES ('333', '127.0.0.1', '2', '/istrators/delete?id=', '2018-10-17 10:40:40');
INSERT INTO `pv` VALUES ('334', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:40:45');
INSERT INTO `pv` VALUES ('335', '127.0.0.1', '2', '/istrators/delete?id=', '2018-10-17 10:44:14');
INSERT INTO `pv` VALUES ('336', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:45:00');
INSERT INTO `pv` VALUES ('337', '127.0.0.1', '2', '/istrators/delete?id=', '2018-10-17 10:45:02');
INSERT INTO `pv` VALUES ('338', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:45:03');
INSERT INTO `pv` VALUES ('339', '127.0.0.1', '2', '/istrators/delete?id=', '2018-10-17 10:45:25');
INSERT INTO `pv` VALUES ('340', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:45:26');
INSERT INTO `pv` VALUES ('341', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:47:19');
INSERT INTO `pv` VALUES ('342', '127.0.0.1', '2', '/istrators/delete?id=2', '2018-10-17 10:48:06');
INSERT INTO `pv` VALUES ('343', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:48:07');
INSERT INTO `pv` VALUES ('344', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:50:16');
INSERT INTO `pv` VALUES ('345', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:51:14');
INSERT INTO `pv` VALUES ('346', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:51:23');
INSERT INTO `pv` VALUES ('347', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:51:37');
INSERT INTO `pv` VALUES ('348', '127.0.0.1', '2', '/istrators/create', '2018-10-17 10:51:40');
INSERT INTO `pv` VALUES ('349', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 10:51:50');
INSERT INTO `pv` VALUES ('350', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:51:50');
INSERT INTO `pv` VALUES ('351', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:52:43');
INSERT INTO `pv` VALUES ('352', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:54:45');
INSERT INTO `pv` VALUES ('353', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:54:55');
INSERT INTO `pv` VALUES ('354', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:55:05');
INSERT INTO `pv` VALUES ('355', '127.0.0.1', '2', '/istrators/delete?id=7', '2018-10-17 10:55:16');
INSERT INTO `pv` VALUES ('356', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:55:17');
INSERT INTO `pv` VALUES ('357', '127.0.0.1', '2', '/istrators/design', '2018-10-17 10:57:43');
INSERT INTO `pv` VALUES ('358', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 10:57:45');
INSERT INTO `pv` VALUES ('359', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 10:58:28');
INSERT INTO `pv` VALUES ('360', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 10:59:22');
INSERT INTO `pv` VALUES ('361', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:01:03');
INSERT INTO `pv` VALUES ('362', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:01:18');
INSERT INTO `pv` VALUES ('363', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:02:24');
INSERT INTO `pv` VALUES ('364', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:04:13');
INSERT INTO `pv` VALUES ('365', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:08:02');
INSERT INTO `pv` VALUES ('366', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:10:00');
INSERT INTO `pv` VALUES ('367', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:10:27');
INSERT INTO `pv` VALUES ('368', '127.0.0.1', '2', '/istrators/edit?id=1', '2018-10-17 11:10:35');
INSERT INTO `pv` VALUES ('369', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:11:01');
INSERT INTO `pv` VALUES ('370', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:11:03');
INSERT INTO `pv` VALUES ('371', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:11:06');
INSERT INTO `pv` VALUES ('372', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:11:08');
INSERT INTO `pv` VALUES ('373', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:11:46');
INSERT INTO `pv` VALUES ('374', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:16:38');
INSERT INTO `pv` VALUES ('375', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:01');
INSERT INTO `pv` VALUES ('376', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:03');
INSERT INTO `pv` VALUES ('377', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:26');
INSERT INTO `pv` VALUES ('378', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:27');
INSERT INTO `pv` VALUES ('379', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:28');
INSERT INTO `pv` VALUES ('380', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:28');
INSERT INTO `pv` VALUES ('381', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:28');
INSERT INTO `pv` VALUES ('382', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:28');
INSERT INTO `pv` VALUES ('383', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:29');
INSERT INTO `pv` VALUES ('384', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:29');
INSERT INTO `pv` VALUES ('385', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:29');
INSERT INTO `pv` VALUES ('386', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:29');
INSERT INTO `pv` VALUES ('387', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:30');
INSERT INTO `pv` VALUES ('388', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:30');
INSERT INTO `pv` VALUES ('389', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:30');
INSERT INTO `pv` VALUES ('390', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:30');
INSERT INTO `pv` VALUES ('391', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:30');
INSERT INTO `pv` VALUES ('392', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:31');
INSERT INTO `pv` VALUES ('393', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:31');
INSERT INTO `pv` VALUES ('394', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:18:31');
INSERT INTO `pv` VALUES ('395', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:19:43');
INSERT INTO `pv` VALUES ('396', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:53');
INSERT INTO `pv` VALUES ('397', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:55');
INSERT INTO `pv` VALUES ('398', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:56');
INSERT INTO `pv` VALUES ('399', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:56');
INSERT INTO `pv` VALUES ('400', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:57');
INSERT INTO `pv` VALUES ('401', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:57');
INSERT INTO `pv` VALUES ('402', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:57');
INSERT INTO `pv` VALUES ('403', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:20:58');
INSERT INTO `pv` VALUES ('404', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:22:06');
INSERT INTO `pv` VALUES ('405', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:22:07');
INSERT INTO `pv` VALUES ('406', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:22:20');
INSERT INTO `pv` VALUES ('407', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:23:13');
INSERT INTO `pv` VALUES ('408', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:23:15');
INSERT INTO `pv` VALUES ('409', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:23:53');
INSERT INTO `pv` VALUES ('410', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:23:54');
INSERT INTO `pv` VALUES ('411', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:23:55');
INSERT INTO `pv` VALUES ('412', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:24:40');
INSERT INTO `pv` VALUES ('413', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:27:11');
INSERT INTO `pv` VALUES ('414', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:27:30');
INSERT INTO `pv` VALUES ('415', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:27:35');
INSERT INTO `pv` VALUES ('416', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:27:35');
INSERT INTO `pv` VALUES ('417', '127.0.0.1', '2', '/istrators/edit?id=8', '2018-10-17 11:27:49');
INSERT INTO `pv` VALUES ('418', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:30:11');
INSERT INTO `pv` VALUES ('419', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:30:11');
INSERT INTO `pv` VALUES ('420', '127.0.0.1', '2', '/istrators/edit?id=9', '2018-10-17 11:30:15');
INSERT INTO `pv` VALUES ('421', '127.0.0.1', '2', '/istrators/exit', '2018-10-17 11:31:08');
INSERT INTO `pv` VALUES ('422', '127.0.0.1', '2', '/istrators/edit?id=9', '2018-10-17 11:31:25');
INSERT INTO `pv` VALUES ('423', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:31:29');
INSERT INTO `pv` VALUES ('424', '127.0.0.1', '2', '/istrators/edit?id=9', '2018-10-17 11:32:17');
INSERT INTO `pv` VALUES ('425', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:32:18');
INSERT INTO `pv` VALUES ('426', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:32:20');
INSERT INTO `pv` VALUES ('427', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:32:27');
INSERT INTO `pv` VALUES ('428', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:32:38');
INSERT INTO `pv` VALUES ('429', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:32:38');
INSERT INTO `pv` VALUES ('430', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:33:44');
INSERT INTO `pv` VALUES ('431', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:33:52');
INSERT INTO `pv` VALUES ('432', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:33:52');
INSERT INTO `pv` VALUES ('433', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:34:25');
INSERT INTO `pv` VALUES ('434', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:34:28');
INSERT INTO `pv` VALUES ('435', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:34:34');
INSERT INTO `pv` VALUES ('436', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:36:05');
INSERT INTO `pv` VALUES ('437', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:36:06');
INSERT INTO `pv` VALUES ('438', '127.0.0.1', '2', '/istrators/insert', '2018-10-17 11:36:13');
INSERT INTO `pv` VALUES ('439', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:36:30');
INSERT INTO `pv` VALUES ('440', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:31');
INSERT INTO `pv` VALUES ('441', '127.0.0.1', '2', '/istrators/create', '2018-10-17 11:36:31');
INSERT INTO `pv` VALUES ('442', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:33');
INSERT INTO `pv` VALUES ('443', '127.0.0.1', '2', '/istrators/delete?id=14', '2018-10-17 11:36:37');
INSERT INTO `pv` VALUES ('444', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:38');
INSERT INTO `pv` VALUES ('445', '127.0.0.1', '2', '/istrators/delete?id=13', '2018-10-17 11:36:40');
INSERT INTO `pv` VALUES ('446', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:41');
INSERT INTO `pv` VALUES ('447', '127.0.0.1', '2', '/istrators/delete?id=8', '2018-10-17 11:36:44');
INSERT INTO `pv` VALUES ('448', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:45');
INSERT INTO `pv` VALUES ('449', '127.0.0.1', '2', '/istrators/delete?id=9', '2018-10-17 11:36:47');
INSERT INTO `pv` VALUES ('450', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:48');
INSERT INTO `pv` VALUES ('451', '127.0.0.1', '2', '/istrators/delete?id=11', '2018-10-17 11:36:49');
INSERT INTO `pv` VALUES ('452', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:50');
INSERT INTO `pv` VALUES ('453', '127.0.0.1', '2', '/istrators/delete?id=10', '2018-10-17 11:36:52');
INSERT INTO `pv` VALUES ('454', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:53');
INSERT INTO `pv` VALUES ('455', '127.0.0.1', '2', '/istrators/delete?id=12', '2018-10-17 11:36:55');
INSERT INTO `pv` VALUES ('456', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:36:57');
INSERT INTO `pv` VALUES ('457', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:37:01');
INSERT INTO `pv` VALUES ('458', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:44:04');
INSERT INTO `pv` VALUES ('459', '127.0.0.1', '2', '/istrators/update?id=2', '2018-10-17 11:44:13');
INSERT INTO `pv` VALUES ('460', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:44:14');
INSERT INTO `pv` VALUES ('461', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:45:48');
INSERT INTO `pv` VALUES ('462', '127.0.0.1', '2', '/istrators/update?id=2', '2018-10-17 11:46:07');
INSERT INTO `pv` VALUES ('463', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:46:28');
INSERT INTO `pv` VALUES ('464', '127.0.0.1', '2', '/istrators/update?id=2', '2018-10-17 11:46:31');
INSERT INTO `pv` VALUES ('465', '127.0.0.1', '2', '/istrators/update?id=2', '2018-10-17 11:46:48');
INSERT INTO `pv` VALUES ('466', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:46:48');
INSERT INTO `pv` VALUES ('467', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:47:02');
INSERT INTO `pv` VALUES ('468', '127.0.0.1', '2', '/istrators/update?id=2', '2018-10-17 11:47:08');
INSERT INTO `pv` VALUES ('469', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:47:08');
INSERT INTO `pv` VALUES ('470', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:47:24');
INSERT INTO `pv` VALUES ('471', '127.0.0.1', '2', '/istrators/edit?id=2', '2018-10-17 11:47:26');
INSERT INTO `pv` VALUES ('472', '127.0.0.1', '2', '/istrators/design', '2018-10-17 11:47:30');
INSERT INTO `pv` VALUES ('473', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:42:52');
INSERT INTO `pv` VALUES ('474', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:44:08');
INSERT INTO `pv` VALUES ('475', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:44:41');
INSERT INTO `pv` VALUES ('476', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:44:45');
INSERT INTO `pv` VALUES ('477', '127.0.0.1', '2', '/goods/create', '2018-10-17 14:44:48');
INSERT INTO `pv` VALUES ('478', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:44:49');
INSERT INTO `pv` VALUES ('479', '127.0.0.1', '2', '/goods/create', '2018-10-17 14:45:48');
INSERT INTO `pv` VALUES ('480', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:45:56');
INSERT INTO `pv` VALUES ('481', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:47:40');
INSERT INTO `pv` VALUES ('482', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:50:31');
INSERT INTO `pv` VALUES ('483', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:05');
INSERT INTO `pv` VALUES ('484', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 14:52:08');
INSERT INTO `pv` VALUES ('485', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 14:52:10');
INSERT INTO `pv` VALUES ('486', '127.0.0.1', '2', '/goods/create', '2018-10-17 14:52:14');
INSERT INTO `pv` VALUES ('487', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 14:52:16');
INSERT INTO `pv` VALUES ('488', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 14:52:16');
INSERT INTO `pv` VALUES ('489', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:20');
INSERT INTO `pv` VALUES ('490', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 14:52:20');
INSERT INTO `pv` VALUES ('491', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 14:52:25');
INSERT INTO `pv` VALUES ('492', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:31');
INSERT INTO `pv` VALUES ('493', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 14:52:32');
INSERT INTO `pv` VALUES ('494', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 14:52:32');
INSERT INTO `pv` VALUES ('495', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:46');
INSERT INTO `pv` VALUES ('496', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:49');
INSERT INTO `pv` VALUES ('497', '127.0.0.1', '2', '/goods/design', '2018-10-17 14:52:54');
INSERT INTO `pv` VALUES ('498', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:11:01');
INSERT INTO `pv` VALUES ('499', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:11:44');
INSERT INTO `pv` VALUES ('500', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:11:46');
INSERT INTO `pv` VALUES ('501', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 15:11:46');
INSERT INTO `pv` VALUES ('502', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:11:51');
INSERT INTO `pv` VALUES ('503', '127.0.0.1', '2', '/', '2018-10-17 15:17:31');
INSERT INTO `pv` VALUES ('504', '127.0.0.1', '2', '/', '2018-10-17 15:18:18');
INSERT INTO `pv` VALUES ('505', '127.0.0.1', '2', '/', '2018-10-17 15:18:36');
INSERT INTO `pv` VALUES ('506', '127.0.0.1', '2', '/', '2018-10-17 15:18:59');
INSERT INTO `pv` VALUES ('507', '127.0.0.1', '2', '/', '2018-10-17 15:30:09');
INSERT INTO `pv` VALUES ('508', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:30:12');
INSERT INTO `pv` VALUES ('509', '127.0.0.1', '2', '/goods/edit?id=22', '2018-10-17 15:45:48');
INSERT INTO `pv` VALUES ('510', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 15:45:49');
INSERT INTO `pv` VALUES ('511', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 15:45:50');
INSERT INTO `pv` VALUES ('512', '127.0.0.1', '2', '/goods/ajax_get_cat?id=1', '2018-10-17 15:45:52');
INSERT INTO `pv` VALUES ('513', '127.0.0.1', '2', '/goods/ajax_get_cat?id=4', '2018-10-17 15:45:53');
INSERT INTO `pv` VALUES ('514', '127.0.0.1', '2', '/goods/ajax_get_cat?id=3', '2018-10-17 15:45:54');
INSERT INTO `pv` VALUES ('515', '127.0.0.1', '2', '/goods/edit?id=22', '2018-10-17 15:45:59');
INSERT INTO `pv` VALUES ('516', '127.0.0.1', '2', '/goods/ajax_get_cat?id=2', '2018-10-17 15:45:59');
INSERT INTO `pv` VALUES ('517', '127.0.0.1', '2', '/goods/ajax_get_cat?id=6', '2018-10-17 15:45:59');
INSERT INTO `pv` VALUES ('518', '127.0.0.1', '2', '/goods/design', '2018-10-17 15:58:33');
INSERT INTO `pv` VALUES ('519', '127.0.0.1', '2', '/', '2018-10-18 08:27:42');
INSERT INTO `pv` VALUES ('520', '127.0.0.1', '2', '/', '2018-10-18 11:36:51');
INSERT INTO `pv` VALUES ('521', '127.0.0.1', '2', '/', '2018-10-18 11:37:37');
INSERT INTO `pv` VALUES ('522', '127.0.0.1', '2', '/', '2018-10-18 11:38:04');
INSERT INTO `pv` VALUES ('523', '127.0.0.1', '2', '/', '2018-10-18 11:41:13');
INSERT INTO `pv` VALUES ('524', '127.0.0.1', '2', '/', '2018-10-18 11:42:40');
INSERT INTO `pv` VALUES ('525', '127.0.0.1', '2', '/', '2018-10-18 11:43:08');
INSERT INTO `pv` VALUES ('526', '127.0.0.1', '2', '/', '2018-10-18 11:43:32');
INSERT INTO `pv` VALUES ('527', '127.0.0.1', '2', '/istrators/design', '2018-10-18 11:43:44');
INSERT INTO `pv` VALUES ('528', '127.0.0.1', '2', '/istrators/design', '2018-10-18 11:45:42');
INSERT INTO `pv` VALUES ('529', '127.0.0.1', '2', '/istrators/design', '2018-10-18 11:45:54');
INSERT INTO `pv` VALUES ('530', '127.0.0.1', '2', '/', '2018-10-18 11:45:55');
INSERT INTO `pv` VALUES ('531', '127.0.0.1', '2', '/', '2018-10-18 11:46:17');
INSERT INTO `pv` VALUES ('532', '127.0.0.1', '2', '/privilege/design', '2018-10-18 11:46:20');
INSERT INTO `pv` VALUES ('533', '127.0.0.1', '2', '/role/design', '2018-10-18 11:46:22');
INSERT INTO `pv` VALUES ('534', '127.0.0.1', '2', '/role/design', '2018-10-18 11:47:10');
INSERT INTO `pv` VALUES ('535', '127.0.0.1', '2', '/privilege/design', '2018-10-18 11:47:12');
INSERT INTO `pv` VALUES ('536', '127.0.0.1', '2', '/role/design', '2018-10-18 11:47:13');
INSERT INTO `pv` VALUES ('537', '127.0.0.1', '2', '/istrators/design', '2018-10-18 11:47:15');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('2', '商品总监');
INSERT INTO `role` VALUES ('9', '人事经理');

-- ----------------------------
-- Table structure for role_privlege
-- ----------------------------
DROP TABLE IF EXISTS `role_privlege`;
CREATE TABLE `role_privlege` (
  `pri_id` int(10) unsigned NOT NULL COMMENT '权限ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  KEY `pri_id` (`pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of role_privlege
-- ----------------------------
INSERT INTO `role_privlege` VALUES ('1', '2');
INSERT INTO `role_privlege` VALUES ('2', '2');
INSERT INTO `role_privlege` VALUES ('3', '2');
INSERT INTO `role_privlege` VALUES ('4', '2');
INSERT INTO `role_privlege` VALUES ('5', '2');
INSERT INTO `role_privlege` VALUES ('6', '9');
INSERT INTO `role_privlege` VALUES ('35', '9');
INSERT INTO `role_privlege` VALUES ('38', '9');
INSERT INTO `role_privlege` VALUES ('37', '9');
INSERT INTO `role_privlege` VALUES ('36', '9');
INSERT INTO `role_privlege` VALUES ('26', '9');
INSERT INTO `role_privlege` VALUES ('29', '9');
INSERT INTO `role_privlege` VALUES ('28', '9');
INSERT INTO `role_privlege` VALUES ('27', '9');
INSERT INTO `role_privlege` VALUES ('7', '9');
INSERT INTO `role_privlege` VALUES ('10', '9');
INSERT INTO `role_privlege` VALUES ('9', '9');
INSERT INTO `role_privlege` VALUES ('8', '9');
