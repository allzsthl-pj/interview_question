/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : peng

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 05/06/2023 21:37:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 'pj', 'admin@cuhk.com', '121242433', 'city one', '2023-06-05 12:58:07', NULL);
INSERT INTO `sys_user` VALUES (2, 'zoe', '123456', 'zoe', 'zoe@yahoo.com', '12321345', 'Hong Kong', '2023-06-05 13:10:33', NULL);
INSERT INTO `sys_user` VALUES (3, 'Jamintest1', '123', 'windfade', 'Jamin@qq.com', '1234556', 'Ohio', '2023-06-05 13:15:01', NULL);
INSERT INTO `sys_user` VALUES (4, 'Jamin', '123', 'windfade', 'Jamin@qq.com', NULL, NULL, '2023-06-05 13:23:41', NULL);
INSERT INTO `sys_user` VALUES (6, 'Jamin', NULL, 'windfade', 'Jamin@qq.com', '1234556', 'Ohio', '2023-06-05 13:32:07', NULL);
INSERT INTO `sys_user` VALUES (7, 'Robert', '123456', 'robert', 'robert@yahoo.com', '12321345', 'Hong Kong', '2023-06-05 15:23:57', NULL);
INSERT INTO `sys_user` VALUES (8, 'Ivan', NULL, 'Ivan', 'Ivan@qq.com', '1232445556', 'Hong Kong', '2023-06-05 16:11:21', NULL);
INSERT INTO `sys_user` VALUES (9, 'Isaac', NULL, 'Isaac', 'Isaac@qq.com', '145556', 'Hong Kong', '2023-06-05 16:14:25', 'sdasdasd');
INSERT INTO `sys_user` VALUES (10, 'Isaac', NULL, 'Isaac', 'Isaac@qq.com', '145556', 'Hong Kong', '2023-06-05 16:15:32', NULL);
INSERT INTO `sys_user` VALUES (11, 'Isaac', NULL, 'Isaac', 'Isaac@qq.com', '145556', 'Hong Kong', '2023-06-05 16:16:07', NULL);
INSERT INTO `sys_user` VALUES (12, 'Isaac', NULL, 'Isaactest', 'Isaac@qq.com', '145556', 'Hong Kong', '2023-06-05 16:16:21', NULL);
INSERT INTO `sys_user` VALUES (13, 'tang', NULL, 'tang', '123@test.com', '245776', 'Shenzhen', '2023-06-05 17:04:57', NULL);
INSERT INTO `sys_user` VALUES (14, 'Joe', NULL, 'Joe', '1232@322.com', '231233', 'New territories', '2023-06-05 17:39:04', NULL);
INSERT INTO `sys_user` VALUES (15, 'pengjian', NULL, 'ishmael1', 'pengjian@gmail.com', '232321', 'sha tin', '2023-06-05 17:43:40', NULL);
INSERT INTO `sys_user` VALUES (17, '232', NULL, '2322', 'ggdfd@gmail.com', '23213', '2323', '2023-06-05 18:05:47', NULL);
INSERT INTO `sys_user` VALUES (20, '12321', NULL, '2323', '23312@gmail.com', '3434', '12312', '2023-06-05 18:30:28', NULL);
INSERT INTO `sys_user` VALUES (21, 'fdfd', NULL, 'sfdsf', '23232@qq.com', 'fdfdf', 'fdfdf', '2023-06-05 18:35:19', NULL);
INSERT INTO `sys_user` VALUES (22, 'pengjian', NULL, 'jian', 'pengjian@test.com', '3432435', 'sha tin', '2023-06-05 18:35:55', NULL);
INSERT INTO `sys_user` VALUES (26, 'test', NULL, NULL, 'test@qq.com', NULL, NULL, '2023-06-05 19:57:59', NULL);

SET FOREIGN_KEY_CHECKS = 1;
