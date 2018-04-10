/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : scholar

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-07-21 08:53:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '计算机学院');
INSERT INTO `department` VALUES ('2', '管理学院');
INSERT INTO `department` VALUES ('3', '电子信息学院');
INSERT INTO `department` VALUES ('4', '机电工程学院');
INSERT INTO `department` VALUES ('5', '材料与食品学院');
INSERT INTO `department` VALUES ('6', '经贸学院');
INSERT INTO `department` VALUES ('7', '人文社会科学学院');
INSERT INTO `department` VALUES ('8', '外国语学院');
INSERT INTO `department` VALUES ('9', '艺术设计学院');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `homeworkId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lessonId` int(11) unsigned NOT NULL,
  `homeworkName` varchar(255) NOT NULL,
  `homeworkContent` varchar(2048) NOT NULL,
  `homeworkStartTime` datetime NOT NULL,
  `homeworkEndTime` datetime NOT NULL,
  PRIMARY KEY (`homeworkId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', '1', '实验一 Windows XP 系统管理', '为了帮助用户管理和监视系统，Windows XP提供了多种系统管理工具，其中最主要的有计算机管理、事件查看器和性能监视等。', '2017-07-11 14:34:11', '2017-07-14 14:34:20');
INSERT INTO `homework` VALUES ('2', '1', '实验二 Windows任务管理器的进程管理', '使用任务管理器，可以打开监视计算机性能的关键指示器，快速查看正在运行的程序的状态，或者终止已停止响应的程序。也可以使用多个参数评估正在运行的进程的活动，以及查看CPU 和内存使用情况的图形和数据。', '2017-07-11 14:35:10', '2017-07-16 14:35:15');
INSERT INTO `homework` VALUES ('3', '2', '第一题 整数', '输入一个正整数n（100<=n<=999），依次输出n的百位数字、十位数字、个位数字（以空格分隔）。', '2017-07-12 14:37:11', '2017-07-13 14:37:14');
INSERT INTO `homework` VALUES ('4', '2', '第二题 鸡兔同笼问题', '古代数学问题\"鸡兔同笼\"。鸡与兔共a只，鸡与兔的总脚数为b，输入a，b，求鸡兔各几只。', '2017-07-14 14:37:55', '2017-07-15 14:37:59');
INSERT INTO `homework` VALUES ('5', '2', '第三题 大写转小写', '输入大写字母，输出对应的小写字母。', '2017-07-14 14:38:30', '2017-07-15 14:38:40');
INSERT INTO `homework` VALUES ('6', '2', '第四题 求面积', '输入三角形的三条边长a，b，c（要求能构成三角形），求三角形面积', '2017-07-13 14:39:17', '2017-07-14 14:39:21');
INSERT INTO `homework` VALUES ('7', '6', '浅析XX企业供应链管理的问题及对策', '浅析XX企业供应链管理的问题及对策', '2017-07-12 14:41:00', '2017-07-13 14:41:02');
INSERT INTO `homework` VALUES ('8', '6', '浅析绿色供应链实施的困境与对策', '浅析绿色供应链实施的困境与对策', '2017-07-12 14:41:21', '2017-07-13 14:41:23');
INSERT INTO `homework` VALUES ('9', '6', '中小企业电子采购影响因素及对策分析', '中小企业电子采购影响因素及对策分析', '2017-07-13 14:41:39', '2017-07-14 14:41:41');
INSERT INTO `homework` VALUES ('10', '6', '供应商管理库存在连锁超市中的应用分析', '供应商管理库存在连锁超市中的应用分析', '2017-07-13 14:41:53', '2017-07-14 14:41:55');
INSERT INTO `homework` VALUES ('11', '6', '基于供应风险的供应商选择策略分析', '基于供应风险的供应商选择策略分析', '2017-07-14 14:42:13', '2017-07-15 14:42:18');
INSERT INTO `homework` VALUES ('12', '7', '第一章', '上传课后作业', '2017-07-12 14:44:34', '2017-07-15 14:44:36');
INSERT INTO `homework` VALUES ('13', '7', '第二章', '上传课后作业', '2017-07-12 14:45:10', '2017-07-15 14:45:13');
INSERT INTO `homework` VALUES ('14', '7', '第三章', '上传课后作业', '2017-07-13 14:45:42', '2017-07-16 14:45:44');
INSERT INTO `homework` VALUES ('15', '3', '循环从1加到100', '循环从1加到100', '2017-07-14 20:24:07', '2017-07-16 20:24:17');
INSERT INTO `homework` VALUES ('16', '4', '实验题目一', '声明一个类Complex，定义类Complex的两个对象c1和c2，对象c1通过构造函数指定复数的实部与虚 部（类私有数据成员为double型的real和image）为2.5及3.7，对象c2通过构造函数直接指定复数的实部与虚部为4.2及6.5。', '2017-07-15 09:25:42', '2017-07-15 09:25:47');
INSERT INTO `homework` VALUES ('17', '4', '实验题目二', '编写加法友元函数，以c1，c2对象为参数，调用时能返回两个复数对象相加操作。编写减法友元函数， 以c1，c2对象为参数，调用时能返回两个复数对象相减操作；编写取反成员函数，调用时能返回该复数的相反数（实部、虚部分别是原数的相反数）。', '2017-07-15 09:26:17', '2017-07-16 09:26:22');
INSERT INTO `homework` VALUES ('18', '4', '实验题目三', '定义成员函数print()，调用该函数时，以格式(real,image)输出当前对象。', '2017-07-16 09:26:47', '2017-07-16 09:26:50');
INSERT INTO `homework` VALUES ('19', '4', '实验题目四', '编写主程序，计算出复数对象c1与c2相减结果，并输出。然后计算c2的相反数与c1相加结果，并输出。', '2017-07-16 09:27:29', '2017-07-17 09:27:36');
INSERT INTO `homework` VALUES ('20', '5', '设计报告', '请同学们自选游戏设计题目，完成后打包上传', '2017-07-15 10:31:41', '2017-07-26 10:31:45');
INSERT INTO `homework` VALUES ('21', '8', '第一章选题', '试论述介质在不同损耗正切取值时的特性', '2017-07-19 14:31:56', '2017-07-19 14:31:59');
INSERT INTO `homework` VALUES ('22', '8', '第二章选题', '分别说明平面电磁波在无耗介质和有耗介质中的传播特性', '2017-07-18 14:33:09', '2017-07-19 14:33:12');
INSERT INTO `homework` VALUES ('23', '8', '第三章选题', '举例说明电磁波的极化的工程应用', '2017-07-14 14:33:40', '2017-07-17 14:33:42');
INSERT INTO `homework` VALUES ('24', '8', '第四题选题', '分别叙述麦克斯韦方程组微分形式的物理意义', '2017-07-16 14:51:32', '2017-07-17 14:51:35');
INSERT INTO `homework` VALUES ('25', '10', '第一章', '上传课后作业', '2017-07-15 14:59:18', '2017-07-18 14:59:21');
INSERT INTO `homework` VALUES ('26', '10', '第二章', '上传课后作业', '2017-07-18 14:59:39', '2017-07-18 14:59:41');
INSERT INTO `homework` VALUES ('27', '10', '第三章', '上传课后作业', '2017-07-17 15:00:00', '2017-07-19 15:00:03');
INSERT INTO `homework` VALUES ('28', '10', '第四章', '上传课后作业', '2017-07-18 15:00:17', '2017-07-20 15:00:19');
INSERT INTO `homework` VALUES ('29', '10', '第五章', '上传课后作业', '2017-07-18 15:00:34', '2017-07-18 15:00:36');
INSERT INTO `homework` VALUES ('30', '11', '第一章', '上传课后作业', '2017-07-18 15:06:03', '2017-07-18 15:06:05');
INSERT INTO `homework` VALUES ('31', '11', '第二章', '上传课后作业', '2017-07-18 15:06:18', '2017-07-19 15:06:24');
INSERT INTO `homework` VALUES ('32', '11', '第三章', '上传课后作业', '2017-07-14 15:06:45', '2017-07-17 15:06:49');
INSERT INTO `homework` VALUES ('33', '11', '第四章', '上传课后作业', '2017-07-16 15:07:07', '2017-07-18 15:07:11');
INSERT INTO `homework` VALUES ('34', '11', '第五章', '上传课后作业', '2017-07-13 15:07:36', '2017-07-17 15:07:39');
INSERT INTO `homework` VALUES ('35', '17', '第一题', '信息安全的目标是什么？', '2017-07-17 15:11:25', '2017-07-18 15:11:28');
INSERT INTO `homework` VALUES ('36', '17', '第二题', '信息安全的理论、技术和应用是什么关系？如何体现？', '2017-07-16 15:11:47', '2017-07-18 15:11:50');
INSERT INTO `homework` VALUES ('37', '17', '第三题', '设a～z的编号为1～26，空格为27，采用凯撒（Kaesar）密码算法为C=k1M+k2，取k1=3,k2=5,M=Peking University，计算密文C.', '2017-07-14 15:12:40', '2017-07-19 15:12:46');
INSERT INTO `homework` VALUES ('38', '17', '第四题', '编制一个DES算法，设密钥为SECURITY，明文为NETWORK INFORMATION SECURITY，计算密文，并列出每一轮的中间结果。', '2017-07-18 15:13:13', '2017-07-18 15:13:14');
INSERT INTO `homework` VALUES ('39', '17', '第五题', 'AES算法采用什么结构？与DES算法结构有何区别？', '2017-07-14 15:13:49', '2017-07-18 15:13:52');
INSERT INTO `homework` VALUES ('40', '17', '第六题', '试述并图示采用RSA、DES及SHA-1算法保护信息的机密性、完整性和抗否认性的原理。', '2017-07-16 15:25:42', '2017-07-18 15:25:45');
INSERT INTO `homework` VALUES ('41', '18', '题目一', '在认识论层次上研究信息的时候，必须同时考虑到 形式、含义和效用 三个方面的因素', '2017-07-16 15:28:41', '2017-07-18 15:28:43');
INSERT INTO `homework` VALUES ('42', '18', '题目二', ' 在认识论层次上研究信息的时候，必须同时考虑到 形式、含义和效用 三个方面的因素。', '2017-07-13 15:29:17', '2017-07-17 15:29:20');
INSERT INTO `homework` VALUES ('43', '18', '题目三', ' 在认识论层次上研究信息的时候，必须同时考虑到 形式、含义和效用 三个方面的因素。', '2017-07-14 15:29:35', '2017-07-17 15:29:38');
INSERT INTO `homework` VALUES ('44', '18', '题目四', '按照信息的性质，可以把信息分成 语法信息、语义信息和语用信息 。', '2017-07-17 15:29:53', '2017-07-18 15:29:56');
INSERT INTO `homework` VALUES ('45', '18', '题目五', '单符号离散信源一般用随机变量描述，而多符号离散信源一般用 随机矢量 描述。', '2017-07-16 15:30:13', '2017-07-18 15:30:17');
INSERT INTO `homework` VALUES ('46', '18', '题目六', '数据处理定理：当消息经过多级处理后，随着处理器数目的增多，输入消息与输出消息之间的平均互信息量 趋于变小 。', '2017-07-16 15:31:24', '2017-07-18 15:31:26');
INSERT INTO `homework` VALUES ('47', '20', '第一章', '试列举几个日常生活中的开环和闭环控制系统的例子，并说明其工作原理', '2017-07-16 15:32:51', '2017-07-18 15:32:54');
INSERT INTO `homework` VALUES ('48', '20', '第二章', '试判断下列微分方程所描述的系统属何种类型（线性、非线性；定常、时变）。 ', '2017-07-17 15:33:08', '2017-07-18 15:33:11');
INSERT INTO `homework` VALUES ('49', '20', '第三章', '下图是水位控制系统的示意图，图中1Q,2Q分别为进水流量和出水流量。控制的目的是保持水位为一定的高度。试说明该系统的工作原理并画出其方框图', '2017-07-16 15:33:34', '2017-07-18 15:33:37');
INSERT INTO `homework` VALUES ('50', '20', '第四章', '衡位置在关状态，门要打开时，“关门”开关打开，“开门”开关闭合。给定电位器与测量电位器输出不相等，其电信号经放大器比较放大，再经伺服电机和绞盘带动门改变位置，直到门完全', '2017-07-17 15:33:55', '2017-07-18 15:33:59');
INSERT INTO `homework` VALUES ('58', '1', 'fffffffff', 'ffff', '2017-07-21 01:34:31', '2017-08-10 01:34:31');
INSERT INTO `homework` VALUES ('59', '1', 'mybabys', '按时完成mybabys作业', '2017-07-21 01:36:55', '2017-08-10 01:36:55');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `lessonId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacherId` int(11) unsigned NOT NULL,
  `majorId` int(11) unsigned NOT NULL,
  `lessonName` varchar(255) NOT NULL,
  `lessonIntroduction` varchar(2048) NOT NULL,
  `lessonAnnouncement` varchar(2048) NOT NULL,
  `lessonPictureUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`lessonId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '5', '1', '计算机操作系统原理', '《计算机操作系统》是计算机专业的主干课程和核心课程，它主要描述操作系统软件对物理计算机实施的管理和控制，通过一定的技术和方法高效并充分利用机器的软硬件资源，它不仅在计算机知识结构中有重要的地位和作用，又是其它课程的重要基础。通过本课程的学习，使学生掌握计算机操作系统的基本概念和功能、各部分的工作原理和设计方法，为学生从事计算机软硬件的开发与研究打下坚实的基础。', '本课程适合有一定程序设计基础的人士', 'resource/lesson/1.jpg');
INSERT INTO `lesson` VALUES ('2', '5', '1', '面向对象程序设计-C++', '本课程以C++语言来介绍面向对象程序设计的原理和方法，内容包括面向对象程序设计基本原理和C++特有的语言特性。大致的章节包括基本理论、类与对象、构造与清除、函数、引用、继承与多态、拷贝构造、运算符重载、异常、模板和流等。本课程不涉及具体的C++开发环境，也不会涉及图形程序设计和网络程序设计等。', '本课程适合有一定程序设计基础的人士', 'resource/lesson/2.png');
INSERT INTO `lesson` VALUES ('3', '5', '1', '零基础学编程系列之C语言', '从汇编入手，系统的讲述C\\C++的原理，深入浅出，精辟而细致，是目前公认最好的C\\C++基础理论教程！', '本课程适合学习汇编C', 'resource/lesson/3.jpg');
INSERT INTO `lesson` VALUES ('4', '6', '2', '计算机科学导论', '本课程教导学生如何思考,如何更有效地解决问题。涉及广泛的编程问题集——C以及PHP和JavaScript。', '本课程适合没有基础的同学', 'resource/lesson/4.jpg');
INSERT INTO `lesson` VALUES ('5', '6', '3', '2D 游戏技术与应用', '2D 游戏技术概论，游戏地图系统，GUI 系统，战斗系统设计，任务系统，优秀的声音引擎 BASS，Cocos2D-X 引擎，Box2D 物理引擎。', '本课程适合没有基础的学生', 'resource/lesson/5.jpg');
INSERT INTO `lesson` VALUES ('6', '7', '4', '物流采购与供应管理', '采购与供应管理的目标不仅仅是控制成本和质量，促进企业的现金流动和保持良好的市场形象，更重要的是通过电子化在全球范围内整合供应资源，突破管理的极限，即有效资源的合理利用问题。因此，充分利用信息时代先进、高效的电子手段和技术工具，扩展供应网络成了当代采购管理的新方向。', '本课程适合初学者', 'resource/lesson/6.jpg');
INSERT INTO `lesson` VALUES ('7', '7', '5', '基础会计学', '本课程从会计学科体系及实际运用出发，根据基础会计学所要达到的教学目的和要求编写，主要涉及四大部分内容：一、会计基本理论知识；二、企业生产经营过程的基本核算方法；三、会计人员的基本技能知识；四、会计工作的组织。每部分内容都力求做到条理清楚，表达新颖，通俗易懂，举例密切联系实际。', '本课程适合初学者', 'resource/lesson/7.jpg');
INSERT INTO `lesson` VALUES ('8', '7', '9', '电磁场与电磁波', '本课程以“麦克斯韦”作为主线，从一般到具体（由静到动、由无界到有界、由无源到有源），系统地阐述了电磁场与电磁波的基本理论和分析方法，重点突出电磁场的传输特性。本课程主要内容包括电磁理论必要的数学基础、电磁场的基本问题、静态场、时变电磁场、平面电磁波、导行电磁波、电磁波的辐射。各章例题具体实用，并配有习题和参考答案。本书可作为高等院校通信与电子信息类及相关专业本科生的教材，也可供从事电磁场理论、微波技术、天线领域的工程技术人员学习和参考。', '本课程适合初学者', 'resource/lesson/8.jpg');
INSERT INTO `lesson` VALUES ('9', '7', '10', '电子电路eda技术与应用', '《电子电路eda技术与应用》内容包括eda技术概述、multisim7基本操作和分析方法、应用proteldxp设计电路原理图和印制电路板图、可编程逻辑器件简介、eda开发工具软件quartusⅡ的使用、eda技术的设计语言vhdl硬件描述语言简介、基于multisim7的虚拟实验与仿真及基于quartusⅡ的数字电路设计与仿真。', '本课程适合初学者', 'resource/lesson/9.jpg');
INSERT INTO `lesson` VALUES ('10', '10', '7', '企业融资实务操作大全及典型案例分析', '	一 理念篇中小企业如何面对融资难；融资新理念；企业如何正确融资?二 渠道篇债权、股权、内部；贸易、项目、政策、专业化协作、上市融资三实操篇   国内外银行贷款；杠杆收购融资；引进风险投资；票据融资实；夹层融资；售后回租式融资租赁；商业信用融资；补偿贸易融资；PPP项目融资；资产证券化；买壳上市融资。', '本课程适合初学者', 'resource/lesson/10.jpg');
INSERT INTO `lesson` VALUES ('11', '10', '6', '入职管理概述', '入职管理概述', '本课程适合初学者', 'resource/lesson/11.jpg');
INSERT INTO `lesson` VALUES ('12', '10', '6', '股权激励助中小企业打造魔力团队', '股权激励的概念，股权激励的本质，中小企业成功实施股权激励的前提——业务、员工、老板 ，中小企业股权激励实效标准——人才稳定率 ，股权激励方案的六个要素：定人、定股、定量、定价、定时、定考 ', '本课程适合初学者', 'resource/lesson/12.jpg');
INSERT INTO `lesson` VALUES ('13', '10', '4', '物流管理学视频教程', '物流管理学是以物流系统为研究对象，研究如何对物流活动进行管理、研究物流系统的规划与控制以及经营管理。物流管理的最根本的任务，就是要对物流活动进行规划和策划，组织实施，协调、指挥、和控制，保证物流活动正常有效地进行。', '本课程适合初学者', 'resource/lesson/13.jpg');
INSERT INTO `lesson` VALUES ('14', '10', '8', '现代通信原理与技术', '掌握通信系统的组成，分类，性能度量，及所要解决的基本问题', '本课程适合初学者', 'resource/lesson/14.jpg');
INSERT INTO `lesson` VALUES ('15', '10', '8', '数字摄影测量视频教程', '是基于数字影像和摄影测量的基本原理，应用计算机技术、数字影像处理、影像匹配、模式识别等多学科的理论与方法，提取所摄对象以数字方式表达的几何与物理信息的摄影测量学的分支学科。美国等国称之为软拷贝摄影测量（Softcopy Photogrammetry），我国王之卓教授称为全数字摄影测量（Full Digital Photogrammetry）。这种定义认为，在数字摄影测量过程中，不仅产品是数字的，而且中间数据的记录以及处理的原始资料均是数字的。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('16', '5', '8', 'Wireless and Mobile Networks', 'IFIP Joint Conference on Mobile and Wireless Communications Networks (MWCN\'2008) and Personal Wireless Communications (PWC\'2008), Toulouse, France, September 30 – October 2, 2008', '本课程适合初学者', 'resource/lesson/16.jpg');
INSERT INTO `lesson` VALUES ('17', '6', '9', '信息安全概论', '全面介绍信息安全的基本概念、原理和知识体系，主要内容包括信息保密技术、信息认证技术、密钥管理技术、访问控制技术、数据库安全、网络安全技术、信息安全标准和信息安全管理等内容。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('18', '6', '9', '信号检测与估计', '系统地介绍了信号检测与估计的基本理论。首先阐述了本课程的基础理论、随机信号分析及其统计描述。其次，介绍了经典检测、确知信号检测、随机参量信号检测、多重信号检测，以及序贯检测等基本检测理论和方法。最后，介绍了经典估计、信号参量估计、信号波形估计（维纳滤波、卡尔曼滤波和自适应滤波），以及功率谱估计等基本估计理论及方法。', '本课程适合初学者', 'resource/lesson/18.jpg');
INSERT INTO `lesson` VALUES ('19', '11', '9', '信息论与编码', '重点介绍由香农理论发展而来的信息论的基本理论以及编码的理论和实现原理。在介绍了有关信息度量的基础上，重点讨论了信道容量、率失真函数，以及无失真信源编码、限失真信源编码、信道编码和密码学中的理论知识及其实现原理。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('20', '11', '11', '自动控制原理', '自动控制理论是研究自动控制共同规律的技术科学。它的发展初期，是以反馈理论为基础的自动调节原理，主要用于工业控制。二战期间为了设计和制造飞机及船用自动驾驶仪、火炮定位系统、雷达跟踪系统以及其他基于反馈原理的军用设备，进一步促进并完善了自动控制理论的发展。到战后，已形成完整的自动控制理论体系，这就是以传递函数为基础的经典控制理论，它主要研究单输入单输出的线形定常数系统的分析和设计问题。', '本课程适合初学者', 'resource/lesson/20.jpg');
INSERT INTO `lesson` VALUES ('21', '11', '11', '机械理论力学', '理论力学是研究物体的机械运动及物体间相互机械作用的一般规律的学科.理论力学是一门理论性较强的技术基础课,随着科学技术的发展,工程专业中许多课程均以理论力学为基础.本课程的理论和方法对于解决现代工程问题具有重要意义.', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('22', '11', '13', '热质交换原理', '主要讲述热质交换的基本原理、基本规律和相关设备的理论和实践知识。热质交换原理与设备”课程是高等学校建筑环境与设备工程专业的主干技术基础课之一，起着连接本专业基础课和专业课的桥梁作用。', '本课程适合初学者', 'resource/lesson/22.jpg');
INSERT INTO `lesson` VALUES ('23', '11', '13', '速电机的研究与开发', '针对基于工控机的振动时效装置中激振电机的转速调节问题,设计了一套用于永磁直流激振电机的调速系统。该系统以AT89C52单片机为核心,利用PID调节器对转速进行控制。经测试,该系统稳定、可靠,且能满足精度要求,能配合永磁直流激振电机在振动时效中发挥作用。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('24', '11', '14', '机械理论力学', '围绕运动学、静力学和动力学展开，分析的手段主要是平面几何和牛顿第二定律。静力学研究受力的分析方法、力系的简化与平衡条件；运动学研究点和刚体的运动、点的合成运动分析法、刚体的平面运动分析；动力学研究质点与质点系的动力学方程、动力学普遍定理、动静法、虚位移原理、拉格朗日方程、振动基础。', '本课程适合初学者', 'resource/lesson/24.jpg');
INSERT INTO `lesson` VALUES ('25', '11', '14', '机械工程测试技术', '基础理论部分介绍检测方法、检测误差、数据处理、常用传感器等基础知识。应用技术部分介绍位移、速度、转速、压力、流量、应变、力、温度、湿度、开关量和数字量、几何量的检测方法，并介绍工程中常用的检测软件LabVIEW的使用方法。每章有学习目的、小结和思考题与习题，书后附录为实验指导书，可供各专业根据各自的教学要求组织实训。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('26', '12', '16', '分子生物学', '分子生物学（molecular biology)从分子水平研究生物大分子的结构与功能从而阐明生命现象本质的科学。自20世纪50年代以来，分子生物学是生物学的前沿与生长点，其主要研究领域包括蛋白质体系、蛋白质-核酸体系 （中心是分子遗传学)和蛋白质-脂质体系（即生物膜）。1953年沃森、克里克提出DNA分子的双螺旋结构模型是分子生物学诞生的标志。', '本课程适合初学者', 'resource/lesson/26.jpg');
INSERT INTO `lesson` VALUES ('27', '12', '16', '普通生物学', ' 生物的特征，生物界是一个多层次的组构系统，生物界的多级分类系统， 生物和它的环境形成相互联结的网络', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('28', '12', '16', '无机及分析化学', '内容主要为化学反应的基本原理、物质结构基础理论、溶液化学平衡、滴定分析、常用仪器分析、重要的生命元素等。为更好地体现教学基本要求，便于教师开展多媒体教学，本教材还提供配套的《无机及分析化学》课件。', '本课程适合初学者', 'resource/lesson/28.jpg');
INSERT INTO `lesson` VALUES ('29', '12', '6', '人力资源开发与管理', '包括绪论、人力资源规划、工作分析、人员招聘、绩效管理、薪酬管理、培训与开发、职业生涯管理、劳动关系管理和国际人力资源管理等。本教材充分体现应用实践导向，注重知识结构的全面性、编写体例的新颖性和内容素材的前沿性。《人力资源开发与管理》提供配套的教学大纲、PPT电子课件以及各章节案例分析题的参考答案。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('30', '12', '5', '企业文化与企业竞争力', '在新经济时代的今天，企业要想发展并在竞争中立于不败之地，必 须高度重视企业文化建设，充分发挥企业文化在市场竞争中的作用。企业的文化不会是一成不变的，它必将伴随着时代的进步和企业的发展而不断的发展和创新。21世纪企业竞争力将产生以企业文化为标志的变化。企业文化是企业竞争力的基础，企业竞争力是企业文化的价值体现，两者相互补充相互渗透', '本课程适合初学者', 'resource/lesson/30.jpg');
INSERT INTO `lesson` VALUES ('31', '13', '7', '国际会计准则', '会计是以货币为主要计量单位，以提高经济效益为主要目标，运用专门方法对企业，机关，事业单位和其他组织的经济活动进行全面，综合，连续，系统地核算和监督，提供会计信息，并随着社会经济的日益发展，逐步开著预测、决策、控制和分析的一种经济管理活动，是经济管理活动的重要组成部分。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('32', '13', '2', '计算机控制技术', '计算机控制技术是一门以电子技术、自动控制技术、计算机应用技术为基础，以计算机控制技术为核心，综合可编程控制技术、单片机技术、计算机网络技术，从而实现生产技术的精密化、生产设备的信息化、生产过程的自动化及机电控制系统的最佳化的专门学科。企业对具备较强的计算机控制技术应用能力专门人才需求很大。', '本课程适合初学者', 'resource/lesson/32.jpg');
INSERT INTO `lesson` VALUES ('33', '13', '3', '【数据结构】数据结构与算法', '数据结构和算法这门计算机必修课历来无论在哪个学校，都是无比乏味和催人入睡的。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('34', '13', '5', '商业谈判技巧', '商务谈判技巧是一门实用性较强，融多学科于一体的边缘科学，因此，怎样兼收并蓄、恰到好处地将多领域的相关知识科学地融入，是本书编写过程中重点处理的问题。 本书以学生为主体，注重学生的学习能力和实践能力培养，在教材的形式和内容组织方面作了探索性的改革。全书以课题的形式展开，每个课题分为案例与讨论、课题学习引导、课题实践页3个部分，内容包括认识谈判、掌握商务谈判心理、商务谈判的准备、商务谈判开局、商务谈判磋商、商务谈判的结束与签约、价格谈判、商务谈判的语言训练、商务谈判中的礼仪训练以及商务谈判的综合学习十个课题。 本书可以作为高职高专院校市场营销、经济及工商管理等相关专业的教材以及作为市场营销从业人员的学习用书。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('35', '13', '4', '商业银行业务', '商业银行业务是一本书。 本书第一部分和第二部分介绍了什么是银行和银行的功能，介绍了影响过去和未来金融结构的主要法律和如何评估一家银行业绩的方法，以及资产负债管理分析影响银行价值的因素和管理这种价值的技术。', '本课程适合初学者', 'resource/lesson/0.jpg');
INSERT INTO `lesson` VALUES ('36', '13', '6', '人事选拔与测评', '企业的主管领导者要把人才问题当成一种战略来考虑，授权人力资源管理部门成立由高层管理人员、企业专才和技术人员代表组成的专门评选机构，根据企业发展的需要，制定出严格的评选标准和要求，由人力资源部具体负责，严格按照程序来执行。', '本课程适合初学者', 'resource/lesson/0.jpg');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `majorId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departmentId` int(11) unsigned NOT NULL,
  `majorName` varchar(255) NOT NULL,
  PRIMARY KEY (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '1', '软件工程');
INSERT INTO `major` VALUES ('2', '1', '计算机科学与技术');
INSERT INTO `major` VALUES ('3', '1', '游戏开发');
INSERT INTO `major` VALUES ('4', '2', '物流管理');
INSERT INTO `major` VALUES ('5', '2', '工商管理');
INSERT INTO `major` VALUES ('6', '2', '人力资源管理');
INSERT INTO `major` VALUES ('7', '2', '财务管理');
INSERT INTO `major` VALUES ('8', '3', '通信工程    ');
INSERT INTO `major` VALUES ('9', '3', '电子信息工程   ');
INSERT INTO `major` VALUES ('10', '3', '电子科学与技术 ');
INSERT INTO `major` VALUES ('11', '3', '光电信息科学与工程');
INSERT INTO `major` VALUES ('12', '4', '自动化    ');
INSERT INTO `major` VALUES ('13', '4', '电气工程及其自动化');
INSERT INTO `major` VALUES ('14', '4', '机械设计制造及其自动化');
INSERT INTO `major` VALUES ('15', '5', '材料科学与工程 ');
INSERT INTO `major` VALUES ('16', '5', '生物制药');
INSERT INTO `major` VALUES ('17', '5', '食品质量与安全');
INSERT INTO `major` VALUES ('18', '5', '环境工程  ');
INSERT INTO `major` VALUES ('19', '5', '应用化学   ');
INSERT INTO `major` VALUES ('20', '6', '电子商务');
INSERT INTO `major` VALUES ('21', '6', '金融学');
INSERT INTO `major` VALUES ('22', '6', '国际经济与贸易 ');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `lessonId` int(11) unsigned NOT NULL,
  `targetUserId` int(11) unsigned NOT NULL,
  `floor` int(11) unsigned NOT NULL,
  `messageTime` datetime NOT NULL,
  `messageContent` varchar(2048) NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '1', '0', '1', '2017-07-12 15:14:15', '老师讲得这门课形象生动，有趣');
INSERT INTO `message` VALUES ('2', '2', '1', '1', '1', '2017-07-13 15:17:28', '是的，值得一听');
INSERT INTO `message` VALUES ('3', '3', '1', '1', '1', '2017-07-13 15:18:27', '同感，感同');
INSERT INTO `message` VALUES ('4', '2', '1', '0', '2', '2017-07-12 15:19:00', '我也自己评论');
INSERT INTO `message` VALUES ('5', '3', '1', '2', '2', '2017-07-12 15:19:32', '词穷了，我可以背古诗吗');
INSERT INTO `message` VALUES ('6', '1', '1', '2', '2', '2017-07-13 15:21:07', '我欲乘风破浪，又恐琼楼玉宇');
INSERT INTO `message` VALUES ('7', '4', '1', '0', '3', '2017-07-12 15:22:01', '我来评论了, 评论一些什么呢,我就瞎鸡巴评论，你吹我啊');
INSERT INTO `message` VALUES ('8', '3', '1', '4', '3', '2017-07-13 15:23:35', '看我七十二种屌样');
INSERT INTO `message` VALUES ('9', '1', '2', '0', '1', '2017-07-12 15:24:34', '故人西辞黄鹤楼，烟花三月下扬州');
INSERT INTO `message` VALUES ('10', '2', '2', '0', '2', '2017-07-13 15:26:06', '电脑中毒啦啦啦啦');
INSERT INTO `message` VALUES ('11', '2', '2', '2', '2', '2017-07-13 15:27:16', '对酒当歌，人生几何，譬如朝暮，去日苦多。');
INSERT INTO `message` VALUES ('12', '1', '2', '2', '2', '2017-07-13 15:29:27', '慨当以慷，忧思难忘，何以解忧，唯有杜康');
INSERT INTO `message` VALUES ('13', '3', '2', '1', '1', '2017-07-13 15:30:29', '青青子衿，悠悠我心。但为君故，沉吟至今。');
INSERT INTO `message` VALUES ('14', '4', '2', '0', '3', '2017-07-13 15:32:02', '呦呦鹿鸣，食野之苹。 我有嘉宾，鼓瑟吹笙。');
INSERT INTO `message` VALUES ('15', '2', '2', '0', '4', '2017-07-12 15:32:31', '明明如月，何时可掇？忧从中来，不可断绝。');
INSERT INTO `message` VALUES ('16', '1', '3', '0', '1', '2017-07-12 15:33:12', '越陌度阡，枉用相存。契阔谈，心念旧恩。');
INSERT INTO `message` VALUES ('17', '2', '3', '0', '2', '2017-07-13 15:33:29', '月明星稀，乌鹊南飞。绕树三匝，何枝可依？');
INSERT INTO `message` VALUES ('18', '1', '3', '0', '3', '2017-07-12 15:33:50', '山不厌高，海不厌深。周公吐哺，天下归心。');
INSERT INTO `message` VALUES ('19', '3', '3', '2', '2', '2017-07-13 15:34:07', '天南地北，问乾坤，何处可容狂客？借得山东烟水寨，来买凤城春色。');
INSERT INTO `message` VALUES ('20', '4', '3', '0', '4', '2017-07-13 15:43:39', '禁街箫鼓，寒轻夜永，纤手重携。更阑人散，千门笑语，声在帘帏。');
INSERT INTO `message` VALUES ('21', '2', '3', '0', '5', '2017-07-13 15:44:10', '春透水波明，寒峭花枝瘦。极目烟中百尺楼，人在楼中否。 ');
INSERT INTO `message` VALUES ('22', '1', '4', '0', '1', '2017-07-12 15:45:26', '江上往来人，但爱鲈鱼美。君看一叶舟，出没风波里。');
INSERT INTO `message` VALUES ('23', '1', '4', '0', '2', '2017-07-12 15:45:37', '日暮苍山远，天寒白屋贫。');
INSERT INTO `message` VALUES ('24', '2', '4', '1', '1', '2017-07-12 15:46:14', '离人无语月无声，明月有光人有情。别后相思人似月，云间水上到层城。');
INSERT INTO `message` VALUES ('25', '2', '4', '0', '3', '2017-07-12 15:46:26', '困花压蕊丝丝雨，不堪只共愁人语。斗帐抱春寒，梦中何处山。卷帘风意恶，泪与残红落。羡煞是杨花，输它先到家。');
INSERT INTO `message` VALUES ('26', '3', '4', '1', '1', '2017-07-13 15:46:58', '千尺盘桓到上方，云居萧索实堪伤。');
INSERT INTO `message` VALUES ('27', '3', '4', '0', '4', '2017-07-14 15:47:39', '锦里烟尘外，江村八九家。圆荷浮小叶，细麦落轻花。');
INSERT INTO `message` VALUES ('28', '3', '4', '2', '1', '2017-07-13 15:47:48', '卜宅从兹老，为农去国赊。远惭勾漏令，不得问丹砂。');
INSERT INTO `message` VALUES ('29', '4', '4', '0', '5', '2017-07-12 15:48:26', '纤云弄巧，飞星传恨，银汉迢迢暗度。金风玉露一相逢，便胜却人间无数。(度 通：渡)柔情似水，佳期如梦，忍顾鹊桥归路。两情若是久长时，又岂在朝朝暮暮。');
INSERT INTO `message` VALUES ('30', '4', '4', '3', '1', '2017-07-11 15:48:42', '中秋月。月到中秋偏皎洁。偏皎洁，知他多少，阴晴圆缺。阴晴圆缺都休说，且喜人间好时节。好时节，愿得年年，常见中秋月。');
INSERT INTO `message` VALUES ('31', '5', '1', '3', '1', '2017-07-20 16:51:21', 'qwe');
INSERT INTO `message` VALUES ('32', '5', '1', '4', '3', '2017-07-20 16:56:18', '123');
INSERT INTO `message` VALUES ('33', '5', '1', '3', '3', '2017-07-20 16:57:01', '呵呵');
INSERT INTO `message` VALUES ('34', '5', '1', '5', '3', '2017-07-20 16:58:24', '啊手动阀手动阀');
INSERT INTO `message` VALUES ('35', '5', '1', '0', '4', '2017-07-20 17:07:21', '我是老师');
INSERT INTO `message` VALUES ('36', '5', '1', '5', '4', '2017-07-20 17:07:28', '我才是老师');
INSERT INTO `message` VALUES ('37', '5', '1', '5', '4', '2017-07-20 17:07:43', '刷新');
INSERT INTO `message` VALUES ('38', '3', '2', '2', '4', '2017-07-21 07:59:05', 'mybatis');
INSERT INTO `message` VALUES ('39', '5', '3', '2', '5', '2017-07-21 08:41:08', '你完蛋了，你毕不了业了');

-- ----------------------------
-- Table structure for privatemessage
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage`;
CREATE TABLE `privatemessage` (
  `privateMessageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `targetUserId` int(11) unsigned NOT NULL,
  `readed` tinyint(1) unsigned NOT NULL,
  `privateMessageTime` datetime NOT NULL,
  `privateMessageContent` varchar(2048) NOT NULL,
  PRIMARY KEY (`privateMessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privatemessage
-- ----------------------------
INSERT INTO `privatemessage` VALUES ('1', '1', '2', '0', '2017-07-12 16:15:20', '说点什么呢');
INSERT INTO `privatemessage` VALUES ('2', '2', '1', '0', '2017-07-12 16:15:43', '来背背古诗吧');
INSERT INTO `privatemessage` VALUES ('3', '1', '1', '0', '2017-07-13 16:16:13', '滚');
INSERT INTO `privatemessage` VALUES ('4', '2', '1', '0', '2017-07-14 16:34:59', '此水几时休，此恨何时已。');
INSERT INTO `privatemessage` VALUES ('5', '1', '2', '0', '2017-07-13 16:36:06', '给我赶紧滚');
INSERT INTO `privatemessage` VALUES ('6', '2', '3', '0', '2017-07-13 16:47:36', '，我是某某保险公司的，请问你平常出门都用什么交通工具');
INSERT INTO `privatemessage` VALUES ('7', '3', '2', '0', '2017-07-13 16:48:28', '轮椅');
INSERT INTO `privatemessage` VALUES ('8', '2', '3', '0', '2017-07-13 16:48:40', '.。。。。。。。。');
INSERT INTO `privatemessage` VALUES ('9', '2', '3', '0', '2017-07-13 16:48:51', '不好意思打扰了');
INSERT INTO `privatemessage` VALUES ('10', '1', '3', '0', '2017-07-12 16:57:34', '怎么查看自己的血型呢');
INSERT INTO `privatemessage` VALUES ('11', '3', '1', '0', '2017-07-13 16:57:57', '回家，找你爸要畜生证');
INSERT INTO `privatemessage` VALUES ('12', '2', '4', '0', '2017-07-14 16:58:55', '在干嘛呢');
INSERT INTO `privatemessage` VALUES ('13', '4', '2', '0', '2017-07-14 16:59:08', 'JB');
INSERT INTO `privatemessage` VALUES ('14', '2', '4', '0', '2017-07-14 17:00:13', '说啥呢，注意言辞');
INSERT INTO `privatemessage` VALUES ('15', '4', '2', '0', '2017-07-14 17:00:36', '加班');
INSERT INTO `privatemessage` VALUES ('16', '2', '5', '0', '2017-07-21 08:01:26', '老师你教的真好！');
INSERT INTO `privatemessage` VALUES ('17', '3', '5', '0', '2017-07-21 08:37:11', '老师，我想问下关于网站的自适应');
INSERT INTO `privatemessage` VALUES ('18', '3', '7', '1', '2017-07-21 08:39:14', '老师，老师，你好呀');
INSERT INTO `privatemessage` VALUES ('19', '5', '4', '1', '2017-07-21 08:39:35', '卧槽');
INSERT INTO `privatemessage` VALUES ('20', '2', '3', '1', '2017-07-21 08:40:52', '今天就要解放啦！嗨森');
INSERT INTO `privatemessage` VALUES ('21', '5', '1', '1', '2017-07-21 08:42:32', '等死吧');
INSERT INTO `privatemessage` VALUES ('22', '3', '2', '1', '2017-07-21 08:43:32', '问一对男女：如果死后，在奈何桥看到孟婆，给你喝孟婆汤，你说什么？女友：不要让我忘掉亲人，好吗？男友：不要香菜和葱花，谢谢！');
INSERT INTO `privatemessage` VALUES ('23', '2', '3', '1', '2017-07-21 08:44:20', '给力给力。第四组的成员棒棒哒');
INSERT INTO `privatemessage` VALUES ('24', '1', '2', '1', '2017-07-21 08:48:34', '我在这  煞笔');
INSERT INTO `privatemessage` VALUES ('25', '2', '1', '0', '2017-07-21 08:48:46', '快来找我');
INSERT INTO `privatemessage` VALUES ('26', '1', '2', '1', '2017-07-21 08:50:21', 'wofale');

-- ----------------------------
-- Table structure for studenthomeworkrelation
-- ----------------------------
DROP TABLE IF EXISTS `studenthomeworkrelation`;
CREATE TABLE `studenthomeworkrelation` (
  `studentHomeworkRelationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentId` int(11) unsigned NOT NULL,
  `homeworkId` int(11) unsigned NOT NULL,
  `submitTime` datetime NOT NULL,
  `score` int(11) unsigned NOT NULL,
  PRIMARY KEY (`studentHomeworkRelationId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studenthomeworkrelation
-- ----------------------------
INSERT INTO `studenthomeworkrelation` VALUES ('1', '1', '1', '2017-07-13 14:51:30', '1');
INSERT INTO `studenthomeworkrelation` VALUES ('2', '1', '2', '2017-07-13 14:52:01', '1');
INSERT INTO `studenthomeworkrelation` VALUES ('3', '2', '3', '2017-07-13 14:52:44', '1');
INSERT INTO `studenthomeworkrelation` VALUES ('4', '2', '4', '2017-07-13 14:52:50', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('5', '2', '1', '2017-07-13 14:53:16', '4');
INSERT INTO `studenthomeworkrelation` VALUES ('6', '3', '3', '2017-07-13 14:53:53', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('7', '3', '5', '2017-07-13 14:53:57', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('8', '4', '2', '2017-07-13 14:54:26', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('9', '4', '13', '2017-07-13 14:54:38', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('10', '4', '14', '2017-07-13 14:54:42', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('11', '4', '2', '2017-07-13 14:55:12', '2');
INSERT INTO `studenthomeworkrelation` VALUES ('12', '4', '3', '2017-07-13 14:55:16', '0');
INSERT INTO `studenthomeworkrelation` VALUES ('13', '2', '58', '2017-07-21 07:22:17', '4');

-- ----------------------------
-- Table structure for studentlessonrelation
-- ----------------------------
DROP TABLE IF EXISTS `studentlessonrelation`;
CREATE TABLE `studentlessonrelation` (
  `studentLessonRelationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentId` int(11) unsigned NOT NULL,
  `lessonId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`studentLessonRelationId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentlessonrelation
-- ----------------------------
INSERT INTO `studentlessonrelation` VALUES ('1', '1', '1');
INSERT INTO `studentlessonrelation` VALUES ('2', '1', '3');
INSERT INTO `studentlessonrelation` VALUES ('3', '2', '1');
INSERT INTO `studentlessonrelation` VALUES ('4', '2', '3');
INSERT INTO `studentlessonrelation` VALUES ('5', '2', '4');
INSERT INTO `studentlessonrelation` VALUES ('6', '2', '2');
INSERT INTO `studentlessonrelation` VALUES ('7', '3', '2');
INSERT INTO `studentlessonrelation` VALUES ('8', '3', '3');
INSERT INTO `studentlessonrelation` VALUES ('9', '3', '4');
INSERT INTO `studentlessonrelation` VALUES ('10', '3', '5');
INSERT INTO `studentlessonrelation` VALUES ('11', '4', '8');
INSERT INTO `studentlessonrelation` VALUES ('12', '4', '7');
INSERT INTO `studentlessonrelation` VALUES ('13', '4', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userUsername` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userType` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userSex` varchar(255) NOT NULL,
  `userAge` int(11) unsigned NOT NULL,
  `userBirthday` date NOT NULL,
  `userPhone` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userSchool` varchar(255) NOT NULL,
  `userAddress` varchar(255) NOT NULL,
  `userIntroduction` varchar(2048) NOT NULL,
  `userPictureUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2011001', '123456', '学生', '魏铮淑', '女', '22', '1995-04-05', '18475830053', '1049131557@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/1.jpg');
INSERT INTO `user` VALUES ('2', '2011002', '123456', '学生', '钟碧珍', '女', '22', '1995-04-12', '18475862054', '1049131558@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/2.jpg');
INSERT INTO `user` VALUES ('3', '2011003', '123456', '学生', '陈伟鋆', '男', '22', '1995-11-20', '18475869584', '1049131556@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/3.jpg');
INSERT INTO `user` VALUES ('4', '2011004', '123456', '学生', '周琳滔', '男', '22', '1995-05-07', '18475869354', '10492157486@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/4.jpg');
INSERT INTO `user` VALUES ('5', '1011001', '123456', '老师', '张老师', '男', '32', '1985-06-07', '15325485679', '2513568459@qq.com', '电子科技大学中山学院', '广东省中山市', '我TM王五棍就是一个发HEAT', 'resource/user/5.gif');
INSERT INTO `user` VALUES ('6', '1011002', '123456', '老师', '何老师', '男', '31', '1986-07-03', '17456254869', '1254865896@qq.com', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/6.jpg');
INSERT INTO `user` VALUES ('7', '1011003', '123456', '老师', '陈老师', '女', '31', '1986-08-05', '15475869584', '1024563254@qq.com', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/7.jpg');
INSERT INTO `user` VALUES ('8', '2011005', '123456', '学生', '夏木炎', '男', '22', '1995-07-17', '13125469542', '2036415847@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/8.jpg');
INSERT INTO `user` VALUES ('9', '2011006', '123456', '学生', '尜何', '男', '22', '1995-05-05', '14758965248', '36425489657@qq.com', '电子科技大学中山学院', '广东省中山市', '我是学生', 'resource/user/9.jpg');
INSERT INTO `user` VALUES ('10', '1011004', '123456', '老师', '李老师', '男', '31', '1987-06-05', '13625487589', '10546221546@qq.com', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/0.jpg');
INSERT INTO `user` VALUES ('11', '1011005', '123456', '老师', '叶老师', '女', '31', '1987-08-04', '15484576856', '32502154225@qq.com', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/0.jpg');
INSERT INTO `user` VALUES ('12', '1011006', '123456', '老师', '黄老师', '男', '31', '1986-04-03', '15486859675', '12352456256@qq.com', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/12.gif');
INSERT INTO `user` VALUES ('13', '1011007', '123456', '老师', '柯老师', '女', '31', '1987-06-09', '157856895354', '15234896758@qq.cpm', '电子科技大学中山学院', '广东省中山市', '我是老师', 'resource/user/0.jpg');

-- ----------------------------
-- Table structure for userfocusrelation
-- ----------------------------
DROP TABLE IF EXISTS `userfocusrelation`;
CREATE TABLE `userfocusrelation` (
  `userFocusRelationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `targetUserId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`userFocusRelationId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userfocusrelation
-- ----------------------------
INSERT INTO `userfocusrelation` VALUES ('1', '1', '4');
INSERT INTO `userfocusrelation` VALUES ('2', '1', '2');
INSERT INTO `userfocusrelation` VALUES ('3', '1', '3');
INSERT INTO `userfocusrelation` VALUES ('4', '1', '5');
INSERT INTO `userfocusrelation` VALUES ('5', '1', '7');
INSERT INTO `userfocusrelation` VALUES ('6', '1', '9');
INSERT INTO `userfocusrelation` VALUES ('7', '2', '1');
INSERT INTO `userfocusrelation` VALUES ('8', '2', '4');
INSERT INTO `userfocusrelation` VALUES ('9', '2', '5');
INSERT INTO `userfocusrelation` VALUES ('10', '2', '7');
INSERT INTO `userfocusrelation` VALUES ('11', '2', '11');
INSERT INTO `userfocusrelation` VALUES ('12', '1', '12');
INSERT INTO `userfocusrelation` VALUES ('13', '2', '12');
INSERT INTO `userfocusrelation` VALUES ('14', '3', '1');
INSERT INTO `userfocusrelation` VALUES ('15', '3', '2');
INSERT INTO `userfocusrelation` VALUES ('16', '3', '5');
INSERT INTO `userfocusrelation` VALUES ('17', '3', '7');
INSERT INTO `userfocusrelation` VALUES ('18', '3', '6');
INSERT INTO `userfocusrelation` VALUES ('19', '3', '8');
INSERT INTO `userfocusrelation` VALUES ('20', '3', '13');
INSERT INTO `userfocusrelation` VALUES ('21', '4', '1');
INSERT INTO `userfocusrelation` VALUES ('22', '4', '7');
INSERT INTO `userfocusrelation` VALUES ('23', '4', '8');
INSERT INTO `userfocusrelation` VALUES ('24', '4', '6');
INSERT INTO `userfocusrelation` VALUES ('25', '4', '3');
INSERT INTO `userfocusrelation` VALUES ('26', '5', '2');
INSERT INTO `userfocusrelation` VALUES ('27', '5', '3');
INSERT INTO `userfocusrelation` VALUES ('28', '5', '8');
INSERT INTO `userfocusrelation` VALUES ('29', '6', '8');
INSERT INTO `userfocusrelation` VALUES ('30', '6', '9');
INSERT INTO `userfocusrelation` VALUES ('31', '7', '10');
INSERT INTO `userfocusrelation` VALUES ('32', '7', '11');
INSERT INTO `userfocusrelation` VALUES ('33', '8', '10');
INSERT INTO `userfocusrelation` VALUES ('34', '9', '10');
INSERT INTO `userfocusrelation` VALUES ('35', '9', '2');
INSERT INTO `userfocusrelation` VALUES ('36', '9', '1');
INSERT INTO `userfocusrelation` VALUES ('37', '8', '1');
INSERT INTO `userfocusrelation` VALUES ('38', '10', '1');
INSERT INTO `userfocusrelation` VALUES ('39', '10', '11');
INSERT INTO `userfocusrelation` VALUES ('40', '11', '12');
INSERT INTO `userfocusrelation` VALUES ('41', '11', '13');
INSERT INTO `userfocusrelation` VALUES ('42', '12', '3');
INSERT INTO `userfocusrelation` VALUES ('43', '12', '4');
INSERT INTO `userfocusrelation` VALUES ('44', '12', '1');
INSERT INTO `userfocusrelation` VALUES ('45', '12', '8');
INSERT INTO `userfocusrelation` VALUES ('46', '13', '5');
INSERT INTO `userfocusrelation` VALUES ('47', '13', '7');
INSERT INTO `userfocusrelation` VALUES ('48', '13', '9');
INSERT INTO `userfocusrelation` VALUES ('49', '13', '10');
INSERT INTO `userfocusrelation` VALUES ('50', '13', '12');
INSERT INTO `userfocusrelation` VALUES ('51', '2', '3');
INSERT INTO `userfocusrelation` VALUES ('53', '5', '1');
