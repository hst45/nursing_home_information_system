/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : dbdb

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 15/04/2021 20:52:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` int(0) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `day` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '划龙舟', '体育', '会有小礼品', 100, '庆祝端午，划龙舟比赛', NULL);
INSERT INTO `activity` VALUES ('10', '国画', '艺术', '需要自带画材', 50, '学习画画', NULL);
INSERT INTO `activity` VALUES ('100001', '弦乐排练', NULL, '带乐器', NULL, '练习比赛曲目', 1);
INSERT INTO `activity` VALUES ('11', '广场舞教学', '文娱', '穿便于运动的衣服', 50, '联系广场舞', NULL);
INSERT INTO `activity` VALUES ('2', '包饺子', '家政', '包完一起吃', 50, '一起包饺子', NULL);
INSERT INTO `activity` VALUES ('3', '张老师生日会', '休闲', '记得带礼物', 50, '参加张老师60大寿宴席', 1);
INSERT INTO `activity` VALUES ('4', '讲座', '文化', '会有小奖品', 200, '大学生志愿者举办的科普讲座', 1);
INSERT INTO `activity` VALUES ('5', '排球比赛', '体育', '友谊第一', 20, '老人院第5届排球友好比赛', 2);
INSERT INTO `activity` VALUES ('56', '健美操', '体育', '自带舞鞋', 100, '学习健美舞蹈', 10);
INSERT INTO `activity` VALUES ('6', '植物园散步', '体育', '花粉过敏的老人不宜参加', 50, '老人组团在植物园赏花散步', 1);
INSERT INTO `activity` VALUES ('7', '山上竞走', '体育', '需要有一定锻炼基础', 50, '花果山人行道竞走', 1);
INSERT INTO `activity` VALUES ('8', '读书会', '文化', '自带报纸', 30, '和小学生一起读报纸', 2);
INSERT INTO `activity` VALUES ('9', '合唱', '文娱', '可能需要长时间站立', 50, '练习合唱歌曲', NULL);

-- ----------------------------
-- Table structure for activitynum
-- ----------------------------
DROP TABLE IF EXISTS `activitynum`;
CREATE TABLE `activitynum`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `aid` int(0) NOT NULL,
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activitynum_ibfk_1`(`aid`) USING BTREE,
  INDEX `activitynum_ibfk_2`(`cid`) USING BTREE,
  CONSTRAINT `activitynum_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `arrangeact` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `activitynum_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `carer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activitynum
-- ----------------------------
INSERT INTO `activitynum` VALUES (18, 29, '100002', NULL);
INSERT INTO `activitynum` VALUES (19, 30, '100001', '后勤组长');
INSERT INTO `activitynum` VALUES (20, 30, '100003', NULL);
INSERT INTO `activitynum` VALUES (21, 31, '100001', '现场组长');
INSERT INTO `activitynum` VALUES (22, 31, '100005', NULL);
INSERT INTO `activitynum` VALUES (23, 32, '100001', '主持人');
INSERT INTO `activitynum` VALUES (24, 32, '100007', NULL);
INSERT INTO `activitynum` VALUES (25, 33, '100002', NULL);
INSERT INTO `activitynum` VALUES (26, 33, '100004', NULL);
INSERT INTO `activitynum` VALUES (27, 36, '100001', '策划组长');
INSERT INTO `activitynum` VALUES (30, 39, '100003', NULL);
INSERT INTO `activitynum` VALUES (38, 48, '100001', '策划组长');
INSERT INTO `activitynum` VALUES (47, 58, '100003', NULL);
INSERT INTO `activitynum` VALUES (48, 58, '100006', NULL);
INSERT INTO `activitynum` VALUES (49, 61, '100010', NULL);
INSERT INTO `activitynum` VALUES (50, 62, '100007', NULL);
INSERT INTO `activitynum` VALUES (51, 62, '100009', NULL);
INSERT INTO `activitynum` VALUES (52, 62, '100010', NULL);

-- ----------------------------
-- Table structure for arrangeact
-- ----------------------------
DROP TABLE IF EXISTS `arrangeact`;
CREATE TABLE `arrangeact`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `number` int(0) NULL DEFAULT NULL,
  `time1` time(0) NULL DEFAULT NULL,
  `time2` time(6) NULL DEFAULT NULL,
  `day` date NULL DEFAULT NULL,
  `site` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `participants` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `arrangeact_ibfk_1`(`activity`) USING BTREE,
  INDEX `arrangeact_ibfk_2`(`site`) USING BTREE,
  CONSTRAINT `arrangeact_ibfk_1` FOREIGN KEY (`activity`) REFERENCES `activity` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `arrangeact_ibfk_2` FOREIGN KEY (`site`) REFERENCES `place` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arrangeact
-- ----------------------------
INSERT INTO `arrangeact` VALUES (29, 50, '10:00:00', '11:30:00.000000', '2021-04-09', '6', '1', 2);
INSERT INTO `arrangeact` VALUES (30, 20, '10:00:00', '11:30:00.000000', '2021-04-03', '7', '11', 0);
INSERT INTO `arrangeact` VALUES (31, 50, '10:00:00', '11:30:00.000000', '2021-04-24', '8', '2', 1);
INSERT INTO `arrangeact` VALUES (32, 25, '18:00:00', '20:30:00.000000', '2021-04-14', '2', '3', 1);
INSERT INTO `arrangeact` VALUES (33, 24, '22:00:00', '22:30:00.000000', '2021-04-14', '3', '11', 1);
INSERT INTO `arrangeact` VALUES (36, 24, '22:00:00', '22:30:00.000000', '2021-04-27', '1', '1', 1);
INSERT INTO `arrangeact` VALUES (39, 250, '10:00:00', '18:00:00.000000', '2021-04-10', '5', '6', 0);
INSERT INTO `arrangeact` VALUES (48, 24, '10:00:00', '11:30:00.000000', '2021-04-27', '1', '10', 1);
INSERT INTO `arrangeact` VALUES (58, 24, '10:00:00', '11:30:00.000000', '2021-04-30', '4', '100001', 1);
INSERT INTO `arrangeact` VALUES (61, 100, '10:00:00', '18:00:00.000000', '2021-04-11', '6', '6', 0);
INSERT INTO `arrangeact` VALUES (62, 100, '10:00:00', '18:00:00.000000', '2021-04-12', '6', '6', 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add test', 7, 'add_test');
INSERT INTO `auth_permission` VALUES (26, 'Can change test', 7, 'change_test');
INSERT INTO `auth_permission` VALUES (27, 'Can delete test', 7, 'delete_test');
INSERT INTO `auth_permission` VALUES (28, 'Can view test', 7, 'view_test');
INSERT INTO `auth_permission` VALUES (29, 'Can add activity', 8, 'add_activity');
INSERT INTO `auth_permission` VALUES (30, 'Can change activity', 8, 'change_activity');
INSERT INTO `auth_permission` VALUES (31, 'Can delete activity', 8, 'delete_activity');
INSERT INTO `auth_permission` VALUES (32, 'Can view activity', 8, 'view_activity');
INSERT INTO `auth_permission` VALUES (33, 'Can add auth group', 9, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (34, 'Can change auth group', 9, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (35, 'Can delete auth group', 9, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (36, 'Can view auth group', 9, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (37, 'Can add auth group permissions', 10, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (38, 'Can change auth group permissions', 10, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (39, 'Can delete auth group permissions', 10, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (40, 'Can view auth group permissions', 10, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (41, 'Can add auth permission', 11, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (42, 'Can change auth permission', 11, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (43, 'Can delete auth permission', 11, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (44, 'Can view auth permission', 11, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (45, 'Can add auth user', 12, 'add_authuser');
INSERT INTO `auth_permission` VALUES (46, 'Can change auth user', 12, 'change_authuser');
INSERT INTO `auth_permission` VALUES (47, 'Can delete auth user', 12, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (48, 'Can view auth user', 12, 'view_authuser');
INSERT INTO `auth_permission` VALUES (49, 'Can add auth user groups', 13, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (50, 'Can change auth user groups', 13, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (51, 'Can delete auth user groups', 13, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (52, 'Can view auth user groups', 13, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (53, 'Can add auth user user permissions', 14, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (54, 'Can change auth user user permissions', 14, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (55, 'Can delete auth user user permissions', 14, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (56, 'Can view auth user user permissions', 14, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (57, 'Can add carer', 15, 'add_carer');
INSERT INTO `auth_permission` VALUES (58, 'Can change carer', 15, 'change_carer');
INSERT INTO `auth_permission` VALUES (59, 'Can delete carer', 15, 'delete_carer');
INSERT INTO `auth_permission` VALUES (60, 'Can view carer', 15, 'view_carer');
INSERT INTO `auth_permission` VALUES (61, 'Can add diagnoses', 16, 'add_diagnoses');
INSERT INTO `auth_permission` VALUES (62, 'Can change diagnoses', 16, 'change_diagnoses');
INSERT INTO `auth_permission` VALUES (63, 'Can delete diagnoses', 16, 'delete_diagnoses');
INSERT INTO `auth_permission` VALUES (64, 'Can view diagnoses', 16, 'view_diagnoses');
INSERT INTO `auth_permission` VALUES (65, 'Can add django admin log', 17, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (66, 'Can change django admin log', 17, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (67, 'Can delete django admin log', 17, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (68, 'Can view django admin log', 17, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (69, 'Can add django content type', 18, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (70, 'Can change django content type', 18, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (71, 'Can delete django content type', 18, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (72, 'Can view django content type', 18, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (73, 'Can add django migrations', 19, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (74, 'Can change django migrations', 19, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (75, 'Can delete django migrations', 19, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (76, 'Can view django migrations', 19, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (77, 'Can add django session', 20, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (78, 'Can change django session', 20, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (79, 'Can delete django session', 20, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (80, 'Can view django session', 20, 'view_djangosession');
INSERT INTO `auth_permission` VALUES (81, 'Can add goods', 21, 'add_goods');
INSERT INTO `auth_permission` VALUES (82, 'Can change goods', 21, 'change_goods');
INSERT INTO `auth_permission` VALUES (83, 'Can delete goods', 21, 'delete_goods');
INSERT INTO `auth_permission` VALUES (84, 'Can view goods', 21, 'view_goods');
INSERT INTO `auth_permission` VALUES (85, 'Can add go sd', 22, 'add_gosd');
INSERT INTO `auth_permission` VALUES (86, 'Can change go sd', 22, 'change_gosd');
INSERT INTO `auth_permission` VALUES (87, 'Can delete go sd', 22, 'delete_gosd');
INSERT INTO `auth_permission` VALUES (88, 'Can view go sd', 22, 'view_gosd');
INSERT INTO `auth_permission` VALUES (89, 'Can add guardian', 23, 'add_guardian');
INSERT INTO `auth_permission` VALUES (90, 'Can change guardian', 23, 'change_guardian');
INSERT INTO `auth_permission` VALUES (91, 'Can delete guardian', 23, 'delete_guardian');
INSERT INTO `auth_permission` VALUES (92, 'Can view guardian', 23, 'view_guardian');
INSERT INTO `auth_permission` VALUES (93, 'Can add old', 24, 'add_old');
INSERT INTO `auth_permission` VALUES (94, 'Can change old', 24, 'change_old');
INSERT INTO `auth_permission` VALUES (95, 'Can delete old', 24, 'delete_old');
INSERT INTO `auth_permission` VALUES (96, 'Can view old', 24, 'view_old');
INSERT INTO `auth_permission` VALUES (97, 'Can add order', 25, 'add_order');
INSERT INTO `auth_permission` VALUES (98, 'Can change order', 25, 'change_order');
INSERT INTO `auth_permission` VALUES (99, 'Can delete order', 25, 'delete_order');
INSERT INTO `auth_permission` VALUES (100, 'Can view order', 25, 'view_order');
INSERT INTO `auth_permission` VALUES (101, 'Can add testmodel test', 26, 'add_testmodeltest');
INSERT INTO `auth_permission` VALUES (102, 'Can change testmodel test', 26, 'change_testmodeltest');
INSERT INTO `auth_permission` VALUES (103, 'Can delete testmodel test', 26, 'delete_testmodeltest');
INSERT INTO `auth_permission` VALUES (104, 'Can view testmodel test', 26, 'view_testmodeltest');
INSERT INTO `auth_permission` VALUES (105, 'Can add to do', 27, 'add_todo');
INSERT INTO `auth_permission` VALUES (106, 'Can change to do', 27, 'change_todo');
INSERT INTO `auth_permission` VALUES (107, 'Can delete to do', 27, 'delete_todo');
INSERT INTO `auth_permission` VALUES (108, 'Can view to do', 27, 'view_todo');
INSERT INTO `auth_permission` VALUES (109, 'Can add arrangeact', 28, 'add_arrangeact');
INSERT INTO `auth_permission` VALUES (110, 'Can change arrangeact', 28, 'change_arrangeact');
INSERT INTO `auth_permission` VALUES (111, 'Can delete arrangeact', 28, 'delete_arrangeact');
INSERT INTO `auth_permission` VALUES (112, 'Can view arrangeact', 28, 'view_arrangeact');
INSERT INTO `auth_permission` VALUES (113, 'Can add dailycheck', 29, 'add_dailycheck');
INSERT INTO `auth_permission` VALUES (114, 'Can change dailycheck', 29, 'change_dailycheck');
INSERT INTO `auth_permission` VALUES (115, 'Can delete dailycheck', 29, 'delete_dailycheck');
INSERT INTO `auth_permission` VALUES (116, 'Can view dailycheck', 29, 'view_dailycheck');
INSERT INTO `auth_permission` VALUES (117, 'Can add oc', 30, 'add_oc');
INSERT INTO `auth_permission` VALUES (118, 'Can change oc', 30, 'change_oc');
INSERT INTO `auth_permission` VALUES (119, 'Can delete oc', 30, 'delete_oc');
INSERT INTO `auth_permission` VALUES (120, 'Can view oc', 30, 'view_oc');
INSERT INTO `auth_permission` VALUES (121, 'Can add orderdetails', 31, 'add_orderdetails');
INSERT INTO `auth_permission` VALUES (122, 'Can change orderdetails', 31, 'change_orderdetails');
INSERT INTO `auth_permission` VALUES (123, 'Can delete orderdetails', 31, 'delete_orderdetails');
INSERT INTO `auth_permission` VALUES (124, 'Can view orderdetails', 31, 'view_orderdetails');
INSERT INTO `auth_permission` VALUES (125, 'Can add cart', 32, 'add_cart');
INSERT INTO `auth_permission` VALUES (126, 'Can change cart', 32, 'change_cart');
INSERT INTO `auth_permission` VALUES (127, 'Can delete cart', 32, 'delete_cart');
INSERT INTO `auth_permission` VALUES (128, 'Can view cart', 32, 'view_cart');
INSERT INTO `auth_permission` VALUES (129, 'Can add call', 33, 'add_call');
INSERT INTO `auth_permission` VALUES (130, 'Can change call', 33, 'change_call');
INSERT INTO `auth_permission` VALUES (131, 'Can delete call', 33, 'delete_call');
INSERT INTO `auth_permission` VALUES (132, 'Can view call', 33, 'view_call');
INSERT INTO `auth_permission` VALUES (133, 'Can add schedule', 34, 'add_schedule');
INSERT INTO `auth_permission` VALUES (134, 'Can change schedule', 34, 'change_schedule');
INSERT INTO `auth_permission` VALUES (135, 'Can delete schedule', 34, 'delete_schedule');
INSERT INTO `auth_permission` VALUES (136, 'Can view schedule', 34, 'view_schedule');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$216000$Sv4ctnFQxgCi$j/cUwMnIgO8imonA8YfKvi8lLzUYhF/mhzj7v1sru+A=', NULL, 1, 'fxy', '', '', '', 1, 1, '2021-03-26 01:01:13.496638');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for call
-- ----------------------------
DROP TABLE IF EXISTS `call`;
CREATE TABLE `call`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `old` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `carer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `note` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `1111`(`old`) USING BTREE,
  CONSTRAINT `1111` FOREIGN KEY (`old`) REFERENCES `old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of call
-- ----------------------------
INSERT INTO `call` VALUES (5, '100801', '100001', '2021-03-11 11:25:16.000000', '202', '胰岛素', 1);
INSERT INTO `call` VALUES (6, '100801', '100001', '2021-03-11 11:25:00.000000', '202', '热水', 1);
INSERT INTO `call` VALUES (11, '100801', NULL, '2021-03-26 02:03:52.000000', '301', '喘不上气', 1);
INSERT INTO `call` VALUES (14, '100802', NULL, '2021-03-26 02:11:07.000000', '301', '输液结束，我要喝水', 1);
INSERT INTO `call` VALUES (15, '100801', NULL, '2021-03-26 03:50:09.000000', '202', '', 1);
INSERT INTO `call` VALUES (16, '100803', NULL, '2021-04-11 11:49:30.000000', '120', NULL, 1);
INSERT INTO `call` VALUES (17, '100801', NULL, '2021-04-11 13:50:22.000000', '202', '输液结束', 0);
INSERT INTO `call` VALUES (18, '100802', NULL, '2021-04-11 15:50:46.000000', '320', NULL, 1);
INSERT INTO `call` VALUES (20, '100801', NULL, '2021-04-11 08:13:20.000000', '202', '注射胰岛素', 0);

-- ----------------------------
-- Table structure for carer
-- ----------------------------
DROP TABLE IF EXISTS `carer`;
CREATE TABLE `carer`  (
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tele` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carer
-- ----------------------------
INSERT INTO `carer` VALUES ('100001', '123123123123', '刘源', '男', '1997-10-10', '饭都花园12-203', '13145632145', '000000');
INSERT INTO `carer` VALUES ('100002', '123', '贝吉塔', '男', '1997-11-04', '翻斗大街1003号', '15016545236', '000000');
INSERT INTO `carer` VALUES ('100003', '11111', '刘小柴', '女', '1997-10-10', '翻斗花园1001', '12155632145', '000000');
INSERT INTO `carer` VALUES ('100004', '11111111', '王秀元', '女', '1980-03-21', '北大街1221', '12522526321', '000000');
INSERT INTO `carer` VALUES ('100005', '33632145632145889', '张国辉', '男', '1989-03-22', '刘家桥', '12345678965', '000000');
INSERT INTO `carer` VALUES ('100006', '223654112563256666', '姚娟', '女', '1988-10-27', '小石桥', '19114523654', '000000');
INSERT INTO `carer` VALUES ('100007', '22563214563211456332', '陈思玖', '女', '1991-03-22', '查桥', '19012365412', '000000');
INSERT INTO `carer` VALUES ('100008', '326632145632145222', '宋耀文', '女', '1989-11-10', '东亭', '15478965412', '000000');
INSERT INTO `carer` VALUES ('100009', '332336198563214563', '丁琦', '女', '1994-06-22', '九石湾', '13654123654', '000000');
INSERT INTO `carer` VALUES ('100010', '256321123654123666', '张全泉', '男', '1984-07-12', '胜利门', '13745963214', '000000');

