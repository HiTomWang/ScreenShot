/*
 Navicat MySQL Data Transfer

 Source Server         : win2008r2
 Source Server Type    : MySQL
 Source Server Version : 50523
 Source Host           : 192.168.42.223:3306
 Source Schema         : rin

 Target Server Type    : MySQL
 Target Server Version : 50523
 File Encoding         : 65001

 Date: 01/09/2019 11:27:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `external_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES (1, 'IBM', '方法', NULL, 2);

-- ----------------------------
-- Table structure for t_cp_price
-- ----------------------------
DROP TABLE IF EXISTS `t_cp_price`;
CREATE TABLE `t_cp_price`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL,
  `b_s` decimal(9, 3) NULL DEFAULT NULL,
  `c_s` decimal(9, 3) NULL DEFAULT NULL,
  `b_d` decimal(9, 3) NULL DEFAULT NULL,
  `c_d` decimal(9, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_cp_price
-- ----------------------------
INSERT INTO `t_cp_price` VALUES (1, 1, 1.000, 2.000, 0.600, 1.500);
INSERT INTO `t_cp_price` VALUES (2, 2, 0.400, 0.900, 0.200, 0.500);
INSERT INTO `t_cp_price` VALUES (3, 3, 0.200, 0.500, 0.150, 0.300);
INSERT INTO `t_cp_price` VALUES (4, 4, 0.100, 0.400, 0.050, 0.100);
INSERT INTO `t_cp_price` VALUES (5, 5, 0.130, 0.340, 0.090, 0.250);
INSERT INTO `t_cp_price` VALUES (6, 6, 1.500, 3.000, 1.200, 2.500);

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `company_ID` int(11) NULL DEFAULT NULL,
  `parent_ID` int(11) NULL DEFAULT NULL,
  `external_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `director` int(11) NULL DEFAULT NULL,
  `authorization` int(11) NULL DEFAULT NULL,
  `del_flag` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `company_ID`(`company_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '其他', 1, NULL, NULL, NULL, 31, 0);

-- ----------------------------
-- Table structure for t_domain
-- ----------------------------
DROP TABLE IF EXISTS `t_domain`;
CREATE TABLE `t_domain`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `domain_ip` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `port` int(11) NOT NULL,
  `company_ID` int(11) NOT NULL,
  `verify_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verify_pas` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_domain
-- ----------------------------
INSERT INTO `t_domain` VALUES (1, 'test.com', '192.168.100.103', 389, 1, 'tom', 'lLUl5FUgesmphQBfuhY04Q==', 0);

-- ----------------------------
-- Table structure for t_email_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_email_setting`;
CREATE TABLE `t_email_setting`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_encryption` int(11) NOT NULL,
  `smtp_username` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `smtp_password` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `color` int(11) NULL DEFAULT NULL,
  `single` int(11) NULL DEFAULT NULL,
  `page` int(11) NULL DEFAULT NULL,
  `copies` int(11) NULL DEFAULT NULL,
  `job_time` datetime NULL DEFAULT NULL,
  `user_ID` int(11) NULL DEFAULT NULL,
  `card_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pdl` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `src` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `completed` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `user_ID`(`user_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES (1, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 15:21:38', 2, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_152138857.prn', 1);
INSERT INTO `t_job` VALUES (2, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 16:32:04', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_163204325.prn', 1);
INSERT INTO `t_job` VALUES (3, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 16:32:26', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_163226356.prn', 1);
INSERT INTO `t_job` VALUES (4, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 16:34:53', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_163453356.prn', 1);
INSERT INTO `t_job` VALUES (5, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 16:35:25', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_163525247.prn', 1);
INSERT INTO `t_job` VALUES (6, '测试页', 1, 2, 0, 1, 1, 1, '2019-06-29 16:54:29', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_165429160.prn', 1);
INSERT INTO `t_job` VALUES (7, '系统.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-06-29 17:02:29', 3, '1234567890', 'PCLXL', 'C:\\printdata\\20190629_170229223.prn', 1);
INSERT INTO `t_job` VALUES (8, '测试页', 1, 2, 0, 1, 1, 1, '2019-06-30 12:56:52', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190630_125652336.prn', 1);
INSERT INTO `t_job` VALUES (10, '测试页', 1, 2, 0, 1, 1, 1, '2019-06-30 13:08:49', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190630_130849758.prn', 1);
INSERT INTO `t_job` VALUES (11, 'Microsoft Word - 文档1', 1, 2, 0, 1, 1, 1, '2019-06-30 13:31:51', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190630_133151903.prn', 1);
INSERT INTO `t_job` VALUES (12, 'Microsoft Word - 新建 Microsoft Word 文档.docx', 1, 2, 0, 1, 1, 1, '2019-07-01 12:17:44', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190701_121744916.prn', 1);
INSERT INTO `t_job` VALUES (13, 'Microsoft Word - 新建 Microsoft Word 文档.docx', 1, 2, 0, 1, 1, 1, '2019-07-01 12:20:28', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190701_122028432.prn', 1);
INSERT INTO `t_job` VALUES (14, 'Microsoft Word - 新建 Microsoft Word 文档.docx', 1, 2, 0, 1, 1, 1, '2019-07-01 17:20:25', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190701_172025072.prn', 1);
INSERT INTO `t_job` VALUES (15, 'LoginInfo.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-07-14 14:45:17', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190714_144517823.prn', 1);
INSERT INTO `t_job` VALUES (16, 'LoginInfo.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-07-14 14:48:55', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190714_144855776.prn', 1);
INSERT INTO `t_job` VALUES (17, 'LoginInfo.txt - 记事本', 1, 2, 0, 1, 1, 1, '2019-07-14 14:56:40', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190714_145640026.prn', 1);
INSERT INTO `t_job` VALUES (18, '报名表家长须知(1).pdf', 1, 2, 0, 1, 2, 1, '2019-07-20 14:20:31', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190720_142031111.prn', 1);
INSERT INTO `t_job` VALUES (19, 'CSU 2019 游泳水球夏令营7.22-7.26.pdf', 1, 2, 0, 0, 2, 1, '2019-07-20 14:21:32', 5, '0004703685', 'PCLXL', 'C:\\printdata\\20190720_142132721.prn', 1);

-- ----------------------------
-- Table structure for t_mfp
-- ----------------------------
DROP TABLE IF EXISTS `t_mfp`;
CREATE TABLE `t_mfp`  (
  `serialNO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IP` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `active_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`serialNO`) USING BTREE,
  INDEX `IP`(`IP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_mfp
-- ----------------------------
INSERT INTO `t_mfp` VALUES ('C636PA00016', '3225S', '192.168.100.101', '2F', 0, 0);

-- ----------------------------
-- Table structure for t_mfp_state_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_mfp_state_setting`;
CREATE TABLE `t_mfp_state_setting`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `no_toner` int(11) NULL DEFAULT NULL,
  `no_paper` int(11) NULL DEFAULT NULL,
  `paper_jam` int(11) NULL DEFAULT NULL,
  `service_man_call` int(11) NULL DEFAULT NULL,
  `cover_open` int(11) NULL DEFAULT NULL,
  `adf_lift_up` int(11) NULL DEFAULT NULL,
  `paper_on_glass` int(11) NULL DEFAULT NULL,
  `less_paper` int(11) NULL DEFAULT NULL,
  `not_all_no_paper` int(11) NULL DEFAULT NULL,
  `less_toner` int(11) NULL DEFAULT NULL,
  `other_error` int(11) NULL DEFAULT NULL,
  `offline` int(11) NULL DEFAULT NULL,
  `trash_toner` int(11) NULL DEFAULT NULL,
  `send_email` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_mfp_state_setting
-- ----------------------------
INSERT INTO `t_mfp_state_setting` VALUES (1, 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_organizationalunit
-- ----------------------------
DROP TABLE IF EXISTS `t_organizationalunit`;
CREATE TABLE `t_organizationalunit`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain_ID` int(11) NOT NULL,
  `ou_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `domain_ID`(`domain_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_print_driver
-- ----------------------------
DROP TABLE IF EXISTS `t_print_driver`;
CREATE TABLE `t_print_driver`  (
  `IP` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `color` int(11) NULL DEFAULT NULL,
  `position` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `server_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `serial_number` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `copy_status` int(11) NULL DEFAULT NULL,
  `print_status` int(11) NULL DEFAULT NULL,
  `scan_status` int(11) NULL DEFAULT NULL,
  `trays` varchar(1500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tonners` varchar(1500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `state_time` datetime NULL DEFAULT NULL,
  `no_toner` int(11) NULL DEFAULT NULL,
  `no_paper` int(11) NULL DEFAULT NULL,
  `paper_jam` int(11) NULL DEFAULT NULL,
  `service_man_call` int(11) NULL DEFAULT NULL,
  `cover_open` int(11) NULL DEFAULT NULL,
  `adf_lift_up` int(11) NULL DEFAULT NULL,
  `paper_on_glass` int(11) NULL DEFAULT NULL,
  `less_paper` int(11) NULL DEFAULT NULL,
  `not_all_no_paper` int(11) NULL DEFAULT NULL,
  `less_toner` int(11) NULL DEFAULT NULL,
  `other_error` int(11) NULL DEFAULT NULL,
  `trash_toner` int(11) NULL DEFAULT NULL,
  `no_toner_flag` int(11) NULL DEFAULT NULL,
  `no_paper_flag` int(11) NULL DEFAULT NULL,
  `paper_jam_flag` int(11) NULL DEFAULT NULL,
  `service_man_call_flag` int(11) NULL DEFAULT NULL,
  `cover_open_flag` int(11) NULL DEFAULT NULL,
  `adf_lift_up_flag` int(11) NULL DEFAULT NULL,
  `paper_on_glass_flag` int(11) NULL DEFAULT NULL,
  `less_paper_flag` int(11) NULL DEFAULT NULL,
  `not_all_no_paper_flag` int(11) NULL DEFAULT NULL,
  `less_toner_flag` int(11) NULL DEFAULT NULL,
  `other_error_flag` int(11) NULL DEFAULT NULL,
  `offline_flag` int(11) NULL DEFAULT NULL,
  `trash_toner_flag` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IP`) USING BTREE,
  INDEX `serial_number`(`serial_number`(255)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_print_driver
-- ----------------------------
INSERT INTO `t_print_driver` VALUES ('192.168.100.101', '192.168.100.101', 0, '', 3, 'win2008r2', 'C636PA00016', 1, 0, 0, '[{\"level\":\"30\",\"name\":\"Paper Tray 1\",\"size\":\"A4\"},{\"level\":\"0\",\"name\":\"Paper Tray 1\",\"size\":\"A3\"},{\"level\":\"0\",\"name\":\"Paper Tray 1\",\"size\":\"A4\"}]', '[{\"level\":\"-3\",\"name\":\"Toner\"}]', '2019-08-04 15:32:52', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_scan_price
-- ----------------------------
DROP TABLE IF EXISTS `t_scan_price`;
CREATE TABLE `t_scan_price`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL,
  `black` decimal(9, 3) NOT NULL,
  `color` decimal(9, 3) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_statistic
-- ----------------------------
DROP TABLE IF EXISTS `t_statistic`;
CREATE TABLE `t_statistic`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `single_black` int(11) NOT NULL,
  `single_color` int(11) NOT NULL,
  `double_black` int(11) NOT NULL,
  `double_color` int(11) NOT NULL,
  `single_black_cost` decimal(20, 3) NOT NULL,
  `single_color_cost` decimal(20, 3) NOT NULL,
  `double_black_cost` decimal(20, 3) NOT NULL,
  `double_color_cost` decimal(20, 3) NOT NULL,
  `total_cost` decimal(30, 3) NOT NULL,
  `job_time` datetime NOT NULL,
  `user_ID` int(11) NULL DEFAULT NULL,
  `card_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `mfp` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dep_ID` int(11) NULL DEFAULT NULL,
  `dep_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_ID` int(11) NULL DEFAULT NULL,
  `company_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_flag` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `card_ID`(`card_ID`) USING BTREE,
  INDEX `user_ID`(`user_ID`) USING BTREE,
  INDEX `company_ID`(`company_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_statistic
-- ----------------------------
INSERT INTO `t_statistic` VALUES (1, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-06-30 12:56:44', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (2, 2, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-06-30 13:02:33', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (3, 3, 2, 1, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-06-30 13:02:33', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (4, 1, 2, 0, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-06-30 13:07:33', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (5, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-06-30 13:09:42', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (6, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-06-30 13:31:53', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (7, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-01 12:17:51', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (8, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-01 12:20:22', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (9, 2, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-01 12:21:37', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (10, 3, 2, 1, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-07-01 12:21:37', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (11, 3, 2, 1, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-07-01 12:22:37', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (12, 2, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-01 17:17:41', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (13, 3, 2, 1, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-07-01 17:17:41', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (14, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-01 17:20:43', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (15, 1, 2, 0, 0, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, '2019-07-14 14:45:08', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (16, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-14 14:48:36', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (17, 1, 2, 1, 0, 0, 0, 0.400, 0.000, 0.000, 0.000, 0.400, '2019-07-14 14:56:38', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (18, 1, 2, 2, 0, 0, 0, 0.800, 0.000, 0.000, 0.000, 0.800, '2019-07-20 14:20:20', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);
INSERT INTO `t_statistic` VALUES (19, 1, 2, 1, 0, 1, 2, 0.400, 0.000, 0.200, 1.000, 1.600, '2019-07-20 14:21:20', 5, '0004703685', 'C636PA00016', '192.168.100.101', 1, '其他', 1, 'IBM', '', 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `card_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `external` int(11) NOT NULL,
  `identity` int(11) NOT NULL,
  `dep_ID` int(11) NULL DEFAULT NULL,
  `company_ID` int(11) NULL DEFAULT NULL,
  `authorization` int(11) NULL DEFAULT NULL,
  `registerTime` datetime NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `domain_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `domain_ID`(`domain_ID`) USING BTREE,
  INDEX `company_ID`(`company_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', 'pBTwOVzx6u2sxPua/o2XLw==', NULL, NULL, 0, 1, NULL, NULL, 2047, NULL, 0, NULL);
INSERT INTO `t_user` VALUES (2, 'liuchang', '刘畅', 'pBTwOVzx6u2sxPua/o2XLw==', '1234567890', 'LC@LC.IBC', 0, 0, 1, 1, 31, '2019-06-29 15:21:00', 1, NULL);
INSERT INTO `t_user` VALUES (3, 'liuchang', '刘畅', 'pBTwOVzx6u2sxPua/o2XLw==', '1234567890', 'GG@GG.GG', 0, 0, 1, 1, 31, '2019-06-29 15:24:17', 1, NULL);
INSERT INTO `t_user` VALUES (5, 'tom', 'tom', 'pBTwOVzx6u2sxPua/o2XLw==', '0004703685', 'tom@tom.com', 0, 0, 1, 1, 31, '2019-06-29 23:24:46', 0, NULL);
INSERT INTO `t_user` VALUES (6, 'liuchang', 'liuchang', 'pBTwOVzx6u2sxPua/o2XLw==', '0004703686', 'liuchang@qq.com', 0, 0, 1, 1, 31, '2019-07-11 21:16:58', 0, NULL);
INSERT INTO `t_user` VALUES (7, 'Administrator', '', NULL, '10001', NULL, 1, 0, 1, 1, 31, '2019-07-14 12:51:15', 0, 1);
INSERT INTO `t_user` VALUES (8, 'Guest', '', NULL, '10002', NULL, 1, 0, 1, 1, 31, '2019-07-14 12:51:15', 0, 1);
INSERT INTO `t_user` VALUES (9, 'tom', 'tom', 'pBTwOVzx6u2sxPua/o2XLw==', '0006050952', 'tom@qq.com', 1, 0, 1, 1, 31, '2019-07-14 12:51:15', 0, 1);
INSERT INTO `t_user` VALUES (10, 'tian', 'tian', NULL, '0004703688', 'tom@tian.com', 1, 0, 1, 1, 31, '2019-07-14 12:51:16', 0, 1);
INSERT INTO `t_user` VALUES (11, 'tomt', 'tomw', 'pBTwOVzx6u2sxPua/o2XLw==', '100010', 'sss@qq.com', 0, 0, 1, 1, 31, '2019-07-17 20:28:54', 0, NULL);
INSERT INTO `t_user` VALUES (12, 'tom2', 'tom2', 'ynGoX2Gw65s=', '12312312', 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-02 15:45:43', 0, NULL);
INSERT INTO `t_user` VALUES (13, 'tom3', 'tom3', 'hhdfvW0cDsM=', '111', 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-02 15:54:46', 0, NULL);
INSERT INTO `t_user` VALUES (14, 'tom4', 'tom4', 'F17KeueXYaU=', '1234567890', 'tom@LC.IBC', 0, 0, 1, 1, 31, '2019-08-02 16:19:07', 0, NULL);
INSERT INTO `t_user` VALUES (15, 'tom5', 'tom5', 'nHsggVHoanU=', NULL, 'www@tom.com', 0, 0, 1, 1, 31, '2019-08-02 16:24:34', 0, NULL);
INSERT INTO `t_user` VALUES (16, 'tom6', 'tom6', 'cll1NsscnzRgxkU9ZzZMDA==', NULL, 'www@tom.com', 0, 0, 1, 1, 31, '2019-08-02 16:27:31', 0, NULL);
INSERT INTO `t_user` VALUES (17, 'tom7', 'tom7', 'cll1NsscnzRgxkU9ZzZMDA==', '12345678', 'tom@lh.cn', 0, 0, 1, 1, 31, '2019-08-02 17:01:37', 0, NULL);
INSERT INTO `t_user` VALUES (18, 'tom8', 'tom8', 'cll1NsscnzRgxkU9ZzZMDA==', '0004703600', 'tom@GG.GG', 0, 0, 1, 1, 31, '2019-08-02 17:19:50', 0, NULL);
INSERT INTO `t_user` VALUES (19, 'tom9', 'tom9', 'OQd/ydI4NKebSZoQJc/MBw==', '1231233', 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-02 17:41:19', 0, NULL);
INSERT INTO `t_user` VALUES (20, 'tom10', 'tom10', 'OQd/ydI4NKebSZoQJc/MBw==', '000470', 'tom@tom.com', 0, 0, 1, 1, 31, '2019-08-02 17:49:04', 0, NULL);
INSERT INTO `t_user` VALUES (21, 'tom11', 'tom11', 'OQd/ydI4NKebSZoQJc/MBw==', NULL, 'tom@lh.cn', 0, 0, 1, 1, 31, '2019-08-02 17:51:47', 0, NULL);
INSERT INTO `t_user` VALUES (22, 'tom12', 'tom12', '	µù', NULL, 'tom@LC.IBC', 0, 0, 1, 1, 31, '2019-08-02 17:55:27', 0, NULL);
INSERT INTO `t_user` VALUES (23, 'tom13', 'tom13', '	µù', NULL, 'tom@GG.GG', 0, 0, 1, 1, 31, '2019-08-02 18:02:14', 0, NULL);
INSERT INTO `t_user` VALUES (24, 'tom14', 'tom14', '	µù', NULL, 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-02 19:46:16', 0, NULL);
INSERT INTO `t_user` VALUES (25, 'tom15', 'tom15', '	µù', NULL, 'tom@LC.IBC', 0, 0, 1, 1, 31, '2019-08-02 19:52:15', 0, NULL);
INSERT INTO `t_user` VALUES (26, 'tom16', 'tom16', '123456', NULL, 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-02 19:54:35', 0, NULL);
INSERT INTO `t_user` VALUES (27, 'tom17', 'tom17', 'nHsggVHoanU=', NULL, 'tom@tom.com', 0, 0, 1, 1, 31, '2019-08-02 20:02:35', 0, NULL);
INSERT INTO `t_user` VALUES (28, 'tom18', 'tom18', 'ytdDM2IBpKI=', NULL, 'tom@tom.com', 0, 0, 1, 1, 31, '2019-08-04 10:40:38', 0, NULL);
INSERT INTO `t_user` VALUES (29, 'tom19', 'tom19', 'nHsggVHoanU=', NULL, 'tom@qq.com', 0, 0, 1, 1, 31, '2019-08-04 10:46:29', 0, NULL);

-- ----------------------------
-- Table structure for t_user_scan_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_user_scan_setting`;
CREATE TABLE `t_user_scan_setting`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `auth_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for GetDepExpenseByCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetDepExpenseByCompany`;
delimiter ;;
CREATE PROCEDURE `GetDepExpenseByCompany`(CompanyID int(11),
  StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

select d.dep_name as departmentName,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(sc3.scana3blackCount,0)) as a3BlackCount,
	(IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(sc3.scana3colorCount,0)) as a3ColorCount,
	(IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(sc4.scana4blackCount,0)) as a4BlackCount,
	(IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0) + IFNULL(sc4.scana4colorCount,0))as a4ColorCount,
	(IFNULL(sc3.scana3blackCount,0) + IFNULL(sc3.scana3colorCount,0) + IFNULL(sc4.scana4blackCount,0) + IFNULL(sc4.scana4colorCount,0)) as scan,
	IFNULL(p3.printa3blackCount,0) as printA3BlackCount,
	IFNULL(p3.printa3colorCount,0) as printA3ColorCount,
	IFNULL(c3.copya3blackCount,0) as copyA3BlackCount,
	IFNULL(c3.copya3colorCount,0) as copyA3ColorCount,
	IFNULL(p4.printa4blackCount,0) as printA4BlackCount,
	IFNULL(p4.printa4colorCount,0) as printA4ColorCount,
	IFNULL(c4.copya4blackCount,0) as copyA4BlackCount,
	IFNULL(c4.copya4colorCount,0) as copyA4ColorCount,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0)) as totalCount,
	(IFNULL(p3.printa3totalcost,0) + IFNULL(p4.printa4totalcost,0) + IFNULL(c3.copya3totalcost,0) + IFNULL(c4.copya4totalcost,0)) as totalCost
from 
(select distinct ID as dep_ID,name as dep_name from rin.t_department where company_ID = CompanyID
group by dep_ID) d
left join
(SELECT dep_ID as departmentID,SUM(single_black + double_black) as printa3blackCount,SUM(single_color + double_color) as printa3colorCount,SUM(total_cost) as printa3totalcost
from rin.t_statistic where size in(1,4)
and type = 1
and company_ID = CompanyID
and job_time < date_add(EndDate, INTERVAL 1 day)
and job_time >= StartDate
group by dep_ID ) p3
on d.dep_ID = p3.departmentID
left join
(SELECT dep_ID as departmentID,SUM(single_black + double_black) as printa4blackCount,SUM(single_color + double_color) as printa4colorCount,SUM(total_cost) as printa4totalcost
from rin.t_statistic where size in(2,3,5,6)
and type = 1
and company_ID = CompanyID 
and job_time < date_add(EndDate, INTERVAL 1 day)
and job_time >= StartDate
group by dep_ID ) p4
on d.dep_ID = p4.departmentID
left join
(select dep_ID as departmentID,SUM(single_black + double_black) as copya3blackCount,SUM(single_color + double_color) as copya3colorCount,SUM(total_cost) as copya3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 2
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by dep_ID) c3
on d.dep_ID = c3.departmentID
left join
(select dep_ID as departmentID,SUM(single_black + double_black) as copya4blackCount,SUM(single_color + double_color) as copya4colorCount,SUM(total_cost) as copya4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 2
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by dep_ID) c4
on d.dep_ID = c4.departmentID
left join
(select dep_ID as departmentID,SUM(single_black + double_black) as scana3blackCount,SUM(single_color + double_color) as scana3colorCount
	from rin.t_statistic where size in(1,4)
	and type = 3
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by dep_ID) sc3
on d.dep_ID = sc3.departmentID
left join
(select dep_ID as departmentID,SUM(single_black + double_black) as scana4blackCount,SUM(single_color + double_color) as scana4colorCount
	from rin.t_statistic where size in(2,3,5,6)
	and type = 3
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by dep_ID) sc4
on d.dep_ID = sc4.departmentID
group by d.dep_ID;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByCardID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByCardID`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByCardID`(CardID varchar(100),
  StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

create temporary table if not exists tmp_card_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  job_time Datetime,
  cost decimal(30,3),
  paper int(5)
);

insert into tmp_card_statis
(select
user_ID,
SUM(single_black + double_black) as blackCount,
SUM(single_color + double_color) as colorCount,
min(job_time) as job_time,
SUM(total_cost) as cost,
case when size = 1 or size = 4 then 1
else 2 end as paper
from rin.t_statistic
where card_ID = CardID
and job_time < date_add(EndDate, INTERVAL 1 day)
and job_time >= StartDate
group by user_ID,paper);


create temporary table if not exists tmp_a3_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  cost decimal(30,3)
);

insert into tmp_a3_statis
(select
user_ID,
blackCount,
colorCount,
cost
from tmp_card_statis
where paper = 1);


create temporary table if not exists tmp_a4_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  cost decimal(30,3)
);

insert into tmp_a4_statis
(select
user_ID,
blackCount,
colorCount,
cost
from tmp_card_statis
where paper = 2);


select u.user_ID as userID,CardID as cardID,u.name,u.companyName,u.account,IFNULL(a3.blackCount,0) as a3BlackCount,IFNULL(a3.colorCount,0) as a3ColorCount,IFNULL(a4.blackCount,0) as a4BlackCount,IFNULL(a4.colorCount,0) as a4ColorCount,(IFNULL(a3.cost,0)+IFNULL(a4.cost,0)) as totalCost from

(select a.user_ID,b.name,min(a.job_time) as jt,c.name as companyName,b.account
from tmp_card_statis a
left join rin.t_user b
on a.user_ID = b.ID
left join rin.t_company c
on b.company_ID = c.ID
group by a.user_ID
order by jt desc) u

left join

(select *
from tmp_a3_statis) a3

on u.user_ID = a3.user_ID
left join

(select *
from tmp_a4_statis) a4

on u.user_ID = a4.user_ID;


truncate table tmp_card_statis;
truncate table tmp_a3_statis;
truncate table tmp_a4_statis;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByDepartment
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByDepartment`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByDepartment`(CompanyID int(11),
  DepartmentID int(11),
  StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

select d.user_ID as userID,u.account,u.name,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(sc3.scana3blackCount,0)) as a3BlackCount,
	(IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(sc3.scana3colorCount,0)) as a3ColorCount,
	(IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(sc4.scana4blackCount,0)) as a4BlackCount,
	(IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0) + IFNULL(sc4.scana4colorCount,0))as a4ColorCount,
	(IFNULL(sc3.scana3blackCount,0) + IFNULL(sc3.scana3colorCount,0) + IFNULL(sc4.scana4blackCount,0) + IFNULL(sc4.scana4colorCount,0)) as scan,
	IFNULL(p3.printa3blackCount,0) as printA3BlackCount,
	IFNULL(p3.printa3colorCount,0) as printA3ColorCount,
	IFNULL(c3.copya3blackCount,0) as copyA3BlackCount,
	IFNULL(c3.copya3colorCount,0) as copyA3ColorCount,
	IFNULL(p4.printa4blackCount,0) as printA4BlackCount,
	IFNULL(p4.printa4colorCount,0) as printA4ColorCount,
	IFNULL(c4.copya4blackCount,0) as copyA4BlackCount,
	IFNULL(c4.copya4colorCount,0) as copyA4ColorCount,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0)) as totalCount,
	(IFNULL(p3.printa3totalcost,0) + IFNULL(p4.printa4totalcost,0) + IFNULL(c3.copya3totalcost,0) + IFNULL(c4.copya4totalcost,0)) as totalCost
from 
(select distinct user_ID
	from rin.t_statistic
	where company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) d
left join
(select ID,account,name
	from rin.t_user) u
on d.user_ID = u.ID 
left join
(select user_ID,SUM(single_black + double_black) as printa3blackCount,SUM(single_color + double_color) as printa3colorCount,SUM(total_cost) as printa3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 1
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) p3
on d.user_ID =p3.user_ID
left join
(select user_ID,SUM(single_black + double_black) as printa4blackCount,SUM(single_color + double_color) as printa4colorCount,SUM(total_cost) as printa4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 1
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) p4
on d.user_ID =p4.user_ID
left join
(select user_ID,SUM(single_black + double_black) as copya3blackCount,SUM(single_color + double_color) as copya3colorCount,SUM(total_cost) as copya3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 2
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) c3
on d.user_ID =c3.user_ID
left join
(select user_ID,SUM(single_black + double_black) as copya4blackCount,SUM(single_color + double_color) as copya4colorCount,SUM(total_cost) as copya4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 2
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) c4
on d.user_ID =c4.user_ID
left join
(select user_ID,SUM(single_black + double_black) as scana3blackCount,SUM(single_color + double_color) as scana3colorCount
	from rin.t_statistic where size in(1,4)
	and type = 3
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) sc3
on d.user_ID =sc3.user_ID
left join
(select user_ID,SUM(single_black + double_black) as scana4blackCount,SUM(single_color + double_color) as scana4colorCount
	from rin.t_statistic where size in(2,3,5,6)
	and type = 3
	and company_ID = CompanyID
	and dep_ID = DepartmentID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) sc4
on d.user_ID =sc4.user_ID
group by d.user_ID;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByMFP
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByMFP`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByMFP`(StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

select m.mfp as mfp,IFNULL(p.IP,'') as mfp_ip,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(sc3.scana3blackCount,0)) as a3BlackCount,
	(IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(sc3.scana3colorCount,0)) as a3ColorCount,
	(IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(sc4.scana4blackCount,0)) as a4BlackCount,
	(IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0) + IFNULL(sc4.scana4colorCount,0))as a4ColorCount,
	(IFNULL(sc3.scana3blackCount,0) + IFNULL(sc3.scana3colorCount,0) + IFNULL(sc4.scana4blackCount,0) + IFNULL(sc4.scana4colorCount,0)) as scan,
	IFNULL(p3.printa3blackCount,0) as printA3BlackCount,
	IFNULL(p3.printa3colorCount,0) as printA3ColorCount,
	IFNULL(c3.copya3blackCount,0) as copyA3BlackCount,
	IFNULL(c3.copya3colorCount,0) as copyA3ColorCount,
	IFNULL(p4.printa4blackCount,0) as printA4BlackCount,
	IFNULL(p4.printa4colorCount,0) as printA4ColorCount,
	IFNULL(c4.copya4blackCount,0) as copyA4BlackCount,
	IFNULL(c4.copya4colorCount,0) as copyA4ColorCount,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0)) as totalCount,
	(IFNULL(p3.printa3totalcost,0) + IFNULL(p4.printa4totalcost,0) + IFNULL(c3.copya3totalcost,0) + IFNULL(c4.copya4totalcost,0)) as totalCost
from 
(select distinct mfp
	from rin.t_statistic
	where job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) m
left join 
(select IP,serial_number from rin.t_print_driver) p
on m.mfp=p.serial_number
left join
(select mfp,SUM(single_black + double_black) as printa3blackCount,SUM(single_color + double_color) as printa3colorCount,SUM(total_cost) as printa3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 1
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) p3
on m.mfp =p3.mfp
left join
(select mfp,SUM(single_black + double_black) as printa4blackCount,SUM(single_color + double_color) as printa4colorCount,SUM(total_cost) as printa4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 1
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) p4
on m.mfp =p4.mfp
left join
(select mfp,SUM(single_black + double_black) as copya3blackCount,SUM(single_color + double_color) as copya3colorCount,SUM(total_cost) as copya3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 2
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) c3
on m.mfp =c3.mfp
left join
(select mfp,SUM(single_black + double_black) as copya4blackCount,SUM(single_color + double_color) as copya4colorCount,SUM(total_cost) as copya4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 2
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) c4
on m.mfp =c4.mfp
left join
(select mfp,SUM(single_black + double_black) as scana3blackCount,SUM(single_color + double_color) as scana3colorCount
	from rin.t_statistic where size in(1,4)
	and type = 3
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) sc3
on m.mfp =sc3.mfp
left join
(select mfp,SUM(single_black + double_black) as scana4blackCount,SUM(single_color + double_color) as scana4colorCount
	from rin.t_statistic where size in(2,3,5,6)
	and type = 3
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp) sc4
on m.mfp =sc4.mfp
group by m.mfp;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByMFPAndDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByMFPAndDep`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByMFPAndDep`(StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

select m.mfp as mfp,IFNULL(p.IP,'') as mfp_ip,m.company_name as companyName,m.dep_name as departmentName,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(sc3.scana3blackCount,0)) as a3BlackCount,
	(IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(sc3.scana3colorCount,0)) as a3ColorCount,
	(IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(sc4.scana4blackCount,0)) as a4BlackCount,
	(IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0) + IFNULL(sc4.scana4colorCount,0))as a4ColorCount,
	(IFNULL(sc3.scana3blackCount,0) + IFNULL(sc3.scana3colorCount,0) + IFNULL(sc4.scana4blackCount,0) + IFNULL(sc4.scana4colorCount,0)) as scan,
	IFNULL(p3.printa3blackCount,0) as printA3BlackCount,
	IFNULL(p3.printa3colorCount,0) as printA3ColorCount,
	IFNULL(c3.copya3blackCount,0) as copyA3BlackCount,
	IFNULL(c3.copya3colorCount,0) as copyA3ColorCount,
	IFNULL(p4.printa4blackCount,0) as printA4BlackCount,
	IFNULL(p4.printa4colorCount,0) as printA4ColorCount,
	IFNULL(c4.copya4blackCount,0) as copyA4BlackCount,
	IFNULL(c4.copya4colorCount,0) as copyA4ColorCount,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0)) as totalCount,
	(IFNULL(p3.printa3totalcost,0) + IFNULL(p4.printa4totalcost,0) + IFNULL(c3.copya3totalcost,0) + IFNULL(c4.copya4totalcost,0)) as totalCost
from 
(select mfp,s.company_ID,s.dep_ID,c.name as company_name,d.name as dep_name
	from rin.t_statistic s,rin.t_company c,rin.t_department d
	where job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	and s.company_ID = c.ID and s.dep_ID = d.ID
	group by s.mfp,s.company_ID,s.dep_ID) m
left join 
(select IP,serial_number from rin.t_print_driver) p
on m.mfp=p.serial_number
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as printa3blackCount,SUM(single_color + double_color) as printa3colorCount,SUM(total_cost) as printa3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 1
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) p3
on m.mfp =p3.mfp and m.company_ID =p3.company_ID and m.dep_ID = p3.dep_ID
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as printa4blackCount,SUM(single_color + double_color) as printa4colorCount,SUM(total_cost) as printa4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 1
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) p4
on m.mfp =p4.mfp and m.company_ID =p4.company_ID and m.dep_ID = p4.dep_ID
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as copya3blackCount,SUM(single_color + double_color) as copya3colorCount,SUM(total_cost) as copya3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 2
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) c3
on m.mfp =c3.mfp and m.company_ID =c3.company_ID and m.dep_ID = c3.dep_ID
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as copya4blackCount,SUM(single_color + double_color) as copya4colorCount,SUM(total_cost) as copya4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 2
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) c4
on m.mfp =c4.mfp and m.company_ID =c4.company_ID and m.dep_ID = c4.dep_ID
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as scana3blackCount,SUM(single_color + double_color) as scana3colorCount
	from rin.t_statistic where size in(1,4)
	and type = 3
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) sc3
on m.mfp =sc3.mfp and m.company_ID =sc3.company_ID and m.dep_ID = sc3.dep_ID
left join
(select mfp,company_ID,dep_ID,SUM(single_black + double_black) as scana4blackCount,SUM(single_color + double_color) as scana4colorCount
	from rin.t_statistic where size in(2,3,5,6)
	and type = 3
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by mfp,company_ID,dep_ID) sc4
on m.mfp =sc4.mfp and m.company_ID =sc4.company_ID and m.dep_ID = sc4.dep_ID
group by m.mfp,m.company_ID,m.dep_ID;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByUserAccount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByUserAccount`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByUserAccount`(CompanyID int(11),
  Account varchar(100),
  StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

select d.user_ID as userID,d.account,d.name,dep.dep_name as departmentName, dep.company_name as companyName,
	IFNULL(a3.blackCount,0) as a3BlackCount,
	IFNULL(a3.colorCount,0) as a3ColorCount,
	IFNULL(a4.blackCount,0) as a4BlackCount,
	IFNULL(a4.colorCount,0) as a4ColorCount,
	(IFNULL(a3.totalCost,0)+IFNULL(a4.totalCost,0)) as totalCost
from	
(select s.user_ID as user_ID,u.account as account,u.name as name,u.dep_ID as dep_ID from rin.t_statistic s, rin.t_user u
	where s.user_ID=u.ID and u.account = Account
	and s.company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) d
left join
(select de.ID as ID,de.name as dep_name,c.name as company_name from rin.t_department de, rin.t_company c
	where de.ID in (select dep_ID from rin.t_user where account = Account)
	and de.company_ID = c.ID
	and c.ID = CompanyID
	group by ID ) dep
on d.dep_ID = dep.ID
left join
(select user_ID,SUM(single_black + double_black) as blackCount, SUM(single_color + double_color) as colorCount,  SUM(total_cost) as totalCost
	from rin.t_statistic where size in(1,4)
	and user_ID in (select ID from rin.t_user where account = Account)
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) a3
on d.user_ID =a3.user_ID
left join
(select user_ID,SUM(single_black + double_black) as blackCount, SUM(single_color + double_color) as colorCount,  SUM(total_cost) as totalCost
	from rin.t_statistic where size in(2,3,5,6)
	and user_ID in (select ID from rin.t_user where account = Account)
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID) a4
on d.user_ID =a4.user_ID
group by d.user_ID;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetExpenseByUserID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetExpenseByUserID`;
delimiter ;;
CREATE PROCEDURE `GetExpenseByUserID`(UserID int(11),
  StartDate datetime,
  EndDate datetime)
begin
	
declare exit handler for sqlexception rollback;

create temporary table if not exists tmp_user_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  job_time Datetime,
  cost decimal(30,3),
  paper int(5)
);

insert into tmp_user_statis (
select
user_ID,
SUM(single_black + double_black) as blackCount,
SUM(single_color + double_color) as colorCount,
min(job_time) as job_time,
SUM(total_cost) as cost,
case when size = 1 or size = 4 then 1
else 2 end as paper
from rin.t_statistic
where user_ID = UserID
and job_time < date_add(EndDate, INTERVAL 1 day)
and job_time >= StartDate
group by user_ID,paper
);

create temporary table if not exists tmp_a3_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  cost decimal(30,3)
);

insert into tmp_a3_statis
(select
user_ID,
blackCount,
colorCount,
cost
from tmp_user_statis
where paper = 1);


create temporary table if not exists tmp_a4_statis(
  user_ID int(11),
  blackCount int(11),
  colorCount int(11),
  cost decimal(30,3)
);

insert into tmp_a4_statis
(select
user_ID,
blackCount,
colorCount,
cost
from tmp_user_statis
where paper = 2);


select u.user_ID as userID,u.card_ID as cardID,u.name,u.companyName,u.departmentName,u.account,IFNULL(a3.blackCount,0) as a3BlackCount,IFNULL(a3.colorCount,0) as a3ColorCount,IFNULL(a4.blackCount,0) as a4BlackCount,IFNULL(a4.colorCount,0) as a4ColorCount,(IFNULL(a3.cost,0)+IFNULL(a4.cost,0)) as totalCost from

(select a.user_ID,b.name,min(a.job_time) as jt,c.name as companyName,d.name as departmentName,b.account, b.card_ID 
from tmp_user_statis a
left join rin.t_user b
on a.user_ID = b.ID
left join rin.t_company c
on b.company_ID = c.ID
left join rin.t_department d
on b.dep_ID = d.ID
group by a.user_ID
order by jt desc) u

left join
(select *
from tmp_a3_statis) a3

on u.user_ID = a3.user_ID
left join
(select *
from tmp_a4_statis) a4

on u.user_ID = a4.user_ID;


truncate table tmp_user_statis;
truncate table tmp_a3_statis;
truncate table tmp_a4_statis;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetPerExpenseByCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetPerExpenseByCompany`;
delimiter ;;
CREATE PROCEDURE `GetPerExpenseByCompany`(CompanyID int(11),
  StartDate datetime,
  EndDate datetime)
begin

declare exit handler for sqlexception rollback;

create temporary table if not exists tmp_printa3_statis(
	user_ID int(11),
	printa3blackCount int(11),
	printa3colorCount int(11),
	printa3totalcost decimal(30,3)
);
insert into tmp_printa3_statis (
	select user_ID,SUM(single_black + double_black) as printa3blackCount,SUM(single_color + double_color) as printa3colorCount,SUM(total_cost) as printa3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 1
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);

create temporary table if not exists tmp_printa4_statis(
	user_ID int(11),
	printa4blackCount int(11),
	printa4colorCount int(11),
	printa4totalcost decimal(30,3)
);
insert into tmp_printa4_statis (
	select user_ID,SUM(single_black + double_black) as printa4blackCount,SUM(single_color + double_color) as printa4colorCount,SUM(total_cost) as printa4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 1
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);

create temporary table if not exists tmp_copya3_statis(
	user_ID int(11),
	copya3blackCount int(11),
	copya3colorCount int(11),
	copya3totalcost decimal(30,3)
);
insert into tmp_copya3_statis (
	select user_ID,SUM(single_black + double_black) as copya3blackCount,SUM(single_color + double_color) as copya3colorCount,SUM(total_cost) as copya3totalcost
	from rin.t_statistic where size in(1,4)
	and type = 2
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);

create temporary table if not exists tmp_copya4_statis(
	user_ID int(11),
	copya4blackCount int(11),
	copya4colorCount int(11),
	copya4totalcost decimal(30,3)
);
insert into tmp_copya4_statis (
	select user_ID,SUM(single_black + double_black) as copya4blackCount,SUM(single_color + double_color) as copya4colorCount,SUM(total_cost) as copya4totalcost
	from rin.t_statistic where size in(2,3,5,6)
	and type = 2
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);

create temporary table if not exists tmp_scana3_statis(
	user_ID int(11),
	scana3blackCount int(11),
	scana3colorCount int(11)
);
insert into tmp_scana3_statis (
	select user_ID,SUM(single_black + double_black) as scana3blackCount,SUM(single_color + double_color) as scana3colorCount
	from rin.t_statistic where size in(1,4)
	and type = 3
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);

create temporary table if not exists tmp_scana4_statis(
	user_ID int(11),
	scana4blackCount int(11),
	scana4colorCount int(11)
);
insert into tmp_scana4_statis (
	select user_ID,SUM(single_black + double_black) as scana4blackCount,SUM(single_color + double_color) as scana4colorCount
	from rin.t_statistic where size in(2,3,5,6)
	and type = 3
	and company_ID = CompanyID
	and job_time < date_add(EndDate, INTERVAL 1 day)
	and job_time >= StartDate
	group by user_ID
);
select u.user_ID as userID,u.account,u.name,u.dep_name as departmentName,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(sc3.scana3blackCount,0)) as a3BlackCount,
	(IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(sc3.scana3colorCount,0)) as a3ColorCount,
	(IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(sc4.scana4blackCount,0)) as a4BlackCount,
	(IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0) + IFNULL(sc4.scana4colorCount,0))as a4ColorCount,
	(IFNULL(sc3.scana3blackCount,0) + IFNULL(sc3.scana3colorCount,0) + IFNULL(sc4.scana4blackCount,0) + IFNULL(sc4.scana4colorCount,0)) as scan,
	IFNULL(p3.printa3blackCount,0) as printA3BlackCount,
	IFNULL(p3.printa3colorCount,0) as printA3ColorCount,
	IFNULL(c3.copya3blackCount,0) as copyA3BlackCount,
	IFNULL(c3.copya3colorCount,0) as copyA3ColorCount,
	IFNULL(p4.printa4blackCount,0) as printA4BlackCount,
	IFNULL(p4.printa4colorCount,0) as printA4ColorCount,
	IFNULL(c4.copya4blackCount,0) as copyA4BlackCount,
	IFNULL(c4.copya4colorCount,0) as copyA4ColorCount,
	(IFNULL(p3.printa3blackCount,0) + IFNULL(c3.copya3blackCount,0) + IFNULL(p3.printa3colorCount,0) + IFNULL(c3.copya3colorCount,0) + IFNULL(p4.printa4blackCount,0) + IFNULL(c4.copya4blackCount,0) + IFNULL(p4.printa4colorCount,0) + IFNULL(c4.copya4colorCount,0)) as totalCount,
	(IFNULL(p3.printa3totalcost,0) + IFNULL(p4.printa4totalcost,0) + IFNULL(c3.copya3totalcost,0) + IFNULL(c4.copya4totalcost,0)) as totalCost
from
(select a.user_ID,b.account,b.name,d.name as dep_name
from rin.t_statistic a,rin.t_user b,rin.t_department d
where a.user_ID = b.ID
and d.ID = b.dep_ID
group by a.user_ID) u
left join
(select * from tmp_printa3_statis) p3
on u.user_ID =p3.user_ID
left join
(select * from tmp_printa4_statis) p4
on u.user_ID =p4.user_ID
left join
(select * from tmp_copya3_statis) c3
on u.user_ID =c3.user_ID
left join
(select * from tmp_copya4_statis) c4
on u.user_ID =c4.user_ID
left join
(select * from tmp_scana3_statis) sc3
on u.user_ID =sc3.user_ID
left join
(select * from tmp_scana4_statis) sc4
on u.user_ID =sc4.user_ID
group by u.dep_name,u.user_ID;

truncate table tmp_printa3_statis;
truncate table tmp_printa4_statis;
truncate table tmp_copya3_statis;
truncate table tmp_copya4_statis;
truncate table tmp_scana3_statis;
truncate table tmp_scana4_statis;

commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetStaffCountByDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetStaffCountByDep`;
delimiter ;;
CREATE PROCEDURE `GetStaffCountByDep`(CompanyID int(11),
  DepartmentID int(11))
begin

DECLARE company_ID int(11);
DECLARE company_Name varchar(200);
DECLARE department_ID int(11);
DECLARE department_Name varchar(200);

declare exit handler for sqlexception rollback;

select t_company.ID,t_company.name  INTO company_ID,company_Name from rin.t_company
where ID = CompanyID;

select t_department.ID,t_department.name INTO department_ID,department_Name
from rin.t_department
where t_department.ID = DepartmentID and t_department.company_ID = company_ID;


select count(u.ID) as staffCount,company_Name as company,department_Name as department
from rin.t_user u
where u.company_ID = company_ID
and u.dep_ID = department_ID;


commit;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetTopTenByCompany
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetTopTenByCompany`;
delimiter ;;
CREATE PROCEDURE `GetTopTenByCompany`(CompanyID int(11),
  StartDate datetime,
  EndDate datetime)
begin
	
select u.ID as userID,u.account as account,u.name as name,a.totalCost as totalCost
from
(SELECT user_ID,SUM(total_cost) as totalCost FROM rin.t_statistic 
where company_ID=CompanyID
and job_time < date_add(EndDate, INTERVAL 1 day)
and job_time >= StartDate
group by user_ID order by SUM(total_cost) desc limit 10) a
left join rin.t_user u
on u.ID = a.user_ID;
	
commit;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
