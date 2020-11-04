/*
 Navicat Premium Data Transfer

 Source Server         : lionel
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : www.lionel.ink:3307
 Source Schema         : gulimall_wms

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/11/2020 23:48:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采购单id',
  `assignee_id` bigint(20) DEFAULT NULL COMMENT '采购人id',
  `assignee_name` varchar(255) DEFAULT NULL COMMENT '采购人名',
  `phone` char(13) DEFAULT NULL COMMENT '联系方式',
  `priority` int(4) DEFAULT NULL COMMENT '优先级',
  `status` int(4) DEFAULT NULL COMMENT '状态',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '总金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购信息';

-- ----------------------------
-- Records of wms_purchase
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wms_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase_detail`;
CREATE TABLE `wms_purchase_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '采购商品id',
  `sku_num` int(11) DEFAULT NULL COMMENT '采购数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '采购金额',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `status` int(11) DEFAULT NULL COMMENT '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wms_purchase_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_info`;
CREATE TABLE `wms_ware_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '仓库名',
  `address` varchar(255) DEFAULT NULL COMMENT '仓库地址',
  `areacode` varchar(20) DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库信息';

-- ----------------------------
-- Records of wms_ware_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_order_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task`;
CREATE TABLE `wms_ware_order_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `order_sn` varchar(255) DEFAULT NULL COMMENT 'order_sn',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` char(15) DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(500) DEFAULT NULL COMMENT '配送地址',
  `order_comment` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `payment_way` tinyint(1) DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
  `task_status` tinyint(2) DEFAULT NULL COMMENT '任务状态',
  `order_body` varchar(255) DEFAULT NULL COMMENT '订单描述',
  `tracking_no` char(30) DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `task_comment` varchar(500) DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_order_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task_detail`;
CREATE TABLE `wms_ware_order_task_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku_name',
  `sku_num` int(11) DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint(20) DEFAULT NULL COMMENT '工作单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_sku`;
CREATE TABLE `wms_ware_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `stock` int(11) DEFAULT NULL COMMENT '库存数',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku_name',
  `stock_locked` int(11) DEFAULT NULL COMMENT '锁定库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品库存';

-- ----------------------------
-- Records of wms_ware_sku
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