-- ----------------------------
-- Table structure for dailycheck
-- ----------------------------
DROP TABLE IF EXISTS `dailycheck`;
CREATE TABLE `dailycheck`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `temperature` decimal(5, 0) NULL DEFAULT NULL,
  `pulse` decimal(5, 0) NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `highbp` decimal(5, 0) NULL DEFAULT NULL,
  `lowbp` decimal(5, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  CONSTRAINT `dailycheck_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dailycheck
-- ----------------------------
INSERT INTO `dailycheck` VALUES (35, '100801', '2021-03-24', 37, 60, 114, 100, 90);
INSERT INTO `dailycheck` VALUES (36, '100802', '2021-03-25', 37, 60, 112, 100, 90);
INSERT INTO `dailycheck` VALUES (37, '100802', '2021-03-20', 38, 63, 114, 101, 91);
INSERT INTO `dailycheck` VALUES (38, '100802', '2021-03-22', 36, 70, 119, 120, 89);
INSERT INTO `dailycheck` VALUES (41, '100802', '2021-03-19', 38, 60, 114, 101, 91);
INSERT INTO `dailycheck` VALUES (43, '100801', '2021-03-20', 36, 54, 125, 121, 93);
INSERT INTO `dailycheck` VALUES (44, '100801', '2021-03-21', 36, 63, 120, 120, 96);
INSERT INTO `dailycheck` VALUES (45, '100801', '2021-03-25', 36, 63, 118, 115, 85);
INSERT INTO `dailycheck` VALUES (46, '100801', '2021-03-22', 36, 54, 118, 121, 91);
INSERT INTO `dailycheck` VALUES (47, '100801', '2021-03-23', 36, 58, 117, 116, 83);
INSERT INTO `dailycheck` VALUES (48, '100801', '2021-03-25', 37, 70, 114, 101, 91);
INSERT INTO `dailycheck` VALUES (49, '100801', '2021-03-19', 37, 58, 118, 120, 89);
INSERT INTO `dailycheck` VALUES (50, '100801', '2021-03-26', 37, 60, 114, 100, 90);
INSERT INTO `dailycheck` VALUES (51, '100801', '2021-03-27', 38, 58, 125, 100, 90);
INSERT INTO `dailycheck` VALUES (52, '100801', '2021-04-11', 37, 60, 112, 115, 91);
INSERT INTO `dailycheck` VALUES (53, '100801', '2021-04-14', 37, 58, 118, 101, 92);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'TestModel', 'activity');
INSERT INTO `django_content_type` VALUES (28, 'TestModel', 'arrangeact');
INSERT INTO `django_content_type` VALUES (9, 'TestModel', 'authgroup');
INSERT INTO `django_content_type` VALUES (10, 'TestModel', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (11, 'TestModel', 'authpermission');
INSERT INTO `django_content_type` VALUES (12, 'TestModel', 'authuser');
INSERT INTO `django_content_type` VALUES (13, 'TestModel', 'authusergroups');
INSERT INTO `django_content_type` VALUES (14, 'TestModel', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (33, 'TestModel', 'call');
INSERT INTO `django_content_type` VALUES (15, 'TestModel', 'carer');
INSERT INTO `django_content_type` VALUES (32, 'TestModel', 'cart');
INSERT INTO `django_content_type` VALUES (29, 'TestModel', 'dailycheck');
INSERT INTO `django_content_type` VALUES (16, 'TestModel', 'diagnoses');
INSERT INTO `django_content_type` VALUES (17, 'TestModel', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (18, 'TestModel', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (19, 'TestModel', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (20, 'TestModel', 'djangosession');
INSERT INTO `django_content_type` VALUES (21, 'TestModel', 'goods');
INSERT INTO `django_content_type` VALUES (22, 'TestModel', 'gosd');
INSERT INTO `django_content_type` VALUES (23, 'TestModel', 'guardian');
INSERT INTO `django_content_type` VALUES (30, 'TestModel', 'oc');
INSERT INTO `django_content_type` VALUES (24, 'TestModel', 'old');
INSERT INTO `django_content_type` VALUES (25, 'TestModel', 'order');
INSERT INTO `django_content_type` VALUES (31, 'TestModel', 'orderdetails');
INSERT INTO `django_content_type` VALUES (34, 'TestModel', 'schedule');
INSERT INTO `django_content_type` VALUES (7, 'TestModel', 'test');
INSERT INTO `django_content_type` VALUES (26, 'TestModel', 'testmodeltest');
INSERT INTO `django_content_type` VALUES (27, 'TestModel', 'todo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'TestModel', '0001_initial', '2021-02-03 09:01:03.998592');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2021-02-03 09:01:04.117347');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-02-03 09:01:04.410700');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0001_initial', '2021-02-03 09:01:05.129167');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2021-02-03 09:01:05.280010');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-03 09:01:05.295048');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2021-02-03 09:01:05.428664');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2021-02-03 09:01:05.517405');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2021-02-03 09:01:05.599089');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2021-02-03 09:01:05.616860');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2021-02-03 09:01:05.683889');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2021-02-03 09:01:05.693915');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2021-02-03 09:01:05.725848');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2021-02-03 09:01:05.828425');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2021-02-03 09:01:05.918140');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2021-02-03 09:01:06.017411');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2021-02-03 09:01:06.037972');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2021-02-03 09:01:06.132022');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2021-02-03 09:01:06.173130');
INSERT INTO `django_migrations` VALUES (20, 'TestModel', '0002_auto_20210204_0208', '2021-02-03 18:24:08.064476');
INSERT INTO `django_migrations` VALUES (21, 'TestModel', '0003_auto_20210204_0216', '2021-02-03 18:24:08.075402');
INSERT INTO `django_migrations` VALUES (22, 'TestModel', '0004_auto_20210204_0224', '2021-02-03 18:24:08.087413');
INSERT INTO `django_migrations` VALUES (23, 'TestModel', '0002_call', '2021-03-09 12:17:12.787004');
INSERT INTO `django_migrations` VALUES (24, 'TestModel', '0003_auto_20210309_2043', '2021-03-09 12:43:53.444840');
INSERT INTO `django_migrations` VALUES (25, 'TestModel', '0004_delete_call', '2021-03-09 12:52:05.965962');
INSERT INTO `django_migrations` VALUES (26, 'TestModel', '0005_call', '2021-03-09 12:56:26.869641');
INSERT INTO `django_migrations` VALUES (27, 'TestModel', '0006_auto_20210309_2057', '2021-03-09 12:57:36.643603');
INSERT INTO `django_migrations` VALUES (28, 'TestModel', '0002_call_schedule', '2021-03-10 10:49:47.867421');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bff8z5omr3976315a3n6bw08o3swsimt', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcjEiOiIxMDA4MDEifQ:1lVvOn:caYZ4uV12CPJMibrFh893NsNaq2szuFmbkO0pZbFwa0', '2021-04-26 12:10:37.444904');
INSERT INTO `django_session` VALUES ('q7h4thwmvz8vc1kilars5iej5c8ldw3r', 'eyJpc19sb2dpbiI6dHJ1ZSwidXNlcjEiOiIxMDAwMDEifQ:1lVTtj:d0ddwI9qe2XV_taZIPrhc8zfXxiuLVa0XFCcxWNB3Ns', '2021-04-25 06:48:43.819778');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `price`(`price`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '苹果', 5, '水果', '山东烟台大苹果，又香又甜');
INSERT INTO `goods` VALUES ('10', '吮指原味鸡', 10, '荤菜', '炸鸡，鲜嫩多汁');
INSERT INTO `goods` VALUES ('11', '羽毛球拍', 30, '文体', '一支');
INSERT INTO `goods` VALUES ('12', '羽毛球', 10, '文体', '5个');
INSERT INTO `goods` VALUES ('13', '老北京涮羊肉', 60, '荤菜', '羊肉一斤，送蔬菜、豆腐乳、韭菜花');
INSERT INTO `goods` VALUES ('14', '高级羊绒线', 60, '日常', '一卷500克，黑红蓝燕麦色');
INSERT INTO `goods` VALUES ('15', 'CD', 20, '娱乐', '林俊杰、蔡国庆、黎明、邓丽君等');
INSERT INTO `goods` VALUES ('16', '袜子', 10, '日常', '三双');
INSERT INTO `goods` VALUES ('17', '凤梨', 10, '水果', '果肉，包甜');
INSERT INTO `goods` VALUES ('2', '香蕉', 5, '水果', '海南特产，包甜');
INSERT INTO `goods` VALUES ('3', '橘子', 7, '水果', '砂糖桔，糖尿病人少吃');
INSERT INTO `goods` VALUES ('4', '红汤面', 10, '主食', '酱油红汤，不辣');
INSERT INTO `goods` VALUES ('5', '荠菜馄饨', 15, '主食', '一份十只');
INSERT INTO `goods` VALUES ('6', '红烧狮子头', 5, '荤菜', '一份两只');
INSERT INTO `goods` VALUES ('7', '清炒西兰花', 2, '蔬菜', '健康抗癌');
INSERT INTO `goods` VALUES ('8', '太湖白茶', 10, '饮品', '明前当季新茶');
INSERT INTO `goods` VALUES ('9', '红烧肉', 5, '荤菜', '精品五花肉');

-- ----------------------------
-- Table structure for guardian
-- ----------------------------
DROP TABLE IF EXISTS `guardian`;
CREATE TABLE `guardian`  (
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tele` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idcard`) USING BTREE,
  INDEX `1`(`oid`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`oid`) REFERENCES `old` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guardian
-- ----------------------------
INSERT INTO `guardian` VALUES ('111452532114566', '刘燕闻', '男', '1975-11-26', '九园里外30米', '15236541236', '100801');
INSERT INTO `guardian` VALUES ('112556322563', '唐诺新', '男', '1977-06-12', '上马墩', '13654123654', '100801');
INSERT INTO `guardian` VALUES ('225252225555', '丁晨星', '男', '1987-03-02', '五爱北路', '131442342123', '100803');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note`  (
  `me` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `other` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `256`(`other`) USING BTREE,
  INDEX `257`(`me`) USING BTREE,
  CONSTRAINT `256` FOREIGN KEY (`other`) REFERENCES `old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `257` FOREIGN KEY (`me`) REFERENCES `old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('100801', '100802', 1, '明天下午一食堂见！', '2021-03-25 14:39:31');
INSERT INTO `note` VALUES ('100801', '100802', 2, '明天要不要取下棋', '2021-03-25 13:39:34');
INSERT INTO `note` VALUES ('100801', '100804', 3, '后天我要爽约了，临时需要回家一趟', '2021-03-25 12:39:41');
INSERT INTO `note` VALUES ('100802', '100801', 4, '想给你唱首歌', '2021-03-25 14:43:59');
INSERT INTO `note` VALUES ('100803', '100801', 10, 'hihihi', '2021-03-25 07:12:32');
INSERT INTO `note` VALUES ('100805', '100801', 11, '在哪', '2021-03-26 02:07:06');
INSERT INTO `note` VALUES ('100801', '100802', 12, '我想听甜蜜蜜', '2021-03-26 02:11:27');
INSERT INTO `note` VALUES ('100805', '100801', 13, '你去不去明天的爬山', '2021-04-11 08:18:08');

-- ----------------------------
-- Table structure for old
-- ----------------------------
DROP TABLE IF EXISTS `old`;
CREATE TABLE `old`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `bankcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dorm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carer`(`carer`) USING BTREE,
  CONSTRAINT `old_ibfk_1` FOREIGN KEY (`carer`) REFERENCES `carer` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of old
-- ----------------------------
INSERT INTO `old` VALUES ('100801', '000000', '620104222222222222', '张三', 'M', '1967-01-31', '8833344321340', '100001', 'img/head/1.jpg', '210');
INSERT INTO `old` VALUES ('100802', '000000', '21298111121', '李显梅', 'F', '1976-03-02', '23268742374', '100001', 'img/head/2.jpg', '102');
INSERT INTO `old` VALUES ('100803', '000000', '620263196503021111', '王来福', 'F', '1965-03-19', '21225262365452', '100004', 'img/head/3.jpg', '103');
INSERT INTO `old` VALUES ('100804', '000000', '220212195602032222', '李飞', 'M', '1956-02-03', '22336547896545', '100001', 'img/head/13.jpg', '104');
INSERT INTO `old` VALUES ('100805', '000000', '115263254666951236', '丁卫国', 'M', '1966-05-21', '2323232323232323', '100007', 'img/head/14.jpg', '105');
INSERT INTO `old` VALUES ('100806', '000000', '31520319660214', '徐玲玲', 'F', '1966-02-14', '25252552555555', '100005', 'img/head/15.jpg', '201');
INSERT INTO `old` VALUES ('100807', '000000', '2323232355666321', '周怡', 'F', '1967-03-25', '222222222222222', '100006', 'img/head/16.jpg', '202');
INSERT INTO `old` VALUES ('100808', '000000', '020556321456321456', '唐诺新', 'F', '1954-10-01', '2256321456321466', '100004', 'img/head/17.jpg', '203');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `totalprice` decimal(20, 0) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `5`(`oid`) USING BTREE,
  CONSTRAINT `5` FOREIGN KEY (`oid`) REFERENCES `old` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('20210317211941', '100802', '2021-03-17 13:19:41.000000', 12, '223', '1');
INSERT INTO `order` VALUES ('20210324151353', '100801', '2021-03-24 07:13:53.000000', 30, '101', '1');
INSERT INTO `order` VALUES ('20210324230259', '100801', '2021-03-24 15:03:00.000000', 20, '101', '1');
INSERT INTO `order` VALUES ('20210325172559', '100801', '2021-03-25 09:25:59.000000', 87, '420', '1');
INSERT INTO `order` VALUES ('20210325203745', '100801', '2021-03-25 12:37:45.000000', 35, '223', '1');
INSERT INTO `order` VALUES ('20210326100919', '100805', '2021-03-26 02:09:19.000000', 140, '220', '1');
INSERT INTO `order` VALUES ('20210326101249', '100801', '2021-03-26 02:12:49.000000', 75, '420', '1');
INSERT INTO `order` VALUES ('20210326121034', '100801', '2021-03-26 04:10:34.000000', 15, '420', '1');
INSERT INTO `order` VALUES ('20210326122114', '100801', '2021-03-26 04:21:15.000000', 70, '223', '1');
INSERT INTO `order` VALUES ('20210326123053', '100801', '2021-03-26 04:30:53.000000', 15, '223', '1');
INSERT INTO `order` VALUES ('20210326124231', '100801', '2021-03-26 04:42:31.000000', 10, '220', '0');
INSERT INTO `order` VALUES ('20210326130952', '100801', '2021-03-26 05:09:52.000000', 60, '223', '0');
INSERT INTO `order` VALUES ('20210326132828', '100801', '2021-03-26 05:28:28.000000', 10, '223', '0');
INSERT INTO `order` VALUES ('20210412200740', '100801', '2021-04-12 12:07:40.000000', 100, '420', '0');
INSERT INTO `order` VALUES ('20210412201450', '100802', '2021-04-12 12:14:50.000000', 170, '223', '0');
INSERT INTO `order` VALUES ('20210414212837', '100801', '2021-04-14 13:28:37.000000', 17, '223', '0');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `orderid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(0) NULL DEFAULT NULL,
  `price` decimal(20, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`, `goodsid`) USING BTREE,
  INDEX `goodsid`(`goodsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES ('20210310200410', '7', 1, 2);
INSERT INTO `orderdetails` VALUES ('20210311201136', '6', 1, 5);
INSERT INTO `orderdetails` VALUES ('20210326121034', '17', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210326122114', '10', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210326123053', '16', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210326132828', '2', 1, 5);
INSERT INTO `orderdetails` VALUES ('20210412201002', '8', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210412201049', '12', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210412201450', '13', 1, 60);
INSERT INTO `orderdetails` VALUES ('20210412201450', '14', 1, 60);
INSERT INTO `orderdetails` VALUES ('20210412201450', '15', 1, 20);
INSERT INTO `orderdetails` VALUES ('20210412201450', '4', 1, 10);
INSERT INTO `orderdetails` VALUES ('20210412201450', '5', 1, 15);
INSERT INTO `orderdetails` VALUES ('20210414212837', '1', 1, 5);
INSERT INTO `orderdetails` VALUES ('20210414212837', '3', 1, 7);
INSERT INTO `orderdetails` VALUES ('20210414212837', '9', 1, 5);

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `capacity` int(0) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES ('1', '娱乐室', 34, '花园西区', 'img/1.jpg', '棋牌室', '0');
INSERT INTO `place` VALUES ('2', '娱乐室', 28, 'A-101', 'img/2.jpg', '家庭电影院', '0');
INSERT INTO `place` VALUES ('3', '文艺活动室', 100, 'B-100', 'img/3.jpg', '合唱室', '0');
INSERT INTO `place` VALUES ('4', '文艺活动室', 50, '花园东侧', 'img/4.jpg', '弦乐合奏室', '0');
INSERT INTO `place` VALUES ('5', '户外', 250, '江南西路', 'img/5.jpg', '太平山', '0');
INSERT INTO `place` VALUES ('6', '户外', 250, '南湖大道', 'img/7.jpg', '太湖', '0');
INSERT INTO `place` VALUES ('7', '娱乐室', 100, 'A-201', 'img/8.jpg', '舞蹈房', '0');
INSERT INTO `place` VALUES ('8', '食堂', 500, '食堂', 'img/6.jpg', '一食堂', '0');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `oid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actid` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schedule_ibfk_1`(`actid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`actid`) REFERENCES `arrangeact` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `old` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (31, '100801', 33);
INSERT INTO `schedule` VALUES (32, '100801', 31);
INSERT INTO `schedule` VALUES (33, '100801', 36);
INSERT INTO `schedule` VALUES (38, '100801', 58);
INSERT INTO `schedule` VALUES (136, '100801', 62);
INSERT INTO `schedule` VALUES (137, '100801', 48);

-- ----------------------------
-- View structure for view_oldschedule
-- ----------------------------
DROP VIEW IF EXISTS `view_oldschedule`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_oldschedule` AS select `schedule`.`oid` AS `oid`,`schedule`.`actid` AS `actid`,hour(`arrangeact`.`time1`) AS `shour`,minute(`arrangeact`.`time1`) AS `smin`,hour(`arrangeact`.`time2`) AS `ehour`,minute(`arrangeact`.`time2`) AS `emin`,year(`arrangeact`.`day`) AS `year`,month(`arrangeact`.`day`) AS `month`,dayofmonth(`arrangeact`.`day`) AS `day`,`arrangeact`.`site` AS `site`,`arrangeact`.`activity` AS `activity`,`arrangeact`.`number` AS `number`,`activity`.`name` AS `name`,`activity`.`note` AS `notes`,`activity`.`type` AS `type`,`activity`.`capacity` AS `capacity` from ((`schedule` join `arrangeact` on((`schedule`.`actid` = `arrangeact`.`id`))) join `activity` on((`arrangeact`.`activity` = `activity`.`id`)));

-- ----------------------------
-- View structure for view_orderdetail
-- ----------------------------
DROP VIEW IF EXISTS `view_orderdetail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_orderdetail` AS select `orderdetails`.`goodsid` AS `goodsid`,`orderdetails`.`num` AS `num`,`orderdetails`.`price` AS `price`,`goods`.`name` AS `name`,`order`.`oid` AS `oid`,`orderdetails`.`orderid` AS `orderid`,`goods`.`type` AS `type`,`order`.`time` AS `time` from ((`goods` join `orderdetails` on((`orderdetails`.`goodsid` = `goods`.`id`))) join `order` on((`order`.`id` = `orderdetails`.`orderid`))) where (`goods`.`id` = `orderdetails`.`goodsid`);

-- ----------------------------
-- View structure for viewactivity
-- ----------------------------
DROP VIEW IF EXISTS `viewactivity`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `viewactivity` AS select `activity`.`name` AS `title`,`activity`.`content` AS `content`,`activity`.`note` AS `note`,`arrangeact`.`id` AS `id`,`arrangeact`.`day` AS `day`,`arrangeact`.`time1` AS `time1`,`arrangeact`.`time2` AS `time2`,`place`.`location` AS `location`,`place`.`name` AS `name` from ((`activity` join `arrangeact` on((`arrangeact`.`activity` = `activity`.`id`))) join `place` on((`arrangeact`.`site` = `place`.`id`)));

-- ----------------------------
-- View structure for viewactnum
-- ----------------------------
DROP VIEW IF EXISTS `viewactnum`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `viewactnum` AS select `carer`.`cid` AS `cid`,`carer`.`name` AS `name`,`activitynum`.`task` AS `task`,`arrangeact`.`day` AS `day`,`arrangeact`.`time1` AS `time1`,`arrangeact`.`time2` AS `time2`,`activity`.`name` AS `title`,`arrangeact`.`id` AS `id` from (((`activitynum` join `arrangeact` on((`activitynum`.`aid` = `arrangeact`.`id`))) join `carer` on((`activitynum`.`cid` = `carer`.`cid`))) join `activity` on((`arrangeact`.`activity` = `activity`.`id`)));

-- ----------------------------
-- View structure for viewgoodsnum
-- ----------------------------
DROP VIEW IF EXISTS `viewgoodsnum`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `viewgoodsnum` AS select `order`.`time` AS `time`,`orderdetails`.`orderid` AS `orderid`,`order`.`id` AS `id`,`orderdetails`.`goodsid` AS `goodsid`,`goods`.`name` AS `name`,`goods`.`type` AS `type` from ((`order` join `orderdetails` on((`order`.`id` = `orderdetails`.`orderid`))) join `goods` on((`orderdetails`.`goodsid` = `goods`.`id`)));

-- ----------------------------
-- View structure for viewocg
-- ----------------------------
DROP VIEW IF EXISTS `viewocg`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `viewocg` AS select `guardian`.`idcard` AS `idcard`,`guardian`.`name` AS `name`,`guardian`.`gender` AS `gender`,`guardian`.`birthday` AS `birthday`,`guardian`.`address` AS `address`,`guardian`.`tele` AS `tele`,`guardian`.`oid` AS `oid`,`old`.`name` AS `oldname`,`carer`.`cid` AS `cid` from ((`carer` join `old` on((`old`.`carer` = `carer`.`cid`))) join `guardian` on((`guardian`.`oid` = `old`.`id`)));

-- ----------------------------
-- View structure for viewplacenum
-- ----------------------------
DROP VIEW IF EXISTS `viewplacenum`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `viewplacenum` AS select `arrangeact`.`day` AS `day`,`arrangeact`.`site` AS `site`,`place`.`name` AS `name`,`place`.`type` AS `type` from (`arrangeact` join `place` on((`arrangeact`.`site` = `place`.`id`)));

-- ----------------------------
-- Procedure structure for consume_procedure
-- ----------------------------
DROP PROCEDURE IF EXISTS `consume_procedure`;
delimiter ;;
CREATE PROCEDURE `consume_procedure`(IN oldid VARCHAR(20))
BEGIN

SELECT type, sum(price) from view_orderdetail
where oid = oldid
GROUP BY type;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for g
-- ----------------------------
DROP PROCEDURE IF EXISTS `g`;
delimiter ;;
CREATE PROCEDURE `g`()
begin
declare now date;
declare onemonth date;
declare threedays date;
declare threemonths date;
declare oneyear date;
set now= (select NOW()) ;
set onemonth=(select date_add(now, interval -1 month));
set threemonths=(select date_add(now, interval -3 month));
set threedays=(select date_add(now, interval -3 day));
set oneyear=(select date_add(now, interval -1 year));
SELECT type,count(CASE WHEN time <= threedays THEN 1 ELSE NULL END) as 次数
from viewgoodsnum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN time <= onemonth THEN 1 ELSE NULL END) as 次数
from viewgoodsnum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN time <= threemonths THEN 1 ELSE NULL END) as 次数
from viewgoodsnum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN time <= oneyear THEN 1 ELSE NULL END) as 次数
#不然的话0项不会显示
from viewgoodsnum
GROUP BY type;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for month_report
-- ----------------------------
DROP PROCEDURE IF EXISTS `month_report`;
delimiter ;;
CREATE PROCEDURE `month_report`(IN `oldid` varchar(20),IN `year` varchar(20))
BEGIN
	#Routine body goes here...
	SELECT Month(time) month, sum(price) from view_orderdetail
	where (oid = oldid) and (YEAR(time)=year)
	GROUP BY month;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p
