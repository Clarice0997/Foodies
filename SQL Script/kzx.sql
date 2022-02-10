/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : kzx

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 03/02/2022 22:48:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blind
-- ----------------------------
DROP TABLE IF EXISTS `blind`;
CREATE TABLE `blind`  (
  `Bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '盲盒Id',
  `Bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒名',
  `Bpicture` longblob NULL COMMENT '盲盒图片',
  `Btype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒类型',
  `Expiration_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '过期时间',
  `Bprice` double NOT NULL COMMENT '盲盒价格',
  `Bdiscribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒描述',
  `Bnum` int(11) NULL DEFAULT 0 COMMENT '盲盒所剩数量',
  `State` int(11) NOT NULL DEFAULT 0 COMMENT '无存货0，有存货1',
  PRIMARY KEY (`Bid`) USING BTREE,
  UNIQUE INDEX `Expiration_time`(`Expiration_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blind
-- ----------------------------

-- ----------------------------
-- Table structure for blind_type
-- ----------------------------
DROP TABLE IF EXISTS `blind_type`;
CREATE TABLE `blind_type`  (
  `Bid` int(11) NOT NULL COMMENT '盲盒Id（外键）',
  `Btype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒类型',
  `Btype_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒类型名称',
  INDEX `Bid`(`Bid`) USING BTREE,
  CONSTRAINT `blind_type_ibfk_1` FOREIGN KEY (`Bid`) REFERENCES `blind` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blind_type
-- ----------------------------

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `Uid` int(11) NOT NULL COMMENT '用户Id（外键）',
  `Sid` int(11) NOT NULL COMMENT '店铺Id（外键）',
  `Phone` int(11) NULL DEFAULT NULL COMMENT '电话（登录账号）',
  `Password` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  INDEX `Uid`(`Uid`) USING BTREE,
  INDEX `Sid`(`Sid`) USING BTREE,
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `shops` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `Oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单Id',
  `Uid` int(11) NOT NULL COMMENT '用户Id（外键）',
  `Sid` int(11) NOT NULL COMMENT '店铺Id（外键）',
  `Bid` int(11) NOT NULL COMMENT '盲盒Id（外键）',
  `Price_order_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `Odiscribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单描述',
  `Begin_pick_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始订单拿取时间',
  `End_pick_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '结束拿取订单时间',
  `Get_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '获得时间',
  `Sstars` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单星级 ',
  `Onum` int(11) NULL DEFAULT 1 COMMENT '订单数量',
  `Tital_price` double NOT NULL DEFAULT 0 COMMENT '商品总价格',
  `State` int(11) NOT NULL DEFAULT 0 COMMENT '无存货0，有存货1',
  PRIMARY KEY (`Oid`) USING BTREE,
  INDEX `Uid`(`Uid`) USING BTREE,
  INDEX `Sid`(`Sid`) USING BTREE,
  INDEX `Bid`(`Bid`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `shops` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Bid`) REFERENCES `blind` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops`  (
  `Sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `Sname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名',
  `Slogo` longblob NULL COMMENT '店铺标志',
  `Spicture` longblob NULL COMMENT '店铺图片',
  `Saddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺地址',
  `Sphone` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Sstars` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺星级 ',
  `Saved` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已节省食物（g）',
  `Begin_business_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '加入时间',
  `State` int(11) NOT NULL DEFAULT 0 COMMENT '营业0，未营业1',
  PRIMARY KEY (`Sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shops
-- ----------------------------

-- ----------------------------
-- Table structure for sorders
-- ----------------------------
DROP TABLE IF EXISTS `sorders`;
CREATE TABLE `sorders`  (
  `Oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单Id',
  `Uid` int(11) NOT NULL COMMENT '用户Id（外键）',
  `Sid` int(11) NOT NULL COMMENT '店铺Id（外键）',
  `Bid` int(11) NOT NULL COMMENT '盲盒Id（外键）',
  `Price_order_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `Odiscribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单描述',
  `Begin_pick_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始订单拿取时间',
  `End_pick_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '结束拿取订单时间',
  `Get_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '获得时间',
  `Ostars` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单星级 ',
  `Onum` int(11) NULL DEFAULT 1 COMMENT '订单数量',
  `Tital_price` double NOT NULL DEFAULT 0 COMMENT '商品总价格',
  `Unick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 用户昵称',
  `Phone` int(11) NULL DEFAULT NULL COMMENT '电话（登录账号）',
  `Bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盲盒名',
  UNIQUE INDEX `Phone`(`Phone`) USING BTREE,
  INDEX `Oid`(`Oid`) USING BTREE,
  INDEX `Uid`(`Uid`) USING BTREE,
  INDEX `Sid`(`Sid`) USING BTREE,
  INDEX `Bid`(`Bid`) USING BTREE,
  CONSTRAINT `sorders_ibfk_1` FOREIGN KEY (`Oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sorders_ibfk_2` FOREIGN KEY (`Uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sorders_ibfk_3` FOREIGN KEY (`Sid`) REFERENCES `shops` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sorders_ibfk_4` FOREIGN KEY (`Bid`) REFERENCES `blind` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sorders
-- ----------------------------

-- ----------------------------
-- Table structure for suer
-- ----------------------------
DROP TABLE IF EXISTS `suer`;
CREATE TABLE `suer`  (
  `Uid` int(11) NOT NULL COMMENT '用户Id（外键）',
  `Sid` int(11) NOT NULL COMMENT '店铺Id（外键）',
  `Sunick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 用户昵称',
  `Name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `Sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `Head_portrait` longblob NOT NULL COMMENT '头像',
  `Phone` int(11) NULL DEFAULT NULL COMMENT '电话（登录账号）',
  `Password` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `Sname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名',
  UNIQUE INDEX `user_account_inx`(`Phone`) USING BTREE,
  INDEX `Uid`(`Uid`) USING BTREE,
  INDEX `Sid`(`Sid`) USING BTREE,
  CONSTRAINT `suer_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `suer_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `shops` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suer
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id',
  `Unick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 用户昵称',
  `Name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `Sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `Uhead_portrait` longblob NOT NULL COMMENT '头像',
  `Phone` int(11) NULL DEFAULT NULL COMMENT '电话（登录账号）',
  `Password` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `State` int(11) NOT NULL DEFAULT 0 COMMENT '用户0，商家1',
  PRIMARY KEY (`Uid`) USING BTREE,
  UNIQUE INDEX `user_account_inx`(`Phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
