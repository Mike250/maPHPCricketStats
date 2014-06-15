-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: 10.6.171.115
-- Generation Time: Oct 24, 2008 at 02:47 AM
-- Server version: 4.1.22
-- PHP Version: 4.4.4
-- 
-- Database: `cricketclub`
-- 
CREATE DATABASE `cricketclub` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cricketclub`;

-- --------------------------------------------------------

-- 
-- Table structure for table `TempTable`
-- 

CREATE TABLE `TempTable` (
  `ID` int(11) NOT NULL auto_increment,
  `player_id` int(11) default NULL,
  `playerlname` varchar(50) default NULL,
  `playerfname` varchar(50) default NULL,
  `ConcatID` int(11) default '0',
  `ConcatName` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=HEAP  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `TempTable`
-- 

INSERT INTO `TempTable` VALUES (1, 1, 'Doig', 'Michael', 11, '1st Grade (1Day)');
INSERT INTO `TempTable` VALUES (2, 1, 'Doig', 'Michael', 12, '1st Grade (2Day)');
INSERT INTO `TempTable` VALUES (3, 1, 'Doig', 'Michael', 15, '1st Grade (SCG)');
INSERT INTO `TempTable` VALUES (4, 1, 'Doig', 'Michael', 13, '1st Grade (T20)');

-- --------------------------------------------------------

-- 
-- Table structure for table `TempTable1`
-- 

CREATE TABLE `TempTable1` (
  `ID` int(11) NOT NULL auto_increment,
  `player_id` int(11) default NULL,
  `playerlname` varchar(50) default NULL,
  `playerfname` varchar(50) default NULL,
  `ConcatID` int(11) default '0',
  `ConcatName` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=HEAP  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `TempTable1`
-- 

INSERT INTO `TempTable1` VALUES (1, 1, 'Doig', 'Michael', 11, '1st Grade (1Day)');
INSERT INTO `TempTable1` VALUES (2, 1, 'Doig', 'Michael', 12, '1st Grade (2Day)');
INSERT INTO `TempTable1` VALUES (3, 1, 'Doig', 'Michael', 15, '1st Grade (SCG)');
INSERT INTO `TempTable1` VALUES (4, 1, 'Doig', 'Michael', 13, '1st Grade (T20)');

-- --------------------------------------------------------

-- 
-- Table structure for table `admin`
-- 

CREATE TABLE `admin` (
  `email` varchar(255) NOT NULL default '',
  `fname` varchar(50) NOT NULL default '',
  `lname` varchar(50) NOT NULL default '',
  `pword` varchar(128) NOT NULL default '',
  `flags` varchar(128) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `laston` datetime NOT NULL default '0000-00-00 00:00:00',
  `ison` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`email`),
  UNIQUE KEY `email_2` (`email`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1;

-- 
-- Dumping data for table `admin`
-- 

INSERT INTO `admin` VALUES ('mdoig', 'Michael', 'Doig', 'PoLujRjLFW7Zg', '1^1^1^0^0^1^1^1^1^1^0^0^0^0^1^1^1^1^1^1^1^1^1^0^0^0^0^0^0^0^0^0^1^0^0^1^0^1^1^1^1^1^0^0^0^1^1', '2001-02-13 11:04:20', '2008-10-23 22:24:02', 1);
INSERT INTO `admin` VALUES ('nryan', 'Neil', 'Ryan', 'crrtvONl/tUOc', '1^1^1^0^0^1^1^1^1^1^0^0^0^0^1^1^1^1^1^1^1^1^1^0^0^0^0^0^0^0^0^0^1^0^0^1^0^1^1^0^0^1^0^0^0^1^1', '2008-10-02 06:36:55', '2008-10-14 16:39:59', 1);
INSERT INTO `admin` VALUES ('mrollestone', 'Mark', 'Rollestone', 'crrtvONl/tUOc', '1^1^1^0^0^1^1^1^1^1^0^0^0^0^1^1^1^1^1^1^1^1^1^0^0^0^0^0^0^0^0^0^1^0^0^1^0^1^1^0^0^1^0^0^0^1^1', '2008-10-07 19:02:18', '2008-10-19 22:52:58', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `awards`
-- 

CREATE TABLE `awards` (
  `AwardID` int(4) NOT NULL auto_increment,
  `AwardPlayer` int(4) NOT NULL default '0',
  `AwardTitle` int(4) NOT NULL default '0',
  `AwardDetail` longtext NOT NULL,
  `added` date NOT NULL default '0000-00-00',
  `season` int(4) NOT NULL default '0',
  PRIMARY KEY  (`AwardID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

-- 
-- Dumping data for table `awards`
-- 

INSERT INTO `awards` VALUES (1, 2, 1, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (2, 93, 1, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (3, 173, 2, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (4, 14, 3, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (5, 9, 4, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (6, 217, 5, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (7, 417, 6, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (8, 79, 7, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (9, 43, 9, '28 Wickets @ 18.46\r\nBest 4/29', '2008-10-13', 7);
INSERT INTO `awards` VALUES (10, 14, 11, '21 Wickets @ 13.76\r\nBest 6/30', '2008-10-13', 7);
INSERT INTO `awards` VALUES (11, 7, 10, '229 Runs @ 19.08\r\nHS - 70', '2008-10-13', 7);
INSERT INTO `awards` VALUES (12, 304, 12, '334 Runs @ 20.88\r\nHS - 54', '2008-10-13', 7);
INSERT INTO `awards` VALUES (13, 81, 13, '32 Wickets @ 13.69\r\nBest 3/7', '2008-10-13', 7);
INSERT INTO `awards` VALUES (14, 9, 8, '363 Runs @ 40.33  \r\nHS - 79', '2008-10-13', 7);
INSERT INTO `awards` VALUES (15, 342, 15, '16 Wickets @ 11.19\r\nBest 5/30', '2008-10-13', 7);
INSERT INTO `awards` VALUES (16, 299, 14, '277 Runs @ 16.29\r\nHS - 43', '2008-10-13', 7);
INSERT INTO `awards` VALUES (17, 344, 21, '', '2008-10-13', 7);
INSERT INTO `awards` VALUES (18, 41, 23, '113* v Helensburgh\r\nHelensburgh Oval\r\n10th March 2007', '2008-10-13', 7);
INSERT INTO `awards` VALUES (19, 79, 12, 'Innings: 12  	\r\n<br>Notout: 1  	\r\n<br>Runs: 219  	\r\n<br>HS - 94  	\r\n<br>Avg: 19.91  	\r\n<br>50\\''s: 1\r\n\r\n<a href=\\"http://statistics.php?statistics=2007/08&amp;team=3&amp;ccl_mode=2\\"><br></a>', '2008-10-13', 8);
INSERT INTO `awards` VALUES (20, 81, 13, 'Overs: 105  	\r\n<br>Maidens: 28  	\r\n<br>Runs: 274  	\r\n<br>Wickets: 20  	\r\n<br>Average: 13.70 <br> 	\r\nBest: 5-29  	\r\n<br>4WI: 1 <br> 	\r\n5WI: 1  	\r\n<br>Eco: 2.61<br>', '2008-10-13', 8);
INSERT INTO `awards` VALUES (21, 342, 14, '', '2008-10-13', 8);
INSERT INTO `awards` VALUES (22, 309, 21, '', '2008-10-13', 8);
INSERT INTO `awards` VALUES (23, 104, 5, '', '2008-10-13', 8);
INSERT INTO `awards` VALUES (24, 3, 4, '', '2008-10-13', 8);
INSERT INTO `awards` VALUES (25, 8, 6, '14 Catches', '2008-10-13', 8);
INSERT INTO `awards` VALUES (26, 300, 7, '', '2008-10-13', 8);
INSERT INTO `awards` VALUES (27, 28, 1, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (28, 427, 2, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (29, 45, 4, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (30, 67, 5, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (31, 428, 6, '14 Catches', '2008-10-14', 5);
INSERT INTO `awards` VALUES (32, 303, 7, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (33, 427, 8, '473 Runs @ 52.56\r\nHS - 166', '2008-10-14', 5);
INSERT INTO `awards` VALUES (34, 429, 9, '44 Wickets @ 13.02\r\nBest - 6/23', '2008-10-14', 5);
INSERT INTO `awards` VALUES (35, 430, 10, '239 Runs @ 26.56\r\nHS - 69*', '2008-10-14', 5);
INSERT INTO `awards` VALUES (36, 45, 11, '43 Wickets @ 10.23\r\nBest - 7/27', '2008-10-14', 5);
INSERT INTO `awards` VALUES (37, 278, 12, '140 Runs @ 17.50\r\nHS - 34', '2008-10-14', 5);
INSERT INTO `awards` VALUES (38, 7, 13, '18 Wickets @ 10.17\r\nBest - 5/18', '2008-10-14', 5);
INSERT INTO `awards` VALUES (39, 431, 14, '210 Runs @ 11.05\r\nHS - 74', '2008-10-14', 5);
INSERT INTO `awards` VALUES (40, 304, 15, '17 Wickets @ 14.71\r\nBest - 4/13', '2008-10-14', 5);
INSERT INTO `awards` VALUES (41, 427, 18, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (42, 45, 19, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (43, 7, 20, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (44, 304, 21, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (45, 427, 23, '166 v Wests Illawarra\r\nHollymount Park\r\n9th October 2004', '2008-10-14', 5);
INSERT INTO `awards` VALUES (46, 433, 23, '106* v Wests Illawarra\r\nFigtree Oval\r\n7th November 2004', '2008-10-14', 5);
INSERT INTO `awards` VALUES (47, 434, 23, '113* v Balgownie\r\nDalton Park\r\n20th November 2004', '2008-10-14', 5);
INSERT INTO `awards` VALUES (48, 2, 23, '101 v Keira A\r\nGibson Park\r\n18th December 2004', '2008-10-14', 5);
INSERT INTO `awards` VALUES (49, 45, 24, '10/41 v Port Kembla\r\nKing George V Oval\r\n26/2/2004 & 5/3/2004', '2008-10-14', 5);
INSERT INTO `awards` VALUES (50, 428, 25, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (51, 12, 26, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (52, 432, 27, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (53, 303, 28, '', '2008-10-14', 5);
INSERT INTO `awards` VALUES (54, 28, 1, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (55, 43, 2, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (56, 435, 4, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (57, 436, 5, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (58, 173, 6, '9 Catches', '2008-10-14', 6);
INSERT INTO `awards` VALUES (59, 11, 7, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (60, 173, 8, '330 Runs @ 16.50\r\nHS - 78', '2008-10-14', 6);
INSERT INTO `awards` VALUES (61, 28, 9, '15 Wickets @ 16.33\r\nBest - 5/30', '2008-10-14', 6);
INSERT INTO `awards` VALUES (62, 93, 10, '246 Runs @ 27.33\r\nHS - 55', '2008-10-14', 6);
INSERT INTO `awards` VALUES (63, 6, 11, '20 Wickets @ 12.25\r\nBest - 6/11', '2008-10-14', 6);
INSERT INTO `awards` VALUES (64, 304, 12, '262 Runs @ 17.47\r\nHS - 52', '2008-10-14', 6);
INSERT INTO `awards` VALUES (65, 298, 13, '16 Wickets @ 15.81\r\nBest - 4/15', '2008-10-14', 6);
INSERT INTO `awards` VALUES (66, 437, 14, '329 Runs @ 36.56\r\nHS - 52*', '2008-10-14', 6);
INSERT INTO `awards` VALUES (67, 437, 15, '16 Wickets @ 17.94\r\nBest - 4/29', '2008-10-14', 6);
INSERT INTO `awards` VALUES (68, 43, 18, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (69, 6, 19, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (70, 10, 20, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (71, 301, 27, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (72, 11, 21, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (73, 173, 25, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (74, 9, 26, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (75, 438, 28, '', '2008-10-14', 6);
INSERT INTO `awards` VALUES (76, 301, 15, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (77, 15, 11, 'Overs: 134  	\r\n<br>Maidens: 36  	\r\n<br>Runs: 274  	\r\n<br>Wickets: 31  	\r\n<br>Avg: 8.84  	\r\n<br>Best: 6-31  	\r\n<br>5WI: 4 <br> 	\r\nEco: 2.04 <br>', '2008-10-15', 8);
INSERT INTO `awards` VALUES (78, 28, 10, 'Innings: 8  	\r\n<br>Notout: 1  	\r\n<br>Runs: 319  	\r\n<br>HS: 97 <br> 	\r\nAvg: 45.57  	\r\n<br>50\\''s: 2 <br>', '2008-10-15', 8);
INSERT INTO `awards` VALUES (79, 173, 8, 'Innings: 13<br>Notout: 4  	\r\n<br>Runs: 232  	\r\n<br>HS: 75  	\r\n<br>Avg: 25.78 <br> 	\r\n50\\''s: 2 <br>', '2008-10-15', 8);
INSERT INTO `awards` VALUES (80, 153, 9, 'Overs: 110.4  	\r\n<br>Maidens: 15  	\r\n<br>Runs: 350  	\r\n<br>Wickets: 19  	\r\n<br>Average: 18.42  	\r\n<br>Best: 4-14  	\r\n<br>4WI: 1\r\n<br>Eco: 3.17 <br>', '2008-10-15', 8);
INSERT INTO `awards` VALUES (81, 173, 2, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (82, 13, 3, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (83, 2, 1, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (84, 15, 30, 'NDCC 2nd Grade v University <br>2nd Grade Final\r\nPlayed at Keira Oval\r\n<br>Mar 15, 2008\r\n\r\n<br>Batting: 18 (44) \r\n<br>Bowling: 21.4-10-23-5 <br>', '2008-10-15', 8);
INSERT INTO `awards` VALUES (85, 111, 31, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (86, 6, 32, '', '2008-10-15', 8);
INSERT INTO `awards` VALUES (87, 45, 11, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (88, 45, 11, '32 Wickets @ 12.50\r\nBest - 4/21', '2008-10-15', 3);
INSERT INTO `awards` VALUES (89, 6, 11, '', '2008-10-15', 2);
INSERT INTO `awards` VALUES (90, 154, 11, '', '2008-10-15', 1);
INSERT INTO `awards` VALUES (91, 466, 11, '', '2008-10-15', 10);
INSERT INTO `awards` VALUES (92, 6, 11, '', '2008-10-15', 11);
INSERT INTO `awards` VALUES (93, 278, 11, '', '2008-10-15', 12);
INSERT INTO `awards` VALUES (94, 278, 11, '', '2008-10-15', 13);
INSERT INTO `awards` VALUES (95, 467, 11, '', '2008-10-15', 14);
INSERT INTO `awards` VALUES (96, 468, 11, '', '2008-10-15', 15);
INSERT INTO `awards` VALUES (97, 469, 11, '', '2008-10-15', 16);
INSERT INTO `awards` VALUES (98, 468, 11, '', '2008-10-15', 17);
INSERT INTO `awards` VALUES (99, 470, 11, '', '2008-10-15', 18);
INSERT INTO `awards` VALUES (100, 66, 11, '', '2008-10-15', 19);
INSERT INTO `awards` VALUES (101, 471, 11, '', '2008-10-15', 20);
INSERT INTO `awards` VALUES (102, 472, 11, '', '2008-10-15', 21);
INSERT INTO `awards` VALUES (103, 473, 11, '', '2008-10-15', 22);
INSERT INTO `awards` VALUES (104, 474, 11, '', '2008-10-15', 23);
INSERT INTO `awards` VALUES (105, 475, 11, '', '2008-10-15', 24);
INSERT INTO `awards` VALUES (106, 468, 11, '', '2008-10-15', 25);
INSERT INTO `awards` VALUES (107, 476, 11, '', '2008-10-15', 27);
INSERT INTO `awards` VALUES (108, 478, 11, '', '2008-10-15', 28);
INSERT INTO `awards` VALUES (109, 478, 11, '', '2008-10-15', 29);
INSERT INTO `awards` VALUES (110, 7, 6, '10 Catches', '2008-10-15', 7);
INSERT INTO `awards` VALUES (111, 427, 2, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (112, 45, 4, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (113, 3, 5, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (114, 479, 6, '21 Catches', '2008-10-15', 4);
INSERT INTO `awards` VALUES (115, 480, 8, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (116, 427, 9, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (117, 154, 10, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (118, 93, 12, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (119, 435, 13, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (120, 481, 14, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (121, 481, 15, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (122, 342, 7, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (123, 482, 23, '102* \r\nVs Dapto at Reid Park 14/12/2003', '2008-10-15', 4);
INSERT INTO `awards` VALUES (124, 427, 34, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (125, 479, 35, '', '2008-10-15', 4);
INSERT INTO `awards` VALUES (126, 278, 30, 'Plate Final', '2008-10-15', 4);
INSERT INTO `awards` VALUES (127, 14, 33, '7/24\r\nv Keira @ Hollymount Park\r\nJanuary 10th, 2004', '2008-10-16', 4);
INSERT INTO `awards` VALUES (128, 13, 33, '7/10	\r\nv Corrimal 2s at Hollymount Park East\r\n<br>27th October, 2007 <br>', '2008-10-16', 8);
INSERT INTO `awards` VALUES (129, 13, 24, '7/10 and 3/30\r\nv Corrimal 2s at Hollymount Park East\r\n<br>27th October, 2007 <br><a href=\\"scorecardfull.php?game_id=8&amp;ccl_mode=4\\">Scorecard</a>', '2008-10-16', 8);
INSERT INTO `awards` VALUES (130, 435, 33, '8/19\r\nv Corrimal @ Dalton Park West\r\n24th January, 2004', '2008-10-16', 4);
INSERT INTO `awards` VALUES (131, 93, 1, '', '2008-10-19', 3);
INSERT INTO `awards` VALUES (132, 427, 2, '', '2008-10-19', 3);
INSERT INTO `awards` VALUES (133, 429, 4, '', '2008-10-19', 3);
INSERT INTO `awards` VALUES (134, 45, 5, '', '2008-10-19', 3);
INSERT INTO `awards` VALUES (135, 479, 6, '23 Catches', '2008-10-19', 3);
INSERT INTO `awards` VALUES (136, 522, 6, '23 Catches', '2008-10-19', 3);
INSERT INTO `awards` VALUES (137, 7, 7, '', '2008-10-19', 3);
INSERT INTO `awards` VALUES (138, 427, 8, '659 Runs @ 38.76\r\nHS - 110', '2008-10-19', 3);
INSERT INTO `awards` VALUES (139, 484, 9, '33 Wickets @ 16.76\r\nBest - 5/19', '2008-10-19', 3);
INSERT INTO `awards` VALUES (140, 283, 10, '302 Runs @ 21.57\r\nHS - 88', '2008-10-19', 3);
INSERT INTO `awards` VALUES (141, 523, 12, '330 Runs @ 36.66\r\nHS - 107*', '2008-10-19', 3);
INSERT INTO `awards` VALUES (142, 430, 13, '27 Wickets @ 15.85\r\nBest - 4/18', '2008-10-19', 3);
INSERT INTO `awards` VALUES (143, 437, 14, '440 Runs @ 48.89\r\nHS - 93', '2008-10-19', 3);
INSERT INTO `awards` VALUES (144, 481, 15, '25 Wickets @ 12.36\r\nBest - 6/24', '2008-10-19', 3);
INSERT INTO `awards` VALUES (145, 7, 37, 'v Wollongong\r\nMatch Figures 4/36', '2008-10-19', 3);
INSERT INTO `awards` VALUES (146, 524, 23, '114*\r\nv University', '2008-10-19', 3);
INSERT INTO `awards` VALUES (147, 523, 23, '107*\r\nv Dapto', '2008-10-19', 3);
INSERT INTO `awards` VALUES (148, 427, 23, '110\r\nv Wollongong', '2008-10-19', 3);
INSERT INTO `awards` VALUES (149, 525, 23, '101*\r\nv Dapto', '2008-10-19', 3);
INSERT INTO `awards` VALUES (150, 526, 23, '106\r\nv University', '2008-10-19', 3);
INSERT INTO `awards` VALUES (151, 527, 23, '100\r\nv Corrimal', '2008-10-19', 3);
INSERT INTO `awards` VALUES (152, 154, 33, '7/25\r\nv Port Kembla', '2008-10-19', 3);
INSERT INTO `awards` VALUES (153, 528, 33, '7/52\r\nv Wests Illawarra', '2008-10-19', 3);
INSERT INTO `awards` VALUES (154, 154, 24, 'Match Figures 13/66\r\nv Port Kembla', '2008-10-19', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `awardtypes`
-- 

CREATE TABLE `awardtypes` (
  `AwardID` int(8) NOT NULL auto_increment,
  `AwardName` varchar(48) NOT NULL default '',
  PRIMARY KEY  (`AwardID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

-- 
-- Dumping data for table `awardtypes`
-- 

INSERT INTO `awardtypes` VALUES (1, 'Clubman of the Year');
INSERT INTO `awardtypes` VALUES (2, 'Cricketer of the Year');
INSERT INTO `awardtypes` VALUES (3, 'Shephard-Wright Player of the Year');
INSERT INTO `awardtypes` VALUES (4, 'U/23 Cricketer of the Year');
INSERT INTO `awardtypes` VALUES (5, 'U/19 Most Improved');
INSERT INTO `awardtypes` VALUES (6, 'Fielder of the Year');
INSERT INTO `awardtypes` VALUES (7, '4th Grade Jack Russel Award');
INSERT INTO `awardtypes` VALUES (8, '1st Grade Batsman of the Year');
INSERT INTO `awardtypes` VALUES (9, '1st Grade Bowler of the Year');
INSERT INTO `awardtypes` VALUES (10, '2nd Grade Batsman of the Year');
INSERT INTO `awardtypes` VALUES (11, '2nd Grade Bowler of the Year');
INSERT INTO `awardtypes` VALUES (12, '3rd Grade Batsman of the Year');
INSERT INTO `awardtypes` VALUES (13, '3rd Grade Bowler of the Year');
INSERT INTO `awardtypes` VALUES (14, '4th Grade Batsman of the Year');
INSERT INTO `awardtypes` VALUES (15, '4th Grade Bowler of the Year');
INSERT INTO `awardtypes` VALUES (16, '5th Grade Batsman of the Year');
INSERT INTO `awardtypes` VALUES (17, '5th Grade Bowler of the Year');
INSERT INTO `awardtypes` VALUES (18, '1st Grade Players Player');
INSERT INTO `awardtypes` VALUES (19, '2nd Grade Players Player');
INSERT INTO `awardtypes` VALUES (20, '3rd Grade Players Player');
INSERT INTO `awardtypes` VALUES (21, '4th Grade Players Player');
INSERT INTO `awardtypes` VALUES (22, '5th Grade Players Player');
INSERT INTO `awardtypes` VALUES (23, 'Century Maker');
INSERT INTO `awardtypes` VALUES (24, '10 Wickets in Match');
INSERT INTO `awardtypes` VALUES (25, '1st Grade Fielder of the Year');
INSERT INTO `awardtypes` VALUES (26, '2nd Grade Fielder of the Year');
INSERT INTO `awardtypes` VALUES (27, '3rd Grade Fielder of the Year');
INSERT INTO `awardtypes` VALUES (28, '4th Grade Fielder of the Year');
INSERT INTO `awardtypes` VALUES (29, '5th Grade Fielder of the Year');
INSERT INTO `awardtypes` VALUES (30, 'Player Of The Match Grand Final');
INSERT INTO `awardtypes` VALUES (31, 'Junior Achievement Award');
INSERT INTO `awardtypes` VALUES (32, 'Life Membership');
INSERT INTO `awardtypes` VALUES (33, '7 Wicket Innings');
INSERT INTO `awardtypes` VALUES (34, 'District - 1st Grade Bowling');
INSERT INTO `awardtypes` VALUES (35, 'District - Wicket Keeping');
INSERT INTO `awardtypes` VALUES (37, 'Hat Trick');

-- --------------------------------------------------------

-- 
-- Table structure for table `batpositions`
-- 

CREATE TABLE `batpositions` (
  `BatPosID` int(4) NOT NULL default '0',
  `BatPosName` varchar(16) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `batpositions`
-- 

INSERT INTO `batpositions` VALUES (1, 'No. 1');
INSERT INTO `batpositions` VALUES (2, 'No. 2');
INSERT INTO `batpositions` VALUES (3, 'No. 3');
INSERT INTO `batpositions` VALUES (4, 'No. 4');
INSERT INTO `batpositions` VALUES (5, 'No. 5');
INSERT INTO `batpositions` VALUES (6, 'No. 6');
INSERT INTO `batpositions` VALUES (7, 'No. 7');
INSERT INTO `batpositions` VALUES (8, 'No. 8');
INSERT INTO `batpositions` VALUES (9, 'No. 9');
INSERT INTO `batpositions` VALUES (10, 'No. 10');
INSERT INTO `batpositions` VALUES (11, 'No. 11');

-- --------------------------------------------------------

-- 
-- Table structure for table `ccl_umpiring`
-- 

CREATE TABLE `ccl_umpiring` (
  `id` smallint(5) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `score` int(11) default NULL,
  `q1` tinyint(1) default NULL,
  `q2` tinyint(1) default NULL,
  `q3` tinyint(1) default NULL,
  `q4` tinyint(1) default NULL,
  `q5` tinyint(1) default NULL,
  `q6` tinyint(1) default NULL,
  `q7` tinyint(1) default NULL,
  `q8` tinyint(1) default NULL,
  `q9` tinyint(1) default NULL,
  `q10` tinyint(1) default NULL,
  `q11` tinyint(1) default NULL,
  `q12` tinyint(1) default NULL,
  `q13` tinyint(1) default NULL,
  `q14` tinyint(1) default NULL,
  `q15` tinyint(1) default NULL,
  `q16` tinyint(1) default NULL,
  `q17` tinyint(1) default NULL,
  `q18` tinyint(1) default NULL,
  `q19` tinyint(1) default NULL,
  `q20` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=347 ;

-- 
-- Dumping data for table `ccl_umpiring`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `cclofficers`
-- 

CREATE TABLE `cclofficers` (
  `cclofficerID` int(8) NOT NULL auto_increment,
  `cclofficerTitle` varchar(64) NOT NULL default '',
  `cclofficerPlayerID` int(8) NOT NULL default '0',
  `cclofficerDetail` longtext NOT NULL,
  `cclofficerViews` longtext NOT NULL,
  `cclofficerTerm` varchar(4) NOT NULL default '',
  `cclofficerActive` char(1) NOT NULL default '',
  PRIMARY KEY  (`cclofficerID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `cclofficers`
-- 

INSERT INTO `cclofficers` VALUES (1, 'President', 2, 'The President shall preside at all meetings when present. In the event of a voting tie, the President shall cast a deciding vote. The President shall be a co-signer of all checks. The President shall rule on what are reimbursable expenses for members performing League duties subject to Management Committee approval. The President shall represent the League at any meetings at which League business may be discussed. The President shall coordinate all matters concerned with entertainment, sponsorship and publicity. In the event of prolonged absence the President shall make provision for delegating all responsibilities.', '', '2008', '1');
INSERT INTO `cclofficers` VALUES (2, 'Vice President', 3, 'The Vice-President shall deputize for the President when absent. The Vice-President shall be responsible for coordinating all liaisons with other cricket clubs and leagues. The Vice-President shall be responsible for keeping records of all non-member clubs associated with the League.', '', '2008', '1');
INSERT INTO `cclofficers` VALUES (3, 'Secretary', 4, 'The Secretary shall keep all records of the League (including Playing Records), attend to all correspondence and keep the minutes of all meetings. The Secretary shall provide a monthly League summary of activity to North American publications during the season. The Secretary shall convene all General Meetings and meetings of the Management Committee in accordance with Article 4 of the Constitution. The Secretary shall be responsible for circulating relevant League information and notices of League events and other activities to all members. The Secretary shall be responsible for completing the fixture list and confirming and amending it as necessary as the season progresses. The Secretary shall distribute to all clubs the names, addresses and telephone numbers of all Member Presidents, Captains, and Vice-Captains and Secretaries. The Secretary shall keep this list up-to-date.', '', '2008', '1');
INSERT INTO `cclofficers` VALUES (4, 'Treasurer', 5, 'The Treasurer shall have charge of the finances of the League and shall report their condition on request of the President. The treasurer shall collect all moneys, and deposit them in a bank in the name of the League. The Treasurer shall approve all purchases with the Management Committee. The accounts of the Treasurer shall be submitted annually for audit to two members appointed by the President. The fiscal year shall end December 31st of each year. All payments and disbursements are to be made by check, signed by the Treasurer and the President. The signatures of the President, Treasurer and one other Management Committee member, appointed by the President to act in his/her absence, shall be registered with the bank for withdrawal of funds. The treasurer shall also be responsible for preparing a budget to be presented to the Management Committee at the Annual General Meeting.', '', '2008', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `champions`
-- 

CREATE TABLE `champions` (
  `ChampID` int(4) NOT NULL auto_increment,
  `ChampTeam` int(4) NOT NULL default '0',
  `ChampSeason` int(4) NOT NULL default '0',
  `Type` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`ChampID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

-- 
-- Dumping data for table `champions`
-- 

INSERT INTO `champions` VALUES (22, 2, 8, 'Premiers');
INSERT INTO `champions` VALUES (23, 1, 3, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (24, 4, 2, 'Plate Winners');
INSERT INTO `champions` VALUES (25, 1, 1, 'Premiers');
INSERT INTO `champions` VALUES (26, 1, 1, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (27, 1, 10, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (28, 0, 10, 'Umpires Shield');
INSERT INTO `champions` VALUES (29, 0, 11, 'Umpires Shield');
INSERT INTO `champions` VALUES (30, 2, 12, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (31, 3, 12, 'Premiers');
INSERT INTO `champions` VALUES (32, 3, 12, 'Minor Premiers');
INSERT INTO `champions` VALUES (33, 3, 12, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (34, 2, 14, 'Premiers');
INSERT INTO `champions` VALUES (35, 2, 14, 'One-Day Competition Winners');
INSERT INTO `champions` VALUES (36, 4, 14, 'Premiers');
INSERT INTO `champions` VALUES (37, 1, 23, 'Minor Premiers');
INSERT INTO `champions` VALUES (38, 1, 27, 'Premiers');
INSERT INTO `champions` VALUES (39, 0, 28, 'Club Championship');
INSERT INTO `champions` VALUES (40, 1, 28, 'Minor Premiers');
INSERT INTO `champions` VALUES (41, 4, 28, 'Premiers');
INSERT INTO `champions` VALUES (42, 3, 30, 'Premiers (Thirroul CC)');
INSERT INTO `champions` VALUES (43, 2, 31, 'Premiers (Thirroul CC)');
INSERT INTO `champions` VALUES (44, 0, 32, '7 a side Competition (Woonona CC)');
INSERT INTO `champions` VALUES (45, 1, 33, 'One-Day Competition Winners (Thirroul CC)');
INSERT INTO `champions` VALUES (46, 0, 33, 'Umpires Shield (Woonona CC)');
INSERT INTO `champions` VALUES (47, 3, 34, 'Premiers (Thirroul CC)');
INSERT INTO `champions` VALUES (48, 2, 35, 'Premiers (Thirroul CC)');
INSERT INTO `champions` VALUES (49, 1, 36, 'Minor Premiers (Woonona CC)');
INSERT INTO `champions` VALUES (50, 1, 37, 'Premiers (Woonona CC)');
INSERT INTO `champions` VALUES (51, 1, 37, 'Minor Premiers (Woonona CC)');
INSERT INTO `champions` VALUES (52, 1, 38, 'Minor Premiers (Woonona CC)');
INSERT INTO `champions` VALUES (53, 2, 39, 'Premiers (Austinmer CC)');
INSERT INTO `champions` VALUES (54, 2, 40, 'Premiers (Woonona CC)');
INSERT INTO `champions` VALUES (55, 1, 41, 'Premiers (Thirroul CC)');

-- --------------------------------------------------------

-- 
-- Table structure for table `clubs`
-- 

CREATE TABLE `clubs` (
  `ClubID` int(8) NOT NULL auto_increment,
  `ClubName` varchar(64) NOT NULL default '',
  `ClubURL` varchar(128) NOT NULL default '',
  `ClubColour` varchar(16) NOT NULL default '',
  `ClubActive` int(1) NOT NULL default '0',
  `GroundID` int(4) NOT NULL default '0',
  `LeagueID` int(2) NOT NULL default '0',
  `picture` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`ClubID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `clubs`
-- 

INSERT INTO `clubs` VALUES (1, 'Northern Districts Cricket Club', 'http://www.butchercricket.com', '117CBD', 1, 1, 1, 'butcherscc.jpg');
INSERT INTO `clubs` VALUES (2, 'Helensburgh Cricket Club', '', '', 1, 3, 1, 'helensburghcc.jpg');
INSERT INTO `clubs` VALUES (3, 'Port Kembla Cricket Club', 'http://www.portkemblacricket.org/', '', 1, 4, 1, 'portkemblacc.jpg');
INSERT INTO `clubs` VALUES (4, 'Wollongong District Cricket Club', 'http://wdcc.8m.com/', '', 1, 6, 1, 'wgongcc.jpg');
INSERT INTO `clubs` VALUES (5, 'Keira Cricket Club', 'http://www.keiralions.com.au/', '', 1, 7, 1, 'kieracc.jpg');
INSERT INTO `clubs` VALUES (6, 'Wests Illawarra Cricket Club', 'http://www.sportslive.com.au/wests/', '', 1, 8, 1, 'westscc.jpg');
INSERT INTO `clubs` VALUES (7, 'Corrimal Cricket Club', 'http://www.cricketnsw.com.au/ica/hgchome.cl?PT=ch&C=COR', '#FF2A31', 1, 9, 1, 'corrimalcc.jpg');
INSERT INTO `clubs` VALUES (8, 'Balgownie Cricket Club', 'http://www.balgowniecricket.com.au', '000000', 1, 10, 1, 'balgowniecc.jpg');
INSERT INTO `clubs` VALUES (9, 'University of Wollongong Cricket Club', '', '015496', 1, 11, 1, 'unicc.jpg');
INSERT INTO `clubs` VALUES (10, 'Shoalhaven Ex-Servicemans Cricket Club', 'http://www.shoalhavenexservicemenscricketclub.com.au/', 'DF9917', 0, 13, 1, '');
INSERT INTO `clubs` VALUES (11, 'Dapto Cricket Club', 'http://www.daptocricketclub.org.au', 'F8C303', 1, 14, 1, 'daptocc.jpg');
INSERT INTO `clubs` VALUES (12, 'Oak Flats Cricket Club', 'http://www.oakflatscricket.com/', 'C3EDFB', 0, 15, 1, '');
INSERT INTO `clubs` VALUES (13, 'Gerringong Cricket Club', '', '', 0, 18, 1, '');
INSERT INTO `clubs` VALUES (15, 'Kiama Cricket Club', 'http://kiama.nsw.cricket.com.au/', '000000', 0, 29, 1, 'kiamalogo.gif');
INSERT INTO `clubs` VALUES (16, 'Lake Illawarra Cricket Club', '', '', 0, 6, 1, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `conferencemanagement`
-- 

CREATE TABLE `conferencemanagement` (
  `ConferenceID` int(2) NOT NULL auto_increment,
  `ConferenceName` varchar(64) NOT NULL default '',
  `ConferenceAbbrev` varchar(16) NOT NULL default '',
  PRIMARY KEY  (`ConferenceID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `conferencemanagement`
-- 

INSERT INTO `conferencemanagement` VALUES (1, 'ICA 1st Grade', '1st Grade');
INSERT INTO `conferencemanagement` VALUES (2, 'ICA 2nd Grade', '2nd Grade');
INSERT INTO `conferencemanagement` VALUES (3, 'ICA 3rd Grade', '3rd Grade');
INSERT INTO `conferencemanagement` VALUES (4, 'ICA 4th Grade', '4th Grade');
INSERT INTO `conferencemanagement` VALUES (5, 'Friendly', 'Friendly');
INSERT INTO `conferencemanagement` VALUES (6, 'ICA 5th Grade', '5th Grade');
INSERT INTO `conferencemanagement` VALUES (7, 'ICA Under 21', 'Under 21');

-- --------------------------------------------------------

-- 
-- Table structure for table `documents`
-- 

CREATE TABLE `documents` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `article` longtext NOT NULL,
  `added` date NOT NULL default '0000-00-00',
  `picture` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `documents`
-- 

INSERT INTO `documents` VALUES (1, 'Scorecard Excel Sheet', 'A template scorecard. <br><br><ul><li>Fill in blue squares</li><li>2nd, 3rd, 4th Innings in separate tabs at bottom</li><li>Include names from both sides</li><li>Include fielder name for caught and runout if possible</li></ul>', '2008-10-21', 'NDCC_Scorecard.xls');
INSERT INTO `documents` VALUES (2, 'Season Report 2004/2005', '<span style=\\"font-weight: bold;\\">PRESIDENTS REPORT\n</span><br><br>Firstly congratulations must go to first grade for another great grand final victory. The core of the team has been together for 6 or 7 years and records show that the two two-day premierships as well as the three one-day premierships makes this side the most successful 1st grade team the club has ever seen.\n\n<br><br>Eight of the guys playing in this final win also played in the previous win in 2000-01. The guys would agree that last season was not the best but their resurgence came about as a direct result of the off-season work of this seasons first grade captain Mark Johnson and club coach Matthew Pogson. A great deal was happening inside the club during the off season but the whole time the executive were exploring and securing a new major sponsor in Bulli Workers Club, (more on that soon) Mark and Poggo and I am sure others were busy securing a commitment from the first grade players to stand up and win the competition. The rest is history...\n\n<br><br>Read the rest of the report by downloading the file below.', '2005-04-01', 'Season_Report_2004_05.pdf');
INSERT INTO `documents` VALUES (3, 'Season Report 2005/2006', '<span style=\\"font-weight: bold;\\">PRESIDENTS REPORT\n</span><br><br>Hello Butchers,\n\nWelcome to another end of season report. This time last year we were celebrating our second premiership in a few years, but even then it was clear that this season was going to be a changing of the guard on the field. The captains reports will cover the teams performances, but I would like to acknowledge the performance all the players who had to dig in and play above their comfort level and also congratulate the young guys who were required to play 1st and 2nd second grade cricket in only their first or second full seasons in grade cricket. We didn’t always get the results we were after but your experiences will help to strengthen the clubs playing roster for many years to come.\n\n<br><br>I would also like to wish Kyle Connor all the best in his career as a teacher, which sadly for us cut short his cricket season and his current stint with the Butchers. Kyle will certainly not be lost from the game and I look forward to his return in the near future.\n\n<br><br>Off the field we have been very active. The workers club increased their sponsorship from last season by 20% that has helped us to finalise the building of our new clubhouse, which will be completed in July this year. This will be the first time in a very very long time that the club has ever had a proper home. Thank go to Earle Canvin for his previous efforts and to Neil Livermore and the Senior and Junior Woonona Tigers AFL clubs for all of their work in getting this project approved. Special thanks go to Wollongong City council who provided the lion’s share of the funding and project management for the construction of our new clubhouse...\n\n<br><br>Read the rest of the report by downloading the file below.', '2006-04-01', 'Season_Report_2005.pdf');
INSERT INTO `documents` VALUES (4, 'Season Report 2006/2007', '<span style=\\"font-weight: bold;\\">PRESIDENTS REPORT\n</span><br style=\\"font-weight: bold;\\"><br>Welcome to the 2006-2007 end of season report. The Butchers had a very positive year both on and off the field and everyone involved in the club should be proud of their efforts and achievements.  A big thanks firstly to the Bulli workers club who were once again outstanding supporters of the club. \n\n<br><br>I’ll start with where I started last year.\n\n<br><br>As most are aware 2005-2006 was a very difficult season for the club and planning for this season started almost as soon as the last ball was bowled for the previous season. The club needed a bit of a kick start to get moving forward again and the first part of this was getting more people involved off the field.\n<br><br>The first step forward was an excellent one with our AGM which was very well attended and a good deal of effort was put into a presentation outlining the off field function of the club this obviously had an effect as a number of the younger guys responded very well during the season and it was very rewarding to see an influx of enthusiasm running through the club. <br><br>Ean Martin stepped aside from the secretary role and put extra effort into his various roles with the district administration. Ean still did plenty as a general committee member and gear steward and the vast bulk of what he did at direct level was very well executed and received... \n\n<br><br>Read the rest of the report by downloading the file below.', '2007-04-01', 'Season_Report_2006.pdf');
INSERT INTO `documents` VALUES (5, 'Butcher Boundary 2008 1st Edition', 'Yes it’s that time of year again, where you peer into you cricket bag that is probably untouched from the last game you played and is sporting mouldy attire and equipment as well as a half finished Powerade and possibly some off fruit. This can mean only one thing ..... cricket season is back! As is the case with most new seasons the Butchers hope that 2008/09 is another successful one for the club...\n<br><br>Read the rest by downloading the file below.', '2008-09-03', 'Boundary1_2008.pdf');
INSERT INTO `documents` VALUES (6, 'First, Second & Third Grade Draw 2008', '', '2008-09-24', 'First,_Second__and__Third_Grade_Draw_2008.xls');
INSERT INTO `documents` VALUES (7, 'Fourth Grade Draw 2008', '', '2008-09-24', 'Fourth_Grade_Draw_2008.xls');
INSERT INTO `documents` VALUES (8, 'Season Report 2000/2001', '<span style=\\"font-weight: bold;\\">Presidents Report</span><br><br>What a season for Northern Districts Cricket Club.\n\n1st Grade winning the 2 day premiership for the first time in 18 seasons and also successfully defending their one day title. Both games were won very convincingly and Balgownie were left licking their wounds. Congratulations lads and we all enjoyed the couple of days that followed.\n\n<br><br>Read the rest of the report by downloading the file below.', '2001-04-01', 'Season_Report_2000.pdf');
INSERT INTO `documents` VALUES (9, 'Season Report 2001/2002', '<span style=\\"font-weight: bold;\\">Presidents Report</span><br><br>One word probably best describes this season 2001/2002 for NDCC - disappointing. Whilst this may seem a little harsh it is, a true reflection of what happened during the season.\n\n1st grade backing up as Premiers in both the One Day &amp; Two Day competitions only to be defeated in the semi-finals by eventual winners Balgownie. After having lost only one game during the season proper and to still only finish 2nd to a resurgent Port Kembla was a little frustrating. Not to mention having the side torn apart with injuries and personal leaving the area did not help at times during the season. \n\n<br><br>Read the rest of the report by downloading the file below.', '2002-04-01', 'Season_Report_2001.pdf');
INSERT INTO `documents` VALUES (10, 'NDCC Presentation Night 2005/2006', 'Northern Districts Cricket Club slide show used in the Presentation Night for 2005/2006.', '2006-04-01', 'NDCC Presentation Night - Complete.ppt');
INSERT INTO `documents` VALUES (11, 'Scoring Notes', 'The scorer’s job is one that requires considerable concentration and it is essential for scorer’s from each team to sit side by side. This way, they can compare scores, change of bowlers, incoming batsmen, names of fieldsmen who took catches etc. &nbsp;<br><br>Arrive at the game in plenty of time. Obtain a list of your team from the captain (in batting order if possible) and keep it handy for you both to see. Always fill out the headings on your scorebook with the details of the match, date, venue, round number etc.<br><br>Every ball bowled <span style=\\"font-weight: bold; font-style: italic;\\">must</span> be recorded. If no runs or sundries occur, then record a dot against the batsman and also in the bowler’s column.<br>&nbsp;<br>When runs occur, they have to recorded against the batsman, added to the total score and recorded in the bowler’s column, comparing runs and total score with your fellow scorer...<br><br>Read the rest of the report by downloading the file below.<br><br>', '2008-10-22', 'Scoring_Notes.pdf');

-- --------------------------------------------------------

-- 
-- Table structure for table `factoids`
-- 

CREATE TABLE `factoids` (
  `FactID` int(4) NOT NULL auto_increment,
  `FactDetail` longtext NOT NULL,
  PRIMARY KEY  (`FactID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- 
-- Dumping data for table `factoids`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `featuredmember`
-- 

CREATE TABLE `featuredmember` (
  `FeaturedID` int(4) NOT NULL auto_increment,
  `FeaturedPlayer` int(4) NOT NULL default '0',
  `FeaturedDetail` longtext NOT NULL,
  `added` date NOT NULL default '0000-00-00',
  `season` int(4) NOT NULL default '0',
  PRIMARY KEY  (`FeaturedID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `featuredmember`
-- 

INSERT INTO `featuredmember` VALUES (1, 2, 'We\\''ll start this years\\'' featured player off with a thanks to current President Neil Ryan. The season couldn\\''t get off the ground if it wasn\\''t for his hard work and dedication, and for that we are all very grateful.', '2008-10-02', 9);
INSERT INTO `featuredmember` VALUES (2, 307, 'Player of the Week is most certainly Spider. He scored the Club\\''s first century of the season over the weekend, hammering 108 in 5th Grade\\''s gallant chase of 302.\r\n\r\n<br><br>Gary is a club legend. Maybe more know to the older players for his eccentric personality &amp; off field exploits, Spider was always a very handy opening batsman and keeper with the Butchers.\r\n<br><br>After a few seasons away from Cricket, Spider has returned and seems hungrier than ever to win a title this season. Also Gary is keen to assist the club in helping out young players on the field. An aspect that the Butchers are obviously focusing on this season.\r\n\r\n<br><br>One pleasing aspect is that Gary has an absolute steely resolve to not give his wicket away and prides himself and that fact. A great cricket brain and possibly has the best off-field stories within the club alongside good bloke mate, Dave Joinking.', '2008-10-12', 9);
INSERT INTO `featuredmember` VALUES (3, 15, 'This weeks player of the week was 2nd Grade\\''s opening bowler / batsman extraordinaire Robert Sheeley.\r\n \r\n<br><br>After a very tidy 2 / 21 of 7 in the first innings, Rob backed it up by starting the ball rolling in the 2nd Innings. Helping the Butchers crawl their way back into the contest after a first innings loss.\r\n \r\n<br><br>Rob snared 4 - 14 off 6 overs to have Keira at 4 - 15. Having to leave early for work Rob opened the batting with ND needing 118 of 26 overs.\r\n \r\nRob compiled a quick fire 31 to lead the comeback and ensure a Butchers outright victory. Match figures of 6 wickets of 13.1 overs for 31 runs.\r\n \r\n<br><br>An honourable mention to Lewis Wilson who is back in the fold this season. Lewis has had two strong performances for 4th Grade this season.\r\n \r\nLewis has 4 wickets at 11:25 (avg) with a fine knock of 23 as well. Good work form the young quick who we hope to see begin his progression through the ranks.', '2008-10-21', 9);

-- --------------------------------------------------------

-- 
-- Table structure for table `generalhtml`
-- 

CREATE TABLE `generalhtml` (
  `id` smallint(6) NOT NULL auto_increment,
  `title` varchar(128) NOT NULL default '',
  `generalhtml` longtext NOT NULL,
  `picture` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `generalhtml`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `grounds`
-- 

CREATE TABLE `grounds` (
  `GroundID` int(8) NOT NULL auto_increment,
  `LeagueID` int(4) NOT NULL default '0',
  `GroundName` varchar(64) NOT NULL default '',
  `GroundAbbrev` varchar(64) NOT NULL default '',
  `GroundLoc` varchar(128) NOT NULL default '',
  `GroundDirections` longtext NOT NULL,
  `GroundZip` varchar(5) NOT NULL default '',
  `picture` varchar(64) NOT NULL default '',
  `GroundActive` int(1) NOT NULL default '1',
  `description` longtext NOT NULL,
  `parking` varchar(32) NOT NULL default '0',
  `coveredparking` varchar(32) NOT NULL default '0',
  `shelter` varchar(32) NOT NULL default '0',
  `handicapped` varchar(32) NOT NULL default '0',
  `stadiumseating` varchar(32) NOT NULL default '0',
  `restrooms` varchar(32) NOT NULL default '0',
  `conveniencestore` varchar(32) NOT NULL default '0',
  `drinkingwater` varchar(32) NOT NULL default '0',
  `publictransport` varchar(32) NOT NULL default '0',
  PRIMARY KEY  (`GroundID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- 
-- Dumping data for table `grounds`
-- 

INSERT INTO `grounds` VALUES (1, 1, 'Hollymount Park East', 'HPE', 'Woonona', '<ol><li>Head north on the Northern Distributor past Bellambi Lane <br></li><li>Turn left on Alice St <br></li><li>Continue around right bend on Alice St <br></li><li>Continue around left bend on Alice St <br></li><li>Continue straight into dirt driveway entrance of Hollymount Park</li></ol>', '2517', '', 1, '<br>', 'Yes', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (2, 1, 'Hollymount Park West', 'HPW', 'Woonona', '1. Head north on the Northern Distributor \r\n2. Turn left on Bellambi Lane\r\n3. Turn right on Princes Hwy\r\n4. Continue on Princes Hwy past Rixons Pass Rd seen on left\r\n5. Locate Driveway on right to Hollymount Park\r\n6.', '2517', '', 1, '', 'Yes', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (3, 1, 'Helensburgh Oval', 'H''Burg Oval', 'Helensburgh', '', '2508', '', 1, '', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (4, 1, 'King George Oval', 'King George', 'Port Kembla', '', '2505', '', 1, '', 'Yes', 'No', 'Limited', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (5, 1, 'Darcy Wentworth Oval', 'Darcy W''worth', 'Port Kembla', '', '2505', '', 1, '', 'Yes', 'No', 'Limited', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (6, 1, 'Dalton Park North', 'Dalton North', 'Towradgi', '', '2518', '', 1, '', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (7, 1, 'Keira Oval', 'Keira', 'Keiraville', '', '2500', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (8, 1, 'Figtree Oval', 'Figtree', 'Figtree', '', '2525', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (9, 1, 'Zeims Park', 'Zeims', 'Corrimal', '', '2518', '', 1, '', 'Yes', 'No', 'Limited', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (10, 1, 'Judy Masters Park', 'Judy Masters', 'Balgownie', '', '2519', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (11, 1, 'University Oval 1', 'Uni Oval 1', 'Keiraville', '', '2500', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (12, 1, 'University Oval 2', 'Uni Oval 2', 'Keiraville', '', '2500', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (13, 1, 'Hayden Drexel Oval', 'Hayden Drexel', 'Worrigee', '', '2541', '', 0, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (14, 1, 'Reed Park', 'Reed Pk', 'Dapto', '', '2530', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (15, 1, 'Geoff Shaw Oval', 'Geoff Shaw', 'Oak Flats', '', '2529', '', 1, '', 'Yes', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'No');
INSERT INTO `grounds` VALUES (16, 1, 'Dalton Park West', 'Dalton West', 'Towradgi', '', '', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (17, 1, 'Wiseman\\''s Park', 'Wiseman\\''s Park', '', '', '', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (23, 1, 'Dalton Park Middle', '', 'Towradgi', '', '2518', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (18, 1, 'Gerry Emery Oval', '', 'Gerringong', '', '2534', '', 0, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (19, 1, 'Gibson Park', '', 'Thirroul', '', '2515', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (20, 1, 'Reed Park East', '', 'Dapto', '', '2530', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (21, 1, 'Reed Park North', '', 'Dapto', '', '2530', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (22, 1, 'Reed Park South', '', 'Dapto', '', '2530', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (24, 1, 'Dalton Park South', '', 'Towradgi', '', '2518', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (25, 1, 'Helensburgh Oval 2', '', 'Helensburgh', '', '2508', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (26, 1, 'Figtree Oval 2', '', 'Figtree', '', '2525', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (27, 1, 'Beaton Park', '', 'Gwynneville', '', '2500', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (28, 1, 'Towradgi Park', '', 'Towradgi', '', '2518', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (29, 1, 'Kiama Sporting Complex', '', 'Kiama', '', '2533', '', 0, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `grounds` VALUES (30, 1, 'Fred Finch West', '', 'Berkely', '', '2506', '', 1, '', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');

-- --------------------------------------------------------

-- 
-- Table structure for table `history`
-- 

CREATE TABLE `history` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `article` longtext NOT NULL,
  `picture` varchar(255) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `views` int(8) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `history`
-- 

INSERT INTO `history` VALUES (2, 'Short History', 'Northern Districts Cricket Club (formerly Thirroul Cricket Club) was established in 1896 and has been an integral part of cricket in the Illawarra region for over 111 years.\n\nIn the past, all home matches were held at Gibson Park Thirroul but after the club underwent a name change from Thirroul Cricket Club to Northern Districts Cricket Club in 1994, the club’s base shifted to our current home of Hollymount Park Woonona. <br><br>Over recent years, Northern Districts Cricket Club has worked in conjunction with Wollongong City Council and the NSW Department of Sport &amp; Recreation toward the continued development of the sporting facilities at Hollymount Park.\n\nHollymount Park now boasts a new clubhouse which is shared with Woonona AFL Club, as well as a new turf wicket came into operation during the 2007/2008 season.  This new venue also provides the club and sponsors with greater exposure through frontage onto Princes Highway, a major roadway linking the Northern Suburbs of Wollongong.\n\n<br><br>The club has a very strong junior base with over 12 teams regularly playing in the Illawarra Junior Cricket Association.  The senior club is committed to fostering young talent from this strong junior base to progress into the 4 grades that currently play in the Illawarra Cricket Association senior competition.\n\nThe management of Northern Districts Cricket Club has also resisted the trend adopted by many clubs of making payments to players.  We believe that all proceeds generated through sponsorship and fund-raising activities should be directed to improving the club, ground facilities and playing equipment for all members of the club.', '', '2008-10-20 00:00:00', 30);
INSERT INTO `history` VALUES (3, 'Club Song', '<P>Once more we raise our glasses, <BR>And drink another toast, <BR>To the greatest cricket team, <BR>The best team on the coast </P>\n<P>And when the game is over, <BR>A man would be a fool, <BR>If he didn\\''t say the greatest team,<BR>Was right here in Thirroul! </P>\n<P>So it’s! Up the Butchers, <BR>Up the Butchers, <BR>The mighty white and blue! </P>\n<P>So it’s! Up the Butchers, <BR>Up the Butchers,<BR>The mighty white and blue!</P>', '', '2008-10-20 00:00:00', 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `howout`
-- 

CREATE TABLE `howout` (
  `HowOutID` int(4) NOT NULL default '0',
  `HowOutName` varchar(32) NOT NULL default '',
  `HowOutAbbrev` varchar(32) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `howout`
-- 

INSERT INTO `howout` VALUES (1, 'dnb', 'dnb');
INSERT INTO `howout` VALUES (2, 'Not Out', 'not out');
INSERT INTO `howout` VALUES (8, 'Ret''d Hurt', 'retired hurt');
INSERT INTO `howout` VALUES (3, 'Bowled', 'b');
INSERT INTO `howout` VALUES (4, 'Caught', 'c');
INSERT INTO `howout` VALUES (5, 'C&B', 'c &');
INSERT INTO `howout` VALUES (6, 'Hit Wicket', 'hit wicket');
INSERT INTO `howout` VALUES (7, 'LBW', 'lbw');
INSERT INTO `howout` VALUES (9, 'Run Out', 'run out');
INSERT INTO `howout` VALUES (10, 'Stumped', 'st');
INSERT INTO `howout` VALUES (11, 'Obstr'' Fld', 'obstructed field');
INSERT INTO `howout` VALUES (12, 'Hit Twice', 'hit twice');
INSERT INTO `howout` VALUES (13, 'Handled Ball', 'handled ball');
INSERT INTO `howout` VALUES (14, 'Absent Hurt', 'absent hurt');
INSERT INTO `howout` VALUES (15, 'Absent Ill', 'absent ill');
INSERT INTO `howout` VALUES (16, 'Retired Out', 'retired out');

-- --------------------------------------------------------

-- 
-- Table structure for table `innings`
-- 

CREATE TABLE `innings` (
  `InnID` int(4) NOT NULL default '0',
  `InnName` varchar(16) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `innings`
-- 

INSERT INTO `innings` VALUES (1, 'First');
INSERT INTO `innings` VALUES (2, 'Second');
INSERT INTO `innings` VALUES (3, 'Third');
INSERT INTO `innings` VALUES (4, 'Forth');

-- --------------------------------------------------------

-- 
-- Table structure for table `ladder`
-- 

CREATE TABLE `ladder` (
  `id` int(4) NOT NULL auto_increment,
  `season` int(4) NOT NULL default '0',
  `conference` int(2) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `played` int(4) NOT NULL default '0',
  `won` int(4) NOT NULL default '0',
  `tied` int(4) NOT NULL default '0',
  `lost` int(4) NOT NULL default '0',
  `nrr` int(4) NOT NULL default '0',
  `points` int(4) NOT NULL default '0',
  `penalty` int(4) NOT NULL default '0',
  `bonus` int(4) NOT NULL default '0',
  `totalpoints` int(4) NOT NULL default '0',
  `manualrank` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

-- 
-- Dumping data for table `ladder`
-- 

INSERT INTO `ladder` VALUES (1, 9, 1, 1, 2, 0, 0, 1, 1, 3, 0, 0, 3, 0);
INSERT INTO `ladder` VALUES (2, 9, 1, 5, 2, 0, 0, 1, 1, 3, 0, 0, 3, 0);
INSERT INTO `ladder` VALUES (3, 8, 1, 2, 11, 6, 0, 3, 2, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (4, 9, 1, 29, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (5, 9, 1, 25, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (6, 9, 1, 38, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (7, 9, 1, 17, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (8, 9, 1, 9, 2, 1, 0, 1, 0, 5, 0, 0, 5, 0);
INSERT INTO `ladder` VALUES (9, 9, 1, 33, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (10, 9, 1, 21, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (11, 9, 1, 13, 2, 0, 0, 1, 1, 3, 0, 0, 3, 0);
INSERT INTO `ladder` VALUES (12, 9, 2, 2, 2, 1, 0, 0, 1, 10, 0, 0, 10, 0);
INSERT INTO `ladder` VALUES (13, 9, 3, 3, 2, 0, 0, 1, 1, 3, 0, 0, 3, 0);
INSERT INTO `ladder` VALUES (14, 9, 2, 6, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (15, 9, 3, 7, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (16, 9, 2, 30, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (17, 9, 2, 26, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (18, 9, 2, 39, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (19, 9, 2, 18, 2, 0, 0, 1, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (20, 9, 2, 10, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (21, 9, 2, 34, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (22, 9, 2, 22, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (23, 9, 2, 14, 2, 0, 0, 1, 1, 3, 0, 0, 3, 0);
INSERT INTO `ladder` VALUES (24, 9, 3, 31, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (25, 9, 3, 27, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (26, 9, 3, 40, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (27, 9, 3, 19, 2, 1, 0, 0, 1, 9, 0, 0, 9, 0);
INSERT INTO `ladder` VALUES (28, 9, 3, 11, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (29, 9, 3, 35, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (30, 9, 3, 23, 2, 1, 0, 0, 1, 14, 0, 0, 14, 0);
INSERT INTO `ladder` VALUES (31, 9, 3, 15, 2, 0, 0, 1, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (32, 9, 4, 4, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0);
INSERT INTO `ladder` VALUES (33, 9, 6, 45, 2, 0, 0, 1, 1, 5, 0, 0, 5, 0);
INSERT INTO `ladder` VALUES (34, 9, 4, 20, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (35, 9, 6, 47, 2, 1, 0, 1, 0, 5, 0, 0, 5, 0);
INSERT INTO `ladder` VALUES (36, 9, 4, 36, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (37, 9, 4, 12, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0);
INSERT INTO `ladder` VALUES (38, 9, 6, 49, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (39, 9, 6, 52, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (40, 9, 6, 48, 2, 2, 0, 0, 0, 8, 0, 0, 8, 0);
INSERT INTO `ladder` VALUES (41, 9, 6, 50, 2, 1, 0, 1, 0, 5, 0, 0, 5, 0);
INSERT INTO `ladder` VALUES (42, 9, 6, 51, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (43, 9, 6, 53, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0);
INSERT INTO `ladder` VALUES (44, 9, 6, 54, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (45, 9, 6, 55, 2, 2, 0, 0, 0, 8, 0, 0, 8, 0);
INSERT INTO `ladder` VALUES (46, 9, 6, 56, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (47, 9, 4, 32, 1, 0, 0, 0, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (48, 9, 4, 28, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (49, 9, 4, 41, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0);
INSERT INTO `ladder` VALUES (50, 9, 4, 8, 1, 0, 0, 0, 1, 2, 0, 0, 2, 0);
INSERT INTO `ladder` VALUES (51, 9, 4, 16, 1, 1, 0, 0, 0, 4, 0, 0, 4, 0);
INSERT INTO `ladder` VALUES (52, 9, 4, 24, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `leaguemanagement`
-- 

CREATE TABLE `leaguemanagement` (
  `LeagueID` int(2) NOT NULL auto_increment,
  `LeagueName` varchar(64) NOT NULL default '',
  `LeagueAbbrev` varchar(16) NOT NULL default '',
  PRIMARY KEY  (`LeagueID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `leaguemanagement`
-- 

INSERT INTO `leaguemanagement` VALUES (1, 'One Day Competition', '1Day');
INSERT INTO `leaguemanagement` VALUES (2, 'Two Day Competition', '2Day');
INSERT INTO `leaguemanagement` VALUES (3, 'Twenty20 Competition', 'T20');
INSERT INTO `leaguemanagement` VALUES (4, 'Friendly Competition', 'Frndly');
INSERT INTO `leaguemanagement` VALUES (5, 'SCG Country Cup', 'SCG');

-- --------------------------------------------------------

-- 
-- Table structure for table `lmc`
-- 

CREATE TABLE `lmc` (
  `lmcID` int(4) NOT NULL auto_increment,
  `lmcPlayerID` int(4) NOT NULL default '0',
  `lmcPlayerID2` int(4) NOT NULL default '0',
  PRIMARY KEY  (`lmcID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `lmc`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `mailinglist_archive`
-- 

CREATE TABLE `mailinglist_archive` (
  `ID` int(11) NOT NULL auto_increment,
  `listID` int(11) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `body` text NOT NULL,
  `subject` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `mailinglist_archive`
-- 

INSERT INTO `mailinglist_archive` VALUES (5, 2, '2008-10-14', 'Michael	Their first name\nDoig	Their last name\nMichael Doig	Their full name (first last)\nmichael@mike250.com	Their email address\nOctober 10th, 2008	Todays date (Month DD, YYYY)\n\nAlso testing apostrophe''s\n\n\n\n\n\n-=-=-=-=-=-=-=-\nThis email was sent from the Butchers website. \n\nIf you wish to be removed from the NDCC 2nd Grade Mailing List, click the\nfollowing link.\n\nhttp://www.mike250.com/ndcc/unsubscribe.php?id=2&email=michael@mike250.com\n\nBe warned that you will lose the ability to receive Butcher Cricket\nupdates if you do so.\n\nIf you do not have access to a web browser but can email, then send an\nemail to mailing@butchercricket.com stating your id number, 2, and email\naddress, michael@mike250.com, and your wish to be removed from the\nnewsletter type.\n-=-=-=-=-=-=-=-', 'Hello [not shown]');

-- --------------------------------------------------------

-- 
-- Table structure for table `mailinglist_emails`
-- 

CREATE TABLE `mailinglist_emails` (
  `ID` int(11) NOT NULL auto_increment,
  `listID` int(11) NOT NULL default '0',
  `fname` varchar(64) default NULL,
  `lname` varchar(64) default NULL,
  `email` varchar(128) NOT NULL default '',
  `unsubscribed` tinyint(1) NOT NULL default '0',
  `htmlemail` tinyint(1) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

-- 
-- Dumping data for table `mailinglist_emails`
-- 

INSERT INTO `mailinglist_emails` VALUES (1, 1, 'Michael', 'Doig', 'mike250@gmail.com', 0, 1, '2008-10-14');
INSERT INTO `mailinglist_emails` VALUES (2, 2, 'Michael', 'Doig', 'michael@mike250.com', 0, 1, '2008-10-14');
INSERT INTO `mailinglist_emails` VALUES (3, 6, 'Mark', 'Rollestone', 'mrollestone@gmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (4, 6, 'Michael', 'Doig', 'michael@mike250.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (5, 6, 'Michael', 'Allen', 'michael@pacerowlandsbell.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (6, 6, 'Adam', 'Anderson', 'adamando@optusnet.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (7, 6, 'Scott', 'Beckett', 'scoobeck25@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (8, 6, 'Adam', 'Butcher', 'adamb@bilock.net', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (9, 6, 'Neil', 'Ryan', 'neil.ryan@cgu.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (10, 6, 'Stephen', 'Bond', 'sbondy84@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (11, 6, 'Cameron', 'Bell', 'chooksta_88@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (12, 6, 'Chris', 'Brown', 'chrisb8884@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (13, 6, 'Peter', 'Cleaves', 'peter.cleaves@integral.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (14, 6, 'Brett', 'Cleaves', 'Brett.Cleaves@bluescopesteel.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (15, 6, 'Ryan', 'Davidson', 'davo_2516@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (16, 6, 'Mick', 'Essenstam', 'mickessentam@iprimus.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (17, 6, 'Matt', 'Hancox', 'stargate885@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (18, 6, 'Ryan', 'Hunter', 'hunter_1312@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (19, 6, 'Ant', 'Hunt', 'anthony.hunt@gshoxtonpark.catholic.edu.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (20, 6, 'Dave', 'Joinking', 'david.joinking@sswahs.nsw.gov.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (21, 6, 'Jeremy', 'Lum', 'jeza_sk8on@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (22, 6, 'Ean', 'Martin', 'emma.ean@optusnet.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (23, 6, 'Greg', 'Martin', 'gmartin@tpt.au.textron.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (24, 6, 'Tim', 'McKenzie', 'timmckenzie83@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (25, 6, 'Mark', 'Cottom', 'mcottom@kells.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (26, 6, 'Ben', 'Paulson', 'bjp114@uow.edu.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (27, 6, 'John', 'Robinson', 'johngrobinson@bigpond.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (28, 6, 'Matt', 'Salakas', 'm_sarki@yahoo.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (29, 6, 'Brett', 'Murphy', 'b_rutis10@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (30, 6, 'Rob', 'Sheeley', 'robshots@virginbroadband.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (31, 6, 'Peter', 'Shephard', 'pshep@me.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (32, 6, 'Graeme', 'Sismey', 'gsismey@msn.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (33, 6, 'Lee', 'Turner', 'turn@1earth.net', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (34, 6, 'Jamal', 'Banfield', 'todays_lesson@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (35, 6, 'Luke', 'Coleman', 'coleman101@gmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (36, 6, 'Matt', 'Craig', 'prittyin_pink@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (37, 6, 'Sam', 'Gilkes', 'super_mexican_man@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (38, 6, 'Simon', 'Gilkes', 'sgilkes@exemail.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (39, 6, 'Yasir', 'Khan', 'khan1yas@gmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (40, 6, 'Mark', 'Keefe', 'markkeefe@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (41, 6, 'Matt', 'Benstead', 'matthew.benstead@boc.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (42, 6, 'Mitch', 'White', 'whitey2590@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (43, 6, 'Andrew', 'Stewart', 'andrew.stewart@tafensw.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (44, 6, 'Jack', 'Daskey', 'daskey13@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (45, 6, 'Steve', 'Khan', 'nkhan@kembla.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (46, 6, 'Pat', 'Tobin', 'Patrick.Tobin@au.harveynorman.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (47, 6, 'Tony', 'McQuisten', 'Tony.McQuisten@coregas.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (48, 6, 'Hugh', 'Fullagar', 'hughfullagar@yahoo.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (49, 6, 'Geordie', 'Crawford', 'lisamaxc@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (50, 6, 'Adam', 'Van Wijk', 'mvw@aanet.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (51, 6, 'Ant', 'Sheeley', 'ant.rach@bigpond.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (52, 6, 'Huw', 'Kinsella', 'huwkinsella@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (53, 6, 'Tim', 'Stockwell', 'butcherstocky@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (54, 6, 'Brett', 'Buckley', 'brettbuckley@aapt.net.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (55, 6, 'Matt', 'Owers', 'matthew.owers@gmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (57, 6, 'Jon', 'Lowe', 'jml007@uow.edu.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (58, 6, 'Rhys', 'Marsh', 'rmarsh24@bigpond.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (59, 6, 'Tavis', 'Ryan-Colton', 'tavis1887@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (60, 6, 'Craig', 'Dixon', 'dickodogg@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (61, 6, 'Andy', 'Koutsoufis', 'kout1and@police.nsw.gov.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (62, 6, 'Steve', 'Crews', 'crew2ste@police.nsw.gov.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (63, 6, 'Pete', 'Dawson', 'daws_73@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (64, 6, 'Jeff', 'Charlesworth', 'charles.worth@bigpond.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (65, 6, 'Lee', 'Hudson', 'deannaventers@bigpond.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (66, 6, 'Aaron', 'McRae', 'mcrae.wayne@gmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (67, 6, 'Jed', 'Austin', 'jedaust@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (68, 6, 'Brett', 'Pincham', 'brett.pincham@yahoo.com.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (69, 6, 'Danson', 'Benstead', 'dansonbenson@hotmail.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (70, 6, 'Lewis', 'Wilson', 'lw178@uow.edu.au', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (71, 6, 'Rob', 'Potter', 'rpotter@tpt.au.textron.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (72, 6, 'Will', 'O''Rourke', 'vashti215@yahoo.com', 0, 1, '0000-00-00');
INSERT INTO `mailinglist_emails` VALUES (73, 1, 'Neil', 'Ryan', 'neil.ryan@cgu.com.au', 0, 1, '2008-10-14');
INSERT INTO `mailinglist_emails` VALUES (75, 1, 'Mark', 'Rollestone', 'mrollestone@gmail.com', 0, 1, '2008-10-14');

-- --------------------------------------------------------

-- 
-- Table structure for table `mailinglist_lists`
-- 

CREATE TABLE `mailinglist_lists` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `description` varchar(255) default NULL,
  `archive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `mailinglist_lists`
-- 

INSERT INTO `mailinglist_lists` VALUES (1, 'NDCC 1st Grade', 'mailing@butchercricket.com', 'NDCC 1st Grade Players & Coaches', 1);
INSERT INTO `mailinglist_lists` VALUES (2, 'NDCC 2nd Grade', 'mailing@butchercricket.com', 'NDCC 2nd Grade Players & Coaches', 1);
INSERT INTO `mailinglist_lists` VALUES (3, 'NDCC 3rd Grade', 'mailing@butchercricket.com', 'NDCC 3rd Grade Players & Coaches', 1);
INSERT INTO `mailinglist_lists` VALUES (4, 'NDCC 4th Grade', 'mailing@butchercricket.com', 'NDCC 4th Grade Players & Coaches', 1);
INSERT INTO `mailinglist_lists` VALUES (5, 'NDCC 5th Grade', 'mailing@butchercricket.com', 'NDCC 5th Grade Players & Coaches', 1);
INSERT INTO `mailinglist_lists` VALUES (6, 'Northern Districts Cricket Club', 'mailing@butchercricket.com', 'Northern Districts Cricket Club - All Members', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `month`
-- 

CREATE TABLE `month` (
  `monthid` int(2) NOT NULL default '0',
  `monthnum` varchar(4) NOT NULL default '0',
  `title` varchar(16) NOT NULL default '',
  `abbrev` varchar(8) NOT NULL default '',
  PRIMARY KEY  (`monthnum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `month`
-- 

INSERT INTO `month` VALUES (1, '01', 'January', 'Jan');
INSERT INTO `month` VALUES (2, '02', 'February', 'Feb');
INSERT INTO `month` VALUES (3, '03', 'March', 'Mar');
INSERT INTO `month` VALUES (4, '04', 'April', 'Apr');
INSERT INTO `month` VALUES (5, '05', 'May', 'May');
INSERT INTO `month` VALUES (6, '06', 'June', 'Jun');
INSERT INTO `month` VALUES (7, '07', 'July', 'Jul');
INSERT INTO `month` VALUES (8, '08', 'August', 'Aug');
INSERT INTO `month` VALUES (9, '09', 'September', 'Sep');
INSERT INTO `month` VALUES (10, '10', 'October', 'Oct');
INSERT INTO `month` VALUES (11, '11', 'November', 'Nov');
INSERT INTO `month` VALUES (12, '12', 'December', 'Dec');

-- --------------------------------------------------------

-- 
-- Table structure for table `news`
-- 

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `added` date NOT NULL default '0000-00-00',
  `featureexpire` date NOT NULL default '0000-00-00',
  `user` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `author` varchar(128) NOT NULL default '',
  `article` longtext NOT NULL,
  `IsFeature` int(2) NOT NULL default '0',
  `IsPending` int(2) NOT NULL default '0',
  `picture` varchar(255) NOT NULL default '',
  `picdesc` varchar(255) NOT NULL default '',
  `views` int(8) NOT NULL default '0',
  `DiscussID` int(8) NOT NULL default '0',
  `ScorecardID` int(8) NOT NULL default '0',
  `MasterID` int(4) NOT NULL default '0',
  `SubTitle` varchar(16) NOT NULL default '',
  `newstype` int(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `news`
-- 

INSERT INTO `news` VALUES (1, '2008-10-01', '2008-10-21', 'mdoig', 'ICA Round 1 - NDCC vs Helensburgh', 'Neil Ryan', 'The Butchers take on Helensburgh in 1st, 2nd, and 3rd Grade this weekend in round 1 of the 2008/2009 ICA Competition.\n<br><br>1st Grade kick off the season at home along with 3rd Grade at Hollymount, whilst 2nd Grade are away at Rex Jackson Oval.\n\n4th &amp; 5th Grade begin next Saturday.\n\n<br><br>For more information check out the teamsheets of each grade for selections. <br><br>Scott Beckett is 1st Grade Captain, John Robinson 2nd Grade, &amp; Pete Cleaves 3rd Grade skipper with Mark Keefe taking the lead in 4th Grade.\nThe Butchers will be adding a 5th Grade team in line with the new ICA rules of only one 4th Grade side per club. The recent influx of new and former players making up the required numbers.', 0, 0, '42665_image_member.jpg', 'Scott Beckett leads NDCC 1st Grade into Season 2008/09.', 24, 0, 0, 0, '', 1);
INSERT INTO `news` VALUES (2, '2008-09-28', '2008-10-21', 'mdoig', 'NDCC defeats Gerringong CC in pre-season match', 'Neil Ryan', 'NDCC has defeated Gerringong CC in a pre-season warm up match in Gerringong over the weekend.\n\n<br><br>The Butchers travelled to Gerringong and bowled first. Lee Clouten snaring 2 wickets, Jamal Banfield 3, Mark Cottom 3 in dismissing Gerringong for 125.\n\n<br><br>Matt Salakas then crafted out a fine half century with help from Lee Turner and Brett Murphy in easily chasing down the total. The Butchers reaching 150 for the loss of 2 wickets.\n\n<br><br>A solid warm up for the season proper and a great way for youngsters Rhys Marsh and Jamal Banfield to make their debut. No doubt though the opposition will be harder come the start of the Illawarra Season, but nevertheless a good place to begin!\n<br><br>Read the <a href=\\"http://http://www.northernleader.com.au/article/solid_start_for_districts_in_trail_against_gerringong/\\">Northern Leader</a> article.', 0, 0, 'ndccvgerringong2008.jpg', 'Matt Salakis on his way to 59*. His knock included 10 boundaries.', 31, 0, 0, 0, '', 1);
INSERT INTO `news` VALUES (3, '2008-10-05', '2008-10-21', 'mdoig', 'Weather ruins first day of season', 'Michael Doig', 'It\\''s become all too common in this writers\\'' short life in Wollongong. The rain has spoken and once again all grades have been canceled. Northern Districts now turns to focus on it\\''s upcoming encounter against Kiera, weather permitting...<br><br><br><br><br><br><br><br><br><br><br>', 0, 0, 'rain.jpg', '', 9, 0, 0, 0, '', 1);
INSERT INTO `news` VALUES (4, '2008-10-11', '2008-10-21', 'mdoig', '1st Grade off to solid start: Cottom scores maiden 50', 'Scott Beckett', 'NDCC 1st Grade - A good start to the season for the Butchers 1\\''s. <br><br>After winning the toss we batted first on a wicket that was doing a little bit early but got better as the day rolled on. We negated the opening bowlers and were 0-37 after 12 when a storm interrupted play for 2 hours. <br><br>The opening partnership was good with <a href=\\"players.php?players=41&amp;ccl_mode=1\\">Scott Beckett</a> out first for 49 with the score on 75. Two quick wickets followed but a partnership of 63 steadied the ship before <a href=\\"players.php?players=12&amp;ccl_mode=1\\">Lee Turner</a> was out for 37. A couple of big hits at the end of the day from <a href=\\"players.php?players=28&amp;ccl_mode=1\\">Ean Martin</a> saw us finish on 4-175 (60), leaving us 13 overs to bat next week. <br><br>A fine performance from <a href=\\"players.php?players=155&amp;ccl_mode=1\\">Mark Cottom</a> who batted all day and is 61* at the close of play. This is Cottom\\''s first half century for the Butchers.', 0, 0, 'Untitled-1.jpg', 'Captain Scott Beckett fell one short of his half century as 1\\''s finished at 4-175. © robshots.com.au', 95, 0, 61, 9, 'Day 1 Report', 1);
INSERT INTO `news` VALUES (5, '2008-10-12', '2008-10-21', 'mdoig', '2nd Grade bowlers dominate Kiera: Lose late wickets', 'Graeme Sismey & John Robinson', 'NDCC 2nd Grade - Finally the cricket season has started, it was a good start to the defense of our title. <br><br>Keira, who were barely recognisable from previous seasons, won the toss and elected to bat first on a low, slow Hollymount track. As you know the wicket at <a href=\\"grounds.php?grounds=1&amp;ccl_mode=1\\">HPE</a> is very unpredictable and winning the toss isn\\''t always a good option. <br><br><a href=\\"players.php?players=15&amp;ccl_mode=1\\">Rob Sheeley</a> and <a href=\\"players.php?players=104&amp;ccl_mode=1\\">Jamal Banfield</a> opened the bowling with the latter taking a wicket in his first over. Despite the early loss Keira made a strong start with the opener dead-batting and the Number 3 displaying some aggressive stroke play (slogging). Keira were 1 for 42 at one stage; some good bowling and fielding breaking the partnership causing the rest to fall in pretty quick succession. From 1 for 42 Keira collapsed to be all out for 107. <a href=\\"players.php?players=13&amp;ccl_mode=1\\">John Robinson</a> was the chief destroyer (4 for 20) but was ably supported by Sheeley and <a href=\\"players.php?players=14&amp;ccl_mode=1\\">Graeme Sismey</a> who bagged a pair each. <a href=\\"players.php?players=6&amp;ccl_mode=1\\">Mick Allen</a> and Banfield also chimed in for one apiece. <br><br>The fielding on Saturday was very good, despite the conditions we held our catches. Banfield, <a href=\\"players.php?players=4&amp;ccl_mode=1\\">Mark Rollestone</a> (one catch assisted by Rob Sheeley) and keeper <a href=\\"players.php?players=306&amp;ccl_mode=1\\">Chilla Jeff Charlesworh</a> all snaring 2 catches. Charlesworth in his return game was solid behind the stumps, <a href=\\"players.php?players=67&amp;ccl_mode=1\\">Chris Brown</a> was particularly good in the field and Reece probably worked harder than anybody in his ball drying duties. <br><br>Late in the day the Butchers lost 2 quick wickets and will start the second day at 2/17. Rollestone was unlucky, caught by a screamer at cover while <a href=\\"players.php?players=7&amp;ccl_mode=1\\">Ant Sheeley</a> was run out after Brown forgot how to run. Allen was looking a little shaky, a french cut just missing the timber and a leading edge over mid off but was still there at the end. A committed effort with the bat this Saturday should see us come away with a victory and a good start to the season. <br><br><span style=\\"font-weight: bold;\\">Highlights</span><br><br><a href=\\"players.php?players=2&amp;ccl_mode=1\\">Neil Ryans</a> reaction upon hearing Spider had scored a century (think Toyota commercial)', 0, 0, '270672291_3nFJi-S.jpg', 'John Robinson led from the front with the ball (4 for 20), but will need to dig in with the bat as 2\\''s finished at 2-17. © robshots.com.au', 67, 0, 62, 11, 'Day 1 Report', 1);
INSERT INTO `news` VALUES (6, '2008-10-12', '2008-10-21', 'mdoig', '4th Grade fall agonizingly short: 1 run the difference', 'Mark Keefe', 'NDCC 4th Grade lost an agonisingly close match this weekend by 1 run. The first game of the season started off pretty well with NDCC winning the toss. We sent Keira into bat and the bowlers started very well. <a href=\\"players.php?players=312&amp;ccl_mode=1\\">Lewis Wilson</a> (2/29), <a href=\\"players.php?players=301&amp;ccl_mode=1\\">Matt Craig</a> (2/20) and <a href=\\"players.php?players=298&amp;ccl_mode=1\\">Ryan Davidson</a> (2/34) getting two wickets each before drinks to have Keira struggling at 6/69. <br><br>After a rain delay we resumed play in very wet conditions but we couldn\\''t capitalize on our great start. With the ball resembling a bar of soap the bowlers were unlucky with some chances not going our way. Young <a href=\\"players.php?players=313&amp;ccl_mode=1\\">David Bailey</a> took the only wicket of the second session to have Keira finish 7/179. <br><br>After discussions with the Keira captain, a revised total of 147 off 37 overs was our target. Once again <a href=\\"players.php?players=304&amp;ccl_mode=1\\">Greg Martin</a> smashed his way to a quick 41 to set up the run chase. Martin hit four 4\\''s and three 6\\''s in his entertaining knock. With help from <a href=\\"players.php?players=314&amp;ccl_mode=1\\">Daniel Bond</a> (24), <a href=\\"players.php?players=315&amp;ccl_mode=1\\">Brett Buckley</a> (21) and Bailey (20*) we fell short of the winning total by a mere 2 runs. <br><br>Buckley and Bond (proving that older brother Steve\\''s inability to hold a bat is not genetic) shared an enterprising 50 run partnership but unfortunately just couldn\\''t get over the line.', 0, 0, '42684_image_member.jpg', 'Greg Martin smashed 41 (including three maximums) but it wasn\\''t quite enough as 4\\''s came up just short. © robshots.com.au', 83, 0, 42, 0, '', 1);
INSERT INTO `news` VALUES (7, '2008-10-12', '2008-10-21', 'mdoig', '5th Grade gallant in defeat: Neilson blasts hundred', 'Mark Rollestone', 'NDCC 5th Grade bowled first and faced an uphill battle after Dapto Blue swash buckled their way to a merry 9/302 (top scores 145 and 89). <br><br>Bowling highlights included young <a href=\\"players.php?players=308&amp;ccl_mode=1\\">Shaun Helt</a> (3/49), <a href=\\"players.php?players=309&amp;ccl_mode=1\\">Adam Van Wijk</a> (2/30) and <a href=\\"players.php?players=310&amp;ccl_mode=1\\">Lee Hudson</a> (2/33). <br><br>In reply the Butchers gave it a mighty crack with prodigal son <a href=\\"players.php?players=307&amp;ccl_mode=1\\">Gary Neilson</a> notching 108 on return before retiring hurt. He was ably supported by <a href=\\"players.php?players=311&amp;ccl_mode=1\\">Dave Joinking</a> (50) and <a href=\\"players.php?players=5&amp;ccl_mode=1\\">Adam Butcher</a> (18) as 5th\\''s posted 7/233 from their 45 overs. <br><br>Congratulations Gary Nielson for the first ton of the season and being selected as NDCC <a href=\\"featuredmember.php?fm=2&amp;ccl_mode=1\\">Player of the Week</a>.', 0, 0, 'garyneilson.jpg', 'Gary \\"Spider\\" Neilson returned to cricket with a bang, notching 108 before retiring hurt.', 55, 0, 50, 0, '', 1);
INSERT INTO `news` VALUES (8, '2008-10-12', '2008-10-21', 'mdoig', '3rd Grade in strong position: Solid partnerships key', 'Peter Cleaves', 'NDCC 3rd Grade vs Keira at Dalton Park West; 3rds are in a good position at the close of play, finishing the day at 5 for 152. <br><br>The score can be attributed to a couple large partnerships - a second wicket stand of 69 by <a href=\\"players.php?players=16&amp;ccl_mode=1\\">Luke Coleman</a> (32) and <a href=\\"players.php?players=305&amp;ccl_mode=1\\">Matt Benstead</a> (34), and a fourth wicket partnership of 60 by <a href=\\"players.php?players=80&amp;ccl_mode=1\\">Cameron Bell</a> (48) and <a href=\\"players.php?players=10&amp;ccl_mode=1\\">Anthony Hunt</a> (11*). <br><br>With a few good batsman still to have a go, and a very strong bowling line-up; we are in a solid position. <br><br><b>Highlights</b> <br><ul><li>Luke Coleman\\''s cover drives </li><li>Two fours in the 1st over by <a href=\\"players.php?players=79&amp;ccl_mode=1\\">Dean Martin</a></li><li>Cam Bells new aggressive attitude </li><li>Killer getting fired up when the Keira captain changed the field on him. </li></ul>', 0, 0, '42669_image_member.jpg', 'Cameron Bell (48) was solid with the bat, featuring heavily in a fourth wicket partnership of 60. © robshots.com.au', 60, 0, 0, 12, 'Day 1 Report', 1);
INSERT INTO `news` VALUES (9, '2008-10-18', '2008-10-21', 'mdoig', '1st Grade go down: Strong start not enough', 'Michael Doig', 'NDCC 1st Grade - Unable to capitalize on last weeks stellar performance, Northern Districts lost 5/23 early Saturday afternoon to finish on 9/197. \n\nWith Hugh Fullagher absent hurt the innings was closed at this point. The score was 20 or 30 short of what they would have wanted and ultimately the difference in this game.<br><br>Despite a great couple opening sessions; where the Butchers reduced Keria to 2/13 at one stage, Keria got home with wickets and a few overs to spare. \n\nThe match was uninspired in almost every way; fielders would have been forgiven for falling asleep in the sun. Unfortunately the bowlers couldn\\''t crack Keira, allowing the Kiera opener to compose a rock solid (but slower than molasses) century that proved the match winner. <br><br>Northern Districts will rue the tale of almost half chances as the Keira top order continuously played aerily through the cover region or loose cuts that fell just short of slip or gully. An earlier 4th wicket would have almost certainly spelled doom, or at least forced them to take a risk and up the tempo. <br><br>Mark Cottom secured the NDCC Man of the Match with his maiden half century of 62. With the ball Stephen Bond was the standout, claiming a further two top order wickets to push that Top Order Dismissal statistic up towards 80%.<br>', 0, 0, 'SBond_image_member-1.jpg', 'Stephen Bond took two early wickets to put Keira on the back foot.', 51, 0, 61, 0, '', 1);
INSERT INTO `news` VALUES (10, '2008-10-18', '2008-10-21', 'mdoig', '4th Grade lose another thriller: A sense of Deja Vu', 'Mark Keefe', 'NDCC 4th Grade - Finally a sunny Saturday for a good game of cricket. With a win of the toss Port elected to bat. No worries we had a good feeling going out to the pitch. <br><br><a href=\\"players.php?players=312&amp;ccl_mode=1\\">Lewis Wilson</a> (2/16) ripped into the openers with some blistering pace and a couple of good short deliveries. <a href=\\"players.php?players=301&amp;ccl_mode=1\\">Matty Craig</a> (1/26) showed his versitility again by opening the bowling and getting behind the stumps with 2 stumpings. <a href=\\"players.php?players=298&amp;ccl_mode=1\\">Ryan Davidson</a> (3/25) again bedazzled the batsmen with his changes of pace and accuracy. <a href=\\"players.php?players=344&amp;ccl_mode=1\\">Mick Essenstam</a> (1/14) was frugal with the runs coming off 9 overs, this with a twisted ankle the size of an orange. <a href=\\"players.php?players=315&amp;ccl_mode=1\\">Brett Buckley</a> (2/24) and <a href=\\"players.php?players=11&amp;ccl_mode=1\\">Scott Perkiss</a> (1/22) came on as the spin twins and held the run rate to a trickle. <br><br>The catching today stood out well as Davidson, <a href=\\"players.php?players=314&amp;ccl_mode=1\\">Daniel Bond</a> and Wilson each took a catch with Wilson\\''s being a caught and bowled and <a href=\\"players.php?players=299&amp;ccl_mode=1\\">myself</a> taking three catches. Port Kembla ended their innings on a respectable 131. <br><br>Our batting didn\\''t carry over any of the tempo that we had in the field. We started off not so well to be 6/35 after 18 overs. But lucky we have a talented tail which wagged to put us back into the game. Davidson (17), Craig (20), Bond (30, top score of the match) and Wilson (23) all performed outstandingly to have us needing two runs off the last two overs to win. It was Deja Vu with Essenstam coming in at eleven with his swollen ankle we thought that we were home, but as the saying goes \\''don\\''t count your chickens before they hatch\\'' we lost our last wicket so agonisingly close to finish all out for 130. <br><br>We can still pull positives out of this game; our bowling, fielding and catching are going good, we have a tail that can wag very well. [<a href=\\"scorecardfull.php?game_id=60&amp;ccl_mode=4\\">Scorecard</a>]', 0, 0, '42803_image_member.jpg', 'With 1/26, 2 stumpings and a crucial 20 off the bat; All-rounder Matty can be confident in securing plenty of points in this weeks Fantasy League.', 34, 0, 60, 0, '', 1);
INSERT INTO `news` VALUES (11, '2008-10-18', '2008-10-21', 'mdoig', '2nd Grade win outright: Despite 1st Innings loss', 'Rob Sheeley', 'NDCC 2nd Grade - On a day that provided almost perfect cricketing weather for second grade, the defending premiers resumed at 2/17 chasing a seemingly very achievable total of 107. <br><br>Things didn\\''t start well for the Butchers with Mick Allen bowled second ball of the day and unknowingly being the catalyst for what would be a sensational Butcher collapse that could only be described a sub-standard batting display. The now infamous Hollymount pitch again provided variable bounce and the Keira bowlers used it well whereas the Northern Districts batsmen showed scant regard for it and seemed content to self destruct. <br><br>After Allens\\'' dismissal Chris Brown followed soon after with a flick off his pads providing an easy catch. Captain John Robinson was brilliantly caught from a well struck cut shot just when it may have appeared that The Butchers were consolidating. \n\nThis wicket provided the stage for the capitulation. Neil Ryan was run-out from a direct hit, Rhys Marsh who batted well was caught, Rob Sheeley was bowled sweeping, Graeme Sismey skied a mis-hit and Jeff Charlesworth was controversially given out caught in close to seal the Butchers fate and hand Keira first innings points. Keira must be given credit for a flawless fielding performance but the batting effort was average at best. Rhys Marsh being the best of a bad bunch.\n \n<br><br>So it was to be an interesting second innings, Keira hoping to set a score and bowl Northern Districts out for another low total and gain maximum points, whilst the Butchers were hoping to emulate Keira\\''s efforts and then atone for their earlier batting demise. Keira made their intentions clear with the a first over ball being struck high but falling safe, the next ball was the same but fell into the waiting hands of Jamal Banfield who pouched his second for the match Rob Sheeley taking the wicket. The very next ball saw a shortish ball skied high over the slips cordon where Mark Rollestone had made good ground to hold a great catch. All of a sudden it was 2 for 5. \n\n<br><br>Banfield was providing some great support from the other end and the 3rd over saw Sheeley pick up another wicket caught behind and almost give himself another hat-trick opportunity when the fresh batsmen edged a ball which rocketed to keeper Charlesworth striking him in the chest. Keira only managed eight more runs before Sheeley struck again, bowling the aforementioned batsman and finishing his spell with figures of 4 for 14. <br><br>So the stage was set and Keira now had their two senior men at the crease who looked comfortable and went to tea looking as though they may stave off any surprise come backs. They\\''d put on 45 for the 5th wicket before Neil Ryan broke through with a superb LBW and again providing the Butchers with a sniff of an unlikely result. \n\n<br><br>Enter Mark Rollestone. Steaming in and bowling straight and fast, Rollo put on an exhibition of how to bowl to lower order batsman whilst also improving his fantasy league star rating. Mark bowled the next three batsman, all for ducks ending up with 3 for 11 from five overs which predictably saw Mark at the end of his fitness tether. Doug Bollinger stunt double, Neil Ryan put the icing on the cake taking the last two scalps with some sharp turning spin. Keira all out for eighty leaving The Butchers 118 for victory in around 25 overs, a total no-one could archive thus far let alone in quick time.\n \n<br><br>In what appeared to be a deliberate tactic, The Butchers sent out noted fast scorers John Robinson and Rob Sheeley to open the innings, reality told us it was because they had to leave early for work commitments. It would be a bold move but one that may pay off. And pay off it did. Sheeley made his intentions clear early and had some quick success whilst Robinson was also scoring freely. When Sheeley departed in the eighth over for a quick-fire 31 the score was 1 for 47, they had provided what was to be the biggest partnership of the match at the most vital stage.<br><br>The skipper, Robinson went on to make 39, and the second wicket partnership with Mick Allen was worth 23 before Robinson hit one too well for Allen who was unluckily run out at the non-strikers end form a bowler deflection, but by now the platform had been laid. Robinson departed not long after and headed for work which saw Graeme \\"Scissors\\" Sismey\\''s efforts to speed up the finish also go awry. But Chris Brown (28*) and the precocious Rhys Marsh steered the Butchers to an outright victory with the winning runs coming in the twentieth over handing the defending premiers outright points after all was seemingly lost just hours earlier. Some may say it was a \\"get out of jail\\" victory but it was refreshing to see the team have some tenacity and character which was in stark contrast to their earlier capitulation.', 0, 0, '42670_image_member.jpg', 'Chris Brown has found this season what to do with a bat; and looks in superlative form. His 28* helped NDCC to an unlikely outright result.', 52, 0, 62, 0, '', 1);
INSERT INTO `news` VALUES (12, '2008-10-18', '2008-10-21', 'mdoig', '3rd Grade pass 200: But unable to defend', 'Peter Cleaves', 'NDCC 3rd Grade finished off their innings well. The score was moved on from 5/152 to 7 for 221 in 12.3 overs. Peter Cleaves (42*), Craig Dixon (17), and Adam Anderson (12*) all playing some nice shots.\n\nWe were feeling pretty confident of defending this total.\n\n<br><br>Dan Benstead and Andam Anderson had the ball swinging early, and the batsmen were mainly playing and missing. Unfortunately a couple of catches went down, and one opener made the most of his chances and eventually got his eye in and made 77 - Anthony Hunt picking him up - caught by Adam Anderson.\n\nThe number three batsman had a very shaky start too, was dropped before he got a run but then batted very nicely for 66 not out.\n\nSame story with the #4 Batsman, he had a catch dropped before he got going. He eventually retired hurt.\n\nJudging by how the #5 batter was going, if we held our catches we would have gone through the bottom order very easily. <br><br>The types of bowlers we have are going to pick-up a lot of edges so we need to capitalize on them.\n\nEvery bowler did a great job for us. Pete Dawson had a very impressive debut, picking up the other wicket - caught and bowled.\n\nAdam Anderson, Dan Benstead, Craig Dixon, &amp; Matt Benstead all bowled very well without luck.', 0, 0, 'petercleavesvkeira08.jpg', 'Pete Cleaves 42* helped NDCC to a sizable total, but missed chances in the field were costly as Keira easily crossed the needed 221.', 57, 0, 59, 0, 'Peter Cleaves', 1);
INSERT INTO `news` VALUES (13, '2008-10-19', '2008-10-22', 'mdoig', 'TRIVIA NIGHT - Saturday 1st of Nov - 7:30pm', 'Mark Rollestone', 'TRIVIA NIGHT - Saturday 1st of Nov - 7:30pm\n\n<br><br>To be held in the clubhouse.\n\n<br>$10 a head with a maximum of 8 per team.\n\n<br>Steak and sausage sizzle to be available, BYO nibbles.\n\n<br><br>MORE INFO TO COME!!', 1, 0, '', '', 26, 0, 0, 0, 'Are You Smarter', 1);
INSERT INTO `news` VALUES (14, '2008-10-23', '2008-10-23', 'mdoig', 'SCG Cup - This Sunday - 10AM', 'Mark Rollestone', 'Butchers, <br><br>This Sunday – 26th October – Sees NDCC 1st Grade in action again perennial South Coast powerhouse Oak Flats. <br><br>Last season the Butchers defeated the Rats in a thrilling 20/20 encounter and will be looking to build upon that result this weekend. <br><br>A solid turn out in support would help out the boys immeasurably and another victory away from home would make for a memorable day!<br><br><span style=\\"font-weight: bold;\\">Ground:</span> Geoff Shaw Oval – Oak Flats<br><br><span style=\\"font-weight: bold;\\">Start:</span> 10 AM<br><br><span style=\\"font-weight: bold;\\">Format: </span>60 overs per side<br><br><span style=\\"font-weight: bold;\\">Team:</span><br><br>Scott Beckett ©<br>Mark Cottom<br>Matt Salakas<br>Brett Murphy<br>Lee Turner<br>Ean Martin<br>Hugh Fullagar (wk)<br>Michael Doig<br>Tim McKenzie<br>Jamal Banfield<br>Stephen Bond<br>', 0, 0, '42665_image_member.jpg', 'Scott Beckett leads NDCC 1st Grade against Oak Flats in this years SCG Cup opener.', 8, 0, 0, 0, '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `newstype`
-- 

CREATE TABLE `newstype` (
  `id` int(2) NOT NULL auto_increment,
  `title` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `newstype`
-- 

INSERT INTO `newstype` VALUES (1, 'League');

-- --------------------------------------------------------

-- 
-- Table structure for table `nrr`
-- 

CREATE TABLE `nrr` (
  `id` int(4) NOT NULL auto_increment,
  `season` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `tscore` bigint(6) NOT NULL default '0',
  `tovers` float NOT NULL default '0',
  `oscore` bigint(6) NOT NULL default '0',
  `oovers` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- 
-- Dumping data for table `nrr`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nrrback`
-- 

CREATE TABLE `nrrback` (
  `season` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `tscore` bigint(6) NOT NULL default '0',
  `tovers` float NOT NULL default '0',
  `oscore` bigint(6) NOT NULL default '0',
  `oovers` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `nrrback`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `player_batting`
-- 

CREATE TABLE `player_batting` (
  `player_id` int(11) NOT NULL default '0',
  `league_id` int(4) NOT NULL default '0',
  `conf_id` int(4) NOT NULL default '0',
  `innings` int(4) NOT NULL default '0',
  `notouts` int(4) NOT NULL default '0',
  `runs` int(6) NOT NULL default '0',
  `hs` int(4) NOT NULL default '0',
  `100` int(4) NOT NULL default '0',
  `50` int(4) NOT NULL default '0',
  `caught` int(4) NOT NULL default '0',
  `stumped` int(4) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `player_batting`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `players`
-- 

CREATE TABLE `players` (
  `PlayerID` int(8) NOT NULL auto_increment,
  `PlayerFName` varchar(32) NOT NULL default '',
  `PlayerLName` varchar(32) NOT NULL default '',
  `PlayerLAbbrev` varchar(64) NOT NULL default '',
  `PlayerClub` int(8) NOT NULL default '0',
  `PlayerTeam` int(4) NOT NULL default '0',
  `PlayerEmail` varchar(64) NOT NULL default '',
  `IsUmpire` int(2) NOT NULL default '0',
  `IsPresident` int(2) NOT NULL default '0',
  `IsVicePresident` int(2) NOT NULL default '0',
  `IsSecretary` int(2) NOT NULL default '0',
  `IsTreasurer` int(2) NOT NULL default '0',
  `IsCaptain` int(2) NOT NULL default '0',
  `IsViceCaptain` int(2) NOT NULL default '0',
  `Born` varchar(128) NOT NULL default '',
  `BattingStyle` varchar(64) NOT NULL default '',
  `BowlingStyle` varchar(64) NOT NULL default '',
  `shortprofile` mediumtext NOT NULL,
  `AIM` varchar(64) NOT NULL default '',
  `YAHOO` varchar(64) NOT NULL default '',
  `MSN` varchar(64) NOT NULL default '',
  `ICQ` varchar(64) NOT NULL default '',
  `picture` varchar(64) NOT NULL default '',
  `picture1` varchar(64) NOT NULL default '',
  `picture2` varchar(64) NOT NULL default '',
  `picture3` varchar(64) NOT NULL default '',
  `isactive` int(2) NOT NULL default '0',
  `islifemember` int(2) NOT NULL default '0',
  `iscelebrity` int(2) NOT NULL default '0',
  `added` date NOT NULL default '0000-00-00',
  `edited` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`PlayerID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=533 ;

-- 
-- Dumping data for table `players`
-- 

INSERT INTO `players` VALUES (1, 'Michael', 'Doig', '', 1, 2, 'mike250@gmail.com', 0, 0, 0, 0, 0, 0, 0, '5-Feb-1979, Melbourne, Australia', 'Right Hand Bat', 'Right Arm Medium', '<b>Nickname:</b> Doiger<br><b>Talent:</b> Statistics <br><b>Grew Up in:</b> Brisbane - Townsville - USA <br><b>Schools:</b> Mabel Park SHS Brisbane, William Ross SHS Townsville <br><b>Job:</b> Engineer Software Co <br><b>Best Bowling:</b> <a href=\\"http://www.coloradocricket.org/scorecardfull.php?game_id=88&amp;ccl_mode=4\\">7.2-3-8-4</a><br><b>Best Batting:</b> <a href=\\"http://www.coloradocricket.org/news.php?news=384&amp;ccl_mode=1\\">115 (56)</a><br><b>Best Achievement:</b> <a href=\\"http://mike250.com/gallery/v/star/\\">Playing Cricket</a> against Curtly Ambrose, Romesh Kaluwitharana &amp; Mohammed Azharuddin<br><b>Likes:</b> Cricket, Music, Programming <br><b>Dislikes:</b> Whingers <br><b>Favourite Player:</b> Mark Waugh <br><b>Other Sports:</b> Rugby League <br><b>Butchers Debut:</b> <a href=\\"scorecardfull.php?game_id=24&amp;ccl_mode=4%5DSep\\" 29,=\\"\\" 2007=\\"\\" v=\\"\\" port=\\"\\" kembla=\\"\\"></a><br><b>Hobbies:</b> Web Programming, Video Games, Anything with my boys <br><b>3 Dinner Guests:</b> Mark Waugh, Charleze Theron, Natalie Portman <br><b>Favourite Movie &amp; TV Show:</b> Braveheart &amp; The Office (USA) <br><b>Dream Job:</b> Cricket Statistician', '', '', '', '', 'MD_image_member.jpg', '270585645_Jmx4N-M.jpg', '270586290_AWidg-M.jpg', '06michaeldoigaction.jpg', 0, 0, 0, '2008-10-01', '2008-10-21');
INSERT INTO `players` VALUES (2, 'Neil', 'Ryan', '', 1, 2, 'neil.ryan@cgu.com.au', 0, 1, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Off Spin', '<br>', '', '', '', '', 'neilryanprofile07.jpg', '270676226_6by4C-M.jpg', '270677096_ski3H-M.jpg', '270677284_TEDdp-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (3, 'Matt', 'Salakas', '', 1, 1, 'm_sarki@yahoo.com', 0, 0, 1, 0, 0, 0, 0, '', 'Left Hand Bat', 'Right Arm Leg Spin', '', '', '', '', '', '42690_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (4, 'Mark', 'Rollestone', '', 1, 2, 'mrollestone@gmail.com', 0, 0, 0, 1, 0, 0, 0, '12th October 1983', 'Right Hand Bat', 'Right Arm Fast Medium', '<b>Nickname:</b>	Rollo<br>\r\n<b>Talent:</b>	Being able to trick people into letting me open the batting<br>\r\n<b>Grew Up in:</b>	Fairy Meadow<br>\r\n<b>Schools:</b>	Holy Spirit College, UOW<br>\r\n<b>Job:</b>	Alcohol peddler, uni student<br>\r\n<b>Best Bowling:</b>	5-17 v Port<br>\r\n<b>Best Batting:</b>	49 v Balgownie, 49* v ND (smoked Shep around that day)<br>\r\n<b>Best Achievement:</b>	Dominating my old club last year in 2’s and 1st grade debut against Port<br>\r\n<b>Likes:</b>	Celtic FC, Leicester City FC, The Butchers, Coopers Pale Ale<br>\r\n<b>Dislikes:</b>	Umpires, any opposing cricket team, Rangers FC, fielding at Hollymount <br>\r\n<b>Favourite Player:</b>	Stephen Bond<br>\r\n<b>Other Sports:</b>	Football (the world game, not the mugs game)<br>\r\n<b>Butchers Debut:</b>	2006-7 v Corrimal<br>\r\n<b>Hobbies:</b>	Whittling my life away on the Butchers website<br>\r\n<b>3 Dinner Guests you\\''d invite:</b>	Keith Richards, Doug Walters, George Best<br>\r\n<b>Favourite Movie &amp; TV Show:</b>	The Wind That Shakes The Barley &amp; Entourage<br>\r\n<b>Dream Job:</b>	A Senator holding the balance of power', '', '', '', '', '42585_image_member.jpg', '270578557_ZpnUy-M.jpg', '270659255_ffEtf-M.jpg', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (5, 'Adam', 'Butcher', '', 1, 45, 'adamb@bilock.net', 0, 0, 0, 0, 1, 0, 0, '', 'Right Hand Bat', 'Right Arm Off Spin', '<br>', '', '', '', '', '42666_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (6, 'Michael', 'Allen', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '42663_image_member.jpg', '', '', '', 0, 1, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (7, 'Anthony', 'Sheeley', '', 1, 2, 'ant.rach@bigpond.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', 'Butcher since \\''83. Overbatted and Underbowled', '', '', '', '', 'member_antsheeley.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (8, 'Mitch', 'White', '', 1, 2, 'whitey2590@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '', '', '', '', '', '42813_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (9, 'Brett', 'Murphy', '', 1, 1, 'b_rutis10@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Left Hand Bat', 'Right Arm Medium', 'Sexy Butcherlicious batsman with impeccable physique. Often likened to Andy Symonds in reference to both his on and off field exploits, as well as the monkey like appearance. Love the Butcher blue zinc and will make sure it takes off this season!! Also, hates a beer :P', '', '', '', '', '42691_image_member.jpg', '270370258_2FvJi-M.jpg', '270372459_HJQVS-S.jpg', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (10, 'Anthony', 'Hunt', '', 1, 3, 'anthony.hunt@gshoxtonpark.catholic.edu.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'anthonyhuntprofile06.jpg', '270381487_LKRCp-M.jpg', '270390351_7DGoy-M.jpg', 'CS53.jpg', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (11, 'Scott', 'Perkiss', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '42812_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (12, 'Lee', 'Turner', '', 1, 1, 'turn@1earth.net', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '', '', '', '', '', '42697_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (13, 'John', 'Robinson', '', 1, 2, 'johngrobinson@bigpond.com', 0, 0, 0, 0, 0, 1, 0, '', 'Right Hand Bat', 'Right Arm Medium', '', '', '', '', '', '42689_image_member.jpg', 'JRobinson2.jpg', 'JRobinson.jpg', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (14, 'Graeme', 'Sismey', '', 1, 2, 'gsismey@msn.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'CS115.jpg', 'GSismey.jpg', '42695_image_member.jpg', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (15, 'Rob', 'Sheeley', '', 1, 2, 'robshots@virginbroadband.com.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Fast Medium', '<br>', '', '', '', '', '42693_image_member.jpg', 'RSheeley2.jpg', 'RSheeley.jpg', '270371313_aArv7-S.jpg', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (16, 'Luke', 'Coleman', '', 1, 3, 'coleman101@gmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', 'Well, I love long walks on the beach, writing very long and useful things on the forum, putting on that sky blue cap, and the zoo.', '', '', '', '', '42801_image_member.jpg', '270372757_ZiqLq-M.jpg', '270631623_TSrPF-M.jpg', '270389632_aFEEC-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (17, 'D', 'Cvetkovic', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (18, 'A', 'Moxon', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (19, 'M', 'Herzog', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (20, 'A', 'Stephens', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (21, 'R', 'Kosarew', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (22, 'J', 'Wellins', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (23, 'F', 'Ciocci', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (24, 'D', 'Phelps', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (25, 'A', 'Lee', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (26, 'T', 'Plakias', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (27, 'S', 'Noronha', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (28, 'Ean', 'Martin', '', 1, 1, 'emma.ean@optusnet.com.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', 'Will do anything for the Butchers!!', '', '', '', '', '42683_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (29, 'D', 'Rule', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (30, 'J', 'Rafin', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (31, 'B', 'Hains', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (32, 'R', 'McCarthy', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (33, 'A', 'Hannem', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (34, 'G', 'Kapour', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (35, 'K', 'Major', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (36, 'C', 'Satori', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (37, 'D', 'Lawrye', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (38, 'T', 'Di Genni', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (39, 'T', 'Piawi', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (40, 'John', 'Chapman', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '7th June, 1978', '', '', '<b>Nickname:</b>	Chappo<br>\r\n<b>Talent:</b>	Gettin on the piss<br>\r\n<b>Grew Up in:</b>	Woonona<br>\r\n<b>Schools:</b>	Woonona High School<br>\r\n<b>Job:</b>	National Claims Consultant<br>\r\n<b>Best Bowling:</b>	6 for 3<br>\r\n<b>Best Batting:</b>	120<br>\r\n<b>Best Achievement:</b>	Winning the Chuck Award 2006<br>\r\n<b>Likes:</b>	Schooners, Corrimal Pub<br>\r\n<b>Dislikes:</b>	Neil Ryan<br>\r\n<b>Favourite Player:</b>	Craig ‘Cockatoo’ Crowe<br>\r\n<b>Other Sports:</b>	Soccer<br>\r\n<b>Butchers Debut:</b>	Cant remember, 1995 I think<br>\r\n<b>Hobbies:</b>	Schooners, Corrimal Pub<br>\r\n<b>3 Dinner Guests you\\''d invite:</b>	Eric Cantona, Sir Alex Ferguson Jenna Jameson <br>\r\n<b>Favourite Movie &amp; TV Show:</b>	Trainspotting &amp; The Simpsons<br>\r\n<b>Dream Job:</b>	Gigilo', '', '', '', '', '48796_image_member.jpg', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (41, 'Scott', 'Beckett', '', 1, 1, 'scoobeck25@hotmail.com', 0, 0, 0, 0, 0, 1, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', '42665_image_member.jpg', 'CS44.jpg', 'CS45.jpg', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (42, 'Chris', 'Mortimer', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (43, 'Lee', 'Clouten', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Fast', '<br>', '', '', '', '', '270222443_Jah7u-M.jpg', 'CS130.jpg', '270220789_qGUMM-M.jpg', '270651120_EcGNi-M.jpg', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (44, 'Rod', 'Wishart', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '15 October 1968, Gerringong, NSW Australia', 'Right Hand Bat', 'Right Arm Medium', '<p><b>Rod Wishart</b> is an <a href=\\"http://en.wikipedia.org/wiki/Australia\\" title=\\"Australia\\">Australian</a> former <a href=\\"http://en.wikipedia.org/wiki/Rugby_league\\" title=\\"Rugby league\\">rugby league</a> footballer who played for <a href=\\"http://en.wikipedia.org/wiki/Illawarra_Steelers\\" title=\\"Illawarra Steelers\\">Illawarra Steelers</a>, <a href=\\"http://en.wikipedia.org/wiki/St._George_Illwarra_Dragons\\" title=\\"St. George Illwarra Dragons\\" class=\\"mw-redirect\\">St. George Illwarra Dragons</a>, <a href=\\"http://en.wikipedia.org/wiki/New_South_Wales_state_rugby_league_team\\" title=\\"New South Wales state rugby league team\\">New South Wales</a> and <a href=\\"http://en.wikipedia.org/wiki/Australia_national_rugby_league_team\\" title=\\"Australia national rugby league team\\">Australia</a>.</p>\r\n<p>He grew up in <a href=\\"http://en.wikipedia.org/wiki/Gerringong,_New_South_Wales\\" title=\\"Gerringong, New South Wales\\">Gerringong, New South Wales</a>, where he was coached by <a href=\\"http://en.wikipedia.org/wiki/Mick_Cronin_%28rugby_league%29\\" title=\\"Mick Cronin (rugby league)\\">Mick Cronin</a>. Wishart played his first match for the <a href=\\"http://en.wikipedia.org/wiki/Illawarra_Steelers\\" title=\\"Illawarra Steelers\\">Illawarra Steelers</a> in <a href=\\"http://en.wikipedia.org/wiki/1989\\" title=\\"1989\\">1989</a>, and was already a state representative in <a href=\\"http://en.wikipedia.org/wiki/1990\\" title=\\"1990\\">1990</a>. In <a href=\\"http://en.wikipedia.org/wiki/1991\\" title=\\"1991\\">1991</a>, Wishart became the first Steelers player to be selected to play for <a href=\\"http://en.wikipedia.org/wiki/Australian_Kangaroos\\" title=\\"Australian Kangaroos\\" class=\\"mw-redirect\\">Australia</a>. Wishart was a competent <a href=\\"http://en.wikipedia.org/wiki/Rugby_league_positions#Wing\\" title=\\"Rugby league positions\\">winger</a>,\r\nand also proved to be an asset as a goal kicker. Rod was a strong ball\r\nrunner and kicker, due to his powerful quadricep muscles. They were so\r\nimpressive, he often had trouble finding suitable team attire.\r\nTestament to this was that he was once sighted on a flight returning\r\nfrom playing the Brisbane Broncos in 1990, in a team shirt, tie, and\r\nteam football shorts.</p><p>More information at <a href=\\"http://http://en.wikipedia.org/wiki/Rod_Wishart\\">Wikipedia</a>, the free encyclopedia.</p>', '', '', '', '', 'rodwishartprofile.jpg', '270650928_6JUmf-M.jpg', '270650722_KhxA9-M.jpg', '', 1, 0, 1, '2008-10-01', '2008-10-21');
INSERT INTO `players` VALUES (45, 'Stephen', 'Bond', '', 1, 1, 'sbondy84@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', 'Sacked Fitness Co-Ordinator', '', '', '', '', 'SBond_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (46, 'M', 'Johnston', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (47, 'D', 'Murphy', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (48, 'A', 'Lebsanft', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (49, 'T', 'Stanham', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (50, 'D', 'Marshall', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (51, 'N', 'Honavar', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (52, 'A', 'Broadhead', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (53, 'A', 'Broyd', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (54, 'A', 'Cheadle', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (55, 'Tim', 'Moore', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (56, 'Jack', 'Dobinson', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (57, 'York', 'Stanham', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (58, 'Nathan', 'Lawson', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (59, 'Paul', 'Dunn', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (60, 'Simon', 'Williams', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (61, 'Patrick', 'Williamson', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (62, 'Matthew', 'Williams', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (63, 'James', 'Pirie', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (64, 'Kyle', 'Kruger', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (65, 'Anthony', 'Butler', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (66, 'Peter', 'Cleaves', '', 1, 3, 'peter.cleaves@integral.com.au', 0, 0, 0, 0, 0, 1, 0, '', 'Right Hand Bat', 'Right Arm Fast Medium', '<br>', '', '', '', '', 'petecleaves07.jpg', '270584038_qgKe7-M.jpg', '270584820_MN3yz-M.jpg', '270585890_EFuM9-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (67, 'Chris', 'Brown', '', 1, 2, 'chrisb8884@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Slow', '', '', '', '', '', '42670_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (68, 'D', 'Bogavac', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (69, 'A', 'Johnson', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (70, 'D', 'Dekleva', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (71, 'D', 'Giorgio', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (72, 'B', 'Lattin', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (73, 'D', 'Benson', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (74, 'P', 'Murphy', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (75, 'N', 'Benson', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (76, 'H', 'Yates', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (77, 'S', 'Rayner', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (78, 'D', 'Paquola', '', 6, 22, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (79, 'Dean', 'Martin', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'CS215.jpg', '270380138_a5wD3-M.jpg', '270381284_tAxwy-M.jpg', '270381856_oTUvw-M.jpg', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (80, 'Cameron', 'Bell', '', 1, 3, 'chooksta_88@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Slow', '<br>', '', '', '', '', '42669_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (81, 'Adam', 'Anderson', '', 1, 3, 'adamando@optusnet.com.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'adamandersonprofile07.jpg', '270624739_WQmWu-M.jpg', '270625050_9Psou-M.jpg', '270634221_EoYqE-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (82, 'J', 'Trindall', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (83, 'N', 'Thompson', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (84, 'A', 'Smith', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (85, 'D', 'Hoff', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (86, 'T', 'Dutton', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (87, 'J', 'Berriman', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (88, 'J', 'Bainbridge', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (89, 'D', 'William', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (90, 'M', 'Johnson', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (91, 'D', 'Hassan', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (92, 'P', 'Kilby', '', 7, 26, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (93, 'Brett', 'Cleaves', '', 1, 2, 'Brett.Cleaves@bluescopesteel.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', 'aka bert, cartman, ranatunga, fat wickey, dickhead etc, its ok I can take it :)\r\n\r\nFirst senior game 1991-92. First full season 1992-93\r\n\r\nAlso wests are red scum carnts', '', '', '', '', 'brettcleavesprofile06.jpg', 'CS168.jpg', 'CS35.jpg', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (94, 'Brad', 'Dean', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (95, 'T', 'Ward', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (96, 'A', 'Forshaw', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (97, 'S', 'Crowe', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (98, 'J', 'Walker', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (99, 'T', 'Sinclair', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (100, 'J', 'Piper', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (101, 'A', 'Morris', '', 2, 6, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (102, 'Ryan', 'Hunter', '', 1, 3, 'hunter_1312@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '42678_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (103, 'Pat', 'Tobin', '', 1, 4, 'Patrick.Tobin@au.harveynorman.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Slow', '<br>', '', '', '', '', '270383087_QzeSz-S.jpg', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (104, 'Jamal', 'Banfield', '', 1, 2, 'todays_lesson@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Left Hand Bat', 'Left Arm Fast Medium', '<br>', '', '', '', '', 'jamalbanfieldprofile07.jpg', '270385555_7opXc-M.jpg', '270388565_gQSin-M.jpg', '270388065_n5pjX-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (105, 'S', 'Sunderland', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (106, 'P', 'Adams', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (107, 'B', 'Billett', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (108, 'S', 'Brown', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (109, 'M', 'Murzevski', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (110, 'I', 'Murray', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (111, 'Geordie', 'Crawford', '', 1, 2, 'lisamaxc@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', '42821_image_member.jpg', '270673731_iivqD-S.jpg', '270674328_AqzTN-M.jpg', '270671979_zgRZx-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (112, 'S', 'Gray', '', 3, 10, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (113, 'S', 'Wright', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (114, 'C', 'Johnson', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (115, 'M', 'Felgate', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (116, 'P', 'Chrostowski', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (117, 'C', 'Lewis', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (118, 'N', 'Bently', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (119, 'G', 'McDonald', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (120, 'S', 'Mutch', '', 4, 14, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (121, 'J', 'Pease', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (122, 'M', 'Welsh', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (123, 'J', 'Faulks', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (124, 'R', 'Brown', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (125, 'N', 'Chater', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (126, 'D', 'Treadwell', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (127, 'F', 'Daley', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (128, 'D', 'Mason', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (129, 'C', 'Wilson', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (130, 'R', 'Morrison', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (131, 'M', 'Blodes', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (132, 'Huw', 'Kinsella', '', 1, 2, 'huwkinsella@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Fast', 'I think he lives in Wales.', '', '', '', '', '271345857_sGSjV-M.jpg', '271347388_bJF45-M.jpg', '270671427_FRmRm-M.jpg', '270672142_5Mrdj-M.jpg', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (133, 'Rhys', 'Marsh', '', 1, 2, 'rmarsh24@bigpond.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'RMarsh.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (134, 'J', 'McCleary', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (135, 'Jeremy', 'Tosswill', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (136, 'L', 'Sproal', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (137, 'M', 'Nurka', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (138, 'R', 'Bull', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (139, 'S', 'Glenn', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (140, 'M', 'Mulready', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (141, 'P', 'Jones', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (142, 'A', 'Gooley', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (143, 'D', 'Richards', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (144, 'A', 'Hopkinson', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (145, 'S', 'Davies', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (146, 'J', 'Hall', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (147, 'J', 'Olsen', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (148, 'M', 'Luskin', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (149, 'P', 'Daley', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (150, 'H', 'Daley', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (151, 'B', 'Hunter', '', 8, 30, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (152, 'P', 'Yed', '', 9, 34, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (153, 'Tim', 'McKenzie', '', 1, 1, 'timmckenzie83@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Left Hand Bat', 'Left Arm Off Spin', 'I\\''m the best there is, plain and simple. I mean, I wake up in the morning and I piss excellence.', '', '', '', '', 'TM_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (154, 'Stephen', 'Brooks', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Left Arm Medium', '<br>', '', '', '', '', 'SB_image_member.jpg', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (155, 'Mark', 'Cottom', '', 1, 1, 'mcottom@kells.com.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Left Arm Off Spin', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (156, 'R', 'Mattas', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (157, 'D', 'Lee', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (158, 'M', 'Skora', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (159, 'J', 'Fulton', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (160, 'B', 'Clare', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (161, 'B', 'Purcell', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (162, 'B', 'Thomas', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (163, 'D', 'Beretov', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (164, 'A', 'McCarten', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (165, 'S', 'Blissenden', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (166, 'A', 'Balgi', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (167, 'R', 'Marmont', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (168, 'A', 'Day', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (169, 'C', 'Cenis', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (170, 'J', 'Welsh', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (171, 'S', 'Fanning', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (172, 'T', 'Long', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (173, 'Mitchum', 'Walters', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '270581908_ZUr4R-M.jpg', 'CS121.jpg', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (174, 'L', 'Boncompagni', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (175, 'N', 'Dodd', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (176, 'P', 'Warren', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (177, 'A', 'Tougher', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (178, 'J', 'Kriss', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (179, 'G', 'Warren', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (180, 'S', 'Crewdson', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (181, 'P', 'Rowe', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (182, 'M', 'Edgar', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (183, 'D', 'Potts', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (184, 'P', 'Beasley', '', 6, 21, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (185, 'D', 'Gleeson', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (186, 'S', 'Blizzard', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (187, 'A', 'Watts', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (188, 'D', 'Sloane', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (189, 'W', 'Ganderton', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (190, 'S', 'Merivale', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (191, 'C', 'Brunton', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (192, 'M', 'Pearce', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (193, 'J', 'Dickie', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (194, 'G', 'Phillis', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (195, 'A', 'Butler', '', 10, 37, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (196, 'A', 'Cadet', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (197, 'M', 'Curry', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (198, 'K', 'Wilmott', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (199, 'A', 'Northridge', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (200, 'N', 'Cohen', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (201, 'S', 'Northridge', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (202, 'D', 'Paine', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (203, 'B', 'Bell', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (204, 'L', 'Brady', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (205, 'T', 'Lloyd', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (206, 'R', 'Mullaly', '', 2, 5, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (207, 'J', 'Nupier', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (208, 'H', 'Horne', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (209, 'A', 'Hickson', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (210, 'R', 'Marsh', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (211, 'G', 'Jones', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (212, 'S', 'Davies', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (213, 'G', 'Wray', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (214, 'T', 'Bozinovski', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (215, 'N', 'Dufty', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (216, 'G', 'Harvey', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (217, 'Hugh', 'Fullagar', '', 1, 1, 'hughfullagar@yahoo.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '', '', '', '', '', '42820_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (218, 'A', 'Cox', '', 11, 38, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (219, 'B', 'Latif', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (220, 'P', 'Viera', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (221, 'C', 'Doering', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (222, 'J', 'Diggins', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (223, 'L', 'Parr', '', 3, 9, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (224, 'Kerry', 'Penfold', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (225, 'Ryan', 'Chatterton', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (226, 'Darren', 'O\\''Connell', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (227, 'Rob', 'Hill', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (228, 'Owen', 'Babula', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (229, 'John', 'Murphy', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (230, 'Mitch', 'Simpson', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (231, 'Matt', 'Yeaman', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (232, 'Andrew', 'Newman', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (233, 'Phil', 'Dellorifce', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (234, 'Ty', 'Cherry', '', 12, 42, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (235, 'K', 'Evans', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (236, 'G', 'Prouten', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (237, 'C', 'Hamer', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (238, 'N', 'Bell', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (239, 'R', 'Hettigrachchi', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (240, 'J', 'Cheadle', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (241, 'P', 'Broyd', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (242, 'D', 'Pahek', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (243, 'S', 'Smith', '', 4, 13, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (244, 'P', 'Mason', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (245, 'J', 'Brockley', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (246, 'J', 'Lehane', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (247, 'S', 'Wilson', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (248, 'M', 'Johnson', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (249, 'C', 'Shepherd', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (250, 'J', 'Fleming', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (251, 'M', 'Toussis', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (252, 'M', 'Luskan', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (253, 'S', 'Jones', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (254, 'D', 'Williamson', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (255, 'D', 'Shipp', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (256, 'D', 'Henderson', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (257, 'L', 'McNamara', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (258, 'K', 'Miller', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (259, 'W', 'Livermore', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (260, 'G', 'Stinson', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (261, 'S', 'Tobin', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (262, 'N', 'Eastwood', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (263, 'S', 'Tutton', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (264, 'B', 'Boyall', '', 9, 33, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (265, 'Gary', 'Benstead', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (266, 'Phil', 'Brown', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (267, 'Keith', 'Bradley', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (268, 'Pat', 'Cooney', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (269, 'George', 'Coulton', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (270, 'Don', 'Geary', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (271, 'Jim', 'Gordon', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (272, 'Bill', 'Langdon', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (273, 'George', 'Laughlin', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (274, 'Clive', 'Loughrey', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (275, 'Pat', 'Nolan', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (276, 'Ray', 'Potter', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (277, 'Allan', 'Sefton', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (278, 'Peter', 'Shephard', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '27th September, 1964', '', '', '<b>Talent:</b>	Getting under peoples skin<br>\r\n<b>Grew Up in:</b>	Woonona - Bellambi<br>\r\n<b>Schools:</b>	Woonona Public - Bellambi Public - Woonona High<br>\r\n<b>Job:</b>	Operations Manager<br>\r\n<b>Best Bowling:</b>	8 for 3 in under 10’s Corrimal V Thirroul - Corrimal Debut.<br>\r\n<b>Best Batting:</b>	103 or 98 against West in Third Grade (Butchers can’t count)<br>\r\n<b>Best Achievement:</b>	76 wickets at 2.76 in under 10’s<br>\r\n<b>Likes:</b>	My Wife (Jennifer)<br>\r\n<b>Dislikes:</b>	John Howard<br>\r\n<b>Favourite Player:</b>	Ian Chappell - Ricky Ponting<br>\r\n<b>Other Sports:</b>	State Rep, Long Distance and Cross Country Running.<br>\r\n<b>Butchers Debut:</b>	8 year old for Woonona - Coach Don Geary (Butcher Life Member)<br>\r\n<b>Hobbies:</b>	Political Activities<br>\r\n<b>3 Dinner Guests you\\''d invite:</b>	Paul Keating, Jackson Brown, Tony Blair<br>\r\n<b>Favourite Movie &amp; TV Show:</b>	Stargate - Stargate Atlantes<br>\r\n<b>Dream Job:</b>	Prime Minister', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (279, 'Allan', 'Sutherland', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (280, 'George', 'Thirtle', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'georgethirtle.jpg', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (281, 'Charles', 'Woods', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (282, 'Eddy (E.E.)', 'Woods', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (283, 'Rod', 'Wright', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'rodwright.jpg', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (284, 'Barry', 'Voller', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (285, 'Jesse', 'O\\''Hare', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (286, 'Sam', 'Cahill', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (287, 'Dan', 'Jones', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (288, 'Hayden', 'Horne', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (289, 'Glenn', 'Hamblen', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (290, 'Matt', 'Tyler', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (291, 'Stuart', 'Quine', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (292, 'Ben', 'Czykowski', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (293, 'Sam', 'O\\''Leary', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (294, 'Matt', 'Crouch', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (295, 'Travis', 'McMatton', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (296, 'L', 'Haywood', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (297, 'C', 'Detheridge', '', 13, 43, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (298, 'Ryan', 'Davidson', '', 1, 4, 'davo_2516@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'CS216.jpg', '245296621_k9zyR-M.jpg', '245295848_4CEGQ-M.jpg', '271334308_gpdpM-M.jpg', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (299, 'Mark', 'Keefe', '', 1, 4, 'markkeefe@hotmail.com', 0, 0, 0, 0, 0, 1, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'markkeefeprofile07.jpg', '270382872_ZK25D-M.jpg', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (300, 'Clarry', 'Cook', '', 1, 45, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '42802_image_member.jpg', '270378624_t6u9d-S.jpg', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (301, 'Matt', 'Craig', '', 1, 4, 'prittyin_pink@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Fast Medium', '', '', '', '', '', '42803_image_member.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (302, 'Jack', 'Daskey', '', 1, 4, 'daskey13@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'jackdaskeyprofile07.jpg', '270375389_n69y3-M.jpg', '270379039_bHvP5-M.jpg', '270378862_UQRjG-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (303, 'Ben', 'Paulson', '', 1, 3, 'bjp114@uow.edu.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Slow', '', '', '', '', '', '242806343_uYLsp-S.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (304, 'Greg', 'Martin', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', 'gregmartinprofile07.jpg', '270376809_QgvJT-M.jpg', '270380490_arYhF-M.jpg', '270380324_bzBRb-M.jpg', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (305, 'Matt', 'Benstead', '', 1, 3, 'matthew.benstead@boc.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'After 2 seasons away from the Butchers (due to living in NZ for work) I am back! I like to think I can hold a bat when required ...but I seem to have made a \\"career\\" of being a bowler with the Butchers sides I\\''ve played in. I\\''m looking to forward to more runs and more wickets in 08/09.', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (306, 'Jeff', 'Charlesworth', '', 1, 2, 'charles.worth@bigpond.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'JCharlesworth.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (307, 'Gary', 'Neilson', '', 1, 45, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'garyneilson.jpg', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (308, 'Shaun', 'Helt', '', 1, 45, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (309, 'Adam', 'Van Wijk', '', 1, 45, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', '42822_image_member.jpg', '270386342_ugSpB-M.jpg', '270386531_MTqkw-M.jpg', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (310, 'Lee', 'Hudson', '', 1, 45, 'deannaventers@bigpond.com.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (311, 'Dave', 'Joinking', '', 1, 45, 'david.joinking@sswahs.nsw.gov.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (312, 'Lewis', 'Wilson', '', 1, 4, 'lw178@uow.edu.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (313, 'David', 'Bailey', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'Currently playing Under 16\\''s.', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (314, 'Daniel', 'Bond', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (315, 'Brett', 'Buckley', '', 1, 4, 'brettbuckley@aapt.net.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (316, 'J', 'Caputi', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (317, 'L', 'Boatswain', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (318, 'N', 'Theodossiadis', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (319, 'C', 'Butler', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (320, 'R', 'Boatswain', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (321, 'P', 'Curtis', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (322, 'J', 'Parle', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (323, 'D', 'Perger', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (324, 'A', 'Duda', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (325, 'E', 'Clifford', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (326, 'J', 'Peiris', '', 5, 20, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (327, 'Will', 'O\\''Rourke', '', 1, 4, 'vashti215@yahoo.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (328, 'G', 'Gibson', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (329, 'D', 'Macpherson', '', 5, 17, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (330, 'D', 'Brown', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (331, 'M', 'Webb', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (332, 'A', 'Birkin', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (333, 'A', 'Last', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (334, 'R', 'Humpel', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (335, 'L', 'Sikora', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (336, 'C', 'Last', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (337, 'A', 'Noronha', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (338, 'C', 'Harvey', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (339, 'Matt', 'Hancox', '', 1, 4, 'stargate885@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '26th December, 1988', '', '', '<b>Nickname:</b>	Hancox<br>\r\n<b>Talent:</b>	Can Beat anyone at singstar<br>\r\n<b>Grew Up in:</b>	Woonona<br>\r\n<b>Schools:</b>	Cedars Christian College<br>\r\n<b>Job:</b>	Apprentice Fitter<br>\r\n<b>Best Bowling:</b>	-<br>\r\n<b>Best Batting:</b>	43<br>\r\n<b>Best Achievement:</b>	Once trained to lick own elbow.. and succeded <br>\r\n<b>Likes:</b>	Heavy Metal<br>\r\n<b>Dislikes:</b>	Whingers<br>\r\n<b>Favourite Player:</b>	Brad Hodge<br>\r\n<b>Other Sports:</b>	Touch Footy<br>\r\n<b>Butchers Debut:</b>	1998 in juniors 2005 in ND<br>\r\n<b>Hobbies:</b>	Guitar <br>\r\n<b>3 Dinner Guests you\\''d invite:</b>	My girlfriend, John Howard and Gary Coleman<br>\r\n<b>Favourite Movie &amp; TV Show:</b>	Dumb and Dumber and The OC-rip<br>\r\n<b>Dream Job:</b>	Bed Tester', '', '', '', '', '42677_image_member.jpg', '270385917_dtMb9-M.jpg', '270387577_2sq5z-M.jpg', '270387905_JaLHq-M.jpg', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (340, 'Simon', 'Gilkes', '', 1, 45, 'sgilkes@exemail.com.au', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', '42805_image_member.jpg', '270375958_gqqHW-M.jpg', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (341, 'Sam', 'Gilkes', '', 1, 45, 'super_mexican_man@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (342, 'Jeremy', 'Lum', '', 1, 4, 'jeza_sk8on@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '<br>', '', '', '', '', 'CS210.jpg', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (343, 'E', 'Denhartog', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (344, 'Mick', 'Essenstam', '', 1, 4, 'mickessentam@iprimus.com.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (345, 'J', 'Kirkland', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (346, 'M', 'Black', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (347, 'J', 'Sullivan', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (348, 'M', 'Cole', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (349, 'D', 'Owen', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (350, 'D', 'Bindall', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (351, 'S', 'Cameron', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (352, 'T', 'Cole', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (353, 'D', 'Starias', '', 4, 16, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (354, 'W', 'Johnston', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (355, 'D', 'Russell', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (356, 'D', 'Reid', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (357, 'Y', 'Yofcheyich', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (358, 'C', 'Holdsworth', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (359, 'H', 'Heiler', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (360, 'J', 'Hurry', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (361, 'C', 'Hogan', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (362, 'S', 'Dobbins', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (363, 'A', 'Horsley', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (364, 'M', 'Butler', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (365, 'M', 'Deans', '', 6, 24, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (366, 'J', 'Druce', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (367, 'G', 'Lundle', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (368, 'C', 'Brady', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (369, 'R', 'Kloyer', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (370, 'M', 'Derrick', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (371, 'B', 'O\\''Toole', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (372, 'S', 'Laws', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (373, 'H', 'Duncan', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (374, 'M', 'Munn', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (375, 'G', 'Edwards', '', 2, 8, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (376, 'Yasir', 'Khan', '', 1, 4, 'khan1yas@gmail.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (377, 'C', 'Betts', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (378, 'S', 'Coleman', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (379, 'J', 'Stacey', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (380, 'A', 'Andrews', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (381, 'H', 'Ramsay', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (382, 'J', 'Theodossiadis', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (383, 'J', 'Moran', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (384, 'T', 'Coleman', '', 5, 18, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (385, 'D', 'Birkin', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (386, 'L', 'Marsden', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (387, 'R', 'Buttler', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (388, 'I', 'Dickerson', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (389, 'J', 'Birkin', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (390, 'G', 'Flack', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (391, 'B', 'Mulcahy', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (392, 'W', 'Mulcahy', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (393, 'M', 'Head', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (394, 'P', 'Sumner', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (395, 'B', 'Magennis', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (396, 'D', 'Sumner', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (397, 'A', 'Kirkland', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (398, 'D', 'Lawler', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (399, 'J', 'Cann', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (400, 'D', 'Dal Bon', '', 11, 48, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (401, 'Jon', 'Lowe', '', 1, 45, 'jml007@uow.edu.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (402, 'Brett', 'Pincham', '', 1, 45, 'brett.pincham@yahoo.com.au', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'Keen to get back playing cricket again to see how I go.', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (403, 'C', 'Steele', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (404, 'C', 'Peace', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (405, 'C', 'Duda', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (406, 'P', 'O\\''Brien', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (407, 'T', 'Boncompagni', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (408, 'G', 'Devitt', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (409, 'D', 'Sommer', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (410, 'K', 'Najov', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (411, 'S', 'Maitland', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (412, 'S', 'McCullock', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (413, 'W', 'Ganaleda', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (414, 'G', 'Jackson', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (415, 'V', 'Radha', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (416, 'D', 'Bendall', '', 4, 15, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (417, 'Mal', 'French', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', 'malfrenchprofile07.jpg', '270377286_6jnMb-M.jpg', '270377433_DBNBi-M.jpg', '', 1, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (418, 'C', 'McKay', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (419, 'C', 'Ledwidge', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (420, 'D', 'Gray', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (421, 'D', 'Van Der Laan', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (422, 'K', 'Donahey', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (423, 'G', 'Behan', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (424, 'B', 'Godwin', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (425, 'P', 'Head', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (426, 'M', 'Jackson', '', 7, 27, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (427, 'Mark', 'Johnson', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '', '', '', '', '', 'markjohnsonportrait.jpg', 'markjohnsonaction.jpg', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (428, 'Troy', 'Parkee', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (429, 'Kyle', 'Connor', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'kyleconnor.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (430, 'Darren', 'Elliott', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (431, 'Russell', 'Shephard', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (432, 'Craig', 'Crowe', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (433, 'Matthew', 'Pogson', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'matthewpogson.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (434, 'Joshua', 'Millington', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (435, 'Tavis', 'Ryan-Colton', '', 1, 1, 'tavis1887@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'I love cricket. I love the Butchers. I love playing cricket for the Butchers.', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (436, 'Zac', 'Robinson', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (437, 'Mark', 'Brooks', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (438, 'Mark', 'Quoyle', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (439, 'A', 'Warren', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (440, 'A', 'Oliver', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (441, 'D', 'Cameron', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (442, 'N', 'Johnston', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (443, 'A', 'Simmons', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (444, 'C', 'Nanasi', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (445, 'R', 'Van Kompan', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (446, 'K', 'Freeman', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (447, 'S', 'Lane', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (448, 'C', 'Law', '', 8, 31, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (449, 'M', 'Payne', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (450, 'T', 'Borgo', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (451, 'J', 'Hanna', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (452, 'J', 'Devitt', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (453, 'S', 'Edmondson', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (454, 'D', 'Murphy', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (455, 'R', 'Irvine', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (456, 'P', 'Drenkhahn', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (457, 'S', 'Abbott', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (458, 'A', 'Irish', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (459, 'A', 'Wollard', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (460, 'A', 'Dickinson', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (461, 'B', 'Reid', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (462, 'M', 'Williams', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (463, 'M', 'Luskan', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (464, 'D', 'Morris', '', 9, 35, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (465, 'Jason', 'Wilson', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Medium', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (466, 'Duncan', 'McAndrew', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'duncanmcandrew.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (467, 'Paul', 'Campbell', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (468, 'Tony', 'McQuisten', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (469, 'Kevin', 'Raffler', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (470, 'Jason', 'Smith', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (471, 'Ron', 'Glass', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (472, 'Ron', 'Johnson', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (473, 'Brett', 'Farragher', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (474, 'Brett', 'Condron', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (475, 'Graeme', 'Scullen', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (476, 'Brad', 'Burrows', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (477, 'Terry', 'Fleming', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (478, 'Bruce', 'Jones', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (479, 'Michael', 'Stephenson', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (480, 'Andrew', 'Johnson', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'andrewjohnson.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (481, 'Steven', 'Musgrove', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (482, 'Matt', 'Owers', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'mattowers.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (483, 'Paul', 'Connery', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'paulconnery.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (484, 'Steven', 'Heydon', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'steveheydon.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (485, 'Stuart', 'Tobin', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '', '', '', '', '', 'stobinportrait.jpg', 'stobinaction.jpg', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (486, 'Earle', 'Canvin', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'earlcanvin.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (487, 'Shay', 'Connor', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', 'shayconnor.jpg', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (488, 'G', 'Smede', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (489, 'G', 'Batty', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (490, 'P', 'Lynam', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (491, 'C', 'Sheppard', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (492, 'Andrew', 'Berwick', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (493, 'N', 'Coad', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (494, 'Dean', 'Merola', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (495, 'B', 'Smede', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (496, 'Damian', 'Merola', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (497, 'D', 'Studholme', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (498, 'D', 'Sillitoe', '', 8, 29, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (499, 'Shay', 'Davis', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (500, 'D', 'Stimson', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (501, 'J', 'Ayre', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (502, 'R', 'Piper', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (503, 'J', 'Ellem', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (504, 'W', 'Hettiarachchi', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (505, 'David', 'Bennett-Low', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (506, 'Paul', 'Theodossiadis', '', 5, 19, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (507, 'Rob', 'Potter', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (508, 'Craig', 'Dixon', '', 1, 3, 'dickodogg@hotmail.com', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'Loves beer...', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '2008-10-22');
INSERT INTO `players` VALUES (509, 'Peter', 'Dawson', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (510, 'Danson', 'Benstead', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', 'Ex-batting coach of Terry Alderman, Carl Rackemann and Glenn McGrath. My record speaks for itself. Am now working on teaching Shane Twatson the values of being average in every manner of cricket.', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (511, 'M', 'Lowe', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (512, 'M', 'Coughlan', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (513, 'J', 'Michalowski', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (514, 'J', 'Ulukita', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (515, 'P', 'Buckingham', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (516, 'J', 'Edwards', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (517, 'M', 'Tilden', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (518, 'G', 'Miller', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (519, 'B', 'Townsend', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (520, 'G', 'Tilden', '', 3, 12, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (521, 'Andy', 'Koutsoufis', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Fast Medium', '', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (522, 'Nick', 'Beattie', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (523, 'Steven', 'Khan', '', 1, 3, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (524, 'Brad', 'Carey', '', 1, 1, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (525, 'Mark', 'Lee', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (526, 'Craig', 'Buchan', '', 1, 2, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (527, 'Ben', 'Edmondson', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (528, 'Andrew', 'Metcalf', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, '2008-10-01', '0000-00-00');
INSERT INTO `players` VALUES (529, 'A', 'Adams', '', 8, 53, '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '<br>', '', '', '', '', '', '', '', '', 0, 0, 0, '2008-10-21', '0000-00-00');
INSERT INTO `players` VALUES (530, 'Jackson', 'Stewart', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Left Hand Bat', '', '<br>', '', '', '', '', 'jacksonstewartprofile07.jpg', '270376292_9WnyU-M.jpg', '270376483_f6xYR-M.jpg', '270378380_fEv6V-M.jpg', 0, 0, 0, '2008-10-22', '0000-00-00');
INSERT INTO `players` VALUES (531, 'Andrew', 'Stewart', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', '', '<br>', '', '', '', '', 'andrewstewartprofile07.jpg', '270377122_e2voB-M.jpg', '270377747_TKuFi-M.jpg', '270377886_SqWwT-M.jpg', 0, 0, 0, '2008-10-22', '0000-00-00');
INSERT INTO `players` VALUES (532, 'Bryce', 'Hilliard', '', 1, 4, '', 0, 0, 0, 0, 0, 0, 0, '', 'Right Hand Bat', 'Right Arm Off Spin', '<br>', '', '', '', '', 'brycehilliardprofile07.jpg', '270375807_KpaqS-M.jpg', '', '', 0, 0, 0, '2008-10-22', '0000-00-00');

-- --------------------------------------------------------

-- 
-- Table structure for table `results`
-- 

CREATE TABLE `results` (
  `team_id` int(4) NOT NULL default '0',
  `played` int(4) NOT NULL default '0',
  `won` int(4) NOT NULL default '0',
  `lost` int(4) NOT NULL default '0',
  `tied` int(4) NOT NULL default '0',
  `nr` int(4) NOT NULL default '0',
  PRIMARY KEY  (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `results`
-- 

INSERT INTO `results` VALUES (2, 19, 10, 5, 0, 4);
INSERT INTO `results` VALUES (10, 3, 0, 3, 0, 0);
INSERT INTO `results` VALUES (14, 2, 0, 1, 0, 1);
INSERT INTO `results` VALUES (1, 22, 9, 9, 0, 4);
INSERT INTO `results` VALUES (17, 5, 2, 1, 0, 2);
INSERT INTO `results` VALUES (18, 4, 0, 2, 0, 2);
INSERT INTO `results` VALUES (22, 3, 3, 0, 0, 0);
INSERT INTO `results` VALUES (26, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (6, 2, 0, 1, 0, 1);
INSERT INTO `results` VALUES (30, 2, 0, 2, 0, 0);
INSERT INTO `results` VALUES (34, 2, 1, 1, 0, 0);
INSERT INTO `results` VALUES (21, 2, 0, 2, 0, 0);
INSERT INTO `results` VALUES (4, 13, 8, 5, 0, 0);
INSERT INTO `results` VALUES (32, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (24, 4, 1, 3, 0, 0);
INSERT INTO `results` VALUES (20, 2, 1, 1, 0, 0);
INSERT INTO `results` VALUES (8, 2, 0, 2, 0, 0);
INSERT INTO `results` VALUES (9, 2, 0, 2, 0, 0);
INSERT INTO `results` VALUES (13, 2, 2, 0, 0, 0);
INSERT INTO `results` VALUES (25, 1, 0, 0, 0, 1);
INSERT INTO `results` VALUES (37, 1, 1, 0, 0, 0);
INSERT INTO `results` VALUES (5, 2, 1, 0, 0, 1);
INSERT INTO `results` VALUES (38, 1, 1, 0, 0, 0);
INSERT INTO `results` VALUES (42, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (29, 3, 1, 2, 0, 0);
INSERT INTO `results` VALUES (33, 1, 1, 0, 0, 0);
INSERT INTO `results` VALUES (3, 8, 1, 4, 0, 3);
INSERT INTO `results` VALUES (7, 1, 0, 0, 0, 1);
INSERT INTO `results` VALUES (43, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (12, 3, 3, 0, 0, 0);
INSERT INTO `results` VALUES (16, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (45, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (48, 1, 1, 0, 0, 0);
INSERT INTO `results` VALUES (19, 3, 2, 0, 0, 1);
INSERT INTO `results` VALUES (15, 1, 0, 0, 0, 1);
INSERT INTO `results` VALUES (27, 1, 0, 1, 0, 0);
INSERT INTO `results` VALUES (31, 1, 1, 0, 0, 0);
INSERT INTO `results` VALUES (35, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `schedule`
-- 

CREATE TABLE `schedule` (
  `id` smallint(6) NOT NULL auto_increment,
  `season` int(4) NOT NULL default '0',
  `league_id` int(4) NOT NULL default '0',
  `week` int(2) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `date2` datetime default NULL,
  `awayteam` int(4) NOT NULL default '0',
  `hometeam` int(4) NOT NULL default '0',
  `venue` int(4) NOT NULL default '0',
  `umpires` int(4) NOT NULL default '0',
  `scorecard` varchar(128) NOT NULL default '',
  `result` varchar(64) NOT NULL default '',
  `umpire1` int(4) NOT NULL default '0',
  `umpire2` int(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=85 ;

-- 
-- Dumping data for table `schedule`
-- 

INSERT INTO `schedule` VALUES (1, 9, 1, 1, '2008-10-04 00:00:00', NULL, 5, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (2, 9, 1, 1, '2008-10-04 00:00:00', NULL, 2, 6, 3, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (3, 9, 1, 1, '2008-10-04 00:00:00', NULL, 7, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (4, 9, 2, 2, '2008-10-11 00:00:00', '2008-10-18 00:00:00', 1, 17, 7, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (5, 9, 2, 2, '2008-10-11 00:00:00', '2008-10-18 00:00:00', 18, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (6, 9, 2, 2, '2008-10-11 00:00:00', '2008-10-18 00:00:00', 3, 19, 16, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (7, 9, 1, 1, '2008-10-11 00:00:00', NULL, 4, 20, 17, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (8, 9, 1, 2, '2008-10-18 00:00:00', NULL, 4, 12, 5, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (9, 9, 1, 1, '2008-10-11 00:00:00', NULL, 48, 45, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (10, 9, 1, 3, '2008-10-25 00:00:00', NULL, 52, 45, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (11, 9, 2, 3, '2008-10-25 00:00:00', '2008-11-01 00:00:00', 1, 9, 4, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (12, 9, 2, 3, '2008-10-25 00:00:00', '2008-11-01 00:00:00', 10, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (13, 9, 2, 3, '2008-10-25 00:00:00', '2008-11-01 00:00:00', 3, 11, 5, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (14, 9, 1, 3, '2008-10-25 00:00:00', NULL, 41, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (15, 9, 2, 4, '2008-11-08 00:00:00', '2008-11-15 00:00:00', 38, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (16, 9, 1, 5, '2008-11-22 00:00:00', '0000-00-00 00:00:00', 17, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (17, 9, 1, 6, '2008-11-29 00:00:00', '0000-00-00 00:00:00', 1, 9, 4, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (18, 9, 2, 7, '2008-12-06 00:00:00', '2008-12-07 00:00:00', 33, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (19, 9, 2, 8, '2008-12-13 00:00:00', '2008-12-20 00:00:00', 1, 5, 3, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (20, 9, 1, 9, '2009-01-10 00:00:00', '0000-00-00 00:00:00', 1, 38, 14, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (21, 9, 2, 10, '2009-01-17 00:00:00', '2009-01-24 00:00:00', 13, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (22, 9, 1, 11, '2009-01-31 00:00:00', '0000-00-00 00:00:00', 33, 1, 12, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (23, 9, 2, 12, '2009-02-07 00:00:00', '2009-02-14 00:00:00', 1, 25, 9, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (24, 9, 2, 13, '2009-02-21 00:00:00', '2009-02-28 00:00:00', 29, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (25, 9, 2, 14, '2009-03-07 00:00:00', '2009-03-14 00:00:00', 21, 1, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (26, 9, 2, 4, '2008-11-08 00:00:00', '2008-11-15 00:00:00', 2, 39, 14, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (27, 9, 1, 5, '2008-11-22 00:00:00', '0000-00-00 00:00:00', 2, 18, 7, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (28, 9, 1, 6, '2008-11-29 00:00:00', '0000-00-00 00:00:00', 10, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (29, 9, 2, 7, '2008-12-06 00:00:00', '2008-12-07 00:00:00', 2, 34, 12, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (30, 9, 2, 8, '2008-12-13 00:00:00', '2008-12-20 00:00:00', 6, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (31, 9, 1, 9, '2009-01-10 00:00:00', '0000-00-00 00:00:00', 39, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (32, 9, 2, 10, '2009-01-17 00:00:00', '2009-01-24 00:00:00', 2, 14, 6, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (33, 9, 1, 11, '2009-01-31 00:00:00', '0000-00-00 00:00:00', 34, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (34, 9, 2, 12, '2009-02-07 00:00:00', '2009-02-14 00:00:00', 26, 2, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (35, 9, 2, 13, '2009-02-21 00:00:00', '2009-02-28 00:00:00', 2, 30, 10, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (36, 9, 2, 14, '2009-03-07 00:00:00', '2009-03-14 00:00:00', 2, 22, 8, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (37, 9, 2, 4, '2008-11-08 00:00:00', '2008-11-15 00:00:00', 40, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (38, 9, 1, 5, '2008-11-22 00:00:00', '0000-00-00 00:00:00', 3, 19, 17, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (39, 9, 1, 6, '2008-11-29 00:00:00', '0000-00-00 00:00:00', 3, 11, 5, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (40, 9, 2, 7, '2008-12-06 00:00:00', '2008-12-07 00:00:00', 35, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (41, 9, 2, 8, '2008-12-13 00:00:00', '2008-12-20 00:00:00', 7, 3, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (42, 9, 1, 9, '2009-01-10 00:00:00', '0000-00-00 00:00:00', 3, 40, 20, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (43, 9, 2, 10, '2009-01-17 00:00:00', '2009-01-24 00:00:00', 15, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (44, 9, 1, 11, '2009-01-31 00:00:00', '0000-00-00 00:00:00', 3, 35, 27, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (45, 9, 2, 12, '2009-02-07 00:00:00', '2009-02-14 00:00:00', 3, 27, 28, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (46, 9, 2, 13, '2009-02-21 00:00:00', '2009-02-28 00:00:00', 31, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (47, 9, 2, 14, '2009-03-07 00:00:00', '2009-03-14 00:00:00', 23, 3, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (48, 9, 1, 4, '2008-11-01 00:00:00', '0000-00-00 00:00:00', 36, 4, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (49, 9, 1, 5, '2008-11-08 00:00:00', '0000-00-00 00:00:00', 8, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (50, 9, 1, 6, '2008-11-15 00:00:00', '0000-00-00 00:00:00', 4, 16, 16, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (51, 9, 1, 7, '2008-11-22 00:00:00', '0000-00-00 00:00:00', 4, 32, 23, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (52, 9, 1, 8, '2008-11-29 00:00:00', '0000-00-00 00:00:00', 4, 28, 28, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (53, 9, 1, 9, '2008-12-06 00:00:00', '0000-00-00 00:00:00', 24, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (54, 9, 1, 10, '2008-12-13 00:00:00', '0000-00-00 00:00:00', 20, 4, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (55, 9, 1, 11, '2008-12-20 00:00:00', '0000-00-00 00:00:00', 12, 4, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (56, 9, 1, 12, '2009-01-10 00:00:00', '0000-00-00 00:00:00', 4, 41, 21, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (57, 9, 1, 13, '2009-01-17 00:00:00', '0000-00-00 00:00:00', 4, 36, 24, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (58, 9, 1, 14, '2009-01-24 00:00:00', '0000-00-00 00:00:00', 4, 8, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (59, 9, 1, 15, '2009-01-31 00:00:00', '0000-00-00 00:00:00', 16, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (60, 9, 1, 16, '2009-02-07 00:00:00', '0000-00-00 00:00:00', 32, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (61, 9, 1, 17, '2009-02-15 00:00:00', '0000-00-00 00:00:00', 4, 24, 8, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (62, 9, 1, 18, '2009-02-21 00:00:00', '0000-00-00 00:00:00', 28, 4, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (63, 9, 1, 19, '2009-02-28 00:00:00', '0000-00-00 00:00:00', 4, 20, 28, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (64, 9, 1, 20, '2009-03-07 00:00:00', '0000-00-00 00:00:00', 4, 12, 5, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (65, 9, 3, 1, '2008-11-19 00:00:00', '0000-00-00 00:00:00', 1, 57, 29, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (66, 9, 3, 2, '2008-12-17 00:00:00', '0000-00-00 00:00:00', 1, 5, 3, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (67, 9, 3, 3, '2009-01-14 00:00:00', '0000-00-00 00:00:00', 58, 1, 6, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (68, 9, 1, 4, '2008-11-01 00:00:00', '0000-00-00 00:00:00', 45, 55, 14, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (69, 9, 1, 5, '2008-11-08 00:00:00', '0000-00-00 00:00:00', 45, 54, 5, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (70, 9, 1, 6, '2008-11-15 00:00:00', '0000-00-00 00:00:00', 51, 45, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (71, 9, 1, 7, '2008-11-22 00:00:00', '0000-00-00 00:00:00', 53, 45, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (72, 9, 1, 8, '2008-11-29 00:00:00', '0000-00-00 00:00:00', 50, 45, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (73, 9, 1, 9, '2008-12-06 00:00:00', '0000-00-00 00:00:00', 45, 49, 30, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (74, 9, 1, 10, '2008-12-13 00:00:00', '0000-00-00 00:00:00', 45, 56, 23, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (75, 9, 1, 11, '2008-12-20 00:00:00', '0000-00-00 00:00:00', 47, 45, 6, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (76, 9, 1, 12, '2009-01-10 00:00:00', '0000-00-00 00:00:00', 48, 45, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (77, 9, 1, 14, '2009-01-24 00:00:00', '0000-00-00 00:00:00', 45, 52, 26, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (78, 9, 5, 1, '2008-10-26 00:00:00', '0000-00-00 00:00:00', 1, 42, 15, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (79, 9, 1, 15, '2009-01-31 00:00:00', '0000-00-00 00:00:00', 55, 45, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (80, 9, 1, 16, '2009-02-07 00:00:00', '0000-00-00 00:00:00', 54, 45, 2, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (81, 9, 1, 17, '2009-02-15 00:00:00', '0000-00-00 00:00:00', 51, 45, 1, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (82, 9, 1, 18, '2009-02-21 00:00:00', '0000-00-00 00:00:00', 45, 53, 24, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (83, 9, 1, 19, '2009-02-28 00:00:00', '0000-00-00 00:00:00', 50, 45, 19, 0, '', '', 0, 0);
INSERT INTO `schedule` VALUES (84, 9, 1, 20, '2009-03-07 00:00:00', '0000-00-00 00:00:00', 49, 45, 19, 0, '', '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_batting_details`
-- 

CREATE TABLE `scorecard_batting_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `batting_position` tinyint(4) NOT NULL default '0',
  `how_out` tinyint(4) default NULL,
  `runs` int(4) NOT NULL default '0',
  `assist` int(11) default NULL,
  `bowler` int(11) default NULL,
  `balls` int(11) NOT NULL default '0',
  `fours` tinyint(4) NOT NULL default '0',
  `sixes` tinyint(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `notout` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `opponent` int(4) NOT NULL default '0',
  KEY `batting_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `scorecard_batting_details`
-- 

INSERT INTO `scorecard_batting_details` VALUES (1, 1, 21, 1, 4, 10, 11, 13, 0, 1, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 22, 2, 4, 20, 11, 13, 0, 4, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 24, 3, 7, 1, 0, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 23, 4, 4, 6, 13, 4, 0, 1, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 26, 5, 4, 25, 8, 15, 0, 3, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 27, 6, 5, 3, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 18, 7, 2, 14, 0, 0, 0, 1, 0, 8, 1, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 17, 8, 4, 5, 9, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 25, 9, 3, 0, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 19, 10, 3, 1, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 1, 20, 11, 4, 0, 9, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 7, 1, 3, 26, 0, 19, 0, 1, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 4, 2, 4, 14, 0, 17, 0, 2, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 8, 3, 4, 3, 0, 18, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 9, 4, 4, 23, 0, 17, 0, 3, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 10, 5, 3, 0, 0, 19, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 11, 6, 4, 0, 0, 20, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 12, 7, 2, 11, 0, 0, 0, 0, 0, 8, 1, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 13, 8, 4, 3, 0, 20, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 14, 9, 3, 4, 0, 20, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 15, 10, 2, 0, 0, 0, 0, 0, 0, 8, 1, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (1, 2, 16, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 7, 1, 7, 8, 0, 29, 0, 1, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 4, 2, 4, 7, 0, 29, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 28, 3, 4, 73, 0, 37, 0, 4, 1, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 9, 4, 10, 20, 0, 31, 0, 2, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 40, 5, 10, 5, 0, 31, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 8, 6, 4, 0, 0, 31, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 13, 7, 4, 4, 0, 38, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 15, 8, 9, 1, 0, 0, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 14, 9, 4, 44, 0, 29, 0, 2, 2, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 10, 10, 7, 2, 0, 29, 0, 0, 0, 8, 0, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 1, 2, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 30, 1, 4, 39, 14, 13, 0, 4, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 31, 2, 4, 2, 8, 14, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 32, 3, 4, 7, 8, 14, 0, 1, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 33, 4, 4, 0, 28, 14, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 34, 5, 9, 9, 0, 0, 0, 1, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 29, 6, 2, 15, 0, 0, 0, 1, 0, 8, 1, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 35, 7, 4, 3, 0, 14, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 36, 8, 5, 5, 0, 28, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 37, 9, 9, 11, 28, 0, 0, 0, 1, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 38, 10, 9, 2, 28, 0, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (2, 2, 39, 11, 3, 4, 0, 28, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 41, 1, 3, 16, 0, 52, 0, 1, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 3, 2, 3, 0, 0, 52, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 42, 3, 4, 6, 51, 53, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 13, 4, 3, 4, 0, 53, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 1, 5, 4, 23, 53, 49, 0, 1, 1, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 43, 6, 4, 0, 54, 49, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 44, 7, 4, 2, 53, 54, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 28, 8, 7, 0, 0, 54, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 14, 9, 4, 7, 53, 49, 0, 0, 1, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 15, 10, 10, 13, 0, 54, 0, 0, 1, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 1, 45, 11, 2, 2, 0, 0, 0, 0, 0, 8, 1, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (3, 2, 46, 1, 2, 30, 0, 0, 0, 0, 2, 8, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (3, 2, 47, 2, 7, 9, 0, 43, 0, 1, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (3, 2, 48, 3, 3, 10, 0, 15, 0, 1, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (3, 2, 49, 4, 2, 38, 0, 0, 0, 6, 0, 8, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 55, 1, 4, 24, 67, 13, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 56, 2, 3, 24, 0, 13, 0, 1, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 57, 3, 7, 25, 0, 14, 0, 1, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 58, 4, 3, 42, 0, 14, 0, 4, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 59, 5, 3, 8, 0, 28, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 60, 6, 4, 31, 42, 28, 0, 4, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 61, 7, 2, 26, 0, 0, 0, 1, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 62, 8, 4, 7, 42, 28, 0, 1, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 63, 9, 2, 0, 0, 0, 0, 0, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 64, 10, 1, 0, 0, 0, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 1, 65, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (4, 2, 7, 1, 2, 2, 0, 0, 0, 0, 0, 8, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (4, 2, 6, 2, 2, 2, 0, 0, 0, 0, 0, 8, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 68, 1, 4, 46, 8, 15, 0, 3, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 69, 2, 3, 2, 0, 14, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 70, 3, 3, 3, 0, 15, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 71, 4, 7, 42, 0, 4, 0, 2, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 72, 5, 7, 17, 0, 15, 0, 2, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 73, 6, 7, 5, 0, 14, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 74, 7, 4, 0, 4, 15, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 75, 8, 3, 0, 0, 15, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 76, 9, 2, 20, 0, 0, 0, 2, 0, 8, 1, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 77, 10, 3, 0, 0, 14, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 1, 78, 11, 4, 3, 8, 15, 0, 0, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 7, 1, 7, 11, 0, 77, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 4, 2, 3, 10, 0, 77, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 14, 3, 4, 25, 71, 74, 0, 3, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 28, 4, 2, 49, 0, 0, 0, 7, 0, 8, 1, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 2, 5, 7, 1, 0, 74, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 79, 6, 4, 3, 69, 77, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 80, 7, 4, 2, 73, 76, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 8, 8, 3, 27, 0, 74, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 15, 9, 4, 23, 73, 75, 0, 4, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 10, 10, 7, 2, 0, 75, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 2, 81, 11, 7, 1, 0, 78, 0, 0, 0, 8, 0, 2, 22);
INSERT INTO `scorecard_batting_details` VALUES (7, 3, 68, 1, 2, 24, 0, 0, 0, 3, 0, 8, 1, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 3, 69, 2, 7, 20, 0, 4, 0, 3, 0, 8, 0, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (7, 3, 70, 3, 2, 18, 0, 0, 0, 3, 0, 8, 1, 22, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 82, 1, 3, 0, 0, 14, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 83, 2, 4, 0, 2, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 84, 3, 4, 0, 2, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 85, 4, 4, 2, 2, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 86, 5, 4, 17, 93, 13, 0, 2, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 87, 6, 4, 1, 79, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 88, 7, 4, 0, 79, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 89, 8, 4, 9, 8, 4, 0, 1, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 90, 9, 4, 9, 8, 13, 0, 1, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 91, 10, 9, 0, 6, 0, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 1, 92, 11, 2, 14, 0, 0, 0, 1, 0, 8, 1, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 93, 1, 4, 48, 0, 89, 63, 6, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 4, 2, 3, 10, 0, 91, 23, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 6, 3, 3, 8, 0, 84, 28, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 67, 4, 5, 1, 0, 84, 10, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 14, 5, 4, 37, 0, 90, 18, 6, 1, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 80, 6, 4, 9, 0, 90, 20, 1, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 13, 7, 3, 0, 0, 90, 1, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 79, 8, 2, 2, 0, 0, 11, 0, 0, 8, 1, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 8, 9, 2, 8, 0, 0, 5, 1, 0, 8, 1, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 16, 10, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 2, 2, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 89, 1, 4, 6, 79, 13, 0, 0, 1, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 88, 2, 3, 2, 0, 14, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 84, 3, 3, 2, 0, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 82, 4, 4, 16, 93, 14, 0, 2, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 86, 5, 3, 17, 0, 6, 0, 1, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 85, 6, 4, 0, 67, 13, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 87, 7, 2, 20, 0, 0, 0, 0, 0, 8, 1, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 83, 8, 3, 0, 0, 6, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 90, 9, 3, 6, 0, 16, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 92, 10, 7, 10, 0, 14, 0, 2, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 3, 91, 11, 3, 0, 0, 6, 0, 0, 0, 8, 0, 26, 2);
INSERT INTO `scorecard_batting_details` VALUES (8, 4, 4, 1, 4, 5, 0, 86, 0, 1, 0, 8, 0, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 4, 79, 2, 2, 2, 0, 0, 0, 0, 0, 8, 1, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (8, 4, 94, 3, 2, 5, 0, 0, 0, 0, 0, 8, 1, 2, 26);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 7, 1, 4, 22, 0, 95, 0, 2, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 79, 2, 3, 0, 0, 100, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 67, 3, 9, 4, 0, 0, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 8, 4, 4, 6, 0, 96, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 4, 5, 4, 3, 0, 100, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 2, 6, 4, 2, 0, 96, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 102, 7, 4, 7, 0, 101, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 10, 8, 3, 8, 0, 95, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 103, 9, 4, 5, 0, 95, 0, 1, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 16, 10, 2, 7, 0, 0, 0, 0, 0, 8, 1, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 1, 104, 11, 10, 5, 0, 95, 0, 0, 0, 8, 0, 2, 6);
INSERT INTO `scorecard_batting_details` VALUES (9, 2, 99, 3, 2, 2, 0, 0, 0, 0, 0, 8, 1, 6, 2);
INSERT INTO `scorecard_batting_details` VALUES (9, 2, 98, 2, 2, 50, 0, 0, 0, 9, 0, 8, 1, 6, 2);
INSERT INTO `scorecard_batting_details` VALUES (9, 2, 97, 1, 4, 27, 4, 2, 0, 1, 0, 8, 0, 6, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 22, 1, 3, 2, 0, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 26, 2, 3, 10, 0, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 105, 3, 3, 0, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 106, 4, 3, 2, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 25, 5, 4, 7, 7, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 107, 6, 7, 15, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 21, 7, 7, 1, 0, 13, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 108, 8, 3, 4, 0, 13, 0, 1, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 109, 9, 4, 3, 7, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 110, 10, 2, 1, 0, 0, 0, 0, 0, 8, 1, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 1, 19, 11, 3, 0, 0, 13, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 7, 1, 4, 15, 0, 26, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 6, 2, 4, 0, 0, 108, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 28, 3, 7, 0, 0, 110, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 111, 4, 9, 9, 0, 0, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 13, 5, 4, 33, 0, 110, 0, 2, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 102, 6, 3, 11, 0, 110, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 14, 7, 4, 9, 0, 22, 0, 0, 1, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 15, 8, 4, 6, 107, 110, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 80, 9, 2, 0, 0, 0, 0, 0, 0, 8, 1, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 2, 10, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 2, 16, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 22, 1, 4, 4, 28, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 106, 2, 4, 0, 102, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 105, 3, 4, 2, 0, 14, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 107, 4, 3, 0, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 110, 5, 3, 0, 0, 15, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 25, 6, 7, 4, 0, 6, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 109, 7, 7, 3, 0, 6, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 19, 8, 4, 13, 7, 2, 0, 0, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 26, 9, 4, 11, 7, 15, 0, 1, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 21, 10, 2, 5, 0, 0, 0, 0, 0, 8, 1, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 3, 108, 11, 4, 10, 13, 14, 0, 2, 0, 8, 0, 10, 2);
INSERT INTO `scorecard_batting_details` VALUES (10, 4, 9, 1, 2, 20, 0, 0, 0, 0, 1, 8, 1, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (10, 4, 16, 2, 2, 3, 0, 0, 0, 0, 0, 8, 1, 2, 10);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 31, 1, 4, 8, 14, 13, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 32, 2, 4, 116, 15, 113, 0, 11, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 114, 3, 4, 17, 102, 28, 0, 1, 1, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 115, 4, 4, 15, 67, 28, 0, 0, 1, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 116, 5, 4, 1, 102, 2, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 34, 6, 4, 53, 2, 113, 0, 4, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 117, 7, 4, 2, 2, 13, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 29, 8, 2, 22, 0, 0, 0, 1, 0, 8, 1, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 118, 9, 3, 6, 0, 2, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 119, 10, 4, 1, 8, 15, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 1, 120, 11, 3, 3, 0, 2, 0, 0, 0, 8, 0, 14, 2);
INSERT INTO `scorecard_batting_details` VALUES (11, 2, 42, 1, 2, 1, 0, 0, 0, 0, 0, 8, 1, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (11, 2, 67, 2, 2, 7, 0, 0, 0, 0, 0, 8, 1, 2, 14);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 67, 1, 4, 0, 0, 130, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 7, 2, 4, 29, 0, 123, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 42, 3, 4, 9, 0, 130, 0, 1, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 111, 4, 7, 14, 0, 123, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 13, 5, 4, 15, 0, 130, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 133, 6, 4, 2, 0, 122, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 6, 7, 7, 24, 0, 123, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 4, 8, 4, 9, 0, 130, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 15, 9, 3, 30, 0, 129, 0, 2, 2, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 2, 10, 2, 18, 0, 0, 0, 1, 0, 8, 1, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 1, 66, 11, 4, 6, 0, 134, 0, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 121, 1, 4, 0, 111, 66, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 122, 2, 2, 19, 0, 0, 0, 1, 0, 8, 1, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 123, 3, 4, 3, 0, 13, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 124, 4, 3, 0, 0, 66, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 125, 5, 3, 6, 0, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 126, 6, 7, 3, 0, 4, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 127, 7, 9, 50, 1, 0, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 128, 8, 3, 11, 0, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 129, 9, 7, 8, 0, 1, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 130, 10, 4, 7, 42, 1, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (12, 2, 131, 11, 4, 0, 42, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 6, 1, 4, 44, 47, 56, 0, 3, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 4, 2, 3, 19, 0, 63, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 28, 3, 9, 39, 63, 0, 0, 1, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 9, 4, 4, 11, 47, 61, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 111, 5, 10, 4, 57, 61, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 132, 6, 4, 9, 57, 62, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 13, 7, 4, 12, 61, 47, 0, 0, 1, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 133, 8, 2, 10, 0, 0, 0, 0, 0, 8, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 113, 9, 2, 3, 0, 0, 0, 0, 0, 8, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 8, 10, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 1, 2, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 56, 1, 3, 0, 0, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 55, 2, 4, 16, 13, 2, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 47, 3, 3, 11, 0, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 58, 4, 3, 1, 0, 13, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 135, 5, 3, 7, 0, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 57, 6, 3, 0, 0, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 61, 7, 4, 2, 113, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 62, 8, 4, 0, 0, 132, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 64, 9, 2, 4, 0, 0, 0, 0, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 63, 10, 3, 1, 0, 2, 0, 0, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 2, 65, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 3, 56, 1, 2, 14, 0, 0, 0, 0, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 3, 55, 2, 3, 20, 0, 2, 0, 1, 0, 8, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (13, 3, 47, 3, 2, 5, 0, 0, 0, 1, 0, 8, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 7, 1, 7, 0, 0, 144, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 4, 2, 4, 8, 145, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 28, 3, 9, 26, 0, 0, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 132, 4, 4, 17, 136, 146, 0, 1, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 111, 5, 3, 3, 0, 139, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 9, 6, 4, 21, 138, 143, 0, 1, 1, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 13, 7, 3, 1, 0, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 6, 8, 10, 8, 141, 142, 0, 2, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 15, 9, 4, 1, 136, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 8, 10, 2, 11, 0, 0, 0, 0, 0, 8, 1, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 1, 2, 11, 3, 5, 0, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 136, 1, 4, 13, 8, 132, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 137, 2, 4, 63, 28, 132, 0, 2, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 138, 3, 3, 1, 0, 132, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 139, 4, 7, 1, 0, 13, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 140, 5, 4, 32, 8, 132, 0, 0, 1, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 141, 6, 3, 3, 0, 132, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 142, 7, 4, 8, 111, 2, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 143, 8, 4, 3, 9, 2, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 144, 9, 2, 2, 0, 0, 0, 0, 0, 8, 1, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 145, 10, 4, 2, 132, 2, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 2, 146, 11, 2, 0, 0, 0, 0, 0, 0, 8, 1, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 7, 1, 4, 2, 0, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 111, 2, 4, 10, 0, 143, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 132, 3, 4, 13, 0, 139, 0, 0, 1, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 28, 4, 4, 14, 0, 140, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 8, 5, 4, 0, 0, 142, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 13, 6, 4, 31, 0, 142, 0, 2, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 9, 7, 4, 1, 0, 142, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 6, 8, 2, 55, 0, 0, 0, 5, 1, 8, 1, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 4, 9, 7, 2, 0, 142, 0, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 2, 10, 4, 23, 0, 138, 0, 1, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (14, 3, 15, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 7, 1, 4, 4, 127, 123, 48, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 4, 2, 4, 10, 128, 123, 40, 1, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 28, 3, 4, 97, 123, 134, 202, 4, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 111, 4, 4, 5, 148, 123, 19, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 9, 5, 4, 79, 123, 151, 149, 6, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 13, 6, 2, 77, 0, 0, 99, 2, 2, 8, 1, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 1, 15, 7, 2, 3, 0, 0, 2, 0, 0, 8, 0, 2, 30);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 147, 1, 4, 28, 1, 13, 0, 1, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 121, 2, 4, 6, 6, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 149, 3, 4, 2, 111, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 122, 4, 7, 3, 0, 14, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 148, 5, 4, 114, 9, 14, 0, 6, 4, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 150, 6, 4, 12, 13, 15, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 128, 7, 3, 3, 0, 2, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 123, 8, 9, 17, 7, 0, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 130, 9, 2, 2, 0, 0, 0, 0, 0, 8, 1, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 151, 10, 4, 0, 28, 2, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (15, 2, 134, 11, 9, 0, 7, 0, 0, 0, 0, 8, 0, 30, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 7, 1, 9, 0, 144, 0, 6, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 4, 2, 3, 28, 0, 143, 74, 1, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 28, 3, 3, 21, 0, 144, 111, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 111, 4, 4, 10, 0, 145, 65, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 9, 5, 4, 38, 0, 145, 75, 2, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 13, 6, 4, 14, 0, 144, 41, 2, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 6, 7, 3, 0, 0, 145, 1, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 15, 8, 7, 18, 0, 137, 44, 1, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 14, 9, 4, 30, 0, 142, 41, 1, 1, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 8, 10, 2, 3, 0, 0, 7, 0, 0, 8, 1, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 1, 2, 11, 4, 1, 0, 142, 6, 0, 0, 8, 0, 2, 34);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 137, 1, 4, 27, 8, 14, 0, 2, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 136, 2, 4, 0, 8, 15, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 138, 3, 4, 8, 8, 15, 0, 1, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 140, 4, 3, 9, 0, 15, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 152, 5, 4, 5, 1, 6, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 139, 6, 4, 5, 8, 15, 0, 1, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 142, 7, 9, 2, 13, 0, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 145, 8, 4, 7, 111, 6, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 143, 9, 5, 0, 0, 6, 0, 0, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 141, 10, 2, 0, 0, 0, 0, 0, 0, 8, 1, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (16, 2, 144, 11, 7, 4, 0, 15, 0, 1, 0, 8, 0, 34, 2);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 158, 4, 3, 82, 0, 3, 0, 7, 1, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 163, 10, 7, 0, 0, 1, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 107, 9, 4, 18, 45, 1, 0, 2, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 162, 8, 4, 0, 42, 153, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 161, 7, 4, 0, 153, 154, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 160, 6, 4, 2, 66, 154, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 159, 5, 10, 24, 42, 153, 0, 3, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 157, 3, 4, 10, 41, 66, 0, 0, 1, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 156, 2, 3, 4, 0, 155, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 105, 1, 4, 26, 1, 153, 0, 2, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 1, 7, 2, 13, 0, 0, 0, 1, 0, 8, 1, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 42, 6, 2, 16, 0, 0, 0, 2, 1, 8, 1, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 43, 5, 4, 2, 161, 160, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 154, 4, 4, 63, 160, 161, 0, 6, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 3, 3, 4, 68, 159, 160, 0, 6, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 41, 2, 4, 41, 0, 163, 0, 2, 1, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 153, 1, 9, 24, 0, 0, 0, 1, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 2, 112, 11, 2, 0, 0, 0, 0, 0, 0, 8, 1, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 45, 8, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 66, 9, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 155, 10, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (24, 1, 28, 11, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 164, 1, 4, 44, 43, 3, 0, 7, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 114, 2, 4, 6, 42, 45, 0, 1, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 165, 3, 4, 11, 42, 45, 0, 2, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 166, 4, 5, 64, 0, 3, 0, 2, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 167, 5, 10, 13, 42, 3, 0, 1, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 168, 6, 10, 23, 42, 3, 0, 1, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 169, 7, 3, 3, 0, 1, 0, 0, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 116, 8, 4, 11, 42, 1, 0, 0, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 170, 9, 4, 3, 42, 66, 0, 0, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 171, 10, 3, 6, 0, 1, 0, 1, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 1, 172, 11, 2, 16, 0, 0, 0, 2, 0, 8, 1, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 153, 1, 7, 12, 0, 170, 0, 1, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 41, 2, 4, 20, 164, 170, 0, 1, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 3, 3, 4, 11, 168, 172, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 173, 4, 2, 34, 0, 0, 0, 2, 0, 8, 1, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 154, 5, 4, 5, 164, 166, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 42, 6, 3, 15, 0, 165, 0, 3, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 1, 7, 4, 19, 170, 172, 0, 1, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 43, 8, 3, 4, 0, 172, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 155, 9, 3, 0, 0, 166, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 66, 10, 3, 0, 0, 166, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (25, 2, 45, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 153, 1, 3, 5, 0, 181, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 41, 2, 5, 36, 0, 181, 0, 2, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 3, 3, 4, 18, 182, 181, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 173, 4, 9, 10, 0, 0, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 67, 5, 3, 1, 0, 179, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 43, 6, 4, 10, 0, 181, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 42, 7, 7, 6, 0, 179, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 155, 8, 3, 17, 0, 182, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 1, 9, 4, 49, 179, 180, 0, 3, 2, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 66, 10, 7, 0, 0, 179, 0, 0, 0, 8, 0, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 1, 45, 11, 2, 8, 0, 0, 0, 1, 0, 8, 1, 1, 21);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 174, 1, 4, 21, 1, 66, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 175, 2, 4, 4, 42, 45, 0, 1, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 176, 3, 4, 2, 42, 45, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 177, 4, 4, 19, 173, 1, 0, 2, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 178, 5, 7, 9, 0, 1, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 179, 6, 7, 6, 0, 43, 0, 1, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 180, 7, 4, 32, 1, 3, 0, 2, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 181, 8, 9, 6, 41, 0, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 182, 9, 4, 8, 1, 3, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 183, 10, 2, 4, 0, 0, 0, 0, 0, 8, 1, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (26, 2, 184, 11, 3, 0, 0, 3, 0, 0, 0, 8, 0, 21, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 153, 1, 3, 0, 0, 192, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 41, 2, 7, 0, 0, 194, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 42, 3, 7, 42, 0, 187, 0, 4, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 28, 4, 4, 1, 0, 192, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 173, 5, 4, 5, 0, 194, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 1, 6, 4, 16, 0, 194, 0, 2, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 67, 7, 3, 8, 0, 190, 0, 1, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 43, 8, 9, 27, 0, 0, 0, 1, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 155, 9, 2, 17, 0, 0, 0, 0, 0, 8, 1, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 15, 10, 4, 8, 0, 190, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 1, 4, 11, 4, 5, 0, 190, 0, 0, 0, 8, 0, 1, 37);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 185, 1, 4, 45, 153, 45, 0, 4, 1, 8, 0, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 186, 2, 9, 1, 42, 0, 0, 0, 0, 8, 0, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 187, 3, 4, 21, 41, 45, 0, 4, 0, 8, 0, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 188, 4, 2, 34, 0, 0, 0, 0, 0, 8, 1, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 189, 5, 3, 0, 0, 15, 0, 0, 0, 8, 0, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 190, 6, 3, 12, 0, 153, 0, 1, 0, 8, 0, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (28, 2, 191, 7, 2, 30, 0, 0, 0, 2, 1, 8, 1, 37, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 196, 1, 3, 16, 0, 153, 0, 2, 0, 8, 0, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 197, 2, 7, 2, 0, 66, 0, 0, 0, 8, 0, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 198, 3, 2, 153, 0, 0, 0, 16, 2, 8, 1, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 199, 4, 9, 0, 0, 0, 0, 0, 0, 8, 0, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 200, 5, 3, 66, 0, 1, 0, 4, 0, 8, 0, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 202, 6, 4, 61, 42, 13, 0, 7, 2, 8, 0, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 1, 201, 7, 2, 0, 0, 0, 0, 0, 0, 8, 1, 5, 1);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 155, 1, 4, 2, 206, 205, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 153, 2, 4, 1, 200, 204, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 42, 3, 7, 1, 0, 205, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 3, 4, 4, 8, 203, 201, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 13, 5, 4, 0, 206, 205, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 41, 6, 4, 28, 204, 196, 0, 1, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 1, 7, 4, 0, 200, 205, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 45, 8, 3, 10, 0, 201, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 80, 9, 3, 3, 0, 201, 0, 0, 0, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 15, 10, 10, 20, 206, 200, 0, 1, 1, 8, 0, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (29, 2, 66, 11, 2, 7, 0, 0, 0, 1, 0, 8, 1, 1, 5);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 3, 1, 4, 4, 0, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 41, 2, 4, 16, 0, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 217, 3, 10, 0, 207, 216, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 173, 4, 4, 1, 207, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 154, 5, 4, 0, 0, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 28, 6, 7, 0, 0, 216, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 1, 7, 4, 6, 207, 216, 0, 1, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 43, 8, 4, 0, 207, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 15, 9, 4, 0, 207, 216, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 4, 10, 2, 8, 0, 0, 0, 0, 1, 8, 1, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 1, 45, 11, 4, 2, 207, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 207, 1, 4, 5, 217, 43, 0, 0, 0, 8, 0, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 208, 2, 4, 4, 154, 45, 0, 0, 0, 8, 0, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 209, 3, 4, 3, 1, 43, 0, 0, 0, 8, 0, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 210, 4, 5, 6, 0, 43, 0, 0, 0, 8, 0, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 211, 5, 2, 14, 0, 0, 0, 2, 0, 8, 1, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 212, 6, 4, 1, 217, 4, 0, 0, 0, 8, 0, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 2, 213, 7, 2, 10, 0, 0, 0, 0, 0, 8, 1, 38, 1);
INSERT INTO `scorecard_batting_details` VALUES (30, 3, 217, 1, 2, 1, 0, 0, 0, 0, 0, 8, 1, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 3, 3, 2, 3, 1, 0, 215, 0, 0, 0, 8, 0, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (30, 3, 173, 3, 2, 1, 0, 0, 0, 0, 0, 8, 1, 1, 38);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 3, 1, 4, 2, 0, 223, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 155, 2, 4, 10, 0, 223, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 217, 3, 4, 9, 0, 222, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 173, 4, 7, 71, 0, 156, 0, 3, 1, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 154, 5, 4, 15, 0, 158, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 42, 6, 4, 7, 0, 156, 0, 1, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 1, 7, 4, 39, 0, 222, 0, 4, 1, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 67, 8, 4, 3, 0, 156, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 43, 9, 4, 6, 0, 221, 0, 1, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 4, 10, 2, 0, 0, 0, 0, 0, 0, 8, 1, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 1, 45, 11, 4, 1, 0, 221, 0, 0, 0, 8, 0, 1, 9);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 219, 1, 3, 26, 0, 43, 0, 3, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 220, 2, 3, 3, 0, 43, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 159, 3, 3, 1, 0, 45, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 23, 4, 7, 8, 0, 3, 0, 1, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 157, 5, 4, 10, 1, 45, 0, 1, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 158, 6, 5, 41, 0, 3, 0, 2, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 156, 7, 7, 12, 0, 3, 0, 1, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 221, 8, 2, 14, 0, 0, 0, 2, 0, 8, 1, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 27, 9, 4, 0, 42, 3, 0, 0, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 222, 10, 3, 9, 0, 45, 0, 1, 0, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (31, 2, 223, 11, 3, 9, 0, 43, 0, 0, 1, 8, 0, 9, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 224, 1, 3, 5, 0, 4, 0, 1, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 225, 2, 4, 20, 1, 13, 0, 1, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 226, 3, 9, 3, 0, 0, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 227, 4, 4, 3, 217, 13, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 228, 5, 4, 20, 43, 155, 0, 1, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 229, 6, 4, 13, 43, 155, 0, 1, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 230, 7, 4, 0, 9, 14, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 231, 8, 4, 3, 9, 14, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 232, 9, 4, 4, 9, 155, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 233, 10, 10, 7, 217, 155, 0, 0, 0, 8, 0, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 1, 234, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 42, 1);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 3, 1, 3, 2, 0, 232, 0, 0, 0, 8, 0, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 155, 2, 4, 0, 233, 234, 0, 0, 0, 8, 0, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 217, 3, 9, 27, 0, 0, 0, 2, 1, 8, 0, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 9, 4, 4, 13, 229, 226, 0, 0, 1, 8, 0, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 154, 5, 2, 42, 0, 0, 0, 3, 1, 8, 1, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 42, 6, 3, 0, 0, 228, 0, 0, 0, 8, 0, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (32, 2, 28, 7, 2, 5, 0, 0, 0, 0, 0, 8, 1, 1, 42);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 46, 1, 4, 18, 41, 45, 0, 1, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 235, 2, 3, 11, 0, 153, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 48, 3, 4, 4, 41, 153, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 49, 4, 3, 8, 0, 153, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 51, 5, 4, 3, 1, 153, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 236, 6, 2, 61, 0, 0, 0, 3, 3, 8, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 237, 7, 7, 9, 0, 154, 0, 1, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 240, 8, 9, 7, 0, 0, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 241, 9, 3, 14, 0, 1, 0, 1, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 238, 10, 3, 2, 0, 154, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 1, 239, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (33, 2, 41, 1, 4, 8, 0, 241, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (33, 2, 155, 2, 7, 0, 0, 236, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (33, 2, 3, 3, 3, 6, 0, 241, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (33, 2, 173, 4, 2, 4, 0, 0, 0, 0, 0, 8, 1, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (33, 2, 153, 5, 2, 0, 0, 0, 0, 0, 0, 8, 1, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 155, 1, 4, 2, 167, 170, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 41, 2, 5, 0, 0, 170, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 173, 3, 4, 0, 167, 171, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 217, 4, 3, 10, 0, 171, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 154, 5, 3, 2, 0, 170, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 9, 6, 10, 36, 167, 165, 0, 4, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 3, 7, 4, 3, 167, 170, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 153, 8, 3, 0, 0, 172, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 1, 9, 4, 4, 0, 165, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 43, 10, 2, 10, 0, 0, 0, 0, 0, 8, 1, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 1, 45, 11, 4, 9, 0, 166, 0, 1, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 2, 30, 1, 4, 3, 1, 153, 0, 0, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (34, 2, 164, 2, 4, 15, 41, 154, 0, 1, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (34, 2, 165, 3, 4, 37, 41, 3, 0, 0, 0, 8, 0, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (34, 2, 166, 4, 2, 10, 0, 0, 0, 1, 0, 8, 1, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (34, 2, 243, 5, 2, 10, 0, 0, 0, 2, 0, 8, 1, 13, 1);
INSERT INTO `scorecard_batting_details` VALUES (34, 3, 41, 1, 7, 2, 0, 170, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 3, 155, 2, 4, 1, 0, 171, 0, 0, 0, 8, 0, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (34, 3, 3, 3, 2, 2, 0, 0, 0, 0, 0, 8, 1, 1, 13);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 41, 1, 4, 4, 245, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 3, 2, 3, 41, 0, 248, 0, 2, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 132, 3, 4, 0, 247, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 173, 4, 7, 0, 0, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 9, 5, 7, 2, 0, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 28, 6, 4, 1, 251, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 217, 7, 4, 0, 249, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 155, 8, 4, 1, 245, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 153, 9, 3, 2, 0, 252, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 43, 10, 2, 12, 0, 0, 0, 1, 0, 8, 1, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 1, 45, 11, 3, 17, 0, 253, 0, 1, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 244, 1, 4, 6, 41, 153, 0, 0, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 245, 2, 4, 23, 217, 43, 0, 0, 1, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 246, 3, 3, 39, 0, 153, 0, 1, 2, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 247, 4, 4, 0, 41, 153, 0, 0, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 248, 5, 2, 6, 0, 0, 0, 0, 0, 8, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 2, 249, 6, 4, 19, 9, 155, 0, 4, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 41, 1, 3, 4, 0, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 3, 2, 4, 2, 0, 248, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 153, 3, 4, 0, 0, 248, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 132, 4, 5, 6, 0, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 173, 5, 5, 28, 0, 244, 0, 2, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 9, 6, 4, 0, 0, 248, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 217, 7, 7, 8, 0, 122, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 28, 8, 5, 13, 0, 134, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 155, 9, 9, 2, 0, 0, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 43, 10, 4, 4, 122, 253, 0, 0, 0, 8, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 3, 45, 11, 2, 0, 0, 0, 0, 0, 0, 8, 1, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 244, 1, 4, 3, 217, 153, 0, 0, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 121, 2, 3, 8, 0, 153, 0, 0, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 247, 3, 4, 3, 153, 43, 0, 0, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 248, 4, 4, 21, 41, 155, 0, 1, 0, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 124, 5, 4, 9, 45, 153, 0, 0, 1, 8, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 249, 6, 2, 24, 0, 0, 0, 3, 1, 8, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (35, 4, 150, 7, 2, 0, 0, 0, 0, 0, 0, 8, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 41, 1, 4, 21, 48, 238, 41, 3, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 153, 2, 4, 12, 48, 238, 33, 1, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 3, 3, 4, 44, 49, 240, 64, 1, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 173, 4, 3, 75, 0, 241, 0, 1, 1, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 217, 5, 3, 12, 0, 240, 0, 1, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 154, 6, 3, 0, 0, 49, 0, 0, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 1, 7, 4, 14, 48, 238, 0, 1, 0, 8, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 1, 43, 8, 2, 0, 0, 0, 0, 0, 0, 8, 1, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 46, 1, 4, 7, 217, 45, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 235, 2, 4, 24, 3, 154, 0, 2, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 48, 3, 4, 47, 217, 153, 0, 1, 1, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 49, 4, 4, 22, 1, 153, 0, 1, 1, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 237, 5, 4, 0, 173, 3, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 236, 6, 4, 33, 3, 154, 0, 3, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 50, 7, 3, 1, 0, 43, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 240, 8, 3, 8, 0, 153, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 241, 9, 4, 6, 217, 43, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 239, 10, 4, 1, 3, 43, 0, 0, 0, 8, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (36, 2, 238, 11, 2, 0, 0, 0, 0, 0, 0, 8, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 41, 1, 3, 2, 0, 260, 10, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 153, 2, 4, 1, 260, 256, 13, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 3, 3, 4, 15, 259, 263, 72, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 173, 4, 3, 0, 0, 260, 3, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 67, 5, 7, 3, 0, 260, 38, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 217, 6, 3, 21, 0, 259, 96, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 154, 7, 3, 12, 0, 262, 54, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 155, 8, 2, 14, 0, 0, 97, 0, 0, 8, 1, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 1, 9, 7, 19, 0, 258, 35, 1, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 43, 10, 4, 4, 257, 264, 21, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 1, 45, 11, 7, 0, 0, 258, 3, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 254, 1, 4, 1, 217, 43, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 255, 2, 9, 15, 0, 0, 0, 0, 2, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 256, 3, 3, 4, 0, 43, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 257, 4, 3, 2, 0, 45, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 258, 5, 4, 2, 1, 43, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 259, 6, 7, 10, 0, 45, 0, 1, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 260, 7, 3, 10, 0, 43, 0, 0, 1, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 261, 8, 4, 18, 217, 43, 0, 2, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 262, 9, 2, 36, 0, 0, 0, 2, 1, 8, 1, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 263, 10, 7, 2, 0, 43, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 2, 264, 11, 4, 3, 3, 154, 0, 0, 0, 8, 0, 33, 1);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 41, 1, 3, 1, 0, 260, 15, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 153, 2, 3, 1, 0, 260, 8, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 3, 3, 4, 1, 0, 260, 17, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 173, 4, 2, 3, 0, 0, 33, 0, 0, 8, 1, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 67, 5, 4, 1, 0, 260, 5, 0, 0, 8, 0, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (37, 3, 217, 6, 2, 8, 0, 0, 18, 1, 0, 8, 1, 1, 33);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 285, 1, 4, 25, 0, 45, 0, 3, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 286, 2, 4, 10, 0, 43, 0, 1, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 287, 3, 7, 2, 0, 43, 0, 0, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 288, 4, 7, 6, 0, 104, 0, 1, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 289, 5, 4, 11, 0, 104, 0, 1, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 290, 6, 9, 7, 0, 0, 0, 0, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 291, 7, 3, 0, 0, 104, 0, 0, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 292, 8, 4, 20, 0, 155, 0, 1, 1, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 293, 9, 10, 1, 217, 155, 0, 0, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 294, 10, 4, 15, 0, 155, 0, 3, 0, 9, 0, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 1, 295, 11, 2, 11, 0, 0, 0, 1, 0, 9, 1, 43, 1);
INSERT INTO `scorecard_batting_details` VALUES (41, 2, 4, 1, 9, 0, 0, 0, 0, 0, 0, 9, 0, 1, 43);
INSERT INTO `scorecard_batting_details` VALUES (41, 2, 3, 2, 8, 59, 0, 0, 0, 10, 0, 9, 1, 1, 43);
INSERT INTO `scorecard_batting_details` VALUES (41, 2, 9, 3, 4, 11, 0, 296, 0, 2, 0, 9, 0, 1, 43);
INSERT INTO `scorecard_batting_details` VALUES (41, 2, 12, 4, 2, 27, 0, 0, 0, 3, 0, 9, 1, 1, 43);
INSERT INTO `scorecard_batting_details` VALUES (41, 2, 133, 5, 2, 13, 0, 0, 0, 1, 0, 9, 1, 1, 43);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 316, 1, 3, 2, 0, 312, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 317, 2, 4, 12, 327, 301, 0, 0, 1, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 318, 3, 4, 8, 11, 312, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 319, 4, 3, 5, 0, 301, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 320, 5, 4, 71, 301, 313, 0, 7, 3, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 321, 6, 4, 5, 312, 298, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 322, 7, 4, 0, 304, 298, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 323, 8, 2, 57, 0, 0, 0, 6, 3, 9, 1, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 324, 9, 2, 6, 0, 0, 0, 0, 0, 9, 1, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 325, 10, 1, 0, 0, 0, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 1, 326, 11, 1, 0, 0, 0, 0, 0, 0, 9, 0, 20, 4);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 299, 1, 4, 5, 316, 318, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 94, 2, 4, 2, 323, 318, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 11, 3, 3, 2, 0, 322, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 304, 4, 4, 41, 326, 319, 0, 4, 3, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 298, 5, 4, 7, 318, 319, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 314, 6, 4, 24, 319, 321, 0, 1, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 315, 7, 4, 21, 317, 321, 0, 1, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 313, 8, 2, 20, 0, 0, 0, 0, 1, 9, 1, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 327, 9, 2, 4, 0, 0, 0, 0, 0, 9, 1, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 465, 10, 1, 0, 0, 0, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (42, 2, 301, 11, 1, 0, 0, 0, 0, 0, 0, 9, 0, 4, 20);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 236, 6, 2, 35, 0, 0, 0, 0, 0, 9, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 329, 5, 4, 38, 43, 521, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 56, 4, 3, 6, 0, 153, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 48, 3, 4, 2, 28, 45, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 328, 2, 4, 2, 9, 45, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 46, 1, 10, 100, 9, 3, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 299, 1, 4, 9, 0, 108, 0, 2, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 79, 2, 4, 94, 0, 335, 0, 9, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 339, 3, 3, 5, 0, 338, 0, 1, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 340, 4, 4, 14, 0, 335, 0, 1, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 341, 5, 4, 0, 0, 335, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 342, 6, 10, 34, 0, 332, 0, 5, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 344, 7, 2, 30, 0, 0, 0, 3, 1, 8, 1, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 301, 8, 7, 0, 0, 332, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 1, 298, 9, 2, 4, 0, 0, 0, 1, 0, 8, 1, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 330, 1, 3, 40, 0, 344, 0, 2, 1, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 331, 2, 10, 53, 0, 298, 0, 6, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 332, 3, 3, 10, 0, 344, 0, 1, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 333, 4, 3, 49, 0, 342, 0, 6, 1, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 334, 5, 4, 39, 299, 344, 0, 6, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 106, 6, 2, 9, 0, 0, 0, 2, 0, 8, 1, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (44, 2, 108, 7, 2, 0, 0, 0, 0, 0, 0, 8, 1, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 345, 1, 3, 0, 0, 16, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 346, 2, 4, 3, 0, 298, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 347, 3, 4, 8, 301, 81, 0, 1, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 348, 4, 3, 17, 0, 81, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 349, 5, 3, 8, 0, 298, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 350, 6, 3, 11, 0, 298, 0, 2, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 351, 7, 3, 0, 0, 298, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 118, 8, 4, 4, 344, 298, 0, 1, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 352, 9, 4, 0, 301, 299, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 1, 353, 10, 2, 0, 0, 0, 0, 0, 0, 8, 1, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (45, 2, 304, 1, 2, 44, 0, 0, 0, 6, 0, 8, 1, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (45, 2, 79, 2, 2, 13, 0, 0, 0, 2, 0, 8, 1, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 354, 1, 4, 85, 0, 344, 0, 9, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 355, 2, 4, 9, 0, 342, 0, 1, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 356, 3, 4, 39, 0, 301, 0, 5, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 357, 4, 4, 9, 0, 304, 0, 0, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 358, 5, 3, 0, 0, 304, 0, 0, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 359, 6, 4, 11, 0, 81, 0, 0, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 360, 7, 4, 21, 0, 342, 0, 2, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 361, 8, 4, 6, 0, 81, 0, 1, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 362, 9, 2, 27, 0, 0, 0, 3, 0, 8, 1, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 363, 10, 3, 8, 0, 298, 0, 1, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 1, 364, 11, 3, 0, 0, 342, 0, 0, 0, 8, 0, 23, 3);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 299, 1, 3, 10, 0, 363, 0, 1, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 5, 2, 3, 0, 0, 363, 0, 0, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 81, 3, 4, 36, 0, 361, 0, 2, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 16, 4, 3, 14, 0, 365, 0, 0, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 298, 5, 7, 13, 0, 364, 0, 0, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 11, 6, 3, 25, 0, 364, 0, 2, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 304, 7, 4, 30, 0, 361, 0, 4, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 344, 8, 4, 9, 0, 361, 0, 1, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 342, 9, 4, 8, 0, 363, 0, 2, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 301, 10, 3, 7, 0, 361, 0, 0, 0, 8, 0, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (46, 2, 339, 11, 2, 4, 0, 0, 0, 0, 0, 8, 1, 3, 23);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 366, 1, 4, 23, 339, 342, 0, 5, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 367, 2, 3, 0, 0, 342, 0, 0, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 100, 3, 3, 16, 0, 299, 0, 2, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 368, 4, 4, 35, 344, 81, 0, 6, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 369, 5, 7, 0, 0, 299, 0, 0, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 370, 6, 3, 20, 0, 81, 0, 3, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 371, 7, 2, 25, 0, 0, 0, 4, 0, 8, 1, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 372, 8, 3, 4, 0, 81, 0, 1, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 373, 9, 3, 0, 0, 81, 0, 0, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 374, 10, 4, 0, 5, 342, 0, 0, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 1, 375, 11, 3, 5, 0, 344, 0, 1, 0, 8, 0, 7, 3);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 304, 1, 3, 16, 0, 372, 0, 2, 1, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 376, 2, 4, 3, 0, 372, 0, 0, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 303, 3, 3, 31, 0, 100, 0, 4, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 5, 4, 4, 27, 0, 366, 0, 2, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 11, 5, 4, 7, 0, 100, 0, 1, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 299, 6, 3, 12, 0, 373, 0, 2, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 344, 7, 3, 4, 0, 373, 0, 0, 0, 8, 0, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 339, 8, 2, 21, 0, 0, 0, 2, 0, 8, 1, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (47, 2, 81, 9, 2, 18, 0, 0, 0, 2, 0, 8, 1, 3, 7);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 6, 4, 3, 5, 0, 383, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 67, 3, 4, 13, 63, 383, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 4, 2, 4, 1, 381, 383, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 7, 1, 9, 3, 380, 0, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 384, 11, 2, 0, 0, 0, 0, 0, 0, 9, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 383, 10, 4, 1, 4, 15, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 63, 9, 4, 11, 104, 13, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 382, 8, 4, 2, 306, 13, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 381, 7, 4, 6, 104, 6, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 380, 6, 4, 10, 4, 13, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 379, 5, 3, 8, 0, 14, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 58, 4, 4, 3, 306, 13, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 135, 3, 4, 26, 133, 14, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 378, 2, 4, 26, 6, 13, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 1, 377, 1, 7, 2, 0, 104, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 299, 1, 3, 2, 0, 386, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 79, 2, 4, 23, 0, 386, 0, 2, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 11, 3, 4, 2, 0, 386, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 103, 4, 3, 0, 0, 386, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 298, 5, 5, 8, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 376, 6, 3, 1, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 104, 7, 4, 6, 0, 387, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 465, 8, 4, 0, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 339, 9, 4, 0, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 301, 10, 3, 6, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 1, 81, 11, 2, 0, 0, 0, 0, 0, 0, 8, 1, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 385, 1, 4, 14, 301, 298, 0, 3, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 331, 2, 4, 26, 103, 301, 0, 2, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 332, 3, 4, 120, 81, 299, 0, 4, 8, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 333, 4, 4, 11, 104, 465, 0, 0, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 335, 5, 3, 31, 0, 104, 0, 3, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 162, 6, 4, 16, 299, 81, 0, 0, 1, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 386, 7, 4, 8, 104, 301, 0, 0, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 338, 8, 3, 8, 0, 79, 0, 0, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 387, 9, 4, 35, 79, 104, 0, 2, 2, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 388, 10, 3, 1, 0, 79, 0, 0, 0, 8, 0, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 2, 389, 11, 2, 15, 0, 0, 0, 1, 0, 8, 1, 11, 3);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 79, 1, 4, 6, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 376, 2, 4, 0, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 298, 3, 4, 9, 0, 389, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 344, 4, 4, 0, 0, 388, 0, 0, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 299, 5, 4, 4, 0, 388, 0, 1, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 103, 6, 7, 4, 0, 387, 0, 1, 0, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 81, 7, 2, 6, 0, 0, 0, 0, 0, 8, 1, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 104, 8, 3, 11, 0, 386, 0, 0, 1, 8, 0, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (49, 3, 339, 9, 2, 2, 0, 0, 0, 0, 0, 8, 1, 3, 11);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 390, 1, 4, 4, 5, 308, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 391, 2, 5, 9, 0, 308, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 392, 3, 4, 2, 311, 308, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 393, 4, 4, 89, 402, 5, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 394, 5, 4, 3, 401, 309, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 395, 6, 4, 0, 307, 309, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 396, 7, 4, 4, 311, 401, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 397, 8, 2, 145, 0, 0, 0, 0, 0, 9, 1, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 398, 9, 4, 14, 401, 310, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 399, 10, 4, 0, 401, 310, 0, 0, 0, 9, 0, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 1, 400, 11, 2, 11, 0, 0, 0, 0, 0, 9, 1, 48, 45);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 307, 1, 8, 108, 0, 0, 0, 0, 0, 9, 1, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 311, 2, 4, 50, 0, 390, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 308, 3, 3, 8, 0, 399, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 401, 4, 4, 4, 0, 400, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 5, 5, 4, 18, 0, 399, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 402, 6, 4, 8, 0, 400, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 341, 7, 3, 12, 0, 392, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 340, 8, 2, 4, 0, 0, 0, 0, 0, 9, 1, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 310, 9, 4, 0, 0, 393, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 309, 10, 2, 9, 0, 0, 0, 0, 0, 9, 1, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (50, 2, 300, 11, 1, 0, 0, 0, 0, 0, 0, 9, 0, 45, 48);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 403, 1, 9, 3, 102, 0, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 377, 2, 4, 16, 303, 16, 0, 2, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 379, 3, 4, 32, 0, 302, 0, 3, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 318, 4, 3, 0, 0, 16, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 135, 5, 4, 46, 342, 302, 0, 4, 3, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 404, 6, 9, 21, 342, 0, 0, 3, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 405, 7, 7, 8, 0, 302, 0, 2, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 406, 8, 2, 18, 0, 0, 0, 1, 0, 8, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 407, 9, 9, 5, 342, 0, 0, 1, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 408, 10, 4, 0, 303, 81, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 1, 383, 11, 3, 3, 0, 16, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 303, 1, 4, 0, 0, 407, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 81, 2, 3, 3, 0, 407, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 299, 3, 4, 13, 0, 407, 0, 1, 1, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 79, 4, 3, 21, 0, 408, 0, 3, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 102, 5, 4, 2, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 103, 6, 4, 25, 0, 408, 0, 4, 1, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 298, 7, 4, 3, 0, 406, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 16, 8, 9, 0, 0, 0, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 342, 9, 2, 1, 0, 0, 0, 0, 0, 8, 1, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (51, 2, 302, 10, 2, 1, 0, 0, 0, 0, 0, 8, 1, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 409, 1, 3, 2, 0, 104, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 410, 2, 4, 21, 79, 81, 0, 2, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 411, 3, 4, 83, 80, 104, 0, 13, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 412, 4, 4, 2, 81, 342, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 349, 5, 3, 17, 0, 133, 0, 1, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 413, 6, 4, 0, 339, 133, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 414, 7, 7, 6, 0, 80, 0, 1, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 415, 8, 3, 1, 0, 104, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 348, 9, 3, 2, 0, 104, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 347, 10, 2, 0, 0, 0, 0, 0, 0, 8, 1, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 1, 416, 11, 4, 3, 103, 80, 0, 0, 0, 8, 0, 15, 3);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 4, 1, 3, 7, 0, 410, 0, 0, 0, 8, 0, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 8, 2, 4, 12, 0, 410, 0, 2, 0, 8, 0, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 79, 3, 4, 8, 0, 416, 0, 1, 0, 8, 0, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 80, 4, 3, 0, 0, 410, 0, 0, 0, 8, 0, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 133, 5, 2, 9, 0, 0, 0, 0, 0, 8, 1, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 103, 6, 4, 15, 0, 411, 0, 3, 0, 8, 0, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (52, 2, 299, 7, 2, 9, 0, 0, 0, 0, 0, 8, 1, 3, 15);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 79, 1, 7, 24, 0, 423, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 304, 2, 4, 42, 0, 422, 0, 2, 2, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 10, 3, 4, 14, 0, 426, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 103, 4, 4, 1, 0, 423, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 299, 5, 3, 5, 0, 422, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 2, 6, 4, 0, 0, 423, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 298, 7, 4, 1, 0, 426, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 16, 8, 9, 0, 0, 0, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 339, 9, 4, 8, 0, 418, 0, 0, 0, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 104, 10, 3, 16, 0, 426, 0, 1, 1, 8, 0, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 1, 309, 11, 2, 3, 0, 0, 0, 0, 0, 8, 1, 3, 27);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 88, 1, 4, 0, 298, 16, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 83, 2, 3, 0, 0, 16, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 418, 3, 3, 0, 0, 16, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 419, 4, 4, 3, 2, 104, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 420, 5, 3, 8, 0, 104, 0, 1, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 421, 6, 4, 2, 339, 104, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 422, 7, 4, 0, 2, 16, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 423, 8, 4, 13, 2, 10, 0, 1, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 424, 9, 2, 10, 0, 0, 0, 0, 0, 8, 1, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 425, 10, 3, 0, 0, 10, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (53, 2, 426, 11, 4, 0, 304, 10, 0, 0, 0, 8, 0, 27, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 79, 1, 7, 3, 0, 439, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 304, 2, 4, 0, 441, 439, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 10, 3, 3, 13, 0, 442, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 80, 4, 4, 3, 0, 151, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 298, 5, 4, 11, 0, 445, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 103, 6, 4, 67, 0, 442, 0, 8, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 299, 7, 3, 38, 0, 151, 0, 5, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 102, 8, 4, 4, 0, 439, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 16, 9, 4, 1, 0, 445, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 81, 10, 3, 0, 0, 442, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 1, 104, 11, 2, 1, 0, 0, 0, 0, 0, 8, 1, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 440, 1, 7, 24, 0, 81, 0, 1, 0, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 441, 2, 5, 74, 0, 102, 0, 10, 0, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 442, 3, 4, 6, 80, 16, 0, 0, 0, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 443, 4, 4, 3, 80, 81, 0, 0, 0, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 444, 5, 2, 54, 0, 0, 0, 4, 2, 8, 1, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 151, 6, 5, 16, 0, 104, 0, 0, 1, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 445, 7, 3, 0, 0, 102, 0, 0, 0, 8, 0, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 2, 446, 8, 2, 18, 0, 0, 0, 2, 0, 8, 1, 31, 3);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 79, 1, 3, 6, 0, 151, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 304, 2, 3, 3, 0, 445, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 81, 3, 4, 5, 0, 151, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 10, 4, 2, 25, 0, 0, 0, 0, 0, 8, 1, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 80, 5, 4, 0, 0, 151, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 298, 6, 7, 0, 0, 445, 0, 0, 0, 8, 0, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (54, 3, 103, 7, 2, 13, 0, 0, 0, 1, 0, 8, 1, 3, 31);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 79, 1, 4, 2, 0, 453, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 304, 2, 4, 6, 0, 383, 0, 0, 1, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 10, 3, 4, 27, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 80, 4, 4, 12, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 103, 5, 4, 0, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 376, 6, 4, 0, 0, 407, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 299, 7, 4, 4, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 339, 8, 3, 5, 0, 404, 0, 1, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 104, 9, 4, 3, 0, 404, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 16, 10, 4, 1, 0, 383, 0, 0, 0, 8, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 1, 81, 11, 2, 6, 0, 0, 0, 1, 0, 8, 1, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 377, 1, 9, 16, 104, 0, 0, 0, 1, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 449, 2, 4, 13, 104, 81, 0, 1, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 406, 3, 4, 1, 103, 81, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 404, 4, 4, 7, 339, 81, 0, 1, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 450, 5, 3, 7, 0, 299, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 451, 6, 4, 4, 304, 81, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 324, 7, 3, 2, 0, 81, 0, 0, 0, 8, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 452, 8, 2, 14, 0, 0, 0, 1, 0, 8, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (55, 2, 407, 9, 2, 8, 0, 0, 0, 2, 0, 8, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 79, 1, 3, 6, 0, 460, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 299, 2, 3, 0, 0, 458, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 80, 3, 9, 1, 0, 0, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 102, 4, 3, 1, 0, 458, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 103, 5, 4, 21, 0, 459, 0, 1, 2, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 302, 6, 7, 3, 0, 460, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 309, 7, 4, 2, 0, 459, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 104, 8, 4, 4, 0, 457, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 81, 9, 7, 3, 0, 457, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 16, 10, 2, 1, 0, 0, 0, 0, 0, 8, 1, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 1, 465, 11, 3, 0, 0, 461, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 2, 454, 1, 2, 49, 0, 0, 0, 4, 0, 8, 1, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 2, 455, 2, 10, 43, 0, 302, 0, 1, 2, 8, 0, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 2, 456, 3, 2, 30, 0, 0, 0, 4, 0, 8, 1, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 79, 1, 4, 13, 0, 461, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 80, 2, 3, 6, 0, 458, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 465, 3, 4, 12, 0, 463, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 102, 4, 3, 14, 0, 456, 0, 1, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 103, 5, 4, 15, 0, 458, 0, 2, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 16, 6, 4, 4, 0, 461, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 104, 7, 4, 39, 0, 462, 0, 4, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 302, 8, 4, 29, 0, 463, 0, 2, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 309, 9, 4, 1, 0, 458, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 81, 10, 4, 0, 0, 458, 0, 0, 0, 8, 0, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 3, 299, 11, 2, 12, 0, 0, 0, 0, 1, 8, 1, 3, 35);
INSERT INTO `scorecard_batting_details` VALUES (56, 4, 454, 1, 2, 26, 0, 0, 0, 1, 0, 8, 1, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 4, 462, 2, 3, 9, 0, 81, 0, 0, 0, 8, 0, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 4, 456, 3, 4, 2, 465, 81, 0, 0, 0, 8, 0, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 4, 463, 4, 4, 4, 465, 16, 0, 0, 0, 8, 0, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (56, 4, 464, 5, 2, 30, 0, 0, 0, 1, 2, 8, 1, 35, 3);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 433, 1, 4, 14, 496, 494, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 483, 2, 4, 0, 493, 495, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 482, 3, 4, 28, 488, 498, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 173, 4, 4, 45, 496, 494, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 427, 5, 4, 75, 495, 489, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 485, 6, 2, 32, 0, 0, 0, 0, 0, 1, 1, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 480, 7, 4, 18, 491, 489, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 486, 8, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 487, 9, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 429, 10, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 1, 484, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 488, 1, 4, 55, 173, 485, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 489, 2, 4, 28, 429, 427, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 490, 3, 5, 7, 0, 433, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 491, 4, 4, 9, 433, 485, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 492, 5, 4, 2, 173, 485, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 493, 6, 9, 28, 0, 0, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 495, 7, 4, 7, 173, 433, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 494, 8, 9, 24, 0, 0, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 496, 9, 3, 5, 0, 487, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 123, 10, 3, 0, 0, 487, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (57, 2, 498, 11, 2, 6, 0, 0, 0, 0, 0, 1, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 488, 1, 4, 16, 483, 487, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 489, 2, 4, 15, 486, 487, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 490, 3, 5, 4, 0, 427, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 491, 4, 4, 18, 487, 485, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 492, 5, 3, 8, 0, 427, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 247, 6, 3, 3, 0, 485, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 493, 7, 7, 55, 0, 429, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 494, 8, 5, 29, 0, 429, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 495, 9, 3, 4, 0, 429, 0, 0, 0, 1, 0, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 496, 10, 2, 15, 0, 0, 0, 0, 0, 1, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 1, 497, 11, 2, 32, 0, 0, 0, 0, 0, 1, 1, 29, 1);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 433, 1, 7, 44, 0, 491, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 483, 2, 4, 13, 489, 491, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 482, 3, 4, 5, 494, 491, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 173, 4, 4, 0, 495, 493, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 427, 5, 2, 84, 0, 0, 0, 0, 0, 1, 1, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 485, 6, 4, 67, 489, 494, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 480, 7, 2, 6, 0, 0, 0, 0, 0, 1, 1, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 486, 8, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 487, 9, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 429, 10, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (58, 2, 484, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 29);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 16, 1, 4, 32, 500, 504, 0, 0, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 79, 2, 4, 11, 504, 502, 0, 2, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 305, 3, 4, 34, 506, 501, 0, 1, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 507, 4, 3, 4, 0, 501, 0, 1, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 80, 5, 4, 48, 408, 453, 0, 1, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 10, 6, 10, 11, 449, 504, 0, 0, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 66, 7, 2, 42, 0, 0, 0, 4, 1, 9, 1, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 508, 8, 4, 17, 501, 502, 0, 1, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 81, 9, 2, 12, 0, 0, 0, 0, 0, 9, 1, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 509, 10, 1, 0, 0, 0, 0, 0, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 1, 510, 11, 1, 0, 0, 0, 0, 0, 0, 9, 0, 3, 19);
INSERT INTO `scorecard_batting_details` VALUES (59, 2, 449, 1, 4, 77, 0, 10, 0, 0, 0, 9, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (59, 2, 403, 2, 5, 19, 0, 509, 0, 0, 0, 9, 0, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (59, 2, 499, 3, 2, 68, 0, 0, 0, 0, 0, 9, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (59, 2, 500, 4, 8, 29, 0, 0, 0, 0, 0, 9, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (59, 2, 501, 5, 2, 15, 0, 0, 0, 0, 0, 9, 1, 19, 3);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 334, 1, 5, 2, 0, 312, 0, 0, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 511, 2, 3, 21, 0, 298, 0, 2, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 512, 3, 4, 20, 298, 301, 0, 2, 1, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 513, 4, 4, 4, 299, 298, 0, 1, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 514, 5, 3, 1, 0, 344, 0, 0, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 515, 6, 4, 22, 314, 298, 0, 3, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 516, 7, 4, 10, 299, 11, 0, 1, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 517, 8, 2, 20, 0, 0, 0, 2, 0, 9, 1, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 518, 9, 10, 1, 301, 315, 0, 0, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 519, 10, 4, 0, 299, 312, 0, 0, 0, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 1, 520, 11, 10, 21, 301, 315, 0, 2, 1, 9, 0, 12, 4);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 299, 1, 3, 8, 0, 512, 0, 1, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 315, 2, 3, 10, 0, 515, 0, 1, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 103, 3, 4, 6, 0, 515, 0, 0, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 304, 4, 4, 0, 0, 515, 0, 0, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 11, 5, 4, 4, 0, 512, 0, 1, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 327, 6, 4, 0, 0, 516, 0, 0, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 298, 7, 3, 17, 0, 518, 0, 1, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 301, 8, 3, 20, 0, 518, 0, 2, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 314, 9, 4, 30, 0, 514, 0, 4, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 312, 10, 3, 23, 0, 514, 0, 3, 0, 9, 0, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (60, 2, 344, 11, 2, 2, 0, 0, 0, 0, 0, 9, 1, 4, 12);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 45, 10, 5, 0, 0, 236, 0, 0, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 153, 9, 2, 0, 0, 0, 0, 0, 0, 9, 1, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 521, 8, 4, 4, 48, 236, 0, 0, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 43, 7, 3, 9, 0, 236, 0, 1, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 217, 11, 14, 0, 0, 0, 0, 0, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 28, 6, 7, 19, 0, 238, 0, 2, 1, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 12, 5, 4, 37, 236, 328, 0, 4, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 9, 4, 4, 0, 48, 328, 0, 0, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 3, 3, 9, 7, 0, 0, 0, 1, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 155, 2, 3, 62, 0, 236, 0, 2, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 1, 41, 1, 7, 49, 0, 65, 0, 4, 0, 9, 0, 1, 17);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 51, 7, 4, 0, 43, 153, 0, 0, 0, 9, 0, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (61, 2, 62, 8, 2, 3, 0, 0, 0, 0, 0, 9, 1, 17, 1);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 133, 5, 4, 22, 63, 384, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 13, 6, 4, 8, 58, 380, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 2, 7, 9, 2, 135, 0, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 306, 8, 4, 2, 63, 384, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 15, 9, 3, 4, 0, 384, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 14, 10, 4, 5, 384, 380, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 2, 104, 11, 2, 0, 0, 0, 0, 0, 0, 9, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 377, 1, 4, 3, 104, 15, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 378, 2, 2, 46, 0, 0, 0, 0, 0, 9, 1, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 135, 3, 4, 0, 4, 15, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 58, 4, 4, 0, 306, 15, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 379, 5, 3, 7, 0, 15, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 380, 6, 7, 17, 0, 2, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 381, 7, 3, 0, 0, 4, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 382, 8, 3, 0, 0, 4, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 63, 9, 3, 0, 0, 4, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 383, 10, 4, 1, 4, 2, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 3, 384, 11, 3, 3, 0, 2, 0, 0, 0, 9, 0, 18, 2);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 13, 1, 4, 39, 63, 384, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 15, 2, 4, 31, 58, 380, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 67, 3, 2, 28, 0, 0, 0, 0, 0, 9, 1, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 6, 4, 9, 3, 63, 0, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 14, 5, 4, 5, 63, 384, 0, 0, 0, 9, 0, 2, 18);
INSERT INTO `scorecard_batting_details` VALUES (62, 4, 133, 6, 2, 3, 0, 0, 0, 0, 0, 9, 1, 2, 18);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_bowling_details`
-- 

CREATE TABLE `scorecard_bowling_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `bowling_position` tinyint(4) NOT NULL default '0',
  `overs` float NOT NULL default '0',
  `maidens` tinyint(4) NOT NULL default '0',
  `runs` tinyint(4) NOT NULL default '0',
  `wickets` tinyint(4) NOT NULL default '0',
  `noballs` tinyint(4) NOT NULL default '0',
  `wides` tinyint(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `opponent` int(4) NOT NULL default '0',
  KEY `bowling_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `scorecard_bowling_details`
-- 

INSERT INTO `scorecard_bowling_details` VALUES (1, 1, 14, 1, 8, 2, 24, 2, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (1, 1, 13, 2, 7, 2, 26, 2, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (1, 1, 4, 3, 5, 0, 33, 1, 0, 3, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (1, 1, 15, 4, 6, 0, 11, 5, 1, 4, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (1, 2, 17, 1, 10, 2, 22, 2, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (1, 2, 18, 2, 8, 1, 39, 1, 0, 3, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (1, 2, 19, 3, 4.1, 0, 24, 2, 5, 2, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (1, 2, 20, 4, 3, 1, 9, 3, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 39, 1, 10, 1, 42, 0, 0, 8, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 29, 2, 8, 0, 24, 4, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 36, 3, 10, 0, 28, 0, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 35, 4, 2, 0, 16, 0, 0, 9, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 31, 5, 10, 4, 30, 3, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 38, 6, 4, 0, 23, 1, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 1, 37, 7, 5, 1, 17, 1, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (2, 2, 15, 1, 10, 5, 25, 0, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (2, 2, 14, 2, 10, 1, 45, 5, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (2, 2, 13, 3, 7, 2, 27, 1, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (2, 2, 28, 4, 3, 0, 11, 2, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (3, 1, 52, 1, 4, 0, 12, 2, 1, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (3, 1, 53, 2, 4, 0, 22, 2, 1, 2, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (3, 1, 51, 3, 3, 0, 15, 0, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (3, 1, 49, 4, 4, 0, 20, 3, 0, 1, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (3, 1, 54, 5, 3.1, 2, 9, 3, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 43, 1, 2, 0, 11, 1, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 45, 2, 2, 0, 16, 0, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 15, 3, 4, 0, 24, 1, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 1, 4, 1, 0, 13, 0, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 3, 5, 1, 0, 13, 0, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (3, 2, 44, 6, 1.2, 0, 12, 0, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 4, 1, 1, 0, 3, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 14, 2, 10, 3, 19, 2, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 66, 3, 10, 1, 46, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 13, 4, 9, 2, 35, 2, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 6, 5, 10, 0, 48, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 1, 28, 6, 10, 0, 65, 3, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (4, 2, 62, 1, 1, 0, 3, 0, 0, 1, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (4, 2, 64, 2, 0.1, 0, 2, 0, 0, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 15, 1, 16.2, 6, 31, 6, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 14, 2, 21, 8, 37, 3, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 13, 3, 6, 1, 18, 1, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 4, 4, 4, 1, 18, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 2, 5, 9, 2, 29, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 1, 28, 6, 7, 1, 17, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 2, 77, 1, 15, 3, 41, 3, 0, 0, 8, 22, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 2, 76, 2, 12, 4, 21, 1, 0, 0, 8, 22, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 2, 78, 3, 8.1, 4, 7, 1, 0, 0, 8, 22, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 2, 74, 4, 13, 3, 39, 3, 0, 0, 8, 22, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 2, 75, 5, 13, 2, 46, 2, 0, 0, 8, 22, 2);
INSERT INTO `scorecard_bowling_details` VALUES (7, 3, 4, 1, 8, 1, 32, 1, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 3, 81, 2, 3, 0, 11, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 3, 79, 3, 5, 2, 7, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 3, 10, 4, 2, 0, 7, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (7, 3, 2, 5, 2, 1, 8, 0, 0, 0, 8, 2, 22);
INSERT INTO `scorecard_bowling_details` VALUES (8, 1, 14, 1, 7, 4, 23, 1, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 1, 13, 2, 9.2, 3, 10, 7, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 1, 4, 3, 3, 0, 22, 1, 2, 1, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 92, 1, 6, 0, 13, 0, 0, 2, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 90, 2, 9, 0, 30, 3, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 91, 3, 5, 0, 30, 1, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 84, 4, 5, 1, 20, 2, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 83, 5, 3, 0, 17, 0, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 2, 89, 6, 2, 1, 16, 1, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 3, 14, 1, 10, 3, 26, 3, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 3, 13, 2, 10, 1, 30, 3, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 3, 6, 3, 8.4, 4, 10, 3, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 3, 2, 4, 6, 3, 9, 0, 0, 0, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 3, 16, 5, 3, 1, 6, 1, 1, 1, 8, 2, 26);
INSERT INTO `scorecard_bowling_details` VALUES (8, 4, 86, 1, 4, 1, 5, 1, 0, 2, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (8, 4, 88, 2, 3.1, 0, 9, 0, 0, 0, 8, 26, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 1, 96, 1, 12, 1, 24, 2, 0, 0, 8, 6, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 1, 100, 2, 10, 3, 22, 2, 0, 0, 8, 6, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 1, 101, 3, 5, 1, 9, 1, 3, 0, 8, 6, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 1, 95, 4, 15.2, 8, 13, 4, 0, 0, 8, 6, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 1, 99, 5, 4, 1, 5, 0, 0, 0, 8, 6, 2);
INSERT INTO `scorecard_bowling_details` VALUES (9, 2, 7, 5, 3, 0, 10, 0, 0, 0, 8, 2, 6);
INSERT INTO `scorecard_bowling_details` VALUES (9, 2, 2, 4, 3, 0, 18, 1, 0, 0, 8, 2, 6);
INSERT INTO `scorecard_bowling_details` VALUES (9, 2, 16, 3, 7, 0, 29, 0, 0, 0, 8, 2, 6);
INSERT INTO `scorecard_bowling_details` VALUES (9, 2, 104, 2, 4, 0, 17, 0, 0, 0, 8, 2, 6);
INSERT INTO `scorecard_bowling_details` VALUES (9, 2, 4, 1, 3, 1, 5, 0, 0, 1, 8, 2, 6);
INSERT INTO `scorecard_bowling_details` VALUES (10, 1, 14, 1, 8, 3, 15, 2, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 1, 15, 2, 13, 4, 19, 5, 1, 1, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 1, 13, 3, 5.3, 2, 11, 3, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 108, 1, 13, 6, 8, 1, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 110, 2, 9, 1, 22, 4, 0, 1, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 19, 3, 6, 3, 5, 0, 0, 1, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 26, 4, 11, 1, 27, 1, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 105, 5, 1, 0, 2, 0, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 2, 22, 6, 2, 0, 21, 1, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 3, 14, 1, 10.1, 6, 11, 4, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 3, 15, 2, 12, 3, 21, 3, 2, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 3, 2, 3, 6, 1, 11, 1, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 3, 6, 4, 2, 1, 2, 2, 0, 0, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 3, 102, 5, 4, 2, 10, 0, 0, 1, 8, 2, 10);
INSERT INTO `scorecard_bowling_details` VALUES (10, 4, 112, 1, 3, 0, 8, 0, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 4, 108, 2, 1, 0, 2, 0, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 4, 109, 3, 1, 0, 11, 0, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (10, 4, 25, 4, 1, 0, 2, 0, 0, 0, 8, 10, 2);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 15, 1, 16, 1, 48, 1, 0, 3, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 14, 2, 15, 2, 37, 0, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 13, 3, 18, 5, 25, 2, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 16, 4, 6, 1, 30, 0, 0, 1, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 2, 5, 11.5, 0, 35, 3, 0, 0, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 28, 6, 7, 1, 34, 2, 0, 1, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 102, 7, 3, 0, 16, 0, 0, 1, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 1, 113, 8, 5, 0, 30, 2, 1, 1, 8, 2, 14);
INSERT INTO `scorecard_bowling_details` VALUES (11, 2, 120, 1, 2, 0, 7, 0, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (11, 2, 119, 2, 1, 1, 0, 0, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (11, 2, 29, 3, 2, 0, 4, 0, 0, 0, 8, 14, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 123, 1, 18, 7, 28, 3, 1, 1, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 130, 2, 21, 5, 57, 4, 1, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 129, 3, 16, 4, 29, 1, 0, 1, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 134, 4, 8.5, 0, 26, 1, 1, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 122, 5, 10, 3, 13, 1, 0, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 1, 128, 6, 5, 1, 12, 0, 0, 1, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 66, 1, 4, 0, 9, 2, 0, 3, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 13, 2, 5, 1, 8, 1, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 4, 3, 6, 0, 16, 1, 7, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 1, 4, 15, 2, 33, 2, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 2, 5, 9, 4, 15, 0, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 15, 6, 14, 2, 28, 3, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (12, 2, 6, 7, 9, 2, 17, 0, 1, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 62, 1, 16, 4, 36, 1, 0, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 64, 2, 7, 0, 29, 0, 3, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 63, 3, 7, 1, 30, 1, 2, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 65, 4, 8, 2, 14, 0, 0, 1, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 56, 5, 3, 0, 14, 1, 0, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 61, 6, 7, 0, 32, 2, 4, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 1, 47, 7, 2, 0, 10, 1, 0, 0, 8, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (13, 2, 132, 1, 11, 4, 14, 6, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 2, 13, 2, 6, 1, 23, 1, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 2, 6, 3, 1.2, 0, 2, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 2, 2, 4, 3.4, 0, 4, 2, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 132, 1, 7, 2, 12, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 4, 2, 3, 1, 6, 0, 0, 1, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 113, 3, 4, 0, 21, 0, 3, 1, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 2, 4, 3, 1, 2, 1, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 9, 5, 1, 0, 1, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (13, 3, 133, 6, 1, 0, 5, 0, 0, 0, 8, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 143, 1, 12.2, 3, 21, 5, 0, 1, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 144, 2, 7, 4, 4, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 145, 3, 8, 2, 16, 0, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 146, 4, 9, 3, 16, 1, 1, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 142, 5, 9, 0, 34, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 1, 139, 6, 5, 1, 13, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 15, 1, 12, 2, 31, 0, 1, 1, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 132, 2, 27, 5, 49, 5, 3, 1, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 13, 3, 11, 5, 18, 1, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 6, 4, 6, 2, 10, 0, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 2, 5, 12, 2, 26, 3, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 2, 4, 6, 2, 0, 2, 0, 1, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 143, 1, 11, 3, 23, 2, 0, 1, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 144, 2, 8, 1, 20, 0, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 142, 3, 17, 1, 60, 4, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 139, 4, 5, 0, 14, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 140, 5, 6, 1, 24, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 137, 6, 2, 0, 9, 0, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (14, 3, 138, 7, 1, 0, 3, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 123, 1, 33, 5, 95, 3, 0, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 148, 2, 4, 1, 8, 0, 0, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 134, 3, 22, 8, 53, 1, 0, 1, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 122, 4, 15, 3, 50, 0, 1, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 130, 5, 6, 1, 18, 0, 0, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 128, 6, 10, 1, 43, 0, 0, 0, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 1, 151, 7, 3, 0, 11, 1, 0, 1, 8, 30, 2);
INSERT INTO `scorecard_bowling_details` VALUES (15, 2, 15, 1, 14, 3, 37, 3, 1, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (15, 2, 14, 2, 12, 4, 24, 2, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (15, 2, 13, 3, 20, 6, 45, 1, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (15, 2, 6, 4, 19, 2, 65, 0, 1, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (15, 2, 2, 5, 9, 1, 17, 2, 0, 0, 8, 2, 30);
INSERT INTO `scorecard_bowling_details` VALUES (16, 1, 143, 1, 25, 11, 30, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (16, 1, 144, 2, 14, 4, 42, 2, 2, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (16, 1, 145, 3, 27, 8, 57, 3, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (16, 1, 142, 4, 7.1, 0, 25, 2, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (16, 1, 137, 5, 5, 0, 11, 1, 0, 0, 8, 34, 2);
INSERT INTO `scorecard_bowling_details` VALUES (16, 2, 15, 1, 21.4, 10, 23, 5, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (16, 2, 14, 2, 15, 4, 29, 1, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (16, 2, 2, 3, 3, 0, 11, 0, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (16, 2, 6, 4, 6, 3, 4, 3, 0, 0, 8, 2, 34);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 153, 5, 10, 0, 46, 3, 0, 2, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 1, 8, 0.2, 0, 0, 2, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 3, 7, 1, 1, 0, 1, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 154, 6, 9, 0, 29, 2, 0, 1, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 66, 4, 8, 0, 27, 1, 0, 2, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 155, 3, 4, 0, 24, 1, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 45, 2, 10, 2, 43, 0, 0, 3, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 2, 43, 1, 6, 0, 32, 0, 0, 17, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 157, 6, 5, 0, 36, 0, 0, 0, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 163, 5, 8, 1, 33, 1, 0, 0, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 160, 4, 8, 0, 43, 2, 0, 6, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 112, 3, 10, 1, 32, 0, 0, 2, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 161, 2, 9, 0, 46, 1, 0, 8, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (24, 1, 156, 1, 10, 0, 56, 0, 0, 2, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 43, 1, 3, 0, 24, 0, 0, 16, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 45, 2, 10, 0, 42, 2, 0, 1, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 66, 3, 10, 0, 43, 1, 0, 1, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 153, 4, 10, 0, 49, 0, 0, 0, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 3, 5, 10, 0, 41, 4, 0, 1, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 1, 1, 6, 6.1, 0, 18, 3, 0, 1, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (25, 2, 170, 1, 7, 2, 24, 2, 0, 4, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (25, 2, 171, 2, 7, 1, 23, 0, 0, 2, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (25, 2, 165, 3, 8, 2, 20, 1, 0, 4, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (25, 2, 172, 4, 8, 1, 31, 3, 2, 3, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (25, 2, 166, 5, 7, 0, 44, 3, 0, 6, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 180, 1, 13.4, 5, 20, 1, 0, 1, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 174, 2, 14, 2, 41, 0, 1, 0, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 184, 3, 6, 1, 20, 0, 3, 0, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 181, 4, 21, 6, 38, 4, 0, 0, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 179, 5, 18.2, 6, 26, 3, 0, 0, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 1, 182, 6, 14.5, 3, 21, 1, 0, 0, 8, 21, 1);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 43, 1, 15, 6, 23, 1, 0, 4, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 45, 2, 20, 11, 26, 2, 0, 0, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 153, 3, 22, 8, 26, 0, 0, 0, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 1, 4, 8, 1, 18, 2, 0, 0, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 3, 5, 7, 1, 14, 3, 0, 0, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (26, 2, 66, 6, 4, 2, 8, 1, 0, 0, 8, 1, 21);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 192, 1, 10, 0, 37, 2, 4, 7, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 194, 2, 8, 1, 40, 3, 3, 1, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 190, 3, 8.4, 2, 23, 3, 0, 5, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 187, 4, 10, 1, 26, 1, 0, 1, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 195, 5, 9, 2, 20, 0, 1, 0, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 1, 193, 6, 1, 0, 5, 0, 0, 0, 8, 37, 1);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 43, 1, 10, 0, 49, 0, 0, 3, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 45, 2, 10, 1, 32, 2, 1, 1, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 15, 3, 7, 1, 21, 1, 3, 0, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 153, 4, 7, 0, 21, 1, 0, 0, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 155, 5, 5, 0, 12, 0, 0, 1, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (28, 2, 1, 6, 4.4, 0, 19, 0, 0, 0, 8, 1, 37);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 66, 1, 3.3, 1, 9, 1, 0, 1, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 15, 2, 7, 0, 28, 0, 0, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 1, 3, 8.4, 1, 75, 1, 0, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 153, 4, 10, 1, 50, 1, 1, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 45, 5, 9, 1, 50, 0, 1, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 3, 6, 7, 0, 61, 0, 0, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 1, 13, 7, 4.5, 1, 27, 1, 0, 0, 8, 1, 5);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 205, 1, 9, 3, 16, 4, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 204, 2, 2, 1, 3, 1, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 201, 3, 7, 2, 21, 3, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 203, 4, 5, 0, 13, 0, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 200, 5, 6, 1, 22, 1, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (29, 2, 196, 6, 2.3, 0, 5, 1, 0, 0, 8, 5, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 1, 214, 1, 5, 0, 19, 0, 7, 0, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 1, 215, 2, 12.2, 8, 9, 6, 0, 0, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 1, 216, 3, 8, 3, 18, 4, 0, 2, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 2, 43, 1, 8, 1, 22, 3, 0, 4, 8, 1, 38);
INSERT INTO `scorecard_bowling_details` VALUES (30, 2, 45, 2, 4, 1, 9, 1, 0, 0, 8, 1, 38);
INSERT INTO `scorecard_bowling_details` VALUES (30, 2, 4, 3, 4, 2, 7, 1, 0, 0, 8, 1, 38);
INSERT INTO `scorecard_bowling_details` VALUES (30, 2, 154, 4, 1.3, 0, 7, 0, 0, 0, 8, 1, 38);
INSERT INTO `scorecard_bowling_details` VALUES (30, 2, 15, 5, 1, 0, 2, 0, 0, 0, 8, 1, 38);
INSERT INTO `scorecard_bowling_details` VALUES (30, 3, 215, 1, 4, 2, 5, 1, 1, 1, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 3, 214, 2, 3, 2, 1, 0, 1, 0, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 3, 213, 3, 1, 1, 0, 0, 0, 0, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (30, 3, 218, 4, 1, 1, 0, 0, 0, 0, 8, 38, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 223, 1, 15, 6, 31, 2, 1, 0, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 156, 2, 17, 9, 22, 3, 0, 3, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 158, 3, 24, 6, 68, 1, 0, 0, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 222, 4, 12, 2, 33, 2, 2, 2, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 157, 5, 6, 2, 5, 0, 0, 2, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 159, 6, 1, 0, 5, 0, 0, 0, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 1, 221, 7, 2.3, 0, 8, 2, 0, 1, 8, 9, 1);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 43, 1, 13.1, 4, 37, 3, 1, 12, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 4, 2, 5, 1, 14, 0, 1, 1, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 155, 3, 15, 5, 29, 0, 3, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 3, 4, 18, 9, 33, 4, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 45, 5, 16, 8, 29, 3, 1, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 1, 6, 4, 3, 6, 0, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (31, 2, 154, 7, 1, 0, 3, 0, 0, 0, 8, 1, 9);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 4, 1, 3, 2, 4, 1, 0, 1, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 43, 2, 2, 0, 16, 0, 0, 9, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 1, 3, 4, 0, 14, 0, 0, 0, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 13, 4, 4, 0, 18, 2, 0, 0, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 14, 5, 3, 0, 16, 2, 0, 1, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 1, 155, 6, 4, 0, 21, 4, 0, 0, 8, 1, 42);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 234, 1, 4, 1, 18, 1, 0, 1, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 232, 2, 3, 0, 9, 1, 0, 0, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 226, 3, 4, 0, 26, 1, 1, 0, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 228, 4, 4, 1, 17, 1, 0, 0, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 233, 5, 2, 0, 14, 0, 0, 0, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (32, 2, 227, 6, 1.3, 0, 7, 0, 0, 0, 8, 42, 1);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 43, 1, 10, 1, 35, 0, 0, 5, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 45, 2, 10, 1, 17, 1, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 153, 3, 10, 3, 14, 4, 0, 3, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 154, 4, 10, 2, 35, 2, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 1, 5, 7, 0, 26, 1, 0, 2, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 3, 6, 2, 0, 20, 0, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 1, 173, 7, 1, 0, 4, 0, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (33, 2, 241, 1, 6, 0, 14, 2, 0, 2, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (33, 2, 236, 2, 5.4, 0, 7, 1, 0, 1, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 170, 1, 13, 7, 12, 4, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 171, 2, 8, 3, 7, 2, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 242, 3, 3, 1, 6, 0, 4, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 165, 4, 10, 1, 32, 2, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 172, 5, 5, 1, 13, 1, 2, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 1, 166, 6, 3.4, 0, 11, 1, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 2, 154, 1, 13, 3, 30, 1, 0, 0, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (34, 2, 153, 2, 4.4, 0, 16, 1, 1, 0, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (34, 2, 45, 3, 5, 2, 5, 0, 0, 0, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (34, 2, 43, 4, 7, 1, 16, 0, 0, 2, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (34, 2, 3, 5, 4, 0, 11, 1, 0, 0, 8, 1, 13);
INSERT INTO `scorecard_bowling_details` VALUES (34, 3, 170, 1, 3.2, 2, 3, 1, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (34, 3, 171, 2, 3, 2, 1, 1, 0, 0, 8, 13, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 253, 1, 20, 8, 32, 8, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 248, 2, 15, 7, 18, 1, 1, 1, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 250, 3, 8, 3, 8, 0, 0, 2, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 251, 4, 3, 2, 1, 0, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 249, 5, 4, 1, 11, 0, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 244, 6, 8, 2, 13, 0, 0, 1, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 1, 252, 7, 3, 2, 2, 1, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 2, 132, 1, 5, 0, 12, 0, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 2, 43, 2, 6, 1, 13, 1, 0, 2, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 2, 45, 3, 5, 0, 27, 0, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 2, 153, 4, 8, 1, 36, 3, 1, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 2, 155, 5, 1, 0, 9, 1, 0, 1, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 253, 1, 19.3, 7, 22, 3, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 248, 2, 12, 8, 6, 3, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 252, 3, 1.3, 0, 11, 0, 0, 7, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 122, 4, 7, 2, 12, 1, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 249, 5, 8, 6, 2, 0, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 244, 6, 3, 0, 18, 1, 0, 0, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 3, 134, 7, 6.4, 3, 6, 1, 0, 1, 8, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (35, 4, 43, 1, 7, 1, 19, 1, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 4, 153, 2, 10, 2, 24, 3, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 4, 155, 3, 2, 0, 14, 1, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (35, 4, 132, 4, 1.1, 0, 11, 0, 0, 0, 8, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 236, 1, 12, 4, 22, 0, 1, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 241, 2, 11, 3, 45, 1, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 238, 3, 8, 1, 29, 3, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 239, 4, 7, 0, 39, 0, 1, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 240, 5, 7, 0, 26, 2, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 1, 49, 6, 5, 0, 19, 1, 0, 0, 8, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (36, 2, 43, 1, 10.1, 2, 34, 3, 0, 5, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (36, 2, 45, 2, 9, 3, 19, 1, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (36, 2, 154, 3, 11, 3, 35, 2, 0, 0, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (36, 2, 153, 4, 13, 0, 50, 3, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (36, 2, 3, 5, 3, 0, 18, 1, 0, 1, 8, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 260, 1, 18, 5, 21, 3, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 256, 2, 8, 6, 3, 1, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 263, 3, 11, 3, 18, 1, 1, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 261, 4, 5, 0, 7, 0, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 262, 5, 10, 2, 18, 1, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 259, 6, 9, 4, 13, 1, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 258, 7, 7.3, 1, 11, 2, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 1, 264, 8, 7, 6, 1, 1, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 2, 43, 1, 19, 7, 38, 6, 0, 12, 8, 1, 33);
INSERT INTO `scorecard_bowling_details` VALUES (37, 2, 45, 2, 16, 9, 31, 2, 0, 0, 8, 1, 33);
INSERT INTO `scorecard_bowling_details` VALUES (37, 2, 154, 3, 8, 3, 21, 1, 0, 0, 8, 1, 33);
INSERT INTO `scorecard_bowling_details` VALUES (37, 2, 153, 4, 6, 0, 18, 0, 0, 0, 8, 1, 33);
INSERT INTO `scorecard_bowling_details` VALUES (37, 2, 1, 5, 1, 0, 7, 0, 0, 0, 8, 1, 33);
INSERT INTO `scorecard_bowling_details` VALUES (37, 3, 260, 1, 8, 4, 9, 4, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 3, 256, 2, 5, 2, 3, 0, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (37, 3, 258, 3, 3, 2, 3, 0, 0, 0, 8, 33, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 43, 1, 6, 1, 14, 2, 0, 5, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 45, 2, 7, 0, 26, 1, 0, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 153, 3, 6, 0, 13, 0, 2, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 104, 4, 6, 1, 22, 3, 0, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 3, 5, 2, 0, 3, 0, 0, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 155, 6, 4, 0, 30, 3, 3, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 4, 7, 2, 1, 1, 0, 0, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 1, 133, 8, 2, 0, 9, 0, 0, 0, 9, 1, 43);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 295, 1, 6, 2, 13, 0, 0, 1, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 287, 2, 6, 1, 24, 0, 0, 1, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 289, 3, 2, 0, 36, 0, 5, 6, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 296, 4, 5, 1, 17, 0, 0, 1, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 286, 5, 3, 0, 12, 0, 0, 0, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 290, 6, 4, 1, 13, 0, 0, 0, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (41, 2, 297, 7, 4, 0, 9, 0, 0, 0, 9, 43, 1);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 301, 2, 7, 2, 20, 2, 0, 1, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 312, 1, 9, 2, 29, 2, 0, 0, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 327, 3, 8, 2, 21, 0, 0, 0, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 298, 4, 8, 1, 34, 2, 0, 1, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 304, 5, 5, 0, 28, 0, 0, 2, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 314, 6, 5, 0, 29, 0, 0, 1, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 1, 313, 7, 3, 0, 14, 1, 0, 1, 9, 4, 20);
INSERT INTO `scorecard_bowling_details` VALUES (42, 2, 322, 1, 7, 0, 42, 1, 0, 2, 9, 20, 4);
INSERT INTO `scorecard_bowling_details` VALUES (42, 2, 318, 2, 8, 0, 15, 2, 1, 4, 9, 20, 4);
INSERT INTO `scorecard_bowling_details` VALUES (42, 2, 319, 3, 8, 1, 30, 2, 1, 3, 9, 20, 4);
INSERT INTO `scorecard_bowling_details` VALUES (42, 2, 321, 4, 8, 1, 33, 2, 2, 0, 9, 20, 4);
INSERT INTO `scorecard_bowling_details` VALUES (42, 2, 326, 5, 6, 0, 22, 0, 0, 1, 9, 20, 4);
INSERT INTO `scorecard_bowling_details` VALUES (62, 2, 380, 4, 4, 0, 5, 2, 0, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 2, 384, 3, 6.5, 2, 18, 3, 1, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 3, 6, 2, 0, 13, 1, 0, 0, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 155, 5, 1, 0, 4, 0, 0, 0, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 153, 4, 19.1, 1, 48, 2, 3, 0, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 521, 3, 19, 6, 59, 1, 0, 0, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 45, 2, 17, 5, 42, 2, 2, 0, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (61, 2, 43, 1, 12, 3, 28, 0, 0, 3, 9, 1, 17);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 108, 1, 10, 1, 24, 1, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 338, 2, 10, 1, 32, 1, 0, 5, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 336, 3, 8, 1, 28, 0, 0, 1, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 335, 4, 10, 0, 45, 3, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 332, 5, 7, 1, 41, 2, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 1, 334, 6, 5, 1, 25, 0, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 342, 1, 10, 1, 51, 1, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 301, 2, 6, 0, 28, 0, 0, 2, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 343, 3, 10, 1, 39, 0, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 298, 4, 5, 0, 26, 1, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 344, 5, 9, 0, 48, 3, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (44, 2, 299, 6, 5.1, 0, 16, 0, 0, 1, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 16, 1, 4, 1, 8, 1, 1, 1, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 81, 2, 5, 2, 5, 2, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 342, 3, 10, 4, 16, 0, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 298, 4, 9, 2, 17, 5, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 301, 5, 4, 0, 10, 0, 0, 4, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 1, 299, 6, 1.4, 0, 3, 1, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (45, 2, 345, 1, 5, 0, 25, 0, 0, 6, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (45, 2, 118, 2, 5, 0, 39, 0, 0, 1, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 16, 1, 13, 1, 37, 0, 3, 1, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 81, 2, 12, 3, 27, 2, 0, 2, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 342, 3, 17.1, 2, 51, 3, 1, 2, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 301, 4, 7, 1, 19, 1, 1, 1, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 298, 5, 12, 4, 30, 1, 0, 0, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 344, 6, 6, 2, 21, 1, 0, 0, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 299, 7, 4, 1, 17, 0, 0, 0, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 304, 8, 8, 1, 18, 2, 0, 3, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 1, 11, 9, 6, 0, 12, 0, 0, 0, 8, 3, 23);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 363, 1, 15, 6, 31, 3, 0, 0, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 361, 2, 22, 6, 62, 4, 3, 0, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 364, 3, 13, 2, 26, 2, 0, 0, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 356, 4, 1, 0, 3, 0, 0, 1, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 365, 5, 12, 0, 32, 1, 0, 0, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (46, 2, 354, 6, 5, 0, 10, 0, 0, 0, 8, 23, 3);
INSERT INTO `scorecard_bowling_details` VALUES (47, 1, 81, 1, 12, 4, 38, 4, 1, 2, 8, 3, 7);
INSERT INTO `scorecard_bowling_details` VALUES (47, 1, 342, 2, 12, 3, 31, 3, 0, 1, 8, 3, 7);
INSERT INTO `scorecard_bowling_details` VALUES (47, 1, 301, 3, 8, 3, 28, 0, 0, 0, 8, 3, 7);
INSERT INTO `scorecard_bowling_details` VALUES (47, 1, 344, 4, 6.3, 0, 28, 1, 0, 0, 8, 3, 7);
INSERT INTO `scorecard_bowling_details` VALUES (47, 1, 299, 5, 4, 1, 18, 2, 0, 0, 8, 3, 7);
INSERT INTO `scorecard_bowling_details` VALUES (47, 2, 366, 1, 15, 2, 49, 1, 0, 1, 8, 7, 3);
INSERT INTO `scorecard_bowling_details` VALUES (47, 2, 372, 2, 6, 0, 35, 2, 0, 0, 8, 7, 3);
INSERT INTO `scorecard_bowling_details` VALUES (47, 2, 373, 3, 10, 2, 41, 2, 0, 1, 8, 7, 3);
INSERT INTO `scorecard_bowling_details` VALUES (47, 2, 100, 4, 10, 2, 11, 2, 0, 0, 8, 7, 3);
INSERT INTO `scorecard_bowling_details` VALUES (47, 2, 370, 5, 1.1, 0, 8, 0, 0, 0, 8, 7, 3);
INSERT INTO `scorecard_bowling_details` VALUES (62, 2, 63, 2, 11, 3, 18, 0, 1, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 2, 383, 1, 14, 4, 26, 3, 0, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 6, 6, 13, 5, 17, 1, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 2, 5, 2, 0, 7, 0, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 14, 4, 9, 3, 14, 2, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 13, 3, 15, 6, 20, 4, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 104, 2, 5, 1, 19, 1, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 1, 15, 1, 7.1, 1, 21, 2, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (49, 1, 338, 1, 11, 4, 19, 0, 0, 3, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 1, 386, 2, 12, 3, 20, 4, 0, 1, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 1, 389, 3, 3, 1, 6, 0, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 1, 388, 4, 5.1, 0, 6, 5, 1, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 1, 387, 5, 1, 0, 1, 1, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 81, 1, 17, 4, 54, 1, 0, 1, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 301, 2, 16, 4, 59, 2, 1, 1, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 104, 3, 18.2, 3, 51, 2, 0, 2, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 298, 4, 8, 0, 40, 1, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 376, 5, 6, 2, 11, 0, 0, 1, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 465, 6, 9, 1, 31, 1, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 103, 7, 3, 1, 3, 0, 0, 1, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 79, 8, 3, 0, 23, 2, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 2, 299, 9, 4, 0, 14, 1, 0, 0, 8, 3, 11);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 338, 1, 9, 6, 3, 0, 0, 1, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 386, 2, 16, 6, 12, 1, 0, 3, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 388, 3, 15, 6, 12, 4, 1, 1, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 335, 4, 5, 3, 4, 0, 0, 1, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 387, 5, 6, 1, 17, 1, 0, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (49, 3, 389, 6, 4, 1, 4, 1, 3, 0, 8, 11, 3);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 310, 1, 9, 0, 33, 2, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 401, 2, 3, 0, 21, 1, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 309, 3, 6, 0, 30, 2, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 5, 4, 2, 0, 28, 1, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 308, 5, 9, 0, 49, 3, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 300, 6, 4, 0, 27, 0, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 341, 7, 5, 0, 17, 0, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 1, 402, 8, 7, 0, 88, 0, 0, 0, 9, 45, 48);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 396, 1, 3, 1, 7, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 398, 2, 5, 0, 32, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 394, 3, 4, 0, 21, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 391, 4, 5, 2, 9, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 397, 5, 5, 1, 19, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 392, 6, 4, 0, 18, 1, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 390, 7, 6, 0, 25, 1, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 395, 8, 5, 0, 42, 0, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 399, 9, 3, 0, 25, 2, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 400, 10, 3, 0, 17, 2, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (50, 2, 393, 11, 2, 0, 8, 1, 0, 0, 9, 48, 45);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 16, 1, 9.1, 2, 17, 3, 1, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 81, 2, 10, 1, 23, 1, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 342, 3, 6, 2, 17, 0, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 104, 4, 10, 0, 39, 0, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 298, 5, 3, 0, 24, 0, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 1, 302, 6, 7, 1, 34, 3, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (51, 2, 383, 1, 8, 1, 18, 1, 0, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (51, 2, 407, 2, 7, 1, 21, 3, 1, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (51, 2, 406, 3, 5, 1, 19, 1, 0, 1, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (51, 2, 408, 4, 4, 0, 13, 2, 0, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 4, 1, 12, 3, 22, 0, 2, 6, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 104, 2, 13.1, 4, 32, 4, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 81, 3, 8, 1, 19, 1, 1, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 342, 4, 8, 1, 34, 1, 1, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 299, 5, 2, 0, 13, 0, 0, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 133, 6, 4, 0, 21, 2, 0, 1, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 1, 80, 7, 5, 1, 10, 2, 1, 0, 8, 3, 15);
INSERT INTO `scorecard_bowling_details` VALUES (52, 2, 410, 1, 6, 2, 15, 3, 1, 2, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (52, 2, 416, 2, 6, 1, 17, 1, 0, 0, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (52, 2, 411, 3, 7, 2, 13, 1, 1, 1, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (52, 2, 347, 4, 8, 0, 19, 0, 0, 0, 8, 15, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 425, 1, 6, 1, 29, 0, 0, 2, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 420, 2, 5, 1, 20, 0, 0, 2, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 422, 3, 9, 1, 20, 2, 1, 1, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 423, 4, 10, 2, 23, 3, 0, 2, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 426, 5, 5, 2, 21, 2, 0, 2, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 418, 6, 8, 2, 21, 1, 0, 2, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 1, 83, 7, 5, 1, 6, 1, 0, 0, 8, 27, 3);
INSERT INTO `scorecard_bowling_details` VALUES (53, 2, 16, 1, 7, 1, 10, 4, 0, 1, 8, 3, 27);
INSERT INTO `scorecard_bowling_details` VALUES (53, 2, 104, 2, 8, 1, 14, 3, 0, 3, 8, 3, 27);
INSERT INTO `scorecard_bowling_details` VALUES (53, 2, 298, 3, 3, 0, 13, 0, 0, 0, 8, 3, 27);
INSERT INTO `scorecard_bowling_details` VALUES (53, 2, 10, 4, 4.5, 0, 6, 3, 1, 1, 8, 3, 27);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 439, 1, 11, 5, 22, 2, 1, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 151, 2, 17, 6, 33, 3, 0, 1, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 442, 3, 8, 5, 15, 3, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 131, 4, 8, 2, 16, 0, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 445, 5, 7.2, 2, 17, 2, 2, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 444, 6, 4, 0, 17, 0, 0, 4, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 1, 441, 7, 8, 0, 33, 0, 0, 1, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 81, 1, 14, 5, 52, 2, 0, 0, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 16, 2, 13, 3, 45, 1, 0, 2, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 102, 3, 6, 2, 26, 2, 0, 14, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 104, 4, 7, 1, 31, 1, 0, 1, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 10, 5, 3, 0, 12, 0, 0, 1, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 80, 6, 1, 0, 2, 0, 0, 0, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 298, 7, 2, 0, 26, 0, 0, 0, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 2, 304, 8, 4, 0, 22, 0, 0, 0, 8, 3, 31);
INSERT INTO `scorecard_bowling_details` VALUES (54, 3, 151, 1, 9, 1, 18, 3, 0, 1, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 3, 445, 2, 8, 3, 8, 2, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 3, 446, 3, 5, 1, 10, 0, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 3, 442, 4, 4, 0, 11, 0, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (54, 3, 444, 5, 2, 0, 6, 0, 0, 0, 8, 31, 3);
INSERT INTO `scorecard_bowling_details` VALUES (55, 1, 383, 1, 19.2, 8, 24, 6, 0, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (55, 1, 453, 2, 5, 1, 8, 1, 0, 1, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (55, 1, 407, 3, 6, 0, 16, 1, 1, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (55, 1, 404, 4, 8, 2, 21, 2, 0, 0, 8, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (55, 2, 104, 1, 11, 3, 26, 0, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (55, 2, 81, 2, 16, 7, 29, 5, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (55, 2, 16, 3, 7, 1, 15, 0, 2, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (55, 2, 299, 4, 2, 1, 4, 1, 0, 0, 8, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (56, 1, 457, 1, 12, 7, 16, 2, 0, 4, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 1, 458, 2, 6, 4, 8, 2, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 1, 459, 3, 7, 2, 7, 2, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 1, 460, 4, 9, 4, 12, 2, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 1, 461, 5, 2.5, 1, 1, 1, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 2, 104, 1, 7, 1, 40, 0, 0, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 2, 81, 2, 5, 1, 14, 0, 0, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 2, 16, 3, 2, 0, 16, 0, 0, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 2, 102, 4, 2, 0, 22, 0, 0, 0, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 2, 302, 5, 6, 0, 34, 1, 0, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 461, 1, 10, 2, 21, 2, 1, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 457, 2, 12, 2, 28, 0, 0, 1, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 458, 3, 18, 7, 34, 4, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 459, 4, 10, 5, 14, 0, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 460, 5, 2, 0, 11, 0, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 463, 6, 9, 3, 17, 2, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 454, 7, 3, 0, 12, 0, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 456, 8, 3, 0, 6, 1, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 464, 9, 4, 0, 12, 0, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 3, 462, 10, 0.3, 0, 0, 1, 0, 0, 8, 35, 3);
INSERT INTO `scorecard_bowling_details` VALUES (56, 4, 81, 1, 6, 0, 13, 2, 1, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 4, 16, 2, 8, 2, 18, 1, 0, 0, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 4, 104, 3, 3.5, 1, 29, 0, 0, 0, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 4, 102, 4, 3, 2, 2, 0, 0, 0, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (56, 4, 299, 5, 3, 0, 12, 0, 0, 1, 8, 3, 35);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 494, 1, 10, 0, 34, 2, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 495, 2, 10, 0, 35, 1, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 498, 3, 6, 0, 28, 1, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 489, 4, 10, 0, 47, 2, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 493, 5, 9, 2, 37, 0, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 1, 491, 6, 6, 0, 38, 0, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 427, 1, 10, 3, 23, 1, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 487, 2, 9.1, 0, 35, 2, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 429, 3, 6, 0, 24, 0, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 485, 4, 10, 1, 23, 3, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 433, 5, 9, 1, 36, 2, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (57, 2, 484, 6, 5, 0, 40, 0, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 427, 1, 23, 9, 30, 2, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 485, 2, 22, 10, 41, 2, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 487, 3, 20, 10, 28, 2, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 429, 4, 21, 4, 51, 3, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 484, 5, 13, 2, 39, 0, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 433, 6, 3, 1, 7, 0, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 1, 486, 7, 3, 1, 9, 0, 0, 0, 1, 1, 29);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 494, 1, 18, 3, 68, 1, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 495, 2, 15, 5, 43, 0, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 497, 3, 8, 3, 17, 0, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 491, 4, 18, 6, 53, 3, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 493, 5, 16, 3, 41, 1, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (58, 2, 489, 6, 1, 0, 1, 0, 0, 0, 1, 29, 1);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 502, 1, 15, 3, 59, 2, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 501, 2, 17, 6, 38, 2, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 453, 3, 16, 3, 43, 1, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 503, 4, 6, 0, 22, 0, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 408, 5, 2, 0, 8, 0, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 1, 504, 6, 14, 0, 43, 2, 0, 0, 9, 19, 3);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 510, 1, 15, 3, 38, 0, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 81, 2, 11, 1, 62, 0, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 509, 3, 7, 1, 28, 1, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 508, 4, 10, 3, 19, 0, 0, 1, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 66, 5, 5, 0, 15, 0, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 305, 6, 6, 1, 22, 0, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 10, 7, 3, 1, 13, 1, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (59, 2, 507, 8, 2, 0, 12, 0, 0, 0, 9, 3, 19);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 312, 1, 6.2, 2, 16, 2, 0, 0, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 301, 2, 6, 0, 26, 1, 0, 0, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 344, 3, 9, 1, 14, 1, 0, 3, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 298, 4, 9, 3, 25, 3, 0, 1, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 315, 5, 7, 1, 24, 2, 0, 1, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 1, 11, 6, 7, 1, 22, 1, 0, 1, 9, 4, 12);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 512, 1, 9, 3, 21, 2, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 515, 2, 9, 4, 11, 3, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 513, 3, 4, 0, 17, 0, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 516, 4, 9, 3, 25, 1, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 518, 5, 9, 1, 32, 2, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (60, 2, 514, 6, 3.1, 0, 18, 2, 0, 0, 9, 12, 4);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 236, 9, 6, 2, 9, 4, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 56, 8, 3, 0, 7, 0, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 329, 7, 6, 1, 14, 0, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 62, 6, 3, 0, 12, 0, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 328, 5, 20, 4, 61, 2, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 65, 4, 8, 2, 10, 1, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 241, 3, 7, 1, 26, 0, 0, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 51, 2, 5, 1, 15, 0, 2, 1, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (61, 1, 238, 1, 14, 2, 37, 1, 1, 0, 9, 17, 1);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 15, 1, 6, 1, 14, 4, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 104, 2, 5, 1, 11, 0, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 13, 3, 3, 0, 7, 0, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 2, 4, 9.1, 0, 27, 3, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 6, 5, 1, 1, 0, 0, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 14, 6, 6, 4, 7, 0, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 3, 4, 7, 5, 1, 11, 3, 0, 0, 9, 2, 18);
INSERT INTO `scorecard_bowling_details` VALUES (62, 4, 383, 1, 6, 0, 39, 0, 0, 3, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 4, 63, 2, 7, 0, 39, 0, 0, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 4, 380, 3, 2, 0, 19, 1, 0, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 4, 384, 4, 4, 0, 10, 2, 0, 0, 9, 18, 2);
INSERT INTO `scorecard_bowling_details` VALUES (62, 4, 377, 5, 1, 0, 6, 0, 0, 1, 9, 18, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_extras_details`
-- 

CREATE TABLE `scorecard_extras_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `legbyes` tinyint(4) default NULL,
  `byes` tinyint(4) default NULL,
  `wides` tinyint(4) default NULL,
  `noballs` tinyint(4) default NULL,
  `total` tinyint(4) default NULL,
  KEY `extras_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `scorecard_extras_details`
-- 

INSERT INTO `scorecard_extras_details` VALUES (1, 1, 2, 0, 8, 2, 12);
INSERT INTO `scorecard_extras_details` VALUES (1, 2, 1, 2, 5, 5, 13);
INSERT INTO `scorecard_extras_details` VALUES (2, 1, 7, 3, 20, 2, 32);
INSERT INTO `scorecard_extras_details` VALUES (2, 2, 1, 2, 11, 1, 15);
INSERT INTO `scorecard_extras_details` VALUES (3, 1, 5, 7, 3, 2, 17);
INSERT INTO `scorecard_extras_details` VALUES (3, 2, 2, 0, 2, 0, 4);
INSERT INTO `scorecard_extras_details` VALUES (4, 1, 2, 0, 22, 6, 30);
INSERT INTO `scorecard_extras_details` VALUES (4, 2, 0, 0, 1, 0, 1);
INSERT INTO `scorecard_extras_details` VALUES (7, 1, 2, 13, 10, 2, 27);
INSERT INTO `scorecard_extras_details` VALUES (7, 2, 4, 0, 0, 0, 4);
INSERT INTO `scorecard_extras_details` VALUES (7, 3, 1, 4, 2, 0, 7);
INSERT INTO `scorecard_extras_details` VALUES (7, 4, 0, 0, 0, 0, 0);
INSERT INTO `scorecard_extras_details` VALUES (7, 4, 0, 0, 0, 0, 0);
INSERT INTO `scorecard_extras_details` VALUES (8, 1, 2, 0, 1, 2, 5);
INSERT INTO `scorecard_extras_details` VALUES (8, 2, 0, 3, 2, 1, 6);
INSERT INTO `scorecard_extras_details` VALUES (8, 3, 2, 1, 1, 1, 5);
INSERT INTO `scorecard_extras_details` VALUES (8, 4, 0, 0, 2, 0, 2);
INSERT INTO `scorecard_extras_details` VALUES (9, 1, 4, 0, 0, 3, 7);
INSERT INTO `scorecard_extras_details` VALUES (9, 2, 3, 4, 1, 0, 8);
INSERT INTO `scorecard_extras_details` VALUES (10, 1, 2, 3, 1, 1, 7);
INSERT INTO `scorecard_extras_details` VALUES (10, 2, 1, 2, 2, 0, 5);
INSERT INTO `scorecard_extras_details` VALUES (10, 3, 2, 4, 1, 2, 9);
INSERT INTO `scorecard_extras_details` VALUES (10, 4, 0, 5, 0, 0, 5);
INSERT INTO `scorecard_extras_details` VALUES (11, 1, 2, 4, 10, 1, 17);
INSERT INTO `scorecard_extras_details` VALUES (11, 2, 1, 0, 2, 1, 4);
INSERT INTO `scorecard_extras_details` VALUES (12, 1, 3, 3, 3, 4, 13);
INSERT INTO `scorecard_extras_details` VALUES (12, 2, 0, 7, 4, 8, 19);
INSERT INTO `scorecard_extras_details` VALUES (13, 1, 5, 3, 1, 9, 18);
INSERT INTO `scorecard_extras_details` VALUES (13, 2, 2, 0, 0, 0, 2);
INSERT INTO `scorecard_extras_details` VALUES (13, 3, 1, 3, 5, 3, 12);
INSERT INTO `scorecard_extras_details` VALUES (14, 1, 0, 1, 1, 1, 3);
INSERT INTO `scorecard_extras_details` VALUES (14, 2, 4, 10, 2, 5, 21);
INSERT INTO `scorecard_extras_details` VALUES (14, 3, 6, 3, 1, 0, 10);
INSERT INTO `scorecard_extras_details` VALUES (15, 1, 3, 1, 2, 1, 7);
INSERT INTO `scorecard_extras_details` VALUES (15, 2, 4, 1, 0, 2, 7);
INSERT INTO `scorecard_extras_details` VALUES (16, 1, 3, 5, 0, 2, 10);
INSERT INTO `scorecard_extras_details` VALUES (16, 2, 1, 2, 0, 0, 3);
INSERT INTO `scorecard_extras_details` VALUES (30, 1, 1, 0, 2, 7, 10);
INSERT INTO `scorecard_extras_details` VALUES (31, 1, 1, 1, 6, 3, 11);
INSERT INTO `scorecard_extras_details` VALUES (30, 3, 4, 2, 1, 2, 9);
INSERT INTO `scorecard_extras_details` VALUES (30, 2, 2, 0, 4, 0, 6);
INSERT INTO `scorecard_extras_details` VALUES (29, 2, 0, 7, 0, 0, 7);
INSERT INTO `scorecard_extras_details` VALUES (29, 1, 4, 4, 1, 3, 12);
INSERT INTO `scorecard_extras_details` VALUES (28, 2, 2, 0, 5, 4, 11);
INSERT INTO `scorecard_extras_details` VALUES (28, 1, 3, 0, 14, 8, 25);
INSERT INTO `scorecard_extras_details` VALUES (26, 2, 4, 7, 4, 0, 15);
INSERT INTO `scorecard_extras_details` VALUES (26, 1, 5, 13, 1, 4, 23);
INSERT INTO `scorecard_extras_details` VALUES (25, 2, 0, 1, 19, 2, 22);
INSERT INTO `scorecard_extras_details` VALUES (25, 1, 2, 1, 20, 0, 23);
INSERT INTO `scorecard_extras_details` VALUES (24, 2, 7, 3, 25, 0, 35);
INSERT INTO `scorecard_extras_details` VALUES (24, 1, 5, 6, 18, 6, 35);
INSERT INTO `scorecard_extras_details` VALUES (31, 2, 7, 3, 13, 6, 29);
INSERT INTO `scorecard_extras_details` VALUES (32, 1, 3, 3, 11, 0, 17);
INSERT INTO `scorecard_extras_details` VALUES (32, 2, 5, 0, 1, 1, 7);
INSERT INTO `scorecard_extras_details` VALUES (33, 1, 6, 2, 13, 0, 21);
INSERT INTO `scorecard_extras_details` VALUES (33, 2, 1, 1, 3, 0, 5);
INSERT INTO `scorecard_extras_details` VALUES (34, 1, 3, 1, 0, 6, 10);
INSERT INTO `scorecard_extras_details` VALUES (34, 2, 5, 7, 2, 1, 15);
INSERT INTO `scorecard_extras_details` VALUES (34, 3, 1, 0, 0, 0, 1);
INSERT INTO `scorecard_extras_details` VALUES (35, 1, 6, 4, 4, 1, 15);
INSERT INTO `scorecard_extras_details` VALUES (35, 2, 0, 9, 3, 1, 13);
INSERT INTO `scorecard_extras_details` VALUES (35, 3, 3, 1, 10, 0, 14);
INSERT INTO `scorecard_extras_details` VALUES (35, 4, 2, 2, 0, 0, 4);
INSERT INTO `scorecard_extras_details` VALUES (36, 1, 1, 0, 0, 2, 3);
INSERT INTO `scorecard_extras_details` VALUES (36, 2, 3, 2, 7, 0, 12);
INSERT INTO `scorecard_extras_details` VALUES (37, 1, 6, 3, 0, 1, 10);
INSERT INTO `scorecard_extras_details` VALUES (37, 2, 8, 3, 12, 0, 23);
INSERT INTO `scorecard_extras_details` VALUES (37, 3, 1, 2, 0, 0, 3);
INSERT INTO `scorecard_extras_details` VALUES (41, 1, 4, 5, 5, 5, 19);
INSERT INTO `scorecard_extras_details` VALUES (41, 2, 4, 1, 9, 5, 19);
INSERT INTO `scorecard_extras_details` VALUES (42, 1, 0, 4, 7, 2, 13);
INSERT INTO `scorecard_extras_details` VALUES (42, 2, 3, 3, 10, 3, 19);
INSERT INTO `scorecard_extras_details` VALUES (61, 2, 2, 2, 3, 5, 12);
INSERT INTO `scorecard_extras_details` VALUES (44, 1, 6, 3, 5, 0, 14);
INSERT INTO `scorecard_extras_details` VALUES (44, 2, 1, 0, 4, 0, 5);
INSERT INTO `scorecard_extras_details` VALUES (45, 1, 2, 5, 6, 1, 14);
INSERT INTO `scorecard_extras_details` VALUES (45, 2, 0, 5, 7, 0, 12);
INSERT INTO `scorecard_extras_details` VALUES (46, 1, 7, 6, 12, 5, 30);
INSERT INTO `scorecard_extras_details` VALUES (46, 2, 2, 3, 1, 6, 12);
INSERT INTO `scorecard_extras_details` VALUES (47, 1, 3, 0, 3, 1, 7);
INSERT INTO `scorecard_extras_details` VALUES (47, 2, 2, 0, 2, 0, 4);
INSERT INTO `scorecard_extras_details` VALUES (62, 2, 0, 2, 0, 2, 4);
INSERT INTO `scorecard_extras_details` VALUES (62, 1, 2, 7, 3, 0, 12);
INSERT INTO `scorecard_extras_details` VALUES (49, 1, 0, 2, 4, 1, 7);
INSERT INTO `scorecard_extras_details` VALUES (49, 2, 2, 2, 6, 1, 11);
INSERT INTO `scorecard_extras_details` VALUES (49, 3, 2, 0, 6, 5, 13);
INSERT INTO `scorecard_extras_details` VALUES (50, 1, 1, 8, 1, 0, 10);
INSERT INTO `scorecard_extras_details` VALUES (50, 2, 0, 10, 0, 2, 12);
INSERT INTO `scorecard_extras_details` VALUES (51, 1, 6, 5, 0, 1, 12);
INSERT INTO `scorecard_extras_details` VALUES (51, 2, 0, 1, 1, 1, 3);
INSERT INTO `scorecard_extras_details` VALUES (52, 1, 1, 2, 9, 5, 17);
INSERT INTO `scorecard_extras_details` VALUES (52, 2, 0, 4, 3, 2, 9);
INSERT INTO `scorecard_extras_details` VALUES (53, 1, 1, 2, 12, 1, 16);
INSERT INTO `scorecard_extras_details` VALUES (53, 2, 0, 0, 5, 1, 6);
INSERT INTO `scorecard_extras_details` VALUES (54, 1, 2, 14, 13, 3, 32);
INSERT INTO `scorecard_extras_details` VALUES (54, 2, 3, 14, 16, 0, 33);
INSERT INTO `scorecard_extras_details` VALUES (54, 3, 1, 6, 1, 0, 8);
INSERT INTO `scorecard_extras_details` VALUES (55, 1, 2, 0, 1, 1, 4);
INSERT INTO `scorecard_extras_details` VALUES (55, 2, 1, 0, 0, 2, 3);
INSERT INTO `scorecard_extras_details` VALUES (56, 1, 1, 0, 4, 0, 5);
INSERT INTO `scorecard_extras_details` VALUES (56, 2, 4, 2, 4, 0, 10);
INSERT INTO `scorecard_extras_details` VALUES (56, 3, 0, 3, 1, 1, 5);
INSERT INTO `scorecard_extras_details` VALUES (56, 4, 0, 0, 2, 1, 3);
INSERT INTO `scorecard_extras_details` VALUES (57, 1, 0, 0, 0, 0, 13);
INSERT INTO `scorecard_extras_details` VALUES (57, 2, 0, 0, 0, 0, 20);
INSERT INTO `scorecard_extras_details` VALUES (58, 1, 0, 0, 0, 0, 28);
INSERT INTO `scorecard_extras_details` VALUES (58, 2, 0, 0, 0, 0, 11);
INSERT INTO `scorecard_extras_details` VALUES (59, 1, 5, 0, 2, 3, 10);
INSERT INTO `scorecard_extras_details` VALUES (59, 2, 5, 8, 1, 0, 14);
INSERT INTO `scorecard_extras_details` VALUES (60, 1, 0, 3, 6, 0, 9);
INSERT INTO `scorecard_extras_details` VALUES (60, 2, 4, 1, 4, 1, 10);
INSERT INTO `scorecard_extras_details` VALUES (61, 1, 6, 0, 1, 3, 10);
INSERT INTO `scorecard_extras_details` VALUES (62, 3, 1, 2, 0, 0, 3);
INSERT INTO `scorecard_extras_details` VALUES (62, 4, 0, 8, 4, 0, 12);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_fow_details`
-- 

CREATE TABLE `scorecard_fow_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `team_id` tinyint(4) NOT NULL default '0',
  `fow1` smallint(6) NOT NULL default '777',
  `fow2` smallint(6) NOT NULL default '777',
  `fow3` smallint(6) NOT NULL default '777',
  `fow4` smallint(6) NOT NULL default '777',
  `fow5` smallint(6) NOT NULL default '777',
  `fow6` smallint(6) NOT NULL default '777',
  `fow7` smallint(6) NOT NULL default '777',
  `fow8` smallint(6) NOT NULL default '777',
  `fow9` smallint(6) NOT NULL default '777',
  `fow10` smallint(6) NOT NULL default '777',
  KEY `fow_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `scorecard_fow_details`
-- 

INSERT INTO `scorecard_fow_details` VALUES (1, 1, 0, 28, 32, 32, 54, 58, 71, 71, 90, 91, 96);
INSERT INTO `scorecard_fow_details` VALUES (1, 2, 0, 24, 31, 73, 75, 78, 78, 81, 95, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (2, 1, 0, 13, 24, 75, 96, 104, 112, 185, 187, 193, 196);
INSERT INTO `scorecard_fow_details` VALUES (2, 2, 0, 2, 15, 15, 68, 69, 83, 85, 90, 104, 111);
INSERT INTO `scorecard_fow_details` VALUES (3, 1, 0, 3, 24, 31, 41, 50, 63, 64, 66, 72, 90);
INSERT INTO `scorecard_fow_details` VALUES (3, 2, 0, 15, 29, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (4, 1, 0, 49, 73, 132, 147, 150, 196, 214, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (4, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (7, 1, 0, 5, 13, 80, 133, 138, 140, 140, 144, 153, 165);
INSERT INTO `scorecard_fow_details` VALUES (7, 2, 0, 22, 29, 52, 53, 64, 69, 121, 156, 158, 158);
INSERT INTO `scorecard_fow_details` VALUES (7, 3, 0, 31, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (7, 4, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (7, 4, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (8, 1, 0, 0, 0, 0, 13, 15, 19, 33, 35, 35, 57);
INSERT INTO `scorecard_fow_details` VALUES (8, 2, 0, 21, 51, 63, 85, 114, 118, 119, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (8, 3, 0, 2, 8, 11, 29, 36, 46, 46, 69, 83, 84);
INSERT INTO `scorecard_fow_details` VALUES (8, 4, 0, 6, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (9, 1, 0, 6, 13, 20, 25, 28, 43, 50, 58, 66, 77);
INSERT INTO `scorecard_fow_details` VALUES (9, 2, 0, 64, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (10, 1, 0, 11, 12, 12, 22, 26, 33, 39, 46, 50, 52);
INSERT INTO `scorecard_fow_details` VALUES (10, 2, 0, 0, 1, 23, 37, 61, 80, 83, 88, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (10, 3, 0, 1, 6, 7, 7, 7, 13, 16, 29, 49, 61);
INSERT INTO `scorecard_fow_details` VALUES (10, 4, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (11, 1, 0, 25, 62, 92, 93, 207, 210, 227, 242, 245, 261);
INSERT INTO `scorecard_fow_details` VALUES (11, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (12, 1, 0, 1, 17, 47, 65, 68, 76, 92, 135, 151, 170);
INSERT INTO `scorecard_fow_details` VALUES (12, 2, 0, 0, 9, 10, 25, 38, 62, 76, 97, 133, 133);
INSERT INTO `scorecard_fow_details` VALUES (13, 1, 0, 65, 80, 116, 136, 136, 146, 162, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (13, 2, 0, 0, 14, 19, 36, 36, 38, 38, 41, 44, 777);
INSERT INTO `scorecard_fow_details` VALUES (13, 3, 0, 45, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (14, 1, 0, 4, 10, 45, 50, 75, 77, 86, 86, 88, 105);
INSERT INTO `scorecard_fow_details` VALUES (14, 2, 0, 52, 55, 65, 118, 132, 138, 144, 148, 150, 777);
INSERT INTO `scorecard_fow_details` VALUES (14, 3, 0, 7, 32, 34, 59, 60, 85, 101, 110, 163, 777);
INSERT INTO `scorecard_fow_details` VALUES (15, 1, 0, 15, 16, 22, 148, 253, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (15, 2, 0, 8, 10, 18, 95, 139, 142, 183, 191, 193, 193);
INSERT INTO `scorecard_fow_details` VALUES (16, 1, 0, 2, 48, 60, 90, 116, 116, 120, 163, 171, 173);
INSERT INTO `scorecard_fow_details` VALUES (16, 2, 0, 6, 28, 45, 46, 55, 57, 65, 65, 66, 70);
INSERT INTO `scorecard_fow_details` VALUES (30, 1, 0, 24, 30, 30, 30, 31, 31, 37, 37, 37, 47);
INSERT INTO `scorecard_fow_details` VALUES (31, 1, 0, 2, 20, 23, 60, 80, 148, 165, 173, 173, 174);
INSERT INTO `scorecard_fow_details` VALUES (30, 3, 0, 7, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (30, 2, 0, 12, 12, 22, 26, 27, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (29, 2, 0, 8, 8, 11, 17, 17, 17, 33, 37, 64, 87);
INSERT INTO `scorecard_fow_details` VALUES (29, 1, 0, 15, 28, 28, 208, 308, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (28, 2, 0, 7, 54, 78, 78, 104, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (28, 1, 0, 2, 2, 6, 13, 39, 70, 99, 139, 147, 154);
INSERT INTO `scorecard_fow_details` VALUES (26, 2, 0, 9, 13, 42, 56, 69, 71, 86, 111, 123, 126);
INSERT INTO `scorecard_fow_details` VALUES (26, 1, 0, 36, 52, 78, 78, 85, 96, 96, 164, 165, 184);
INSERT INTO `scorecard_fow_details` VALUES (25, 2, 0, 29, 43, 50, 70, 91, 127, 131, 137, 137, 777);
INSERT INTO `scorecard_fow_details` VALUES (25, 1, 0, 17, 37, 110, 144, 178, 183, 184, 189, 199, 220);
INSERT INTO `scorecard_fow_details` VALUES (24, 2, 0, 22, 38, 74, 128, 131, 137, 137, 200, 200, 200);
INSERT INTO `scorecard_fow_details` VALUES (24, 1, 0, 63, 97, 215, 218, 222, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (31, 2, 0, 24, 40, 60, 60, 89, 116, 129, 129, 152, 161);
INSERT INTO `scorecard_fow_details` VALUES (32, 1, 0, 13, 23, 31, 57, 79, 79, 82, 82, 94, 95);
INSERT INTO `scorecard_fow_details` VALUES (32, 2, 0, 2, 4, 30, 75, 75, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (33, 1, 0, 35, 39, 44, 51, 57, 70, 116, 141, 152, 777);
INSERT INTO `scorecard_fow_details` VALUES (33, 2, 0, 8, 15, 20, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (34, 1, 0, 0, 1, 9, 15, 17, 29, 41, 47, 68, 85);
INSERT INTO `scorecard_fow_details` VALUES (34, 2, 0, 3, 60, 75, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (34, 3, 0, 4, 6, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (35, 1, 0, 6, 8, 9, 15, 20, 21, 27, 64, 64, 95);
INSERT INTO `scorecard_fow_details` VALUES (35, 2, 0, 38, 38, 53, 82, 106, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (35, 3, 0, 6, 6, 10, 12, 13, 38, 68, 75, 80, 81);
INSERT INTO `scorecard_fow_details` VALUES (35, 4, 0, 5, 12, 33, 39, 57, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (36, 1, 0, 25, 34, 106, 132, 133, 167, 181, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (36, 2, 0, 19, 56, 104, 104, 120, 121, 137, 154, 160, 161);
INSERT INTO `scorecard_fow_details` VALUES (37, 1, 0, 4, 4, 4, 16, 32, 56, 66, 94, 101, 101);
INSERT INTO `scorecard_fow_details` VALUES (37, 2, 0, 11, 33, 39, 41, 42, 54, 82, 84, 97, 126);
INSERT INTO `scorecard_fow_details` VALUES (37, 3, 0, 1, 2, 3, 7, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (41, 1, 0, 26, 31, 48, 65, 66, 66, 96, 98, 101, 127);
INSERT INTO `scorecard_fow_details` VALUES (41, 2, 0, 17, 64, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (42, 1, 0, 14, 14, 23, 36, 63, 69, 172, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (42, 2, 0, 10, 12, 12, 59, 68, 118, 124, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (61, 2, 0, 11, 13, 45, 136, 183, 189, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (44, 1, 0, 11, 26, 88, 88, 147, 147, 195, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (44, 2, 0, 87, 101, 121, 196, 196, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (45, 1, 0, 0, 32, 35, 46, 53, 58, 65, 66, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (45, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (46, 1, 0, 31, 104, 156, 156, 156, 176, 199, 216, 240, 245);
INSERT INTO `scorecard_fow_details` VALUES (46, 2, 0, 3, 11, 56, 74, 90, 121, 137, 155, 157, 169);
INSERT INTO `scorecard_fow_details` VALUES (47, 1, 0, 4, 34, 57, 57, 90, 106, 114, 114, 123, 144);
INSERT INTO `scorecard_fow_details` VALUES (47, 2, 0, 18, 29, 58, 78, 92, 106, 107, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (62, 2, 0, 6, 8, 17, 30, 55, 58, 58, 62, 65, 69);
INSERT INTO `scorecard_fow_details` VALUES (62, 1, 0, 3, 42, 49, 60, 82, 90, 92, 104, 105, 107);
INSERT INTO `scorecard_fow_details` VALUES (49, 1, 0, 6, 15, 18, 36, 42, 43, 44, 46, 46, 54);
INSERT INTO `scorecard_fow_details` VALUES (49, 2, 0, 38, 60, 116, 173, 216, 230, 241, 260, 266, 297);
INSERT INTO `scorecard_fow_details` VALUES (49, 3, 0, 8, 777, 777, 777, 29, 33, 50, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (50, 1, 0, 11, 14, 15, 32, 61, 95, 152, 232, 232, 777);
INSERT INTO `scorecard_fow_details` VALUES (50, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (51, 1, 0, 17, 23, 23, 102, 102, 112, 138, 145, 156, 165);
INSERT INTO `scorecard_fow_details` VALUES (51, 2, 0, 0, 5, 28, 39, 42, 42, 65, 71, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (52, 1, 0, 13, 47, 64, 115, 115, 139, 146, 149, 154, 154);
INSERT INTO `scorecard_fow_details` VALUES (52, 2, 0, 17, 23, 29, 31, 49, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (53, 1, 0, 52, 80, 80, 87, 88, 96, 96, 98, 122, 130);
INSERT INTO `scorecard_fow_details` VALUES (53, 2, 0, 0, 0, 3, 3, 13, 13, 13, 38, 38, 43);
INSERT INTO `scorecard_fow_details` VALUES (54, 1, 0, 2, 15, 29, 29, 61, 148, 163, 163, 163, 169);
INSERT INTO `scorecard_fow_details` VALUES (54, 2, 0, 109, 118, 125, 144, 149, 168, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (54, 3, 0, 3, 18, 19, 19, 20, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (55, 1, 0, 6, 14, 33, 36, 38, 46, 57, 63, 64, 71);
INSERT INTO `scorecard_fow_details` VALUES (55, 2, 0, 26, 28, 30, 37, 42, 42, 60, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (56, 1, 0, 0, 1, 2, 21, 27, 32, 39, 43, 44, 45);
INSERT INTO `scorecard_fow_details` VALUES (56, 2, 0, 88, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (56, 3, 0, 15, 21, 45, 60, 73, 83, 136, 137, 137, 156);
INSERT INTO `scorecard_fow_details` VALUES (56, 4, 0, 19, 23, 34, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (57, 1, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (57, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (58, 1, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (58, 2, 0, 777, 777, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (59, 1, 0, 15, 84, 90, 92, 152, 153, 194, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (59, 2, 0, 78, 122, 777, 777, 777, 777, 777, 777, 777, 777);
INSERT INTO `scorecard_fow_details` VALUES (60, 1, 0, 4, 43, 50, 53, 53, 81, 89, 103, 130, 131);
INSERT INTO `scorecard_fow_details` VALUES (60, 2, 0, 16, 21, 21, 26, 31, 35, 65, 92, 128, 130);
INSERT INTO `scorecard_fow_details` VALUES (61, 1, 0, 75, 84, 85, 148, 176, 183, 194, 197, 197, 777);
INSERT INTO `scorecard_fow_details` VALUES (62, 3, 0, 5, 5, 7, 15, 60, 63, 69, 69, 74, 80);
INSERT INTO `scorecard_fow_details` VALUES (62, 4, 0, 47, 70, 79, 95, 777, 777, 777, 777, 777, 777);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_game_details`
-- 

CREATE TABLE `scorecard_game_details` (
  `game_id` int(11) NOT NULL auto_increment,
  `league_id` int(4) NOT NULL default '0',
  `conf_id` int(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `week` int(2) NOT NULL default '0',
  `awayteam` int(4) NOT NULL default '0',
  `hometeam` int(4) NOT NULL default '0',
  `umpires` int(4) NOT NULL default '0',
  `toss_won_id` tinyint(4) NOT NULL default '0',
  `result_won_id` tinyint(4) default NULL,
  `batting_first_id` tinyint(4) NOT NULL default '0',
  `batting_second_id` tinyint(4) NOT NULL default '0',
  `batting_third_id` tinyint(4) NOT NULL default '0',
  `batting_fourth_id` tinyint(4) NOT NULL default '0',
  `ground_id` tinyint(4) default NULL,
  `game_date` date NOT NULL default '0000-00-00',
  `game_date2` date NOT NULL default '0000-00-00',
  `result` varchar(128) NOT NULL default '',
  `tied` int(2) NOT NULL default '0',
  `mom` int(4) NOT NULL default '0',
  `umpire1` int(4) NOT NULL default '0',
  `umpire2` int(4) NOT NULL default '0',
  `maxovers` int(4) NOT NULL default '40',
  `forfeit` int(4) NOT NULL default '0',
  `cancelled` int(4) NOT NULL default '0',
  `cancelledplay` int(4) NOT NULL default '0',
  `isactive` tinyint(2) NOT NULL default '1',
  `report` varchar(128) NOT NULL default '',
  `points` varchar(128) NOT NULL default '',
  `type` varchar(24) NOT NULL default 'League',
  `inprogress` int(4) NOT NULL default '0',
  PRIMARY KEY  (`game_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- 
-- Dumping data for table `scorecard_game_details`
-- 

INSERT INTO `scorecard_game_details` VALUES (1, 1, 2, 8, 1, 10, 2, 0, 10, 2, 10, 2, 0, 0, 1, '2007-09-29', '0000-00-00', 'NDCC won by 2 wkts', 0, 15, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (2, 1, 2, 8, 2, 2, 14, 0, 2, 2, 2, 14, 0, 0, 6, '2007-10-06', '0000-00-00', 'NDCC won by 79 runs', 0, 28, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (3, 3, 1, 8, 1, 17, 1, 0, 1, 17, 1, 17, 0, 0, 1, '2007-11-13', '0000-00-00', 'Keira won by 8 wickets', 0, 0, 0, 0, 20, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (4, 1, 2, 8, 9, 2, 18, 0, 2, 0, 18, 2, 0, 0, 7, '2008-01-05', '0000-00-00', 'No result', 0, 0, 0, 0, 50, 0, 0, 1, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (9, 2, 2, 8, 5, 6, 2, 0, 2, 5, 2, 6, 0, 0, 1, '2007-11-17', '0000-00-00', 'H\\''Burgh won 1st Inn. by 9 wkts', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (8, 2, 2, 8, 4, 26, 2, 0, 26, 2, 26, 2, 26, 2, 1, '2007-10-27', '0000-00-00', 'NDCC won by 9 wkts', 0, 13, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (7, 2, 2, 8, 3, 2, 22, 0, 22, 22, 22, 2, 22, 0, 8, '2007-10-13', '0000-00-00', 'Wests won 1st Inn. by 7 runs', 0, 15, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (10, 2, 2, 8, 7, 10, 2, 0, 10, 2, 10, 2, 10, 2, 1, '2007-12-15', '0000-00-00', 'NDCC won by 10 wkts', 0, 15, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (11, 2, 2, 8, 10, 2, 14, 0, 14, 0, 14, 2, 0, 0, 6, '2008-01-12', '0000-00-00', 'No result', 0, 0, 0, 0, 90, 0, 0, 1, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (12, 2, 2, 8, 12, 30, 2, 0, 30, 2, 2, 30, 0, 0, 1, '2008-01-26', '0000-00-00', 'NDCC won 1st Inn. by 38 runs', 0, 15, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (13, 2, 2, 8, 13, 18, 2, 0, 18, 2, 2, 18, 18, 0, 1, '2008-02-16', '0000-00-00', 'NDCC won 1st Inn. by 129 runs', 0, 132, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (14, 2, 2, 8, 14, 2, 34, 0, 2, 34, 2, 34, 2, 0, 11, '2008-02-23', '0000-00-00', 'Uni won 1st Inn. by 45 runs', 0, 6, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (15, 2, 2, 8, 15, 30, 2, 0, 30, 2, 2, 30, 0, 0, 7, '2008-03-08', '0000-00-00', 'NDCC won 1st Inn by 89 runs', 0, 28, 0, 0, 90, 0, 0, 0, 0, '', '', 'Semi Final', 0);
INSERT INTO `scorecard_game_details` VALUES (16, 2, 2, 8, 16, 34, 2, 0, 2, 2, 2, 34, 0, 0, 7, '2008-03-15', '0000-00-00', 'NDCC won 1st Inn. by 103 runs', 0, 15, 0, 0, 90, 0, 0, 0, 0, '', '', 'Final', 0);
INSERT INTO `scorecard_game_details` VALUES (27, 2, 1, 8, 4, 1, 25, 0, 0, NULL, 0, 0, 0, 0, NULL, '2007-10-27', '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (26, 2, 1, 8, 3, 21, 1, 0, 1, 1, 1, 21, 0, 0, 1, '2007-10-13', '0000-00-00', 'NDCC won 1st Inn. by 58 runs', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (25, 1, 1, 8, 2, 13, 1, 0, 13, 13, 13, 1, 0, 0, 1, '2007-10-06', '0000-00-00', 'W\\''Gong won by 34 runs (revised)', 0, 0, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (24, 1, 1, 8, 1, 1, 9, 0, 9, 1, 1, 9, 0, 0, 4, '2007-09-29', '0000-00-00', 'NDCC won by 62 runs', 0, 0, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (28, 5, 1, 8, 1, 37, 1, 0, 37, 37, 1, 37, 0, 0, 1, '2007-10-28', '0000-00-00', 'Shoalhaven won by 5 wkts', 0, 0, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (29, 2, 1, 8, 5, 1, 5, 0, 5, 5, 5, 1, 0, 0, 3, '2007-11-17', '0000-00-00', 'H\\''burgh won 1st Inn. by 225 runs', 0, 0, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (30, 2, 1, 8, 7, 38, 1, 0, 38, 38, 1, 38, 1, 0, 1, '2007-12-08', '0000-00-00', 'Dapto won 1st Inn. by 5 wkts', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (31, 2, 1, 8, 8, 1, 9, 0, 9, 1, 1, 9, 0, 0, 4, '2007-12-15', '0000-00-00', 'NDCC won 1st Inn. by 13 runs', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (32, 3, 1, 8, 2, 1, 42, 0, 42, 1, 42, 1, 0, 0, 15, '2007-12-19', '0000-00-00', 'NDCC won by 5 wkts', 0, 0, 0, 0, 20, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (33, 1, 1, 8, 9, 17, 1, 0, 1, 0, 17, 1, 0, 0, 1, '2008-01-05', '0000-00-00', 'Match Abandoned', 0, 0, 0, 0, 50, 0, 0, 1, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (34, 2, 1, 8, 10, 13, 1, 0, 13, 13, 1, 13, 1, 0, 1, '2008-01-12', '0000-00-00', 'W\\''Gong won 1st Inn. by 7 wkts', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (35, 2, 1, 8, 12, 1, 29, 0, 1, 29, 1, 29, 1, 29, 10, '2008-01-26', '0000-00-00', 'Balg won outright by 5 wkts', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (36, 2, 1, 8, 13, 1, 17, 0, 1, 1, 1, 17, 0, 0, 7, '2008-02-16', '0000-00-00', 'NDCC won 1st Inn. by 20 runs', 0, 0, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (37, 2, 1, 8, 14, 33, 1, 0, 33, 33, 1, 33, 1, 0, 1, '2008-02-23', '0000-00-00', 'Uni won 1st Inn. by 25 runs', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (38, 1, 1, 9, 1, 5, 1, 0, 0, NULL, 0, 0, 0, 0, NULL, '2008-10-04', '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (39, 1, 2, 9, 1, 2, 6, 0, 0, NULL, 0, 0, 0, 0, NULL, '2008-10-04', '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (40, 1, 3, 9, 1, 7, 3, 0, 0, NULL, 0, 0, 0, 0, NULL, '2008-10-04', '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (41, 4, 5, 9, 1, 1, 43, 0, 43, 1, 43, 1, 0, 0, 18, '2008-09-20', '0000-00-00', 'NDCC won by 8 wkts', 0, 3, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (42, 1, 4, 9, 1, 4, 20, 0, 4, 20, 20, 4, 0, 0, 17, '2008-10-11', '0000-00-00', 'Keira won by 1 run (revised)', 0, 304, 0, 0, 45, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (44, 1, 3, 8, 1, 11, 3, 0, 11, 11, 3, 11, 0, 0, 19, '2007-09-29', '0000-00-00', 'Port Kembla won by 5 wkts', 0, 79, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (45, 1, 3, 8, 2, 3, 15, 0, 3, 3, 15, 3, 0, 0, 16, '2007-10-06', '0000-00-00', 'NDCC won by 10 wkts', 0, 298, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (46, 2, 3, 8, 3, 23, 3, 0, 3, 23, 23, 3, 0, 0, 19, '2007-10-13', '2007-10-20', 'Wests won by 76 runs', 0, 81, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (47, 2, 3, 8, 5, 3, 7, 0, 7, 3, 7, 3, 0, 0, 3, '2007-11-03', '2007-11-10', 'NDCC won by 3 wkts', 0, 81, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (62, 2, 2, 9, 2, 18, 2, 0, 18, 2, 18, 2, 18, 2, 1, '2008-10-11', '2008-10-18', 'NDCC won outright by 6 wkts', 0, 15, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (49, 2, 3, 8, 8, 3, 11, 0, 3, 11, 3, 11, 3, 0, 5, '2007-12-15', '2007-12-22', 'Port won 1st Inn. by 243 runs', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (50, 1, 6, 9, 1, 48, 45, 0, 45, 48, 48, 45, 0, 0, 19, '2008-10-11', '0000-00-00', 'Dapto Blue won by 69 runs', 0, 307, 0, 0, 45, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (51, 1, 3, 8, 9, 19, 3, 0, 3, 0, 19, 3, 0, 0, 1, '2008-01-05', '0000-00-00', 'Match Drawn', 0, 16, 0, 0, 50, 0, 0, 1, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (52, 2, 3, 8, 10, 15, 3, 0, 3, 0, 15, 3, 0, 0, 1, '2008-01-12', '2008-01-19', 'Match Drawn', 0, 104, 0, 0, 90, 0, 0, 1, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (53, 1, 3, 8, 11, 3, 27, 0, 27, 3, 3, 27, 0, 0, 6, '2008-01-20', '0000-00-00', 'NDCC won by 87 runs', 0, 16, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (54, 2, 3, 8, 12, 3, 31, 0, 3, 31, 3, 31, 3, 0, 16, '2008-01-26', '2008-02-02', 'Balg won 1st Inn. by 4 wkts', 0, 103, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (55, 2, 3, 8, 13, 3, 19, 0, 3, 19, 3, 19, 0, 0, 17, '2008-02-09', '2008-02-16', 'Keira won by 3 wkts', 0, 81, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (56, 2, 3, 8, 14, 35, 3, 0, 35, 35, 3, 35, 3, 35, 1, '2008-02-23', '2008-03-01', 'Uni won outright by 7 wkts', 0, 104, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (57, 1, 1, 1, 15, 29, 1, 0, 0, 1, 1, 29, 0, 0, 6, '2001-02-11', '0000-00-00', 'NDCC won by 34 runs', 0, 427, 0, 0, 50, 0, 0, 0, 0, '', '', 'Final', 0);
INSERT INTO `scorecard_game_details` VALUES (58, 2, 1, 1, 15, 29, 1, 0, 0, 1, 29, 1, 0, 0, 6, '2001-03-31', '2001-04-01', 'NDCC won by 5 wkts', 0, 427, 0, 0, 90, 0, 0, 0, 0, '', '', 'Final', 0);
INSERT INTO `scorecard_game_details` VALUES (59, 2, 3, 9, 2, 3, 19, 0, 19, 19, 3, 19, 0, 0, 16, '2008-10-11', '2008-10-18', 'Keira won on 1st innings', 0, 0, 0, 0, 90, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (60, 1, 4, 9, 2, 4, 12, 0, 12, 12, 12, 4, 0, 0, 5, '2008-10-18', '0000-00-00', 'Port Kembla won by 1 run', 0, 298, 0, 0, 50, 0, 0, 0, 0, '', '', 'League', 0);
INSERT INTO `scorecard_game_details` VALUES (61, 2, 1, 9, 2, 1, 17, 0, 1, 17, 1, 17, 0, 0, 7, '2008-10-11', '2008-10-18', 'Keira won on 1st Innings', 0, 155, 0, 0, 74, 0, 0, 0, 0, '', '', 'League', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `scorecard_total_details`
-- 

CREATE TABLE `scorecard_total_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `wickets` tinyint(4) NOT NULL default '0',
  `total` smallint(6) NOT NULL default '0',
  `overs` float NOT NULL default '0',
  KEY `total_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `scorecard_total_details`
-- 

INSERT INTO `scorecard_total_details` VALUES (1, 1, 10, 10, 96, 26);
INSERT INTO `scorecard_total_details` VALUES (1, 2, 2, 8, 97, 25.1);
INSERT INTO `scorecard_total_details` VALUES (2, 1, 2, 10, 190, 49);
INSERT INTO `scorecard_total_details` VALUES (2, 2, 14, 10, 111, 30);
INSERT INTO `scorecard_total_details` VALUES (3, 1, 1, 10, 90, 18.1);
INSERT INTO `scorecard_total_details` VALUES (3, 2, 17, 2, 91, 11.2);
INSERT INTO `scorecard_total_details` VALUES (4, 1, 18, 7, 218, 50);
INSERT INTO `scorecard_total_details` VALUES (4, 2, 2, 0, 5, 1.1);
INSERT INTO `scorecard_total_details` VALUES (7, 1, 22, 10, 165, 63.2);
INSERT INTO `scorecard_total_details` VALUES (7, 2, 2, 10, 158, 61.1);
INSERT INTO `scorecard_total_details` VALUES (7, 3, 2, 1, 70, 20);
INSERT INTO `scorecard_total_details` VALUES (7, 4, 2, 0, 0, 0);
INSERT INTO `scorecard_total_details` VALUES (7, 4, 2, 0, 0, 0);
INSERT INTO `scorecard_total_details` VALUES (8, 1, 26, 10, 57, 19.2);
INSERT INTO `scorecard_total_details` VALUES (8, 2, 2, 8, 129, 30);
INSERT INTO `scorecard_total_details` VALUES (8, 3, 2, 10, 84, 40.4);
INSERT INTO `scorecard_total_details` VALUES (8, 4, 2, 1, 14, 7.1);
INSERT INTO `scorecard_total_details` VALUES (9, 1, 2, 10, 77, 46.2);
INSERT INTO `scorecard_total_details` VALUES (9, 2, 6, 1, 87, 20);
INSERT INTO `scorecard_total_details` VALUES (10, 1, 10, 10, 52, 26.3);
INSERT INTO `scorecard_total_details` VALUES (10, 2, 2, 8, 88, 42);
INSERT INTO `scorecard_total_details` VALUES (10, 3, 2, 10, 61, 44.1);
INSERT INTO `scorecard_total_details` VALUES (10, 4, 2, 0, 28, 6);
INSERT INTO `scorecard_total_details` VALUES (11, 1, 14, 10, 261, 81.5);
INSERT INTO `scorecard_total_details` VALUES (11, 2, 2, 0, 12, 5);
INSERT INTO `scorecard_total_details` VALUES (12, 1, 2, 10, 171, 78.5);
INSERT INTO `scorecard_total_details` VALUES (12, 2, 30, 10, 133, 64);
INSERT INTO `scorecard_total_details` VALUES (13, 1, 2, 7, 174, 50);
INSERT INTO `scorecard_total_details` VALUES (13, 2, 18, 9, 45, 22);
INSERT INTO `scorecard_total_details` VALUES (13, 3, 18, 1, 51, 19);
INSERT INTO `scorecard_total_details` VALUES (14, 1, 2, 10, 105, 50.2);
INSERT INTO `scorecard_total_details` VALUES (14, 2, 34, 9, 150, 70);
INSERT INTO `scorecard_total_details` VALUES (14, 3, 34, 9, 164, 50);
INSERT INTO `scorecard_total_details` VALUES (15, 1, 2, 5, 282, 93);
INSERT INTO `scorecard_total_details` VALUES (15, 2, 30, 10, 193, 74);
INSERT INTO `scorecard_total_details` VALUES (16, 1, 2, 10, 173, 78.1);
INSERT INTO `scorecard_total_details` VALUES (16, 2, 34, 10, 70, 45.4);
INSERT INTO `scorecard_total_details` VALUES (30, 1, 1, 10, 47, 25.2);
INSERT INTO `scorecard_total_details` VALUES (31, 1, 1, 10, 174, 77.3);
INSERT INTO `scorecard_total_details` VALUES (30, 3, 1, 1, 12, 9);
INSERT INTO `scorecard_total_details` VALUES (30, 2, 38, 5, 49, 18.3);
INSERT INTO `scorecard_total_details` VALUES (29, 2, 1, 10, 87, 31.3);
INSERT INTO `scorecard_total_details` VALUES (29, 1, 5, 5, 308, 50);
INSERT INTO `scorecard_total_details` VALUES (28, 2, 37, 5, 156, 43.4);
INSERT INTO `scorecard_total_details` VALUES (28, 1, 1, 10, 154, 46.4);
INSERT INTO `scorecard_total_details` VALUES (26, 2, 21, 10, 126, 78);
INSERT INTO `scorecard_total_details` VALUES (26, 1, 1, 10, 184, 87.5);
INSERT INTO `scorecard_total_details` VALUES (25, 2, 1, 9, 143, 37);
INSERT INTO `scorecard_total_details` VALUES (25, 1, 13, 10, 220, 49.1);
INSERT INTO `scorecard_total_details` VALUES (24, 2, 9, 10, 201, 48.2);
INSERT INTO `scorecard_total_details` VALUES (24, 1, 1, 5, 263, 50);
INSERT INTO `scorecard_total_details` VALUES (31, 2, 9, 10, 161, 72.1);
INSERT INTO `scorecard_total_details` VALUES (32, 1, 42, 10, 95, 20);
INSERT INTO `scorecard_total_details` VALUES (32, 2, 1, 5, 96, 18.3);
INSERT INTO `scorecard_total_details` VALUES (33, 1, 17, 9, 159, 50);
INSERT INTO `scorecard_total_details` VALUES (33, 2, 1, 3, 23, 11.4);
INSERT INTO `scorecard_total_details` VALUES (34, 1, 1, 10, 85, 43.4);
INSERT INTO `scorecard_total_details` VALUES (34, 2, 13, 3, 90, 33.4);
INSERT INTO `scorecard_total_details` VALUES (34, 3, 1, 2, 6, 6.2);
INSERT INTO `scorecard_total_details` VALUES (35, 1, 1, 10, 95, 61);
INSERT INTO `scorecard_total_details` VALUES (35, 2, 29, 5, 106, 25);
INSERT INTO `scorecard_total_details` VALUES (35, 3, 1, 10, 81, 57.4);
INSERT INTO `scorecard_total_details` VALUES (35, 4, 29, 5, 72, 20.1);
INSERT INTO `scorecard_total_details` VALUES (36, 1, 1, 7, 181, 50);
INSERT INTO `scorecard_total_details` VALUES (36, 2, 17, 10, 161, 46.1);
INSERT INTO `scorecard_total_details` VALUES (37, 1, 1, 10, 101, 75.3);
INSERT INTO `scorecard_total_details` VALUES (37, 2, 33, 10, 126, 50);
INSERT INTO `scorecard_total_details` VALUES (37, 3, 1, 4, 18, 16);
INSERT INTO `scorecard_total_details` VALUES (41, 1, 43, 10, 127, 34);
INSERT INTO `scorecard_total_details` VALUES (41, 2, 1, 2, 130, 30);
INSERT INTO `scorecard_total_details` VALUES (42, 1, 20, 7, 179, 45);
INSERT INTO `scorecard_total_details` VALUES (42, 2, 4, 7, 145, 37);
INSERT INTO `scorecard_total_details` VALUES (61, 2, 17, 6, 198, 70.1);
INSERT INTO `scorecard_total_details` VALUES (44, 1, 3, 7, 204, 50);
INSERT INTO `scorecard_total_details` VALUES (44, 2, 11, 5, 209, 45.1);
INSERT INTO `scorecard_total_details` VALUES (45, 1, 15, 8, 66, 33.4);
INSERT INTO `scorecard_total_details` VALUES (45, 2, 3, 0, 69, 10);
INSERT INTO `scorecard_total_details` VALUES (46, 1, 23, 10, 245, 85.1);
INSERT INTO `scorecard_total_details` VALUES (46, 2, 3, 10, 169, 68);
INSERT INTO `scorecard_total_details` VALUES (47, 1, 7, 10, 144, 42.3);
INSERT INTO `scorecard_total_details` VALUES (47, 2, 3, 7, 146, 41.2);
INSERT INTO `scorecard_total_details` VALUES (62, 2, 2, 10, 69, 35.5);
INSERT INTO `scorecard_total_details` VALUES (62, 1, 18, 10, 107, 51.1);
INSERT INTO `scorecard_total_details` VALUES (49, 1, 3, 10, 54, 32.1);
INSERT INTO `scorecard_total_details` VALUES (49, 2, 11, 10, 297, 84.2);
INSERT INTO `scorecard_total_details` VALUES (49, 3, 3, 7, 54, 55);
INSERT INTO `scorecard_total_details` VALUES (50, 1, 48, 9, 302, 45);
INSERT INTO `scorecard_total_details` VALUES (50, 2, 45, 7, 233, 45);
INSERT INTO `scorecard_total_details` VALUES (51, 1, 19, 10, 165, 45.1);
INSERT INTO `scorecard_total_details` VALUES (51, 2, 3, 8, 73, 24);
INSERT INTO `scorecard_total_details` VALUES (52, 1, 15, 10, 154, 52.1);
INSERT INTO `scorecard_total_details` VALUES (52, 2, 3, 5, 68, 27);
INSERT INTO `scorecard_total_details` VALUES (53, 1, 3, 10, 130, 48.2);
INSERT INTO `scorecard_total_details` VALUES (53, 2, 27, 10, 43, 22.5);
INSERT INTO `scorecard_total_details` VALUES (54, 1, 3, 10, 169, 63.2);
INSERT INTO `scorecard_total_details` VALUES (54, 2, 31, 6, 232, 50);
INSERT INTO `scorecard_total_details` VALUES (54, 3, 3, 5, 63, 28);
INSERT INTO `scorecard_total_details` VALUES (55, 1, 3, 10, 71, 39.3);
INSERT INTO `scorecard_total_details` VALUES (55, 2, 19, 7, 75, 36);
INSERT INTO `scorecard_total_details` VALUES (56, 1, 3, 10, 45, 36.5);
INSERT INTO `scorecard_total_details` VALUES (56, 2, 35, 1, 132, 22);
INSERT INTO `scorecard_total_details` VALUES (56, 3, 3, 10, 156, 71.3);
INSERT INTO `scorecard_total_details` VALUES (56, 4, 35, 3, 74, 23.5);
INSERT INTO `scorecard_total_details` VALUES (57, 1, 1, 6, 225, 50);
INSERT INTO `scorecard_total_details` VALUES (57, 2, 29, 10, 191, 49.1);
INSERT INTO `scorecard_total_details` VALUES (58, 1, 29, 9, 227, 105);
INSERT INTO `scorecard_total_details` VALUES (58, 2, 1, 5, 230, 76);
INSERT INTO `scorecard_total_details` VALUES (59, 1, 3, 7, 221, 70);
INSERT INTO `scorecard_total_details` VALUES (59, 2, 19, 2, 222, 59);
INSERT INTO `scorecard_total_details` VALUES (60, 1, 12, 10, 131, 44.2);
INSERT INTO `scorecard_total_details` VALUES (60, 2, 4, 10, 130, 43.1);
INSERT INTO `scorecard_total_details` VALUES (61, 1, 1, 9, 197, 72);
INSERT INTO `scorecard_total_details` VALUES (62, 3, 18, 10, 80, 35.1);
INSERT INTO `scorecard_total_details` VALUES (62, 4, 2, 4, 121, 20);

-- --------------------------------------------------------

-- 
-- Table structure for table `seasons`
-- 

CREATE TABLE `seasons` (
  `SeasonID` int(8) NOT NULL auto_increment,
  `SeasonName` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`SeasonID`),
  KEY `SeasonID` (`SeasonID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- 
-- Dumping data for table `seasons`
-- 

INSERT INTO `seasons` VALUES (1, '2000/01');
INSERT INTO `seasons` VALUES (2, '2001/02');
INSERT INTO `seasons` VALUES (3, '2002/03');
INSERT INTO `seasons` VALUES (4, '2003/04');
INSERT INTO `seasons` VALUES (5, '2004/05');
INSERT INTO `seasons` VALUES (6, '2005/06');
INSERT INTO `seasons` VALUES (7, '2006/07');
INSERT INTO `seasons` VALUES (8, '2007/08');
INSERT INTO `seasons` VALUES (9, '2008/09');
INSERT INTO `seasons` VALUES (10, '1999/00');
INSERT INTO `seasons` VALUES (11, '1998/99');
INSERT INTO `seasons` VALUES (12, '1997/98');
INSERT INTO `seasons` VALUES (13, '1996/97');
INSERT INTO `seasons` VALUES (14, '1995/96');
INSERT INTO `seasons` VALUES (15, '1994/95');
INSERT INTO `seasons` VALUES (16, '1993/94');
INSERT INTO `seasons` VALUES (17, '1992/93');
INSERT INTO `seasons` VALUES (18, '1991/92');
INSERT INTO `seasons` VALUES (19, '1990/91');
INSERT INTO `seasons` VALUES (20, '1989/90');
INSERT INTO `seasons` VALUES (21, '1988/89');
INSERT INTO `seasons` VALUES (22, '1987/88');
INSERT INTO `seasons` VALUES (23, '1986/87');
INSERT INTO `seasons` VALUES (24, '1985/86');
INSERT INTO `seasons` VALUES (25, '1984/85');
INSERT INTO `seasons` VALUES (26, '1983/84');
INSERT INTO `seasons` VALUES (27, '1982/83');
INSERT INTO `seasons` VALUES (28, '1981/82');
INSERT INTO `seasons` VALUES (29, '1980/81');
INSERT INTO `seasons` VALUES (30, '1977/78');
INSERT INTO `seasons` VALUES (31, '1976/77');
INSERT INTO `seasons` VALUES (32, '1975/76');
INSERT INTO `seasons` VALUES (33, '1967/68');
INSERT INTO `seasons` VALUES (34, '1959/60');
INSERT INTO `seasons` VALUES (35, '1956/57');
INSERT INTO `seasons` VALUES (36, '1953/54');
INSERT INTO `seasons` VALUES (37, '1947/48');
INSERT INTO `seasons` VALUES (38, '1941/42');
INSERT INTO `seasons` VALUES (39, '1938/39');
INSERT INTO `seasons` VALUES (40, '1935/36');
INSERT INTO `seasons` VALUES (41, '1934/35');

-- --------------------------------------------------------

-- 
-- Table structure for table `sponsors`
-- 

CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `url` varchar(128) NOT NULL default '',
  `article` longtext NOT NULL,
  `picture` varchar(255) NOT NULL default '',
  `promised` float NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `sponsors`
-- 

INSERT INTO `sponsors` VALUES (1, 'Ryan\\''s Hotel Thirroul', 'http://www.ryanshotel.com.au/', 'Ryan\\''s Hotel offers Bar, TAB, Dining, and Entertainment. Choose from two restaurants, cocktails bar with various large screen Televisions.\nRyan\\''s offer a courtesy Bus service and the best Beer in the North.\n<br><br>Phillips St (cnr George St) Thirroul 2515\n<br>(02) 4267 1086', 'Ryans.png', 5);
INSERT INTO `sponsors` VALUES (2, '#10 Teamwear', 'http://www.number10.com.au', 'Proud Suppliers and Sponsors of Butcher Cricket. Number 10 - Sporting Teamwear, Cricket Uniforms, Polo Shirts.\n<br><br>Ph:+61 2 4226 1863 <br>Fx:+61 2 4226 6822 <br>sales@number10.com.au\n<br>Unit 1 15 Ralph Black Drive North Wollongong, NSW, 2500 Australia', 'Number10_dektopA.jpg', 4);
INSERT INTO `sponsors` VALUES (3, 'Martin Morris & Jones', 'http://www.mmj.com.au/', 'Your Local Real Estate Agent Experienced, Creative, Innovative & Successful.', 'MMJ.png', 3);
INSERT INTO `sponsors` VALUES (4, 'Edgewood Estate', 'http://www.villagebuilding.com.au/sales/edgewood.html', 'Edgewood Estate is a quality residential estate in the sought-after northern Wollongong suburb of Woonona. The Estate has won several awards including the UDIA NSW Environment award in 2004.\n<br><br>Illawarra Regional Office\n4 <br>Corkwood Circuit Woonona, NSW, 2517\n<br>Ph 02 4285 3122 <br>Fx 02 4283 5299', 'edgewood.png', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `teams`
-- 

CREATE TABLE `teams` (
  `TeamID` int(8) NOT NULL auto_increment,
  `ClubID` int(4) NOT NULL default '0',
  `LeagueID` int(2) NOT NULL default '0',
  `TeamName` varchar(64) NOT NULL default '',
  `TeamAbbrev` varchar(16) NOT NULL default '',
  `TeamURL` varchar(128) NOT NULL default '',
  `TeamColour` varchar(16) NOT NULL default '',
  `picture` varchar(64) NOT NULL default '',
  `TeamActive` int(1) NOT NULL default '0',
  `TeamDesc` longtext NOT NULL,
  `TeamGroup` int(4) NOT NULL default '0',
  PRIMARY KEY  (`TeamID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

-- 
-- Dumping data for table `teams`
-- 

INSERT INTO `teams` VALUES (1, 1, 1, 'NDCC 1st Grade', 'NDCC 1s', 'http://www.butchercricket.com', '117CBD', '270642264_dV2JJ-M.jpg', 1, '', 0);
INSERT INTO `teams` VALUES (2, 1, 2, 'NDCC 2nd Grade', 'NDCC 2s', 'http://www.butchercricket.com', '117CBD', '24259_image_photo.jpg', 1, '', 0);
INSERT INTO `teams` VALUES (3, 1, 3, 'NDCC 3rd Grade', 'NDCC 3s', 'http://www.butchercricket.com', '117CBD', '', 1, '', 0);
INSERT INTO `teams` VALUES (4, 1, 4, 'NDCC 4th Grade', 'NDCC 4s', 'http://www.butchercricket.com', '117CBD', 'CS14.jpg', 1, '<br>', 0);
INSERT INTO `teams` VALUES (5, 2, 1, 'Helensburgh 1st Grade', 'Hburg 1s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (6, 2, 2, 'Helensburgh 2nd Grade', 'Hburg 2s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (7, 2, 3, 'Helensburgh 3rd Grade', 'Hburg 3s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (8, 2, 4, 'Helensburgh 4th Grade', 'Hburg 4s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (9, 3, 1, 'Port Kembla 1st Grade', 'Port 1s', 'http://www.portkemblacricket.org/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (10, 3, 2, 'Port Kembla 2nd Grade', 'Port 2s', 'http://www.portkemblacricket.org/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (11, 3, 3, 'Port Kembla 3rd Grade', 'Port 3s', 'http://www.portkemblacricket.org/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (12, 3, 4, 'Port Kembla 4th Grade', 'Port 4s', 'http://www.portkemblacricket.org/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (13, 4, 1, 'Wollongong 1st Grade', 'WGong 1s', 'http://wdcc.8m.com/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (14, 4, 2, 'Wollongong 2nd Grade', 'WGong 2s', 'http://wdcc.8m.com/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (15, 4, 3, 'Wollongong 3rd Grade', 'WGong 3s', 'http://wdcc.8m.com/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (16, 4, 4, 'Wollongong 4th Grade', 'WGong 4s', 'http://wdcc.8m.com/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (17, 5, 1, 'Keira 1st Grade', 'Keira 1s', 'http://www.keiralions.com.au/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (18, 5, 2, 'Keira 2nd Grade', 'Keira 2s', 'http://www.keiralions.com.au/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (19, 5, 3, 'Keira 3rd Grade', 'Keira 3s', 'http://www.keiralions.com.au/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (20, 5, 4, 'Keira 4th Grade', 'Keira 4s', 'http://www.keiralions.com.au/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (21, 6, 1, 'Wests 1st Grade', 'Wests 1s', 'http://www.sportslive.com.au/wests/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (22, 6, 2, 'Wests 2nd Grade', 'Wests 2s', 'http://www.sportslive.com.au/wests/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (23, 6, 3, 'Wests 3rd Grade', 'Wests 3s', 'http://www.sportslive.com.au/wests/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (24, 6, 4, 'Wests 4th Grade', 'Wests 4s', 'http://www.sportslive.com.au/wests/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (25, 7, 1, 'Corrimal 1st Grade', 'Corr 1s', 'http://www.cricketnsw.com.au/ica/hgchome.cl?PT=ch&C=COR', 'FF2A31', '', 1, '', 0);
INSERT INTO `teams` VALUES (26, 7, 2, 'Corrimal 2nd Grade', 'Corr 2s', 'http://www.cricketnsw.com.au/ica/hgchome.cl?PT=ch&C=COR', 'FF2A31', '', 1, '', 0);
INSERT INTO `teams` VALUES (27, 7, 3, 'Corrimal 3rd Grade', 'Corr 3s', 'http://www.cricketnsw.com.au/ica/hgchome.cl?PT=ch&C=COR', 'FF2A31', '', 1, '', 0);
INSERT INTO `teams` VALUES (28, 7, 4, 'Corrimal 4th Grade', 'Corr 4s', 'http://www.cricketnsw.com.au/ica/hgchome.cl?PT=ch&C=COR', 'FF2A31', '', 1, '', 0);
INSERT INTO `teams` VALUES (29, 8, 1, 'Balgownie 1st Grade', 'Balg 1s', 'http://www.balgowniecricket.com.au', '000000', '', 1, '', 0);
INSERT INTO `teams` VALUES (30, 8, 2, 'Balgownie 2nd Grade', 'Balg 2s', 'http://www.balgowniecricket.com.au', '000000', '', 1, '', 0);
INSERT INTO `teams` VALUES (31, 8, 3, 'Balgownie 3rd Grade', 'Balg 3s', 'http://www.balgowniecricket.com.au', '000000', '', 1, '', 0);
INSERT INTO `teams` VALUES (32, 8, 4, 'Balgownie 4th Grade', 'Balg 4s', 'http://www.balgowniecricket.com.au', '000000', '', 1, '', 0);
INSERT INTO `teams` VALUES (33, 9, 1, 'University 1st Grade', 'Uni 1s', '', '015496', '', 1, '', 0);
INSERT INTO `teams` VALUES (34, 9, 2, 'University 2nd Grade', 'Uni 2s', '', '015496', '', 1, '', 0);
INSERT INTO `teams` VALUES (35, 9, 3, 'University 3rd Grade', 'Uni 3s', '', '015496', '', 1, '', 0);
INSERT INTO `teams` VALUES (36, 9, 4, 'University 4th Grade', 'Uni 4s', '', '015496', '', 1, '', 0);
INSERT INTO `teams` VALUES (37, 10, 1, 'Shoalhaven Ex-Servicemans 1st Grade', 'Shavn 1s', 'http://www.shoalhavenexservicemenscricketclub.com.au/', 'DF9917', '', 1, '', 0);
INSERT INTO `teams` VALUES (38, 11, 1, 'Dapto 1st Grade', 'Dapto 1s', 'http://www.daptocricketclub.org.au', 'F8C303', '', 1, '', 0);
INSERT INTO `teams` VALUES (39, 11, 2, 'Dapto 2nd Grade', 'Dapto 2s', 'http://www.daptocricketclub.org.au', 'F8C303', '', 1, '', 0);
INSERT INTO `teams` VALUES (40, 11, 3, 'Dapto 3rd Grade', 'Dapto 3s', 'http://www.daptocricketclub.org.au', 'F8C303', '', 1, '', 0);
INSERT INTO `teams` VALUES (41, 11, 4, 'Dapto 4th Grade', 'Dapto 4s', 'http://www.daptocricketclub.org.au', 'F8C303', '', 1, '', 0);
INSERT INTO `teams` VALUES (42, 12, 1, 'Oak Flats 1st Grade', 'Oak Fl 1s', 'http://www.oakflatscricket.com', 'C3EDFB', '', 1, '<br>', 0);
INSERT INTO `teams` VALUES (43, 13, 1, 'Gerringong 1st Grade', 'GGong 1s', '', '', '', 0, '', 0);
INSERT INTO `teams` VALUES (45, 1, 6, 'NDCC 5th Grade', 'NDCC 5s', 'http://www.butchercricket.com', '117CBD', '', 1, '', 0);
INSERT INTO `teams` VALUES (46, 1, 7, 'NDCC Under 21', 'NDCC U21s', 'http://www.butchercricket.com', '117CBD', '', 1, '', 0);
INSERT INTO `teams` VALUES (47, 5, 6, 'Keira 5th Grade', 'Keira 5s', 'http://www.keiralions.com.au/', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (48, 11, 6, 'Dapto Blue', 'Dap Blue', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (49, 11, 6, 'Dapto Gold', 'Dap Gold', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (50, 9, 6, 'University Red', 'Uni Red', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (51, 9, 6, 'University Blue', 'Uni Blue', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (52, 6, 6, 'Wests 5th Grade', 'Wests 5s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (53, 8, 6, 'Balgownie 5th Grade', 'Balg 5s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (54, 7, 6, 'Corrimal 5th Grade', 'Corr 5s', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (55, 11, 6, 'Dapto White', 'Dap White', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (56, 9, 6, 'University White', 'Uni White', '', '', '', 1, '', 0);
INSERT INTO `teams` VALUES (57, 15, 0, 'Kiama 1st Grade', 'Kiama 1s', 'http://kiama.nsw.cricket.com.au/', '000000', '', 0, '', 0);
INSERT INTO `teams` VALUES (58, 16, 0, 'Lake Illawarra 1st Grade', 'Lake Ill. 1s', '', '', '', 0, '', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_batting_details`
-- 

CREATE TABLE `temp_scorecard_batting_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `batting_position` tinyint(4) NOT NULL default '0',
  `how_out` tinyint(4) default NULL,
  `runs` int(4) NOT NULL default '0',
  `assist` int(11) default NULL,
  `bowler` int(11) default NULL,
  `balls` tinyint(4) NOT NULL default '0',
  `fours` tinyint(4) NOT NULL default '0',
  `sixes` tinyint(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `notout` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `opponent` int(4) NOT NULL default '0',
  KEY `batting_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `temp_scorecard_batting_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_bowling_details`
-- 

CREATE TABLE `temp_scorecard_bowling_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `bowling_position` tinyint(4) NOT NULL default '0',
  `overs` float NOT NULL default '0',
  `maidens` tinyint(4) NOT NULL default '0',
  `runs` tinyint(4) NOT NULL default '0',
  `wickets` tinyint(4) NOT NULL default '0',
  `noballs` tinyint(4) NOT NULL default '0',
  `wides` tinyint(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `opponent` int(4) NOT NULL default '0',
  KEY `bowling_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `temp_scorecard_bowling_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_extras_details`
-- 

CREATE TABLE `temp_scorecard_extras_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `legbyes` tinyint(4) default NULL,
  `byes` tinyint(4) default NULL,
  `wides` tinyint(4) default NULL,
  `noballs` tinyint(4) default NULL,
  `total` tinyint(4) default NULL,
  KEY `extras_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `temp_scorecard_extras_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_fow_details`
-- 

CREATE TABLE `temp_scorecard_fow_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `team_id` tinyint(4) NOT NULL default '0',
  `fow1` smallint(6) NOT NULL default '777',
  `fow2` smallint(6) NOT NULL default '777',
  `fow3` smallint(6) NOT NULL default '777',
  `fow4` smallint(6) NOT NULL default '777',
  `fow5` smallint(6) NOT NULL default '777',
  `fow6` smallint(6) NOT NULL default '777',
  `fow7` smallint(6) NOT NULL default '777',
  `fow8` smallint(6) NOT NULL default '777',
  `fow9` smallint(6) NOT NULL default '777',
  `fow10` smallint(6) NOT NULL default '777',
  KEY `fow_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `temp_scorecard_fow_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_game_details`
-- 

CREATE TABLE `temp_scorecard_game_details` (
  `game_id` int(11) NOT NULL auto_increment,
  `league_id` int(4) NOT NULL default '0',
  `season` int(4) NOT NULL default '0',
  `week` int(2) NOT NULL default '0',
  `awayteam` int(4) NOT NULL default '0',
  `hometeam` int(4) NOT NULL default '0',
  `umpires` int(4) NOT NULL default '0',
  `toss_won_id` tinyint(4) NOT NULL default '0',
  `result_won_id` tinyint(4) default NULL,
  `batting_first_id` tinyint(4) NOT NULL default '0',
  `batting_second_id` tinyint(4) NOT NULL default '0',
  `ground_id` tinyint(4) default NULL,
  `game_date` date NOT NULL default '0000-00-00',
  `result` varchar(128) NOT NULL default '',
  `tied` int(2) NOT NULL default '0',
  `mom` int(4) NOT NULL default '0',
  `umpire1` int(4) NOT NULL default '0',
  `umpire2` int(4) NOT NULL default '0',
  `maxovers` int(4) NOT NULL default '40',
  `forfeit` int(4) NOT NULL default '0',
  `cancelled` int(4) NOT NULL default '0',
  `cancelledplay` int(4) NOT NULL default '0',
  `isactive` tinyint(2) NOT NULL default '1',
  `report` varchar(128) NOT NULL default '',
  `points` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `temp_scorecard_game_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `temp_scorecard_total_details`
-- 

CREATE TABLE `temp_scorecard_total_details` (
  `game_id` int(11) NOT NULL default '0',
  `innings_id` tinyint(4) NOT NULL default '0',
  `team` int(4) NOT NULL default '0',
  `wickets` tinyint(4) NOT NULL default '0',
  `total` smallint(6) NOT NULL default '0',
  `overs` float NOT NULL default '0',
  KEY `total_details_index` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `temp_scorecard_total_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tmpDebutGames`
-- 

CREATE TABLE `tmpDebutGames` (
  `player_id` int(11) default NULL,
  `game_id` int(11) default NULL,
  `game_date` datetime default NULL,
  `league_id` int(11) default NULL,
  `leagueabbrev` varchar(20) default NULL,
  `conf_id` int(11) default NULL,
  `confabbrev` varchar(20) default NULL,
  `hometeam` varchar(20) default NULL,
  `awayteam` varchar(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `tmpDebutGames`
-- 

INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2Day', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2D', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2D', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');
INSERT INTO `tmpDebutGames` VALUES (28, 7, '2007-10-13 00:00:00', 2, '2D', 2, '2nd Grade', 'Wests 2s', 'NDCC 2s');

-- --------------------------------------------------------

-- 
-- Table structure for table `tmpLastGames`
-- 

CREATE TABLE `tmpLastGames` (
  `player_id` int(11) default NULL,
  `game_id` int(11) default NULL,
  `game_date` datetime default NULL,
  `league_id` int(11) default NULL,
  `leagueabbrev` varchar(20) default NULL,
  `conf_id` int(11) default NULL,
  `confabbrev` varchar(20) default NULL,
  `hometeam` varchar(20) default NULL,
  `awayteam` varchar(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `tmpLastGames`
-- 

INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2Day', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2D', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2D', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');
INSERT INTO `tmpLastGames` VALUES (28, 16, '2008-03-15 00:00:00', 2, '2D', 2, '2nd Grade', 'NDCC 2s', 'Uni 2s');

-- --------------------------------------------------------

-- 
-- Table structure for table `webref_rss_details`
-- 

CREATE TABLE `webref_rss_details` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `description` mediumtext NOT NULL,
  `link` text,
  `language` text,
  `image_title` text,
  `image_url` text,
  `image_link` text,
  `image_width` text,
  `image_height` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `webref_rss_details`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `webref_rss_items`
-- 

CREATE TABLE `webref_rss_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `description` mediumtext NOT NULL,
  `link` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `webref_rss_items`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `year`
-- 

CREATE TABLE `year` (
  `yearid` int(4) NOT NULL default '0',
  `title` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`yearid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `year`
-- 

INSERT INTO `year` VALUES (2000, '2000');
INSERT INTO `year` VALUES (2001, '2001');
INSERT INTO `year` VALUES (2002, '2002');
INSERT INTO `year` VALUES (2003, '2003');
INSERT INTO `year` VALUES (2004, '2004');
INSERT INTO `year` VALUES (2005, '2005');
INSERT INTO `year` VALUES (2006, '2006');
INSERT INTO `year` VALUES (2007, '2007');
INSERT INTO `year` VALUES (2008, '2008');
