/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50701
Source Host           : localhost:3306
Source Database       : xiuqian

Target Server Type    : MYSQL
Target Server Version : 50701
File Encoding         : 65001

Date: 2018-06-12 09:52:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `signInTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`actionId`),
  KEY `userId_idx` (`userId`),
  KEY `activityIda_idx` (`activityId`),
  CONSTRAINT `activityIda` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`),
  CONSTRAINT `userIda` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES ('1', '3', '1', '11');
INSERT INTO `action` VALUES ('2', '3', '2', '20');
INSERT INTO `action` VALUES ('3', '3', '3', '10');
INSERT INTO `action` VALUES ('4', '3', '4', '30');
INSERT INTO `action` VALUES ('5', '4', '2', '15');
INSERT INTO `action` VALUES ('6', '4', '3', '25');
INSERT INTO `action` VALUES ('7', '5', '5', '15');
INSERT INTO `action` VALUES ('8', '5', '6', '10');
INSERT INTO `action` VALUES ('9', '5', '7', '20');
INSERT INTO `action` VALUES ('10', '5', '8', '30');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityTitle` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `activityIntroduce` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '这个发起人很懒，啥也没有写。',
  `activityImageUrl` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `activityStartTime` date NOT NULL,
  `activityEndTime` date NOT NULL,
  `activityModel` int(11) NOT NULL DEFAULT '1',
  `activityUserNumber` int(11) DEFAULT NULL,
  `activityStartUser` int(11) NOT NULL DEFAULT '1',
  `activityAttendNum` int(11) NOT NULL DEFAULT '0',
  `punishId` int(11) DEFAULT '1',
  `activityIsPrivate` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`activityId`),
  KEY `activityStartUser_idx` (`activityStartUser`),
  KEY `punishId_idx` (`punishId`),
  CONSTRAINT `activityStartUser` FOREIGN KEY (`activityStartUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `punishId` FOREIGN KEY (`punishId`) REFERENCES `punishtable` (`punishid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', 'RNG欢迎您', '我猜弄不好RNG能拿S赛冠军', '/Back/images/rng.png', '2018-05-15', '2018-05-25', '1', '50', '3', '31', '1', '1');
INSERT INTO `activity` VALUES ('2', '嘤嘤怪受死吧', '哈哈哈，抓住一只嘤嘤怪', '/Back/images/ying.jpg', '2018-05-16', '2018-05-21', '1', '50', '3', '35', '1', '1');
INSERT INTO `activity` VALUES ('3', '谁还可以比我睡的还晚', '散了散了，楼主已经凉了', '/Back/images/shui.jpg', '2018-05-23', '2018-06-03', '1', '50', '4', '20', '1', '1');
INSERT INTO `activity` VALUES ('4', '请诸君拔刀', '你的笑容由我守护', '/Back/images/zhujun.jpg', '2018-05-23', '2018-06-09', '1', '30', '4', '21', '1', '1');
INSERT INTO `activity` VALUES ('5', '健康饮食', '美好的一天从健康饮食开始', '/Back/images/yinshi.png', '2018-05-23', '2018-06-09', '1', '20', '3', '25', '1', '1');
INSERT INTO `activity` VALUES ('6', '健身行动', '缺乏锻炼？再好不过了', '/Back/images/jianshen.png', '2018-05-23', '2018-06-09', '1', '50', '3', '27', '1', '1');
INSERT INTO `activity` VALUES ('7', '单词百日斩', '从现在开始，做行动派', '/Back/images/word.png', '2018-05-23', '2018-06-09', '1', '100', '4', '20', '1', '1');
INSERT INTO `activity` VALUES ('8', 'running man', '跑出新青年 ', '/Back/images/run.png', '2018-05-23', '2018-06-09', '1', '20', '4', '30', '1', '1');

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', '123');
INSERT INTO `admins` VALUES ('2', 'zzz', '123');

-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `attentionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `attentionuserId` int(11) NOT NULL,
  PRIMARY KEY (`attentionId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `attentionuserId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('1', '3', '4');
INSERT INTO `attention` VALUES ('2', '4', '3');

-- ----------------------------
-- Table structure for `discuss`
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `discussId` int(10) NOT NULL AUTO_INCREMENT,
  `actionId` int(11) NOT NULL,
  `discussIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discussImageUrl` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discussPraise` int(11) NOT NULL DEFAULT '0',
  `discussTime` date DEFAULT NULL,
  PRIMARY KEY (`discussId`),
  KEY `actionId_idx` (`actionId`),
  CONSTRAINT `actionId` FOREIGN KEY (`actionId`) REFERENCES `action` (`actionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('1', '1', 'RNG欢迎您', '/Back/images/rng.png', '30', '2018-05-16');
INSERT INTO `discuss` VALUES ('2', '1', '嘤嘤怪受死吧', '/Back/images/ying.jpg', '10', '2018-05-15');
INSERT INTO `discuss` VALUES ('3', '6', '谁还可以比我睡的还晚', '/Back/images/shui.jpg', '15', '2018-05-29');
INSERT INTO `discuss` VALUES ('4', '7', '诸君可以拔剑了', '/Back/images/zhujun.jpg', '30', '2018-05-29');

-- ----------------------------
-- Table structure for `everysignin`
-- ----------------------------
DROP TABLE IF EXISTS `everysignin`;
CREATE TABLE `everysignin` (
  `signinId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `signinDate` date NOT NULL,
  `succeedSignin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`signinId`),
  KEY `zzz` (`userId`),
  KEY `xxx` (`activityId`),
  CONSTRAINT `xxx` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`),
  CONSTRAINT `zzz` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of everysignin
-- ----------------------------
INSERT INTO `everysignin` VALUES ('1', '3', '1', '2018-06-07', '1');
INSERT INTO `everysignin` VALUES ('2', '3', '1', '2018-06-08', '1');

-- ----------------------------
-- Table structure for `punishtable`
-- ----------------------------
DROP TABLE IF EXISTS `punishtable`;
CREATE TABLE `punishtable` (
  `punishId` int(11) NOT NULL AUTO_INCREMENT,
  `punishName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `punishIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`punishId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of punishtable
-- ----------------------------
INSERT INTO `punishtable` VALUES ('1', '淘汰', '一天淘汰一个');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userNum` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `userPassword` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userEmail` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userImageUrl` varchar(45) COLLATE utf8_unicode_ci DEFAULT '/Back/images/rng.png',
  `userIntroduce` varchar(45) COLLATE utf8_unicode_ci DEFAULT '一个小小萌新',
  `userPhone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `userNum_UNIQUE` (`userNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '2015015322', '王寅达', '123', '123', '/Back/images/g.jpg', '一个小小萌新', '17713169909');
INSERT INTO `user` VALUES ('4', '2015015319', '赵蕾', '123', '123', '/Back/images/b.jpg', '一个小小萌新', '');
INSERT INTO `user` VALUES ('5', '2015015332', '丁雪怡', '123', '123', '/Back/images/h.jpg', '一个小小萌新', '18332387232');

-- ----------------------------
-- Table structure for `userdopraise`
-- ----------------------------
DROP TABLE IF EXISTS `userdopraise`;
CREATE TABLE `userdopraise` (
  `userPraiseId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `discussId` int(11) NOT NULL,
  `doPraise` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userPraiseId`),
  KEY `nnn` (`userId`),
  KEY `mmm` (`discussId`),
  CONSTRAINT `mmm` FOREIGN KEY (`discussId`) REFERENCES `discuss` (`discussId`),
  CONSTRAINT `nnn` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdopraise
-- ----------------------------
