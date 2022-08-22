-- MySQL dump 10.13  Distribute 8.0.16, for Win64 (x86_64)
--
-- Host: 172.16.10.7    Database: gobrain_89
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;;
 SET NAMES utf8 ;;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;;
/*!40103 SET TIME_ZONE='+00:00' */;;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;;

--
-- Table structure for table `assess`
--

#DROP TABLE IF EXISTS `assess`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS  `assess` (
  `assessId` int NOT NULL AUTO_INCREMENT,
  `assessName` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '测试名',
  `testImg` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '测试集图片',
  `assessResult` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评估结果',
  `resultLog` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '评估结果路径',
  `trainName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练版本名称',
  `userName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `trainId` int DEFAULT NULL COMMENT '模型ID',
  `imgScale` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片大小',
  `minScore` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'test_min_score',
  `classType` char(8) COLLATE utf8mb4_bin NOT NULL DEFAULT 'TwoClass' COMMENT '所属分类',
  `mulClassName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签ID逗号,分割',
  `imgTotal` int NOT NULL DEFAULT '0' COMMENT '图片总数',
  `checkOut` int NOT NULL DEFAULT '0' COMMENT '检出数量',
  `noCheckOut` int NOT NULL DEFAULT '0' COMMENT '未检出数量',
  `startTime` datetime DEFAULT NULL COMMENT '评估开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '评估结束时间',
  `delState` varchar(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除状态true已删除1false未删除0',
  PRIMARY KEY (`assessId`),
  KEY `idx_assess_userName_del` (`userName`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='评估表';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `assess_info`
--

#DROP TABLE IF EXISTS `assess_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `assess_info` (
  `assessInfoId` int NOT NULL AUTO_INCREMENT,
  `assessId` int DEFAULT NULL COMMENT '测试ID',
  `imageName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名',
  `imagePath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片地址',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `testValue` double DEFAULT NULL COMMENT '测试置信度',
  `labelId` int DEFAULT '0' COMMENT '标签ID,非多分类置为0',
  `expectedLabelId` int NOT NULL DEFAULT '-1' COMMENT '预期标签ID,-1为无预期结果',
  `expectedResult` int DEFAULT '-1' COMMENT '预期结果',
  `imageResultPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结果图片地址',
  `thumbnailResultImg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '结果图压缩路径',
  `renameImageName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重命名图片名',
  PRIMARY KEY (`assessInfoId`),
  KEY `idx_assess_info_assessId` (`assessId`),
  KEY `idx_as_info_val` (`testValue`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='测试图片信息';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `assess_info_202208`
--

#DROP TABLE IF EXISTS `assess_info_202208`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `assess_info_202208` (
  `assessInfoId` int NOT NULL AUTO_INCREMENT,
  `assessId` int DEFAULT NULL COMMENT '测试ID',
  `imageName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名',
  `imagePath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片地址',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `testValue` double DEFAULT NULL COMMENT '测试置信度',
  `labelId` int DEFAULT '0' COMMENT '标签ID,非多分类置为0',
  `expectedLabelId` int NOT NULL DEFAULT '-1' COMMENT '预期标签ID,-1为无预期结果',
  `expectedResult` int DEFAULT '-1' COMMENT '预期结果',
  `imageResultPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结果图片地址',
  `thumbnailResultImg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '结果图压缩路径',
  `renameImageName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重命名图片名',
  PRIMARY KEY (`assessInfoId`),
  KEY `idx_202208_assessId` (`assessId`),
  KEY `idx_202208_val` (`testValue`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='测试图片信息';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `assess_info_202209`
--

#DROP TABLE IF EXISTS `assess_info_202209`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `assess_info_202209` (
  `assessInfoId` int NOT NULL AUTO_INCREMENT,
  `assessId` int DEFAULT NULL COMMENT '测试ID',
  `imageName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名',
  `imagePath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片地址',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `testValue` double DEFAULT NULL COMMENT '测试置信度',
  `labelId` int DEFAULT '0' COMMENT '标签ID,非多分类置为0',
  `expectedLabelId` int NOT NULL DEFAULT '-1' COMMENT '预期标签ID,-1为无预期结果',
  `expectedResult` int DEFAULT '-1' COMMENT '预期结果',
  `imageResultPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结果图片地址',
  `thumbnailResultImg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '结果图压缩路径',
  `renameImageName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重命名图片名',
  PRIMARY KEY (`assessInfoId`),
  KEY `idx_202209_assessId` (`assessId`),
  KEY `idx_202209_val` (`testValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='测试图片信息';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `automatic_train`
--

#DROP TABLE IF EXISTS `automatic_train`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `automatic_train` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `intervalDays` int DEFAULT NULL COMMENT '训练间隔时间',
  `nextTrainTime` datetime NOT NULL COMMENT '下次训练时间',
  `dataGroupId` int NOT NULL COMMENT '数据组ID',
  `dataType` varchar(45) COLLATE utf8mb4_bin DEFAULT 'CLASS',
  `dataName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据组名',
  `deployInfo` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部署详情JSON',
  `automaticResult` tinyint DEFAULT NULL COMMENT '是否自动训练  true是',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_automatic_train_job` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `checkout_Info`
--

#DROP TABLE IF EXISTS `checkout_Info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `checkout_Info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessInfoId` int DEFAULT NULL COMMENT '测试图片结果信息ID',
  `classType` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '数据集类型',
  `labelId` varchar(55) COLLATE utf8mb4_bin DEFAULT '' COMMENT '目标类型标签',
  `confidence` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '置信度',
  `centerX` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中心点坐标X',
  `centerY` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中心点坐标Y',
  `width` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中心点坐标Y',
  `height` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '中心点坐标Y',
  PRIMARY KEY (`id`),
  KEY `idx_checkout_infoId` (`assessInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='检出详情';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_collect`
--

#DROP TABLE IF EXISTS `data_collect`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_collect` (
  `dataId` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `dataName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '数据集名称',
  `dataVer` int DEFAULT '1' COMMENT '数据集版本，默认V1',
  `dataVerId` int DEFAULT NULL COMMENT '数据集组ID',
  `dataState` varchar(10) COLLATE utf8mb4_bin DEFAULT 'INIT' COMMENT '数据集状态',
  `classType` char(8) COLLATE utf8mb4_bin NOT NULL COMMENT '所属分类(一分类OneClass 二分类TwoClass 多分类MulClass)',
  `dataPath` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据集存储路径',
  `unMarkPath` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '未标注数据存储路径',
  `imgTotal` int NOT NULL DEFAULT '0' COMMENT '图片总数',
  `markNum` int NOT NULL DEFAULT '0' COMMENT '已标注数量',
  `unMarkNum` int NOT NULL DEFAULT '0' COMMENT '未标注数量',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `delState` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`dataId`),
  KEY `idx_jn_del` (`jobNumber`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_group`
--

#DROP TABLE IF EXISTS `data_group`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `dataName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '数据集名称',
  `classType` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '所属分类  一分类 OneClass 二分类 TwoClass 多分类 MulClass',
  `dataVerNum` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据集最大版本数',
  `dataId` int DEFAULT '0' COMMENT '最新的数据集ID',
  `dataState` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '数据集状态',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  PRIMARY KEY (`id`),
  KEY `idx_data_group_jobNum` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集组';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_info`
--

#DROP TABLE IF EXISTS `data_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_info` (
  `infoId` int NOT NULL AUTO_INCREMENT,
  `dataId` int NOT NULL COMMENT '数据集ID',
  `labelId` int NOT NULL COMMENT '标签ID',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名称',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `labelTime` datetime DEFAULT NULL COMMENT '标注时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `moveState` char(1) COLLATE utf8mb4_bin DEFAULT '0',
  PRIMARY KEY (`infoId`),
  KEY `idx_dataId_labelId_del` (`dataId`,`labelId`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=4445 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集详情';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_info_202207`
--

#DROP TABLE IF EXISTS `data_info_202207`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_info_202207` (
  `infoId` int NOT NULL AUTO_INCREMENT,
  `dataId` int NOT NULL COMMENT '数据集ID',
  `labelId` int NOT NULL COMMENT '标签ID',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名称',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `labelTime` datetime DEFAULT NULL COMMENT '标注时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`infoId`),
  KEY `idx_data_202207_labelId` (`dataId`,`labelId`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=12274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集详情';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_info_202208`
--

#DROP TABLE IF EXISTS `data_info_202208`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_info_202208` (
  `infoId` int NOT NULL AUTO_INCREMENT,
  `dataId` int NOT NULL COMMENT '数据集ID',
  `labelId` int NOT NULL COMMENT '标签ID',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名称',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `labelTime` datetime DEFAULT NULL COMMENT '标注时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`infoId`),
  KEY `idx_data_202208_labelId` (`dataId`,`labelId`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集详情';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `data_info_202209`
--

#DROP TABLE IF EXISTS `data_info_202209`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `data_info_202209` (
  `infoId` int NOT NULL AUTO_INCREMENT,
  `dataId` int NOT NULL COMMENT '数据集ID',
  `labelId` int NOT NULL COMMENT '标签ID',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名称',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `labelTime` datetime DEFAULT NULL COMMENT '标注时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`infoId`),
  KEY `idx_data_202209_labelId` (`dataId`,`labelId`,`delState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集详情';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_Info_202208`
--

#DROP TABLE IF EXISTS `defect_Info_202208`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_Info_202208` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceInfo` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '生产设备',
  `stepInfo` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `deviceType` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模型类型',
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'recipe',
  `imgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷图片',
  `imgDetPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷框图',
  `aoiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AOI检测缺陷类型',
  `aiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI复判缺陷类型',
  `aiDetRes` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷信息',
  `resultState` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '改判结果  0 缺陷相同  1 缺陷不相同',
  `markFlag` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0 未标记  1 已标记',
  `markImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '标记图片路径',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字段冗余',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_DI_202208_panelId` (`panelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='缺陷信息表';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_Info_202209`
--

#DROP TABLE IF EXISTS `defect_Info_202209`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_Info_202209` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceInfo` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '生产设备',
  `stepInfo` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `deviceType` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模型类型',
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'recipe',
  `imgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷图片',
  `imgDetPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷框图',
  `aoiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AOI检测缺陷类型',
  `aiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI复判缺陷类型',
  `aiDetRes` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷信息',
  `resultState` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '改判结果  0 缺陷相同  1 缺陷不相同',
  `markFlag` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0 未标记  1 已标记',
  `markImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '标记图片路径',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字段冗余',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_DI_202209_panelId` (`panelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='缺陷信息表';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_img_info`
--

#DROP TABLE IF EXISTS `defect_img_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_img_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品型号',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `stepInfo` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `aiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI复判缺陷类型',
  `ngHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT '人工复判缺陷类型',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '切片图名',
  `imgPath` varchar(512) COLLATE utf8mb4_bin DEFAULT '' COMMENT '切片图地址',
  `specFlag` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '0 分类切片  1 检测切片',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_defect_img_panelId` (`panelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_img_record`
--

#DROP TABLE IF EXISTS `defect_img_record`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_img_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `defectImgId` int DEFAULT '0' COMMENT '人工复判缺陷图信息ID',
  `dataId` int DEFAULT '0' COMMENT '数据集ID',
  `dataType` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据集类型  CLASS 分类  DETECT 检测',
  PRIMARY KEY (`id`),
  KEY `idx_defect_img_record` (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_info_2022077`
--

#DROP TABLE IF EXISTS `defect_info_2022077`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_info_2022077` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceInfo` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '生产设备',
  `stepInfo` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `deviceType` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模型类型',
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'recipe',
  `imgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷图片',
  `imgDetPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷框图',
  `aoiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AOI检测缺陷类型',
  `aiHdCode` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI复判缺陷类型',
  `aiDetRes` varchar(1024) COLLATE utf8mb4_bin DEFAULT '' COMMENT '缺陷信息',
  `resultState` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '改判结果  0 缺陷相同  1 缺陷不相同',
  `markFlag` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0 未标记  1 已标记',
  `markImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '标记图片路径',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字段冗余',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_DI_202208_panelId` (`panelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据集组';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `defect_spec`
--

#DROP TABLE IF EXISTS `defect_spec`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `defect_spec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `recipeName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Recipe',
  `recipeInfo` json DEFAULT NULL COMMENT 'Recipe信息JSON',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_defect_spec_job` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `deploy_info`
--

#DROP TABLE IF EXISTS `deploy_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `deploy_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `deployIp` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '部署IP',
  `deployState` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部署状态',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dep_info_job_depId` (`jobNumber`,`deployIp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `deploy_record`
--

#DROP TABLE IF EXISTS `deploy_record`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `deploy_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deployInfoId` int NOT NULL COMMENT '部署IP详情ID',
  `trainId` int NOT NULL COMMENT '模型ID',
  `trainName` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '模型名称',
  `deployState` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部署状态',
  `deployTypeId` int NOT NULL COMMENT '部署类型ID',
  `typeName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型名称',
  `typeFolder` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型文件夹',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_dep_record_infoId` (`deployInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `deploy_type`
--

#DROP TABLE IF EXISTS `deploy_type`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `deploy_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `deployInfoId` int NOT NULL COMMENT '部署IP详情ID',
  `typeName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型名',
  `typeFolder` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型文件夹',
  `mountFolderPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'linux挂载地址',
  `orgFolderPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原文件地址',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `detect_collect`
--

#DROP TABLE IF EXISTS `detect_collect`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `detect_collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT '0' COMMENT 'version',
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `detectName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `detectVer` int DEFAULT '1' COMMENT '检测集版本，默认V1',
  `detectVerId` int DEFAULT NULL COMMENT '检测集组ID',
  `detectPath` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据存储路径',
  `unMarkPath` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '未标注数据存储路径',
  `imgTotal` int NOT NULL DEFAULT '0' COMMENT '图片总数',
  `markNum` int NOT NULL DEFAULT '0' COMMENT '已标注数量',
  `collectState` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT 'INIT' COMMENT '数据集状态',
  `changeState` tinyint NOT NULL DEFAULT '1' COMMENT '1数据集变动',
  `testWeights` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '0.9' COMMENT '测试数据占比权重',
  `labelsNum` int NOT NULL DEFAULT '0' COMMENT '使用的标签数量',
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '备注',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_detect_col_jobNumber` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `detect_group`
--

#DROP TABLE IF EXISTS `detect_group`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `detect_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `detectName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `detectVerNum` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '检测集最大版本数',
  `detectId` int DEFAULT '0' COMMENT '最新的检测集ID',
  `collectState` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '数据集状态',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  PRIMARY KEY (`id`),
  KEY `idx_detect_group_jobNum` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `detect_info`
--

#DROP TABLE IF EXISTS `detect_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `detect_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT '0' COMMENT 'version',
  `detectCollectId` int DEFAULT NULL COMMENT '检测集ID',
  `detectLabelId` varchar(255) COLLATE utf8mb4_bin DEFAULT ',' COMMENT '检测ID ,分割',
  `emptyLabel` tinyint NOT NULL DEFAULT '0' COMMENT '1已标注0未标注',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `imgWidth` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片宽',
  `imgHeight` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片高',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `moveState` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_detect_info_detectId` (`detectCollectId`)
) ENGINE=InnoDB AUTO_INCREMENT=11825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `detect_info_label`
--

#DROP TABLE IF EXISTS `detect_info_label`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `detect_info_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detectCollectId` int DEFAULT NULL COMMENT '检测集ID',
  `detectInfoId` int DEFAULT NULL COMMENT '检测集详情ID',
  `detectLabelId` int DEFAULT NULL COMMENT '检测标签ID',
  `leftX` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '图片左上角坐标X',
  `leftY` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '图片左上角坐标Y',
  `imgWidth` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片宽',
  `imgHeight` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片高',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_det_info_lab_infoId` (`detectInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=17696 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `detect_label`
--

#DROP TABLE IF EXISTS `detect_label`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `detect_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `detectId` int DEFAULT NULL COMMENT '检测集ID',
  `labelName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '标签名称',
  `colorRGB` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签颜色',
  `sortNum` int DEFAULT NULL COMMENT '排序,从大到小',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_detect_lab_detectId` (`detectId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `fragment_collect`
--

#DROP TABLE IF EXISTS `fragment_collect`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `fragment_collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT '0' COMMENT 'version',
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `groupName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '分割组名称',
  `collectVer` int NOT NULL COMMENT '分割集版本 默认 V1',
  `groupId` int NOT NULL COMMENT '分割集组ID',
  `dataPath` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据存储路径',
  `imgTotal` int NOT NULL DEFAULT '0' COMMENT '图片总数',
  `markNum` int NOT NULL DEFAULT '0' COMMENT '已标注数量',
  `collectState` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT 'INIT' COMMENT '分割集状态',
  `labelsNum` int NOT NULL DEFAULT '0' COMMENT '使用的标签数量',
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '备注',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_fragment_col_job_number` (`jobNumber`),
  KEY `idx_fragment_col_groupId` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `fragment_group`
--

#DROP TABLE IF EXISTS `fragment_group`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `fragment_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `groupName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '分割组名称',
  `groupVerNum` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '分割组最大版本数',
  `collectId` int DEFAULT '0' COMMENT '最新的分割集ID',
  `collectState` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '分割组状态',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  PRIMARY KEY (`id`),
  KEY `idx_fragment_group_jobNum` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `fragment_info`
--

#DROP TABLE IF EXISTS `fragment_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `fragment_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT '0' COMMENT 'version',
  `collectId` int DEFAULT NULL COMMENT '分割集ID',
  `labelId` varchar(255) COLLATE utf8mb4_bin DEFAULT ',' COMMENT '分割标签ID ,分割',
  `emptyLabel` tinyint NOT NULL DEFAULT '0' COMMENT '1已标注0未标注',
  `orgImgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '原图片名',
  `imgName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片名',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片路径',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '压缩图片路径',
  `imgWidth` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片宽',
  `imgHeight` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '图片高',
  `tagSort` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '未标记数据根据上传文件夹排序',
  `delState` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_fragment_info_collectId` (`collectId`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `fragment_info_label`
--

#DROP TABLE IF EXISTS `fragment_info_label`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `fragment_info_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collectId` int DEFAULT NULL COMMENT '分割集ID',
  `infoId` int DEFAULT NULL COMMENT '分割集详情ID',
  `labelId` int DEFAULT NULL COMMENT '分割标签ID',
  `shapeType` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标注类型',
  `coordinate` varchar(2000) COLLATE utf8mb4_bin NOT NULL COMMENT '坐标信息',
  PRIMARY KEY (`id`),
  KEY `idx_fra_info_lab_infoId` (`infoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `fragment_label`
--

#DROP TABLE IF EXISTS `fragment_label`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `fragment_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collectId` int DEFAULT NULL COMMENT '分割集ID',
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `labelName` varchar(55) COLLATE utf8mb4_bin NOT NULL COMMENT '标签名称',
  `colorRGB` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签颜色',
  `sortNum` int DEFAULT NULL COMMENT '排序,从大到小',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_fragment_lab_collectId` (`collectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `label_type`
--

#DROP TABLE IF EXISTS `label_type`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `label_type` (
  `labelId` int NOT NULL AUTO_INCREMENT,
  `dataId` int NOT NULL COMMENT '数据集ID',
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `labelName` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '标签名称',
  `classType` char(8) COLLATE utf8mb4_bin NOT NULL COMMENT '所属分类(一分类OneClass 二分类TwoClass 多分类MulClass)',
  `colorRGB` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签颜色',
  `sortNum` int NOT NULL COMMENT '用户ID',
  `delState` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`labelId`),
  KEY `idx_dataId_ct_del` (`dataId`,`classType`,`delState`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='标签分类';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `menu_info`
--

#DROP TABLE IF EXISTS `menu_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `menu_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parMenuId` int NOT NULL COMMENT '父级 menuId，一级菜单为0',
  `menuName` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单名',
  `level` int DEFAULT '1' COMMENT '菜单等级  1--一级    2--二级   3--三级',
  `sequence` int DEFAULT '1' COMMENT '权限排序',
  `url` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单对应的地址',
  `icon` varchar(125) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单对应的图标',
  `showState` tinyint NOT NULL DEFAULT '0' COMMENT '是否显示  true显示',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_menu_info_par` (`parMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `model_deploy`
--

#DROP TABLE IF EXISTS `model_deploy`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `model_deploy` (
  `deployId` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `trainId` int NOT NULL COMMENT '模型ID',
  `trainName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模型名称',
  `workDir` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练日志文件路径',
  `pbPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练完成后生成的mode.pd文件',
  `exportPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '转化后的文件存放路径',
  `savedModelPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'export_path存放savedModel文件夹的路径',
  `encryptAfter` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密完成后生成的文件存放路径',
  `encryptState` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '加密状态（运行中，成功，失败）',
  `modelVersion` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模型版本',
  `beginTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`deployId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型部署';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `model_estimate`
--

#DROP TABLE IF EXISTS `model_estimate`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `model_estimate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trainId` int DEFAULT NULL COMMENT '模型ID',
  `dataType` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '数据集类型CLASS 分类 DETECT 检测',
  `dataId` int DEFAULT NULL COMMENT '数据集ID',
  `imgPath` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '图片地址',
  `thumbnailImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '压缩图片路径',
  `resImgPath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '分割结果图片地址',
  `orgLabelId` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练时的标签ID',
  `orgLabelName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练时的标签名',
  `labelId` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '目标类型标签ID',
  `labelName` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '预测的标签名',
  PRIMARY KEY (`id`),
  KEY `idx_model_e_trainId` (`trainId`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型预测';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `model_param`
--

#DROP TABLE IF EXISTS `model_param`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `model_param` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `groupId` int DEFAULT '0' COMMENT '检测 or 分类 数据组ID',
  `dataType` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据组类型  CLASS 分类  DETECT 检测',
  `defaultParam` varchar(512) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '默认参数配置',
  PRIMARY KEY (`id`),
  KEY `idx_model_param_groupId` (`groupId`,`dataType`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型预测';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `model_train`
--

#DROP TABLE IF EXISTS `model_train`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `model_train` (
  `trainId` int NOT NULL AUTO_INCREMENT,
  `trainName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模型名称',
  `userId` int NOT NULL COMMENT '用户ID',
  `userName` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `groupId` int DEFAULT '0' COMMENT '数据组ID',
  `dataId` int DEFAULT NULL COMMENT '数据集ID',
  `dataType` varchar(10) COLLATE utf8mb4_bin DEFAULT 'CLASS' COMMENT '数据集类型  CLASS 分类  DETECT 检测',
  `workDir` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练日志文件路径',
  `trainParam` json DEFAULT NULL COMMENT '训练参数',
  `state` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '训练状态（训练中，训练完成，训练错误）',
  `beginTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `delState` varchar(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除状态:true 1 已删除;;false 0 未删除',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`trainId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='模型训练';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product`
--

#DROP TABLE IF EXISTS `product`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `modelCode` varchar(125) COLLATE utf8mb4_bin NOT NULL COMMENT '产品型号',
  `productSN` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品码',
  `workStationNum` int DEFAULT NULL COMMENT '机台编号',
  `detectResult` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机台检测结果',
  `reviewResult` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '人工复判结果',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_jobNumber` (`jobNumber`),
  KEY `idx_product_productSN` (`productSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_blemish`
--

#DROP TABLE IF EXISTS `product_blemish`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_blemish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `infoId` int NOT NULL COMMENT '产品ID',
  `imgId` int NOT NULL COMMENT '产品图ID',
  `blemishType` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷类型',
  `imgPath` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图路径',
  `cutState` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '切割状态',
  `centerX` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图片中心点x',
  `centerY` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图片中心点y',
  `imgHeight` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图高',
  `imgWidth` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图宽',
  `rotateAngle` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '缺陷图旋转角度',
  `delFlag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_pb_imgId` (`imgId`),
  KEY `idx_pb_infoId` (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_defect_Info_202208`
--

#DROP TABLE IF EXISTS `product_defect_Info_202208`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_defect_Info_202208` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceInfo` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '生产设备',
  `stepInfo` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'recipe',
  `aiJudge` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI判定缺陷类型',
  `bufferJudge` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '人工复判缺陷类型',
  `aiResult` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI判定结果  0 正确  1 错误',
  `sliceTotal` int DEFAULT '0' COMMENT '切片总数',
  `defectSliceTotal` int DEFAULT '0' COMMENT '人工复判缺陷切片总数',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字段冗余',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_PIP_202208_panelId` (`panelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='产品';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_defect_Info_202209`
--

#DROP TABLE IF EXISTS `product_defect_Info_202209`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_defect_Info_202209` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceInfo` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '生产设备',
  `stepInfo` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '步骤',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '设备ID',
  `panelId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '产品的唯一识别码',
  `recipe` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'recipe',
  `aiJudge` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI判定缺陷类型',
  `bufferJudge` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '人工复判缺陷类型',
  `aiResult` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'AI判定结果  0 正确  1 错误',
  `sliceTotal` int DEFAULT '0' COMMENT '切片总数',
  `defectSliceTotal` int DEFAULT '0' COMMENT '人工复判缺陷切片总数',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字段冗余',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_PIP_202209_panelId` (`panelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='产品';;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_detect`
--

#DROP TABLE IF EXISTS `product_detect`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_detect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productFolder` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品文件夹',
  `clipFolder` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片文件夹地址',
  `detectState` varchar(10) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '检测状态',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_img`
--

#DROP TABLE IF EXISTS `product_img`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `infoId` int NOT NULL COMMENT '产品ID',
  `productId` int DEFAULT NULL COMMENT '产品ID',
  `imgName` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原图片名',
  `imgPath` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片路径',
  `compressPath` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '略缩图路径',
  `compressFlag` tinyint DEFAULT NULL COMMENT '生成略缩图结果',
  `picName` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片picName',
  `sideViewDirection` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT 'ParNameDetail中的sideView_Direction值',
  `delFlag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_pb_infoId` (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `product_info`
--

#DROP TABLE IF EXISTS `product_info`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `product_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `productId` int NOT NULL COMMENT '产品ID',
  `folderName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '上传时的产品文件夹名',
  `productSN` varchar(125) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品码',
  `imgHeight` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品图高',
  `imgWidth` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品图宽',
  `productState` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '产品图片状态',
  `workStationNum` int DEFAULT NULL COMMENT '机台编号',
  `detectResult` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机台检测结果',
  `reviewResult` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '人工复判结果',
  `delFlag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除0.正常1.已删除',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_pi_jobNumber` (`jobNumber`),
  KEY `idx_pi_productSN` (`productSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `upload_record`
--

#DROP TABLE IF EXISTS `upload_record`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `upload_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL COMMENT '员工工号',
  `fileName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文件名',
  `newFileName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '重命名后的文件名',
  `locFilePath` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文件在本地的路径',
  `filePath` varchar(512) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文件存储地址',
  `fileMd5` varchar(512) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文件MD5',
  `totalSize` bigint DEFAULT '0' COMMENT '文件总大小',
  `chunkSize` bigint DEFAULT '0' COMMENT '分片大小',
  `chunkNumber` int DEFAULT '0' COMMENT '分片序号',
  `totalChunks` int DEFAULT '0' COMMENT '分片总数',
  `margeMark` tinyint(1) DEFAULT NULL COMMENT '合并标记 null 不需要合并 true 1 已合并  false 0 未合并',
  `margeFilePath` varchar(512) COLLATE utf8mb4_bin DEFAULT '' COMMENT '合并文件存储地址',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_upload_md5` (`fileMd5`)
) ENGINE=InnoDB AUTO_INCREMENT=9644 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;

--
-- Table structure for table `user`
--

#DROP TABLE IF EXISTS `user`;;
/*!40101 SET @saved_cs_client     = @@character_set_client */;;
 SET character_set_client = utf8mb4 ;;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobNumber` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `route` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限',
  `name` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `department` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`,`jobNumber`),
  UNIQUE KEY `jobNumber_UNIQUE` (`jobNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;;
/*!40101 SET character_set_client = @saved_cs_client */;;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;;

-- Dump completed on 2022-08-12 16:09:04