-- ----------------------------
DROP PROCEDURE IF EXISTS `p`;
delimiter ;;
CREATE PROCEDURE `p`()
begin
declare now date;
declare onemonth date;
declare threedays date;
declare threemonths date;
declare oneyear date;
set now= (select NOW()) ;
set onemonth=(select date_add(now, interval -1 month));
set threemonths=(select date_add(now, interval -3 month));
set threedays=(select date_add(now, interval -3 day));
set oneyear=(select date_add(now, interval -1 year));
SELECT type,count(CASE WHEN day <= now THEN 1 ELSE NULL END) as 次数
from viewplacenum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN day <= threedays THEN 1 ELSE NULL END) as 次数
from viewplacenum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN day <= onemonth THEN 1 ELSE NULL END) as 次数
from viewplacenum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN day <= threemonths THEN 1 ELSE NULL END) as 次数
from viewplacenum
GROUP BY type
UNION ALL
SELECT type,count(CASE WHEN day <= oneyear THEN 1 ELSE NULL END) as 次数
#不然的话0项不会显示
from viewplacenum
GROUP BY type;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table arrangeact
-- ----------------------------
DROP TRIGGER IF EXISTS `number_trigger`;
delimiter ;;
CREATE TRIGGER `number_trigger` BEFORE UPDATE ON `arrangeact` FOR EACH ROW BEGIN
if (SELECT capacity FROM place
WHERE id=new.site
) < new.number
then 
SIGNAL SQLSTATE '45000'

SET MESSAGE_TEXT = 'over capacity';

end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table arrangeact
-- ----------------------------
DROP TRIGGER IF EXISTS `time_site_trigger`;
delimiter ;;
CREATE TRIGGER `time_site_trigger` BEFORE INSERT ON `arrangeact` FOR EACH ROW BEGIN
if EXISTS(
SELECT * 
FROM arrangeact
where( not(time1>New.time2 or time2<new.time1) and (site=new.site) and (day=new.day) )
)then 
SIGNAL SQLSTATE '45000'

SET MESSAGE_TEXT = 'time.';

end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table goods
-- ----------------------------
DROP TRIGGER IF EXISTS `price_triggger`;
delimiter ;;
CREATE TRIGGER `price_triggger` AFTER INSERT ON `goods` FOR EACH ROW begin
if NEW.price <0
then 
SIGNAL SQLSTATE '45000'

SET MESSAGE_TEXT = 'Original language id is required for Foreign language films.';

END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
