CREATE DATABASE  IF NOT EXISTS `spm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spm`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: spm
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basicinfo`
--

DROP TABLE IF EXISTS `basicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicinfo` (
  `idcourseinfo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`idcourseinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeType` varchar(50) DEFAULT NULL,
  `codeCode` varchar(50) DEFAULT NULL,
  `codeName` varchar(50) DEFAULT NULL,
  `validate` char(1) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configinfo`
--

DROP TABLE IF EXISTS `configinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configinfo` (
  `id` int(11) NOT NULL,
  `configType` varchar(255) DEFAULT NULL,
  `configCode` varchar(255) DEFAULT NULL,
  `configValue` varchar(255) DEFAULT NULL,
  `configDesc` varchar(255) DEFAULT NULL,
  `validate` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `studentId` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `classId` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telno` varchar(20) NOT NULL,
  `status` varchar(45) NOT NULL,
  `dailyGrade` decimal(5,2) DEFAULT '0.00',
  `midGrade` decimal(5,2) DEFAULT '0.00',
  `finalGrade` decimal(5,2) DEFAULT '0.00',
  `practiceGrade` decimal(5,2) DEFAULT '0.00',
  `totalGrade` decimal(5,2) DEFAULT '0.00',
  `syear` char(4) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download`
--

DROP TABLE IF EXISTS `download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `statement` varchar(200) DEFAULT NULL,
  `filepath` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `examName` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answerA` varchar(100) DEFAULT NULL,
  `answerB` varchar(100) DEFAULT NULL,
  `answerC` varchar(100) DEFAULT NULL,
  `answerD` varchar(100) DEFAULT NULL,
  `answerRight` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`examName`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileinfo`
--

DROP TABLE IF EXISTS `fileinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileinfo` (
  `idfile` int(11) NOT NULL AUTO_INCREMENT,
  `filePath` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(800) DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `detail` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `chapter_id` int(11) NOT NULL,
  `video_step_order` int(32) NOT NULL,
  `percent` int(11) DEFAULT NULL,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`,`chapter_id`,`video_step_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp_chapter`
--

DROP TABLE IF EXISTS `sp_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_chapter` (
  `chapter_id` int(11) NOT NULL COMMENT 'id',
  `chapter_name_number` int(11) DEFAULT NULL COMMENT '章编号',
  `chapter_name` varchar(64) DEFAULT NULL COMMENT '章名称',
  `chapter_desc` varchar(256) DEFAULT NULL COMMENT '章描述',
  `chapter_pic` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `chapter_courseware` varchar(256) DEFAULT NULL COMMENT '课件路径',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sp_chapter_video`
--

DROP TABLE IF EXISTS `sp_chapter_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_chapter_video` (
  `id` varchar(32) NOT NULL COMMENT '视频id',
  `chapter_id` int(11) NOT NULL COMMENT '章编号',
  `video_time` int(11) DEFAULT NULL COMMENT '时长，单位:分钟',
  `video_name_number` varchar(32) DEFAULT NULL COMMENT '视频小节序号',
  `video_name` varchar(128) DEFAULT NULL COMMENT '视频名称',
  `video_desc` varchar(512) DEFAULT NULL COMMENT '视频描述',
  `video_path` varchar(512) DEFAULT NULL COMMENT '视频地址',
  `video_pic` varchar(512) DEFAULT NULL COMMENT '视频图片地址',
  `video_step_order` int(32) DEFAULT NULL COMMENT '视频顺序，用户学到哪个阶段用这个字段标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teachingplan`
--

DROP TABLE IF EXISTS `teachingplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachingplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pieceId` int(11) DEFAULT NULL,
  `pieceName` varchar(45) DEFAULT NULL,
  `chapterId` int(11) DEFAULT NULL,
  `chapterName` varchar(45) DEFAULT NULL,
  `filepath` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chapterId_UNIQUE` (`chapterId`),
  UNIQUE KEY `chapterName_UNIQUE` (`chapterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tradeinfo`
--

DROP TABLE IF EXISTS `tradeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tradeinfo` (
  `idtradeinfo` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idtradeinfo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(15) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `position` varchar(45) DEFAULT NULL,
  `userId` varchar(45) DEFAULT NULL,
  `videoTime` int(11) DEFAULT '0',
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 20:23:09
