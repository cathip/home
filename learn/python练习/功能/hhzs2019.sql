/*
Navicat MySQL Data Transfer

Source Server         : hhzs
Source Server Version : 50718
Source Host           : cd-cdb-a9vh6zu6.sql.tencentcdb.com:63656
Source Database       : hhzs2019

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-04-15 17:52:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `activityName` varchar(11) DEFAULT NULL COMMENT '活动名称',
  `activityImg` varchar(50) NOT NULL COMMENT '活动图片',
  `startTime` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `activityName` (`activityName`,`startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activityproduct
-- ----------------------------
DROP TABLE IF EXISTS `activityproduct`;
CREATE TABLE `activityproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `activityId` int(11) DEFAULT NULL COMMENT '活动编号',
  `stockProductId` int(11) DEFAULT '0' COMMENT '库存商品编号',
  `newPrice` int(11) DEFAULT '0' COMMENT '活动商品价格',
  `newHHcoin` int(11) NOT NULL DEFAULT '0' COMMENT '活动可抵用盒盒币',
  PRIMARY KEY (`id`),
  KEY `activityId` (`activityId`,`stockProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ASorders
-- ----------------------------
DROP TABLE IF EXISTS `ASorders`;
CREATE TABLE `ASorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '售后订单编号，主键',
  `orderId` varchar(20) NOT NULL COMMENT '订单编号',
  `type` int(11) DEFAULT NULL COMMENT '售后类型',
  `why` varchar(100) NOT NULL COMMENT '售后原因',
  `isCheck` int(11) NOT NULL DEFAULT '0' COMMENT '是否审核通过',
  `remark` varchar(50) DEFAULT NULL COMMENT '处理说明',
  `refundMoney` float unsigned zerofill DEFAULT NULL COMMENT '退款金额',
  `refundHHcoin` int(10) unsigned zerofill DEFAULT NULL COMMENT '退款盒盒币',
  `newOrderId` varchar(20) DEFAULT NULL COMMENT '新订单号',
  `create_time` datetime DEFAULT NULL COMMENT '售后申请时间',
  `Audit_time` datetime DEFAULT NULL COMMENT '售后审核完成时间',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`,`type`,`isCheck`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车记录编号，主键',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `stockProductId` int(11) NOT NULL COMMENT '库存商品编号',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺id',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`stockProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clickcard
-- ----------------------------
DROP TABLE IF EXISTS `clickcard`;
CREATE TABLE `clickcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到表编号,主键',
  `userid` varchar(50) NOT NULL COMMENT '用户编号',
  `checkTime` datetime NOT NULL COMMENT '打卡时间',
  `year` int(11) NOT NULL COMMENT '打卡时间-年',
  `mouth` int(11) NOT NULL COMMENT '打卡时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coindetail
-- ----------------------------
DROP TABLE IF EXISTS `coindetail`;
CREATE TABLE `coindetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盒盒币明细表编号,主键',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `num` int(11) NOT NULL COMMENT '数量',
  `handleType` int(11) NOT NULL COMMENT '操作类型',
  `consumeType` int(11) NOT NULL COMMENT '盒盒币增减（0:减,1:加）',
  `handletime` datetime NOT NULL COMMENT '盒盒币操作时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for consum
-- ----------------------------
DROP TABLE IF EXISTS `consum`;
CREATE TABLE `consum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '现金消耗明细表编号,主键',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `money` float NOT NULL COMMENT '消耗金额',
  `handleType` int(11) NOT NULL DEFAULT '1' COMMENT '操作类型',
  `handleTime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Deliver
-- ----------------------------
DROP TABLE IF EXISTS `Deliver`;
CREATE TABLE `Deliver` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投递编号',
  `mchid` varchar(11) DEFAULT NULL COMMENT '机器标识',
  `wight` int(11) DEFAULT '0' COMMENT '投递重量(克)',
  `hhcoin` int(11) DEFAULT '0' COMMENT '盒盒币',
  `openid` varchar(50) NOT NULL COMMENT '微信标识',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '投递时间',
  PRIMARY KEY (`id`),
  KEY `mchid` (`mchid`,`openid`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Mchine
-- ----------------------------
DROP TABLE IF EXISTS `Mchine`;
CREATE TABLE `Mchine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mchid` varchar(11) DEFAULT NULL COMMENT '机器标识',
  `isSweep` int(11) DEFAULT '0' COMMENT '扫码状态',
  `mchState` int(11) DEFAULT '1' COMMENT '机器状态',
  `address` varchar(30) NOT NULL COMMENT '机器地址',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信标识',
  `bookdoor` int(11) DEFAULT '0' COMMENT '是否开书仓',
  `book` int(11) DEFAULT '0' COMMENT '书仓是否满',
  `paper` int(11) DEFAULT '0' COMMENT '纸仓是否满',
  `paperdoor` int(11) DEFAULT '0' COMMENT '是否开纸仓',
  `Repair` int(11) DEFAULT '0' COMMENT '是否开维修门',
  PRIMARY KEY (`id`),
  KEY `mchid` (`mchid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `ordergoods`;
CREATE TABLE `ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品编号，主键',
  `orderId` varchar(20) NOT NULL COMMENT '订单编号',
  `stockProductId` int(11) NOT NULL COMMENT '库存商品编号',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `money` float NOT NULL COMMENT '商品总价',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`,`stockProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号，主键',
  `orderNum` varchar(20) NOT NULL COMMENT '订单号',
  `createUser` int(11) NOT NULL COMMENT '下单用户',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `address` varchar(100) NOT NULL COMMENT '收货地址',
  `Consignee` varchar(100) NOT NULL COMMENT '收货人',
  `mobile` varchar(100) NOT NULL COMMENT '收货手机号码',
  `orderMoney` float NOT NULL COMMENT '订单金额',
  `heheCoin` int(11) NOT NULL COMMENT '盒盒币抵扣金额',
  `sendTime` varchar(100) DEFAULT NULL COMMENT '送货时间',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `state` int(11) NOT NULL COMMENT '订单状态',
  `endTime` datetime DEFAULT NULL COMMENT '收货时间',
  `wxid` varchar(50) DEFAULT NULL COMMENT '微信支付交易号',
  `freight` int(11) unsigned zerofill DEFAULT NULL COMMENT '运费',
  PRIMARY KEY (`id`),
  KEY `orderNum` (`orderNum`,`createUser`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for proclass
-- ----------------------------
DROP TABLE IF EXISTS `proclass`;
CREATE TABLE `proclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号，主键',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `parentId` int(11) NOT NULL COMMENT '父编号',
  `img` varchar(50) DEFAULT NULL COMMENT '分类图片路径',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for prodetail
-- ----------------------------
DROP TABLE IF EXISTS `prodetail`;
CREATE TABLE `prodetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格编号,排序编号,主键',
  `productId` int(11) NOT NULL COMMENT '商品编号',
  `specName` varchar(10) NOT NULL COMMENT '规格名称',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`,`specName`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号，主键',
  `productTypeId` int(11) NOT NULL COMMENT '商品分类编号',
  `productName` varchar(150) NOT NULL COMMENT '商品名称',
  `productImg` varchar(200) NOT NULL COMMENT '商品图片路径',
  `hehecoin` int(11) unsigned zerofill DEFAULT NULL,
  `minPrice` float DEFAULT '0' COMMENT '最低价格',
  `maxPrice` float DEFAULT '0' COMMENT '最高价格',
  `remark` text COMMENT '商品介绍',
  PRIMARY KEY (`id`),
  KEY `productTypeId` (`productTypeId`,`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for prostock
-- ----------------------------
DROP TABLE IF EXISTS `prostock`;
CREATE TABLE `prostock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品库存编号,主键',
  `specid` varchar(20) NOT NULL COMMENT '商品批次',
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for protype
-- ----------------------------
DROP TABLE IF EXISTS `protype`;
CREATE TABLE `protype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性编号,主键',
  `productId` int(11) NOT NULL COMMENT '商品编号',
  `typename` varchar(10) NOT NULL COMMENT '商品属性名称',
  `value` varchar(10) NOT NULL COMMENT '商品属性值',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`,`typename`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Recharge
-- ----------------------------
DROP TABLE IF EXISTS `Recharge`;
CREATE TABLE `Recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录编号，主键',
  `payNum` varchar(20) DEFAULT NULL COMMENT '微信支付订单编号',
  `type` int(11) NOT NULL COMMENT '充值类型',
  `userid` int(11) NOT NULL COMMENT '充值用户编号',
  `payMoney` float NOT NULL COMMENT '实际支付金额',
  `setVipMonth` int(11) NOT NULL DEFAULT '0' COMMENT 'vip延长时间',
  `setHHcoin` int(11) NOT NULL DEFAULT '0' COMMENT '盒盒币增加数量',
  `setMoney` int(11) NOT NULL DEFAULT '0' COMMENT '账户充值金额',
  `createTime` datetime NOT NULL COMMENT '充值时间',
  `wxpay` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payNum` (`payNum`,`userid`,`createTime`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存商品编号,主键',
  `productId` int(11) NOT NULL COMMENT '商品编号',
  `price` float(10,2) unsigned zerofill NOT NULL COMMENT '商品价格',
  `hehecoin` int(11) NOT NULL COMMENT '可抵用盒盒币',
  `img` varchar(50) NOT NULL COMMENT '图片路径',
  `limitNum` int(10) unsigned zerofill NOT NULL,
  `acti_price` float(10,2) unsigned zerofill DEFAULT '0000000.00' COMMENT '活动商品价格',
  `acti_hehecoin` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '活动可抵扣盒盒币',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specdetail
-- ----------------------------
DROP TABLE IF EXISTS `specdetail`;
CREATE TABLE `specdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格明细编号,主键',
  `productSpecId` int(11) NOT NULL COMMENT '商品规格编号',
  `value` varchar(20) NOT NULL COMMENT '规格名称',
  PRIMARY KEY (`id`),
  KEY `productSpecId` (`productSpecId`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for specid
-- ----------------------------
DROP TABLE IF EXISTS `specid`;
CREATE TABLE `specid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格明细联络id',
  `productid` int(11) NOT NULL COMMENT '库存商品编号',
  `specid` int(11) NOT NULL COMMENT '库存商品规格编号',
  `specinfoid` int(11) NOT NULL COMMENT '库存商品规格明细编号',
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`,`specid`,`specinfoid`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺编号,主键',
  `name` varchar(20) NOT NULL COMMENT '店铺名称',
  `longitude` varchar(20) NOT NULL COMMENT '经度',
  `latitude` varchar(20) NOT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号,主键',
  `mobile` varchar(13) DEFAULT NULL COMMENT '手机号码',
  `openid` varchar(50) NOT NULL COMMENT '用户微信标识',
  `createTime` datetime NOT NULL COMMENT '加入时间',
  `isFirstCharge` int(11) DEFAULT '0' COMMENT '是否已首充',
  `isVip` int(11) DEFAULT '0' COMMENT '是否会员',
  `vipEndTime` datetime DEFAULT NULL COMMENT '会员到期时间',
  `money` float DEFAULT '0' COMMENT '现金余额',
  `hhcoin` int(11) DEFAULT '0' COMMENT '盒盒币余额',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`openid`,`createTime`,`vipEndTime`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `state` int(11) DEFAULT '1' COMMENT '在职状态',
  `isAdmin` int(11) DEFAULT '0' COMMENT '是否超级管理员',
  PRIMARY KEY (`Id`),
  KEY `mobile` (`mobile`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
