/*
Navicat MySQL Data Transfer

Source Server         :  腾讯云
Source Server Version : 50524
Source Host           : 10.66.111.93:3306
Source Database       : maoyan_in

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-12-06 14:12:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for weixin_ad
-- ----------------------------
DROP TABLE IF EXISTS `weixin_ad`;
CREATE TABLE `weixin_ad` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `extimg` varchar(255) NOT NULL,
  `extval` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_ad
-- ----------------------------
INSERT INTO `weixin_ad` VALUES ('1', '1', 'image', '家电促销', '', '1410/09/543627d7aaea6.jpg', '', '', '', '1389110400', '1444233600', '0', '0', '255', '1');
INSERT INTO `weixin_ad` VALUES ('2', '1', 'image', '奶粉促销', '', '1410/09/543627c09c598.jpg', '', '', '', '1389110400', '1421856000', '0', '0', '255', '1');
INSERT INTO `weixin_ad` VALUES ('3', '1', 'image', '母婴促销', '', '1410/09/54362801ea427.jpg', '', '', '', '1412784000', '1446998400', '0', '0', '255', '1');

-- ----------------------------
-- Table structure for weixin_adboard
-- ----------------------------
DROP TABLE IF EXISTS `weixin_adboard`;
CREATE TABLE `weixin_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_adboard
-- ----------------------------
INSERT INTO `weixin_adboard` VALUES ('1', '首页焦点图', 'indexfocus', '730', '395', '小图调用扩展图', '1');

-- ----------------------------
-- Table structure for weixin_address
-- ----------------------------
DROP TABLE IF EXISTS `weixin_address`;
CREATE TABLE `weixin_address` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `contacts` varchar(100) DEFAULT '联系人',
  `Province` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `postcode` varchar(30) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `isno` varchar(10) DEFAULT '0' COMMENT '0:否 1:是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_address
-- ----------------------------
INSERT INTO `weixin_address` VALUES ('22', '四川省猫眼科技有限公司', '四川省', '成都市', '郫县', '红光镇银润南一路66号A区', '610000', '18030525005', '028-61646123', '四川省猫眼科技有限公司', '1', '1', '0');

-- ----------------------------
-- Table structure for weixin_admin
-- ----------------------------
DROP TABLE IF EXISTS `weixin_admin`;
CREATE TABLE `weixin_admin` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_time` int(10) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_admin
-- ----------------------------
INSERT INTO `weixin_admin` VALUES ('2', 'admin', '0476caa6a184010828d61178958b642d', '1', '182.138.246.219', '1417838295', 'admin@maoyanjing.com', '1');

-- ----------------------------
-- Table structure for weixin_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `weixin_admin_auth`;
CREATE TABLE `weixin_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_admin_auth
-- ----------------------------
INSERT INTO `weixin_admin_auth` VALUES ('1', '1');
INSERT INTO `weixin_admin_auth` VALUES ('1', '2');
INSERT INTO `weixin_admin_auth` VALUES ('1', '3');
INSERT INTO `weixin_admin_auth` VALUES ('1', '4');
INSERT INTO `weixin_admin_auth` VALUES ('1', '6');
INSERT INTO `weixin_admin_auth` VALUES ('1', '7');
INSERT INTO `weixin_admin_auth` VALUES ('1', '8');
INSERT INTO `weixin_admin_auth` VALUES ('1', '9');
INSERT INTO `weixin_admin_auth` VALUES ('1', '10');
INSERT INTO `weixin_admin_auth` VALUES ('1', '11');
INSERT INTO `weixin_admin_auth` VALUES ('1', '12');
INSERT INTO `weixin_admin_auth` VALUES ('1', '13');
INSERT INTO `weixin_admin_auth` VALUES ('1', '14');
INSERT INTO `weixin_admin_auth` VALUES ('1', '15');
INSERT INTO `weixin_admin_auth` VALUES ('1', '16');
INSERT INTO `weixin_admin_auth` VALUES ('1', '17');
INSERT INTO `weixin_admin_auth` VALUES ('1', '18');
INSERT INTO `weixin_admin_auth` VALUES ('1', '19');
INSERT INTO `weixin_admin_auth` VALUES ('1', '20');
INSERT INTO `weixin_admin_auth` VALUES ('1', '21');
INSERT INTO `weixin_admin_auth` VALUES ('1', '22');
INSERT INTO `weixin_admin_auth` VALUES ('1', '23');
INSERT INTO `weixin_admin_auth` VALUES ('1', '24');
INSERT INTO `weixin_admin_auth` VALUES ('1', '25');
INSERT INTO `weixin_admin_auth` VALUES ('1', '26');
INSERT INTO `weixin_admin_auth` VALUES ('1', '27');
INSERT INTO `weixin_admin_auth` VALUES ('1', '28');
INSERT INTO `weixin_admin_auth` VALUES ('1', '29');
INSERT INTO `weixin_admin_auth` VALUES ('1', '31');
INSERT INTO `weixin_admin_auth` VALUES ('1', '32');
INSERT INTO `weixin_admin_auth` VALUES ('1', '33');
INSERT INTO `weixin_admin_auth` VALUES ('1', '34');
INSERT INTO `weixin_admin_auth` VALUES ('1', '36');
INSERT INTO `weixin_admin_auth` VALUES ('1', '37');
INSERT INTO `weixin_admin_auth` VALUES ('1', '38');
INSERT INTO `weixin_admin_auth` VALUES ('1', '50');
INSERT INTO `weixin_admin_auth` VALUES ('1', '51');
INSERT INTO `weixin_admin_auth` VALUES ('1', '52');
INSERT INTO `weixin_admin_auth` VALUES ('1', '54');
INSERT INTO `weixin_admin_auth` VALUES ('1', '56');
INSERT INTO `weixin_admin_auth` VALUES ('1', '57');
INSERT INTO `weixin_admin_auth` VALUES ('1', '58');
INSERT INTO `weixin_admin_auth` VALUES ('1', '59');
INSERT INTO `weixin_admin_auth` VALUES ('1', '60');
INSERT INTO `weixin_admin_auth` VALUES ('1', '61');
INSERT INTO `weixin_admin_auth` VALUES ('1', '62');
INSERT INTO `weixin_admin_auth` VALUES ('1', '63');
INSERT INTO `weixin_admin_auth` VALUES ('1', '64');
INSERT INTO `weixin_admin_auth` VALUES ('1', '65');
INSERT INTO `weixin_admin_auth` VALUES ('1', '66');
INSERT INTO `weixin_admin_auth` VALUES ('1', '70');
INSERT INTO `weixin_admin_auth` VALUES ('1', '117');
INSERT INTO `weixin_admin_auth` VALUES ('1', '118');
INSERT INTO `weixin_admin_auth` VALUES ('1', '119');
INSERT INTO `weixin_admin_auth` VALUES ('1', '148');
INSERT INTO `weixin_admin_auth` VALUES ('1', '149');
INSERT INTO `weixin_admin_auth` VALUES ('1', '150');
INSERT INTO `weixin_admin_auth` VALUES ('1', '151');
INSERT INTO `weixin_admin_auth` VALUES ('1', '152');
INSERT INTO `weixin_admin_auth` VALUES ('1', '153');
INSERT INTO `weixin_admin_auth` VALUES ('1', '154');
INSERT INTO `weixin_admin_auth` VALUES ('1', '155');
INSERT INTO `weixin_admin_auth` VALUES ('1', '156');
INSERT INTO `weixin_admin_auth` VALUES ('1', '157');
INSERT INTO `weixin_admin_auth` VALUES ('1', '158');
INSERT INTO `weixin_admin_auth` VALUES ('1', '159');
INSERT INTO `weixin_admin_auth` VALUES ('1', '160');
INSERT INTO `weixin_admin_auth` VALUES ('1', '161');
INSERT INTO `weixin_admin_auth` VALUES ('1', '162');
INSERT INTO `weixin_admin_auth` VALUES ('1', '164');
INSERT INTO `weixin_admin_auth` VALUES ('1', '172');
INSERT INTO `weixin_admin_auth` VALUES ('1', '173');
INSERT INTO `weixin_admin_auth` VALUES ('1', '174');
INSERT INTO `weixin_admin_auth` VALUES ('1', '175');
INSERT INTO `weixin_admin_auth` VALUES ('1', '176');
INSERT INTO `weixin_admin_auth` VALUES ('1', '177');
INSERT INTO `weixin_admin_auth` VALUES ('1', '178');
INSERT INTO `weixin_admin_auth` VALUES ('1', '179');
INSERT INTO `weixin_admin_auth` VALUES ('1', '180');
INSERT INTO `weixin_admin_auth` VALUES ('1', '181');
INSERT INTO `weixin_admin_auth` VALUES ('1', '182');
INSERT INTO `weixin_admin_auth` VALUES ('1', '184');
INSERT INTO `weixin_admin_auth` VALUES ('1', '185');
INSERT INTO `weixin_admin_auth` VALUES ('1', '186');
INSERT INTO `weixin_admin_auth` VALUES ('1', '187');
INSERT INTO `weixin_admin_auth` VALUES ('1', '190');
INSERT INTO `weixin_admin_auth` VALUES ('1', '192');
INSERT INTO `weixin_admin_auth` VALUES ('1', '195');
INSERT INTO `weixin_admin_auth` VALUES ('1', '199');
INSERT INTO `weixin_admin_auth` VALUES ('1', '200');
INSERT INTO `weixin_admin_auth` VALUES ('1', '201');
INSERT INTO `weixin_admin_auth` VALUES ('1', '202');
INSERT INTO `weixin_admin_auth` VALUES ('1', '203');
INSERT INTO `weixin_admin_auth` VALUES ('1', '210');
INSERT INTO `weixin_admin_auth` VALUES ('1', '212');
INSERT INTO `weixin_admin_auth` VALUES ('1', '213');
INSERT INTO `weixin_admin_auth` VALUES ('1', '214');
INSERT INTO `weixin_admin_auth` VALUES ('1', '215');
INSERT INTO `weixin_admin_auth` VALUES ('1', '216');
INSERT INTO `weixin_admin_auth` VALUES ('1', '232');
INSERT INTO `weixin_admin_auth` VALUES ('1', '233');
INSERT INTO `weixin_admin_auth` VALUES ('1', '234');
INSERT INTO `weixin_admin_auth` VALUES ('1', '235');
INSERT INTO `weixin_admin_auth` VALUES ('1', '236');
INSERT INTO `weixin_admin_auth` VALUES ('1', '237');
INSERT INTO `weixin_admin_auth` VALUES ('1', '238');
INSERT INTO `weixin_admin_auth` VALUES ('1', '240');
INSERT INTO `weixin_admin_auth` VALUES ('1', '242');
INSERT INTO `weixin_admin_auth` VALUES ('1', '244');
INSERT INTO `weixin_admin_auth` VALUES ('1', '245');
INSERT INTO `weixin_admin_auth` VALUES ('1', '246');
INSERT INTO `weixin_admin_auth` VALUES ('1', '247');
INSERT INTO `weixin_admin_auth` VALUES ('1', '248');
INSERT INTO `weixin_admin_auth` VALUES ('1', '249');
INSERT INTO `weixin_admin_auth` VALUES ('1', '250');
INSERT INTO `weixin_admin_auth` VALUES ('1', '252');
INSERT INTO `weixin_admin_auth` VALUES ('1', '253');
INSERT INTO `weixin_admin_auth` VALUES ('1', '254');
INSERT INTO `weixin_admin_auth` VALUES ('1', '255');
INSERT INTO `weixin_admin_auth` VALUES ('1', '256');
INSERT INTO `weixin_admin_auth` VALUES ('1', '257');
INSERT INTO `weixin_admin_auth` VALUES ('1', '258');
INSERT INTO `weixin_admin_auth` VALUES ('1', '259');
INSERT INTO `weixin_admin_auth` VALUES ('1', '260');
INSERT INTO `weixin_admin_auth` VALUES ('1', '261');
INSERT INTO `weixin_admin_auth` VALUES ('1', '262');
INSERT INTO `weixin_admin_auth` VALUES ('1', '263');
INSERT INTO `weixin_admin_auth` VALUES ('1', '264');
INSERT INTO `weixin_admin_auth` VALUES ('1', '265');
INSERT INTO `weixin_admin_auth` VALUES ('1', '267');
INSERT INTO `weixin_admin_auth` VALUES ('1', '268');
INSERT INTO `weixin_admin_auth` VALUES ('1', '269');
INSERT INTO `weixin_admin_auth` VALUES ('1', '270');
INSERT INTO `weixin_admin_auth` VALUES ('1', '271');
INSERT INTO `weixin_admin_auth` VALUES ('1', '272');
INSERT INTO `weixin_admin_auth` VALUES ('1', '273');
INSERT INTO `weixin_admin_auth` VALUES ('1', '274');
INSERT INTO `weixin_admin_auth` VALUES ('1', '275');
INSERT INTO `weixin_admin_auth` VALUES ('1', '276');
INSERT INTO `weixin_admin_auth` VALUES ('1', '277');
INSERT INTO `weixin_admin_auth` VALUES ('1', '278');
INSERT INTO `weixin_admin_auth` VALUES ('1', '279');
INSERT INTO `weixin_admin_auth` VALUES ('1', '280');
INSERT INTO `weixin_admin_auth` VALUES ('1', '281');
INSERT INTO `weixin_admin_auth` VALUES ('1', '282');
INSERT INTO `weixin_admin_auth` VALUES ('1', '283');
INSERT INTO `weixin_admin_auth` VALUES ('1', '284');
INSERT INTO `weixin_admin_auth` VALUES ('1', '285');
INSERT INTO `weixin_admin_auth` VALUES ('1', '286');
INSERT INTO `weixin_admin_auth` VALUES ('1', '291');
INSERT INTO `weixin_admin_auth` VALUES ('1', '292');
INSERT INTO `weixin_admin_auth` VALUES ('1', '293');
INSERT INTO `weixin_admin_auth` VALUES ('1', '294');
INSERT INTO `weixin_admin_auth` VALUES ('1', '295');
INSERT INTO `weixin_admin_auth` VALUES ('1', '296');
INSERT INTO `weixin_admin_auth` VALUES ('1', '297');
INSERT INTO `weixin_admin_auth` VALUES ('1', '298');
INSERT INTO `weixin_admin_auth` VALUES ('1', '299');
INSERT INTO `weixin_admin_auth` VALUES ('1', '300');
INSERT INTO `weixin_admin_auth` VALUES ('1', '301');
INSERT INTO `weixin_admin_auth` VALUES ('1', '302');
INSERT INTO `weixin_admin_auth` VALUES ('1', '303');
INSERT INTO `weixin_admin_auth` VALUES ('1', '304');
INSERT INTO `weixin_admin_auth` VALUES ('1', '305');
INSERT INTO `weixin_admin_auth` VALUES ('1', '306');
INSERT INTO `weixin_admin_auth` VALUES ('1', '307');
INSERT INTO `weixin_admin_auth` VALUES ('1', '308');
INSERT INTO `weixin_admin_auth` VALUES ('1', '309');
INSERT INTO `weixin_admin_auth` VALUES ('1', '310');
INSERT INTO `weixin_admin_auth` VALUES ('1', '311');
INSERT INTO `weixin_admin_auth` VALUES ('1', '312');
INSERT INTO `weixin_admin_auth` VALUES ('1', '313');
INSERT INTO `weixin_admin_auth` VALUES ('1', '314');
INSERT INTO `weixin_admin_auth` VALUES ('1', '315');
INSERT INTO `weixin_admin_auth` VALUES ('1', '316');
INSERT INTO `weixin_admin_auth` VALUES ('1', '318');
INSERT INTO `weixin_admin_auth` VALUES ('1', '319');
INSERT INTO `weixin_admin_auth` VALUES ('1', '320');
INSERT INTO `weixin_admin_auth` VALUES ('1', '321');
INSERT INTO `weixin_admin_auth` VALUES ('1', '322');
INSERT INTO `weixin_admin_auth` VALUES ('1', '323');
INSERT INTO `weixin_admin_auth` VALUES ('1', '324');
INSERT INTO `weixin_admin_auth` VALUES ('1', '325');
INSERT INTO `weixin_admin_auth` VALUES ('1', '326');
INSERT INTO `weixin_admin_auth` VALUES ('1', '327');

-- ----------------------------
-- Table structure for weixin_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `weixin_admin_role`;
CREATE TABLE `weixin_admin_role` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_admin_role
-- ----------------------------
INSERT INTO `weixin_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '1');

-- ----------------------------
-- Table structure for weixin_album
-- ----------------------------
DROP TABLE IF EXISTS `weixin_album`;
CREATE TABLE `weixin_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cover_cache` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `likes` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `is_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_album
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_album_cate
-- ----------------------------
DROP TABLE IF EXISTS `weixin_album_cate`;
CREATE TABLE `weixin_album_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `albums` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_album_cate
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_album_comment
-- ----------------------------
DROP TABLE IF EXISTS `weixin_album_comment`;
CREATE TABLE `weixin_album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_album_comment
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_album_follow
-- ----------------------------
DROP TABLE IF EXISTS `weixin_album_follow`;
CREATE TABLE `weixin_album_follow` (
  `uid` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_album_follow
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_album_item
-- ----------------------------
DROP TABLE IF EXISTS `weixin_album_item`;
CREATE TABLE `weixin_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_album_item
-- ----------------------------
INSERT INTO `weixin_album_item` VALUES ('0', '146', '海飞丝 去屑洗发露 200ml 水润滋养型 ', '1412679566');
INSERT INTO `weixin_album_item` VALUES ('0', '147', '海飞丝 去屑洗发露 200ml 怡神冰凉型 ', '1412679711');
INSERT INTO `weixin_album_item` VALUES ('0', '148', '海飞丝去屑洗发露海洋活力型（200ml  瓶装）', '1412679794');
INSERT INTO `weixin_album_item` VALUES ('0', '149', '海飞丝去屑洗发露海洋活力型(瓶装 400ml)', '1412680816');
INSERT INTO `weixin_album_item` VALUES ('0', '145', '海飞丝 去屑洗发露 200ml 丝质柔滑型 ', '1412679420');
INSERT INTO `weixin_album_item` VALUES ('0', '142', '多芬 深度损伤理护 洗发乳 200ml ', '1412666224');
INSERT INTO `weixin_album_item` VALUES ('0', '143', '多芬 日常损伤理护 洗发乳 200ml ', '1412677584');
INSERT INTO `weixin_album_item` VALUES ('0', '144', '多芬滋养水润洗发乳400ml（瓶装）', '1412677690');
INSERT INTO `weixin_album_item` VALUES ('0', '150', '海飞丝去屑洗发露丝质柔滑型(瓶装 400ml)', '1412680865');
INSERT INTO `weixin_album_item` VALUES ('0', '151', '海飞丝去屑洗发露水润滋养型(瓶装 400ml)', '1412680915');
INSERT INTO `weixin_album_item` VALUES ('0', '152', '海飞丝 去屑洗发露 400ml 护根防掉发型 ', '1412681100');
INSERT INTO `weixin_album_item` VALUES ('0', '153', '清扬男士洗发露多效水润养护型400ml', '1412681596');
INSERT INTO `weixin_album_item` VALUES ('0', '155', '清扬多效水润养护型洗发露400ml（瓶装）', '1412681699');
INSERT INTO `weixin_album_item` VALUES ('0', '163', '飘柔 家庭绿茶 长效清爽洗发露 去油型 200ml ', '1412732910');
INSERT INTO `weixin_album_item` VALUES ('0', '162', '飘柔 家庭茶树 长效柔顺洗发露 去屑型 200ml ', '1412732800');
INSERT INTO `weixin_album_item` VALUES ('0', '160', '飘柔 三合一护理洗发露 400ml ', '1412731758');
INSERT INTO `weixin_album_item` VALUES ('0', '161', '飘柔滋润去屑洗发露(瓶装 400ml)', '1412731822');
INSERT INTO `weixin_album_item` VALUES ('0', '164', '飘柔家庭护理芦荟长效止痒滋润洗发露（200ml  瓶装）', '1412732972');
INSERT INTO `weixin_album_item` VALUES ('0', '165', '飘柔家庭兰花长效洁顺洗发露水润型（200ml  瓶装）', '1412733015');
INSERT INTO `weixin_album_item` VALUES ('0', '166', '飘柔 家庭兰花 长效清爽洗发露 去屑型 200ml ', '1412733142');
INSERT INTO `weixin_album_item` VALUES ('0', '167', '飘柔 家庭杏仁 长效柔顺洗发露 滋养型 200ml ', '1412733241');
INSERT INTO `weixin_album_item` VALUES ('0', '188', '青蛙王子 儿童水晶牙膏带牙刷  苹果味  50g ', '1412747173');
INSERT INTO `weixin_album_item` VALUES ('0', '189', '青蛙王子 儿童水晶牙膏带牙刷   草莓味  50g ', '1412747227');
INSERT INTO `weixin_album_item` VALUES ('0', '170', '六神 艾叶健肤沐浴露 滋润型 450ml ', '1412734237');
INSERT INTO `weixin_album_item` VALUES ('0', '171', '六神清凉爽肤沐浴露（瓶装 450ml）', '1412734298');
INSERT INTO `weixin_album_item` VALUES ('0', '172', '六神冰凉超爽沐浴露（瓶装450ml）', '1412734376');
INSERT INTO `weixin_album_item` VALUES ('0', '173', '舒肤佳纯白清香型沐浴露（瓶装400ml）', '1412735770');
INSERT INTO `weixin_album_item` VALUES ('0', '174', 'Safeguard 舒肤佳 沐浴露 400ml 柠檬清新 ', '1412735975');
INSERT INTO `weixin_album_item` VALUES ('0', '175', 'VS 沙宣 水润去屑洗发露 200ml ', '1412736543');
INSERT INTO `weixin_album_item` VALUES ('0', '177', '海飞丝去屑护发素丝滑柔顺型（瓶装200ml）', '1412736854');
INSERT INTO `weixin_album_item` VALUES ('0', '178', '海飞丝 去屑护发素 200ml 清润平衡型 ', '1412736912');
INSERT INTO `weixin_album_item` VALUES ('0', '180', '潘婷 乳液修护 润发精华素 200ml美特好 ', '1412737203');
INSERT INTO `weixin_album_item` VALUES ('0', '181', '潘婷丝质顺滑润发精华素（200ml  瓶装）', '1412737257');
INSERT INTO `weixin_album_item` VALUES ('0', '182', 'LUX 力士 靓肤沐浴乳 400ml 白皙焕采 ', '1412737454');
INSERT INTO `weixin_album_item` VALUES ('0', '184', 'LUX 力士 爽肤沐浴乳闪亮冰爽 400ml ', '1412738103');
INSERT INTO `weixin_album_item` VALUES ('0', '185', 'LUX/力士娇肤沐浴乳恒久嫩肤400ml', '1412738458');
INSERT INTO `weixin_album_item` VALUES ('0', '187', 'LUX/力士精油香氛沐浴乳幽莲魅肤400ml ', '1412738612');
INSERT INTO `weixin_album_item` VALUES ('0', '191', '高露洁超强牙膏(支装140g)赠360°备长碳深洁牙膏40g超值', '1412747790');
INSERT INTO `weixin_album_item` VALUES ('0', '192', '云南白药 金口健牙膏 105g 激爽薄荷 ', '1412747877');
INSERT INTO `weixin_album_item` VALUES ('0', '193', 'Colgate 高露洁 防蛀美白牙膏 90g ', '1412747943');
INSERT INTO `weixin_album_item` VALUES ('0', '194', '黑人 DARLIE 黑人 超白青柠薄荷牙膏 90g', '1412748001');
INSERT INTO `weixin_album_item` VALUES ('0', '195', '佳洁士 草本水晶啫喱牙膏 90g 清爽薄荷 ', '1412748064');
INSERT INTO `weixin_album_item` VALUES ('0', '196', 'Safeguard 舒肤佳 香皂 115g 柠檬清新型 ', '1412748714');
INSERT INTO `weixin_album_item` VALUES ('0', '197', '舒肤佳纯白清香型香皂（115g 单块）', '1412748754');
INSERT INTO `weixin_album_item` VALUES ('0', '198', '舒肤佳芦荟呵护型香皂（115g 单块）', '1412748962');
INSERT INTO `weixin_album_item` VALUES ('0', '199', 'Johnson’s Baby强生婴儿清凉香皂125G', '1412749001');
INSERT INTO `weixin_album_item` VALUES ('0', '200', 'LUX/力士 幽莲魅肤 魅肤香皂115g/美特好 ', '1412749057');
INSERT INTO `weixin_album_item` VALUES ('0', '201', 'LUX/力士 滋养柔肤 娇肤香皂115g/块/美特好 ', '1412749091');
INSERT INTO `weixin_album_item` VALUES ('0', '202', '奇强 内衣除菌皂100G', '1412749163');
INSERT INTO `weixin_album_item` VALUES ('0', '203', '汰渍 三重功效洗衣皂 柠檬清新 238g ', '1412749508');
INSERT INTO `weixin_album_item` VALUES ('0', '204', 'OMO 奥妙 99超效无磷洗衣皂 206g ', '1412749734');
INSERT INTO `weixin_album_item` VALUES ('0', '205', '原野物语 蛋之果饼干 200g/袋 ', '1412753842');
INSERT INTO `weixin_album_item` VALUES ('0', '209', 'Hemali 河马莉 蛋酥 布丁 130g 台湾地区 ', '1412754500');
INSERT INTO `weixin_album_item` VALUES ('0', '208', 'Hemali 河马莉 蛋酥 特浓牛奶 130g 台湾地区 ', '1412754411');
INSERT INTO `weixin_album_item` VALUES ('0', '210', 'Hemali 河马莉 蛋酥 综合水果 130g 台湾地区 ', '1412754557');
INSERT INTO `weixin_album_item` VALUES ('0', '211', 'DANISA皇冠曲奇原味 90g（印尼进口 盒）', '1412754719');
INSERT INTO `weixin_album_item` VALUES ('0', '212', 'Danisa皇冠 曲奇 200g 印尼进口 罐装 ', '1412754849');
INSERT INTO `weixin_album_item` VALUES ('0', '213', '3点1刻 经典原味奶茶（袋泡茶）120g 台湾地区进口 ', '1412755986');
INSERT INTO `weixin_album_item` VALUES ('0', '215', '3点1刻 经典炭烧奶茶（袋泡茶） 120g 台湾地区进口 ', '1412756225');
INSERT INTO `weixin_album_item` VALUES ('0', '216', '3点1刻 经典港式奶茶（袋泡茶） 120g 台湾地区进口 ', '1412756311');
INSERT INTO `weixin_album_item` VALUES ('0', '219', 'CLEAR清扬男士去屑洗发露活炭净爽型175ml', '1412822560');
INSERT INTO `weixin_album_item` VALUES ('0', '218', ' 清扬女士去屑洗发露多效水润养护型', '1412822259');
INSERT INTO `weixin_album_item` VALUES ('0', '221', '清扬男士洗发露多效水润养护型175ml', '1412822912');
INSERT INTO `weixin_album_item` VALUES ('0', '222', '力士灵动丰盈洗发乳400ml', '1412823563');
INSERT INTO `weixin_album_item` VALUES ('0', '223', '力士水润丝滑洗发乳清爽去屑型400ml', '1412824129');
INSERT INTO `weixin_album_item` VALUES ('0', '224', '雕牌透明皂202g阳光清柠', '1412824546');
INSERT INTO `weixin_album_item` VALUES ('0', '225', '六神清凉爽肤沐浴露（瓶装 450ml）芦荟', '1412825426');
INSERT INTO `weixin_album_item` VALUES ('0', '226', '六神清香爽肤沐浴露(450ml)', '1412825655');
INSERT INTO `weixin_album_item` VALUES ('0', '228', 'Love Of Office Lady小资女之恋草莓巧克力杏仁卷心酥(代可可脂)80g(台湾进口)', '1412840950');

-- ----------------------------
-- Table structure for weixin_article
-- ----------------------------
DROP TABLE IF EXISTS `weixin_article`;
CREATE TABLE `weixin_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `colors` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序值',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_article
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `weixin_article_cate`;
CREATE TABLE `weixin_article_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_article_cate
-- ----------------------------
INSERT INTO `weixin_article_cate` VALUES ('1', '1', '网站信息', '', '', '0', '0', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('2', '1', '关于我们', '', '', '1', '1|', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('3', '1', '联系我们', '', '', '1', '1|', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('4', '1', '加入我们', '', '', '1', '1|', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('6', '1', '积分规则', '', '', '5', '5|', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('7', '1', '兑换说明', '', '', '5', '5|', '255', '1', '', '', '');
INSERT INTO `weixin_article_cate` VALUES ('9', '0', '优惠信息', '', '', '0', '0', '255', '1', '优惠信息', '', '');

-- ----------------------------
-- Table structure for weixin_article_page
-- ----------------------------
DROP TABLE IF EXISTS `weixin_article_page`;
CREATE TABLE `weixin_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_article_page
-- ----------------------------
INSERT INTO `weixin_article_page` VALUES ('2', '关于我们', '<div>\r\n	欢迎来到PinPHP－拼品网， 拼品网是一个技术驱动创造时尚的互联网创业型公司，通过搜索引擎、图形处理、视觉搜索等核心技术研发优势，为中国千百万的个人站长提供一个解决如何快速抢建一个社会化的电子商务导购平台，它可以帮助爱美丽的女生找到适合的穿衣搭配、在哪里购买合适的时装搭配网购社区平台；我们将致力于为每一个时尚女孩都能轻松地创建属于自己的搭配宝典库而矢志不移的奉献青春年华。\r\n</div>\r\n<div>\r\n	<br />\r\n</div>\r\n<div>\r\n	　　来逛拼品网&nbsp;，你将发现更多喜爱的搭配风格，找到你最喜欢的时尚元素，你也将发现全球各地流行的风格与趋势，你还能很方便的在线拼贴搭配出你的时尚品味；懂得搭配的女人才更美丽，拉上你的好姐妹们一起来逛拼品网吧！\r\n</div>\r\n<div>\r\n	<br />\r\n</div>\r\n<div>\r\n	　　Logo寓意诠释：化蛹成碟的美丽蜕变，意思是通过来逛拼品网能让女孩们蜕变得更美丽！\r\n</div>', '', '', '', '0');
INSERT INTO `weixin_article_page` VALUES ('3', '联系我们', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	联系电话：0571-28058597\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	官方网站：www.pinphp.com\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	地址：杭州市万塘路６９号华星科技苑Ａ楼\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	邮编：３１００１２\r\n</p>', '', '', '', '0');
INSERT INTO `weixin_article_page` VALUES ('4', '加入我们', '<span style=\"white-space:nowrap;\"><strong>岗位名称：信息编辑</strong></span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp;<strong> 岗位职责：&nbsp;</strong></span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、产业网站内容建设；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、产业数据搜集整理；</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; <strong>任职要求 ：&nbsp;</strong></span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、大专以上学历，传媒、新闻、电子商务相关专业优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、1年以上互联网行业媒体从业经验，有电子商务相关从业经历者优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 3、熟悉网页制作软件，良好的文字功底、有原创采写经验者优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 4、对新闻、电子商务等产业有持续关注兴趣，良好的英文阅读能力；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 5、具有较强学习能力和责任心，以及团队合作精神；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 6、优秀应届毕业生可放宽工作经验要求；</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 有意者请发送简历至：HR#insuny.com （#替换成@）</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><br />\r\n<span style=\"white-space:nowrap;\"><strong>岗位名称：开发工程师</strong></span><br />\r\n<span style=\"white-space:nowrap;\"><strong>&nbsp; &nbsp; 岗位职责：&nbsp;</strong></span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、负责网站系统及B/S架构产品开发；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、负责产品体验优化；</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp;<strong> 任职要求 ：</strong>&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、大学专科及以上，计算机相关专业优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、2年以上B/S架构开发经验；有独立开发开发经验者优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 3、良好掌握PHP开发语言及MySQL数据库；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 4、熟练掌握javascript / ajax等；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 5、有******，热爱互联网行业，熟悉web2.0应用；</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; 有意者请发送简历至：HR#insuny.com（#替换成@）</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><br />\r\n<span style=\"white-space:nowrap;\"><strong>岗位名称：网页设计师</strong></span><br />\r\n<span style=\"white-space:nowrap;\"><strong>&nbsp; &nbsp; 岗位职责：</strong>&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、负责网站及B/S架构产品前端界面设计及重构；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、负责产品体验优化；</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp;<strong> 任职要求 ：</strong>&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 1、大学专科及以上，计算机相关专业优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 2、2年以上网站设计经验；有整站设计重构经验者优先；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 3、良好掌握XHTML，CSS手工书写页面，熟悉W3C标准，精通div+css；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 4、精通Photoshop、Dreamweaver、Flash等多种网页设计制作软件；&nbsp;</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp; 5、有******，热爱互联网行业，熟悉web2.0应用；</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><br />\r\n<span style=\"white-space:nowrap;\">&nbsp; &nbsp; &nbsp; &nbsp;有意者请发送简历至：HR#insuny.com （#替换成@）</span><br />', '', '', '', '0');
INSERT INTO `weixin_article_page` VALUES ('6', '会员加减分规则', '<p>\r\n	<strong>积分兑换</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	积分是为了答谢支持PinPHP网站会员而制定的一种奖励方式，您可以进入账户中的积分页面查看积分明细，同时PinPHP会推出各类积分兑换活动，请随时关注关于积分的活动告知。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>积分获得：</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、会员注册：会员注册即送20点积分，一个账户只能得一次注册积分；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、每日登录：会员每日首次登录PinPHP网站能获得10积分，每日上限5次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3、发布分享：会员分享新商品到PinPHP网站能获得20积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	4、添加喜欢：针对PinPHP网站上的商品会员点击喜欢可获得1积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	5、添加到专辑：会员把喜欢的商品添加进个人的专辑中可获得2积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	6、转发分享：会员转发PinPHP网站上商品到其他网站上可获2积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	7、发布评论：会员评论PinPHP网站商品可获1积分，每日上线5次。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>积分扣除：</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、删除分享：会员删除自己添加的商品减20积分，每日上限100次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、兑换商品：会员使用积分兑换自己喜欢的商品会扣除相对应的积分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	<br />\r\n</div>', '', '', '', '0');
INSERT INTO `weixin_article_page` VALUES ('7', '兑换说明', '1、奖品价格已经包含邮寄费用在内，您无须另行支付。兑奖前请确认您的帐户中有足够数量的积分！<br />\r\n2、奖品寄送方式：QQ直充类奖品兑奖审核通过后会直接充入您的QQ号码中，其余虚拟奖品采用在线发送卡密的方式；实体奖品全部采用快递方式。<br />\r\n3、虚拟奖品有效期：虚拟卡密类奖品除手机充值卡10/20/30元卡密，因为充值卡金额少，有效期比较短，大约一周左右,其余卡密类奖品有效期为1个月；虚拟卡直冲类为即时发货即时到账，无有效期限制！积分兑换含有有效期的奖品，请尽快充值使用，如过有效期未充值导致卡密失效，PinPHP网概不负责。<br />\r\n4、确认您的奖品邮寄地址、联系电话正确无误后提交兑奖申请！如因您未提供详细信息或信息错误，导致奖品错投或无法寄送，网站不负任何责任，并不再补发奖品。<br />\r\n5、实物奖品将在兑奖提交后的2-5工作日内发出(奖品状态您可通过“积分订单”查询)！<br />\r\n6、实物奖品按照会员申请的要求发出去之后，无破损、短缺等质量问题或因个人喜好（色泽、外观）要求退换货将无法受理。<br />\r\n7、兑奖中心所有实物奖品颜色均为随机发送, 敬请谅解！<br />\r\n<br />\r\n<strong>注意：</strong><br />\r\n<br />\r\n1、签收奖品前，务必仔细检查货物是否完好！如果发现有破损、短缺情况，请直接让快递公司退回，无需承担任何费用，并及时与我们联系。签收后提出货物破损等问题，一律责任自负！无法受理退换货要求！他人代签与本人签收一样。<br />\r\n2、收到奖品7天内，若发现质量问题，请及时与我们联系并提供图片说明。如因个人使用不当导致的奖品问题无法更换。<br />\r\n3、如提交兑奖后，由于商家缺货导致无法发货的情况，会员会收到站内信息通知并取消兑奖，请重新选择其他奖品兑换。<br />\r\n<br />\r\n兑奖过程中如有问题请通过“联系我们”联系咨询。<br />\r\n以上奖品图片仅供参考,请您以收取的实物为准！如有异议请联系客服人员确认奖品情况。<br />', '', '', '', '0');

-- ----------------------------
-- Table structure for weixin_auto_user
-- ----------------------------
DROP TABLE IF EXISTS `weixin_auto_user`;
CREATE TABLE `weixin_auto_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_auto_user
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_badword
-- ----------------------------
DROP TABLE IF EXISTS `weixin_badword`;
CREATE TABLE `weixin_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_badword
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_brandlist
-- ----------------------------
DROP TABLE IF EXISTS `weixin_brandlist`;
CREATE TABLE `weixin_brandlist` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_brandlist
-- ----------------------------
INSERT INTO `weixin_brandlist` VALUES ('1', '乐事', '1', '1');
INSERT INTO `weixin_brandlist` VALUES ('14', '清风', '1', '2');
INSERT INTO `weixin_brandlist` VALUES ('13', 'ABC', '1', '3');
INSERT INTO `weixin_brandlist` VALUES ('15', '七度空间', '1', '4');
INSERT INTO `weixin_brandlist` VALUES ('17', '百斯顿', '1', '7');
INSERT INTO `weixin_brandlist` VALUES ('22', 'abc', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('18', '有友', '1', '5');
INSERT INTO `weixin_brandlist` VALUES ('19', '达利园', '1', '6');
INSERT INTO `weixin_brandlist` VALUES ('20', '百事', '1', '8');
INSERT INTO `weixin_brandlist` VALUES ('21', 'Dove(多芬)', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('23', '苏菲', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('24', '自由点', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('25', '护舒宝', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('26', '青蛙王子', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('27', '舒肤佳', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('28', '力士', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('29', '强生', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('30', '汰渍', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('31', '雕牌', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('32', '黑人', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('33', '高露洁', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('34', '佳洁士', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('35', '蓝月亮', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('36', '三笑', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('37', '海飞丝', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('38', '云南白药', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('39', '清扬', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('40', '沙宣', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('41', '飘柔', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('42', '六神', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('43', '洁柔', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('44', '维达', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('45', '心心相印', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('46', '立白', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('47', '榄菊', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('48', '奥妙', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('49', '奇多', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('50', '猫哆哩', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('51', '德芙', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('52', '费列罗', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('53', '士力架', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('54', '好时', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('55', '潘婷', '1', '0');
INSERT INTO `weixin_brandlist` VALUES ('56', '奇强', '1', '0');

-- ----------------------------
-- Table structure for weixin_custom_menu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_custom_menu`;
CREATE TABLE `weixin_custom_menu` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `key` varchar(255) DEFAULT NULL COMMENT 'key值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_custom_menu
-- ----------------------------
INSERT INTO `weixin_custom_menu` VALUES ('1', '我的猫眼', '', '0', '0', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'shop', '');
INSERT INTO `weixin_custom_menu` VALUES ('2', '我的订单', '', '1', '1|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'recommend', 'http://maoyan.in/index.php?m=Item&a=index&id=128');
INSERT INTO `weixin_custom_menu` VALUES ('3', '促销优惠', '', '0', '0', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'my', '');
INSERT INTO `weixin_custom_menu` VALUES ('4', '订单查询', '', '3', '3|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'order', '');
INSERT INTO `weixin_custom_menu` VALUES ('5', '我的积分', '', '3', '3|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'jifen', '');
INSERT INTO `weixin_custom_menu` VALUES ('6', '常见问题', '', '0', '0', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'problem', '');
INSERT INTO `weixin_custom_menu` VALUES ('7', '支付方式', '', '6', '6|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'payment', '');
INSERT INTO `weixin_custom_menu` VALUES ('8', '如何购物', '', '6', '6|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'howtobuy', '');
INSERT INTO `weixin_custom_menu` VALUES ('9', '登录商城', '', '1', '1|', '', '', '0', '0', '0', '0', '255', '1', '0', '0', 'entershop', 'http://maoyan.in/index.php?g=&m=wxoauth&a=index&mod=wechat');

-- ----------------------------
-- Table structure for weixin_delivery
-- ----------------------------
DROP TABLE IF EXISTS `weixin_delivery`;
CREATE TABLE `weixin_delivery` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_delivery
-- ----------------------------
INSERT INTO `weixin_delivery` VALUES ('1', 'EMS', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('2', '中通速递', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('3', '圆通速递', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('4', '汇通快运', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('5', '申通快递', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('6', '韵达快运', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('7', '顺丰速运', '1', '0');
INSERT INTO `weixin_delivery` VALUES ('8', '猫眼配送', '1', '0');

-- ----------------------------
-- Table structure for weixin_event
-- ----------------------------
DROP TABLE IF EXISTS `weixin_event`;
CREATE TABLE `weixin_event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  `start_time` int(11) unsigned NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of weixin_event
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_event_item
-- ----------------------------
DROP TABLE IF EXISTS `weixin_event_item`;
CREATE TABLE `weixin_event_item` (
  `itemid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `price` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of weixin_event_item
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_flink
-- ----------------------------
DROP TABLE IF EXISTS `weixin_flink`;
CREATE TABLE `weixin_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_flink
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_flink_cate
-- ----------------------------
DROP TABLE IF EXISTS `weixin_flink_cate`;
CREATE TABLE `weixin_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_flink_cate
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_images
-- ----------------------------
DROP TABLE IF EXISTS `weixin_images`;
CREATE TABLE `weixin_images` (
  `iid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(300) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_images
-- ----------------------------
INSERT INTO `weixin_images` VALUES ('22', 'data/upload/keyword/1308/16/520dc84ee84b2.jpg');
INSERT INTO `weixin_images` VALUES ('23', 'data/upload/keyword/1401/06/52ca90ef04077.jpg');
INSERT INTO `weixin_images` VALUES ('24', 'data/upload/keyword/1401/06/52ca90fa16e1b.jpg');
INSERT INTO `weixin_images` VALUES ('25', 'data/upload/keyword/1401/06/52ca91cb8704e.jpg');
INSERT INTO `weixin_images` VALUES ('26', 'data/upload/keyword/1401/07/52cb5e24df3f4.jpg');
INSERT INTO `weixin_images` VALUES ('27', 'data/upload/keyword/1401/07/52cbaf5780316.jpg');
INSERT INTO `weixin_images` VALUES ('28', 'data/upload/keyword/1401/07/52cbb0f95d5fd.jpg');
INSERT INTO `weixin_images` VALUES ('29', 'data/upload/keyword/1401/07/52cbc4f80776c.jpg');
INSERT INTO `weixin_images` VALUES ('30', 'data/upload/keyword/1401/07/52cbc52384c65.jpg');
INSERT INTO `weixin_images` VALUES ('31', 'data/upload/keyword/1401/07/52cbc52a91bf4.jpg');

-- ----------------------------
-- Table structure for weixin_ipban
-- ----------------------------
DROP TABLE IF EXISTS `weixin_ipban`;
CREATE TABLE `weixin_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_ipban
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_item
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item`;
CREATE TABLE `weixin_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned DEFAULT NULL,
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `seo_desc` varchar(255) DEFAULT NULL,
  `seo_keys` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:商品,2:图片',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info` text,
  `news` tinyint(4) DEFAULT '0',
  `tuijian` tinyint(4) DEFAULT '0',
  `goods_stock` int(11) DEFAULT '0' COMMENT '库存',
  `buy_num` int(11) DEFAULT '0' COMMENT '卖出数量',
  `brand` int(11) DEFAULT '1' COMMENT '品牌',
  `pingyou` decimal(10,2) DEFAULT '0.00',
  `kuaidi` decimal(10,2) DEFAULT '0.00',
  `ems` decimal(10,2) DEFAULT '0.00',
  `free` int(11) DEFAULT '1',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `size` varchar(255) DEFAULT NULL COMMENT '尺寸',
  `is_xiangou` char(1) NOT NULL DEFAULT '0',
  `xiangou_num` int(11) NOT NULL DEFAULT '0' COMMENT '限购数量',
  `barcode` varchar(64) DEFAULT '',
  `stockmore` int(11) DEFAULT '0' COMMENT '前台显示数量增加值',
  `tag_cache` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'tag_cache',
  PRIMARY KEY (`id`),
  KEY `cid` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of weixin_item
-- ----------------------------
INSERT INTO `weixin_item` VALUES ('142', '367', '0', '多芬 深度损伤理护 洗发乳 200ml ', '多芬 深度损伤理护 洗发乳 200ml ', null, null, null, '1410/25/544b452259f3f.jpg', '20.80', '0.00', '1', '0', '0', '1412666224', '255', '1', '&lt;div id=&quot;proDescVideo&quot; class=&quot;mt&quot; style=&quot;text-align:center;padding-bottom:10px;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b487aa80ab.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b487b79bd7.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		【商品名称】：多芬深度损伤理护洗发乳200ml&lt;br /&gt;\r\n【品牌】：多芬&lt;br /&gt;\r\n【产品规格】：200ml&lt;br /&gt;\r\n【保质期】：三年&lt;br /&gt;\r\n【产品功效】：清洁更滋养，秀发回复强韧&lt;br /&gt;\r\n【适合人群】：适用于所有人群&lt;br /&gt;\r\n【产品说明】：角蛋白复合物；毛鳞片菁华油&lt;br /&gt;\r\n【使用方法】：取适量洗发乳于手心，涂于湿发上按摩至产生泡沫，用水冲净即可\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b487c821e3.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b487d20ddf.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;detail_box&quot;&gt;\r\n	&lt;p class=&quot;detail_page_t shangjiaDesTemp&quot; id=&quot;shangjiaDesTemp_0&quot; name=&quot;品牌授权&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p class=&quot;p_detail&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;prodDescDijiaAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;allInOneAds&quot; style=&quot;display:none;&quot; class=&quot;mb&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}&lt;/style&gt;', '0', '0', '12', '0', '21', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088112009', '0', 'a:6:{i:595;s:6:\"多芬\";i:596;s:6:\"发乳\";i:597;s:6:\"损伤\";i:598;s:6:\"深度\";i:599;s:5:\"200ml\";i:600;s:6:\"理护\";}');
INSERT INTO `weixin_item` VALUES ('143', '367', '0', '多芬 日常损伤理护 洗发乳 200ml ', '多芬 日常损伤理护 洗发乳 200ml ', null, null, null, '1410/25/544b491af2392.jpg', '20.80', '0.00', '1', '0', '0', '1412677584', '255', '1', '&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a1bb0c9b.jpg&quot; alt=&quot;&quot; /&gt;&amp;nbsp;&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a1c4c4b9.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	【商品名称】：多芬日常损伤理护洗发乳200ml&lt;br /&gt;\r\n【品牌】：多芬&lt;br /&gt;\r\n【产品规格】：200ml&lt;br /&gt;\r\n【保质期】：三年&lt;br /&gt;\r\n【产品功效】：修护日常损伤、抚平毛糙，秀发盈亮生机&lt;br /&gt;\r\n【适合人群】：适用于所有人群&lt;br /&gt;\r\n【产品说明】：添加角蛋白复合物和滋养毛鳞片菁华油&lt;br /&gt;\r\n【使用方法】：取适量的洗发乳于手心，涂于湿发上按摩至产生泡沫，用水冲净即可\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a1d62256.jpg&quot; alt=&quot;&quot; style=&quot;font-size:12px;line-height:1.5;&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a1e9de3c.jpg&quot; alt=&quot;&quot; style=&quot;font-size:12px;line-height:1.5;&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a1f7afbd.jpg&quot; alt=&quot;&quot; style=&quot;font-size:12px;line-height:1.5;&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4a2029bea.jpg&quot; alt=&quot;&quot; style=&quot;font-size:12px;line-height:1.5;&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescDijiaAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;allInOneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}&lt;/style&gt;', '0', '0', '12', '0', '21', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088111866', '0', 'a:6:{i:595;s:6:\"多芬\";i:596;s:6:\"发乳\";i:597;s:6:\"损伤\";i:601;s:6:\"日常\";i:599;s:5:\"200ml\";i:600;s:6:\"理护\";}');
INSERT INTO `weixin_item` VALUES ('144', '367', '0', '多芬滋养水润洗发乳400ml（瓶装）', '多芬滋养水润洗发乳400ml（瓶装）', null, null, null, '1410/27/544df2b7866f3.png', '35.79', '0.00', '1', '0', '0', '1412677690', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df198a6fe1.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df19dd0162.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1a0895cd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1a62b266.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1a8b1a24.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1ac3e166.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1b05007b.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1b251db6.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1b45a0bc.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1b8ac113.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1bc9593e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df1bf2aa78.png\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df31c6bb4d.png\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '21', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088111934', '0', 'a:5:{i:595;s:6:\"多芬\";i:596;s:6:\"发乳\";i:602;s:6:\"瓶装\";i:603;s:6:\"滋养\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('145', '367', '0', '海飞丝 去屑洗发露 200ml 丝质柔滑型 ', '海飞丝 去屑洗发露 200ml 丝质柔滑型 ', null, null, null, '1410/25/544b4da70c12f.jpg', '25.90', '0.00', '1', '0', '0', '1412679419', '255', '1', '&lt;div class=&quot;mt&quot; id=&quot;proDescVideo&quot; style=&quot;text-align:center;padding-bottom:10px;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd13e44c.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd1d4652.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		【商品名称】：海飞丝 丝质柔滑型 去屑洗发露 200ml&lt;br /&gt;\r\n【有效期】：3年&lt;br /&gt;\r\n【产地】：中国&lt;br /&gt;\r\n【规格】：200ml&lt;br /&gt;\r\n【商品特色】：特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。&lt;br /&gt;\r\n【适合发质】：适合多种发质使用&lt;br /&gt;\r\n【包装说明】：无外包装盒、无塑封、无防伪贴\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd45d0a4.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd64fd9d.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd7454a4.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd826509.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4cd8c743c.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;allInOneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}\r\n&lt;/style&gt;', '0', '0', '6', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148044971', '0', 'a:6:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:608;s:6:\"丝质\";i:609;s:6:\"柔滑\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('146', '367', '0', '海飞丝 去屑洗发露 200ml 水润滋养型 ', '海飞丝 去屑洗发露 200ml 水润滋养型 ', null, null, null, '1410/25/544b4f5dd66cf.jpg', '25.90', '0.00', '1', '0', '0', '1412679566', '255', '1', '&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef1a171c.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef23201a.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	【商品名称】：海飞丝 水润滋养型 去屑洗发露 200ml&lt;br /&gt;\r\n【有效期】：3年&lt;br /&gt;\r\n【产地】：中国&lt;br /&gt;\r\n【规格】：200ml&lt;br /&gt;\r\n【商品特色】：特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。&lt;br /&gt;\r\n【适合发质】：适合多种发质使用&lt;br /&gt;\r\n【包装说明】：无外包装盒、无塑封、无防伪贴&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef3ec190.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef4dd68b.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef6f09f7.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4ef7b7f92.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescDijiaAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;allInOneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}\r\n&lt;/style&gt;', '0', '0', '6', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045183', '0', 'a:5:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:603;s:6:\"滋养\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('147', '367', '0', '海飞丝 去屑洗发露 200ml 怡神冰凉型 ', '海飞丝 去屑洗发露 200ml 怡神冰凉型 ', null, null, null, '1410/25/544b4fcfa3cea.jpg', '23.90', '0.00', '1', '0', '0', '1412679711', '255', '1', '&lt;div class=&quot;mt&quot; id=&quot;proDescVideo&quot; style=&quot;text-align:center;padding-bottom:10px;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fb54cc38.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fb584a48.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		【商品名称】：海飞丝 怡神冰凉型 去屑洗发露 200ml&lt;br /&gt;\r\n【有效期】：3年&lt;br /&gt;\r\n【产地】：中国&lt;br /&gt;\r\n【规格】：200ml&lt;br /&gt;\r\n【商品特色】：特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。&lt;br /&gt;\r\n【适合发质】：适合多种发质&lt;br /&gt;\r\n【包装说明】：无外包装盒、无塑封、无防伪贴\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fb79c78d.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fb9cbc40.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fba8a5f1.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fbc09c1c.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b4fbce35c8.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;allInOneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}\r\n&lt;/style&gt;', '0', '0', '8', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045015', '0', 'a:6:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:610;s:6:\"怡神\";i:607;s:6:\"去屑\";i:611;s:6:\"冰凉\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('148', '367', '0', '海飞丝去屑洗发露海洋活力型（200ml  瓶装）', '海飞丝去屑洗发露海洋活力型（200ml  瓶装）', null, null, null, '1410/25/544b50429d452.png', '26.30', '0.00', '1', '0', '0', '1412679794', '255', '1', '&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&amp;nbsp;\r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c86dcd3fe.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c86e4d9e3.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c86f1611e.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c8708a5d5.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c870e795e.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433c8715698c.jpg&quot; /&gt;&lt;img src=&quot;/data/upload/item/1410/07/5433c871e256d.jpg&quot; /&gt; \r\n&lt;/div&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', '0', '0', '4', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045121', '0', 'a:7:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:602;s:6:\"瓶装\";i:612;s:6:\"活力\";i:613;s:6:\"海洋\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('149', '367', '0', '海飞丝去屑洗发露海洋活力型(瓶装 400ml)', '海飞丝去屑洗发露海洋活力型(瓶装 400ml)', null, null, null, '1410/25/544b51cc2806e.png', '42.60', '0.00', '1', '0', '0', '1412680816', '255', '1', '&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6ced395.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6d3e6bd.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6deb1bd.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6e68090.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6f24283.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc6f84961.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc7029d3f.jpg&quot; /&gt; \r\n&lt;/p&gt;', '0', '0', '3', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045114', '0', 'a:7:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:602;s:6:\"瓶装\";i:612;s:6:\"活力\";i:613;s:6:\"海洋\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('150', '364', '0', '海飞丝去屑洗发露丝质柔滑型(瓶装 400ml)', '海飞丝去屑洗发露丝质柔滑型(瓶装 400ml)', null, null, null, '1410/25/544b5219e91de.png', '43.90', '0.00', '1', '0', '0', '1412680865', '255', '1', '&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc9d404c8.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc9de1076.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc9ebcee2.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc9f360e1.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cc9f98515.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cca01c7b9.jpg&quot; /&gt;&lt;img src=&quot;/data/upload/item/1410/07/5433cca0c13a2.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cca18d022.jpg&quot; /&gt; \r\n&lt;/p&gt;', '0', '0', '4', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148044964', '0', 'a:7:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:608;s:6:\"丝质\";i:609;s:6:\"柔滑\";i:602;s:6:\"瓶装\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('151', '367', '0', '海飞丝去屑洗发露水润滋养型(瓶装 400ml)', '海飞丝去屑洗发露水润滋养型(瓶装 400ml)', null, null, null, '1410/25/544b53950a253.png', '42.60', '0.00', '1', '0', '0', '1412680915', '255', '1', '&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_01.jpg&quot; width=&quot;789&quot; height=&quot;363&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_01.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_02.jpg&quot; width=&quot;789&quot; height=&quot;552&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_02.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_03.jpg&quot; width=&quot;789&quot; height=&quot;440&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_03.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_04.jpg&quot; width=&quot;789&quot; height=&quot;658&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_04.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_05.jpg&quot; width=&quot;789&quot; height=&quot;523&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_05.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_06.jpg&quot; width=&quot;789&quot; height=&quot;622&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_06.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_07.jpg&quot; width=&quot;789&quot; height=&quot;562&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_07.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_08.jpg&quot; width=&quot;789&quot; height=&quot;532&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_08.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_09.jpg&quot; width=&quot;789&quot; height=&quot;495&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_09.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt;&lt;img src=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_10.jpg&quot; width=&quot;789&quot; height=&quot;559&quot; alt=&quot;海飞丝水润滋养型去屑洗发露 400ml&quot; original=&quot;http://img02.j1.com/upload/detail/image/20140214/41427_10.jpg&quot; style=&quot;padding:0px;margin:0px;outline:0px;font-family:\'microsoft yahei\';list-style:none;vertical-align:top;display:inline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;&quot; /&gt; \r\n&lt;/p&gt;', '0', '0', '3', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045190', '0', 'a:7:{i:605;s:6:\"海飞\";i:607;s:6:\"去屑\";i:614;s:6:\"洗发\";i:602;s:6:\"瓶装\";i:615;s:6:\"露水\";i:603;s:6:\"滋养\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('152', '367', '0', '海飞丝 去屑洗发露 400ml 护根防掉发型 ', '海飞丝 去屑洗发露 400ml 护根防掉发型 ', null, null, null, '1410/25/544b5559ac9a0.jpg', '45.90', '0.00', '1', '0', '0', '1412681100', '255', '1', '&lt;div class=&quot;mt&quot; id=&quot;proDescVideo&quot; style=&quot;text-align:center;padding-bottom:10px;&quot;&gt;\r\n	&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b5540d1a0d.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b554170fd8.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		【商品名称】：海飞丝 去屑洗发露 护根防掉发型 400ml&lt;br /&gt;\r\n【有效期】：3年&lt;br /&gt;\r\n【产地】：中国&lt;br /&gt;\r\n【规格】：400ml&lt;br /&gt;\r\n【商品特色】：特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。&lt;br /&gt;\r\n【适合发质】：适合多种发质使用&lt;br /&gt;\r\n【包装说明】：无外包装盒、无塑封、无防伪贴\r\n	&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b554262cff.jpg&quot; alt=&quot;&quot; /&gt; \r\n	&lt;/p&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b5543b7c62.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b5544eff71.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;img src=&quot;./data/upload/editer/image/2014/10/25/544b5545c1365.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescDijiaAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesZhengpinAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;oldForNewDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDescTopAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;prodDesTczgAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;contractPhoneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;mb&quot; id=&quot;allInOneAds&quot; style=&quot;display:none;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:&quot;微软雅黑&quot;;list-style:none; padding-top:3px; line-height:30px;}\r\n&lt;/style&gt;', '0', '0', '2', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148136270', '0', 'a:5:{i:605;s:6:\"海飞\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:616;s:6:\"发型\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('153', '367', '0', '清扬男士洗发露多效水润养护型400ml', '清扬男士洗发露多效水润养护型400ml', null, null, null, '1410/25/544b55fcaa7ce.png', '45.90', '0.00', '1', '0', '0', '1412681596', '255', '1', '&lt;p style=&quot;margin:0px;padding:0px;text-align:center;line-height:1.8em;&quot;&gt;\r\n	&lt;img src=&quot;http://p0.jmstatic.com/product/000/000/0_mall/1380248741139.jpg&quot; alt=&quot;&quot; style=&quot;border-style:none;color:#666666;font-family:Tahoma, Geneva, sans-serif;font-size:small;line-height:26px;white-space:normal;background-color:#FFFFFF;&quot; /&gt;&lt;span style=&quot;color:#666666;font-family:Tahoma, Geneva, sans-serif;font-size:small;line-height:26px;white-space:normal;background-color:#FFFFFF;&quot;&gt;&amp;nbsp;&lt;/span&gt; \r\n&lt;/p&gt;', '0', '0', '6', '0', '39', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088113082', '0', 'a:5:{i:606;s:9:\"洗发露\";i:617;s:6:\"清扬\";i:618;s:6:\"养护\";i:619;s:6:\"男士\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('155', '367', '0', '清扬多效水润养护型洗发露400ml（瓶装）', '清扬多效水润养护型洗发露400ml（瓶装）', null, null, null, '1410/25/544b56a21b8c5.png', '39.90', '0.00', '1', '0', '0', '1412681699', '255', '1', '&lt;p style=&quot;margin:0px;padding:0px;text-align:center;line-height:1.8em;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;margin:0px;padding:0px;text-align:center;line-height:1.8em;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/07/5433cfe19b1d5.jpg&quot; /&gt;&lt;img src=&quot;/data/upload/item/1410/07/5433cfe3826ed.jpg&quot; /&gt; \r\n&lt;/p&gt;', '0', '0', '6', '0', '39', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088112962', '0', 'a:5:{i:606;s:9:\"洗发露\";i:617;s:6:\"清扬\";i:602;s:6:\"瓶装\";i:618;s:6:\"养护\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('160', '367', '0', '飘柔 三合一护理洗发露 400ml ', '飘柔 三合一护理洗发露 400ml ', null, null, null, '1410/25/544b58182995c.png', '33.80', '0.00', '1', '0', '0', '1412731758', '255', '1', '&lt;div style=&quot;text-align:center;&quot;&gt;\r\n	&lt;p style=&quot;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;\r\n		&lt;img class=&quot;blogimg&quot; alt=&quot;&quot; src=&quot;http://image.yihaodianimg.com/images/describe/guangzhou/weixiaoyan/week12/0000032213-1.jpg&quot; style=&quot;padding:0px;margin:0px;border-style:none;vertical-align:top;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;\r\n		&lt;img class=&quot;blogimg&quot; alt=&quot;&quot; src=&quot;http://image.yihaodianimg.com/images/describe/guangzhou/weixiaoyan/week12/0012804396.jpg&quot; style=&quot;padding:0px;margin:0px;border-style:none;vertical-align:top;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;\r\n		&lt;img class=&quot;blogimg&quot; alt=&quot;&quot; src=&quot;http://image.yihaodianimg.com/images/describe/guangzhou/weixiaoyan/week12/0000032213-2.jpg&quot; style=&quot;padding:0px;margin:0px;border-style:none;vertical-align:top;&quot; /&gt; \r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;\r\n		&lt;img class=&quot;blogimg&quot; alt=&quot;&quot; src=&quot;http://image.yihaodianimg.com/images/describe/guangzhou/weixiaoyan/week12/0000032213-3.jpg&quot; style=&quot;padding:0px;margin:0px;border-style:none;vertical-align:top;&quot; /&gt; \r\n	&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;/div&gt;', '0', '0', '7', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148132531', '0', 'a:4:{i:606;s:9:\"洗发露\";i:624;s:9:\"三合一\";i:625;s:6:\"护理\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('161', '367', '0', '飘柔滋润去屑洗发露(瓶装 400ml)', '飘柔滋润去屑洗发露(瓶装 400ml)', null, null, null, '1410/25/544b5b21b3660.png', '32.90', '0.00', '1', '0', '0', '1412731822', '255', '1', '&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;span style=&quot;font-size:16px;&quot;&gt;&lt;strong&gt;&lt;span&gt;&lt;span style=&quot;line-height:200%;&quot;&gt;温馨提示：新旧包装随机发送，具体请以收到实物为准&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/08/543493acf196a.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/08/543493ad8cb27.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/08/543493ae05239.jpg&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	&lt;img src=&quot;/data/upload/item/1410/08/543493ae67517.jpg&quot; /&gt; \r\n&lt;/p&gt;', '0', '0', '5', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148048986', '0', 'a:5:{i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:602;s:6:\"瓶装\";i:626;s:6:\"滋润\";i:604;s:5:\"400ml\";}');
INSERT INTO `weixin_item` VALUES ('162', '367', '0', '飘柔 家庭茶树 长效柔顺洗发露 去屑型 200ml', '飘柔 家庭茶树 长效柔顺洗发露 去屑型 200ml', null, null, null, '1411/01/5454733e15b78.jpg', '9.90', '0.00', '1', '0', '0', '1412732800', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/545472d73e8da.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545472d7e7cc1.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭茶树长效柔顺洗发露(去屑型)200ml<br />\r\n保质期：1095天<br />\r\n规 &nbsp; 格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、聚<br />\r\n二甲基硅氧烷、椰油酰胺丙基甜菜碱、盐酸、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、<br />\r\n吡硫翁锌（ZPT）、柠檬酸、(日用)香精、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、茶叶提<br />\r\n取物、甲基异噻唑啉酮、CI 19140、CI 42090、甲基氯异噻唑啉酮。<br />\r\n产品功效：持久柔顺滋润，解决头屑烦恼。<br />\r\n使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545472d8c20eb.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/545472d940147.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148044933', '0', 'a:7:{i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:627;s:6:\"茶树\";i:628;s:6:\"柔顺\";i:629;s:6:\"长效\";i:630;s:6:\"家庭\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('163', '367', '0', '飘柔 家庭绿茶 长效清爽洗发露 去油型 200ml', '飘柔 家庭绿茶 长效清爽洗发露 去油型 200ml', null, null, null, '1411/01/5454743165e00.jpg', '9.90', '0.00', '1', '0', '0', '1412732910', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/545474141edf0.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454741467ae7.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭绿茶长效清爽洗发露(去油型)200ml<br />\r\n保质期：1095天<br />\r\n规 &nbsp; 格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、椰<br />\r\n油酰胺丙基甜菜碱、盐酸、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、聚二甲基硅氧烷、<br />\r\n柠檬酸、(日用)香精、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、EDTA四钠、茶叶提取物、<br />\r\nCI 19140、甲基氯异噻唑啉酮、甲基异噻唑啉酮CI42090.<br />\r\n产品功效：持久清爽去油，绿茶清新留香。<br />\r\n使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/54547415b651c.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/545474164828d.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148030462', '0', 'a:7:{i:606;s:9:\"洗发露\";i:631;s:6:\"去油\";i:629;s:6:\"长效\";i:632;s:6:\"绿茶\";i:633;s:6:\"清爽\";i:630;s:6:\"家庭\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('164', '367', '0', '飘柔家庭护理芦荟长效止痒滋润洗发露（200ml  瓶装）', '飘柔家庭护理芦荟长效止痒滋润洗发露（200ml  瓶装）', null, null, null, '1411/01/545474e2d06ba.jpg', '9.40', '0.00', '1', '0', '0', '1412732972', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/545474cab6ba4.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545474cb0d8ce.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭护理芦荟长效止痒滋润洗发露200ml<br />\r\n保质期：1095天<br />\r\n规 &nbsp; 格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、聚<br />\r\n二甲基硅氧烷、椰油酰胺丙基甜菜碱、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、吡硫翁<br />\r\n锌（ZPT）、(日用)香精、柠檬酸、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、盐酸、库拉索<br />\r\n芦荟叶汁、甲基异噻唑啉酮、CI 19140、CI 42090、甲基氯异噻唑啉酮。<br />\r\n产品功效：有效止痒滋润，持久清爽舒适。<br />\r\n使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545474cc60aa5.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/545474cc9cae3.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148126653', '0', 'a:8:{i:606;s:9:\"洗发露\";i:634;s:12:\"家庭护理\";i:635;s:6:\"止痒\";i:602;s:6:\"瓶装\";i:636;s:6:\"芦荟\";i:629;s:6:\"长效\";i:626;s:6:\"滋润\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('165', '367', '0', '飘柔家庭兰花长效洁顺洗发露水润型（200ml  瓶装）', '飘柔家庭兰花长效洁顺洗发露水润型（200ml  瓶装）', null, null, null, '1411/01/545475aaedb6e.jpg', '9.40', '0.00', '1', '0', '0', '1412733015', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454759296d5f.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454759346378.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭兰花长效洁顺洗发露(水润型)200ml<br />\r\n保质期：1095天<br />\r\n规 &nbsp; 格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、椰<br />\r\n油酰胺丙基甜菜碱、盐酸、聚二甲基硅氧烷、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、(<br />\r\n日用)香精、柠檬酸、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、EDTA四钠、CI 19140、甲基<br />\r\n氯异噻唑啉酮、甲基异噻唑啉酮、CI 42090<br />\r\n产品功效：持久水盈润泽，兰花清新馨香。<br />\r\n使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/54547594204aa.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547594ad6f1.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148030448', '0', 'a:7:{i:614;s:6:\"洗发\";i:602;s:6:\"瓶装\";i:615;s:6:\"露水\";i:629;s:6:\"长效\";i:637;s:6:\"兰花\";i:630;s:6:\"家庭\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('166', '367', '0', '飘柔 家庭兰花 长效清爽洗发露 去屑型 200ml', '飘柔 家庭兰花 长效清爽洗发露 去屑型 200ml', null, null, null, '1411/01/5454767e73f98.jpg', '9.90', '0.00', '1', '0', '0', '1412733142', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454765c6c6a9.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454765d2a269.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭兰花长效清爽洗发露(去屑型)200ml<br />\r\n保质期 ：1095天<br />\r\n规 &nbsp; &nbsp;格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、聚<br />\r\n二甲基硅氧烷、椰油酰胺丙基甜菜碱、盐酸、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、<br />\r\n吡硫翁锌（ZPT）、(日用)香精、柠檬酸、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、甲基异<br />\r\n噻唑啉酮、CI 19140、CI 42090、甲基氯异噻唑啉酮.<br />\r\n产品功效：持久洁净柔顺，解决头屑烦恼。<br />\r\n使用方法：湿发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454765df1b64.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454765e81384.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148030356', '0', 'a:7:{i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:629;s:6:\"长效\";i:637;s:6:\"兰花\";i:633;s:6:\"清爽\";i:630;s:6:\"家庭\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('167', '367', '0', '飘柔 家庭杏仁 长效柔顺洗发露 滋养型 200ml', '飘柔 家庭杏仁 长效柔顺洗发露 滋养型 200ml', null, null, null, '1411/01/5454772d734f6.jpg', '9.90', '0.00', '1', '0', '0', '1412733241', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454770bd6b36.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454770c9bd04.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		飘柔家庭杏仁长效柔顺洗发露(滋养型)200ml<br />\r\n保质期：1095天<br />\r\n规 &nbsp; 格：200ml<br />\r\n产品成分： 水、月桂醇聚醚硫酸酯钠、月桂醇硫酸酯钠、氯化钠、乙二醇二硬脂酸酯、聚<br />\r\n二甲基硅氧烷、椰油酰胺丙基甜菜碱、盐酸、柠檬酸钠、椰油酰胺 MEA、二甲苯磺酸钠、<br />\r\n柠檬酸、(日用)香精、苯甲酸钠、瓜儿胶羟丙基三甲基氯化铵、EDTA四钠、甜扁桃油、CI 19140、甲基氯异噻唑啉酮、甲基异噻唑啉酮、CI 42090.<br />\r\n产品功效：持久柔顺滋润，秀发柔韧亮泽。<br />\r\n使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br />\r\n注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454770dc7c36.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454770e71f03.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '41', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148044919', '0', 'a:7:{i:606;s:9:\"洗发露\";i:628;s:6:\"柔顺\";i:638;s:6:\"杏仁\";i:629;s:6:\"长效\";i:603;s:6:\"滋养\";i:630;s:6:\"家庭\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('170', '366', '0', '六神 艾叶健肤沐浴露 滋润型 450ml', '六神 艾叶健肤沐浴露 滋润型 450ml', null, null, null, '1411/01/54547810d3858.jpg', '19.80', '0.00', '1', '0', '0', '1412734237', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/545477e594a9c.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545477e6260be.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品特色：六神艾叶健肤沐浴露(滋润型)450ml<br />\r\n保质期：1095天<br />\r\n成分：水、月桂醇聚醚-2硫酸钠、甘油、椰油酰胺MIPA、艾叶片、蛇胆提取物、人工麝香、忍冬花等<br />\r\n净 &nbsp;含 量：450ml<br />\r\n执行标准：QB 1994<br />\r\n卫生许可证：（1990）卫状准字06-XK-001号\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545477e6e6039.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/545477e7860b2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545477e8100a1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545477e89e578.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545477e926ae0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545477e992e0f.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '42', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901294172197', '0', 'a:5:{i:620;s:6:\"六神\";i:621;s:9:\"沐浴露\";i:626;s:6:\"滋润\";i:623;s:5:\"450ml\";i:639;s:9:\"艾叶健\";}');
INSERT INTO `weixin_item` VALUES ('171', '366', '0', '六神清凉爽肤沐浴露（瓶装 450ml）', '六神清凉爽肤沐浴露（瓶装 450ml）', null, null, null, '1411/01/54547a8205625.jpg', '17.60', '0.00', '1', '0', '0', '1412734298', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/54547a5cf2fef.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/54547a5d31187.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品特色：六神清凉爽肤沐浴露450ml<br />\r\n成分：水、月桂酸、肉豆蔻酸、氢氧化钾、月桂酰胺丙基甜菜碱、甘油、蛇胆提取物、香精、山梨醇、人工麝香、人工牛黄、冰片、甘草酸铵、忍冬花等<br />\r\n净 &nbsp;含 量：450ml<br />\r\n执行标准：QB 1994<br />\r\n卫生许可证：（1990）卫状准字06-XK-001号<br />\r\n保 &nbsp;质 期：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/54547a5ddaea1.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547a5e89d5d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547a5f00361.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547a5f74097.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547a5fcfdc8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547a6049352.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '42', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901294171213', '0', 'a:5:{i:620;s:6:\"六神\";i:621;s:9:\"沐浴露\";i:602;s:6:\"瓶装\";i:622;s:6:\"清凉\";i:623;s:5:\"450ml\";}');
INSERT INTO `weixin_item` VALUES ('172', '366', '0', '六神冰凉超爽沐浴露（瓶装450ml）', '六神冰凉超爽沐浴露（瓶装450ml）', null, null, null, '1411/07/545c75065b595.png', '19.80', '0.00', '1', '0', '0', '1412734376', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/54349da7b3c1c.jpg\" /> \r\n</p>', '0', '0', '3', '0', '42', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901294172166', '0', 'a:5:{i:620;s:6:\"六神\";i:621;s:9:\"沐浴露\";i:602;s:6:\"瓶装\";i:611;s:6:\"冰凉\";i:623;s:5:\"450ml\";}');
INSERT INTO `weixin_item` VALUES ('173', '366', '0', '舒肤佳纯白清香型沐浴露（瓶装400ml）', '舒肤佳纯白清香型沐浴露（瓶装400ml）', null, null, null, '1411/07/545c76c478346.jpg', '19.90', '0.00', '1', '0', '0', '1412735770', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c76b391c64.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c76b52139a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c76b69ecf2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c76b7eafb3.jpg\" alt=\"\" /><br />', '0', '0', '4', '0', '27', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148082119', '0', 'a:6:{i:621;s:9:\"沐浴露\";i:640;s:6:\"香型\";i:602;s:6:\"瓶装\";i:641;s:6:\"纯白\";i:604;s:5:\"400ml\";i:642;s:9:\"舒肤佳\";}');
INSERT INTO `weixin_item` VALUES ('174', '366', '0', 'Safeguard 舒肤佳 沐浴露 400ml 柠檬清新', 'Safeguard 舒肤佳 沐浴露 400ml 柠檬清新', null, null, null, '1411/07/545c77cbea2e2.jpg', '22.90', '0.00', '1', '0', '0', '1412735975', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c77b24fd3f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b338f4e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b43eab9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b584b2b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b63d456.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b7578d4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b86c222.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c77b94f2ea.jpg\" alt=\"\" /><br />', '0', '0', '3', '0', '27', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148047811', '0', 'a:6:{i:621;s:9:\"沐浴露\";i:643;s:6:\"柠檬\";i:644;s:9:\"Safeguard\";i:645;s:6:\"清新\";i:604;s:5:\"400ml\";i:642;s:9:\"舒肤佳\";}');
INSERT INTO `weixin_item` VALUES ('175', '367', '0', 'VS 沙宣 水润去屑洗发露 200ml', 'VS 沙宣 水润去屑洗发露 200ml', null, null, null, '1411/07/545c78faa623a.jpg', '22.50', '0.00', '1', '0', '0', '1412736543', '255', '1', '沙宣 水润去屑洗发露200ml<br />\r\n有效期：3年<br />\r\n规格：200ml<br />\r\n新科技配方：新添加弹性配方，唤醒秀发中沉睡因子，令秀发弹性增加26%<br />\r\n商品功效：“干枯，头屑，让好的发型也显得无精打采”！ZPT去屑水润配方，有效去屑，令秀发清爽水润轻盈焕发配方，实现发型顶部轻盈，发丝可塑。<br />\r\n适用人群：任何发质<br />\r\n商品状态：液态<br />\r\n<p>\r\n	使用方法：湿发后，取适量洗发露，用手指轻揉头皮及发丝至产生丰富泡沫，再以清水洗净\r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;line-height:1.5;\">注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:12px;line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/07/545c78bf54f73.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c78c0bf3ea.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c78c16a864.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c78c28312c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c78c5306c6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c78c61bfdd.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', '0', '0', '12', '0', '40', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148080061', '0', 'a:5:{i:646;s:6:\"沙宣\";i:606;s:9:\"洗发露\";i:607;s:6:\"去屑\";i:599;s:5:\"200ml\";i:647;s:2:\"VS\";}');
INSERT INTO `weixin_item` VALUES ('177', '367', '0', '海飞丝去屑护发素丝滑柔顺型（瓶装200ml）', '海飞丝去屑护发素丝滑柔顺型（瓶装200ml）', null, null, null, '1411/07/545c79e704d28.jpg', '23.60', '0.00', '1', '0', '0', '1412736853', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c79d124ff2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c79d1cfa66.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c79d2be15b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c79d4d3bbc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c79d643216.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045954', '0', 'a:7:{i:605;s:6:\"海飞\";i:648;s:6:\"素丝\";i:607;s:6:\"去屑\";i:649;s:6:\"护发\";i:602;s:6:\"瓶装\";i:628;s:6:\"柔顺\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('178', '367', '0', '海飞丝 去屑护发素 200ml 清润平衡型', '海飞丝 去屑护发素 200ml 清润平衡型', null, null, null, '1411/07/545c7b593684f.jpg', '24.90', '0.00', '1', '0', '0', '1412736912', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c7b478321e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7b488b5b1.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7b49c4a3d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7b4b10def.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7b4ce4c90.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7b4da1917.jpg\" alt=\"\" /><br />', '0', '0', '0', '0', '37', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148045879', '0', 'a:6:{i:605;s:6:\"海飞\";i:650;s:9:\"护发素\";i:607;s:6:\"去屑\";i:651;s:6:\"清润\";i:652;s:6:\"平衡\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('180', '367', '0', '潘婷 乳液修护 润发精华素 200ml美特好', '潘婷 乳液修护 润发精华素 200ml美特好', null, null, null, '1411/07/545c7c8a5c02b.jpg', '18.50', '0.00', '1', '0', '0', '1412737203', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c7c5d25a06.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c5f6531c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6095bad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6231cba.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6382cd9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c64914d9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c65e6836.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6701116.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6898d34.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c69edcc6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6a9f73e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7c6bd1cbd.jpg\" alt=\"\" /><br />', '0', '0', '1', '0', '55', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148091555', '0', 'a:7:{i:653;s:9:\"精华素\";i:654;s:6:\"特好\";i:655;s:6:\"润发\";i:656;s:6:\"潘婷\";i:657;s:6:\"乳液\";i:658;s:6:\"修护\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('181', '367', '0', '潘婷丝质顺滑润发精华素（200ml  瓶装）', '潘婷丝质顺滑润发精华素（200ml  瓶装）', null, null, null, '1411/07/545c7cd40ac5e.jpg', '18.90', '0.00', '1', '0', '0', '1412737257', '255', '1', '<div style=\"text-align:center;\">\r\n	&nbsp;\r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e3188ef.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e3c9e8a.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e4930b8.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e533768.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e6651b6.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e78f5b7.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e84b25c.jpg\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/08/5434a8e904aab.jpg\" /> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '1', '0', '55', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148091371', '0', 'a:6:{i:653;s:9:\"精华素\";i:655;s:6:\"润发\";i:656;s:6:\"潘婷\";i:608;s:6:\"丝质\";i:602;s:6:\"瓶装\";i:599;s:5:\"200ml\";}');
INSERT INTO `weixin_item` VALUES ('182', '366', '0', 'LUX 力士 靓肤沐浴乳 400ml 白皙焕采', 'LUX 力士 靓肤沐浴乳 400ml 白皙焕采', null, null, null, '1411/07/545c7ef1f1172.jpg', '21.90', '0.00', '1', '0', '0', '1412737454', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c7ed4eeeab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7ed6440fd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7ed7a91ad.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7eda00dc6.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7edb8fa16.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7edc5d6b0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7edd597be.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7eded5a35.png\" alt=\"\" /><br />', '0', '0', '3', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088310719', '0', 'a:5:{i:659;s:9:\"沐浴乳\";i:660;s:6:\"力士\";i:661;s:6:\"白皙\";i:604;s:5:\"400ml\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('184', '366', '0', 'LUX 力士 爽肤沐浴乳闪亮冰爽 400ml', 'LUX 力士 爽肤沐浴乳闪亮冰爽 400ml', null, null, null, '1411/10/54600fba70d53.jpg', '21.90', '0.00', '1', '0', '0', '1412738103', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/54600f976ad92.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9892e67.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f996ceca.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9b07a22.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9b63a33.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9ca1a38.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9daa335.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9e18e9b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54600f9f26c22.png\" alt=\"\" /><br />', '0', '0', '3', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088311013', '0', 'a:5:{i:659;s:9:\"沐浴乳\";i:660;s:6:\"力士\";i:663;s:6:\"闪亮\";i:604;s:5:\"400ml\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('185', '366', '0', 'LUX/力士娇肤沐浴乳恒久嫩肤400ml', 'LUX/力士娇肤沐浴乳恒久嫩肤400ml', null, null, null, '1411/10/546013be87a28.jpg', '21.90', '0.00', '1', '0', '0', '1412738458', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/5460137262d37.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546013731fd1a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601373ec1f6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601374db7d1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460137606f5c.jpg\" alt=\"\" /><br />', '0', '0', '3', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088311167', '0', 'a:7:{i:659;s:9:\"沐浴乳\";i:666;s:6:\"娇肤\";i:667;s:6:\"嫩肤\";i:660;s:6:\"力士\";i:668;s:6:\"恒久\";i:604;s:5:\"400ml\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('187', '366', '0', 'LUX/力士精油香氛沐浴乳幽莲魅肤400ml', 'LUX/力士精油香氛沐浴乳幽莲魅肤400ml', null, null, null, '1411/10/5460153bd2b81.jpg', '21.90', '0.00', '1', '0', '0', '1412738612', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/5460150ed5fbb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460151016cba.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601510a6963.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601511e9693.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546015123cb55.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601513847c8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601514808bc.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460151572622.png\" alt=\"\" /><br />', '0', '0', '1', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088312010', '0', 'a:6:{i:659;s:9:\"沐浴乳\";i:669;s:6:\"香氛\";i:670;s:6:\"精油\";i:660;s:6:\"力士\";i:604;s:5:\"400ml\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('188', '365', '0', '青蛙王子 儿童水晶牙膏带牙刷  苹果味  50g', '青蛙王子 儿童水晶牙膏带牙刷  苹果味  50g', null, null, null, '1411/10/546017af45c2f.png', '6.80', '0.00', '1', '0', '0', '1412747173', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/5460177fce319.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601781e2d48.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460178544492.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546017880ca35.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460178bb1cb4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460178e87071.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601790582a1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546017926f27d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546017948cb40.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '26', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6949044602273', '0', 'a:7:{i:671;s:12:\"青蛙王子\";i:673;s:6:\"牙刷\";i:672;s:6:\"牙膏\";i:674;s:6:\"水晶\";i:675;s:6:\"苹果\";i:676;s:6:\"儿童\";i:677;s:3:\"50g\";}');
INSERT INTO `weixin_item` VALUES ('189', '365', '0', '青蛙王子 儿童水晶牙膏带牙刷   草莓味  50g', '青蛙王子 儿童水晶牙膏带牙刷   草莓味  50g', null, null, null, '1411/10/546018ca62613.png', '6.80', '0.00', '1', '0', '0', '1412747227', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546018b6052cd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018b8186af.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018ba0642d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018bb44c4a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018bcd8ded.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018bdc1901.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018be6b312.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018bf31d80.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018c0156b2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546018c0bf0c3.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '26', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6949044602242', '0', 'a:7:{i:671;s:12:\"青蛙王子\";i:673;s:6:\"牙刷\";i:672;s:6:\"牙膏\";i:678;s:6:\"草莓\";i:674;s:6:\"水晶\";i:676;s:6:\"儿童\";i:677;s:3:\"50g\";}');
INSERT INTO `weixin_item` VALUES ('191', '365', '0', '高露洁超强牙膏(支装140g)赠360°备长碳深洁牙膏40g超值', '高露洁超强牙膏(支装140g)赠360°备长碳深洁牙膏40g超值', null, null, null, '1411/10/54601ac41aab0.png', '3.80', '0.00', '1', '0', '0', '1412747790', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546018ff88645.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601901bbe51.jpg\" alt=\"\" /><br />', '0', '0', '10', '0', '33', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920354803185', '0', 'a:7:{i:672;s:6:\"牙膏\";i:679;s:9:\"高露洁\";i:680;s:6:\"超值\";i:681;s:6:\"超强\";i:682;s:4:\"140g\";i:683;s:3:\"360\";i:684;s:3:\"40g\";}');
INSERT INTO `weixin_item` VALUES ('192', '365', '0', '云南白药 金口健牙膏 105g 激爽薄荷', '云南白药 金口健牙膏 105g 激爽薄荷', null, null, null, '1411/10/54601c2f41490.jpg', '15.20', '0.00', '1', '0', '0', '1412747877', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/54601bc53ab8b.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/10/54601bc597052.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	云南白药 金口健牙膏 105g 激爽薄荷<br />\r\n【规格】：105g<br />\r\n【产地】：云南<br />\r\n【保质期】：3年<br />\r\n【适用人群】：大众<br />\r\n【主要功效】：止血愈伤、消肿止痛、活血化瘀类产品的百年品牌。云南白药牙膏是以牙膏为载体。<br />\r\n【使用方法】：坚持使用云南白药牙膏每天刷牙2～3次，每次刷牙1～3分钟\r\n</p>\r\n<p>\r\n	若患口腔溃疡，刷牙结<span style=\"font-size:12px;line-height:1.5;\">束以后上牙膏在口腔内含漱2～3分钟，效果明显</span> \r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/10/54601c0f3998c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601c12bce18.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601c1571492.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601c17bc415.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601c19af8cf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601c1ace170.jpg\" alt=\"\" />\r\n</p>', '0', '0', '6', '0', '38', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901070602788', '0', 'a:5:{i:685;s:12:\"云南白药\";i:686;s:6:\"金口\";i:672;s:6:\"牙膏\";i:687;s:6:\"薄荷\";i:688;s:4:\"105g\";}');
INSERT INTO `weixin_item` VALUES ('193', '365', '0', 'Colgate 高露洁 防蛀美白牙膏 90g', 'Colgate 高露洁 防蛀美白牙膏 90g', null, null, null, '1411/10/54601d4eb1341.jpg', '3.20', '0.00', '1', '0', '0', '1412747943', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/54601d3ade43c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601d3bdcad2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601d3c56f80.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601d3d60c98.jpg\" alt=\"\" /><br />', '0', '0', '12', '0', '33', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920354805400', '0', 'a:6:{i:679;s:9:\"高露洁\";i:689;s:6:\"防蛀\";i:672;s:6:\"牙膏\";i:690;s:6:\"美白\";i:691;s:7:\"Colgate\";i:692;s:3:\"90g\";}');
INSERT INTO `weixin_item` VALUES ('194', '365', '0', '黑人 DARLIE 黑人 超白青柠薄荷牙膏 90g', '黑人 DARLIE 黑人 超白青柠薄荷牙膏 90g', null, null, null, '1411/10/54601dee28c73.jpg', '8.60', '0.00', '1', '0', '0', '1412748001', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/54601dd188d9f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601dd2e0b98.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601dd3623b9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601dd51d06b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601dd576658.jpg\" alt=\"\" /><br />', '0', '0', '12', '0', '32', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4891338011310', '0', 'a:6:{i:693;s:6:\"黑人\";i:694;s:6:\"白青\";i:672;s:6:\"牙膏\";i:687;s:6:\"薄荷\";i:695;s:6:\"DARLIE\";i:692;s:3:\"90g\";}');
INSERT INTO `weixin_item` VALUES ('195', '365', '0', '佳洁士 草本水晶啫喱牙膏 90g 清爽薄荷', '佳洁士 草本水晶啫喱牙膏 90g 清爽薄荷', null, null, null, '1411/10/54601ec71f80d.jpg', '2.90', '0.00', '1', '0', '0', '1412748064', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/54601ea0c8c1e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea197a07.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea22f586.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea2c74a2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea31a2a3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea378af2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54601ea407e79.jpg\" alt=\"\" /><br />', '0', '0', '6', '0', '34', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148015834', '0', 'a:7:{i:696;s:9:\"佳洁士\";i:672;s:6:\"牙膏\";i:697;s:6:\"草本\";i:687;s:6:\"薄荷\";i:633;s:6:\"清爽\";i:674;s:6:\"水晶\";i:692;s:3:\"90g\";}');
INSERT INTO `weixin_item` VALUES ('196', '366', '0', 'Safeguard 舒肤佳 香皂 115g 柠檬清新型', 'Safeguard 舒肤佳 香皂 115g 柠檬清新型', null, null, null, '1411/10/546020ecd6ba3.jpg', '5.00', '0.00', '1', '0', '0', '1412748714', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546020d5e846c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020d6cc4c0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020d8072f4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020d8a8a23.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020d954e51.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020d9e8cba.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020da664af.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546020dae03f0.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '27', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148144442', '0', 'a:6:{i:698;s:6:\"香皂\";i:643;s:6:\"柠檬\";i:644;s:9:\"Safeguard\";i:699;s:6:\"新型\";i:642;s:9:\"舒肤佳\";i:700;s:4:\"115g\";}');
INSERT INTO `weixin_item` VALUES ('197', '366', '0', '舒肤佳纯白清香型香皂（115g 单块）', '舒肤佳纯白清香型香皂（115g 单块）', null, null, null, '1411/10/5460227eca5a3.jpg', '4.90', '0.00', '1', '0', '0', '1412748754', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546022607953e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54602261bf8f2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460226226676.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54602262b8051.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460226322d9a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54602263b51bc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460226403c69.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54602264a3b8d.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '27', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148144541', '0', 'a:5:{i:640;s:6:\"香型\";i:698;s:6:\"香皂\";i:641;s:6:\"纯白\";i:642;s:9:\"舒肤佳\";i:700;s:4:\"115g\";}');
INSERT INTO `weixin_item` VALUES ('198', '366', '0', '舒肤佳芦荟呵护型香皂（115g 单块）', '舒肤佳芦荟呵护型香皂（115g 单块）', null, null, null, '1411/10/546024f9a357c.jpg', '5.00', '0.00', '1', '0', '0', '1412748962', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546024e1f1e05.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e2daccd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e3f0af3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e4a56c2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e54acf5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e656303.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e6cb6f6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546024e75e6b2.jpg\" alt=\"\" /><br />', '0', '0', '1', '0', '27', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148144459', '0', 'a:5:{i:698;s:6:\"香皂\";i:636;s:6:\"芦荟\";i:701;s:6:\"呵护\";i:642;s:9:\"舒肤佳\";i:700;s:4:\"115g\";}');
INSERT INTO `weixin_item` VALUES ('199', '366', '0', 'Johnson’s Baby强生婴儿清凉香皂125G', 'Johnson’s Baby强生婴儿清凉香皂125G', null, null, null, '1411/10/546025c95fc5e.jpg', '4.90', '0.00', '1', '0', '0', '1412749001', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546025b6365d9.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546025b6e7973.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546025b756b75.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546025b8b6e58.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546025b94f0c6.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '29', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6907376500445', '0', 'a:7:{i:702;s:6:\"强生\";i:698;s:6:\"香皂\";i:622;s:6:\"清凉\";i:703;s:6:\"婴儿\";i:704;s:7:\"Johnson\";i:706;s:4:\"125G\";i:705;s:4:\"Baby\";}');
INSERT INTO `weixin_item` VALUES ('200', '366', '0', 'LUX/力士 幽莲魅肤 魅肤香皂115g', 'LUX/力士 幽莲魅肤 魅肤香皂115g', null, null, null, '1411/10/546031b0d997a.jpg', '4.50', '0.00', '1', '0', '0', '1412749057', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546031864f65f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54603187bb70c.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/54603188ab9b5.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546031896ecce.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/5460318ab28b9.png\" alt=\"\" /><br />', '0', '0', '3', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088312843', '0', 'a:4:{i:660;s:6:\"力士\";i:698;s:6:\"香皂\";i:700;s:4:\"115g\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('201', '366', '0', 'LUX/力士 滋养柔肤 娇肤香皂115g/块', 'LUX/力士 滋养柔肤 娇肤香皂115g/块', null, null, null, '1411/10/546033d895937.jpg', '4.30', '0.00', '1', '0', '0', '1412749091', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/10/546033ab690e0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546033acc2647.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546033ae03fcd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546033ae6d10e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546033afdfa6d.png\" alt=\"\" /><br />', '0', '0', '3', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088312836', '0', 'a:6:{i:666;s:6:\"娇肤\";i:660;s:6:\"力士\";i:698;s:6:\"香皂\";i:603;s:6:\"滋养\";i:707;s:3:\"115\";i:662;s:3:\"LUX\";}');
INSERT INTO `weixin_item` VALUES ('202', '347', '0', '奇强 内衣除菌皂100G', '奇强 内衣除菌皂100G', null, null, null, '1410/27/544df5070d74a.jpg', '2.50', '0.00', '1', '0', '0', '1412749163', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df4f5b1efb.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\"><br />\r\n</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">1、天然油脂配方，温和无刺激，有效呵护内衣纤维。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">2、含优质的钙皂分散剂，在硬水条件下仍能发挥超卓洁力。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">3、加入全新的抗菌剂，可有效除菌，防止病菌的交叉感染。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">4、泡沫丰富，易漂洗，无残留，安全放心。</span> \r\n</div>\r\n</span> \r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;\">5、浓郁的花香气息，洗涤后的衣物清香宜人。1、天然油脂配方，温</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;\">和无刺激，有效</span><span style=\"white-space:nowrap;line-height:1.5;\">呵护内衣纤维。</span> \r\n</p>\r\n<span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">2、含优质的钙皂分散剂，在硬水条件下仍能发挥超卓洁力。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">3、加入全新的抗菌剂，可有效除菌，防止病菌的交叉感染。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">4、泡沫丰富，易漂洗，无残留，安全放心。</span> \r\n</div>\r\n</span> <span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">5、浓郁的花香气息，洗涤后的衣物清香宜人。&nbsp;</span> \r\n</div>\r\n</span> \r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '56', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6907917131855', '0', 'a:3:{i:708;s:6:\"奇强\";i:709;s:6:\"内衣\";i:710;s:4:\"100G\";}');
INSERT INTO `weixin_item` VALUES ('203', '347', '0', '汰渍 三重功效洗衣皂 柠檬清新 238g', '汰渍 三重功效洗衣皂 柠檬清新 238g', null, null, null, '1410/27/544df790ab943.png', '4.50', '0.00', '1', '0', '0', '1412749508', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df75190555.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df7532e84d.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品信息PRODUCT INFORMATION</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品名】：汰渍三重功效洗衣皂238g*6块（柠檬清新）</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品牌】：汰渍</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【净含量】：238g*6块</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【产地】：广东</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">贮存条件</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">阴凉干燥处存放，避免阳光直射！</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df75451418.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	1、省钱又省水，迅速清潔衣物污垢。<br />\r\n2、帮助改善已变黄或变得灰暗的衣物，使白色衣物更显洁白，顏色衣物倍添光鮮。<br />\r\n3、防止衣物多次洗涤后发黄、变灰，令衣物亮白如新！<br />\r\n4、清新舒爽，洁净芬芳 特含优质香料，织物洗晒后芳香持久，散发清新气息。\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df755eb481.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df75b24499.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df75c93de3.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '36', '0', '30', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148070840', '0', 'a:7:{i:711;s:6:\"汰渍\";i:712;s:9:\"洗衣皂\";i:713;s:6:\"三重\";i:714;s:6:\"功效\";i:643;s:6:\"柠檬\";i:645;s:6:\"清新\";i:715;s:4:\"238g\";}');
INSERT INTO `weixin_item` VALUES ('204', '347', '0', 'OMO 奥妙 99超效无磷洗衣皂 206g', 'OMO 奥妙 99超效无磷洗衣皂 206g', null, null, null, '1410/27/544df46df1cea.jpg', '3.90', '0.00', '1', '0', '0', '1412749734', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df3faaa458.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df3fb9f6d5.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【商品名称】：OMO 奥妙 99超效无磷洗衣皂 206g</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品牌】：奥妙</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【保质期】：3年</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【产品功效】：去除99种污渍，天然芦荟精华</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【产地】：安徽</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【适合范围】：适用于棉、麻、丝、羽绒、化纤、混纺等，更适合内衣、婴幼儿衣物</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【产品说明】：请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【使用方法】：请认明衣物上的洗涤指示。先将要洗净部位用水泡湿，再使用洗衣皂洗净即可&nbsp;</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df40067302.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df4023e762.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df405da677.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df407bf439.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df40b66f91.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '24', '0', '48', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088705423', '0', 'a:5:{i:716;s:6:\"无磷\";i:712;s:9:\"洗衣皂\";i:717;s:6:\"奥妙\";i:718;s:4:\"206g\";i:719;s:3:\"OMO\";}');
INSERT INTO `weixin_item` VALUES ('205', '358', '0', '原野物语 蛋之果饼干 200g/袋', '原野物语 蛋之果饼干 200g/袋', null, null, null, '1411/25/5474286945831.jpg', '9.80', '0.00', '1', '0', '0', '1412753842', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/25/547427fa2f932.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fb80f8e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fc2ed30.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fc80d23.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fd21533.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fdb5ddc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/547427fe278cd.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920300700070', '0', 'a:4:{i:720;s:6:\"原野\";i:721;s:6:\"饼干\";i:722;s:6:\"物语\";i:570;s:3:\"200\";}');
INSERT INTO `weixin_item` VALUES ('208', '358', '0', 'Hemali 河马莉 蛋酥 特浓牛奶 130g 台湾地区', 'Hemali 河马莉 蛋酥 特浓牛奶 130g 台湾地区', null, null, null, '1411/28/54782dbf1d58f.jpg', '15.90', '0.00', '1', '0', '0', '1412754411', '255', '1', '<div class=\"mt\" id=\"proDescVideo\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/28/54782d8bcd8d4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d8d4adc4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d8e85b4d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d8f0bca0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d8fb020d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d90b4506.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d91b9711.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782d9619900.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<div class=\"detail_box\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescDijiaAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesZhengpinAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"oldForNewDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesTczgAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"contractPhoneAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"allInOneAds\" style=\"display:none;\">\r\n</div>\r\n<style type=\"text/css\">\r\n.dk_wrap_content {\r\nPADDING-BOTTOM: 5px; PADDING-LEFT: 5px; WIDTH: 750px; PADDING-RIGHT: 5px; OVERFLOW: hidden; PADDING-TOP: 5px\r\n}\r\n.dk_wrap_content .dk_a1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_t1 .dk_wrap_content .dk_t2 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nMARGIN-TOP: 15px; WIDTH: 751px; BORDER-COLLAPSE: collapse; MARGIN-BOTTOM: 10px; FONT-SIZE: 12px\r\n}\r\n.dk_wrap_content .dk_b1_left {\r\nWIDTH: 350px; FLOAT: left; HEIGHT: 350px; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1_left IMG {\r\nWIDTH: 350px; HEIGHT: 350px; VERTICAL-ALIGN: top\r\n}\r\n.dk_wrap_content .dk_b1_right {\r\nWIDTH: 400px; FLOAT: right; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_txt P {\r\nLINE-HEIGHT: 24px; FONT-FAMILY: 微软雅黑; FONT-SIZE: 16px\r\n}\r\n.dk_wrap_content .dk_txt {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_wrap_content .dk_pic {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_ull {\r\nPADDING-BOTTOM: 0px; LIST-STYLE-TYPE: none; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px\r\n}\r\n.dk_ull LI {\r\nBORDER-BOTTOM: #666 1px dotted; TEXT-ALIGN: left; LINE-HEIGHT: 34px; LIST-STYLE-TYPE: none; FONT-FAMILY: \"微软雅黑\"; MARGIN-LEFT: 10px; FONT-SIZE: 16px; VERTICAL-ALIGN: middle; LIST-STYLE-IMAGE: none\r\n}\r\n.dk_wrap_content .dk_pinpai {\r\nMARGIN-TOP: 15px; WIDTH: 100%\r\n}\r\n.yybbox {\r\nZ-INDEX: 10; POSITION: absolute; FILTER: progid:DXImageTransform.Microsoft.Alpha(Opacity=50); PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; WIDTH: 320px; BOTTOM: 260px; PADDING-RIGHT: 15px; BACKGROUND: #fff; PADDING-TOP: 15px; LEFT: 25px; opacity: 0.5\r\n}\r\n.yyb {\r\nMARGIN: 6px auto 0px; WIDTH: 100%; BORDER-COLLAPSE: collapse; FONT-SIZE: 12px\r\n}\r\n.yyb THEAD TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; LINE-HEIGHT: 24px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; FONT-WEIGHT: bold; PADDING-TOP: 3px\r\n}\r\n.yyb TBODY TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; PADDING-TOP: 3px\r\n}\r\n.yyb TD.left {\r\nTEXT-ALIGN: left\r\n}\r\n.yyb TBODY TD.cet {\r\nTEXT-ALIGN: center; TEXT-INDENT: 0px\r\n}\r\n.yyb TD {\r\nBORDER-BOTTOM: #999 1px solid; BORDER-LEFT: #999 1px solid; BORDER-TOP: #999 1px solid; BORDER-RIGHT: #999 1px solid\r\n}</style>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711148355681', '0', 'a:5:{i:723;s:12:\"台湾地区\";i:724;s:6:\"河马\";i:725;s:6:\"牛奶\";i:726;s:6:\"Hemali\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('209', '358', '0', 'Hemali 河马莉 蛋酥 布丁 130g 台湾地区', 'Hemali 河马莉 蛋酥 布丁 130g 台湾地区', null, null, null, '1411/28/54782a1d71760.jpg', '15.90', '0.00', '1', '0', '0', '1412754500', '255', '1', '<div class=\"mt\" id=\"proDescVideo\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/28/54782a0334687.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a04a5fde.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a059a244.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a073a0a1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a08270d9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a08b4a48.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782a0932eeb.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<div class=\"detail_box\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescDijiaAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesZhengpinAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"oldForNewDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesTczgAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"contractPhoneAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"allInOneAds\" style=\"display:none;\">\r\n</div>\r\n<style type=\"text/css\">\r\n.dk_wrap_content {\r\nPADDING-BOTTOM: 5px; PADDING-LEFT: 5px; WIDTH: 750px; PADDING-RIGHT: 5px; OVERFLOW: hidden; PADDING-TOP: 5px\r\n}\r\n.dk_wrap_content .dk_a1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_t1 .dk_wrap_content .dk_t2 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nMARGIN-TOP: 15px; WIDTH: 751px; BORDER-COLLAPSE: collapse; MARGIN-BOTTOM: 10px; FONT-SIZE: 12px\r\n}\r\n.dk_wrap_content .dk_b1_left {\r\nWIDTH: 350px; FLOAT: left; HEIGHT: 350px; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1_left IMG {\r\nWIDTH: 350px; HEIGHT: 350px; VERTICAL-ALIGN: top\r\n}\r\n.dk_wrap_content .dk_b1_right {\r\nWIDTH: 400px; FLOAT: right; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_txt P {\r\nLINE-HEIGHT: 24px; FONT-FAMILY: 微软雅黑; FONT-SIZE: 16px\r\n}\r\n.dk_wrap_content .dk_txt {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_wrap_content .dk_pic {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_ull {\r\nPADDING-BOTTOM: 0px; LIST-STYLE-TYPE: none; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px\r\n}\r\n.dk_ull LI {\r\nBORDER-BOTTOM: #666 1px dotted; TEXT-ALIGN: left; LINE-HEIGHT: 34px; LIST-STYLE-TYPE: none; FONT-FAMILY: \"微软雅黑\"; MARGIN-LEFT: 10px; FONT-SIZE: 16px; VERTICAL-ALIGN: middle; LIST-STYLE-IMAGE: none\r\n}\r\n.dk_wrap_content .dk_pinpai {\r\nMARGIN-TOP: 15px; WIDTH: 100%\r\n}\r\n.yybbox {\r\nZ-INDEX: 10; POSITION: absolute; FILTER: progid:DXImageTransform.Microsoft.Alpha(Opacity=50); PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; WIDTH: 320px; BOTTOM: 268px; PADDING-RIGHT: 15px; BACKGROUND: #fff; PADDING-TOP: 15px; LEFT: 23px; opacity: 0.5\r\n}\r\n.yyb {\r\nMARGIN: 6px auto 0px; WIDTH: 100%; BORDER-COLLAPSE: collapse; FONT-SIZE: 12px\r\n}\r\n.yyb THEAD TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; LINE-HEIGHT: 24px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; FONT-WEIGHT: bold; PADDING-TOP: 3px\r\n}\r\n.yyb TBODY TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; PADDING-TOP: 3px\r\n}\r\n.yyb TD.left {\r\nTEXT-ALIGN: left\r\n}\r\n.yyb TBODY TD.cet {\r\nTEXT-ALIGN: center; TEXT-INDENT: 0px\r\n}\r\n.yyb TD {\r\nBORDER-BOTTOM: #999 1px solid; BORDER-LEFT: #999 1px solid; BORDER-TOP: #999 1px solid; BORDER-RIGHT: #999 1px solid\r\n}</style>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711148352239', '0', 'a:5:{i:723;s:12:\"台湾地区\";i:724;s:6:\"河马\";i:728;s:6:\"布丁\";i:726;s:6:\"Hemali\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('210', '358', '0', '婴儿饼干 儿童低糖饼干 Hemali河马莉牌综合水果味蛋酥130g 幼儿零食 儿童进口食品di', 'Hemali 河马莉 蛋酥 综合水果 130g 台湾地区', null, null, null, '1411/28/547821fecd483.jpg', '15.90', '0.00', '1', '0', '0', '1412754557', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/28/5478222a2dead.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478222e26a7c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478223101111.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478223303af5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782233e8739.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547822347dd05.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54782234e1aed.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711148352222', '0', 'a:6:{i:723;s:12:\"台湾地区\";i:724;s:6:\"河马\";i:729;s:6:\"水果\";i:726;s:6:\"Hemali\";i:730;s:6:\"综合\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('211', '358', '0', 'DANISA皇冠曲奇原味 90g（印尼进口 盒）', 'DANISA皇冠曲奇原味 90g（印尼进口 盒）', null, null, null, '1411/25/54742b920916b.jpg', '7.80', '0.00', '1', '0', '0', '1412754719', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/25/54742b81b7628.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b83530a2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b843e9cf.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b84be7b8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b85e1cf5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b869f1bd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b87c3ada.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b8832dca.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b8895f1f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b88dd38e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742b89a568d.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8996001303702', '0', 'a:7:{i:731;s:6:\"皇冠\";i:732;s:6:\"印尼\";i:733;s:6:\"曲奇\";i:588;s:6:\"原味\";i:734;s:6:\"进口\";i:735;s:6:\"DANISA\";i:692;s:3:\"90g\";}');
INSERT INTO `weixin_item` VALUES ('212', '358', '0', 'Danisa皇冠 曲奇 200g 印尼进口 罐装', 'Danisa皇冠 曲奇 200g 印尼进口 罐装', null, null, null, '1411/07/545c90740a736.jpg', '23.80', '0.00', '1', '0', '0', '1412754849', '255', '1', '<div class=\"mt\" id=\"proDescVideo\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c9054e6902.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c90571f97f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c9057e7170.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c9058c9391.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c905934c56.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c9059bd3b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c905a27eee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c905ab0eb0.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<span style=\"font-family:宋体;font-size:x-small;\"></span> \r\n<div class=\"mb\" id=\"prodDescDijiaAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesZhengpinAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"oldForNewDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesTczgAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"contractPhoneAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"allInOneAds\" style=\"display:none;\">\r\n</div>', '0', '1', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8996001303764', '0', 'a:7:{i:731;s:6:\"皇冠\";i:732;s:6:\"印尼\";i:733;s:6:\"曲奇\";i:736;s:6:\"罐装\";i:734;s:6:\"进口\";i:735;s:6:\"Danisa\";i:737;s:4:\"200g\";}');
INSERT INTO `weixin_item` VALUES ('213', '360', '0', '3点1刻 经典原味奶茶（袋泡茶）120g 台湾地区进口', '3点1刻 经典原味奶茶（袋泡茶）120g 台湾地区进口', null, null, null, '1411/25/54742d6d87f52.png', '15.00', '0.00', '1', '0', '0', '1412755986', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/25/54742d50ecc73.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d525a80e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d532fc62.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d539fc21.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d543ea87.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d5534dab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d562dbf4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d56d09ab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d57d6ea8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/25/54742d58a0b06.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712134660819', '0', 'a:7:{i:723;s:12:\"台湾地区\";i:738;s:9:\"袋泡茶\";i:588;s:6:\"原味\";i:739;s:6:\"奶茶\";i:734;s:6:\"进口\";i:582;s:6:\"经典\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('215', '360', '0', '3点1刻 经典炭烧奶茶（袋泡茶） 120g 台湾地区进口', '3点1刻 经典炭烧奶茶（袋泡茶） 120g 台湾地区进口', null, null, null, '1410/08/5434f2fc053d1.jpg', '15.00', '0.00', '1', '0', '0', '1412756225', '255', '1', '<div class=\"mt\" id=\"proDescVideo\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f2fc60faf.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span> \r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"50%\">\r\n				<p style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\">\r\n					<strong>原&nbsp; 产 地：</strong>台湾地区<br />\r\n<strong>商品名称：</strong>三点一刻 经典炭烧奶茶（袋泡茶）<br />\r\n<strong>净&nbsp; 含 量：</strong>120克（20克×6包）<br />\r\n<strong>配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 料：</strong>红茶、植脂末（玉米糖浆、白砂糖、氢化植物油、酪蛋白酸钠、磷酸氢二钾、单脂肪酸甘油酯、硬脂酰乳酸钠、卡拉胶、硅铝酸钠、胭脂树橙、食用香料）、白砂糖<br />\r\n<strong>贮存条件：</strong>开封后尽早饮用，避免直接日照，置于阴凉干燥处<br />\r\n<strong>保&nbsp; 质 期：</strong>24个月\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span> <img src=\"./data/upload/editer/image/2014/12/02/547d66b5b287d.jpg\" alt=\"\" /><br />\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span> \r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f2fec9fe8.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/08/5434f2ffcaaa7.jpg\" /><br />\r\n<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f3003ae84.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span> \r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f300bbee1.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div class=\"detail_box\">\r\n	<p class=\"detail_page_t shangjiaDesTemp\" id=\"shangjiaDesTemp_0\" name=\"品牌介绍\">\r\n		<br />\r\n	</p>\r\n	<p class=\"p_detail\">\r\n		<table width=\"750\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n			<tbody>\r\n				<tr>\r\n					<td width=\"35%\">\r\n						<img src=\"/data/upload/item/1410/08/5434f30105b21.jpg\" /> \r\n					</td>\r\n					<td width=\"65%\">\r\n						<span style=\"font-size:20px;\"><strong>三点一刻</strong></span>是石城实业旗下知名品牌，产品涵盖奶茶、咖啡、传统养生饮品以及点心等。其中以三点一刻奶茶知名度最高，是台湾下午茶的代名词与奶茶市场的代言人，其销售触角更扩及欧洲市场。 <br />\r\n<br />\r\n累积三代八十年种植与制茶经验，为了树立“新茶文化”的理想，石城实业于1990年成立，以台湾中部地区为据点，率先推出茶包式“三点一刻”奶茶，将开始推动“新茶文化”。&nbsp;\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</p>\r\n</div>\r\n<div class=\"mb\" id=\"prodDescDijiaAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesZhengpinAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"oldForNewDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesTczgAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"contractPhoneAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"allInOneAds\" style=\"display:none;\">\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712134660826', '0', 'a:6:{i:723;s:12:\"台湾地区\";i:738;s:9:\"袋泡茶\";i:739;s:6:\"奶茶\";i:734;s:6:\"进口\";i:582;s:6:\"经典\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('216', '360', '0', '3点1刻 经典港式奶茶（袋泡茶） 120g 台湾地区进口', '3点1刻 经典港式奶茶（袋泡茶） 120g 台湾地区进口', null, null, null, '1410/08/5434f35159956.jpg', '15.00', '0.00', '1', '0', '0', '1412756311', '255', '1', '<div class=\"mt\" id=\"proDescVideo\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f3516a9c9.jpg\" /><strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">原&nbsp; 产 地：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">台湾地区</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">商品名称：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">三点一刻 经典港式奶茶（袋泡茶）</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">净&nbsp; 含 量：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">120克（20克×6包）</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 料：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">咖啡豆、红茶、植脂末（玉米糖浆、氢化植物油、白砂糖、酪蛋白酸钠、磷酸氢二钾、单脂肪酸甘油酯、硬脂酰乳酸钠、卡拉胶、硅铝酸钠、胭脂树橙、食用香料）、白砂糖</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">贮存条件：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">开封后尽早饮用，避免直接日照，置于阴凉干燥处</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;white-space:normal;\">保&nbsp; 质 期</strong><strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">24个月</span><span style=\"font-size:13.3333339691162px;font-family:微软雅黑;line-height:23.9999980926514px;\"></span><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\"></span><span style=\"font-size:12px;line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/12/02/547d65d58b588.jpg\" alt=\"\" style=\"line-height:23.9999980926514px;font-size:13.3333339691162px;\" />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span><img src=\"./data/upload/editer/image/2014/12/02/547d667d9b39e.jpg\" alt=\"\" /><br />\r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f35530290.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/08/5434f355bde71.jpg\" /><br />\r\n<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f356657a6.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"line-height:24px;font-family:微软雅黑;font-size:16px;\"></span> \r\n<table width=\"770\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/08/5434f3575fa46.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div class=\"detail_box\">\r\n	<p class=\"detail_page_t shangjiaDesTemp\" id=\"shangjiaDesTemp_0\" name=\"品牌介绍\">\r\n		<br />\r\n	</p>\r\n	<p class=\"p_detail\">\r\n		<table width=\"750\" class=\"ke-zeroborder\" border=\"0\" cellspacing=\"10\" cellpadding=\"10\">\r\n			<tbody>\r\n				<tr>\r\n					<td width=\"35%\">\r\n						<img src=\"/data/upload/item/1410/08/5434f357bf374.jpg\" /> \r\n					</td>\r\n					<td width=\"65%\">\r\n						<span style=\"font-size:20px;\"><strong>三点一刻</strong></span>是石城实业旗下知名品牌，产品涵盖奶茶、咖啡、传统养生饮品以及点心等。其中以三点一刻奶茶知名度最高，是台湾下午茶的代名词与奶茶市场的代言人，其销售触角更扩及欧洲市场。 <br />\r\n<br />\r\n累积三代八十年种植与制茶经验，为了树立“新茶文化”的理想，石城实业于1990年成立，以台湾中部地区为据点，率先推出茶包式“三点一刻”奶茶，将开始推动“新茶文化”。&nbsp;\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</p>\r\n</div>\r\n<div class=\"mb\" id=\"prodDescDijiaAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesZhengpinAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"oldForNewDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDescTopAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"prodDesTczgAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"contractPhoneAds\" style=\"display:none;\">\r\n</div>\r\n<div class=\"mb\" id=\"allInOneAds\" style=\"display:none;\">\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712134660833', '0', 'a:7:{i:723;s:12:\"台湾地区\";i:738;s:9:\"袋泡茶\";i:741;s:6:\"港式\";i:739;s:6:\"奶茶\";i:734;s:6:\"进口\";i:582;s:6:\"经典\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('218', '367', '0', ' 清扬女士去屑洗发露多效水润养护型', ' 清扬女士去屑洗发露多效水润养护型', null, null, null, '1410/09/5435f4f08f5e8.png', '20.50', '0.00', '1', '0', '0', '1412822259', '255', '1', '<!--StartFragment -->\r\n<div>\r\n	<br />\r\n	<h3 class=\"f14 a1\">\r\n		持久去屑，水润柔滑秀发。\r\n	</h3>\r\n	<div class=\"detail-show fix\" id=\"productDetail\">\r\n		<p>\r\n			产品介绍：<br />\r\n全新清扬女士系列，比原清扬多添加2倍维他命原B5。权威实验室测试证明，全新清扬令秀发更柔顺，更强韧，有效减少断发。其专利\"小粒径去屑成分ZPT\"，更可高效抵达每一寸头皮肌肤，去屑显著。<br />\r\n清新女士多效水润养护去屑洗发露，新配方芳香升级，针对头皮、头发干燥缺水、无光彩的发质，持久去屑，水润柔滑秀发。拥有的滋养因子10，去屑同时，更能滋养呵护每一寸头皮，令秀发水润健康有光泽。<br />\r\n品牌：&nbsp;&nbsp;&nbsp; 清扬女士去屑洗发露多效水润养护型<br />\r\n产品规格：175ml<br />\r\n保质期：3年<br />\r\n产品功效： 水润去屑、秀发柔滑有光泽<br />\r\n产地： 安徽<br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f106844.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f14e86b.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f188ed2.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f1ca571.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f230304.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f26da63.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f2aab4e.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f4f2f3366.jpg\" /><br />\r\n<br />\r\n<br />\r\n适合发质：头皮、头发干燥缺水、无光彩<br />\r\n产品说明： 全新配方芳香升级，持久去屑，水润柔滑秀发。<br />\r\n使用方法：湿发后，取适量本品均匀涂抹在头发头皮，按摩至充分起泡，然后洗净。需要时刻重复使用。配合清扬洗后护理系列使用，效果更佳。 <br />\r\n品牌故事： <br />\r\n清扬，享誉世界的国际去屑洗发水品牌，在全球获得超过1亿消费者的青睐。 自2007年，清扬品牌全面进驻中国之后，以其出众的去屑表现迅速赢得消费者的信赖与喜爱。其前卫时尚，充满挑战精神的品牌个性，更是受到年轻、时尚，中高端消费群的推崇。<br />\r\n2011年，清扬全线产品重装升级，法国清扬研发中心的最新科技\"滋养因子10\"深入滋养头皮，带来三重头皮保护，从根源解决头屑及头皮问题。更特别针对男女头皮头发特质，分别研发男女系列产品，终结头屑, 头痒，干燥，油腻等头皮问题。\r\n		</p>\r\n	</div>\r\n</div>', '0', '0', '17', '0', '39', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088113716', '0', '');
INSERT INTO `weixin_item` VALUES ('219', '367', '0', 'CLEAR清扬男士去屑洗发露活炭净爽型175ml', 'CLEAR清扬男士去屑洗发露活炭净爽型175ml', null, null, null, '1410/09/5435f61d2c45d.jpg', '21.80', '0.00', '1', '0', '0', '1412822560', '255', '1', '<h2>\r\n	商品描述\r\n</h2>\r\n<div class=\"content\">\r\n	<h3 class=\"productDescriptionSource\">\r\n		商品描述\r\n	</h3>\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"aplus\">\r\n			<p>\r\n				<div class=\"aplus\">\r\n					<h5>\r\n						CLEAR清扬男士洗发露活炭净爽型175ml\r\n					</h5>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61e387b7.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61e896df.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<table width=\"750\">\r\n						<tbody>\r\n							<tr>\r\n								<th>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\">\r\n									<img src=\"/data/upload/item/1410/09/5435f61e9fa21.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</td>\r\n								<td>\r\n									<h4>\r\n										清扬男士洗发露活炭净爽型175ml\r\n									</h4>\r\n<strong>产地：</strong>中国<br />\r\n<strong>规格：</strong>175ml<br />\r\n<strong>保质期：</strong>三年<br />\r\n<strong>适合人群：</strong>适用各种头皮和发质<br />\r\n<br />\r\n<strong>产品功效/特点：</strong><br />\r\n特别为男士研制了男士滋养因子10，蕴涵多种营养成分，维他命，矿物质及多种植物精萃。能深层滋润男士的头皮，焕活头皮天然保护层。给予更持久的去屑保护。<br />\r\n<strong>使用方法：</strong><br />\r\n湿发后，取适量本品按摩头发头皮，按摩至充分起泡，然后洗净，需要时可重复使用。配合清扬洗后护理系列使用，效果更佳。<br />\r\n<strong>注意：</strong>不慎入眼，即冲洗。<br />\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61ebae43.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<table width=\"750\">\r\n						<tbody>\r\n							<tr>\r\n								<th>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\">\r\n									<img src=\"/data/upload/item/1410/09/5435f61ed3ca9.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</td>\r\n								<td align=\"center\">\r\n									<img src=\"/data/upload/item/1410/09/5435f61ee3c02.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</td>\r\n								<td align=\"center\">\r\n									<img src=\"/data/upload/item/1410/09/5435f61ef39e1.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\">\r\n									<strong>2012年度</strong> <br />\r\n最具劲爽 <br />\r\n风度选择奖\r\n								</td>\r\n								<td align=\"center\">\r\n									<strong>第八届</strong> <br />\r\n男士体面大奖\r\n								</td>\r\n								<td align=\"center\">\r\n									<strong>2012年</strong><br />\r\n时尚先生<br />\r\n年度美容之选\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61f11691.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61f2646c.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61f55c90.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61f67c3d.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61fb0b77.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<table width=\"750\">\r\n						<tbody>\r\n							<tr>\r\n								<th>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<th>\r\n									<img src=\"/data/upload/item/1410/09/5435f61fc61cb.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\">\r\n									<strong>2014年4月，清扬正式成为NBA中国官方合作伙伴。</strong><br />\r\n由此，清扬将带给广大的中国篮球粉丝一系列精彩纷呈的篮球体验之旅<br />\r\n清扬一直以来坚持追求无屑可击的冠军表现和不断挑战的精神，<br />\r\n这与NBA赛场崇尚的体育竞技精神完美吻合。\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f61fef0f0.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n					<table width=\"750\">\r\n						<tbody>\r\n							<tr>\r\n								<th>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<th>\r\n									<img src=\"/data/upload/item/1410/09/5435f6200e69f.jpg\" />\r\n									<noscript>\r\n										<img />\r\n									</noscript>\r\n								</th>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\">\r\n									<strong>清扬(CLEAR)诞生于1973年，是全球著名消费品公司联合利华(Unilever)旗下专业去屑洗护发品牌。<br />\r\n2007年清扬进入中国市场，率先针对男性、女性头皮状况提出\'去屑分男女\'概念。<br />\r\n始终不惧挑战，勇攀巅峰的清扬，以简短而有力的\'无屑可击, 无需隐藏\'的品牌精神，聚集了大量关注度和良好口碑。</strong>\r\n								</td>\r\n							</tr>\r\n						</tbody>\r\n					</table>\r\n					<div class=\"leftImage\">\r\n						<img src=\"/data/upload/item/1410/09/5435f62031354.jpg\" />\r\n						<noscript>\r\n							<img />\r\n						</noscript>\r\n					</div>\r\n					<div class=\"break\">\r\n					</div>\r\n				</div>\r\n				<p>\r\n					<br />\r\n				</p>\r\n					</div>\r\n					<div class=\"emptyClear\">\r\n					</div>\r\n				</div>\r\n					</div>', '0', '0', '1', '0', '39', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088115413', '0', '');
INSERT INTO `weixin_item` VALUES ('221', '367', '0', '清扬男士洗发露多效水润养护型175ml', '清扬男士洗发露多效水润养护型175ml', null, null, null, '1410/09/5435f77c9bbb0.jpg', '20.50', '0.00', '1', '0', '0', '1412822912', '255', '1', '<br />\r\n<img src=\"/data/upload/item/1410/09/5435f77d29246.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f77dd2d1d.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f77e58c6c.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f77ea45f4.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f77f74142.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f780003ba.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435f780792b8.jpg\" /><br />\r\n<br />\r\n&nbsp;&nbsp;', '0', '0', '6', '0', '39', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088113723', '0', '');
INSERT INTO `weixin_item` VALUES ('222', '367', '0', '力士灵动丰盈洗发乳400ml', '力士灵动丰盈洗发乳400ml', null, null, null, '1410/09/5435fa04cc2e1.png', '31.80', '0.00', '1', '0', '0', '1412823563', '255', '1', '<br />\r\n<img src=\"/data/upload/item/1410/09/5435fa054a71d.jpg\" /> <br />\r\n<img src=\"/data/upload/item/1410/09/5435fa05a4b07.jpg\" /> <br />\r\n<img src=\"/data/upload/item/1410/09/5435fa0729d67.jpg\" /> <br />\r\n<img src=\"/data/upload/item/1410/09/5435fa0905898.jpg\" /> <br />\r\n<img src=\"/data/upload/item/1410/09/5435fa0ac0667.jpg\" /> <br />\r\n<img src=\"/data/upload/item/1410/09/5435fa0b00342.jpg\" />&nbsp;', '0', '0', '7', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088114089', '0', '');
INSERT INTO `weixin_item` VALUES ('223', '367', '0', '力士水润丝滑洗发乳清爽去屑型400ml', '力士水润丝滑洗发乳清爽去屑型400ml', null, null, null, '1410/09/5435fc3c779fe.png', '31.80', '0.00', '1', '0', '0', '1412824129', '255', '1', '<h3 class=\"f14 a1\">\r\n	深度渗透滋养，预防分叉，丝般顺滑，修护受损。\r\n</h3>\r\n<div class=\"detail-show fix\" id=\"productDetail\">\r\n	<img src=\"/data/upload/item/1410/09/5435fc3ce0169.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3d236ec.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3d5c2d7.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3daf3d2.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3e0e54f.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3e41366.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3e79f86.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3f098c3.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3f6fa25.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc3fc1c30.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc401ff60.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc4059dde.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/5435fc41194c6.jpg\" />\r\n</div>\r\n<p>\r\n	&nbsp;\r\n</p>', '0', '0', '5', '0', '28', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088114027', '0', '');
INSERT INTO `weixin_item` VALUES ('224', '347', '0', '雕牌透明皂202g阳光清柠', '雕牌透明皂202g阳光清柠', null, null, null, '1410/27/544df8e8c3e73.png', '3.90', '0.00', '1', '0', '0', '1412824546', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544df8a2f101c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8a73954f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8ab88484.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8b0514ee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8b35bc68.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8b8e1e1c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8bf747ac.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544df8c0dc92f.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '31', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6910019010188', '0', 'a:3:{i:749;s:6:\"透明\";i:750;s:6:\"阳光\";i:751;s:4:\"202g\";}');
INSERT INTO `weixin_item` VALUES ('225', '366', '0', '六神清凉爽肤沐浴露（瓶装 450ml）芦荟', '六神清凉爽肤沐浴露（瓶装 450ml）芦荟', null, null, null, '1411/07/545c9882da8c5.jpg', '17.60', '0.00', '1', '0', '0', '1412825426', '255', '1', '<dt>\r\n	<br />\r\n</dt>\r\n<div class=\"mod_goods_contmain\">\r\n	<center>\r\n		<img src=\"/data/upload/item/1410/09/54360151b63fb.jpg\" />&nbsp;&nbsp;\r\n	</center>\r\n<table width=\"750\" class=\"ke-zeroborder\" style=\"font:12px/20px \" color:#676767;font-size-adjust:none;font-stretch:normal;\"=\"\" bgcolor=\"#e4e4e4\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n		<tr>\r\n		</tr>\r\n		<tr>\r\n		</tr>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n		</table>\r\n		<table width=\"985\" class=\"ke-zeroborder\" style=\"margin:0px auto;text-align:center;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n			</div>\r\n			<p style=\"text-align:center;\">\r\n				<img src=\"./data/upload/editer/image/2014/11/07/545c9767bb5f9.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/07/545c97e843ec2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c976c8dd00.jpg\" alt=\"\" /> \r\n			</p>', '1', '0', '0', '0', '42', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901294171213', '0', 'a:6:{i:620;s:6:\"六神\";i:621;s:9:\"沐浴露\";i:602;s:6:\"瓶装\";i:636;s:6:\"芦荟\";i:622;s:6:\"清凉\";i:623;s:5:\"450ml\";}');
INSERT INTO `weixin_item` VALUES ('226', '366', '0', '六神清香爽肤沐浴露(450ml)', '六神清香爽肤沐浴露(450ml)', null, null, null, '1411/07/545c9611bf861.jpg', '19.80', '0.00', '1', '0', '0', '1412825655', '255', '1', '<h2>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"> \r\n	<h2 style=\"white-space:normal;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/07/545c92e6a9efa.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/07/545c92dbe2b96.jpg\" alt=\"\" style=\"font-size:small;color:#666666;line-height:18px;font-weight:normal;background-color:#FFFFFF;\" /><img src=\"./data/upload/editer/image/2014/11/07/545c92e0b6dfb.jpg\" alt=\"\" style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;font-size:12px;font-weight:normal;line-height:1.5;\" /><img src=\"/data/upload/editer/image/2014/11/07/545c932a7268b.jpg\" alt=\"\" style=\"font-family:\'sans serif\', tahoma, verdana, helvetica;font-size:12px;font-weight:normal;line-height:1.5;\" /> \r\n	</h2>\r\n</span> \r\n</h2>\r\n<div class=\"aplus\">\r\n	<noscript>\r\n		<img alt=\"”六神清香爽肤沐浴露450ml”\" /> \r\n	</noscript>\r\n</div>\r\n<div class=\"aplus\">\r\n	<div class=\"break\">\r\n	</div>\r\n</div>\r\n<div class=\"emptyClear\">\r\n</div>', '1', '0', '2', '0', '42', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901294175365', '0', 'a:4:{i:620;s:6:\"六神\";i:621;s:9:\"沐浴露\";i:752;s:6:\"清香\";i:623;s:5:\"450ml\";}');
INSERT INTO `weixin_item` VALUES ('228', '358', '0', 'Love Of Office Lady小资女之恋草莓巧克力杏仁卷心酥(代可可脂)80g(台湾进口)', 'Love Of Office Lady小资女之恋草莓巧克力杏仁卷心酥(代可可脂)80g(台湾进口)', null, null, null, '1410/09/54363def3a9fc.jpg', '14.70', '0.00', '1', '0', '0', '1412840949', '255', '1', '<h2>\r\n	<ul class=\"detail-list\" style=\"padding:0px;margin:0px;list-style:none;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">\r\n		商品名称:小资女之恋卷心酥<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n品牌: LOVE OF OFFICE LADY/小资女之恋&nbsp;<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n商品毛重:138.00g<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n商品产地:中国台湾<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n类别:其他<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n包装:盒装<br style=\"padding:0px;margin:0px;\" />\r\n<br style=\"padding:0px;margin:0px;\" />\r\n口味:巧克力味<br style=\"padding:0px;margin:0px;\" />\r\n	</ul>\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">如果您发现商品信息不准确, 欢迎纠错</span><img src=\"/data/upload/item/1410/09/54363defdffc7.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">&nbsp;产品信息Product Information&nbsp;</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">品名:小资女之恋草莓巧克力杏仁卷心酥</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">配料:杏仁粒、白巧克力、糙米、玉米、大米、蛋黄粉、白砂糖、食盐、植物油、酱油粉、草莓果粒、麦芽糊精等</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">规格:80克</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">保质期:10个月</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">产地:中国台湾</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">储存方式:置于阴凉干燥处</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<img src=\"/data/upload/item/1410/09/54363df0a3328.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">&nbsp;</span><br style=\"padding:0px;margin:0px;font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">产品细节Product Details</span><img src=\"/data/upload/item/1410/09/54363df0da81f.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df1420ed.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df1b14f2.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df216da7.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df271efa.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df2ab925.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df3167e7.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df33ce1f.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df3d3030.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df4511f3.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df4a2dd6.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\"></span><img src=\"/data/upload/item/1410/09/54363df54490a.jpg\" /><span style=\"font-family:宋体;font-size:16px;line-height:20px;white-space:normal;background-color:#FFFFFF;\">&nbsp;温馨提示 根据国家相关法律规定,此类商品属于特殊商品,一经售出,非质量问题,概不退换,请见谅!</span><br />\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710218901728', '0', 'a:10:{i:754;s:6:\"台湾\";i:638;s:6:\"杏仁\";i:755;s:6:\"小资\";i:756;s:6:\"可可\";i:678;s:6:\"草莓\";i:757;s:9:\"巧克力\";i:734;s:6:\"进口\";i:758;s:6:\"Office\";i:760;s:4:\"Lady\";i:759;s:4:\"Love\";}');
INSERT INTO `weixin_item` VALUES ('230', '358', '0', 'Love Of Office Lady小资女之恋白巧克力杏仁卷心酥(代可可脂)80g(台湾进口)', 'Love Of Office Lady小资女之恋白巧克力杏仁卷心酥(代可可脂)80g(台湾进口)', null, null, null, '1410/09/543648a7866b5.jpg', '13.80', '0.00', '1', '0', '0', '1412841942', '255', '1', '<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d28c84e.jpg\" /> \r\n	</div>\r\n</div>\r\n<table width=\"750\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"6\" style=\"empty-cells:show;color:#666666;font-family:Arial, Verdana, 宋体;font-size:12px;line-height:18px;background-color:#FFFFFF;\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/543641d31fd71.jpg\" /> \r\n			</td>\r\n			<td>\r\n				<p class=\"formwork_titleleft\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:25px;font-size:14px;font-weight:700;\">\r\n					<br />\r\n				</p>\r\n				<p class=\"formwork_titleleft2\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:25px;font-size:14px;\">\r\n					品名：小资女之恋白巧克力杏仁卷心酥<br />\r\n配料:杏仁粒、白巧克力、糙米、玉米、大米、蛋黄粉、白砂糖、食盐、植物油、酱油粉、麦芽糊精等<br />\r\n规格：80克<br />\r\n保质期：10个月<br />\r\n产地：中国台湾<br />\r\n储存方式：置于阴凉干燥处\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d378b4f.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d4048e7.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d44ca25.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d4e6125.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;color:#666666;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n		<img src=\"/data/upload/item/1410/09/543641d5d3daa.jpg\" /> \r\n	</div>\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710218901216', '0', 'a:10:{i:754;s:6:\"台湾\";i:638;s:6:\"杏仁\";i:755;s:6:\"小资\";i:756;s:6:\"可可\";i:757;s:9:\"巧克力\";i:734;s:6:\"进口\";i:758;s:6:\"Office\";i:760;s:4:\"Lady\";i:759;s:4:\"Love\";i:761;s:3:\"80g\";}');
INSERT INTO `weixin_item` VALUES ('231', '358', '0', 'Love Of Office Lady小资女之恋酸奶巧克力扁桃仁卷心酥(代可可脂)80g(台湾进口)', 'Love Of Office Lady小资女之恋酸奶巧克力扁桃仁卷心酥(代可可脂)80g(台湾进口)', null, null, null, '1410/09/543658eec66e2.jpg', '14.70', '0.00', '1', '0', '0', '1412847855', '255', '1', '<img src=\"/data/upload/item/1410/09/543658ef23d1d.jpg\" />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710938102139', '0', 'a:10:{i:769;s:6:\"桃仁\";i:754;s:6:\"台湾\";i:770;s:6:\"酸奶\";i:755;s:6:\"小资\";i:756;s:6:\"可可\";i:757;s:9:\"巧克力\";i:734;s:6:\"进口\";i:758;s:6:\"Office\";i:760;s:4:\"Lady\";i:759;s:4:\"Love\";}');
INSERT INTO `weixin_item` VALUES ('233', '358', '0', 'Hamu 手工蛋片（原味）130g/盒', 'Hamu 手工蛋片（原味）130g/盒', null, null, null, '1410/09/543661329cf56.jpg', '10.30', '0.00', '1', '0', '0', '1412849975', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/543661332657e.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span style=\"font-size:small;\"><span style=\"line-height:normal;\"><br />\r\n</span></span>\r\n<p>\r\n	<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">品名：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">手工蛋片 (原味)</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">净含量：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">130克</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">配料：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">鲜鸡蛋、白砂糖、小麦粉、精制植物油、复配膨松剂（硫酸铝钾、碳酸氢钠、碳酸钙、小麦粉）</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">保质期：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">1年</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产地：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">广东汕头</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产品类型：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">蛋卷</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产品标准代号：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">GB/T 20980</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">食品生产许可证编号：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">QS4405 0801 0376</span><br style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">贮藏方式：</strong><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">拆封后请尽早食用，避免阳光直射及高温潮湿，请放于干凉处，若发现包装破损，品质有异请来电咨询。</span><span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\"></span><span style=\"font-size:13.3333339691162px;white-space:normal;\"></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\"><img src=\"./data/upload/editer/image/2014/12/02/547d62e886144.png\" alt=\"\" /><br />\r\n<br />\r\n</span>\r\n</p>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/54366135395ae.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/54366135bac44.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/54366136393a6.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/54366136ab200.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/5436613735ca1.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/5436613796863.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713507018992', '0', 'a:4:{i:588;s:6:\"原味\";i:771;s:6:\"手工\";i:772;s:4:\"Hamu\";i:773;s:3:\"130\";}');
INSERT INTO `weixin_item` VALUES ('235', '358', '0', 'Hamu 手工蛋片（黑芝麻味）130g/盒', 'Hamu 手工蛋片（黑芝麻味）130g/盒', null, null, null, '1410/09/54366232401e6.jpg', '10.30', '0.00', '1', '0', '0', '1412850230', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/09/54366232d2632.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">品名：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">手工蛋片(黑芝麻味)</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">净含量：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">130克</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">配料：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">鲜鸡蛋、白砂糖、小麦粉、黑芝麻、精制植物油、复配膨松剂（硫酸铝钾、碳酸氢钠、碳酸钙、小麦粉）</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">保质期：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">1年</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产地：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">广东汕头</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产品类型：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">蛋卷</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">产品标准代号：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">GB/T 20980</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">食品生产许可证编号：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">QS4405 0801 0376</span><br style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\" />\r\n<p>\r\n	<strong style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">贮藏方式：</strong><span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\">拆封后请尽早食用，避免阳光直射及高温潮湿，请放于干凉处，若发现包装破损，品质有异请来电咨询。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑;font-size:15.5555562973022px;line-height:23.9999980926514px;\"><img src=\"/data/upload/item/1410/09/543662334ce4a.jpg\" style=\"font-size:13.3333339691162px;white-space:normal;\" /></span>\r\n</p>\r\n<div>\r\n	<span style=\"font-size:13.3333339691162px;\"></span> \r\n	<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n		</tbody>\r\n	</table>\r\n	<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<img src=\"/data/upload/item/1410/09/5436623477399.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/54366234e3ead.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/543662355c5db.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/09/54366235c508c.jpg\" /> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<img src=\"/data/upload/item/1410/09/5436623646d8d.jpg\" /> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<img src=\"/data/upload/item/1410/09/54366236ad11e.jpg\" /> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n	<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n	</div>\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713507018954', '0', 'a:4:{i:774;s:9:\"黑芝麻\";i:771;s:6:\"手工\";i:772;s:4:\"Hamu\";i:773;s:3:\"130\";}');
INSERT INTO `weixin_item` VALUES ('237', '358', '0', '港澳第壹家 绿茶酥 120g', '港澳第壹家 绿茶酥 120g', null, null, null, '1410/09/5436664a01f35.gif', '15.50', '0.00', '1', '0', '0', '1412851278', '255', '1', '<img src=\"/data/upload/item/1410/09/5436664bb4a73.gif\" /><img src=\"/data/upload/item/1410/09/5436664c04929.gif\" /><img src=\"/data/upload/item/1410/09/5436664c45e34.gif\" /><img src=\"/data/upload/item/1410/09/5436664ca5ee1.gif\" /><img src=\"/data/upload/item/1410/09/5436664d1110f.gif\" /><img src=\"/data/upload/item/1410/09/5436664d6f4e0.gif\" /><img src=\"/data/upload/item/1410/09/5436664de094f.gif\" />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897033830546', '0', 'a:3:{i:632;s:6:\"绿茶\";i:775;s:6:\"港澳\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('238', '358', '0', '港澳第壹家 千层酥 120g', '港澳第壹家 千层酥 120g', null, null, null, '1410/09/54366851a03f6.jpg', '15.50', '0.00', '1', '0', '0', '1412851799', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-family:宋体;line-height:normal;text-align:center;white-space:normal;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-family:宋体;line-height:normal;text-align:center;white-space:normal;\">\r\n	<img src=\"/data/upload/item/1410/09/543668536ff4e.jpg\" /><img src=\"/data/upload/item/1410/09/54366855b6942.jpg\" /><img src=\"/data/upload/item/1410/09/54366857061a0.jpg\" />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897033830515', '0', '');
INSERT INTO `weixin_item` VALUES ('240', '358', '0', '港澳第壹家 鷄仔餠 120g', '港澳第壹家 鷄仔餠 120g', null, null, null, '1410/09/54366940a633a.png', '15.50', '0.00', '1', '0', '0', '1412852035', '255', '1', '<img src=\"/data/upload/item/1410/09/54366941897a5.gif\" /><img src=\"/data/upload/item/1410/09/54366941cc4d1.gif\" /><img src=\"/data/upload/item/1410/09/543669421a8a1.gif\" /><img src=\"/data/upload/item/1410/09/5436694270257.gif\" /><img src=\"/data/upload/item/1410/09/54366942cf0dd.gif\" /><img src=\"/data/upload/item/1410/09/543669433c4b4.gif\" /><img src=\"/data/upload/item/1410/09/54366943aef8b.gif\" />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897033830539', '0', 'a:2:{i:775;s:6:\"港澳\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('241', '358', '0', '港澳第壹家 椰蓉酥 120g', '港澳第壹家 椰蓉酥 120g', null, null, null, '1410/09/54366b1605739.png', '15.50', '0.00', '1', '0', '0', '1412852502', '255', '1', '<img src=\"./data/upload/editer/image/2014/10/09/54366ad8063d8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/09/54366adc2dad0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/09/54366ade5818f.png\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897033830560', '0', '');
INSERT INTO `weixin_item` VALUES ('242', '358', '0', '十月初五 鲍鱼酥（酥性饼干）150g', '十月初五 鲍鱼酥（酥性饼干）150g', null, null, null, '1410/10/54373d0e38d12.jpg', '8.60', '0.00', '1', '0', '0', '1412906258', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373d0ea0946.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/54373d0f240b1.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/54373d0fb5514.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\"></span>&nbsp;\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">澳 门十月初五饼家按国际烘焙类食品卫生标准规划设计，设有现代化的成品仓、带有参观通道</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">的生产线、具有现代化设备的新产品研发中心和通过国家级认证的品质检 验控制中心等。具备</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">一批优秀的技术开发专业人员和生产管理人员，根据市场的变化，不断的开发研制色、香、味俱</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">全的新产品。人手把关+仪器监测，追求每一个 细节的完美无暇。</span> \r\n</p>\r\n<span style=\"margin:0px;padding:0px;white-space:normal;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;background-color:#FFFFFF;\"></span><span style=\"color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\"></span> \r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<img src=\"/data/upload/item/1410/10/54373d10250d1.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\"></span>&nbsp;\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">本产品采用了低胆固醇的植物油，最适合现代人的健康饮食。独立包装，卫生又方便，再不怕因</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">短时间内吃不完时容易受潮，而影响口感和味道，真的是一种健康、美味的食品。精美包装，做</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;color:#000000;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;\">为手信礼品赠送亲朋好友，是非常不错的选择</span> \r\n</p>\r\n<span style=\"margin:0px;padding:0px;white-space:normal;font-size:18px;line-height:27px;font-family:tahoma, arial, 宋体, sans-serif;text-align:center;background-color:#FFFFFF;\"></span><span style=\"color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\"></span> \r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<img src=\"/data/upload/item/1410/10/54373d10d6b11.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n<img src=\"/data/upload/item/1410/10/54373d11796be.jpg\" /> \r\n</p>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801535', '0', 'a:5:{i:777;s:6:\"鲍鱼\";i:778;s:6:\"初五\";i:721;s:6:\"饼干\";i:779;s:6:\"十月\";i:780;s:4:\"150g\";}');
INSERT INTO `weixin_item` VALUES ('243', '358', '0', '十月初五 椰蓉酥 78g', '十月初五 椰蓉酥 78g', null, null, null, '1410/10/54373e864b09c.jpg', '7.90', '0.00', '1', '0', '0', '1412906635', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">品名：十月初五椰蓉酥</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">品牌：十月初五</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">规格：78g</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">配料：小麦粉、白砂糖、椰蓉、人造奶油、（牛油、棕榈油、大豆油）、起酥油、芝麻、鸡蛋、花生、（树）坚果及乳制品 食品添加剂</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">保质期：365 天</span> \r\n</p>\r\n<p span=\"\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;white-space:normal;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e86ca575.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">商品特色</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;<img src=\"/data/upload/item/1410/10/54373e873326e.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e87f17cc.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e88e82d4.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">新鲜松化，甘香可口，浓浓的椰子味，令人回味无穷。</span> \r\n</p>\r\n<p span=\"\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;white-space:normal;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;background-color:#FFFFFF;\">\r\n	挑选新鲜鸡蛋加上其他新鲜配料，混合天然椰子丝，烤出金黄浑圆的椰蓉酥，散发出特有的椰香。让人垂涎。椰子，含丰富维生素、氨基酸和符合多糖物质，是营养保健的天然绿茶食品。椰肉经加工成椰蓉，其具备椰汁与椰肉富含蛋白质、果糖、葡萄糖、蔗糖、脂肪、维生素B1、维生素E、维生素C、钾、钙、镁等成分之特点。采用了低胆固醇的植物油，最适合现代人的健康饮食习惯。是一种健康、美味的食品。\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e8981b21.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e8a4a862.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;<img src=\"/data/upload/item/1410/10/54373e8ad23e6.jpg\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">企业简介</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p align=\"center\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/10/54373e8b218b3.gif\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"line-height:2;font-family:\'Microsoft YaHei\';color:#C8B537;font-size:16px;\">“十月初五”品牌诞生源自澳门的一条特色街——十月初五日街。该街以前名叫泗孟街，差不过有一百年的历史。当年该街两旁店铺林立，土特产以澳门传统家庭手工作坊制作，风味独特，具有浓郁的澳葡特色。如今的澳门十月初五饼家秉承了澳门百年传统手工制作工艺，从传统家庭手作坊制作演变成拥有先进电脑监控设施、专业研发中心及品质检验检测中心的大型手工流水线工厂，坚持从选材抓起，由专人选取国内外最上乘的原材料，从研制、烘烤，每一件糕点坚持由老师傅巧手精制而成，保持着正宗的澳门特色风味。。</span> \r\n</p>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801511', '0', 'a:4:{i:776;s:6:\"椰蓉\";i:778;s:6:\"初五\";i:779;s:6:\"十月\";i:781;s:3:\"78g\";}');
INSERT INTO `weixin_item` VALUES ('244', '358', '0', '十月初五 咸切酥100g', '十月初五 咸切酥100g', null, null, null, '1410/10/54374282ac274.jpg', '8.60', '0.00', '1', '0', '0', '1412907653', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"/data/upload/item/1410/10/543742836ba12.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/54374283dd7ab.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/5437428452a8b.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/54374284cdd53.jpg\" /><br />\r\n<img src=\"/data/upload/item/1410/10/543742855092c.jpg\" /> \r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801993', '0', 'a:3:{i:778;s:6:\"初五\";i:779;s:6:\"十月\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('245', '358', '0', '十月初五 合桃酥（酥性饼干）108g', '十月初五 合桃酥（酥性饼干）108g', null, null, null, '1410/10/543743636ccd3.jpg', '7.90', '0.00', '1', '0', '0', '1412907878', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					<img src=\"/data/upload/item/1410/10/5437436438bb8.jpg\" />\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d5b6f36379.png\" alt=\"\" /><br />\r\n<p>\r\n	<br />\r\n</p>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/10/543743650963c.jpg\" /><br />\r\n<br />\r\n<img src=\"/data/upload/item/1410/10/543743656e701.jpg\" /><br />\r\n<br />\r\n<img src=\"/data/upload/item/1410/10/54374366153f7.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"10\" cellspacing=\"10\" width=\"770\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/10/543743668a3f6.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801504', '0', 'a:5:{i:782;s:6:\"桃酥\";i:778;s:6:\"初五\";i:721;s:6:\"饼干\";i:779;s:6:\"十月\";i:783;s:4:\"108g\";}');
INSERT INTO `weixin_item` VALUES ('246', '358', '0', '十月初五 芝麻饼 62g', '十月初五 芝麻饼 62g', null, null, null, '1410/10/543747bb468fb.jpg', '8.60', '0.00', '1', '0', '0', '1412908989', '255', '1', '<div id=\"inshopRightTop\" class=\"mt\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/data/upload/item/1410/10/543747bc6c385.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div id=\"inshopRightBottom\">\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801528', '0', 'a:4:{i:778;s:6:\"初五\";i:784;s:6:\"芝麻\";i:779;s:6:\"十月\";i:785;s:3:\"62g\";}');
INSERT INTO `weixin_item` VALUES ('247', '358', '0', '十月初五 迷你鸡仔饼 130g', '十月初五 迷你鸡仔饼 130g', null, null, null, '1410/10/5437490aa1a08.jpg', '10.90', '0.00', '1', '0', '0', '1412909323', '255', '1', '<h2>\r\n	<img src=\"/data/upload/item/1410/10/5437490af414f.jpg\" /><br />\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133801986', '0', 'a:5:{i:786;s:6:\"鸡仔\";i:778;s:6:\"初五\";i:779;s:6:\"十月\";i:787;s:6:\"迷你\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('248', '358', '0', '十月初五 鸡蛋卷 72g', '十月初五 鸡蛋卷 72g', null, null, null, '1410/10/54374c6c895ab.jpg', '10.90', '0.00', '1', '0', '0', '1412910200', '255', '1', '<img src=\"/data/upload/item/1410/10/54374c6d29d26.jpg\" /><img src=\"/data/upload/item/1410/10/54374c6d6fb7d.jpg\" /><img src=\"/data/upload/item/1410/10/54374c6dc3084.jpg\" /><img src=\"/data/upload/item/1410/10/54374c6e50107.jpg\" /><img src=\"/data/upload/item/1410/10/54374c6edb199.jpg\" /><img src=\"/data/upload/item/1410/10/54374c6fab3a4.jpg\" /><img src=\"/data/upload/item/1410/10/54374c707bb67.jpg\" /><img src=\"/data/upload/item/1410/10/54374c70ee1b4.jpg\" /><img src=\"/data/upload/item/1410/10/54374c716a4d3.jpg\" /><img src=\"/data/upload/item/1410/10/54374c71f340c.jpg\" /><img src=\"/data/upload/item/1410/10/54374c7240e4d.jpg\" /><img src=\"/data/upload/item/1410/10/54374c72ba2d3.jpg\" /><img src=\"/data/upload/item/1410/10/54374c7340ece.jpg\" /><img src=\"/data/upload/item/1410/10/54374c73d5ea1.jpg\" /><img src=\"/data/upload/item/1410/10/54374c7442b85.jpg\" /><img src=\"/data/upload/item/1410/10/54374c746495b.jpg\" /><img src=\"/data/upload/item/1410/10/54374c7599011.jpg\" /><img src=\"/data/upload/item/1410/10/54374c763b3fe.jpg\" /><img src=\"/data/upload/item/1410/10/54374c769b61c.jpg\" />', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935133803447', '0', 'a:4:{i:788;s:6:\"蛋卷\";i:778;s:6:\"初五\";i:779;s:6:\"十月\";i:789;s:3:\"72g\";}');
INSERT INTO `weixin_item` VALUES ('249', '358', '0', '北田 能量99棒 蛋黄口味 180g 台湾地区进口', '北田 能量99棒 蛋黄口味 180g 台湾地区进口', null, null, null, '1411/06/545b0f9d230f4.png', '13.90', '0.00', '1', '0', '0', '1412920986', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/06/545b0f6fd48b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f710965f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f71e29db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f727e993.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f73b3d98.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f74689a7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f7592086.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f761fa23.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f76e99bc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0f77920b6.jpg\" alt=\"\" /><br />', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711162821322', '0', 'a:7:{i:723;s:12:\"台湾地区\";i:790;s:6:\"北田\";i:791;s:6:\"蛋黄\";i:792;s:6:\"口味\";i:793;s:6:\"能量\";i:734;s:6:\"进口\";i:794;s:4:\"180g\";}');
INSERT INTO `weixin_item` VALUES ('250', '358', '0', '北田 能量99棒 南瓜口味 180g 台湾地区进口', '北田 能量99棒 南瓜口味 180g 台湾地区进口', null, null, null, '1410/10/5437780f2e655.jpg', '13.90', '0.00', '1', '0', '0', '1412921361', '255', '1', '<h2>\r\n	<img src=\"./data/upload/editer/image/2014/11/10/546010bcb0546.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546010bdeb96b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546010bf2185b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/10/546010c12d324.jpg\" alt=\"\" /><br />\r\n<br />\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711162821797', '0', 'a:7:{i:723;s:12:\"台湾地区\";i:790;s:6:\"北田\";i:795;s:6:\"南瓜\";i:792;s:6:\"口味\";i:793;s:6:\"能量\";i:734;s:6:\"进口\";i:794;s:4:\"180g\";}');
INSERT INTO `weixin_item` VALUES ('251', '358', '0', '北田 能量99棒 巧克力口味 180g 台湾地区进口', '北田 能量99棒 巧克力口味 180g 台湾地区进口', null, null, null, '1410/10/5437795a8b724.jpg', '13.90', '0.00', '1', '0', '0', '1412921691', '255', '1', '北田能量99棒巧克力口味（膨化食品）<br />\r\n【配料】糙米、棕榈油、麦芽糊精、白砂糖、白米、玉米、可可粉、酱油粉<br />\r\n（大豆、小麦、食用盐、白砂糖）、荞麦、麦片、绿豆、雪莲子、薏仁、豌<br />\r\n豆、红豆、花豆、黑豆、黑米 【致敏物质提示】含有麸质的谷物及其制品、<br />\r\n大豆及其制品 【净含量】180克 【原产地】中国台湾 【生产日期】标于包<br />\r\n装（日/月/年） 【贮存条件】常温保存 【制造商】北田食品股份有限公司<br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0e14e534b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0e1756e2a.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711162821896', '0', 'a:7:{i:723;s:12:\"台湾地区\";i:790;s:6:\"北田\";i:792;s:6:\"口味\";i:757;s:9:\"巧克力\";i:793;s:6:\"能量\";i:734;s:6:\"进口\";i:794;s:4:\"180g\";}');
INSERT INTO `weixin_item` VALUES ('252', '358', '0', 'VFOODS 美芙榴莲味威化饼干 120g 泰国进口', 'VFOODS 美芙榴莲味威化饼干 120g 泰国进口', null, null, null, '1410/10/543785fd6aab0.jpg', '16.80', '0.00', '1', '0', '0', '1412924931', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/06/545b0cddb0b10.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0cded4ce7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0ce0376d4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0ce1bd3f2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0ce290493.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858223006451', '0', 'a:7:{i:796;s:6:\"威化\";i:797;s:6:\"泰国\";i:798;s:6:\"榴莲\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:799;s:6:\"VFOODS\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('253', '358', '0', 'VFOODS 美芙山竹味威化饼干 120g 泰国进口', 'VFOODS 美芙山竹味威化饼干 120g 泰国进口', null, null, null, '1410/10/54378819075a0.jpg', '16.80', '0.00', '1', '0', '0', '1412925467', '255', '1', '<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/5437881986bcd.jpg\" /> \r\n</div>\r\n<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/54378819e1850.jpg\" /> \r\n</div>\r\n<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/5437881a427af.jpg\" /> \r\n</div>\r\n<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/5437881a9df3f.jpg\" /> \r\n</div>\r\n<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/5437881af1daf.jpg\" /> \r\n</div>\r\n<div class=\"detail-item\" style=\"margin-left:10px;color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;white-space:normal;background-color:#F5F5F5;\">\r\n	<img src=\"/data/upload/item/1410/10/5437881b610b8.jpg\" /> \r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858223006468', '0', 'a:7:{i:796;s:6:\"威化\";i:800;s:6:\"山竹\";i:797;s:6:\"泰国\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:799;s:6:\"VFOODS\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('254', '360', '0', '马玉山 玄米小麦饮 固体饮料 105克（35克*3）台湾地区进口', '马玉山 玄米小麦饮 固体饮料 105克（35克*3）台湾地区进口', null, null, null, '1410/10/54379f2f06961.png', '22.50', '0.00', '1', '0', '0', '1412931397', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/06/545b0b33572d1.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b0b3432eb0.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	【原产地区】：台湾<br />\r\n【产品品牌】：马玉山<br />\r\n【产品名称】：玄米小麦饮 固体饮料<br />\r\n【产品规格】：105克（35克*3）<br />\r\n【产品配料】：小麦、白砂糖、糙米（玄米）、赤砂糖、黑麦、荞麦、黑豆、薏仁、白芝麻、山药等<br />\r\n【贮存方式】：请置于阴凉干燥处<br />\r\n【保质期限】：24个月<br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b5e3cf55.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b5fa93db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b61502f8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b62c1e59.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b64cd509.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b66501f8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0b66ed5bb.jpg\" alt=\"\" />\r\n</p>', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713398110775', '0', 'a:7:{i:801;s:6:\"玉山\";i:723;s:12:\"台湾地区\";i:802;s:6:\"固体\";i:803;s:6:\"小麦\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:804;s:3:\"105\";}');
INSERT INTO `weixin_item` VALUES ('257', '360', '0', '马玉山 榛果味杏仁粉 固体饮料 90克（30克*3）台湾地区进口', '马玉山 榛果味杏仁粉 固体饮料 90克（30克*3）台湾地区进口', null, null, null, '1410/11/5438371a87e2f.jpg', '22.50', '0.00', '1', '0', '0', '1412970282', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/06/545b09f834139.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b09f905d59.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</p>\r\n<p>\r\n	【原产地区】：台湾<br />\r\n【产品品牌】：马玉山<br />\r\n【产品名称】：榛果味杏仁粉 固体饮料<br />\r\n【产品规格】：90克（30克*3）<br />\r\n【产品配料】：杏仁粉、白砂糖、玉米淀粉、核桃、银耳、奶粉、山药、百合、香草粉、榛果粉、植物油<br />\r\n【贮存方式】：请置于阴凉干燥处<br />\r\n【保质期限】：24个月\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b09fabc711.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b09fbee84a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b09fe40d30.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0a005ca9d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0a01d44d1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0a03be0d5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0a04a986b.jpg\" alt=\"\" /><br />', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713398111024', '0', 'a:7:{i:801;s:6:\"玉山\";i:723;s:12:\"台湾地区\";i:808;s:6:\"榛果\";i:638;s:6:\"杏仁\";i:802;s:6:\"固体\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('258', '360', '0', '马玉山 山药多谷餐 固体饮料 105克（35克*3）台湾地区进口', '马玉山 山药多谷餐 固体饮料 105克（35克*3）台湾地区进口', null, null, null, '1411/04/54585f98e745f.jpg', '22.90', '0.00', '1', '0', '0', '1412970430', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545890ac20564.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/04/545890ad20568.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【原产地区】：台湾<br />\r\n【产品品牌】：马玉山<br />\r\n【产品名称】：山药多谷餐 固体饮料<br />\r\n【产品规格】：105克（35克*3）<br />\r\n【产品配料】：小麦、高粱米、珍珠米、荞麦、糙米、薏仁、黑米、燕麦、白芝麻、山药、绿豆等<br />\r\n【贮存方式】：请置于阴凉干燥处<br />\r\n【保质期限】：24个月\r\n	</p>\r\n	<div style=\"text-align:left;\">\r\n		<span style=\"font-size:12px;line-height:1.5;\"></span> \r\n	</div>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/04/545890af15339.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b0a770b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b2c2070.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b46f7db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b679b95.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b8c22eb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890b9d8098.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713398110799', '0', 'a:8:{i:801;s:6:\"玉山\";i:723;s:12:\"台湾地区\";i:809;s:6:\"山药\";i:802;s:6:\"固体\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:810;s:6:\"谷餐\";i:804;s:3:\"105\";}');
INSERT INTO `weixin_item` VALUES ('259', '360', '0', '马玉山 紫山药薏仁露 固体饮料 105克（35克*3）台湾地区进口', '马玉山 紫山药薏仁露 固体饮料 105克（35克*3）台湾地区进口', null, null, null, '1410/11/543838275520d.jpg', '22.50', '0.00', '1', '0', '0', '1412970541', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458901246525.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/04/5458901301baf.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【原产地区】：台湾<br />\r\n【产品品牌】：马玉山<br />\r\n【产品名称】：紫山药薏仁露 固体饮料<br />\r\n【产品规格】：105克（35克*3）<br />\r\n【产品配料】：紫山药、薏仁、白砂糖、黑糯米、小麦、珍珠米、大米、黑豆粉、燕麦、荞麦等<br />\r\n【贮存方式】：请置于阴凉干燥处<br />\r\n【保质期限】：24个月\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/04/54589014b953f.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589016198a5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589017d6270.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545890199975d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458901b923f9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458901c492dc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458901e67088.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713398110751', '0', 'a:8:{i:811;s:6:\"薏仁\";i:801;s:6:\"玉山\";i:723;s:12:\"台湾地区\";i:809;s:6:\"山药\";i:802;s:6:\"固体\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:804;s:3:\"105\";}');
INSERT INTO `weixin_item` VALUES ('260', '358', '0', 'ssy 小木偶米果豆 120g（台湾进口）', 'ssy 小木偶米果豆 120g', null, null, null, '1410/11/54383d1392ee7.jpg', '22.60', '0.00', '1', '0', '0', '1412971797', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b066e1d0bc.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b066f007d0.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b066f8fe59.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b06702752b.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b0670e815c.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>良一小木偶米果豆（120G ）</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>成分： 花生、寒梅粉、面粉、白糖、糯米、糊精、酱油、食盐、淀粉、麦芽糖、紫菜、。</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>净含量： 120克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>毛重： 155克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>保质期： 12个月</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>萌翻了滴造型,小木偶们滴头是用白色的鱼皮花生做的,身体是用米果做的,吃</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>起来有大米的香味,很脆哦！</strong></span><span style=\"color:#000000;font-size:12px;line-height:1.4;\"><strong>一包共有28个，女孩子和</strong></span><span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>小朋友滴最爱！</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>一包里有很多支独立包装的小木偶们，穿着红粉蓝绿四种不同颜色的和服和有四</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>种不同的发型和表情的小木偶米</strong></span><span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>果,真的超级可爱,很漂亮呐!</strong></span><span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>买了哄女朋友</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12px;line-height:1.4;color:#000000;\"><strong>很不错的哦.一包共有28个。</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong><span style=\"color:#000000;\">&nbsp;</span></strong> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>&nbsp;</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>营养标示每100g</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>热量----------------414公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>蛋白质-------------7.59公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>脂肪----------------9.6公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>饱和脂肪------------1.8公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>反式脂肪--------------0公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>碳水化合物---------50.5公克</strong></span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;line-height:1.4;color:#606060;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;\"><strong>钠----------------352.4毫克</strong></span> \r\n</p>\r\n<strong><span style=\"color:#000000;\"></span></strong> \r\n<p>\r\n	<br />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4711161742758', '0', 'a:4:{i:812;s:6:\"木偶\";i:813;s:9:\"米果豆\";i:740;s:4:\"120g\";i:814;s:3:\"ssy\";}');
INSERT INTO `weixin_item` VALUES ('261', '358', '0', 'Sabava沙巴哇奶酪味紫薯干100g（越南进口）', '沙巴哇奶酪味紫薯干100g（越南进口 袋装）', null, null, null, '1410/11/54383e3af0ca0.jpg', '10.90', '0.00', '1', '0', '0', '1412972092', '255', '1', '<p style=\"text-align:left;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b04d0854eb.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">配料:紫薯、植物油、食用盐、麦芽糖、芝士粉&nbsp;</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">净含量：200克</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">保质期:12个月&nbsp;</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">原产地:越南&nbsp;</span> \r\n</p>\r\n<p style=\"text-align:left;\">\r\n	<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">储存方法:宜贮于干燥阴凉处</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b04d0c4fd2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b04d0eacf1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b04d18836b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b04d1bdf88.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b04d2b06da.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8936050230420', '0', 'a:7:{i:815;s:6:\"沙巴\";i:816;s:6:\"薯干\";i:817;s:6:\"越南\";i:818;s:6:\"袋装\";i:819;s:6:\"奶酪\";i:734;s:6:\"进口\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('262', '358', '0', 'Sabava沙巴哇综合蔬果干100g(越南进口)', 'Sabava沙巴哇综合蔬果干100g(越南进口)', null, null, null, '1411/04/54585e37edd9b.jpg', '10.90', '0.00', '1', '0', '0', '1412972439', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545b03996ccfa.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b039a92487.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b039b61a02.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b039bbad1f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b039c5116d.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8936050230178', '0', 'a:7:{i:815;s:6:\"沙巴\";i:817;s:6:\"越南\";i:820;s:6:\"蔬果\";i:734;s:6:\"进口\";i:821;s:6:\"Sabava\";i:730;s:6:\"综合\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('263', '358', '0', 'SABAVA沙巴哇 菠萝蜜干果 100g 越南进口', 'SABAVA沙巴哇 菠萝蜜干果 100g 越南进口', null, null, null, '1410/11/5438408dac59d.jpg', '13.90', '0.00', '1', '0', '0', '1412972690', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585be66d434.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bb67afc6.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	【商品名称】：SABAVA沙巴哇 菠萝蜜干果<br />\r\n【原产国家】：越南<br />\r\n【商品规格】：100g<br />\r\n【商品配料】：菠萝蜜、食用植物油<br />\r\n【保质期限】：12个月<br />\r\n【贮藏方法】：宜贮于干燥阴凉处\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bb7e0124.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bba196cd.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bbb164a1.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bbbc5ac1.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bbd29360.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585bbd98562.jpg\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8936050230192', '0', 'a:7:{i:815;s:6:\"沙巴\";i:817;s:6:\"越南\";i:822;s:6:\"干果\";i:823;s:9:\"菠萝蜜\";i:734;s:6:\"进口\";i:821;s:6:\"SABAVA\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('264', '359', '0', '越南特产 Star Sport椰子酥 芝士牛奶口味 120g 椰香美味', '越南特产 Star Sport椰子酥 芝士牛奶口味 120g 椰香美味', null, null, null, '1410/11/543844c4673fd.jpg', '13.80', '0.00', '1', '0', '0', '1412973768', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/06/545b082e71db6.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/06/545b08bdd554e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b082f59978.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b08305b4f4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b083167dad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0831eada9.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/06/545b08863ba93.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b088740da1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545b0887e8f8a.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8935146095677', '0', 'a:10:{i:824;s:6:\"芝士\";i:817;s:6:\"越南\";i:825;s:6:\"椰子\";i:826;s:6:\"特产\";i:792;s:6:\"口味\";i:581;s:6:\"美味\";i:725;s:6:\"牛奶\";i:827;s:5:\"Sport\";i:828;s:4:\"Star\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('265', '358', '0', '日香菜脯饼干45g(台湾进口)', '日香菜脯饼干45g(台湾进口)', null, null, null, '1410/11/54384629e2b32.jpg', '7.80', '0.00', '1', '0', '0', '1412974126', '255', '1', '<h2>\r\n	<img src=\"./data/upload/editer/image/2014/12/02/547d568423b81.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d568853ba3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d568bcf960.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d5690da96a.jpg\" alt=\"\" /><br />\r\n<br />\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710953081433', '0', 'a:5:{i:829;s:6:\"香菜\";i:754;s:6:\"台湾\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:830;s:3:\"45g\";}');
INSERT INTO `weixin_item` VALUES ('266', '358', '0', '日香冬笋饼干45g(台湾进口)', '日香冬笋饼干45g(台湾进口)', null, null, null, '1410/11/543846d2ed52b.jpg', '8.50', '0.00', '1', '0', '0', '1412974241', '255', '1', '<h2>\r\n</h2>\r\n<h2 style=\"white-space:normal;\">\r\n	<img src=\"./data/upload/editer/image/2014/12/02/547d5376449bb.jpg\" alt=\"\" /> \r\n</h2>\r\n<h2 style=\"white-space:normal;\">\r\n	<img src=\"./data/upload/editer/image/2014/12/02/547d53756b40d.jpg\" alt=\"\" /> \r\n</h2>\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d5374a93c2.jpg\" alt=\"\" /> \r\n<h2 style=\"white-space:normal;\">\r\n	<img src=\"./data/upload/editer/image/2014/12/02/547d537245a66.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/12/02/547d546179e43.png\" alt=\"\" /><br />\r\n<span style=\"font-size:12px;font-weight:normal;line-height:1.5;\"></span> \r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710953081181', '0', 'a:6:{i:831;s:6:\"日香\";i:832;s:6:\"冬笋\";i:754;s:6:\"台湾\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:830;s:3:\"45g\";}');
INSERT INTO `weixin_item` VALUES ('267', '358', '0', '日香 牛奶番薯饼干 45g （台湾进口）', '日香 牛奶番薯饼干 45g 台湾地区进口', null, null, null, '1410/11/543847f32230d.jpg', '9.90', '0.00', '1', '0', '0', '1412974579', '255', '1', '<img src=\"./data/upload/editer/image/2014/12/02/547d50cce7f91.jpg\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/12/02/547d57c4b3521.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d50ce488dc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d50cf7837e.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d5756a981d.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4710953081198', '0', 'a:7:{i:831;s:6:\"日香\";i:723;s:12:\"台湾地区\";i:833;s:6:\"番薯\";i:721;s:6:\"饼干\";i:725;s:6:\"牛奶\";i:734;s:6:\"进口\";i:830;s:3:\"45g\";}');
INSERT INTO `weixin_item` VALUES ('268', '359', '0', 'Butterfly蝴蝶牌烘焙杂果仁280g(香港进口）', 'Butterfly蝴蝶牌烘焙杂果仁280g(香港进口）', null, null, null, '1410/11/54384bacd01e1.JPG', '38.50', '0.00', '1', '0', '0', '1412975493', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458560f98081.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54585611022c8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561214a7a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561336d27.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561597d35.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561705b28.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545856193d3d1.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561a47457.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561c1d17d.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458561e43366.png\" alt=\"\" /><br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4893025812323', '0', 'a:7:{i:834;s:9:\"蝴蝶牌\";i:835;s:6:\"果仁\";i:836;s:6:\"烘焙\";i:547;s:6:\"香港\";i:837;s:9:\"Butterfly\";i:734;s:6:\"进口\";i:838;s:4:\"280g\";}');
INSERT INTO `weixin_item` VALUES ('269', '359', '0', 'Butterfly蝴蝶牌烘焙杂果仁135g(香港进口 袋）', 'Butterfly蝴蝶牌烘焙杂果仁135g(香港进口 袋）', null, null, null, '1410/11/54384d167e9c7.JPG', '20.80', '0.00', '1', '0', '0', '1412975896', '255', '1', '<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/04/5458549a4bcfc.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">品名：Butterfly Brand蝴蝶牌烘焙杂果仁135g<br />\r\n配料：扁桃仁、腰果、开心果、花生、白砂糖、食盐、乳化剂、蜂蜜、麦芽糖、食用<br />\r\n香精、果葡糖浆、洋葱粉、蒜粉、酵母提取物<br />\r\n净含量：135g<br />\r\n保质期：2年<br />\r\n原产地：中国香港<br />\r\n贮存条件：请置于阴凉干燥处，避免高温、潮湿及阳光直射。<br />\r\n</span> \r\n</p>\r\n<div>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545854b375250.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545854b4b71b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545854b5765d5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545854b6b3bc7.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<img src=\"./data/upload/editer/image/2014/11/04/54585679ae36e.png\" alt=\"\" /><br />\r\n<br />\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4893025812330', '0', 'a:7:{i:834;s:9:\"蝴蝶牌\";i:835;s:6:\"果仁\";i:836;s:6:\"烘焙\";i:547;s:6:\"香港\";i:837;s:9:\"Butterfly\";i:734;s:6:\"进口\";i:839;s:4:\"135g\";}');
INSERT INTO `weixin_item` VALUES ('270', '358', '0', 'DILESI迪乐斯(燕麦巧克力)', 'DILESI迪乐斯(燕麦巧克力)438G香浓可口 酥脆 减肥好伴侣', null, null, null, '1410/11/543850417e18e.jpg', '25.80', '0.00', '1', '0', '0', '1412976707', '255', '1', '<h2 class=\"tab_tle\" style=\"margin:0px;padding:18px 0px;height:18px;color:#CCCCCC;font-size:16px;font-family:Arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</h2>\r\n<div class=\"contentArea\" contentarea=\"picsBox\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"more_pic\" style=\"margin:0px;padding:0px;width:606px;text-align:center;overflow:hidden;\">\r\n		<a class=\"\" href=\"http://www.meilishuo.com/u/EE0CmT/1380183491/pc..zz.?refer_type=&amp;expr_alt=b&amp;frm=out_pics\" target=\"_blank\" style=\"color:#FF6699;text-decoration:none;\"><img src=\"/data/upload/item/1410/11/54385041cce3a.jpg\" /><img src=\"/data/upload/item/1410/11/5438504226c87.jpg\" /><img src=\"/data/upload/item/1410/11/5438504269604.jpg\" /><img src=\"/data/upload/item/1410/11/54385042aa544.jpg\" /><img src=\"/data/upload/item/1410/11/5438504345265.jpg\" /></a> \r\n	</div>\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '856305003884', '0', 'a:9:{i:840;s:6:\"燕麦\";i:841;s:6:\"乐斯\";i:1104;s:6:\"酥脆\";i:1105;s:6:\"可口\";i:757;s:9:\"巧克力\";i:1106;s:6:\"伴侣\";i:1107;s:6:\"减肥\";i:842;s:6:\"DILESI\";i:1108;s:4:\"438G\";}');
INSERT INTO `weixin_item` VALUES ('271', '359', '0', '利耕 牛轧糖 250g 纯手工台湾进口', '利耕 牛轧糖 250g 纯手工台湾进口', null, null, null, '1410/11/54385306f255b.jpg', '18.90', '0.00', '1', '0', '0', '1412977417', '255', '1', '<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;color:#333333;font-size:14px;white-space:normal;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:24px;\"><img src=\"/data/upload/item/1410/11/54385307b0824.jpg\" /><br />\r\n</span> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;color:#333333;font-size:14px;white-space:normal;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:24px;\"><img src=\"/data/upload/item/1410/11/54385308a4b38.jpg\" /></span> \r\n</p>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4713269689515', '0', 'a:6:{i:843;s:9:\"牛轧糖\";i:754;s:6:\"台湾\";i:771;s:6:\"手工\";i:734;s:6:\"进口\";i:844;s:6:\"利耕\";i:845;s:4:\"250g\";}');
INSERT INTO `weixin_item` VALUES ('275', '361', '0', '七咔呢 7coin 泰式泡菜味方便面 70g×5 泰国进口', '七咔呢 7coin 泰式泡菜味方便面 70g×5 泰国进口', null, null, null, '1410/14/543c8b397419a.jpg', '21.80', '0.00', '1', '0', '0', '1413253965', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545853937b525.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545853951bd8c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545853963e1fd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458539771bdd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458539893840.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54585399ee4f6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458539ba31a3.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858993500012', '0', 'a:7:{i:797;s:6:\"泰国\";i:849;s:6:\"泰式\";i:850;s:6:\"泡菜\";i:851;s:9:\"方便面\";i:734;s:6:\"进口\";i:852;s:5:\"7coin\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('278', '361', '0', 'Vit\'s 唯一面 海鲜口味快熟面 78g*5 马来西亚进口', 'Vit\'s 唯一面 海鲜口味快熟面 78g*5 马来西亚进口', null, null, null, '1410/14/543c918db1979.jpg', '17.60', '0.00', '1', '0', '0', '1413255580', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/04/54585192b2e5e.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">品名：唯一面（Vit\'s） 海鲜口味快熟面 390g</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">面饼配料：小麦粉、食用盐、碳酸钾、碳酸钠、碳酸三钙等</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">保质期：13个月</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">净含量：390g（78g*5包）</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">原产国：马来西亚</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">储存方式：放置干爽阴凉处，避免高温阴凉高温阳光日晒。</span><br style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\" />\r\n<span style=\"color:#666666;font-family:Arial, Verdana, 宋体;font-size:14px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">食用方法：面比较劲道，建议煮着吃。</span><br />\r\n</span> \r\n</p>\r\n<span style=\"line-height:1.5;\"> \r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545851941effb.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54585195e6f54.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458519808f1d.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458519ad5c8d.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458519e43a72.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458519fbde96.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545851a149f69.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545851a4445c8.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545851a6de796.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n</span> \r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556354000469', '0', 'a:7:{i:764;s:12:\"马来西亚\";i:854;s:6:\"海鲜\";i:792;s:6:\"口味\";i:855;s:6:\"一面\";i:734;s:6:\"进口\";i:856;s:5:\"Vit\'s\";i:857;s:2:\"78\";}');
INSERT INTO `weixin_item` VALUES ('279', '361', '0', '七咔呢 7coin 泰式牛肉风味方便面 70g×5 泰国进口', '七咔呢 7coin 泰式牛肉风味方便面 70g×5 泰国进口', null, null, null, '1410/14/543c969b52bc6.jpeg', '21.60', '0.00', '1', '0', '0', '1413256871', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54584f416423a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f43ec632.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f48135f9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f4929f5d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f4ba082c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f4cebbe9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f4f4a6ac.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f50d4ce2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f5326c95.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584f54bb135.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858993500081', '0', 'a:8:{i:797;s:6:\"泰国\";i:849;s:6:\"泰式\";i:851;s:9:\"方便面\";i:859;s:6:\"风味\";i:858;s:6:\"牛肉\";i:734;s:6:\"进口\";i:852;s:5:\"7coin\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('281', '361', '0', '七咔呢 7coin 泰式冬荫功风味方便面 70g×5 泰国进口', '七咔呢 7coin 泰式冬荫功风味方便面 70g×5 泰国进口', null, null, null, '1410/14/543c9980da2fc.jpg', '21.80', '0.00', '1', '0', '0', '1413257529', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54584e27c6805.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e2986d1d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e2aae170.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e2c4e2eb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e2d91bc1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e2f2a595.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e3086692.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584e3172e13.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858993500203', '0', 'a:7:{i:797;s:6:\"泰国\";i:849;s:6:\"泰式\";i:851;s:9:\"方便面\";i:859;s:6:\"风味\";i:734;s:6:\"进口\";i:852;s:5:\"7coin\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('282', '358', '0', '多恩金典口味曲奇(进口食品 袋装 100g)', '多恩金典口味曲奇(进口食品 袋装 100g)', null, null, null, '1410/14/543c9b654ba74.jpg', '13.80', '0.00', '1', '0', '0', '1413258088', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54584c368c1b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584c3814631.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584c3934ef5.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8009120003306', '0', 'a:8:{i:863;s:6:\"金典\";i:864;s:6:\"多恩\";i:733;s:6:\"曲奇\";i:818;s:6:\"袋装\";i:792;s:6:\"口味\";i:734;s:6:\"进口\";i:865;s:6:\"食品\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('283', '361', '0', 'DOLL 公仔面 麻油味 100g 香港进口', '公仔面 麻油味 100g 香港进口', null, null, null, '1410/14/543c9de67bd50.jpg', '5.80', '0.00', '1', '0', '0', '1413258733', '255', '1', '<div style=\"text-align:left;\">\r\n	<div id=\"J_DcTopRightWrap\" style=\"padding:0px;margin:0px;outline:0px;white-space:normal;widows:2;font-stretch:normal;font-family:tahoma, arial, 宋体;orphans:2;color:#404040;background-color:#FFFFFF;\">\r\n		<div class=\"J_DcAsyn\" id=\"J_DcTopRight\" style=\"padding:0px;margin:0px;outline:0px;\">\r\n			<div class=\"J_TModule\" data-comp=\"\" data-spm=\"110.0.5003-3507913186\" data-spm-max-idx=\"2\" data-title=\"自定义内容区\" data-widgetid=\"3507913186\" id=\"shop3507913186\" style=\"padding:0px;margin:0px;outline:0px;\">\r\n				<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"padding:0px;margin:0px 0px 10px;outline:0px;\">\r\n					<div class=\"skin-box-bd clear-fix\" style=\"padding:0px;margin:0px;outline:0px;border:0px solid #E5E5E5;line-height:1.2;width:790px;color:#2953A6;overflow:hidden;background-image:none;background-position:0px 0px;\">\r\n						<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n							<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N00/M02/E3/AC/CgMBmVNoULOAexecAAHT1pzL6mg07400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n						</p>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" id=\"description\" style=\"padding:0px;margin:0px;outline:0px;white-space:normal;widows:2;width:auto;font-stretch:normal;font-family:tahoma, arial, 宋体;orphans:2;color:#404040;background-color:#FFFFFF;\">\r\n		<div class=\"content ke-post\" id=\"J_ItemDesc\" style=\"padding:10px 0px 0px;margin:0px;outline:0px;width:790px;font-stretch:normal;font-size:14px;line-height:1.5;font-family:tahoma, arial, 宋体, sans-serif;overflow:hidden;\">\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N04/M03/A2/8F/CgQDr1NoZieAHU-gAANbBhVVA5453600.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N01/M04/E2/96/CgQCr1NocC-AELO1AAMObmn3glk73600.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N01/M05/E2/96/CgQCr1NocC-ABDgWAALCY_4_YyY42700.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N01/M04/E1/FB/CgQCrVNoULSAPYMsAANKFwCSVmk36400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N04/M05/A2/B2/CgQDr1NocDCAbCdfAAElyGGZgUM73100.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /><img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N01/M00/E2/80/CgQCrVNocDCAPWvcAAGd9OBQgNo32000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;line-height:1.5;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<img align=\"absMiddle\" src=\"http://d6.yihaodianimg.com/N00/M0A/DE/71/CgMBmVNl31WAd8x8AAAG-LMbqqc45400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n			</p>\r\n			<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;line-height:1.4;\">\r\n				<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\"><span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">商品名称：公仔面麻油味</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">品 &nbsp; &nbsp;牌：公仔面</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">原 产 地：中国香港</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">面 &nbsp; &nbsp;饼：小麦粉，棕橺油，食盐，酸度调节剂 ,乳化剂，增稠剂，着色剂，抗氧化剂</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">汤 &nbsp; &nbsp;粉：食盐，白砂糖，增味剂，水解植物蛋白，芝麻，改性淀粉，酱油粉，脱水葱，蒜粉，胡椒粉，着色剂，辣椒粉，抗结剂。</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">麻 油 包：麻油</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">此产品含有大豆，奶类，含有麸质的壳类及其制品</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">净 含 量：100g</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">商品毛重：约110g</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">保 质 期：12个月</span><br style=\"padding:0px;margin:0px;font-family:微软雅黑;color:#333333;\" />\r\n<span style=\"padding:0px;margin:0px;color:#333333;font-size:12px;\">储存条件：储存于阴凉干燥处</span></span> \r\n			</p>\r\n		</div>\r\n	</div>\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4892333100061', '0', 'a:5:{i:866;s:6:\"公仔\";i:867;s:6:\"麻油\";i:547;s:6:\"香港\";i:734;s:6:\"进口\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('284', '361', '0', 'DOLL 公仔面 劲辣牛肉味 103g 香港进口', 'DOLL 公仔面 劲辣牛肉味 103g 香港进口', null, null, null, '1410/14/543c9ec22c485.jpg', '5.80', '0.00', '1', '0', '0', '1413258961', '255', '1', '<div style=\"text-align:left;\">\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M06/E2/89/CgQCsFNoPnSAOElaAAHQmOj6k1U03300.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N04/M06/A1/C8/CgQDr1NoPfeAcLQ7AANsnJw4M1s17500.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N04/M04/A2/3C/CgQDrVNoXqWAQJQGAAMJOEcmyfs03400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N01/M00/E1/B3/CgQCr1NoPfeAeXG8AAM_wgeQmq855000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M0B/E2/E7/CgQCsVNoU6WAG6oNAAKbDV37T4U13400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N01/M04/E2/5B/CgQCr1NoXqWARTf0AAElyGGZgUM79000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /><img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M06/E3/48/CgMBmVNoPfiAEWIdAAGd9OBQgNo72300.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;line-height:1.5;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		&nbsp;\r\n	</p>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M0A/DE/71/CgMBmVNl31WAd8x8AAAG-LMbqqc45400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;\" /> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">商品名称：公仔面原味冬菜</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">品 &nbsp; &nbsp;牌：公仔面</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">原 产 地：中国香港</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">面 &nbsp; &nbsp;饼：小麦粉，棕橺油，食盐，酸度调节剂，乳化剂，增稠剂，着色剂，抗氧化剂</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">酱 &nbsp; &nbsp;包：棕橺油，冬菜，水，白砂糖，蒜，食盐，调味料，增味剂，辣椒粉。</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">汤 &nbsp; &nbsp;粉：食盐，白砂糖，水解植物蛋白，增味剂，调味料，脱水葱，菜籽油，黑胡椒，胡椒粉。抗结剂，辣椒粉，抗结剂。 此产品含有大豆，奶类，含有麸质的壳类及其制品</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">净 含 量：103g</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">商品毛重：约110g</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">保 质 期：12个月</span> \r\n	</div>\r\n	<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">储存条件：储存于阴凉干燥处</span> \r\n	</div>\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4892333100252', '0', 'a:6:{i:868;s:9:\"牛肉味\";i:866;s:6:\"公仔\";i:547;s:6:\"香港\";i:734;s:6:\"进口\";i:870;s:4:\"103g\";i:869;s:4:\"DOLL\";}');
INSERT INTO `weixin_item` VALUES ('285', '361', '0', 'DOLL公仔面原味冬菜味103g(香港进口)', 'DOLL公仔面原味冬菜味103g(香港进口)', null, null, null, '1410/14/543ca08c49ba9.jpg', '5.50', '0.00', '1', '0', '0', '1413259406', '255', '1', '<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M06/E2/89/CgQCsFNoPnSAOElaAAHQmOj6k1U03300.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N04/M06/A1/C8/CgQDr1NoPfeAcLQ7AANsnJw4M1s17500.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N04/M04/A2/3C/CgQDrVNoXqWAQJQGAAMJOEcmyfs03400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N01/M00/E1/B3/CgQCr1NoPfeAeXG8AAM_wgeQmq855000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M0B/E2/E7/CgQCsVNoU6WAG6oNAAKbDV37T4U13400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N01/M04/E2/5B/CgQCr1NoXqWARTf0AAElyGGZgUM79000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /><img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M06/E3/48/CgMBmVNoPfiAEWIdAAGd9OBQgNo72300.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;line-height:1.5;\" /> \r\n</p>\r\n<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M0A/DE/71/CgMBmVNl31WAd8x8AAAG-LMbqqc45400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;\" /> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">商品名称：公仔面原味冬菜</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">品 &nbsp; &nbsp;牌：公仔面</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">原 产 地：中国香港</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">面 &nbsp; &nbsp;饼：小麦粉，棕橺油，食盐，酸度调节剂，乳化剂，增稠剂，着色剂，抗氧化剂</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">酱 &nbsp; &nbsp;包：棕橺油，冬菜，水，白砂糖，蒜，食盐，调味料，增味剂，辣椒粉。</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">汤 &nbsp; &nbsp;粉：食盐，白砂糖，水解植物蛋白，增味剂，调味料，脱水葱，菜籽油，黑胡椒，胡椒粉。抗结剂，辣椒粉，抗结剂。 此产品含有大豆，奶类，含有麸质的壳类及其制品</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">净 含 量：103g</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">商品毛重：约110g</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">保 质 期：12个月</span> \r\n</div>\r\n<div style=\"padding:0px;margin:0px;outline:0px;font-size:14px;white-space:normal;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;line-height:21px;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n	<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\">储存条件：储存于阴凉干燥处</span> \r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4892333100016', '0', 'a:7:{i:866;s:6:\"公仔\";i:871;s:6:\"冬菜\";i:547;s:6:\"香港\";i:588;s:6:\"原味\";i:734;s:6:\"进口\";i:870;s:4:\"103g\";i:869;s:4:\"DOLL\";}');
INSERT INTO `weixin_item` VALUES ('286', '361', '0', 'DOLL公仔面鸡蓉味103g(香港进口)', 'DOLL公仔面鸡蓉味103g(香港进口)', null, null, null, '1410/14/543ca194089e6.jpg', '5.80', '0.00', '1', '0', '0', '1413259672', '255', '1', '<div style=\"text-align:center;\">\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M06/D8/66/CgQCsVNicbyARHiUAAG_rqPt05A29900.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M01/D8/80/CgQCslNibOSAKvLTAAOBZqsMsi090800.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M04/DA/F0/CgMBmFNidp2AVzoWAANGFUFu0nc81600.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M07/DA/41/CgQCtlNibOWAJQNUAAIyKaBn2vA24100.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N02/M08/D8/67/CgQCsVNico2Ae_itAAMDCL9Oobs46100.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /><img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N04/M04/97/95/CgQDrlNibOWAZ7nNAAJzTmwHNmQ81200.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;line-height:1.5;\" /><img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N01/M00/E2/80/CgQCrVNocDCAPWvcAAGd9OBQgNo32000.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;line-height:1.5;\" /> \r\n	</p>\r\n	<p style=\"text-align:left;padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<img align=\"absmiddle\" src=\"http://d6.yihaodianimg.com/N00/M0A/DE/71/CgMBmVNl31WAd8x8AAAG-LMbqqc45400.jpg\" style=\"padding:0px;margin:0px;vertical-align:top;float:none;\" /> \r\n	</p>\r\n	<p style=\"padding:0px;margin-top:1.12em;margin-bottom:1.12em;list-style:none;font-size:14px;white-space:normal;line-height:1.4;color:#404040;font-family:tahoma, arial, 宋体, sans-serif;orphans:2;widows:2;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<div style=\"text-align:left;\">\r\n		<span style=\"color:#333333;font-family:\'microsoft yahei\';line-height:1.4;\">商品名称：公仔面鸡蓉味</span> \r\n	</div>\r\n<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"color:#333333;line-height:1.4;\">品 &nbsp; &nbsp;牌：公仔面</span> \r\n	</div>\r\n<span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">原 产 地：中国香港</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">面 &nbsp; &nbsp;饼：小麦粉，棕橺油，食盐，酸度调节剂，乳化剂，增稠剂，着色剂，抗氧化剂</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">酱 &nbsp; &nbsp;包：棕橺油，大豆油，调味料，酒调料</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">汤 &nbsp; &nbsp;粉：食盐，白砂糖，水解植物蛋白，人造调味料，增味剂，小麦粉，脱水葱，菜籽油，着色剂，胡椒粉，酵母提取物，抗结剂，黑胡椒，调味料</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">此产品含有大豆，奶类，含有麸质的壳类及其制品</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">净 含 量：103g</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">商品毛重：约110g</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">保 质 期：12个月</span> \r\n	</div>\r\n</span><span style=\"padding:0px;margin:0px;color:#333333;\"> \r\n	<div style=\"text-align:left;\">\r\n		<span style=\"line-height:1.4;\">储存条件：储存于阴凉干燥处</span> \r\n	</div>\r\n</span></span> \r\n	<p>\r\n		<br />\r\n	</p>\r\n	<div style=\"text-align:left;\">\r\n		<span style=\"padding:0px;margin:0px;font-family:\'microsoft yahei\';\"><span style=\"padding:0px;margin:0px;color:#333333;\"><br />\r\n</span></span> \r\n	</div>\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4892333100030', '0', 'a:5:{i:866;s:6:\"公仔\";i:547;s:6:\"香港\";i:734;s:6:\"进口\";i:870;s:4:\"103g\";i:869;s:4:\"DOLL\";}');
INSERT INTO `weixin_item` VALUES ('288', '361', '0', 'Nissin出前一丁油炸方便面鸡蓉味100g(香港进口 袋)', 'Nissin出前一丁油炸方便面鸡蓉味100g(香港进口 袋)', null, null, null, '1410/14/543ca44906d3a.jpg', '5.90', '0.00', '1', '0', '0', '1413260366', '255', '1', '<p style=\"text-align:center;\">\r\n	<img src=\"/data/upload/item/1410/14/543ca44d8892e.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#008080;font-size:small;\"><strong>&nbsp;快速即食，美味可口，办公室家庭的必备商品</strong></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"line-height:300%;\"><span style=\"font-size:14px;\"><span style=\"font-family:宋体;\">&nbsp; 香港制造，面质精抖，汤质纯鲜，和国内制造的出前一丁口感相差较大。不管是正餐或宵夜，出外用餐或是家中自己下厨，「出前一丁」即食面总不时出现在我们身边，倘若家中的厨房没有了它，就好像欠缺了什么似的。香脆美味的口感，老少咸宜，越吃越爱吃，您绝对无法抗拒它的魅力。</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp; </span><span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">食用方法：将面放入500毫升煮沸水中煮沸三分钟，熄火后，再加入粉汤及调味油，拌匀后便可食用。</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">　出前一丁是日清食品的即食面品牌之一，意译为“速递一份”。1968年于日本推出，并于翌年进入香港市场，至今仍非常受欢迎，虽然价钱较贵，但部份人仍指定只吃出前一丁的即食面。</span></span></span><span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">因为在香港历史悠久之缘故，不少人将“出前一丁”与“公仔面”变成即食面之同意词。</span></span></span> \r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897878000036', '0', 'a:6:{i:547;s:6:\"香港\";i:872;s:6:\"油炸\";i:851;s:9:\"方便面\";i:734;s:6:\"进口\";i:873;s:6:\"Nissin\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('289', '361', '0', 'Nissin出前一丁油炸方便面麻油味100g(香港进口 袋)', 'Nissin出前一丁油炸方便面麻油味100g(香港进口 袋)', null, null, null, '1410/14/543ca5d366f04.jpg', '5.90', '0.00', '1', '0', '0', '1413260757', '255', '1', '<p style=\"text-align:center;\">\r\n	&nbsp;<img src=\"/data/upload/item/1410/14/543ca5d471568.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#008080;font-size:small;\"><strong>&nbsp;&nbsp;&nbsp; 快速即食，美味可口，办公室家庭的必备商品</strong></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"line-height:300%;\"><span style=\"font-size:14px;\"><span style=\"font-family:宋体;\">&nbsp; 香港制造，面质精抖，汤质纯鲜，和国内制造的出前一丁口感相差较大。不管是正餐或宵夜，出外用餐或是家中自己下厨，「出前一丁」即食面总不时出现在我们身边，倘若家中的厨房没有了它，就好像欠缺了什么似的。香脆美味的口感，老少咸宜，越吃越爱吃，您绝对无法抗拒它的魅力。</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp; </span><span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">食用方法：将面放入500毫升煮沸水中煮沸三分钟，熄火后，再加入粉汤及调味油，拌匀后便可食用。</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">　出前一丁是日清食品的即食面品牌之一，意译为“速递一份”。1968年于日本推出，并于翌年进入香港市场，至今仍非常受欢迎，虽然价钱较贵，但部份人仍指定只吃出前一丁的即食面。</span></span></span><span style=\"line-height:300%;\"><span style=\"font-family:宋体;\"><span style=\"font-size:14px;\">因为在香港历史悠久之缘故，不少人将“出前一丁”与“公仔面”变成即食面之同意词。</span></span></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897878000012', '0', 'a:7:{i:867;s:6:\"麻油\";i:547;s:6:\"香港\";i:872;s:6:\"油炸\";i:851;s:9:\"方便面\";i:734;s:6:\"进口\";i:873;s:6:\"Nissin\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('290', '361', '0', 'Nissin出前一丁 高品质即食面 黑蒜油猪骨汤味 100g 香港地区进口', 'Nissin出前一丁 高品质即食面 黑蒜油猪骨汤味 100g 香港地区进口', null, null, null, '1411/04/5458475ea9685.jpg', '5.90', '0.00', '1', '0', '0', '1413261130', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545846ce0b37b.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545846ceb9033.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">原产地：香港地区</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：出前一丁高品质即食面黑蒜油猪骨汤味</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品配料：面：小麦粉、棕榈油、淀粉、食盐、酸度调节剂、增稠剂、抗氧化剂；汤粉：</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食盐、增味剂、葡萄糖、白砂糖、水解大豆蛋白、酵母精、酱油粉、大蒜粉、棕榈油、洋</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">葱粉、调味料及调味剂、脱水青葱、食用香料、增稠剂、米油、牛奶蛋白、抗结剂；调味</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">油：猪油、黑蒜油、麻油、着色剂、大蒜、抗氧化剂</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品类型：油炸面</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">保质期限：1年</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">储存条件：请置于阴凉干燥处，避免阳光直射</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">过敏提示：此产品含有大豆、鱼类、奶类，含有麸质的谷类及其制品</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54584734c5686.png\" alt=\"\" />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545846d1319dc.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545846d1daaa7.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897878830015', '0', 'a:7:{i:874;s:12:\"香港地区\";i:875;s:9:\"即食面\";i:876;s:9:\"高品质\";i:734;s:6:\"进口\";i:873;s:6:\"Nissin\";i:877;s:6:\"汤味\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('291', '358', '0', 'Lotus和情焦糖饼干(比利时进口)120g   咖啡真正的伴侣', 'Lotus和情焦糖饼干120g(进口)', null, null, null, '1412/02/547d45eb13c67.jpg', '18.80', '0.00', '1', '0', '0', '1413261456', '255', '1', '<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:24px;\"><strong>和情饼干——</strong></span><span style=\"font-family:\'Microsoft YaHei\';font-size:24px;\"><strong>咖啡最好的伴侣！</strong></span> \r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458456711b43.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/12/02/547d4460cf562.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/12/02/547d4465db4c3.JPG\" alt=\"\" style=\"font-size:13.3333339691162px;text-align:center;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/12/02/547d450f9052e.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;text-align:center;white-space:normal;\" /> \r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d446194f02.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d4462429df.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d4465010c0.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d446b25a50.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d446e7ac04.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d447021328.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d4471c5219.png\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/12/02/547d4469a63d6.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;text-align:center;white-space:normal;\" /><br />\r\n<br />\r\n<br />\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '5410126006339', '0', 'a:5:{i:878;s:6:\"焦糖\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:879;s:5:\"Lotus\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('293', '359', '0', 'RINDA什锦味双色糖（马来西亚进口）120g', '联达RINDA什锦味双色糖120g', null, null, null, '1410/15/543de66a3f1d8.jpg', '16.80', '0.00', '1', '0', '0', '1413342828', '255', '1', '<img src=\"/data/upload/item/1410/15/543de66b288a0.jpg\" />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556138001859', '0', 'a:4:{i:880;s:6:\"什锦\";i:881;s:6:\"双色\";i:882;s:5:\"RINDA\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('294', '359', '0', 'RINDA蓝莓味双色糖（马来西亚进口）120g', '联达RINDA蓝莓味双色糖120g', null, null, null, '1410/15/543de6e52e905.jpg', '16.80', '0.00', '1', '0', '0', '1413342951', '255', '1', '<img src=\"/data/upload/item/1410/15/543de6e6eea90.jpg\" />', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556138001842', '0', 'a:4:{i:883;s:6:\"蓝莓\";i:881;s:6:\"双色\";i:882;s:5:\"RINDA\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('295', '359', '0', 'RINDA蜜瓜味双色糖（马来西亚进口）120g', '联达RINDA蜜瓜味双色糖120g', null, null, null, '1410/15/543de8527f1bf.png', '16.80', '0.00', '1', '0', '0', '1413343318', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454e478d2cb5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e47bb5cf4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e47e2165c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e480a12ad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e4830e7cd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e4850a5d1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e48764153.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e48a14573.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556138001811', '0', 'a:4:{i:884;s:6:\"蜜瓜\";i:881;s:6:\"双色\";i:882;s:5:\"RINDA\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('296', '359', '0', 'RINDA咖啡味双色糖（马来西亚进口）120g', '联达RINDA咖啡味双色糖120g', null, null, null, '1410/15/543de8e298cb9.png', '16.80', '0.00', '1', '0', '0', '1413343463', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454e3d4ddd99.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3d7ec72d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3dac6b89.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3dd7605e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3e039ed9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3e27a34c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3e525d8d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e3e753382.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556138001828', '0', 'a:4:{i:881;s:6:\"双色\";i:763;s:6:\"咖啡\";i:882;s:5:\"RINDA\";i:740;s:4:\"120g\";}');
INSERT INTO `weixin_item` VALUES ('297', '359', '0', '台湾小公主北海道牛奶夹心糖 芒果味42g', '台湾小公主北海道牛奶夹心糖 芒果味42g', null, null, null, '1410/15/543dee9a6cf40.jpg', '2.60', '0.00', '1', '0', '0', '1413344925', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454e34863435.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e348f38d0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e34a411ec.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e34b21544.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712585746643', '0', 'a:7:{i:885;s:9:\"北海道\";i:886;s:9:\"夹心糖\";i:887;s:6:\"果味\";i:754;s:6:\"台湾\";i:725;s:6:\"牛奶\";i:888;s:6:\"公主\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('298', '359', '0', '台湾小公主北海道牛奶夹心糖 椰子味42g', '台湾小公主北海道牛奶夹心糖 椰子味42g', null, null, null, '1410/15/543df28df08aa.jpg', '2.60', '0.00', '1', '0', '0', '1413345934', '255', '1', '<img src=\"./data/upload/editer/image/2014/10/15/543df259acb9c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/15/543df25b18837.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/28/54784a049a21a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54784a04cf564.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54784a0527952.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712585746643', '0', 'a:7:{i:885;s:9:\"北海道\";i:886;s:9:\"夹心糖\";i:754;s:6:\"台湾\";i:825;s:6:\"椰子\";i:725;s:6:\"牛奶\";i:888;s:6:\"公主\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('299', '359', '0', '台湾小公主北海道牛奶夹心糖 提子味42g', '台湾小公主北海道牛奶夹心糖 提子味42g', null, null, null, '1410/15/543df2e534bd7.jpg', '2.60', '0.00', '1', '0', '0', '1413346021', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/28/547845ff5807e.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/10/15/543df2e15fdff.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/10/15/543df2dfa0d23.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;white-space:normal;\" /><img src=\"/data/upload/editer/image/2014/11/28/547847b9b1460.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547847a0464cd.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54784601b328c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478460293acb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478460422948.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712585746643', '0', 'a:7:{i:885;s:9:\"北海道\";i:886;s:9:\"夹心糖\";i:890;s:6:\"提子\";i:754;s:6:\"台湾\";i:725;s:6:\"牛奶\";i:888;s:6:\"公主\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('300', '359', '0', '提子牛奶夹心糖42g（香港进口）', '林食佳提子牛奶夹心糖42g', null, null, null, '1410/15/543df94be5d36.jpg', '2.80', '0.00', '1', '0', '0', '1413347671', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/28/547841ab30d07.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841ac3ddcf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841ad1a890.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841adbecb4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841ae1a833.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841aebdd5c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841af73de1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841b07e0ac.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841b17c5f8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547841b276b7f.jpg\" alt=\"\" /><br />', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037250012', '0', 'a:5:{i:886;s:9:\"夹心糖\";i:890;s:6:\"提子\";i:725;s:6:\"牛奶\";i:891;s:9:\"林食佳\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('301', '359', '0', '芒果牛奶夹心糖42g（香港进口）', '林食佳芒果牛奶夹心糖42g', null, null, null, '1410/15/543dfad413b8e.jpg', '2.00', '0.00', '1', '0', '0', '1413348059', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/28/54783de898d37.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783de932d39.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783de9a98e0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783de9ddb30.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783dea86bc2.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/28/54783e851d2cf.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/28/54784208cf0dc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547842099dd59.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54784209e8ddb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478420a949bd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478420b4f180.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783deb53226.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783debcdfe3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783dec7719e.jpg\" alt=\"\" /><br />', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037250036', '0', 'a:5:{i:886;s:9:\"夹心糖\";i:892;s:6:\"芒果\";i:725;s:6:\"牛奶\";i:891;s:9:\"林食佳\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('302', '359', '0', '草莓牛奶夹心软糖42g（香港进口）', '林食佳草莓牛奶夹心糖42g', null, null, null, '1410/15/543dfbfc4fc8a.jpg', '2.80', '0.00', '1', '0', '0', '1413348355', '255', '1', '<div class=\"widget-custom offerdetail_common_description\" data-widget-name=\"offerdetail_common_description\" style=\"color:#444444;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"widget-custom-container\">\r\n		<div id=\"mod-detail-description\" class=\"mod-detail-description mod-info mod\" data-mod-config=\"{\" showon\":[\"mod-detail-description\"],\"title\":\"详细信息\",\"tabconfig\":{\"trace\":\"tabdetail\",\"showkey\":\"mod-detail-description\"}}\"=\"\" ready-to-show=\"true\" style=\"margin:0px 0px 32px;color:#5C5C5C;overflow:hidden;width:auto;\">\r\n		<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<strong style=\"color:#FF0000;font-size:14pt;line-height:1.5;\">【产品名称】：香港林食佳牛奶夹心糖42g 草莓味</strong> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 牌】：香港林食佳</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【净 含 量】：42g</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【原 产 地】：香港</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【保 质 期】：540天</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【贮存方法】：常温保存，请置于阴凉干燥处，避免阳光照射</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong>【成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 分】：精炼食用植物油，白砂糖，葡萄糖浆，牛奶粉，阿拉伯胶，卡拉胶，食用香精，食用色素（柠檬黄，胭脂红，苋菜红，靛蓝，焦糖色素</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong><strong style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-family:仿宋_GB2312;color:#000000;font-size:24pt;\"><img src=\"./data/upload/editer/image/2014/11/28/547837bb75247.jpg\" alt=\"\" /></span></strong><br />\r\n</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;\">\r\n			<span style=\"color:#FF0000;font-size:14pt;\"><strong><img src=\"./data/upload/editer/image/2014/11/28/54783ad66375c.jpg\" alt=\"\" /><br />\r\n<br />\r\n</strong></span> \r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<br />\r\n		</p>\r\n		<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;text-align:center;\">\r\n			<strong style=\"line-height:1.5;font-size:12px;\"><span style=\"font-family:仿宋_GB2312;color:#000000;font-size:24pt;\"><img src=\"./data/upload/editer/image/2014/11/28/54783a8843395.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/54783a8a4d48c.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/28/547838132f693.jpg\" alt=\"\" /><strong style=\"color:#5C5C5C;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;line-height:1.5;text-align:center;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-family:仿宋_GB2312;color:#000000;font-size:24pt;\"><strong style=\"color:#5C5C5C;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;line-height:1.5;\"><span style=\"font-family:仿宋_GB2312;color:#000000;font-size:24pt;\"><img src=\"./data/upload/editer/image/2014/11/28/54783a89470bf.jpg\" alt=\"\" /></span></strong></span></strong><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478382d749d8.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/28/54783b466841e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</span></strong> \r\n		</p>\r\n	</div>\r\n</div>\r\n	</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037250029', '0', 'a:5:{i:886;s:9:\"夹心糖\";i:678;s:6:\"草莓\";i:725;s:6:\"牛奶\";i:891;s:9:\"林食佳\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('303', '359', '0', '椰子牛奶夹心软糖42g软（香港进口）', '林食佳椰子牛奶夹心糖42g', null, null, null, '1410/15/543dfd014af5e.jpg', '2.80', '0.00', '1', '0', '0', '1413348615', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/28/547831996985e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/5478319b03606.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547831c331ae3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547831c5f0a41.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547831ca1a36d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/28/547831cb5d960.jpg\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/28/54783b7a44c4a.jpg\" alt=\"\" /><br />', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037250043', '0', 'a:5:{i:886;s:9:\"夹心糖\";i:825;s:6:\"椰子\";i:725;s:6:\"牛奶\";i:891;s:9:\"林食佳\";i:889;s:3:\"42g\";}');
INSERT INTO `weixin_item` VALUES ('304', '360', '0', 'A&S蜂蜜柚子茶580g（韩国进口 瓶）', 'A&S蜂蜜柚子茶580g（韩国进口 瓶）', null, null, null, '1410/15/543dff04841c6.png', '35.00', '0.00', '1', '0', '0', '1413349127', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454e1c790d6e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1c9369e2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1ca81341.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1cbc40b3.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1cf41582.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1d19586e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1d3cb814.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1d53fc13.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1d6c4e86.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e1d96b5b5.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8809269405852', '0', 'a:5:{i:893;s:6:\"柚子\";i:894;s:6:\"韩国\";i:895;s:6:\"蜂蜜\";i:734;s:6:\"进口\";i:896;s:4:\"580g\";}');
INSERT INTO `weixin_item` VALUES ('305', '360', '0', 'A&S蜂蜜柚子茶1080g(韩国进口 瓶)', 'A&S蜂蜜柚子茶1080g(韩国进口 瓶)', null, null, null, '1410/15/543e0033ac152.png', '49.90', '0.00', '1', '0', '0', '1413349431', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454e072e5ee8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e0743ffbb.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e078c2dca.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e0794cd4b.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8809269405869', '0', 'a:5:{i:893;s:6:\"柚子\";i:894;s:6:\"韩国\";i:895;s:6:\"蜂蜜\";i:734;s:6:\"进口\";i:897;s:5:\"1080g\";}');
INSERT INTO `weixin_item` VALUES ('306', '359', '0', '7D 芒果干 100g 菲律宾进口', '7D 芒果干 100g 菲律宾进口', null, null, null, '1411/01/5454dcb48c8b7.jpg', '11.90', '0.00', '1', '0', '0', '1413349947', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454dc55534bf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc560614e.jpg\" alt=\"\" /><br />\r\n原 &nbsp;产 国：菲律宾<br />\r\n商品名称：7D 芒果干<br />\r\n配 &nbsp; &nbsp; &nbsp;料：芒果、白砂糖、焦亚硫酸钠<br />\r\n净 &nbsp;含 量：100克<br />\r\n保 &nbsp;质 期：1年<br />\r\n储存方式：于干燥阴凉处保存<br />\r\n注意事项：温度高时包装袋内会产生雾气商品表面发生潮湿为自然返潮现象，可放心食用<br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7b79e90.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7c03380.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7c79b2d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7d196f5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7db1edb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7e59901.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dc7eb7b97.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4809010272010', '0', 'a:5:{i:898;s:9:\"菲律宾\";i:892;s:6:\"芒果\";i:734;s:6:\"进口\";i:710;s:4:\"100g\";i:899;s:2:\"7D\";}');
INSERT INTO `weixin_item` VALUES ('307', '359', '0', '甜心糖果小铺纯麦芽棒棒糖（台湾进口）14g', '甜心糖果小铺纯麦芽棒棒糖14g', null, null, null, '1410/15/543e05c2a9284.jpg', '1.20', '0.00', '1', '0', '0', '1413350850', '255', '1', '<p>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\">纯麦芽！小盆友们，爱美妹妹最喜欢！</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\"><img src=\"./data/upload/editer/image/2014/12/02/547d402a0cff3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d402ab64f9.jpg\" alt=\"\" /><br />\r\n<br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\"><img src=\"./data/upload/editer/image/2014/12/02/547d3f6053648.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3f6198181.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3f6232b05.jpeg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3f63be553.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3f645ab1c.jpg\" alt=\"\" /><br />\r\n<br />\r\n</span></strong> \r\n</p>', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712020030016', '0', 'a:5:{i:900;s:6:\"甜心\";i:901;s:6:\"麦芽\";i:902;s:9:\"棒棒糖\";i:903;s:6:\"糖果\";i:904;s:3:\"14g\";}');
INSERT INTO `weixin_item` VALUES ('308', '359', '0', '梅心棒棒糖（越南进口）', '越南进口梅心棒棒糖', null, null, null, '1410/15/543e086584c26.jpg', '1.60', '0.00', '1', '0', '0', '1413351525', '255', '1', '<img src=\"./data/upload/editer/image/2014/12/02/547d3b3639dfa.jpg\" alt=\"\" style=\"font-size:13.3333339691162px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/12/02/547d3b0feb5b5.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3b12a9441.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3b13723b2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/12/02/547d3b14120ff.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8938503050678', '0', 'a:4:{i:905;s:6:\"梅心\";i:817;s:6:\"越南\";i:902;s:9:\"棒棒糖\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('309', '359', '0', '幸运星星糖  许愿瓶（韩国进口）', '橙黄绿蓝白紫六色 无指定颜色随机发放', null, null, null, '1410/15/543e0c155fd2a.jpg', '1.90', '0.00', '1', '0', '0', '1413352472', '255', '1', '<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c15b3d2b.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	配料表：白砂糖 香料<br />\r\n保质期：540<br />\r\n食品添加剂：无<br />\r\n品牌: 韩国<br />\r\n系列: 幸运星星糖<br />\r\n产地: 韩国\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c15f38a4.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c163a827.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c167ac13.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c16c8817.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c17181a1.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c1755ef3.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c1797875.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c17d4a61.jpg\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/15/543e0c181da56.jpg\" /> \r\n</p>', '0', '0', '60', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8819171213018', '0', 'a:8:{i:1170;s:6:\"六色\";i:1171;s:6:\"绿蓝\";i:1172;s:6:\"橙黄\";i:1173;s:6:\"发放\";i:981;s:6:\"随机\";i:1174;s:6:\"指定\";i:1086;s:6:\"颜色\";i:1175;s:6:\"白紫\";}');
INSERT INTO `weixin_item` VALUES ('310', '360', '0', '韩国百事可乐250ml(进口食品 瓶装 250ml)', '韩国百事可乐250ml(进口食品 瓶装 250ml)', null, null, null, '1410/16/543fbcd4d3bf1.png', '5.80', '0.00', '1', '0', '0', '1413463256', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454de5b88606.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de5d1982f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de5edebb1.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de60e7a72.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de6234ac9.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de65750b5.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de6911ecb.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454de6a5580a.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8801056610012', '0', 'a:6:{i:909;s:12:\"百事可乐\";i:910;s:5:\"250ml\";i:894;s:6:\"韩国\";i:602;s:6:\"瓶装\";i:734;s:6:\"进口\";i:865;s:6:\"食品\";}');
INSERT INTO `weixin_item` VALUES ('311', '360', '0', '泰国est 橙味汽水250ml', '泰国est 橙味汽水250ml', null, null, null, '1410/16/543fcf8b58fd5.png', '6.80', '0.00', '1', '0', '0', '1413468045', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品品牌】：est</span> \r\n</p>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品名称】：est橙味汽水250ml</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品含量】：250ml</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品产地】：泰国</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品配料】：苏打水、果葡糖浆、食品添加剂、食用香精</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【包装方式】：瓶装</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【贮藏方法】：阴凉干燥处保存</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【注意事项】：请勿猛烈摇晃，否则内容液会冒出来</span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\"><img src=\"/data/upload/item/1410/16/543fcf8c17179.jpg\" /></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/16/543fcf8cbe1e7.jpg\" /> \r\n</div>', '0', '0', '8', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8851952120016', '0', 'a:4:{i:797;s:6:\"泰国\";i:911;s:6:\"汽水\";i:910;s:5:\"250ml\";i:912;s:3:\"est\";}');
INSERT INTO `weixin_item` VALUES ('312', '360', '0', '泰国est 可乐250ml', 'est可乐250ml', null, null, null, '1410/16/543fd00182a0a.png', '6.80', '0.00', '1', '0', '0', '1413468163', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品品牌】：est</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品名称】：est可乐250ml</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品含量】：250ml</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品产地】：泰国</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【商品配料】：苏打水、白砂糖、咖啡因、着色剂、食用香精</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【包装方式】：瓶装</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【贮藏方法】：阴凉干燥处保存</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\">【注意事项】：请勿猛烈摇晃，否则内容液会冒出来</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"margin:0px;padding:0px;font-size:medium;\"><img src=\"/data/upload/item/1410/16/543fd002142f3.jpg\" /></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;border:none;list-style-type:none;color:#333333;font-family:\'Lucida Grande\', \'Microsoft YaHei\';line-height:24px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"/data/upload/item/1410/16/543fd002b1c17.jpg\" /> \r\n</p>', '0', '0', '9', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8851952101015', '0', 'a:3:{i:913;s:6:\"可乐\";i:910;s:5:\"250ml\";i:912;s:3:\"est\";}');
INSERT INTO `weixin_item` VALUES ('313', '360', '0', '泰国est 草莓味汽水250ml', '泰国est 草莓味汽水250ml', null, null, null, '1410/16/543fd162d9273.jpg', '6.80', '0.00', '1', '0', '0', '1413468519', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span><span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/01/5454da51f0503.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454da52e4f15.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454da53b5f77.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454da5475fd1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454da553197d.jpg\" alt=\"\" /><br />\r\n</span> \r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8851952122010', '0', 'a:5:{i:797;s:6:\"泰国\";i:911;s:6:\"汽水\";i:678;s:6:\"草莓\";i:910;s:5:\"250ml\";i:912;s:3:\"est\";}');
INSERT INTO `weixin_item` VALUES ('314', '360', '0', '泰国est 青柠味汽水250ml', '泰国est 青柠味汽水250ml', null, null, null, '1410/16/543fd1ffc0ddc.jpg', '6.80', '0.00', '1', '0', '0', '1413468674', '255', '1', '<h2 class=\"tab_tle\" style=\"margin:0px;padding:18px 0px;height:18px;color:#CCCCCC;font-size:16px;font-family:Arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<a class=\"tabArea cur\" contentarea=\"picsBox\" style=\"color:#FF6699;padding-right:10px;\">图片详情</a> \r\n</h2>\r\n<div class=\"contentArea\" contentarea=\"picsBox\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<div class=\"more_pic\" style=\"margin:0px;padding:0px;width:606px;text-align:center;overflow:hidden;\">\r\n		<a class=\"\" href=\"http://www.meilishuo.com/u/EExLra/1974668733/pc..zz.?refer_type=&amp;expr_alt=b&amp;frm=out_pics\" target=\"_blank\" style=\"color:#666666;text-decoration:none;\"><img src=\"/data/upload/item/1410/16/543fd20023517.jpg\" /><img src=\"/data/upload/item/1410/16/543fd200b40e5.jpg\" /><img src=\"/data/upload/item/1410/16/543fd2014f066.jpg\" /><img src=\"/data/upload/item/1410/16/543fd20204118.jpg\" /></a> \r\n	</div>\r\n</div>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8851952121013', '0', 'a:4:{i:797;s:6:\"泰国\";i:911;s:6:\"汽水\";i:910;s:5:\"250ml\";i:912;s:3:\"est\";}');
INSERT INTO `weixin_item` VALUES ('315', '360', '0', 'CHABBA 芭提娅果汁饮料230ml 石榴 泰国原装进口', '芭提娅果汁饮料230ml 石榴 泰国原装进口', null, null, null, '1410/16/543fdc24ad656.png', '6.20', '0.00', '1', '0', '0', '1413471270', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454dfaadabb1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfab9c8ab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfacc05d4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfadb4e24.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfae528f2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfaed53d5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfaf6266f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfb096aff.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfb13e7d3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454dfb1f0290.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8854761254415', '0', 'a:5:{i:914;s:12:\"果汁饮料\";i:797;s:6:\"泰国\";i:915;s:12:\"原装进口\";i:916;s:6:\"石榴\";i:917;s:5:\"230ml\";}');
INSERT INTO `weixin_item` VALUES ('316', '360', '0', 'CHABBA 芭提娅果汁饮料230ml 红葡萄 泰国原装进口', '芭提娅果汁饮料230ml 红葡萄 泰国原装进口', null, null, null, '1410/16/543fde6c9b2b2.png', '6.20', '0.00', '1', '0', '0', '1413471856', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d8e285c3f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e3884dd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e44f223.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e52d199.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e639da2.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/01/5454d8e586d12.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e72aa1a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d8e81854d.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8854761014019', '0', 'a:5:{i:914;s:12:\"果汁饮料\";i:797;s:6:\"泰国\";i:915;s:12:\"原装进口\";i:918;s:6:\"葡萄\";i:917;s:5:\"230ml\";}');
INSERT INTO `weixin_item` VALUES ('317', '360', '0', 'CHABBA 芭提娅果汁饮料230ml 芒果 泰国原装进口', '芭提娅果汁饮料230ml 芒果 泰国原装进口', null, null, null, '1410/16/543fdfc8bcbf7.png', '6.20', '0.00', '1', '0', '0', '1413472201', '255', '1', '<img src=\"/data/upload/item/1410/16/543fdfc937511.jpg\" />', '0', '0', '18', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8854761174010', '0', 'a:5:{i:914;s:12:\"果汁饮料\";i:797;s:6:\"泰国\";i:915;s:12:\"原装进口\";i:892;s:6:\"芒果\";i:917;s:5:\"230ml\";}');
INSERT INTO `weixin_item` VALUES ('318', '360', '0', 'CHABBA 芭提娅果汁饮料230ml 菠萝 泰国原装进口', 'CHABBA 芭提娅果汁饮料230ml 菠萝 泰国原装进口', null, null, null, '1410/16/543fe08328f44.JPG', '6.20', '0.00', '1', '0', '0', '1413472388', '255', '1', '<p style=\"text-align:center;\">\r\n	<strong style=\"font-size:16px;line-height:1.5;\"><span style=\"font-family:宋体;\"><span style=\"line-height:200%;\"><img src=\"/data/upload/item/1410/16/543fe0842442f.jpg\" /></span></span></strong> \r\n</p>', '0', '0', '8', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8854761124015', '0', 'a:6:{i:914;s:12:\"果汁饮料\";i:797;s:6:\"泰国\";i:915;s:12:\"原装进口\";i:919;s:6:\"菠萝\";i:920;s:6:\"CHABBA\";i:917;s:5:\"230ml\";}');
INSERT INTO `weixin_item` VALUES ('319', '360', '0', '七星红葡萄气泡小香槟饮料350ml 无含酒精', '七星红葡萄气泡饮料350ml', null, null, null, '1410/17/5440ad45c0029.png', '19.80', '0.00', '1', '0', '0', '1413524806', '255', '1', '<img src=\"./data/upload/editer/image/2014/10/17/5440acb1373dc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440acb58a396.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440acb70eb6e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440acb8e2d85.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '719859796223', '0', 'a:5:{i:921;s:6:\"七星\";i:922;s:6:\"气泡\";i:918;s:6:\"葡萄\";i:766;s:6:\"饮料\";i:923;s:5:\"350ml\";}');
INSERT INTO `weixin_item` VALUES ('320', '360', '0', '七星白葡萄气泡小香槟饮料350ml 无含酒精', '七星白葡萄气泡小香槟饮料350ml 无含酒精', null, null, null, '1410/17/5440ae00d8edd.png', '19.80', '0.00', '1', '0', '0', '1413524993', '255', '1', '<img src=\"./data/upload/editer/image/2014/10/17/5440adeeb0be1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440adf2988c6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440adf42c248.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/17/5440adf5c0bef.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '719859796230', '0', 'a:7:{i:921;s:6:\"七星\";i:922;s:6:\"气泡\";i:924;s:6:\"香槟\";i:925;s:6:\"酒精\";i:918;s:6:\"葡萄\";i:766;s:6:\"饮料\";i:923;s:5:\"350ml\";}');
INSERT INTO `weixin_item` VALUES ('321', '354', '0', 'Rio 锐澳蓝玫瑰预淍酒(瓶装 275ml)', '锐澳蓝玫瑰预淍酒(瓶装 275ml)', null, null, null, '1411/01/5454d7de98f52.jpg', '11.80', '0.00', '1', '0', '0', '1413525811', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a27f293.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a2cc7ae.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：锐澳威士忌预调鸡尾酒蓝玫瑰味</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品配料：饮用净水、白砂糖、伏特加、威士忌、浓缩百香果汁、食品添加剂、食用香精。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食品生产许可证编号 ：QS3119 1505 0002</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品含量：275ML</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品规格：24瓶/箱</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">酒精度：3.8%VOL</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">果汁含量：≥3.0%</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品标准号：Q/RAAI0001S</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品保质期：18个月</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">储藏方法：阴凉、避光处</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食用方法：开封即饮</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a332308.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a3cc9be.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a44a0aa.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a4e325f.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">请保存于阴凉干燥处。避免高温和阳光直晒，禁止加热或0℃以下冷</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">冻，防止撞击。若有少量沉淀位天然果肉成分，请放心饮用。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7a56f55a.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d7afdb52f.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '13', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301047', '0', 'a:3:{i:602;s:6:\"瓶装\";i:926;s:6:\"玫瑰\";i:927;s:5:\"275ml\";}');
INSERT INTO `weixin_item` VALUES ('322', '354', '0', 'Rio 锐澳橙味预淍酒(瓶装 275ml)', '锐澳橙味预淍酒(瓶装 275ml)', null, null, null, '1411/01/5454d71537df5.jpg', '11.80', '0.00', '1', '0', '0', '1413525956', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c1e0155.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c27510f.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:微软雅黑;font-size:15px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong style=\"padding:0px;margin:0px;\">商品名称：锐澳威士忌预调鸡尾酒橙味</strong> \r\n</p>\r\n<p style=\"padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:微软雅黑;font-size:15px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong style=\"padding:0px;margin:0px;\">商品配料：</strong>饮用净水、白砂糖、伏特加、白兰地、浓缩橙汁、食品添加剂、食用香精。<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">食品生产许可证编号 ：</strong>QS3119 1505 0002<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">商品含量：</strong>275ML<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">商品规格：</strong>24瓶/箱<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">酒精度：</strong>3.8%VOL<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">果汁含量：≥</strong>3.0%<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">产品标准号：</strong>Q/RAAI0001S<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">产品保质期：</strong>18个月<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">储藏方法：</strong>阴凉、避光处<br style=\"padding:0px;margin:0px;\" />\r\n<strong style=\"padding:0px;margin:0px;\">食用方法：</strong>开封即饮\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c2beb56.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c348c5e.png\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c56b837.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c7085b6.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6c90723d.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">请保存于阴凉干燥处。避免高温和阳光直晒，禁止加热或0℃以下冷</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:25px;white-space:normal;background-color:#FFFFFF;\">冻，防止撞击。若有少量沉淀位天然果肉成分，请放心饮用。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6cc1cae4.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d6ce3323c.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '18', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301023', '0', 'a:2:{i:602;s:6:\"瓶装\";i:927;s:5:\"275ml\";}');
INSERT INTO `weixin_item` VALUES ('323', '354', '0', 'Rio 锐澳 伏特加预调酒 宾治味 275ml', 'Rio 锐澳 伏特加预调酒 宾治味 275ml', null, null, null, '1411/01/5454d534debd3.jpg', '11.80', '0.00', '1', '0', '0', '1413526283', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4dd45a59.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4ddf4194.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：锐澳伏特加预调鸡尾酒宾治味</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品配料：饮用净水、白砂糖、伏特加、威士忌、浓缩苹果汁、食品添加剂、食用香精。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食品生产许可证编号：QS3119 1505 0002</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品含量：275ML</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品规格：24瓶/箱</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">酒精度：3.8%VOL</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">果汁含量：≥3.0%</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品标准号：Q/RAAI0001S</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品保质期：18个月</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">储藏方法：阴凉、避光处</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食用方法：开封即饮</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4de44f5e.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4de848ef.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4dee401b.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4df88b12.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">请保存于阴凉干燥处。避免高温和阳光直晒，禁止加热或0℃以下冷</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">冻，防止撞击。若有少量沉淀位天然果肉成分，请放心饮用。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4e0207aa.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4e0b4630.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '7', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301061', '0', 'a:4:{i:928;s:9:\"伏特加\";i:929;s:6:\"调酒\";i:927;s:5:\"275ml\";i:930;s:3:\"Rio\";}');
INSERT INTO `weixin_item` VALUES ('324', '354', '0', 'Rio 锐澳 伏特加预调酒 青柠味 275ml', 'Rio 锐澳 伏特加预调酒 青柠味 275ml', null, null, null, '1411/01/5454d46eb7d09.jpg', '11.80', '0.00', '1', '0', '0', '1413526520', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4005a2ab.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d40089fdd.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：锐澳威士忌预调鸡尾酒青柠味</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品配料：饮用净水、白砂糖、伏特加、朗姆酒、浓缩柠檬汁、食品添加剂、食用香精。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食品生产许可证编号 ：QS3119 1505 0002</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品含量：275ML</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品规格：24瓶/箱</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">酒精度：3.8%VOL</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">果汁含量：≥3.0%</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品标准号：Q/RAAI0001S</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品保质期：18个月</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">储藏方法：阴凉、避光处</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食用方法：开封即饮</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d40147208.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4017d7d9.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d401e9324.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d4024298f.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">请保存于阴凉干燥处。避免高温和阳光直晒，禁止加热或0℃以下冷</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;white-space:nowrap;\">冻，防止撞击。若有少量沉淀位天然果肉成分，请放心饮用。</span><span style=\"line-height:1.5;\"></span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d402b4ba7.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d40337cfa.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301016', '0', 'a:4:{i:928;s:9:\"伏特加\";i:929;s:6:\"调酒\";i:927;s:5:\"275ml\";i:930;s:3:\"Rio\";}');
INSERT INTO `weixin_item` VALUES ('325', '354', '0', 'Rio 锐澳水密桃预淍酒(瓶装 275ml)', 'Rio 锐澳水密桃预淍酒(瓶装 275ml)', null, null, null, '1411/01/5454d2cec4ce1.jpg', '11.80', '0.00', '1', '0', '0', '1413526773', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/11/01/5454d296aed13.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/01/5454d296da1a0.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：锐澳白桃味白兰地预调鸡尾酒<br />\r\n商品配料：饮用净水、白砂糖、伏特加、白兰地、浓缩桃汁、食品添加剂、食用香精。<br />\r\n食品生产许可证编号：QS3119 1505 0002<br />\r\n商品含量：330ML<br />\r\n商品规格：24罐/箱<br />\r\n酒精度：3.0%VOL<br />\r\n果汁含量：≥3.0%<br />\r\n产品标准号：Q/RAAI0001S<br />\r\n产品保质期：18个月<br />\r\n储藏方法：阴凉、避光处<br />\r\n食用方法：开封即饮<br />\r\n<br />\r\n</span> \r\n</p>\r\n<span style=\"line-height:1.5;\"> \r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d2977a47a.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d297ad083.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d297f0031.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d298898d2.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">请保存于阴凉干燥处。避免高温和阳光直晒，禁止加热或0℃以下冷</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">冻，防止撞击。若有少量沉淀位天然果肉成分，请放心饮用</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d2993e575.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d29a04671.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n</span> \r\n<p>\r\n	<br />\r\n</p>', '0', '0', '20', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301030', '0', 'a:3:{i:602;s:6:\"瓶装\";i:927;s:5:\"275ml\";i:930;s:3:\"Rio\";}');
INSERT INTO `weixin_item` VALUES ('326', '354', '0', 'Rio 锐澳 紫葡萄味白兰地鸡尾酒（预调酒）275ml', 'Rio 锐澳 紫葡萄味白兰地鸡尾酒（预调酒）275ml', null, null, null, '1411/01/5454d1c3371b5.jpg', '11.80', '0.00', '1', '0', '0', '1413527080', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/11/01/5454d1609f45e.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/01/5454d16119312.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：锐澳 葡萄味白兰地鸡尾酒（预调酒）<br />\r\n配 &nbsp;料 表：饮用净水，白砂糖，伏特加，白兰地，浓缩葡萄汁，浓缩苹果汁，食品添加剂（二氧化碳，柠檬</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">酸，DL-苹果酸，柠檬酸钠，山梨酸钾，苯甲酸钠，苋菜红，亮蓝），食用香精，果汁含量≥3.0%<br />\r\n保 &nbsp;质 期：18个月<br />\r\n贮藏条件：保存于阴凉干燥处，避免高温和强光，禁止加热或0℃以下冷冻，防止撞击。<br />\r\n产品标准号：Q/RAAI 0001S<br />\r\n食品生产许可证号：QS 3119 1505 0002<br />\r\n<br />\r\n</span> \r\n</p>\r\n<span style=\"line-height:1.5;\"> \r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d161adca2.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">由各种烈酒和果汁饮料混合而成，浓烈中散放优雅，纯正享受。</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d16244e87.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">葡萄果香+白兰地，醇美饱含口中，丰富的果味与爽冽的酒精给您带来极</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">品般的享受。</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d162d80cf.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\">口感千变万化，受到年轻人追捧，引燃激情百分百，激发活力百分百。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d163e8172.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d1649e497.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d1657bf92.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454d16607ca4.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n</span> \r\n<p>\r\n	<br />\r\n</p>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6935145301078', '0', 'a:6:{i:931;s:9:\"白兰地\";i:929;s:6:\"调酒\";i:932;s:9:\"鸡尾酒\";i:918;s:6:\"葡萄\";i:927;s:5:\"275ml\";i:930;s:3:\"Rio\";}');
INSERT INTO `weixin_item` VALUES ('327', '354', '0', '7BEST 牌芒果汁饮料', '7BEST 牌芒果汁饮料', null, null, null, '1410/17/5440c3afee6cb.jpg', '8.90', '0.00', '1', '0', '0', '1413530546', '255', '1', '<span style=\"font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;font-size:14pt;color:#FF00FF;background-color:#FFFFFF;\">全新泰国CZA明列子蜂蜜汁,口感柔滑,健康绿色好味道。饮用明列子饮料具有促进肠道蠕动，排毒养颜的功效，对女性大有裨益，是一款美味的健康养生饮料。明列子简介：兰香子，学名明列子，为唇型花科、罗勒属、一年生、芳香性亚灌木状、草本植物。原产于印度又名罗勒子，兰香子，奇异子、珍珠果。当地土著称“达卡”从西元3500年前阿兹迪卡古文明已经开始种植食用，是一种带来健康及体力和耐力的食物。五兰香子其大小如芝麻，黑色，无味，可溶于水、酒、饮料、果汁、牛奶、汤等多种液体物质。</span><img src=\"/data/upload/item/1410/17/5440c3b095dc7.jpg\" /><img src=\"/data/upload/item/1410/17/5440c3b163e93.jpg\" /><br class=\"img-brk\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\" />\r\n<img src=\"/data/upload/item/1410/17/5440c3b2364ae.jpg\" />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858992300231', '0', 'a:3:{i:933;s:9:\"芒果汁\";i:766;s:6:\"饮料\";i:934;s:5:\"7BEST\";}');
INSERT INTO `weixin_item` VALUES ('328', '354', '0', '7BEST牌 明列子 绿茶味饮料', '7BEST牌 明列子 绿茶味饮料', null, null, null, '1410/17/5440c4d5010bd.png', '8.90', '0.00', '1', '0', '0', '1413530837', '255', '1', '<span style=\"white-space:normal;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14pt;color:#FF00FF;background-color:#FFFFFF;\">全新泰国CZA明列子蜂蜜汁,口感柔滑,健康绿色好味道。饮用明列子饮料具有促进肠道蠕动，排毒养颜的功效，对女性大有裨益，是一款美味的健康养生饮料。明列子简介：兰香子，学名明列子，为唇型花科、罗勒属、一年生、芳香性亚灌木状、草本植物。原产于印度又名罗勒子，兰香子，奇异子、珍珠果。当地土著称“达卡”从西元3500年前阿兹迪卡古文明已经开始种植食用，是一种带来健康及体力和耐力的食物。五兰香子其大小如芝麻，黑色，无味，可溶于水、酒、饮料、果汁、牛奶、汤等多种液体物质。</span><img src=\"/data/upload/item/1410/17/5440c3b095dc7.jpg\" style=\"white-space:normal;\" /><img src=\"/data/upload/item/1410/17/5440c3b163e93.jpg\" style=\"white-space:normal;\" /><br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<img src=\"/data/upload/item/1410/17/5440c3b2364ae.jpg\" style=\"white-space:normal;\" />', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858992300255', '0', 'a:4:{i:935;s:6:\"列子\";i:632;s:6:\"绿茶\";i:766;s:6:\"饮料\";i:934;s:5:\"7BEST\";}');
INSERT INTO `weixin_item` VALUES ('329', '354', '0', '7BEST牌 明列子 蜂蜜味饮料', '7BEST牌 明列子 蜂蜜味饮料', null, null, null, '1410/17/5440c5bda8cab.png', '8.90', '0.00', '1', '0', '0', '1413531069', '255', '1', '<span style=\"white-space:normal;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14pt;color:#FF00FF;background-color:#FFFFFF;\">全新泰国CZA明列子蜂蜜汁,口感柔滑,健康绿色好味道。饮用明列子饮料具有促进肠道蠕动，排毒养颜的功效，对女性大有裨益，是一款美味的健康养生饮料。明列子简介：兰香子，学名明列子，为唇型花科、罗勒属、一年生、芳香性亚灌木状、草本植物。原产于印度又名罗勒子，兰香子，奇异子、珍珠果。当地土著称“达卡”从西元3500年前阿兹迪卡古文明已经开始种植食用，是一种带来健康及体力和耐力的食物。五兰香子其大小如芝麻，黑色，无味，可溶于水、酒、饮料、果汁、牛奶、汤等多种液体物质。</span><img src=\"/data/upload/item/1410/17/5440c3b095dc7.jpg\" style=\"white-space:normal;\" /><img src=\"/data/upload/item/1410/17/5440c3b163e93.jpg\" style=\"white-space:normal;\" /><br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<img src=\"/data/upload/item/1410/17/5440c3b2364ae.jpg\" style=\"white-space:normal;\" />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858992300279', '0', 'a:4:{i:935;s:6:\"列子\";i:895;s:6:\"蜂蜜\";i:766;s:6:\"饮料\";i:934;s:5:\"7BEST\";}');
INSERT INTO `weixin_item` VALUES ('330', '354', '0', '7BEST牌 椰肉椰子汁饮料', '7BEST牌 椰肉椰子汁饮料', null, null, null, '1410/17/5440c6c949e1b.jpg', '8.90', '0.00', '1', '0', '0', '1413531337', '255', '1', '<span style=\"white-space:normal;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14pt;color:#FF00FF;background-color:#FFFFFF;\">全新泰国CZA明列子蜂蜜汁,口感柔滑,健康绿色好味道。饮用明列子饮料具有促进肠道蠕动，排毒养颜的功效，对女性大有裨益，是一款美味的健康养生饮料。明列子简介：兰香子，学名明列子，为唇型花科、罗勒属、一年生、芳香性亚灌木状、草本植物。原产于印度又名罗勒子，兰香子，奇异子、珍珠果。当地土著称“达卡”从西元3500年前阿兹迪卡古文明已经开始种植食用，是一种带来健康及体力和耐力的食物。五兰香子其大小如芝麻，黑色，无味，可溶于水、酒、饮料、果汁、牛奶、汤等多种液体物质。</span><img src=\"/data/upload/item/1410/17/5440c3b095dc7.jpg\" style=\"white-space:normal;\" /><img src=\"/data/upload/item/1410/17/5440c3b163e93.jpg\" style=\"white-space:normal;\" /><br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<br class=\"img-brk\" style=\"white-space:normal;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\" />\r\n<img src=\"/data/upload/item/1410/17/5440c3b2364ae.jpg\" style=\"white-space:normal;\" />', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858992300194', '0', 'a:4:{i:936;s:6:\"椰肉\";i:937;s:9:\"椰子汁\";i:766;s:6:\"饮料\";i:934;s:5:\"7BEST\";}');
INSERT INTO `weixin_item` VALUES ('331', '354', '0', '7BEST牌 芦荟椰子汁饮料', '7BEST牌 芦荟椰子汁饮料8858992300200', null, null, null, '1410/17/5440cdb290e27.jpg', '8.90', '0.00', '1', '0', '0', '1413533106', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/01/5454cf91c4805.jpg\" alt=\"\" /><br />\r\n</span> \r\n</div>\r\n<br />', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8858992300200', '0', 'a:5:{i:937;s:9:\"椰子汁\";i:636;s:6:\"芦荟\";i:938;s:13:\"8858992300200\";i:766;s:6:\"饮料\";i:934;s:5:\"7BEST\";}');
INSERT INTO `weixin_item` VALUES ('332', '354', '0', '台湾美馔 提子汁饮料 490ml 台湾地区进口', '台湾美馔 提子汁饮料 490ml 台湾地区进口', null, null, null, '1411/01/5454ce8a76b4b.jpg', '7.80', '0.00', '1', '0', '0', '1413533897', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454ce54e8a7b.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454ce553fe10.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		<span style=\"white-space:nowrap;\"><strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">商品名称：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">台湾美馔提子汁饮料</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">原&nbsp;&nbsp;产&nbsp;地：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">台湾地区</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">净&nbsp;&nbsp;含&nbsp;量：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">490ml</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">果汁含量：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">≥15%</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;料：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">水、果葡糖浆、提子浓缩汁、白砂糖、苹果浓缩汁、食品添加剂</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">保&nbsp;&nbsp;质&nbsp;期：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">二年</span><br style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\" />\r\n<strong style=\"padding:0px;margin:0px;color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">储藏方式：</strong><span style=\"color:#333333;font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;background-color:#FFFFFF;\">常温保存，避免阳光曝晒，冷藏风味更佳，饮用前请先摇匀</span></span> \r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454ce56dcdb3.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ce579afe5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ce588a548.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ce5928930.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ce59a577c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ce5a1f4da.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712826825076', '0', 'a:6:{i:723;s:12:\"台湾地区\";i:890;s:6:\"提子\";i:754;s:6:\"台湾\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:939;s:5:\"490ml\";}');
INSERT INTO `weixin_item` VALUES ('333', '354', '0', '台湾美馔 水蜜桃汁 490ml 台湾地区进口', '台湾美馔 水蜜桃汁 490ml 台湾地区进口', null, null, null, '1411/01/5454cd8e2f7e3.jpg', '7.80', '0.00', '1', '0', '0', '1413533981', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454cd794d757.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cd79e58b7.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：台湾美馔水蜜桃汁饮料<br />\r\n原 &nbsp;产 地：台湾地区<br />\r\n净 &nbsp;含 量：490ml<br />\r\n果汁含量：≥15%<br />\r\n配 &nbsp; &nbsp; &nbsp;料：水、果葡糖浆、水蜜桃汁、白砂糖、食品添加剂<br />\r\n保 &nbsp;质 期：二年<br />\r\n储藏方式：常温保存，避免阳光曝晒，冷藏风味更佳，饮用前请先摇匀\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cd7b0c6e0.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cd7bb59bf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cd7ca5da1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cd7d42908.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cd7dc404a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cd7e663f3.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712826825021', '0', 'a:5:{i:723;s:12:\"台湾地区\";i:940;s:9:\"水蜜桃\";i:754;s:6:\"台湾\";i:734;s:6:\"进口\";i:939;s:5:\"490ml\";}');
INSERT INTO `weixin_item` VALUES ('334', '354', '0', '台湾美馔 甘蔗汁饮料 490ml 台湾进口', '台湾美馔 甘蔗汁饮料 490ml 台湾进口', null, null, null, '1411/01/5454cd0569494.jpg', '7.80', '0.00', '1', '0', '0', '1413534139', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454cce7ea485.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cce89c46d.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【原产地区】：台湾<br />\r\n【品牌名称】：台湾美馔<br />\r\n【产品名称】：甘蔗汁饮料<br />\r\n【产品规格】：490ml<br />\r\n【产品配料】：水、甘蔗原汁、果葡萄浆、白砂糖、食品添加剂、食用香精<br />\r\n【贮藏方式】：常温保存，避免阳光暴晒，冷藏风味更佳，饮用前先摇勺<br />\r\n【保质期限】：二年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454ccea8b2b1.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ccebe0197.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cced7cb43.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ccee646f7.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712826825151', '0', 'a:5:{i:754;s:6:\"台湾\";i:941;s:9:\"甘蔗汁\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:939;s:5:\"490ml\";}');
INSERT INTO `weixin_item` VALUES ('335', '354', '0', '台湾美馔 番石榴汁饮料 490ml 台湾地区进口', '台湾美馔 番石榴汁饮料 490ml 台湾地区进口', null, null, null, '1411/01/5454cc802a0e1.jpg', '7.80', '0.00', '1', '0', '0', '1413534233', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454cc68eaac5.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cc6980fb1.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：台湾美馔番石榴汁饮料<br />\r\n原 &nbsp;产 地：台湾地区<br />\r\n净 &nbsp;含 量：490ml<br />\r\n果汁含量：≥15%<br />\r\n配 &nbsp; &nbsp; &nbsp;料：水、果葡糖浆、番石榴汁、白砂糖、柠檬汁、食品添加剂<br />\r\n保 &nbsp;质 期：二年<br />\r\n储藏方式：常温保存，避免阳光曝晒，冷藏风味更佳，饮用前请先摇匀\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cc6aa7b3d.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc6b4496b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc6b99df2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc6c53ef5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc6cc1c44.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc6d2f04f.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712826825007', '0', 'a:6:{i:723;s:12:\"台湾地区\";i:942;s:9:\"番石榴\";i:754;s:6:\"台湾\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:939;s:5:\"490ml\";}');
INSERT INTO `weixin_item` VALUES ('336', '354', '0', '台湾美馔 芒果汁 490ml 台湾地区进口', '台湾美馔 芒果汁 490ml 台湾地区进口', null, null, null, '1411/01/5454cb6a46fa4.jpg', '7.80', '0.00', '1', '0', '0', '1413534635', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454cb4d4cb57.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cb4d9aae1.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：台湾美馔芒果汁饮料<br />\r\n原 &nbsp;产 地：台湾地区<br />\r\n净 &nbsp;含 量：490ml<br />\r\n果汁含量：≥15%<br />\r\n配 &nbsp; &nbsp; &nbsp;料：水、果葡糖浆、芒果汁、白砂糖、苹果浓缩汁、柠檬汁、食品添加剂<br />\r\n保 &nbsp;质 期：二年<br />\r\n储藏方式：常温保存，避免阳光曝晒，冷藏风味更佳，饮用前请先摇匀\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/5454cb4ea2baf.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cb4f8f38e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cb5079b23.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cb50dccfe.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cb515d0c6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cb51c4e05.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712826825014', '0', 'a:5:{i:723;s:12:\"台湾地区\";i:933;s:9:\"芒果汁\";i:754;s:6:\"台湾\";i:734;s:6:\"进口\";i:939;s:5:\"490ml\";}');
INSERT INTO `weixin_item` VALUES ('337', '354', '0', 'HARBOE德博 干啤酒 500mL 德国原装进口', '德博 干啤酒 500mL 德国原装进口', null, null, null, '1411/01/545471f9ab2d9.jpg', '11.90', '0.00', '1', '0', '0', '1413610701', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/545471bc902e9.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545471bd2970c.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">商品名称：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">德博干啤酒</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">原&nbsp;&nbsp;产&nbsp;国：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">德国</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">酒&nbsp;&nbsp;精&nbsp;度：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">5%vol. /原麦汁浓度：11°P</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">原料及辅料：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">水、麦芽、啤酒花</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">贮存条件：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">常温避光</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">保&nbsp;&nbsp;质&nbsp;期：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">12个月</span> \r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545471be6b902.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471becae0e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471bf3fe8f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471bfa4380.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471c05890a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471c0a4e98.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4015042102755', '0', 'a:5:{i:943;s:6:\"德博\";i:944;s:6:\"德国\";i:915;s:12:\"原装进口\";i:945;s:6:\"啤酒\";i:946;s:5:\"500mL\";}');
INSERT INTO `weixin_item` VALUES ('338', '354', '0', 'HARBOE 德博黑啤酒 500ml 德国原装进口', 'HARBOE 德博黑啤酒 500ml 德国原装进口', null, null, null, '1410/18/5441fd2a7b259.png', '11.90', '0.00', '1', '0', '0', '1413610799', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/5454711fe99a1.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545471203b49b.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">原&nbsp;&nbsp;产&nbsp;国：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">德国</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">商品名称：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">HARBOE 德博黑啤酒 礼品装</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">原料与辅料：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">水、麦芽、啤酒花</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">净&nbsp;&nbsp;含&nbsp;量：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">500mL</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">保&nbsp;&nbsp;质&nbsp;期：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">6个月</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">酒&nbsp;&nbsp;精&nbsp;度：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">5.2%vol</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">原麦汁浓度：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">12°P</span><br style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\" />\r\n<strong style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">贮藏方法：</strong><span style=\"font-family:微软雅黑;font-size:16px;line-height:24px;white-space:normal;\">常温避光</span> \r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/11/01/545471218f10b.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454712228d5e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471232acd7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547123e894d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54547124af9cb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/545471254667f.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '5701598036413', '0', 'a:6:{i:947;s:9:\"黑啤酒\";i:943;s:6:\"德博\";i:944;s:6:\"德国\";i:915;s:12:\"原装进口\";i:948;s:6:\"HARBOE\";i:946;s:5:\"500ml\";}');
INSERT INTO `weixin_item` VALUES ('339', '354', '0', 'HARBOE 德博小麦啤酒 500mL 德国原装进口', '德博 小麦啤酒 500mL 德国原装进口', null, null, null, '1411/01/54547023cf511.png', '11.90', '0.00', '1', '0', '0', '1413611258', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/01/54546f4dc5588.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f4eef625.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f4f664b2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f4fbeb20.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f5028841.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f5072560.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f50b230d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f515ae46.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f51c3b80.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546f5230a10.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '5701598036192', '0', 'a:6:{i:943;s:6:\"德博\";i:944;s:6:\"德国\";i:915;s:12:\"原装进口\";i:803;s:6:\"小麦\";i:945;s:6:\"啤酒\";i:946;s:5:\"500mL\";}');
INSERT INTO `weixin_item` VALUES ('340', '354', '0', 'HARBOE德博 金啤酒 500mL 德国原装进口', 'HARBOE德博 金啤酒 500mL 德国原装进口', null, null, null, '1410/18/5442034acbd36.png', '11.90', '0.00', '1', '0', '0', '1413612367', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/11/01/54546e4fe8d97.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/11/01/54546e5083fbd.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">商品名称：德博金啤酒500ml<br />\r\n原 &nbsp;产 国：德国<br />\r\n酒 &nbsp;精 度：5。9%vol. /原麦汁浓度：12°P<br />\r\n原料及辅料：水、麦芽、啤酒花<br />\r\n贮存条件：常温避光<br />\r\n保 &nbsp;质 期：12个月<br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e83ecc77.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e8484dec.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e8504e28.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e855260c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e85bc431.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/54546e8650915.jpg\" alt=\"\" /><br />\r\n<br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '5701598031096', '0', 'a:6:{i:943;s:6:\"德博\";i:944;s:6:\"德国\";i:915;s:12:\"原装进口\";i:945;s:6:\"啤酒\";i:948;s:6:\"HARBOE\";i:946;s:5:\"500mL\";}');
INSERT INTO `weixin_item` VALUES ('341', '352', '0', '士力架花生夹心巧克力51g', '士力架花生夹心巧克力51g', null, null, null, '1410/18/54420b0f20d13.png', '3.80', '0.00', '1', '0', '0', '1413614355', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544deb1c7cb39.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb2087f69.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb2573bc3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb290ab8a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb2c9f728.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb30dc60a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deb35b60ef.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '48', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973603394', '0', 'a:5:{i:949;s:9:\"士力架\";i:950;s:6:\"夹心\";i:951;s:6:\"花生\";i:757;s:9:\"巧克力\";i:952;s:3:\"51g\";}');
INSERT INTO `weixin_item` VALUES ('342', '352', '0', '士力架 花生夹心巧克力家庭装 460g/包', '士力架 花生夹心巧克力家庭装 460g/包', null, null, null, '1410/18/54420d3176616.png', '35.00', '0.00', '1', '0', '0', '1413614900', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dede80569b.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	保质期：295天<br />\r\n配料：牛奶巧克力（白砂糖、可可液块、可可脂、脱脂乳粉、乳糖、乳脂肪、精炼食用油<br />\r\n、乳化剂（大豆磷脂），食品用香料）、花生仁、葡萄糖浆、白砂糖、脱脂乳粉、乳脂肪<br />\r\n、食用盐、鸡蛋蛋白粉、食品用香料。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544deded60ff2.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedf05a9f7.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedf7cacb7.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedfacbb0f.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedfd7a16e.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedfdb6b36.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dedfe32189.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dee019c1d0.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dee01dc6e5.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973206106', '0', 'a:6:{i:949;s:9:\"士力架\";i:950;s:6:\"夹心\";i:951;s:6:\"花生\";i:757;s:9:\"巧克力\";i:630;s:6:\"家庭\";i:953;s:3:\"460\";}');
INSERT INTO `weixin_item` VALUES ('343', '352', '0', 'FERRERO ROCHER费列罗榛果威化巧克力3粒 37.5g(意大利进口 袋)', 'FERRERO ROCHER费列罗榛果威化巧克力3粒 37.5g(意大利进口 袋)', null, null, null, '1410/18/54420f4bb6eb5.jpg', '8.50', '0.00', '1', '0', '0', '1413615437', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544deee9aa1e6.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deeed99d9d.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deef2b745d.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deef623984.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deef928990.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544deefce471d.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '16', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '80050278', '0', 'a:9:{i:808;s:6:\"榛果\";i:796;s:6:\"威化\";i:584;s:9:\"意大利\";i:757;s:9:\"巧克力\";i:734;s:6:\"进口\";i:954;s:7:\"FERRERO\";i:955;s:6:\"ROCHER\";i:956;s:6:\"费列\";i:957;s:4:\"37.5\";}');
INSERT INTO `weixin_item` VALUES ('344', '352', '0', '猫哆哩酸角果派148g', '猫哆哩酸角果派148g', null, null, null, '1410/18/54421106b1449.jpg', '7.90', '0.00', '1', '0', '0', '1413615883', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de99b5eae1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de99d1a845.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de99e20df8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de99f0e41c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de9a131c10.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de9a2d96d7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de9a47dda5.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6925901420563', '0', 'a:2:{i:958;s:6:\"角果\";i:959;s:4:\"148g\";}');
INSERT INTO `weixin_item` VALUES ('345', '352', '0', '德芙 丝滑牛奶巧克力(袋装)84g', '德芙 丝滑牛奶巧克力(袋装)84g', null, null, null, '1410/18/5442124c60a89.png', '13.50', '0.00', '1', '0', '0', '1413616208', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8cf1c320.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d012049.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品牌】：德芙</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【名称】：德芙 丝滑牛奶巧克力</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【储存方法】：阴凉通风，阳光无法直射的地方</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【配料表】：可可液块，白砂糖，乳脂肪，可可脂，精炼食用植物油，食品添加剂乳化剂（大豆磷脂），食用香料，可</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">可含量不低于20%，可可黄烷醇含量不低于250毫克/100克，可能含有微量麸质和坚果果仁成分。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【食用方法】：开袋即食</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【保质期】：52周</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d2c7b30.png\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d4137ea.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d5f1e4c.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d72f7fa.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de8d8eefd4.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '7', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973604285', '0', 'a:5:{i:960;s:6:\"德芙\";i:818;s:6:\"袋装\";i:757;s:9:\"巧克力\";i:725;s:6:\"牛奶\";i:961;s:3:\"84g\";}');
INSERT INTO `weixin_item` VALUES ('346', '352', '0', '德芙 奶香白巧克力(袋装)84g', '德芙 奶香白巧克力(袋装)84g', null, null, null, '1410/18/5442130ee1184.png', '13.50', '0.00', '1', '0', '0', '1413616404', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7c3ba7a1.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7c49803c.jpg\" alt=\"\" />、\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	【品牌】：德芙<br />\r\n【名称】：德芙 奶香白巧克力<br />\r\n【储存方式】：阴凉通风处，避免阳光直射的地方<br />\r\n【配料表】：可可液块，白砂糖，乳脂肪，可可脂，精炼食用植物油，食品添加剂乳化剂（大豆磷脂），食用香料。<br />\r\n【食用方法】：开袋即食<br />\r\n【净含量】：84g<br />\r\n【保质期】：52周\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7c81b365.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7c9847a4.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7ca6d2c7.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7cbce2c5.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7cd8bcbb.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973604315', '0', 'a:4:{i:960;s:6:\"德芙\";i:818;s:6:\"袋装\";i:757;s:9:\"巧克力\";i:961;s:3:\"84g\";}');
INSERT INTO `weixin_item` VALUES ('347', '352', '0', '德芙 香浓黑巧克力(袋装)84g', '德芙 香浓黑巧克力(袋装)84g', null, null, null, '1410/18/544213b312816.png', '13.50', '0.00', '1', '0', '0', '1413616568', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de7148ac61.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de71560da9.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品牌】：德芙</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【名称】：德芙 香浓黑巧克力</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【储存方式】：阴凉通风，避免阳光直射的地方</span> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【配料表】：可可液块，白砂糖，乳脂肪，可可脂，精炼食用植物油，食品添加剂乳化剂（大豆磷脂），</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">食用香料，可可含量不低于20%，可可黄烷醇含量不低于250毫克/100克。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【食用方法】：开袋即食。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【保质期】：52周</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【净含量】：84g</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de717c870c.png\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de718eb17e.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de71a76f42.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de71bd731f.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de71d955d0.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973604292', '0', 'a:5:{i:960;s:6:\"德芙\";i:962;s:6:\"浓黑\";i:818;s:6:\"袋装\";i:757;s:9:\"巧克力\";i:961;s:3:\"84g\";}');
INSERT INTO `weixin_item` VALUES ('348', '352', '0', '德芙 榛仁果粒巧克力(袋装)84g', '德芙 榛仁果粒巧克力(袋装)84g', null, null, null, '1410/18/5442145fcbee6.png', '13.50', '0.00', '1', '0', '0', '1413616738', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5ccc971c.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5cda131c.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【品牌】：德芙</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【名称】：德芙 榛仁果粒巧克力</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【存放位置】：阴凉通风，避免阳光直射的地方</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【配料表】：可可液块，白砂糖，乳脂肪，可可脂，精炼食用植物油，食品添加剂乳化剂（大豆磷脂），食用香料，</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">可可含量不低于20%，可可黄烷醇含量不低于250毫克/100克，可能含有微量麸质和坚果果仁成分。</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【食用方法】：开袋即食</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【净重】：84g</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">【保质期】：52周</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5cfc463d.png\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5d12f229.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5d320e02.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de5d4b9df5.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914973604308', '0', 'a:5:{i:960;s:6:\"德芙\";i:963;s:6:\"果粒\";i:818;s:6:\"袋装\";i:757;s:9:\"巧克力\";i:961;s:3:\"84g\";}');
INSERT INTO `weixin_item` VALUES ('349', '352', '0', 'HERSHEY\'S 好时杏仁牛奶巧克力82g', 'HERSHEY\'S 好时杏仁牛奶巧克力82g', null, null, null, '1410/18/544215e4e47dd.png', '17.80', '0.00', '1', '0', '0', '1413617129', '255', '1', '<h2>\r\n	<p style=\"text-align:center;padding:0px;margin-top:0px;margin-bottom:0px;list-style:none;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n		<img src=\"./data/upload/editer/image/2014/10/27/544de4b8aa8c1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de4ba96065.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de4bc1cdb1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de4bd5bf54.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de4be7bb48.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de4cce6f2c.jpg\" alt=\"\" /> \r\n	</p>\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '9', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6942836700218', '0', 'a:5:{i:638;s:6:\"杏仁\";i:964;s:9:\"HERSHEY\'S\";i:757;s:9:\"巧克力\";i:725;s:6:\"牛奶\";i:965;s:3:\"82g\";}');
INSERT INTO `weixin_item` VALUES ('350', '352', '0', 'hershey\'s 好时黑巧克力（袋装82g）', 'hershey\'s 好时黑巧克力（袋装82g）', null, null, null, '1410/18/544216cd1c67e.png', '17.80', '0.00', '1', '0', '0', '1413617359', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544de3747cd5f.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">商品品牌：KISSES好时之吻</span><br />\r\n<span style=\"white-space:nowrap;\">商品名称：黑巧克力</span><br />\r\n<span style=\"white-space:nowrap;\">商品配料：白砂糖、可可液块、可可脂、脱脂奶粉、碱化可可粉、无水奶油、大豆磷脂、聚甘油蓖麻醇酯、食用香料.</span><br />\r\n<span style=\"white-space:nowrap;\">净 含 量：82克</span><br />\r\n<span style=\"white-space:nowrap;\">执行标准：GB/T 19343</span><br />\r\n<span style=\"white-space:nowrap;\">保质期：15个月</span><br />\r\n<span style=\"white-space:nowrap;\">储存条件：请置于阴凉干燥清洁处存放，避免阳光直射.</span><br />\r\n<span style=\"white-space:nowrap;\">建议储存温度：10℃-22℃ .相对湿度：50%-60%.</span><br />\r\n<span style=\"white-space:nowrap;\">过敏源信息：本产品可能含微量其它坚果仁/花生/小麦成份.</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de38e01d49.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">项目<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>每100克<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>NRV%</span><br />\r\n<span style=\"white-space:nowrap;\">能量<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>2294kJ<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>27%</span><br />\r\n<span style=\"white-space:nowrap;\">蛋白质<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>6.7g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>11%</span><br />\r\n<span style=\"white-space:nowrap;\">脂肪<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>36.81g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>61%</span><br />\r\n<span style=\"white-space:nowrap;\">碳水化合物<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>47.9g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>16%</span><br />\r\n<span style=\"white-space:nowrap;\">钠<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>31mg<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>2%</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de3a212d69.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">1907年，被誉为美国巧克力工业标志的好时kisses巧克力诞生。Milton hershey先</span><br />\r\n<span style=\"white-space:nowrap;\">生运用他的奇思妙想把香浓的牛奶与纯正的可可融合，滴落，变成娇小玲珑的水滴</span><br />\r\n<span style=\"white-space:nowrap;\">状kisses,它好似滴滴美丽活泼的小精灵，带着百年的经典醇香，跳着灵动的舞步，</span><br />\r\n<span style=\"white-space:nowrap;\">盈盈而来。每一滴kisses都值得用心细细品味，每一滴kisses都值得和你关爱的人</span><br />\r\n<span style=\"white-space:nowrap;\">一起分享。</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de3c6ad0f7.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">好时 KISSES好时之吻 黑巧克力好时巧克力的轻柔，舒软，细腻，入口即可感受到一股</span><br />\r\n<span style=\"white-space:nowrap;\">浓郁的黑巧克力芳香，咬下去黑巧克力的醇厚香浓更是一颗一颗让人欲罢不能！</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de418373ea.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">好时 KISSES好时之吻，小身材 大味道 好吃又好玩，放一滴kisses在口中吧，让浓</span><br />\r\n<span style=\"white-space:nowrap;\">郁的甜美缓缓散开，弥漫，沉醉其中......感受kisses，分享kis ses！</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544de43312b85.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '8', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6942836700171', '0', 'a:4:{i:818;s:6:\"袋装\";i:964;s:9:\"hershey\'s\";i:757;s:9:\"巧克力\";i:965;s:3:\"82g\";}');
INSERT INTO `weixin_item` VALUES ('351', '352', '0', 'Hershey\'s/好时 好时之吻 榛仁牛奶巧克力 82g', 'Hershey\'s/好时 好时之吻 榛仁牛奶巧克力 82g', null, null, null, '1410/18/544217831c06c.png', '17.80', '0.00', '1', '0', '0', '1413617541', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dde596f594.jpg\" alt=\"\" /><br />\r\n商品品牌：KISSES好时之吻<br />\r\n商品名称：榛仁牛奶巧克力<br />\r\n商品配料：牛奶巧克力、榛仁.<br />\r\n商品类型：混合型巧克力制品<br />\r\n净 含 量：82克（巧克力部分可可脂含量：≥18%）<br />\r\n执行标准：GB/T 19343<br />\r\n保质期：15个月<br />\r\n储存条件：请置于阴凉干燥清洁处存放，避免阳光直射.<br />\r\n建议储存温度：10℃-22℃ .相对湿度：50%-60%.<br />\r\n过敏源信息：本产品可能含微量其它坚果仁/花生/小麦成份<br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dde6fec051.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><br />\r\n<span style=\"white-space:nowrap;\">项目<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>每100克<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>NRV%</span><br />\r\n<span style=\"white-space:nowrap;\">能量<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>2381kj<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>28%</span><br />\r\n<span style=\"white-space:nowrap;\">蛋白质<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>9.7g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>16%</span><br />\r\n<span style=\"white-space:nowrap;\">脂肪<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>36.3g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>61%</span><br />\r\n<span style=\"white-space:nowrap;\">碳水化合物<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>50.9g<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>17%</span><br />\r\n<span style=\"white-space:nowrap;\">钠<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>85mg<span class=\"Apple-tab-span\" style=\"white-space:pre;\"> </span>4%</span><br />\r\n	<div style=\"white-space:nowrap;\">\r\n		<br />\r\n	</div>\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dde89e86fe.jpg\" alt=\"\" /><br />\r\n1907年，被誉为美国巧克力工业标志的好时kisses巧克力诞生。Milton hershey先<br />\r\n生运用他的奇思妙想把香浓的牛奶与纯正的可可融合，滴落，变成娇小玲珑的水滴<br />\r\n状kisses,它好似滴滴美丽活泼的小精灵，带着百年的经典醇香，跳着灵动的舞步，<br />\r\n盈盈而来。每一滴kisses都值得用心细细品味，每一滴kisses都值得和你关爱的人<br />\r\n一起分享。<br />\r\n	<div>\r\n		<br />\r\n	</div>\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddee0076b2.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">好时 KISSES好时之吻 榛仁牛奶巧克力 好时巧克力的轻柔，舒软，细腻，</span><br />\r\n<span style=\"white-space:nowrap;\">入口即可感受到一股浓郁的巧克力芳香，咬下去巧克力与香脆的榛仁融合</span><br />\r\n<span style=\"white-space:nowrap;\">后的醇厚香浓更是一颗一颗让人欲罢不能！</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddf050e1de.jpg\" alt=\"\" /><br />\r\n<span style=\"white-space:nowrap;\">好时 KISSES好时之吻，小身材 大味道 好吃又好玩，放一滴kisses在口中</span><br />\r\n<span style=\"white-space:nowrap;\">吧，让浓郁的甜美缓缓散开，弥漫，沉醉其中......感受kisses，分享kis ses！</span><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddf2e47f1d.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6942836700256', '0', 'a:4:{i:964;s:9:\"Hershey\'s\";i:757;s:9:\"巧克力\";i:725;s:6:\"牛奶\";i:965;s:3:\"82g\";}');
INSERT INTO `weixin_item` VALUES ('352', '354', '0', '佳饮百香果汁 山竹汁（越南进口）', '佳饮百香果汁饮料 山竹汁', null, null, null, '1410/18/54421c1d5bf85.png', '6.80', '0.00', '1', '0', '0', '1413618717', '255', '1', '<p style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544ddca82d949.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddcaf37767.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddcb659a17.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddcbd94abf.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddcc3d6528.png\" alt=\"\" /> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:0px;\">描述加载中</span> \r\n</p>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8936020038674', '0', 'a:3:{i:966;s:6:\"百香\";i:800;s:6:\"山竹\";i:914;s:12:\"果汁饮料\";}');
INSERT INTO `weixin_item` VALUES ('353', '359', '0', 'woogie野莓味糖粒200g(奥地利进口 罐)', 'woogie野莓味糖粒200g(奥地利进口 罐)', null, null, null, '1412/02/547d6958d6fe8.jpg', '19.60', '0.00', '1', '0', '0', '1413619009', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544ddc0271837.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc06620df.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc0b5958d.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc10a6dbd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc15d0fd7.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc1b078c0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc20eeae3.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc27b7e4e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc2cb8417.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc338227b.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544ddc372a931.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9002859055614', '0', 'a:4:{i:967;s:9:\"奥地利\";i:734;s:6:\"进口\";i:968;s:6:\"woogie\";i:737;s:4:\"200g\";}');
INSERT INTO `weixin_item` VALUES ('354', '359', '0', 'woogie櫻桃味糖粒200g(奥地利进口 罐)', 'woogie櫻桃味糖粒200g(奥地利进口 罐)', null, null, null, '1412/02/547d68f6ed350.jpg', '19.60', '0.00', '1', '0', '0', '1413619118', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dd8eda5584.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd8f20923c.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd8f60b1f1.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd8fa28e06.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd8ff495c2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd906057dc.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd90b6f263.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd911a1133.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd91583576.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd91aa9dc7.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd9201621a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd9238ded5.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9002859055560', '0', 'a:4:{i:967;s:9:\"奥地利\";i:734;s:6:\"进口\";i:968;s:6:\"woogie\";i:737;s:4:\"200g\";}');
INSERT INTO `weixin_item` VALUES ('355', '359', '0', 'woogie柠檬味糖粒200g(奥地利进口 罐)', 'woogie柠檬味糖粒200g(奥地利进口 罐)', null, null, null, '1410/18/54421e6ecc38f.png', '19.60', '0.00', '1', '0', '0', '1413619315', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dd7aa883b0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7aeaa064.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7b3586d3.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7b956799.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7bdb363f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7c3bf1ae.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7c8c882a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7cf112da.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7d5345ef.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7dbbffe9.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7e225e6c.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd7e745137.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9002859055591', '0', 'a:5:{i:969;s:9:\"柠檬味\";i:967;s:9:\"奥地利\";i:734;s:6:\"进口\";i:968;s:6:\"woogie\";i:737;s:4:\"200g\";}');
INSERT INTO `weixin_item` VALUES ('356', '359', '0', 'woogie综合水果味糖粒200g(奥地利进口 罐)', 'woogie综合水果味糖粒200g(奥地利进口 罐)', null, null, null, '1410/18/54421fdc10513.png', '19.60', '0.00', '1', '0', '0', '1413619680', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/27/544dd5f9929ac.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd5fd9e382.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd6020bfed.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd606a1e17.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd60bc2a72.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd610a9709.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd61729a0a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd61e05c66.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd62191f0a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd62630e5f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd62aa491b.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/27/544dd62db12be.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9002859055553', '0', 'a:6:{i:967;s:9:\"奥地利\";i:729;s:6:\"水果\";i:734;s:6:\"进口\";i:968;s:6:\"woogie\";i:730;s:6:\"综合\";i:737;s:4:\"200g\";}');
INSERT INTO `weixin_item` VALUES ('357', '360', '0', 'COBIZCO 3合1 香草拿铁咖啡 （即溶咖啡饮料） 25g*5 马来西亚进口 ', 'COBIZCO 3合1 香草拿铁咖啡 （即溶咖啡饮料） 25g*5 马来西亚进口 ', null, null, null, '1410/20/54447a8c45a05.png', '13.90', '0.00', '1', '0', '0', '1413773971', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M03/B8/F0/CgQI0FQ2HJyABObSAAJpBDp28uQ94900.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N06/M09/BA/6A/CgQIzVQ2HJ-AOjxIAADpaJBsSwY28600.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M03/B8/D5/CgQIz1Q2HKGANfSgAAKajBpqwDk64400.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N06/M0B/BA/6A/CgQIzVQ2HKWAMIVhAAK3Tp6OdRQ43100.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M05/B8/D5/CgQIz1Q2HKeATOB3AAGr_cChFRo56600.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N05/M01/1D/2E/CgQI0lQ2HKmAUTAeAAGZkH6zRFo90500.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/V00/M07/66/88/CgQDsVQ2HKuATikFAAFnEklibE074400.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N05/M05/1D/2E/CgQI0lQ2HK2ARNSVAAIrVz3E9-s29500.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/V00/M06/66/93/CgQDslQ2HLCARll8AAInvVl36RY47700.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N05/M02/1A/4C/CgQI01Q2HLKAE1ZXAAHHUQ6veGc69600.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><br />\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555098802254', '0', 'a:8:{i:762;s:6:\"即溶\";i:763;s:6:\"咖啡\";i:764;s:12:\"马来西亚\";i:765;s:6:\"香草\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:767;s:7:\"COBIZCO\";i:768;s:2:\"25\";}');
INSERT INTO `weixin_item` VALUES ('358', '360', '0', 'COBIZCO 3合1 卡布奇诺咖啡 （即溶咖啡饮料） 20g*5 马来西亚进口 ', 'COBIZCO 3合1 卡布奇诺咖啡 （即溶咖啡饮料） 20g*5 马来西亚进口 ', null, null, null, '1410/20/54447b30f2588.png', '13.90', '0.00', '1', '0', '0', '1413774134', '255', '1', '<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M08/B8/CC/CgQIz1Q2GsKAaj6GAAJTxab_mc433700.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N06/M03/BA/60/CgQIzVQ2GsWAWUmbAAHyhOV7zbo03800.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N06/M01/BA/5D/CgQIzlQ2GsiAH0uoAAKjRFEwyaw25800.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M0A/B8/CC/CgQIz1Q2GsqAELD0AAJDq-6yh5c96200.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/V00/M0A/66/76/CgQDsVQ2Gs2ACZy0AALwhI4jBbc38300.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N07/M00/B8/E7/CgQI0FQ2Gs-AZSAaAAFzcDOBEpQ43900.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/V00/M09/66/7C/CgQDsFQ2GtOAVBq8AAJeh9kKvcs51100.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/V00/M0A/66/7D/CgQDsFQ2GtWAbTQ2AAIz-Pt1EzM44100.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><img class=\"blogimg\" src=\"http://d6.yihaodianimg.com/N06/M08/BA/61/CgQIzVQ2GtqAaq7GAAHHdAE5YVo29500.jpg\" style=\"padding:0px;margin:0px;border-style:none;vertical-align:top;color:#333333;font-family:\'microsoft yahei\';font-size:14px;line-height:normal;white-space:normal;background-color:#FFFFFF;\" /><br />\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555098800236', '0', 'a:9:{i:762;s:6:\"即溶\";i:970;s:6:\"卡布\";i:971;s:6:\"奇诺\";i:763;s:6:\"咖啡\";i:764;s:12:\"马来西亚\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:767;s:7:\"COBIZCO\";i:972;s:2:\"20\";}');
INSERT INTO `weixin_item` VALUES ('359', '360', '0', 'COBIZCO 3合1 榛果白咖啡（即溶咖啡饮料）25g*5 马来西亚进口', 'COBIZCO 3合1 榛果白咖啡（即溶咖啡饮料）25g*5 马来西亚进口', null, null, null, '1410/20/54447c004d5d4.png', '13.90', '0.00', '1', '0', '0', '1413774343', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544d03b792fe0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03b881f32.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03bb181a5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03bde1543.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03bfa159d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03c16b986.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03c3415da.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03c560351.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03c7a073b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544d03c9407aa.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555098800175', '0', 'a:8:{i:762;s:6:\"即溶\";i:808;s:6:\"榛果\";i:763;s:6:\"咖啡\";i:764;s:12:\"马来西亚\";i:766;s:6:\"饮料\";i:734;s:6:\"进口\";i:767;s:7:\"COBIZCO\";i:768;s:2:\"25\";}');
INSERT INTO `weixin_item` VALUES ('360', '347', '0', '金纺薰衣草衣物护理剂2l（瓶装）', '金纺薰衣草衣物护理剂2l（瓶装）', null, null, null, '1410/20/54447facb8a75.png', '28.50', '0.00', '1', '0', '0', '1413775287', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544caa62c9904.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6411299.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa64c061a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6583628.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6713906.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa684da6f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6953f98.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6aa9c6f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6b70bfa.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6c36312.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caa6d00bab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caab5f0352.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caab736eb0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caab8400bc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caab933bcf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caaba4ad5c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caabaed20f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caabbf3f07.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caabd05a8d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caabddde5f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caac9b6bfb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caaca69f7e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544caacb84090.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088700558', '0', 'a:5:{i:602;s:6:\"瓶装\";i:973;s:6:\"衣物\";i:974;s:9:\"薰衣草\";i:625;s:6:\"护理\";i:975;s:6:\"金纺\";}');
INSERT INTO `weixin_item` VALUES ('361', '347', '0', '立白 全效护理洗衣液2L +688克（洁语蔷薇）', '立白 全效护理洗衣液2L +688克（洁语蔷薇）新旧包装随机发送', null, null, null, '1410/20/544483ec939eb.png', '34.70', '0.00', '1', '0', '0', '1413776365', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/10/26/544ca8f5d0819.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8f7a65c2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8fb1c92f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8fe0010f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca900091a8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca901f2984.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca903487fe.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca904e435e.png\" alt=\"\" /><br />\r\n</span> \r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920174700800', '0', 'a:9:{i:976;s:6:\"全效\";i:977;s:9:\"洗衣液\";i:980;s:6:\"新旧\";i:978;s:6:\"蔷薇\";i:625;s:6:\"护理\";i:981;s:6:\"随机\";i:982;s:6:\"发送\";i:983;s:6:\"包装\";i:979;s:3:\"688\";}');
INSERT INTO `weixin_item` VALUES ('362', '347', '0', '汰渍全效360度洗衣液 3000g（买二千克送一千克超值装）', '汰渍全效360度洗衣液 3000g（买二千克送一千克超值装）', null, null, null, '1410/20/544488d21a16f.png', '37.60', '0.00', '1', '0', '0', '1413777618', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/10/26/544ca87e4182d.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8800f22e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8813e901.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca883587d0.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca8845e460.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca887deee8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca88a055fd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca88bec24c.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca88e52980.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca890663f2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca892d0e34.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca894c6680.png\" alt=\"\" /><br />\r\n</span> \r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148205518', '0', 'a:7:{i:984;s:6:\"千克\";i:976;s:6:\"全效\";i:711;s:6:\"汰渍\";i:977;s:9:\"洗衣液\";i:680;s:6:\"超值\";i:985;s:5:\"3000g\";i:683;s:3:\"360\";}');
INSERT INTO `weixin_item` VALUES ('363', '348', '0', '榄菊 生姜洗洁精1.5kg/瓶  送方巾', '榄菊 生姜洗洁精1.5kg/瓶  送方巾', null, null, null, '1410/20/54448bda2f734.png', '15.90', '0.00', '1', '0', '0', '1413778402', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca795a5f82.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca796679a7.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：榄菊 生姜去腥洗洁精<br />\r\n【品牌】：榄菊<br />\r\n【规格】：1.5kg<br />\r\n【产地】：中国<br />\r\n【保质期】：2年<br />\r\n【主要成分】：温和表面活性剂，生姜精华<br />\r\n【使用方法】：加本品数滴于清水中，将餐具、果蔬浸泡洗涤，再用清水<br />\r\n冲洗干净。也可将本品滴在抹布上，直接擦拭餐具、炊具等表面，再用清水洗净\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca797b2fd3.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca7984d282.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca7994e997.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79a040d2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79ab5eea.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79c0f980.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79ccaccd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79e6ee76.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca79f84552.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902312300561', '0', 'a:5:{i:986;s:9:\"洗洁精\";i:987;s:6:\"方巾\";i:988;s:6:\"生姜\";i:989;s:3:\"1.5\";i:990;s:2:\"kg\";}');
INSERT INTO `weixin_item` VALUES ('364', '348', '0', '榄菊 草莓温和滋润洗洁精1.5kg/瓶 送方巾', '榄菊 草莓温和滋润洗洁精1.5kg/瓶 送方巾', null, null, null, '1410/20/54448cb191a5e.png', '15.90', '0.00', '1', '0', '0', '1413778617', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca70a3d863.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca70ab00be.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：榄菊草莓温和滋润洗洁精<br />\r\n【品牌】：榄菊<br />\r\n【规格】：1.5kg<br />\r\n【产地】：中国<br />\r\n【保质期】：2年<br />\r\n【主要成分】：温和表面活性剂，草莓果香精华<br />\r\n【使用方法】：加本品数滴于清水中，将餐具、果蔬浸泡洗涤，再用清水冲<br />\r\n洗干净。也可将本品滴在抹布上，直接擦拭餐具、炊具等表面，再用清水洗净\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca70bbad97.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca70c9e71d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca70d55105.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca70e2f181.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca70ed5987.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca70ff2374.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca710bce02.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca7120b748.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca71361d62.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902312302077', '0', 'a:7:{i:986;s:9:\"洗洁精\";i:987;s:6:\"方巾\";i:678;s:6:\"草莓\";i:626;s:6:\"滋润\";i:991;s:6:\"温和\";i:989;s:3:\"1.5\";i:990;s:2:\"kg\";}');
INSERT INTO `weixin_item` VALUES ('365', '348', '0', '立白 新金桔洗洁精1.29kg', '立白 新金桔洗洁精1.29kg', null, null, null, '1410/20/5444900392ff5.jpg', '12.90', '0.00', '1', '0', '0', '1413779459', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/10/26/544ca6177cbe4.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca6190ff04.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca619338ad.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca61ac5548.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca61b26247.png\" alt=\"\" /><br />\r\n</span> \r\n</div>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920174736939', '0', 'a:4:{i:986;s:9:\"洗洁精\";i:992;s:6:\"金桔\";i:993;s:4:\"1.29\";i:990;s:2:\"kg\";}');
INSERT INTO `weixin_item` VALUES ('366', '347', '0', '超能 天然皂粉(馨香炫彩) 680g', '超能 天然皂粉(馨香炫彩) 680g', null, null, null, '1410/20/54449287eba3d.png', '11.90', '0.00', '1', '0', '0', '1413780108', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca388bf96a.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca38a9f38b.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：超能 天然皂粉(馨香炫彩)<br />\r\n品 &nbsp; &nbsp; &nbsp;牌：超能<br />\r\n生产日期：见包装<br />\r\n净 &nbsp; 含 量：680g<br />\r\n产品特色：易溶解，易漂清. 轻松做家务，快乐享受生活。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca38ba3e3a.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca38cc2f90.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca38e0f3f2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca38f09e09.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6910019008390', '0', 'a:6:{i:994;s:6:\"炫彩\";i:995;s:6:\"皂粉\";i:996;s:6:\"超能\";i:997;s:6:\"馨香\";i:998;s:6:\"天然\";i:999;s:4:\"680g\";}');
INSERT INTO `weixin_item` VALUES ('367', '347', '0', 'OMO 奥妙 净蓝全效无磷洗衣粉 洁净清新 500g', 'OMO 奥妙 净蓝全效无磷洗衣粉 洁净清新 500g', null, null, null, '1410/20/5444bf6390546.jpg', '5.30', '0.00', '1', '0', '0', '1413791602', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca30b14607.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca30bdbf97.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：OMO/奥妙 净蓝全效无磷洗衣粉 500g<br />\r\n【产品规格】：500g<br />\r\n【保质期】：3年<br />\r\n【产品功效】：超强去渍，保护双手<br />\r\n【适合范围】：适用于棉、麻、化纤及混纺等各种质地纤维<br />\r\n【产品说明】：请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗<br />\r\n【使用方法】：取适量本品，安装正确洗涤方法洗涤\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca30d887a4.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca30e3aebb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca310d81a5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca3121d3ec.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca3215da6e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '14', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6902088702835', '0', 'a:8:{i:976;s:6:\"全效\";i:716;s:6:\"无磷\";i:1000;s:9:\"洗衣粉\";i:717;s:6:\"奥妙\";i:1001;s:6:\"洁净\";i:645;s:6:\"清新\";i:1002;s:4:\"500g\";i:719;s:3:\"OMO\";}');
INSERT INTO `weixin_item` VALUES ('368', '347', '0', '汰渍净白去渍洗衣粉（袋装508克）', '汰渍净白去渍洗衣粉（袋装508克）', null, null, null, '1410/20/5444c0b290730.png', '5.00', '0.00', '1', '0', '0', '1413791925', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca2394d27c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca23a24dd4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca23b1bd94.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca23c59e62.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148078891', '0', 'a:5:{i:711;s:6:\"汰渍\";i:1003;s:6:\"净白\";i:818;s:6:\"袋装\";i:1000;s:9:\"洗衣粉\";i:1004;s:3:\"508\";}');
INSERT INTO `weixin_item` VALUES ('369', '352', '0', '奇多 美式粟米棒（火鸡味）60g/袋', '奇多 美式粟米棒（火鸡味）60g/袋', null, null, null, '1410/20/5444c2702cead.png', '3.20', '0.00', '1', '0', '0', '1413792371', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544ca0d568e38.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca0d658c35.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：奇多 美式火鸡味粟米棒<br />\r\n口 &nbsp; &nbsp; &nbsp;味：美式火鸡味<br />\r\n主要配料：玉米粉，植物油，美式火鸡味调味料(白砂糖，谷氨酸钠，<br />\r\n食用盐，葡萄糖，酱油粉，洋葱粉，食用香精，香辛料，淀粉，植物<br />\r\n油，二氧化硅，柠檬酸，双乙酸钠，5\'-鸟苷酸二钠，5\'-肌苷酸二<br />\r\n钠，焦糖色，阿斯巴甜(含苯丙氨酸))。<br />\r\n致敏源信息：含有小麦、大豆和牛奶<br />\r\n净 &nbsp;含 量：60克<br />\r\n产 &nbsp; &nbsp; &nbsp;地：上海市 北京市<br />\r\n保 &nbsp;质 期：9个月<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;食品生产许可证编号： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;QS3117 1201 0019 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; QS1100 1201 0035 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />\r\n具体产地请以生产日期旁的字母为准<br />\r\n产品标准号：GB/T 22699<br />\r\n贮存条件：请存放在凉爽干燥处，避免阳光直射。开袋后请即食用，以免受潮。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544ca0d703133.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca0d79e7b9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca0da4a73f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca0dbba768.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544ca0dc03be9.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6924743911673', '0', 'a:4:{i:1005;s:6:\"粟米\";i:1006;s:6:\"火鸡\";i:1007;s:6:\"美式\";i:1008;s:2:\"60\";}');
INSERT INTO `weixin_item` VALUES ('370', '352', '0', '奇多 粟米棒（日式牛排味）60g/袋', '奇多 粟米棒（日式牛排味）60g/袋', null, null, null, '1410/20/5444c2ad5397c.png', '3.20', '0.00', '1', '0', '0', '1413792433', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9fb08be54.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9fb1c3012.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：奇多 日式牛排味粟米棒<br />\r\n口 &nbsp; &nbsp; &nbsp;味：日式牛排味<br />\r\n主要配料：玉米粉，植物油，日式牛排味调味料(白砂糖，淀粉，谷氨酸钠，<br />\r\n食用盐，水解植物蛋白，麦芽糊精，洋葱粉，焦糖色，食用香精，大蒜粉，<br />\r\n酱油粉，二氧化硅，香辛料，植物油，5\'-鸟苷酸二钠，5\'-肌苷酸二钠，阿<br />\r\n斯巴甜(含苯丙氨酸))。<br />\r\n致敏原信息：含有小麦、大豆和牛奶。<br />\r\n净 &nbsp;含 量：60克<br />\r\n产 &nbsp; &nbsp; &nbsp;地：上海市 北京市<br />\r\n保 &nbsp;质 期：9个月<br />\r\n食品生产许可证编号：<br />\r\nQS3117 1201 0019<br />\r\nQS1100 1201 0035<br />\r\n具体产地请以生产日期旁的字母为准<br />\r\n产品标准号：GB/T 22699<br />\r\n贮存条件：请存放在凉爽干燥处，避免阳光直射。开袋后请即食用，以免受潮。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9fb24baa3.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9fb2ddfc9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9fb57fcf8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9fb77fff2.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9fb819515.png\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6924743911659', '0', 'a:4:{i:1005;s:6:\"粟米\";i:1009;s:6:\"牛排\";i:1010;s:6:\"日式\";i:1008;s:2:\"60\";}');
INSERT INTO `weixin_item` VALUES ('371', '352', '0', '有友 泡椒凤爪 80g', '有友 泡椒凤爪 80g', null, null, null, '1412/02/547d6ba71cd4b.jpeg', '3.90', '0.00', '1', '0', '0', '1413794223', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9c91b9248.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;line-height:1.5;\">产品配料：&nbsp;</span> \r\n</div>\r\n<span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">鲜鸡爪、泡椒调味品及多种调辅料等</span> \r\n</div>\r\n</span> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"white-space:nowrap;\"><br />\r\n</span> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">产品特点：</span> \r\n</div>\r\n</span><span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">1.泡菜清香和脂肪氨基酸的组合香型&nbsp;</span> \r\n</div>\r\n</span><span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">2.清爽舒展、脆嫩爽口，老少皆宜的口感&nbsp;</span> \r\n</div>\r\n</span><span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">3.低盐、微酸、淡辣、回甜的复合口味&nbsp;</span> \r\n</div>\r\n</span><span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">4.高蛋白、低脂肪、多氨基酸、易消化吸收的营养特色&nbsp;</span> \r\n</div>\r\n</span><span style=\"white-space:nowrap;\"> \r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\">5.辣味十足，回味无穷。</span> \r\n</div>\r\n</span> \r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;white-space:nowrap;\">\r\n	<br />\r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9c937bd9e.jpg\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9c9433dd4.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n</div>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9c94b6786.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/10/26/544c9de509809.png\" alt=\"\" /> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"></span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '60', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922145801011', '0', 'a:3:{i:1011;s:6:\"有友\";i:1012;s:6:\"凤爪\";i:761;s:3:\"80g\";}');
INSERT INTO `weixin_item` VALUES ('372', '361', '0', '利进 香辣龙虾味片 100g 菲律宾进口', '利进 香辣龙虾味片 100g 菲律宾进口', null, null, null, '1410/20/5444cba13b4e9.png', '7.90', '0.00', '1', '0', '0', '1413794726', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9ef029ae7.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9ef0a424b.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		原 &nbsp;产 国：菲律宾<br />\r\n商品名称：利进香辣龙虾味片<br />\r\n配 &nbsp; &nbsp; &nbsp;料：面粉、木薯淀粉、植物油、龙虾肉、发酵粉、龙虾香料（龙虾、胡椒粉、玉米淀粉）、白砂糖、碘盐、味精、日落黄、柠檬黄<br />\r\n净 &nbsp;含 量：100g<br />\r\n贮藏条件：请置于阴凉干燥处<br />\r\n保 &nbsp;质 期：12个月\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9ef1a1c79.png\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef303d87.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef442d5c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef589489.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef6913a6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef77d51c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9ef7e4983.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4801688109810', '0', 'a:6:{i:1013;s:6:\"香辣\";i:898;s:9:\"菲律宾\";i:1014;s:6:\"龙虾\";i:734;s:6:\"进口\";i:1015;s:6:\"利进\";i:710;s:4:\"100g\";}');
INSERT INTO `weixin_item` VALUES ('373', '361', '0', '甜甜圈 牛奶花生味  台湾进口', '甜甜圈 牛奶花生味  台湾进口', null, null, null, '1410/20/5444ced3b891e.png', '7.60', '0.00', '1', '0', '0', '1413795540', '255', '1', '<div style=\"text-align:center;\">\r\n	<span style=\"line-height:1.5;\"><img src=\"./data/upload/editer/image/2014/10/26/544c9e53a1978.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9e5582e07.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9e5713787.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9e584c2d8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9e5ae9e41.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9e5b654f0.jpg\" alt=\"\" /><br />\r\n</span> \r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4712245013030', '0', 'a:5:{i:754;s:6:\"台湾\";i:951;s:6:\"花生\";i:1016;s:6:\"甜甜\";i:725;s:6:\"牛奶\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('374', '362', '0', 'ABC 夜用纤薄棉柔排湿表层卫生巾8片（含KMS健康配方）', 'ABC 夜用纤薄棉柔排湿表层卫生巾8片（含KMS健康配方）', null, null, null, '1410/26/544d0655d5f3c.jpg', '10.90', '0.00', '1', '0', '0', '1414042864', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9b504b0ac.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9b515c1cb.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		<span style=\"white-space:nowrap;\">ABC夜用纤薄棉柔排湿表层卫生巾8片</span><br />\r\n<span style=\"white-space:nowrap;\">（含KMS健康配方）</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">产 &nbsp; 地：中国</span><br />\r\n<span style=\"white-space:nowrap;\">保质期：730天</span><br />\r\n<span style=\"white-space:nowrap;\">产品特点：棉质,长度：280mm 独有KMS健康配方，清爽、凉快 革新科技--蓝芯2。</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">注意事项：方便,卫生,经期应每2-3小时更换一次,以免细菌入侵</span> \r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9b532c969.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b53c9996.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b54b0a78.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5584f0b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b55e99cf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5678c0e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5789d9f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b58691a7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5909865.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5a4c55d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5b62eb8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5c0e0df.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5cd6226.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5d7e818.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9b5f65dab.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922731800770', '0', 'a:7:{i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1019;s:6:\"表层\";i:1020;s:6:\"配方\";i:1021;s:6:\"健康\";i:1022;s:3:\"KMS\";i:1023;s:3:\"ABC\";}');
INSERT INTO `weixin_item` VALUES ('375', '362', '0', 'ABC 日用纤薄棉柔排湿表层卫生巾8片（含KMS健康配方）', 'ABC 日用纤薄棉柔排湿表层卫生巾8片（含KMS健康配方）', null, null, null, '1410/23/5448992a0ff36.png', '10.60', '0.00', '1', '0', '0', '1414043490', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<div align=\"center\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n		<br />\r\n	</div>\r\n	<div class=\"content_tpl\" style=\"margin:0px auto;padding:0px;width:753px;color:#666666;font-family:Arial, Verdana, 宋体;white-space:normal;background-color:#FFFFFF;\">\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n				<img src=\"/data/upload/item/1410/23/5448975fe4780.jpg\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n				<img src=\"/data/upload/item/1410/23/544897608338e.jpg\" /><img src=\"/data/upload/item/1410/23/544897611fde4.jpg\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n				<img src=\"/data/upload/item/1410/23/54489761c34b3.jpg\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_img\" style=\"margin:0px auto;padding:0px;width:750px;text-align:center;\">\r\n				<img src=\"/data/upload/item/1410/23/5448976257596.jpg\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_titleleft\" style=\"margin:0px;padding:0px;line-height:25px;font-weight:700;\">\r\n				健康小贴士：\r\n			</div>\r\n			<div class=\"formwork_text\" style=\"margin:0px;padding:0px;width:753px;text-indent:2em;\">\r\n				使用时期：适合流量一般或较少的姐妹们在高峰期的那几天使用，更安心！ 贴心建议：经期应2-3个小时内更换一次卫生巾，以免细菌入侵。\r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\" style=\"margin:0px;padding:10px 0px;overflow:hidden;width:753px;border-bottom-width:1px;border-bottom-style:dashed;border-bottom-color:#E6E6E6;line-height:23px;font-family:Arial, Helvetica, sans-serif;font-size:14px;\">\r\n			<div class=\"formwork_titleleft\" style=\"margin:0px;padding:0px;line-height:25px;font-weight:700;\">\r\n				品牌故事\r\n			</div>\r\n			<div class=\"formwork_text\" style=\"margin:0px;padding:0px;width:753px;text-indent:2em;\">\r\n				您的每一次转变都有它相伴…… 健康•爱相随 ABC个人护理品牌，名称源于英文单词“Always Being Clean“的首字母，寓意永远地追求清洁、卫生与健康。 ABC品牌下含有卫生巾、卫生护垫、湿巾及护理液等个人护理用品，专为爱惜自己，注重个人护理与健康，追求高品质生活的女性而设。\r\n			</div>\r\n		</div>\r\n	</div>\r\n<br />\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922731800695', '0', 'a:7:{i:1018;s:9:\"卫生巾\";i:1019;s:6:\"表层\";i:1020;s:6:\"配方\";i:1024;s:6:\"日用\";i:1021;s:6:\"健康\";i:1023;s:3:\"ABC\";i:1022;s:3:\"KMS\";}');
INSERT INTO `weixin_item` VALUES ('376', '363', '0', 'ABC 丝薄棉柔护垫22片（含KMS健康配方）', 'ABC 丝薄棉柔护垫22片（含KMS健康配方）', null, null, null, '1410/23/54489e05d8072.png', '8.80', '0.00', '1', '0', '0', '1414044790', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9a6c7101f.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9a6d6deb8.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		<span style=\"white-space:nowrap;\">ABC丝薄棉柔护垫22片</span><br />\r\n<span style=\"white-space:nowrap;\">（含KMS健康配方）</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">产 &nbsp; 地：中国</span><br />\r\n<span style=\"white-space:nowrap;\">保质期：730天</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">产品特点：棉质,长度：163mm &nbsp;独有KMS健康配方，清爽、凉快 。</span><br />\r\n<span style=\"white-space:nowrap;\"><br />\r\n</span><span style=\"white-space:nowrap;\">注意事项：中量吸收，适合每天或分泌物较少时使用</span> \r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9a6f1aa7e.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a6fced98.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a70c9b5a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a723648a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a7375468.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a7428497.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a75b70f3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a767a4e7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a7843c1f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a78cab44.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a79c345f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9a7b74a87.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922731800800', '0', 'a:5:{i:1025;s:6:\"护垫\";i:1020;s:6:\"配方\";i:1021;s:6:\"健康\";i:1022;s:3:\"KMS\";i:1023;s:3:\"ABC\";}');
INSERT INTO `weixin_item` VALUES ('377', '363', '0', 'ABC 超吸棉柔护垫22片(含KMS健康配方)', 'ABC 超吸棉柔护垫22片(含KMS健康配方)', null, null, null, '1410/23/54489cf8042af.png', '8.80', '0.00', '1', '0', '0', '1414044923', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c99bd4cc04.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c99c152428.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922731800121', '0', 'a:5:{i:1025;s:6:\"护垫\";i:1020;s:6:\"配方\";i:1021;s:6:\"健康\";i:1022;s:3:\"KMS\";i:1023;s:3:\"ABC\";}');
INSERT INTO `weixin_item` VALUES ('378', '362', '0', '七度空间 少女系列 纯棉透气超长夜用超薄卫生巾 338mm 8片', '七度空间 少女系列 纯棉透气超长夜用超薄卫生巾 338mm 8片', null, null, null, '1410/23/5448abca7ce51.png', '7.80', '0.00', '1', '0', '0', '1414048718', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c99475ac1c.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9947f0500.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品品牌】：七度空间<br />\r\n【商品名称】：少女系列纯棉透气超长夜用超薄卫生巾<br />\r\n【商品规格】：338mm*8片/包<br />\r\n【商品材质】：纯棉<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c9949f0c17.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c994ba1eb5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c994c7931c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c994f12aed.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9950b67fb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9952b0b46.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370998', '0', 'a:10:{i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1026;s:6:\"超长\";i:1027;s:6:\"透气\";i:1028;s:6:\"纯棉\";i:1029;s:6:\"超薄\";i:1030;s:6:\"少女\";i:591;s:6:\"系列\";i:1031;s:5:\"338mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('379', '362', '0', '七度空间 优雅系列透气超薄型丝柔夜用卫生巾10片装 275mm', '七度空间 优雅系列薄型丝柔夜用卫生巾10片装 275mm', null, null, null, '1410/23/5448acf2a4bc3.png', '8.90', '0.00', '1', '0', '0', '1414049013', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c98d2571e0.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c98d30a6eb.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：七度空间 优雅系列卫生巾 10片 275mm 丝柔表层<br />\r\n【商品品牌】：七度空间<br />\r\n【商品规格】：275mm*10片/盒<br />\r\n【商品材质】：纯棉<br />\r\n【保质日期】：3年&nbsp;\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c98d4cf04b.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98d5a7033.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98d7109bd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98da9f2f3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98dc6ff2d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98dd889c8.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370431', '0', 'a:7:{i:1017;s:6:\"夜用\";i:1032;s:6:\"薄型\";i:1018;s:9:\"卫生巾\";i:1033;s:6:\"优雅\";i:591;s:6:\"系列\";i:1034;s:5:\"275mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('380', '362', '0', '七度空间 少女系列 纯棉透气超薄夜用卫生巾 10片装 275mm', '七度空间 少女系列 纯棉透气超薄夜用卫生巾 10片装 275mm', null, null, null, '1410/23/5448b3ba709a5.png', '8.90', '0.00', '1', '0', '0', '1414050750', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c984aabc59.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c984b988c2.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品品牌】：七度空间<br />\r\n【商品名称】：少女系列纯棉透气超薄夜用卫生巾<br />\r\n【商品规格】：275mm*10片/包<br />\r\n【商品材质】：纯棉<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c984cf0054.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c984d84220.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c984ee0511.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98508ca88.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c98541fe74.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c985538124.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370974', '0', 'a:9:{i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1028;s:6:\"纯棉\";i:1027;s:6:\"透气\";i:1029;s:6:\"超薄\";i:1030;s:6:\"少女\";i:591;s:6:\"系列\";i:1034;s:5:\"275mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('381', '362', '0', '七度空间 少女系列 纯棉透气超薄日用卫生巾 245mm 10片装', '七度空间 少女系列 纯棉透气超薄日用卫生巾 245mm 10片装', null, null, null, '1410/23/5448b42d10c99.png', '7.80', '0.00', '1', '0', '0', '1414050867', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c97a175fec.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c97a2540f9.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品品牌】：七度空间<br />\r\n【商品名称】：少女系列纯棉透气超薄日用卫生巾<br />\r\n【商品规格】：245mm*10片/包<br />\r\n【商品材质】：纯棉<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c97a41ecc6.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c97a4ad8aa.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c97a56bd9f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c97a74aae8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c97a95d086.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c97aa50910.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370950', '0', 'a:9:{i:1018;s:9:\"卫生巾\";i:1028;s:6:\"纯棉\";i:1027;s:6:\"透气\";i:1029;s:6:\"超薄\";i:1024;s:6:\"日用\";i:1030;s:6:\"少女\";i:591;s:6:\"系列\";i:1035;s:5:\"245mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('382', '362', '0', '七度空间 优雅系列透气超薄丝柔日用卫生巾10片装 245mm', '七度空间 优雅系列透气超薄丝柔日用卫生巾10片装 245mm', null, null, null, '1410/23/5448b75fc7232.png', '7.60', '0.00', '1', '0', '0', '1414051683', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c96e404131.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c96e552f06.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		七度空间 优雅系列卫生巾 10片 245mm 丝柔表层 日用<br />\r\n【商品品牌】：七度空间<br />\r\n【产 &nbsp; &nbsp; &nbsp; 地】：中国<br />\r\n【商品规格】：245mm*10片/盒<br />\r\n【商品材质】：纯棉<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c96e7194eb.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96e8045b4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96e896130.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96e991742.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96eb51123.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96ed4eb16.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c96ee1b52b.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370424', '0', 'a:8:{i:1018;s:9:\"卫生巾\";i:1027;s:6:\"透气\";i:1029;s:6:\"超薄\";i:1024;s:6:\"日用\";i:1033;s:6:\"优雅\";i:591;s:6:\"系列\";i:1035;s:5:\"245mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('383', '362', '0', '七度空间 纯棉超薄夜用卫生巾5片装 275mm', '七度空间 纯棉超薄夜用卫生巾5片装 275mm', null, null, null, '1410/23/5448c06362525.png', '5.60', '0.00', '1', '0', '0', '1414053991', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9667e4d70.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c966880417.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9669a9c3f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c966a9a5db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c966c783ac.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c966d83c1d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c966ee51a8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c967033ee0.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370967', '0', 'a:6:{i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1028;s:6:\"纯棉\";i:1029;s:6:\"超薄\";i:1034;s:5:\"275mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('384', '362', '0', '七度空间 纯棉透气超薄日用卫生巾5片装 245mm', '七度空间 纯棉透气超薄日用卫生巾5片装 245mm', null, null, null, '1410/23/5448c192d2ea5.png', '4.80', '0.00', '1', '0', '0', '1414054293', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c95e8bccd5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c95ea9cfcd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c95ec21755.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370943', '0', 'a:7:{i:1018;s:9:\"卫生巾\";i:1027;s:6:\"透气\";i:1028;s:6:\"纯棉\";i:1029;s:6:\"超薄\";i:1024;s:6:\"日用\";i:1035;s:5:\"245mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('385', '362', '0', '七度空间 卫生巾优雅系列 丝柔表层日用5片/包245mm', '七度空间 卫生巾优雅系列 丝柔表层日用5片/包245mm', null, null, null, '1410/23/5448c4bc7142c.png', '4.90', '0.00', '1', '0', '0', '1414055104', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c95894058c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c958a8da89.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c958b3cfc3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c958c86420.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c958d38d60.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c958e4ea34.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c959036203.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370448', '0', 'a:7:{i:1018;s:9:\"卫生巾\";i:1019;s:6:\"表层\";i:1024;s:6:\"日用\";i:1033;s:6:\"优雅\";i:591;s:6:\"系列\";i:1035;s:5:\"245mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('386', '362', '0', '七度空间 卫生巾优雅系列丝柔表层夜用5片275mm', '七度空间 卫生巾优雅系列丝柔表层夜用5片275mm', null, null, null, '1410/23/5448c527394d0.png', '5.90', '0.00', '1', '0', '0', '1414055213', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c925e80383.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c925f5d63c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c92601612c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c92607567f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c926153e51.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370455', '0', 'a:7:{i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1019;s:6:\"表层\";i:1033;s:6:\"优雅\";i:591;s:6:\"系列\";i:1034;s:5:\"275mm\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('387', '362', '0', '七度空间 少女系列 纯棉透气超长夜用超薄卫生巾 338mm 4片', '七度空间SPACE 7 少女系列超薄特长夜用4片装 338mm', null, null, null, '1410/23/5448ca7713f27.png', '6.20', '0.00', '1', '0', '0', '1414056576', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c91c39c326.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91c4df6a7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91c58c5da.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91c6b02df.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91c7caf07.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91c9678ce.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91cae714e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244370981', '0', 'a:8:{i:1017;s:6:\"夜用\";i:1029;s:6:\"超薄\";i:1036;s:6:\"特长\";i:1030;s:6:\"少女\";i:591;s:6:\"系列\";i:1031;s:5:\"338mm\";i:1037;s:5:\"SPACE\";i:546;s:6:\"空间\";}');
INSERT INTO `weixin_item` VALUES ('388', '362', '0', '护舒宝 超净棉pinkcess卫生巾 5片 240mm 棉柔丝薄 日用', '护舒宝 超净棉pinkcess卫生巾 5片 240mm 棉柔丝薄 日用', null, null, null, '1410/23/5448d0288ac64.png', '5.90', '0.00', '1', '0', '0', '1414058029', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c9100a39c1.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c91016f332.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：护舒宝 超净棉pinkcess绵柔丝薄 日用卫生巾 240mm 5片<br />\r\n【有效期】：3年<br />\r\n【产地】：中国<br />\r\n【规格】：240mm*5片<br />\r\n【适用范围】：日用<br />\r\n【商品特色】：日本研发纯肌棉表层，极致柔软，2倍速吸，表层超透气，并含异味净化因子，超清新<br />\r\n【包装说明】：无外包装盒、无塑封、无防伪贴<br />\r\n【温馨提示】：新老包装随机出售\r\n	</p>\r\n	<div>\r\n		<br />\r\n	</div>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c91021f2c7.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91033e3c9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91049ea48.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c910632069.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91077c1f0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9107c8d04.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c91098da5e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '19', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148138175', '0', 'a:6:{i:1038;s:6:\"超净\";i:1039;s:6:\"柔丝\";i:1018;s:9:\"卫生巾\";i:1024;s:6:\"日用\";i:1040;s:8:\"pinkcess\";i:1041;s:5:\"240mm\";}');
INSERT INTO `weixin_item` VALUES ('389', '362', '0', '护舒宝 超净棉pinkcess卫生巾 5片 284mm 棉柔丝薄 量多日用夜用', '护舒宝 超净棉pinkcess卫生巾 5片 284mm 棉柔丝薄 量多日用夜用', null, null, null, '1410/23/5448d10482dd3.png', '7.60', '0.00', '1', '0', '0', '1414058249', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c908024cb1.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c90808eda4.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：护舒宝 超净棉pinkcess棉柔丝薄 量多日/夜卫生巾 284mm 5片<br />\r\n【有效期】：3年<br />\r\n【产地】：中国<br />\r\n【规格】：284mm*5片<br />\r\n【适用范围】：日夜用<br />\r\n【商品特色】：日本研发纯肌棉表层，极致柔软，2倍速吸，表层超透气，并含异味净化因子，超清新<br />\r\n【包装说明】：无外包装盒、无塑封、无防伪贴<br />\r\n【温馨提示】：新老包装随机出售\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c90814977f.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c90836e7d7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c908552ba9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9088545b9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c9089c9ea4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c908b5bde7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c908c31f2a.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148138205', '0', 'a:7:{i:1038;s:6:\"超净\";i:1039;s:6:\"柔丝\";i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1024;s:6:\"日用\";i:1040;s:8:\"pinkcess\";i:1042;s:5:\"284mm\";}');
INSERT INTO `weixin_item` VALUES ('390', '362', '0', '护舒宝 超值干爽丝薄夜用卫生巾 5片', '护舒宝 超值干爽丝薄夜用卫生巾 5片', null, null, null, '1410/23/5448d36c0a0f2.png', '4.60', '0.00', '1', '0', '0', '1414058863', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8f9026ce6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8f927707b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8f958af3f.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8f964204c.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		护舒宝 超值干爽丝薄夜用卫生巾5片<br />\r\n保质期：1095天<br />\r\n品牌：护舒宝/whisper<br />\r\n表层：干爽网面 &nbsp;<br />\r\n规格：5片<br />\r\n长度：280mm<br />\r\n产品功效：护舒宝超值系列，新包装上市，不再单调。产品特有的一干二净超吸蓝TM，能吸收吸收5倍潮涌量,持久干爽。\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8f9923250.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8f9a8670b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8f9c04bae.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8f9d32908.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148075487', '0', 'a:4:{i:1017;s:6:\"夜用\";i:1043;s:6:\"干爽\";i:1018;s:9:\"卫生巾\";i:680;s:6:\"超值\";}');
INSERT INTO `weixin_item` VALUES ('391', '362', '0', '护舒宝 瞬洁丝薄2倍干爽保护卫生巾 5+1片 240mm 干爽网面 日用', '护舒宝 瞬洁丝薄2倍干爽保护卫生巾 5+1片 240mm 干爽网面 日用', null, null, null, '1410/23/5448d4b0e3c00.png', '6.90', '0.00', '1', '0', '0', '1414059194', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8eb4a5e24.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8eb57cee1.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：护舒宝 瞬洁丝薄日用卫生巾（5+1）片<br />\r\n【有效期】：3年<br />\r\n【产地】：中国<br />\r\n【规格】：240mm*6片<br />\r\n【适用范围】：日用<br />\r\n【商品特色】：1、1秒瞬吸，2倍干爽保护！2、V型防漏，挑战0渗漏！3、紧贴背胶+4向防漏圈，防漏指数再升级！<br />\r\n【包装说明】：无外包装盒、无塑封、无防伪贴\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8eb68684b.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8eb83f853.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8eba46dd0.gif\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8ebc36aa1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8ebd9c52e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148031940', '0', 'a:5:{i:1043;s:6:\"干爽\";i:1018;s:9:\"卫生巾\";i:1024;s:6:\"日用\";i:1044;s:6:\"保护\";i:1041;s:5:\"240mm\";}');
INSERT INTO `weixin_item` VALUES ('392', '362', '0', '苏菲 口袋魔法日用超薄卫生巾 24cm 10片', '苏菲 口袋魔法日用超薄卫生巾 24cm 10片', null, null, null, '1410/24/5449e4b2d90ad.png', '9.90', '0.00', '1', '0', '0', '1414128820', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8e304430c.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8e3122f2c.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：苏菲口袋魔法零味感超薄棉柔日用洁翼型24cm 10片<br />\r\n【保质期 】 ：1095天<br />\r\n【产品特点1】：仅普通卫生巾1/2*大小的手掌尺寸，方便携带<br />\r\n【产品特点2】：巾身印有炫美心形甜美俏皮小花纹,使用时也有缤纷好心情。<br />\r\n【产品特点3】： 240mm棉柔超薄日用卫生巾\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c8e32e1ef5.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8e345dabb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8e350aac6.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6934660555119', '0', 'a:7:{i:1045;s:6:\"苏菲\";i:1018;s:9:\"卫生巾\";i:1029;s:6:\"超薄\";i:1024;s:6:\"日用\";i:1046;s:6:\"口袋\";i:1047;s:6:\"魔法\";i:1048;s:4:\"24cm\";}');
INSERT INTO `weixin_item` VALUES ('393', '362', '0', 'SOFY/苏菲弹力贴身量多日用卫生巾5片极薄吸收0.1 棉柔', 'SOFY/苏菲弹力贴身量多日用卫生巾5片极薄吸收0.1 棉柔', null, null, null, '1410/24/5449e66741751.png', '5.50', '0.00', '1', '0', '0', '1414129257', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8d4bce13e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8d4fe2f1c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8d513d6b8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8d54bcd65.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6934660520216', '0', 'a:8:{i:1045;s:6:\"苏菲\";i:1049;s:6:\"身量\";i:1018;s:9:\"卫生巾\";i:1050;s:6:\"弹力\";i:1024;s:6:\"日用\";i:1051;s:6:\"吸收\";i:1052;s:4:\"SOFY\";i:1053;s:3:\"0.1\";}');
INSERT INTO `weixin_item` VALUES ('394', '362', '0', '苏菲卫生巾超熟睡350超薄随心翻棉柔夜用4片 最新绮幻梦境限定装', '苏菲卫生巾超熟睡350超薄随心翻棉柔夜用4片 最新绮幻梦境限定装', null, null, null, '1410/24/5449ea3887de3.png', '7.80', '0.00', '1', '0', '0', '1414130233', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8c1a2c53c.jpg\" alt=\"\" style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" /><br style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8c1bbd329.jpg\" alt=\"\" style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" /><br style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8c1cc1727.jpg\" alt=\"\" style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" /><br style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8c1d67876.jpg\" alt=\"\" style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" /><br style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8c1e07c97.jpg\" alt=\"\" style=\"color:#3C3C3C;font-family:\'helvetica neue\', tahoma, \'hiragino sans gb\', stheiti, \'wenquanyi micro hei\', 微软雅黑, 宋体, sans-serif;text-align:center;white-space:normal;\" /><br />\r\n</div>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6934660516615', '0', 'a:10:{i:1054;s:6:\"定装\";i:1045;s:6:\"苏菲\";i:1017;s:6:\"夜用\";i:1018;s:9:\"卫生巾\";i:1055;s:6:\"随心\";i:1056;s:6:\"熟睡\";i:1029;s:6:\"超薄\";i:1057;s:6:\"梦境\";i:543;s:6:\"最新\";i:1058;s:3:\"350\";}');
INSERT INTO `weixin_item` VALUES ('395', '346', '0', '心心相印清香3层手帕纸 10+2包 /条 压花清新香型', '原生木桨，柔韧不易破，吸水、吸油性强', null, null, null, '1410/24/5449f5a44cc7c.png', '7.80', '0.00', '1', '0', '0', '1414133159', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8af984c73.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8afd60509.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8affe44ff.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8b007b831.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8b020bb43.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8b0463344.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244955102', '0', 'a:6:{i:1065;s:6:\"木桨\";i:1066;s:6:\"柔韧\";i:1067;s:6:\"原生\";i:1068;s:6:\"油性\";i:1069;s:6:\"吸水\";i:1070;s:6:\"不易\";}');
INSERT INTO `weixin_item` VALUES ('396', '346', '0', 'Vinda维达 倍韧系列 3层10张迷你手帕纸巾12包', 'Vinda维达 倍韧系列 3层10张迷你手帕纸巾12包', null, null, null, '1410/24/5449f674a1176.png', '7.90', '0.00', '1', '0', '0', '1414133371', '255', '1', '<div style=\"text-align:center;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c8a13686f7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a14b7b66.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a160cd20.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a17d9a91.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a19274f9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a1a80613.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a1bddcb4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8a1d7881e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901236380642', '0', 'a:6:{i:1062;s:6:\"维达\";i:1060;s:6:\"手帕\";i:1063;s:6:\"纸巾\";i:787;s:6:\"迷你\";i:591;s:6:\"系列\";i:1064;s:5:\"Vinda\";}');
INSERT INTO `weixin_item` VALUES ('397', '346', '0', '清风 绿茶茉香型 3层迷你手帕纸超值装18包/条', '清风 绿茶茉香型 3层迷你手帕纸超值装18包/条', null, null, null, '1410/24/5449f85b49112.png', '11.90', '0.00', '1', '0', '0', '1414133854', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c88b98cccf.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c88baa4928.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		商品名称：清风3层绿茶茉迷你型手帕纸18包条<br />\r\n品牌：清风<br />\r\n主要成分：100%原生木浆<br />\r\n产品规格：10张/包，12+6包/组<br />\r\n保质期：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c88bc0c58e.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c88bd70276.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c88be3d8a8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c88c01a44b.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c88c0c82cd.jpg\" alt=\"\" /> \r\n	</p>\r\n<br />\r\n</div>\r\n<p style=\"text-align:center;padding-bottom:10px;\">\r\n	<span style=\"white-space:normal;\">“清风”纸巾是金红叶纸业集团下的生活用纸品牌之一，金红叶纸业集团还包含“真真”“唯洁雅”生活用纸品牌。金红叶纸业成立于1996年3月，注册于苏州工业园区，占地114平方公顷，总投资达10.6亿美元，第一期投资额为3.6亿美元。1998年8月开始投产，年产生活用纸12万吨，是亚洲最大的生活用纸产销公司。拥有欧洲制造的世界上最先进的生产设备和技术。由金光集团所属的亚洲浆纸股份有限公司投资。 设有行销系统及营运销售系统，负责全国行销企划及销售，并在全国各地设立分公司、办事处及前进仓库。获得ISO9001和ISO14001体系认证。</span> \r\n</p>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922266445378', '0', 'a:6:{i:640;s:6:\"香型\";i:1060;s:6:\"手帕\";i:632;s:6:\"绿茶\";i:590;s:6:\"清风\";i:680;s:6:\"超值\";i:787;s:6:\"迷你\";}');
INSERT INTO `weixin_item` VALUES ('398', '346', '0', '洁柔面子系列古龙水香味4层迷你面巾*10包(可湿水)', '洁柔面子系列古龙水香味4层迷你面巾*10包(可湿水)', null, null, null, '1410/24/5449fb942729b.png', '7.90', '0.00', '1', '0', '0', '1414134676', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c87c97e119.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c87ca37281.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【商品名称】：洁柔面子系列古龙水香味4层迷你面巾*10包(可湿水)<br />\r\n【商品类别】：手帕纸<br />\r\n【品牌】：洁柔<br />\r\n【商品规格】：203mm*208mm*4层*8抽/包*10包/条<br />\r\n【有无香味】：古龙香味\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/26/544c87cc1bb71.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87ceb9444.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87d08054a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87d456b9d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87d88c6e5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87dc3777c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87dfc4dfe.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87e13c563.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87e262209.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87e47c738.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87e57198b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c87e6e5d63.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}</style>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6914068011950', '0', 'a:7:{i:1071;s:9:\"古龙水\";i:1072;s:6:\"面巾\";i:1073;s:6:\"香味\";i:1074;s:6:\"面子\";i:787;s:6:\"迷你\";i:591;s:6:\"系列\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('399', '346', '0', '清风原木纯品系列2层200抽抽取式面纸*3包 206mmx195mm', '清风原木纯品系列2层200抽抽取式面纸*3包 206mmx195mm', null, null, null, '1410/24/544a023d80c8c.png', '16.90', '0.00', '1', '0', '0', '1414136043', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544c85f46e5ef.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85f5e9967.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85f7de38e.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85f9d2662.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85fc2bf5b.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85fdde8ff.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c85ff7b3dd.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8601bb3a9.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/26/544c8603b51a6.png\" alt=\"\" /><br />\r\n<br />\r\n	<div>\r\n		<br />\r\n	</div>\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}</style>', '0', '0', '16', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922266443138', '0', 'a:7:{i:1075;s:9:\"抽取式\";i:1076;s:6:\"面纸\";i:589;s:6:\"原木\";i:1077;s:11:\"206mmx195mm\";i:590;s:6:\"清风\";i:591;s:6:\"系列\";i:570;s:3:\"200\";}');
INSERT INTO `weixin_item` VALUES ('400', '346', '0', '清风原木纯品系列2层200抽抽取式面纸*3包 206mmx136mm', '清风原木纯品系列2层200抽抽取式面纸*3包 206mmx136mm', null, null, null, '1410/24/544a0213210ab.png', '11.90', '0.00', '1', '0', '0', '1414136200', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/25/544b64343b4e1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6435a1d8c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b643660c4d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b643722f93.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b64384519d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b64393fdfa.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b643b4c5b7.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '16', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922266440106', '0', 'a:7:{i:1075;s:9:\"抽取式\";i:1076;s:6:\"面纸\";i:589;s:6:\"原木\";i:1078;s:11:\"206mmx136mm\";i:590;s:6:\"清风\";i:591;s:6:\"系列\";i:570;s:3:\"200\";}');
INSERT INTO `weixin_item` VALUES ('401', '346', '0', '心相印面巾纸200抽*3包', '无备注颜色随机', null, null, null, '1410/24/544a039b02b5d.png', '15.90', '0.00', '1', '0', '0', '1414136731', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/25/544b63b16e43b.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/25/544b63b21b4d1.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【货号】：DT200<br />\r\n【商品规格】：208mm*210mm 2层*200抽/包<br />\r\n【包装规格】：3包/提<br />\r\n【压花香型】：无压花无香型<br />\r\n【商品成分】：100%原生木浆<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/25/544b63b2d6eae.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63b346a06.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63b61581e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63b719a81.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63b84553e.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '16', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244984157', '0', 'a:3:{i:1085;s:6:\"备注\";i:981;s:6:\"随机\";i:1086;s:6:\"颜色\";}');
INSERT INTO `weixin_item` VALUES ('402', '346', '0', '维达蓝色经典系列3层140g卷筒卫生纸*10卷  超值送纸面巾60抽', '维达蓝色经典系列3层140g卷筒卫生纸*10卷  超值送纸面巾60抽', null, null, null, '1410/24/544a064b6b34d.png', '22.90', '0.00', '1', '0', '0', '1414137419', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6332206e3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63333584d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6334063fd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b63355d9b0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6335f36d1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6336922db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6337151cb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6337a1b5d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6338bc3b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6339727e7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6339c5236.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b633ad30cb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b633be7629.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b633ca6ca8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b633d7085e.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6901236373934', '0', 'a:10:{i:1062;s:6:\"维达\";i:1081;s:6:\"卷筒\";i:1072;s:6:\"面巾\";i:1082;s:9:\"卫生纸\";i:680;s:6:\"超值\";i:1083;s:6:\"蓝色\";i:591;s:6:\"系列\";i:582;s:6:\"经典\";i:682;s:4:\"140g\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('403', '346', '0', '清风 原木纯品系列3层270段卷纸*10+2卷', '清风 原木纯品系列3层270段卷纸*10+2卷', null, null, null, '1410/24/544a089fc0f44.png', '24.90', '0.00', '1', '0', '0', '1414138015', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/25/544b62249487d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6226595c2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b622789c51.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b622909fcd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b622abf768.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b622de6ae0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b622f4ef90.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n</div>\r\n<!-- Banner --><!-- 综合介绍大图 --><br />\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6922266443787', '0', 'a:6:{i:589;s:6:\"原木\";i:590;s:6:\"清风\";i:591;s:6:\"系列\";i:592;s:9:\"段卷纸\";i:1084;s:3:\"270\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('404', '346', '0', '心相印特柔3层180g卷纸*10卷', '心相印特柔3层180g卷纸*10卷', null, null, null, '1410/24/544a0987c8786.png', '32.90', '0.00', '1', '0', '0', '1414138247', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/10/25/544b616e634dd.jpg\" alt=\"\" /><br />\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/25/544b616f0ff37.jpg\" alt=\"\" /> \r\n	</p>\r\n	<p>\r\n		【货号】：BT810<br />\r\n【商品规格】：109mm*140mm/节*3层<br />\r\n【包装规格】：10粒/提<br />\r\n【商品重量】：180g/卷<br />\r\n【压花香型】：无压花无香型<br />\r\n【商品成分】：100%原生木浆<br />\r\n【保质日期】：3年\r\n	</p>\r\n	<p>\r\n		<img src=\"./data/upload/editer/image/2014/10/25/544b616f998cc.jpg\" alt=\"\" /> \r\n	</p>\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b61702474b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b617205651.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6173bf636.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b6174dd076.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/10/25/544b61758c40d.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<style type=\"text/css\">\r\np,form,input,button,dl,dt,dd,ul,ol,li,h1,h2,h3,h4{margin:0;padding:0;list-style:none;}\r\ntable .ull{}\r\ntable .ull li{ font-size:16px; font-family:\"微软雅黑\";list-style:none; padding-top:3px; line-height:30px;}\r\n</style>', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903244958103', '0', 'a:3:{i:1079;s:6:\"相印\";i:794;s:4:\"180g\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('405', '351', '0', '芒果鸡蛋布丁方盒（韩国进口）', '芒果鸡蛋布丁（韩国进口）', null, null, null, '1411/04/54589e0820a7d.png', '21.90', '0.00', '1', '0', '0', '1414227670', '255', '1', '<p>\r\n	<img src=\"/data/upload/editer/image/2014/11/04/54589e1c7db66.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/data/upload/editer/image/2014/10/25/544b66aab194d.png\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/04/54589e4e1bcf4.jpg\" alt=\"\" style=\"white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/04/54589e4dd5357.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589e4e6ba4a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589e4ee34ba.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589e4f58cb4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589e5048bbf.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:Microsoft YaHei;\"></span><span style=\"font-size:14px;line-height:1.5;font-family:\'Microsoft YaHei\';\">图片仅供参考，具体以实物为准，小孩食用果冻需要在大人监护下进行，切勿一口吞食！</span> \r\n</p>', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258032', '0', 'a:5:{i:894;s:6:\"韩国\";i:728;s:6:\"布丁\";i:892;s:6:\"芒果\";i:1089;s:6:\"鸡蛋\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('406', '359', '0', '鸡蛋布丁方盒（韩国进口）', '鸡蛋布丁', null, null, null, '1411/04/54589fc011cb2.jpg', '21.90', '0.00', '1', '0', '0', '1414317646', '255', '1', '<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/54589fe01782f.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/10/27/544ddbffb651e.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/10/26/544cc643a0cbb.png\" width=\"500\" height=\"583\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/11/04/545898b088729.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545898b11f54b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545898b1d5c21.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545898b2ef0d9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545898b3cbea3.jpg\" alt=\"\" /><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';line-height:21px;\">图片仅供参考，具体以实物为准，小孩食用果冻需要在大人监护下进行，切勿一口吞食！</span> <br />', '1', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037257370', '0', 'a:2:{i:728;s:6:\"布丁\";i:1089;s:6:\"鸡蛋\";}');
INSERT INTO `weixin_item` VALUES ('407', '359', '0', '鲜奶鸡蛋布丁方盒（韩国进口）', '鲜奶鸡蛋布丁（韩国进口）', null, null, null, '1411/04/54589b573172e.png', '21.90', '0.00', '1', '0', '0', '1414388268', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/54589ba575c41.png\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/04/54589cd2a42d2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589ba6dbdc0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589ba72eab1.jpg\" width=\"500\" height=\"422\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589ba77537c.jpg\" width=\"500\" height=\"323\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589d1249d5f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589d134ded8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589d13c2607.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';line-height:21px;\">图片仅供参考，具体以实物为准，小孩食用果冻需要在大人监护下进行，切勿一口吞食！</span> \r\n</p>', '1', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258063', '0', 'a:5:{i:894;s:6:\"韩国\";i:1088;s:6:\"鲜奶\";i:728;s:6:\"布丁\";i:1089;s:6:\"鸡蛋\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('408', '360', '0', '香港进口lafei拉菲原味营养麦片（原味）', '香港进口lafei拉菲原味营养麦片240克', null, null, null, '1411/01/5454c701ba2a0.jpg', '16.90', '0.00', '1', '0', '0', '1414838472', '255', '1', '<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-family:Microsoft YaHei;\">基础信息---</span></strong> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;【保质期】：18个月</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">【原产地】：澳洲</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;<span style=\"font-size:12px;\"><span style=\"font-size:14px;\">食用方法：将一包“拉菲”燕麦片放入杯中，加入200ML沸水，拌匀即可享用</span>。</span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp;&nbsp;</span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\"><strong>品牌介绍---</strong></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><strong>&nbsp; &nbsp; &nbsp;</strong><span style=\"font-size:14px;\">澳洲拉菲国际营养品公司是拉菲国际品牌</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">在香港投资设立的</span></span></span></span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">&nbsp;保健营养品制造商，</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"text-align:left;font-family:微软雅黑;font-size:14px;color:#000000;line-height:1.5;\">&nbsp; &nbsp;&nbsp;专业从事“拉菲”品牌营养食品研发</span><span style=\"color:#000000;font-family:微软雅黑;font-size:14px;line-height:1.5;text-align:left;\">制造与销售。</span> \r\n</p>\r\n<p align=\"center\" style=\"text-align:center;orphans:auto;widows:auto;margin-top:0px;margin-bottom:0px;padding:0px;clear:both;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"orphans:2;widows:2;\"><span style=\"color:#333333;font-family:\'Tahoma, Arial, 宋体, sans-serif\';\"><strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;white-space:normal;background-color:#FFFFFF;\">用料说明---</strong></span></span> \r\n</p>\r\n<p align=\"center\" style=\"text-align:left;orphans:auto;widows:auto;margin-top:0px;margin-bottom:0px;padding:0px;clear:both;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">面粉、黄油采用无添加原生态材料，</span><span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">利用食材本身的特色香气传达纯正香味</span><img src=\"./data/upload/editer/image/2014/11/03/5456d9f4a70bf.jpg\" alt=\"\" style=\"line-height:1.5;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;text-align:left;\" /> \r\n</p>\r\n<p align=\"center\" style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/03/5456d9f5b8517.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d9f752189.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d9f939adf.png\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/03/5456da719f52e.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"margin-top:1.12em;margin-bottom:1.12em;padding:0px;font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;line-height:21px;white-space:normal;widows:2;orphans:2;color:#404040;background-color:#FFFFFF;\">\r\n	<u><strong style=\"color:#6AA84F;font-size:24px;\"><span style=\"font-size:24px;\"></span></strong></u> \r\n</p>\r\n<p style=\"text-align:left;margin-top:1.12em;margin-bottom:1.12em;padding:0px;font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;line-height:21px;white-space:normal;widows:2;orphans:2;color:#404040;background-color:#FFFFFF;\">\r\n	<u><strong style=\"color:#6AA84F;font-size:24px;\"><img src=\"http://gd2.alicdn.com/imgextra/i2/43777551/T2j9HGXvhXXXXXXXXX_!!43777551.jpg\" width=\"500\" height=\"307\" alt=\"\" /></strong></u> \r\n</p>', '1', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710051', '0', 'a:8:{i:1090;s:6:\"拉菲\";i:1091;s:6:\"麦片\";i:547;s:6:\"香港\";i:588;s:6:\"原味\";i:1092;s:6:\"营养\";i:734;s:6:\"进口\";i:1093;s:5:\"lafei\";i:1094;s:3:\"240\";}');
INSERT INTO `weixin_item` VALUES ('409', '360', '0', 'lafei拉菲螺旋藻营养麦片（香港进口)', 'lafei拉菲螺旋藻营养麦片（香港进口)240克', null, null, null, '1411/01/5454c0034b8b9.jpg', '16.90', '0.00', '1', '0', '0', '1414840324', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;\"><span style=\"font-family:\'Microsoft YaHei\';\">基础信息---</span></strong> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;【保质期】：18个月</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">【原产地】：澳洲</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;<span style=\"font-size:12px;\"><span style=\"font-size:14px;\">食用方法：将一包“拉菲”燕麦片放入杯中，加入200ML沸水，拌匀即可享用</span>。</span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp;&nbsp;</span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\"><strong>品牌介绍---</strong></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><strong>&nbsp; &nbsp; &nbsp;</strong><span style=\"font-size:14px;\">澳洲拉菲国际营养品公司是拉菲国际品牌</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">在香港投资设立的</span></span></span></span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">&nbsp;保健营养品制造商，</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"text-align:left;font-family:微软雅黑;font-size:14px;color:#000000;line-height:1.5;\">&nbsp; &nbsp;&nbsp;专业从事“拉菲”品牌营养食品研发</span><span style=\"color:#000000;font-family:微软雅黑;font-size:14px;line-height:1.5;text-align:left;\">制造与销售。</span> \r\n</p>\r\n<p align=\"center\" style=\"margin-top:0px;margin-bottom:0px;font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;text-align:center;padding:0px;clear:both;background-color:#FFFFFF;\">\r\n	<span style=\"orphans:2;widows:2;\"><span style=\"color:#333333;font-family:\'Tahoma, Arial, 宋体, sans-serif\';\"><strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;\">用料说明---</strong></span></span> \r\n</p>\r\n<p align=\"center\" style=\"margin-top:0px;margin-bottom:0px;font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;text-align:center;padding:0px;clear:both;background-color:#FFFFFF;\">\r\n	<span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">面粉、黄油采用无添加原生态材料，</span><span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">利用食材本身的特色香气传达纯正香味</span> \r\n</p>\r\n<img src=\"/data/upload/item/1411/01/5454c0036ad34.jpg\" width=\"500\" height=\"340\" alt=\"\" /><img src=\"/data/upload/item/1411/01/5454c003c52d6.jpg\" width=\"500\" height=\"340\" alt=\"\" /><img src=\"/data/upload/item/1411/01/5454c00453553.jpg\" width=\"500\" height=\"341\" alt=\"\" /><img src=\"/data/upload/item/1411/01/5454c004c2e7a.jpg\" width=\"500\" height=\"341\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;\" /><img src=\"http://gd2.alicdn.com/imgextra/i2/43777551/T2j9HGXvhXXXXXXXXX_!!43777551.jpg\" width=\"500\" height=\"307\" alt=\"\" /> \r\n<p>\r\n	<br />\r\n</p>', '1', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710068', '0', 'a:8:{i:1090;s:6:\"拉菲\";i:1091;s:6:\"麦片\";i:1095;s:9:\"螺旋藻\";i:547;s:6:\"香港\";i:1092;s:6:\"营养\";i:734;s:6:\"进口\";i:1093;s:5:\"lafei\";i:1094;s:3:\"240\";}');
INSERT INTO `weixin_item` VALUES ('410', '360', '0', 'lafei拉菲红枣桂圆营养麦片（香港进口)', 'lafei拉菲红枣桂圆营养麦片（香港进口)', null, null, null, '1411/01/5454c4541766e.jpg', '16.90', '0.00', '1', '0', '0', '1414841429', '255', '1', '<p>\r\n	<br />\r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;\"><span style=\"font-family:\'Microsoft YaHei\';\">基础信息---</span></strong> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;【保质期】：18个月</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">【原产地】：澳洲</span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp; &nbsp;<span style=\"font-size:12px;\"><span style=\"font-size:14px;\">食用方法：将一包“拉菲”燕麦片放入杯中，加入200ML沸水，拌匀即可享用</span>。</span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\">&nbsp;&nbsp;</span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-family:微软雅黑;color:#000000;font-size:medium;\"><strong>品牌介绍---</strong></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><strong>&nbsp; &nbsp; &nbsp;</strong><span style=\"font-size:14px;\">澳洲拉菲国际营养品公司是拉菲国际品牌</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">在香港投资设立的</span></span></span></span></span></span></span></span><span style=\"font-family:宋体;color:#FF99CC;font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"font-size:14pt;\"><span style=\"color:#000000;\"><span style=\"font-size:medium;\"><span style=\"font-family:微软雅黑;\"><span style=\"font-size:14px;\">&nbsp;保健营养品制造商，</span></span></span></span></span></span></span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;font-size:12px;line-height:1.5;white-space:normal;text-align:center;padding:0px;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"text-align:left;font-family:微软雅黑;font-size:14px;color:#000000;line-height:1.5;\">&nbsp; &nbsp;&nbsp;专业从事“拉菲”品牌营养食品研发</span><span style=\"color:#000000;font-family:微软雅黑;font-size:14px;line-height:1.5;text-align:left;\">制造与销售。</span> \r\n</p>\r\n<p align=\"center\" style=\"margin-top:0px;margin-bottom:0px;font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;text-align:center;padding:0px;clear:both;background-color:#FFFFFF;\">\r\n	<span style=\"orphans:2;widows:2;\"><span style=\"color:#333333;font-family:\'Tahoma, Arial, 宋体, sans-serif\';\"><strong style=\"font-family:微软雅黑;font-size:medium;line-height:21.8181819915772px;\">用料说明---</strong></span></span> \r\n</p>\r\n<p align=\"center\" style=\"margin-top:0px;margin-bottom:0px;font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;text-align:center;padding:0px;clear:both;background-color:#FFFFFF;\">\r\n	<span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">面粉、黄油采用无添加原生态材料，</span><span style=\"color:#333333;orphans:2;widows:2;font-size:14px;font-family:\'Microsoft YaHei\';\">利用食材本身的特色香气传达纯正香味</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/03/5456d5b2cc92a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d5c58e368.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d61dac2ce.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d61e87cf6.jpg\" alt=\"\" /><br />\r\n<img src=\"http://gd2.alicdn.com/imgextra/i2/43777551/T2j9HGXvhXXXXXXXXX_!!43777551.jpg\" width=\"500\" height=\"307\" alt=\"\" style=\"font-size:12px;line-height:1.5;\" /> \r\n</p>', '1', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710044', '0', 'a:8:{i:1090;s:6:\"拉菲\";i:1091;s:6:\"麦片\";i:1096;s:6:\"桂圆\";i:1097;s:6:\"红枣\";i:547;s:6:\"香港\";i:1092;s:6:\"营养\";i:734;s:6:\"进口\";i:1093;s:5:\"lafei\";}');
INSERT INTO `weixin_item` VALUES ('411', '361', '0', '林食佳芝士苏打夹心饼干（韩国进口）', '林食佳芝士苏打夹心饼干（韩国进口）', null, null, null, '1411/01/5454cdb4d53d4.jpg', '14.90', '0.00', '1', '0', '0', '1414843829', '255', '1', '<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;font-size:16px;\"><b><span style=\"font-size:16px;font-family:\'Microsoft YaHei\';\">基础信息---</span></b></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【产品名称】：林食佳苏打夹心饼干</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【品&nbsp;&nbsp;&nbsp; &nbsp; 牌】：香港林食佳</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【规&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;格】：1*268g*20包</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【净 含 量】：268g</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【原 产 地】：韩国</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【保 质 期】：365天</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【贮存方法】：请置于阴凉干燥处，避免阳光照射</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#888888;font-family:\'Microsoft YaHei\';font-size:16px;\"><strong>产品展示---</strong></span> \r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong><img src=\"./data/upload/editer/image/2014/11/01/5454cc25acaae.jpg\" width=\"500\" height=\"500\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc297505f.png\" width=\"500\" height=\"416\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc46bdd9e.jpg\" width=\"500\" height=\"500\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454cc4918ae0.png\" width=\"500\" height=\"288\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p style=\"text-align:left;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong><strong style=\"color:#888888;font-family:\'Microsoft YaHei\';font-size:14px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\"><img src=\"/data/upload/editer/image/2014/11/03/5456d2ee75157.JPG\" alt=\"\" /></strong><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"text-align:center;margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">&nbsp;</span> \r\n</p>', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258957', '0', 'a:7:{i:824;s:6:\"芝士\";i:950;s:6:\"夹心\";i:1098;s:6:\"苏打\";i:894;s:6:\"韩国\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:891;s:9:\"林食佳\";}');
INSERT INTO `weixin_item` VALUES ('412', '361', '0', '林食佳草莓苏打夹心饼干（韩国进口）', '林食佳草莓苏打夹心饼干（韩国进口）', null, null, null, '1411/01/5454d686e72be.jpg', '14.90', '0.00', '1', '0', '0', '1414845733', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>基础信息---</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【产品名称】：热销 新品上市 林食佳草莓苏打夹心饼干</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【品&nbsp;&nbsp;&nbsp; &nbsp; 牌】：香港林食佳</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【规&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;格】：1*268g*20包</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【净 含 量】：268g</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【原 产 地】：韩国</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【保 质 期】：365天</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>【贮存方法】：请置于阴凉干燥处，避免阳光照射</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong>产品展示---</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#333333;font-family:Arial;font-size:12px;line-height:21.6000003814697px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:16px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong><img src=\"./data/upload/editer/image/2014/11/01/5454d4eb21b15.jpg\" alt=\"\" /><br />\r\n</strong></span><img src=\"./data/upload/editer/image/2014/11/01/5454d4ec2b8ae.jpg\" alt=\"\" /><strong style=\"color:#888888;font-family:\'Microsoft YaHei\';font-size:16.3636360168457px;line-height:21.6000003814697px;\"><img src=\"./data/upload/editer/image/2014/11/01/5454d4eba414f.jpg\" alt=\"\" /></strong><span style=\"font-size:16px;color:#888888;font-family:\'Microsoft YaHei\';\"><strong><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d4fd0c8ab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d4fdaa4c2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454d50c915c9.jpg\" alt=\"\" /><br />\r\n<br />\r\n</strong></span> \r\n</p>', '1', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258933', '0', 'a:7:{i:950;s:6:\"夹心\";i:1098;s:6:\"苏打\";i:894;s:6:\"韩国\";i:721;s:6:\"饼干\";i:678;s:6:\"草莓\";i:734;s:6:\"进口\";i:891;s:9:\"林食佳\";}');
INSERT INTO `weixin_item` VALUES ('413', '361', '0', '林食佳香橙苏打夹心饼干（韩国进口）', '林食佳香橙苏打夹心饼干（韩国进口）', null, null, null, '1411/01/5454e84e52f43.jpg', '14.90', '0.00', '1', '0', '0', '1414850544', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<strong style=\"font-family:simsun;font-size:12pt;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">基本信息---</span></strong> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\">【名&nbsp;&nbsp;&nbsp; 称】林食佳香橙苏打夹心饼干</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\">268g*20</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\">袋</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\">/</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\">箱</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">【成&nbsp;&nbsp;&nbsp; 份】小麦粉、白砂糖、葡萄糖、植物油、无水黄奶油、葡萄糖浆、食用盐、酵母、香橙粉、玉米淀粉、食品添加剂等</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">【品&nbsp;&nbsp;&nbsp; 牌】林食佳</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12pt;font-family:simsun;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">【净 &nbsp;&nbsp;含 】</span><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">268g</span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12pt;font-family:simsun;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">【包装规格】</span><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">268g*20</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">袋</span><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">/</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">箱</span></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">【原 产 地】韩国</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">【保 质 期】12个月</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\">【贮藏方法】置于阴凉干燥处</span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\"><strong style=\"color:#333333;white-space:normal;font-family:simsun;font-size:12pt;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">产品展示---</span></strong></span> \r\n</p>\r\n<p align=\"left\" style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\"><img src=\"./data/upload/editer/image/2014/11/01/5454e6d894763.jpg\" width=\"500\" height=\"281\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e6ed91fb6.jpg\" width=\"500\" height=\"281\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e6fe75c66.jpg\" width=\"500\" height=\"342\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454e70ebef87.jpg\" width=\"500\" height=\"281\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/01/5454e74849988.jpg\" width=\"500\" height=\"344\" alt=\"\" /><br />\r\n<br />\r\n</span> \r\n</p>', '1', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258971', '0', 'a:7:{i:1099;s:6:\"香橙\";i:950;s:6:\"夹心\";i:1098;s:6:\"苏打\";i:894;s:6:\"韩国\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:891;s:9:\"林食佳\";}');
INSERT INTO `weixin_item` VALUES ('414', '361', '0', '林食佳芒果苏打夹心饼干（韩国进口）', '林食佳芒果苏打夹心饼干（韩国进口）', null, null, null, '1411/01/5454edcd588a5.jpg', '14.90', '0.00', '1', '0', '0', '1414852046', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"><strong>基础信息---</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">品名：林食佳芒果苏打夹心饼268g</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">批发规格：20袋/箱</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">配料：小麦粉、白砂糖、葡萄糖、植物油、无水黄奶油、葡萄糖浆、食用盐、酵母、芒果粉、玉米淀粉、食品添加剂（碳酸氢钠、磷酸二氢钙、β-胡萝卜素、柠檬酸）、食用香精。</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">净含量：268g（10小包）</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">原产地：韩国</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">保质期：12个月</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"><strong>产品展示---</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"><strong><img src=\"/data/upload/item/1411/01/5454edcdab390.jpg\" /></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:12px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;\"><strong><img src=\"/data/upload/item/1411/01/5454edce196ab.jpg\" /><img src=\"./data/upload/editer/image/2014/11/01/5454ed0f130d9.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ec361e372.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/01/5454ec368ea69.jpg\" alt=\"\" /><br />\r\n<br />\r\n</strong></span> \r\n</p>', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258940', '0', 'a:7:{i:950;s:6:\"夹心\";i:1098;s:6:\"苏打\";i:894;s:6:\"韩国\";i:892;s:6:\"芒果\";i:721;s:6:\"饼干\";i:734;s:6:\"进口\";i:891;s:9:\"林食佳\";}');
INSERT INTO `weixin_item` VALUES ('419', '358', '0', 'WIN2 脆果 草莓味（马来西亚进口）', 'WIN2 脆果 草莓味 80g 马来西亚进口', null, null, null, '1411/02/5455aa4b20f06.jpg', '5.90', '0.00', '1', '0', '0', '1414899182', '255', '1', '<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/03/5456d149924de.jpg\" alt=\"\" style=\"line-height:1.5;\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/03/5456d14b3965d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456d14c1d448.jpg\" alt=\"\" /><br />\r\n<img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649425.jpgcomp.jpg\" width=\"500\" height=\"272\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649336.jpgcomp.jpg\" width=\"500\" height=\"345\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649129.jpgcomp.jpg\" width=\"500\" height=\"206\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"http://img4.meiliwan.com/img/bkstage-web/2013-11-01/2013110117164967.jpgcomp.jpg\" width=\"500\" height=\"290\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171650943.jpgcomp.jpg\" width=\"500\" height=\"310\" alt=\"\" style=\"line-height:1.5;\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '1', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555319103016', '0', 'a:5:{i:764;s:12:\"马来西亚\";i:678;s:6:\"草莓\";i:734;s:6:\"进口\";i:1102;s:4:\"WIN2\";i:761;s:3:\"80g\";}');
INSERT INTO `weixin_item` VALUES ('421', '358', '0', 'WIN2 脆果巧克力味 80g 马来西亚进口', 'WIN2 脆果巧克力味 80g 马来西亚进口', null, null, null, '1411/02/5455b391a1f2c.jpg', '5.90', '0.00', '1', '0', '0', '1414902675', '255', '1', '<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/03/5456cf5262371.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cf5443377.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649425.jpgcomp.jpg\" width=\"500\" height=\"272\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649336.jpgcomp.jpg\" width=\"500\" height=\"345\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649129.jpgcomp.jpg\" width=\"500\" height=\"206\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img4.meiliwan.com/img/bkstage-web/2013-11-01/2013110117164967.jpgcomp.jpg\" width=\"500\" height=\"290\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171650943.jpgcomp.jpg\" width=\"500\" height=\"310\" alt=\"\" style=\"white-space:normal;\" /> \r\n</p>', '0', '1', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555319103009', '0', 'a:5:{i:764;s:12:\"马来西亚\";i:757;s:9:\"巧克力\";i:734;s:6:\"进口\";i:1102;s:4:\"WIN2\";i:761;s:3:\"80g\";}');
INSERT INTO `weixin_item` VALUES ('422', '358', '0', 'win2 脆果 香兰味饼干', 'win2 脆果 香兰味饼干', null, null, null, '1411/02/5455b7ad4e992.png', '5.90', '0.00', '1', '0', '0', '1414903746', '255', '1', '<img src=\"/data/upload/editer/image/2014/11/02/54562c2d64711.jpg\" alt=\"\" /> \r\n<p>\r\n	<img src=\"/data/upload/editer/image/2014/11/05/545a22dc6f1f0.png\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/05/545a22e7af78b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649425.jpgcomp.jpg\" width=\"500\" height=\"272\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649336.jpgcomp.jpg\" width=\"500\" height=\"345\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649129.jpgcomp.jpg\" width=\"500\" height=\"206\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img4.meiliwan.com/img/bkstage-web/2013-11-01/2013110117164967.jpgcomp.jpg\" width=\"500\" height=\"290\" alt=\"\" style=\"white-space:normal;\" /><img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171650943.jpgcomp.jpg\" width=\"500\" height=\"310\" alt=\"\" style=\"white-space:normal;\" /> \r\n</p>', '0', '1', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555319103030', '0', 'a:3:{i:1101;s:6:\"香兰\";i:721;s:6:\"饼干\";i:1102;s:4:\"win2\";}');
INSERT INTO `weixin_item` VALUES ('423', '358', '0', 'Win2 脆果 香草味 80g 马来西亚进口', 'Win2 脆果 香草味 80g 马来西亚进口', null, null, null, '1411/02/545630d2771ea.jpg', '5.90', '0.00', '1', '0', '0', '1414932199', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/02/54562fed10263.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/02/54562fef10283.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/02/54562fef8c6e3.jpg\" alt=\"\" /><br />\r\n<img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649425.jpgcomp.jpg\" width=\"500\" height=\"272\" alt=\"\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649336.jpgcomp.jpg\" width=\"500\" height=\"345\" alt=\"\" /><img src=\"http://img2.meiliwan.com/img/bkstage-web/2013-11-01/20131101171649129.jpgcomp.jpg\" width=\"500\" height=\"206\" alt=\"\" /><img src=\"http://img4.meiliwan.com/img/bkstage-web/2013-11-01/2013110117164967.jpgcomp.jpg\" width=\"500\" height=\"290\" alt=\"\" /><img src=\"http://img0.meiliwan.com/img/bkstage-web/2013-11-01/20131101171650943.jpgcomp.jpg\" width=\"500\" height=\"310\" alt=\"\" />', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9555319103023', '0', 'a:5:{i:764;s:12:\"马来西亚\";i:765;s:6:\"香草\";i:734;s:6:\"进口\";i:1102;s:4:\"Win2\";i:761;s:3:\"80g\";}');
INSERT INTO `weixin_item` VALUES ('424', '352', '0', '巧克巧奇 蓝莓碎 巧克力涂层饼干', '巧克巧奇 巧克力涂层饼干 (蓝莓碎)', null, null, null, '1411/03/5457493a83cec.jpg', '7.90', '0.00', '1', '0', '0', '1414974459', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/03/5456cbe891750.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbe97fce4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbe9f13a1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbeb6d7b7.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbecb2bf3.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbed5df45.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbedb3065.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456cbee59011.jpg\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306200289', '0', 'a:4:{i:883;s:6:\"蓝莓\";i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";i:757;s:9:\"巧克力\";}');
INSERT INTO `weixin_item` VALUES ('425', '352', '0', '巧克巧奇 巧克力涂层饼干', '巧克巧奇 巧克力涂层饼干 (巧克力味)', null, null, null, '1411/03/5456e533c5d39.png', '7.90', '0.00', '1', '0', '0', '1414980915', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/03/5456e5044d1ee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e504d482d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e5056ca10.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e505c9333.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e50661088.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e506c82a8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e507d92a3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e5084d8b7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e508b2d21.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e50920453.jpg\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306200449', '0', 'a:3:{i:757;s:9:\"巧克力\";i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";}');
INSERT INTO `weixin_item` VALUES ('426', '352', '0', '巧克巧奇 牛奶巧克力涂层饼干', '巧克巧奇 巧克力涂层饼干 (牛奶)', null, null, null, '1411/03/54574186b3a34.jpg', '7.90', '0.00', '1', '0', '0', '1414982303', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/03/5456e9f367b8d.jpg\" alt=\"\" style=\"white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/03/5456e9e2df9e9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9e602cfb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9e7a0322.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9e9b5604.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9eb20fc2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9ec3b1cf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9ecef47e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/5456e9ed5623c.jpg\" alt=\"\" /><br />\r\n<br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306200456', '0', 'a:4:{i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";i:757;s:9:\"巧克力\";i:725;s:6:\"牛奶\";}');
INSERT INTO `weixin_item` VALUES ('427', '352', '0', '巧克巧奇 草莓碎巧克力涂层饼干', '巧克巧奇 草莓碎巧克力涂层饼干', null, null, null, '1411/03/545748957be17.jpg', '7.90', '0.00', '1', '0', '0', '1415006304', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/03/5457480460ea8.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54574805ae159.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54574806345ac.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54574807393aa.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54574807c89f2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/545748082f69a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54574817c113a.jpg\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306200531', '0', 'a:4:{i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";i:678;s:6:\"草莓\";i:757;s:9:\"巧克力\";}');
INSERT INTO `weixin_item` VALUES ('428', '352', '0', '巧克巧奇 杏仁巧克力涂层饼干', '巧克巧奇 杏仁巧克力涂层饼干', null, null, null, '1411/03/54575b394f80a.png', '7.90', '0.00', '1', '0', '0', '1415011129', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/03/54575af6798dc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575af78c486.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575af80ebb1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575af87bf73.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575af91858f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575afa0f759.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575afa78477.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575afb08588.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575afb96452.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/03/54575afc4c8a7.jpg\" alt=\"\" /><br />', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306200517', '0', 'a:4:{i:638;s:6:\"杏仁\";i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";i:757;s:9:\"巧克力\";}');
INSERT INTO `weixin_item` VALUES ('430', '352', '0', '巧克巧奇 抹茶巧克力涂层饼干', '巧克巧奇 抹茶巧克力涂层饼干', null, null, null, '1411/04/54585b67a28e7.jpg', '7.90', '0.00', '1', '0', '0', '1415070693', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/54584830881bc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584832bfcda.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458483594baf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584837e2bb0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54584839d81d5.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458442e6e303.png\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941306201583', '0', 'a:3:{i:1103;s:6:\"涂层\";i:721;s:6:\"饼干\";i:757;s:9:\"巧克力\";}');
INSERT INTO `weixin_item` VALUES ('431', '359', '0', '鲜奶鸡蛋布 托盘装（韩国进口）', '鲜奶鸡蛋布丁杯装（韩国进口）', null, null, null, '1411/04/5458abbe65e6e.jpg', '22.90', '0.00', '1', '0', '0', '1415076458', '255', '1', '<p>\r\n	<span style=\"font-size:16px;font-family:\'Microsoft YaHei\';\"><strong>基础信息---</strong></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#000000;font-family:\'Microsoft YaHei\';\"><strong>品名：鲜奶鸡蛋布丁</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#000000;font-family:\'Microsoft YaHei\';\"><strong>成份：水，砂糖，果糖，二氧化钛，海藻抽出物，可可粉，植物性香料，食用色素（黄色/5号），黑糖色素。</strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;color:#000000;font-family:\'Microsoft YaHei\';\"><strong>规格：432克*16个</strong></span> \r\n</p>\r\n<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;font-family:\'Microsoft YaHei\';\"><strong>产品展示---</strong></span></span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;font-family:\'Microsoft YaHei\';\"><strong><img src=\"./data/upload/editer/image/2014/11/04/545859f77eea9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545859f86415b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545859f9180b3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545859f95d123.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545859f9a2c7d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545859fa8cfc8.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/04/545864083776b.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;white-space:normal;\">备注：新老包装略有差异，图片仅供参考，小孩吃布丁需大人陪同，不能一口吞服</span><br />\r\n</strong></span></span> \r\n</p>', '0', '1', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258025', '0', 'a:5:{i:894;s:6:\"韩国\";i:1088;s:6:\"鲜奶\";i:728;s:6:\"布丁\";i:1089;s:6:\"鸡蛋\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('432', '359', '0', '鸡蛋布丁 托盘装（韩国进口）', '鸡蛋布丁 托盘装（韩国进口）', null, null, null, '1411/04/5458ab8396b43.jpg', '22.90', '0.00', '1', '0', '0', '1415078897', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/54586322da686.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545862ba9d445.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545862bbaec86.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545862bc023ee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545862bccb9ff.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545862bda9349.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/04/5458636306cf8.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/04/5458637eca7a2.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">备注：新老包装略有差异，图片仅供参考，小孩吃布丁需大人陪同，不能一口吞服</span>', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037257417', '0', 'a:5:{i:894;s:6:\"韩国\";i:728;s:6:\"布丁\";i:1109;s:6:\"托盘\";i:1089;s:6:\"鸡蛋\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('433', '359', '0', '芒果鸡蛋布丁 托盘装（韩国进口）', '芒果鸡蛋布丁 托盘装（韩国进口）', null, null, null, '1411/04/5458ab5e0cf75.jpg', '22.90', '0.00', '1', '0', '0', '1415079873', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/545867a0ae76c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545867a104faf.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545867a16795c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545867a1bdf58.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545867a2b32eb.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/04/545868712ff90.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545867a39b3cf.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545867a463617.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;white-space:normal;\">备注：新老包装略有差异，图片仅供参考，小孩吃布丁需大人陪同，不能一口吞服</span> \r\n</p>', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897037258070', '0', 'a:6:{i:894;s:6:\"韩国\";i:728;s:6:\"布丁\";i:892;s:6:\"芒果\";i:1109;s:6:\"托盘\";i:1089;s:6:\"鸡蛋\";i:734;s:6:\"进口\";}');
INSERT INTO `weixin_item` VALUES ('434', '359', '0', '韩昇 水果优酪布丁（韩国进口）', '韩昇 水果优酪布丁（韩国进口）', null, null, null, '1411/04/5458ac3347f08.jpg', '22.90', '0.00', '1', '0', '0', '1415081490', '255', '1', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;clear:both;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-size:16px;font-family:\'Microsoft YaHei\';\"><span style=\"line-height:27px;font-family:\'Microsoft YaHei\';font-size:16px;color:#000000;\"><b>基础信息---</b></span></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF6600;font-size:12pt;\"><strong><span style=\"font-size:large;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\"></span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">产品品名：韩昇水果优布丁</span></span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF6600;font-size:12pt;\"><strong><span style=\"font-size:large;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">产品品牌：</span><strong><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">韩昇</span></strong></span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF6600;font-size:12pt;\"><strong><span style=\"font-size:large;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">产品规格：</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">480g</span></span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-size:14px;font-family:\'Microsoft YaHei\';\"><strong><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';color:#000000;\">产品配料：水、白砂糖、果葡糖浆等</span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-size:14px;font-family:\'Microsoft YaHei\';\"><strong><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';color:#000000;\">产品产地：韩国</span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#FF6600;font-size:12pt;\"><strong><span style=\"font-size:large;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">生产日期：</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;color:#000000;\">最新批次</span></span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;line-height:1.5;clear:both;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-size:14px;font-family:\'Microsoft YaHei\';\"><strong><span style=\"font-size:14px;font-family:\'Microsoft YaHei\';color:#000000;\">保质期：12个月</span></strong></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;clear:both;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;line-height:21px;\"><b>产品展示---</b></span></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;clear:both;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;line-height:21px;\"><b><img src=\"./data/upload/editer/image/2014/11/04/54586de6c847d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586de78bc60.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586de7f06f0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586de890f8c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586de910b05.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586de9703ad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54586deb0a9dd.png\" alt=\"\" /><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;white-space:normal;\">备注：请勿玩耍时食用，图片仅供参考，小孩吃布丁需大人陪同，不能一口吞服</span><br />\r\n</b></span></span> \r\n</p>', '0', '1', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897041950274', '0', 'a:5:{i:894;s:6:\"韩国\";i:728;s:6:\"布丁\";i:729;s:6:\"水果\";i:734;s:6:\"进口\";i:1110;s:6:\"韩昇\";}');
INSERT INTO `weixin_item` VALUES ('435', '359', '0', '君子派 什锦味果冻6杯装（芒果.荔枝.草莓）', '君子派 什锦味果冻6杯装（芒果.荔枝.草莓）', null, null, null, '1411/04/54587deea451f.jpg', '14.90', '0.00', '1', '0', '0', '1415085550', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/54587dc61b797.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dc71238b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dc7a0ee9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dc8b503e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dc971582.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dca0a5e8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dcad252d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54587dccd6982.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/04/54587dcb1bcf9.jpg\" alt=\"\" style=\"white-space:normal;\" /><img src=\"/data/upload/editer/image/2014/11/04/545884588bc77.jpg\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897024974518', '0', 'a:6:{i:880;s:6:\"什锦\";i:1111;s:6:\"果冻\";i:1112;s:6:\"荔枝\";i:892;s:6:\"芒果\";i:678;s:6:\"草莓\";i:1113;s:6:\"君子\";}');
INSERT INTO `weixin_item` VALUES ('436', '359', '0', '君子派 芒果味果冻6杯装', '君子派 芒果味果冻6杯装', null, null, null, '1411/04/5458837f90f2d.jpg', '14.90', '0.00', '1', '0', '0', '1415086975', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/545882a43c6bd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545882a4f23aa.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545882a5a1684.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"/data/upload/editer/image/2014/11/04/545883164694b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545882a6998a2.jpg\" alt=\"\" />\r\n</p>\r\n<img src=\"/data/upload/editer/image/2014/11/04/5458836bdc462.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545882a760e45.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/545882a798de9.jpg\" alt=\"\" />\r\n</p>\r\n<br />\r\n<p>\r\n	<img src=\"/data/upload/editer/image/2014/11/04/5458832a12bcc.jpg\" alt=\"\" style=\"white-space:normal;\" />\r\n</p>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897024974525', '0', 'a:3:{i:887;s:6:\"果味\";i:1111;s:6:\"果冻\";i:1113;s:6:\"君子\";}');
INSERT INTO `weixin_item` VALUES ('437', '352', '0', '果町新语 奇异果汁果冻什锦味 30g*12', '果町新语 奇异果汁果冻什锦味 30g*12', null, null, null, '1411/04/545894628256d.jpg', '15.80', '0.00', '1', '0', '0', '1415089257', '255', '1', '<h2>\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458918e04f37.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458918ea3fd3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458918f21bff.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458918f9a7e3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545891900739b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545891905b575.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/54589190d6236.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458919188028.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545891922df41.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/545891928e0e9.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">备注：此商品包装绿色与黄色均有，但口味一样，其他并无差异，随机发货，果冻类请勿一口吞食，小孩老人需有人陪同情况下食用。</span> \r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6948839503832', '0', 'a:7:{i:1114;s:6:\"新语\";i:880;s:6:\"什锦\";i:1111;s:6:\"果冻\";i:1115;s:6:\"果汁\";i:1116;s:6:\"奇异\";i:1117;s:2:\"12\";i:1118;s:2:\"30\";}');
INSERT INTO `weixin_item` VALUES ('438', '352', '0', '酒鬼原创花生 160g', '酒鬼原创花生160g', null, null, null, '1411/04/5458a74aa9d93.jpg', '4.50', '0.00', '1', '0', '0', '1415096138', '255', '1', '<img src=\"/data/upload/editer/image/2014/11/05/545a1868514dd.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/04/5458a732a0291.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458a693345a9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458a696a8bf9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458a69942634.jpg\" alt=\"\" /><br />', '0', '0', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6942910302819', '0', 'a:4:{i:1119;s:6:\"酒鬼\";i:951;s:6:\"花生\";i:1120;s:6:\"原创\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('439', '352', '0', '溜溜梅雪梅60g', '溜溜梅雪梅60g', null, null, null, '1411/04/5458b03ebb513.png', '3.20', '0.00', '1', '0', '0', '1415098431', '255', '1', '<h2>\r\n</h2>\r\n<h2 style=\"white-space:normal;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/04/5458b01eeab97.jpg\" alt=\"\" /> \r\n</h2>\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b00b53508.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b00e86329.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b01279ced.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b01443080.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b016b39b8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b01866812.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b01997bf7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b01d1949f.jpg\" alt=\"\" /><br />\r\n<br />\r\n<br />\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '1', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6923976111171', '0', 'a:3:{i:1122;s:6:\"雪梅\";i:1123;s:6:\"溜溜\";i:1124;s:3:\"60g\";}');
INSERT INTO `weixin_item` VALUES ('440', '352', '0', '溜溜梅 绿茶梅 60g/袋', '溜溜梅 绿茶梅 60g/袋', null, null, null, '1411/04/5458b3229562e.png', '3.20', '0.00', '1', '0', '0', '1415098608', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<img src=\"/data/upload/item/1411/04/5458b0ee8691d.jpg\" /><br />\r\n<img src=\"/data/upload/item/1411/04/5458b0ef694c8.jpg\" /><br />\r\n<img src=\"/data/upload/item/1411/04/5458b0f039d40.jpg\" width=\"500\" height=\"428\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b28b449a3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b28daff78.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458b296eaa9b.jpg\" alt=\"\" /><br />\r\n<br />\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '1', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6923976181136', '0', 'a:3:{i:1123;s:6:\"溜溜\";i:632;s:6:\"绿茶\";i:1008;s:2:\"60\";}');
INSERT INTO `weixin_item` VALUES ('441', '352', '0', '溜溜梅 话梅40g', '溜溜梅 话梅40g', null, null, null, '1411/04/5458c040cbe84.png', '3.20', '0.00', '1', '0', '0', '1415102475', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/04/5458c0a5c74df.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/04/5458c2b5204ab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c2b6b44f1.jpg\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/04/5458c2d63c852.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c0a91b819.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c0ae8be26.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c0b163b6a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c0b35183d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c0b603eb4.jpg\" alt=\"\" /><br />\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '1', '10', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6923976181228', '0', 'a:3:{i:1125;s:6:\"话梅\";i:1123;s:6:\"溜溜\";i:684;s:3:\"40g\";}');
INSERT INTO `weixin_item` VALUES ('442', '352', '0', '溜溜梅 清梅 60g/袋', '溜溜梅 清梅 60g/袋', null, null, null, '1411/04/5458c571adb5a.png', '3.20', '0.00', '1', '0', '0', '1415103859', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<img src=\"/data/upload/item/1411/04/5458c5724fcd5.jpg\" /><br />\r\n<img src=\"/data/upload/item/1411/04/5458c573193a2.jpg\" /><br />\r\n<img src=\"/data/upload/item/1411/04/5458c573d2aad.jpg\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c545ef47e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c54aa3a07.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c54d26e05.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c54f4ddca.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/04/5458c55242bfb.jpg\" alt=\"\" /><br />\r\n<br />\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6923976113137', '0', 'a:2:{i:1123;s:6:\"溜溜\";i:1008;s:2:\"60\";}');
INSERT INTO `weixin_item` VALUES ('444', '352', '0', 'Jacker杰克牌香辣味薯片160g(马来西亚进口)', 'Jacker杰克牌香辣味薯片160g(马来西亚进口)', null, null, null, '1411/05/545985ab355d3.png', '16.90', '0.00', '1', '0', '0', '1415153067', '255', '1', '<h2>\r\n</h2>\r\n<h2 style=\"white-space:normal;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/05/545986230426e.jpg\" alt=\"\" /><span style=\"font-size:12px;font-weight:normal;line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/11/05/5459862008566.jpg\" alt=\"\" style=\"font-size:12px;font-weight:normal;line-height:1.5;\" /> \r\n</h2>\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598620e8657.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598621d0b9c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545986226ee46.jpg\" alt=\"\" /><br />\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '1', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556023785635', '0', 'a:7:{i:1126;s:6:\"杰克\";i:764;s:12:\"马来西亚\";i:1127;s:6:\"辣味\";i:585;s:6:\"薯片\";i:734;s:6:\"进口\";i:1128;s:6:\"Jacker\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('445', '361', '0', '杰克 烤肉味薯片 160g 马来西亚进口', '杰克 烤肉味薯片 160g 马来西亚进口', null, null, null, '1411/05/54598b4ddc4d9.jpg', '16.90', '0.00', '1', '0', '0', '1415153358', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n</div>\r\n<style type=\"text/css\">\r\n.dk_wrap_content {\r\nPADDING-BOTTOM: 5px; PADDING-LEFT: 5px; WIDTH: 750px; PADDING-RIGHT: 5px; OVERFLOW: hidden; PADDING-TOP: 5px\r\n}\r\n.dk_wrap_content .dk_a1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_t1 .dk_wrap_content .dk_t2 {\r\nWIDTH: 100%; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1 {\r\nMARGIN-TOP: 15px; WIDTH: 751px; BORDER-COLLAPSE: collapse; MARGIN-BOTTOM: 10px; FONT-SIZE: 12px\r\n}\r\n.dk_wrap_content .dk_b1_left {\r\nWIDTH: 350px; FLOAT: left; HEIGHT: 350px; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_b1_left IMG {\r\nWIDTH: 350px; HEIGHT: 350px; VERTICAL-ALIGN: top\r\n}\r\n.dk_wrap_content .dk_b1_right {\r\nWIDTH: 400px; FLOAT: right; OVERFLOW: hidden\r\n}\r\n.dk_wrap_content .dk_txt P {\r\nLINE-HEIGHT: 24px; FONT-FAMILY: 微软雅黑; FONT-SIZE: 16px\r\n}\r\n.dk_wrap_content .dk_txt {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_wrap_content .dk_pic {\r\nWIDTH: 100%; MARGIN-BOTTOM: 15px\r\n}\r\n.dk_ull {\r\nPADDING-BOTTOM: 0px; LIST-STYLE-TYPE: none; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px\r\n}\r\n.dk_ull LI {\r\nBORDER-BOTTOM: #666 1px dotted; TEXT-ALIGN: left; LINE-HEIGHT: 34px; LIST-STYLE-TYPE: none; FONT-FAMILY: \"微软雅黑\"; MARGIN-LEFT: 10px; FONT-SIZE: 16px; VERTICAL-ALIGN: middle; LIST-STYLE-IMAGE: none\r\n}\r\n.dk_wrap_content .dk_pinpai {\r\nMARGIN-TOP: 15px; WIDTH: 100%\r\n}\r\n.yybbox {\r\nZ-INDEX: 10; POSITION: absolute; FILTER: progid:DXImageTransform.Microsoft.Alpha(Opacity=50); PADDING-BOTTOM: 15px; PADDING-LEFT: 15px; WIDTH: 320px; BOTTOM: 30px; PADDING-RIGHT: 15px; BACKGROUND: #fff; PADDING-TOP: 15px; LEFT: 24px; opacity: 0.5\r\n}\r\n.yyb {\r\nMARGIN: 6px auto 0px; WIDTH: 100%; BORDER-COLLAPSE: collapse; FONT-SIZE: 12px\r\n}\r\n.yyb THEAD TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; LINE-HEIGHT: 24px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; FONT-WEIGHT: bold; PADDING-TOP: 3px\r\n}\r\n.yyb TBODY TD {\r\nTEXT-ALIGN: center; PADDING-BOTTOM: 3px; TEXT-INDENT: 10px; PADDING-LEFT: 3px; PADDING-RIGHT: 3px; PADDING-TOP: 3px\r\n}\r\n.yyb TD.left {\r\nTEXT-ALIGN: left\r\n}\r\n.yyb TBODY TD.cet {\r\nTEXT-ALIGN: center; TEXT-INDENT: 0px\r\n}\r\n.yyb TD {\r\nBORDER-BOTTOM: #999 1px solid; BORDER-LEFT: #999 1px solid; BORDER-TOP: #999 1px solid; BORDER-RIGHT: #999 1px solid\r\n}</style>\r\n<div class=\"dk_wrap_content\">\r\n	<div class=\"dk_a1\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/54598be1c2abf.jpg\" alt=\"\" style=\"white-space:normal;\" /><img src=\"/data/upload/item/1411/05/545986cc27e7a.jpg\" />\r\n	</div>\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598be2a37eb.jpg\" alt=\"\" /><br />\r\n	<div class=\"dk_pic\" style=\"position:relative;\">\r\n		<img src=\"/data/upload/item/1411/05/545986cd18cf5.jpg\" /> \r\n	</div>\r\n	<div class=\"dk_txt\">\r\n		<p>\r\n			杰克是马来西亚商品品牌，其生产的薯片系列产品，包装精美，营养丰富\r\n		</p>\r\n	</div>\r\n	<div class=\"dk_pic\">\r\n		<img src=\"/data/upload/item/1411/05/545986cd8d668.jpg\" /> \r\n	</div>\r\n	<div class=\"dk_txt\">\r\n		<p>\r\n			入口嘎嘣一片吃掉，迫不及待再来一片\r\n		</p>\r\n	</div>\r\n	<div class=\"dk_pic\">\r\n		<img src=\"/data/upload/item/1411/05/545986ce3dd50.jpg\" /> \r\n	</div>\r\n	<div class=\"dk_txt\">\r\n		<p>\r\n			薄薄脆脆，很鲜，很香，很辣的味道，色泽淡黄\r\n		</p>\r\n	</div>\r\n	<div class=\"dk_pinpai\">\r\n		<img src=\"/data/upload/item/1411/05/545986ceaafb8.jpg\" /> \r\n	</div>\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556023896744', '0', 'a:6:{i:1126;s:6:\"杰克\";i:764;s:12:\"马来西亚\";i:585;s:6:\"薯片\";i:1129;s:6:\"烤肉\";i:734;s:6:\"进口\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('447', '361', '0', 'EDOpack 巨浪薯片 原味 150g 马来西亚进口', 'EDOpack 巨浪薯片 原味 150g 马来西亚进口', null, null, null, '1411/05/545989cf77ee1.jpg', '16.90', '0.00', '1', '0', '0', '1415153547', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:left;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/05/54598a080bbfb.png\" alt=\"\" style=\"white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/05/54598a069a13e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a070abab.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a089ceb6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a093a5e2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a099daf2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a0a2371a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a1fa9e39.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598a2081e8f.jpg\" alt=\"\" /><br />\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4895058314508', '0', 'a:7:{i:764;s:12:\"马来西亚\";i:585;s:6:\"薯片\";i:1130;s:6:\"巨浪\";i:588;s:6:\"原味\";i:734;s:6:\"进口\";i:1131;s:7:\"EDOpack\";i:780;s:4:\"150g\";}');
INSERT INTO `weixin_item` VALUES ('448', '361', '0', 'EDOpack 薯片沙律酱局薯味 150g 马来西亚进口', 'EDOpack 薯片沙律酱局薯味 150g 马来西亚进口', null, null, null, '1411/05/54598ed21757d.jpg', '16.90', '0.00', '1', '0', '0', '1415154949', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:left;\">\r\n	<strong style=\"font-size:20px;color:#FF0000;line-height:1.5;\"><span style=\"font-family:Microsoft YaHei;\">EDOpack 薯片沙律酱局薯味</span></strong> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\">产地：马来西亚</span> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\">品牌：EDOpack</span> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\">规格：150g</span> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\">保质期限：12个月</span> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\">配料：马铃薯、棕榄油、马铃薯淀粉、葡萄糖、食盐、白砂糖、牛奶</span><span style=\"font-family:\'Microsoft YaHei\';line-height:1.5;\">食品添加剂：增味剂（谷氨酸钠）、大蒜粉、洋葱粉、酵母抽出物、酸度调节剂（柠檬酸）、调味料（辣椒粉）、抗结剂（二氧化硅）</span> \r\n</div>\r\n<span style=\"white-space:normal;\"> \r\n<p style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;font-family:\'Microsoft YaHei\';\"><img src=\"./data/upload/editer/image/2014/11/05/54598eb898fe2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598eb98de80.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598eba10b2d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598eba89212.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54598ebb6e6b3.jpg\" alt=\"\" /><img src=\"/data/upload/editer/image/2014/11/05/54598f4eec927.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>\r\n</span> \r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4895058314270', '0', 'a:6:{i:1132;s:6:\"沙律\";i:764;s:12:\"马来西亚\";i:585;s:6:\"薯片\";i:734;s:6:\"进口\";i:1131;s:7:\"EDOpack\";i:780;s:4:\"150g\";}');
INSERT INTO `weixin_item` VALUES ('449', '359', '0', '河马莉 原味乳酸棒（越南进口）360g*8根', '河马莉 原味乳酸棒（越南进口）360g*8根', null, null, null, '1411/05/54599a9000464.JPG', '9.90', '0.00', '1', '0', '0', '1415158416', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/54599a68937a0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599a69437e2.JPG\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599a69a812d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599a6a54ef6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599a6b0e495.jpg\" alt=\"\" /><br />', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8938501660664', '0', 'a:6:{i:817;s:6:\"越南\";i:1133;s:6:\"乳酸\";i:724;s:6:\"河马\";i:588;s:6:\"原味\";i:734;s:6:\"进口\";i:683;s:3:\"360\";}');
INSERT INTO `weixin_item` VALUES ('450', '359', '0', '河马莉 综合乳酸棒（越南进口）360g*8根', '河马莉 综合乳酸棒（越南进口）360g*8根', null, null, null, '1411/05/54599ec76919f.png', '9.90', '0.00', '1', '0', '0', '1415159495', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/54599d5d4962f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599d5e48ad6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599d5f00400.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599ea065a5d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599ea320303.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/54599d60023ba.jpg\" alt=\"\" /><br />', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '8938501660671', '0', 'a:6:{i:817;s:6:\"越南\";i:1133;s:6:\"乳酸\";i:724;s:6:\"河马\";i:734;s:6:\"进口\";i:730;s:6:\"综合\";i:683;s:3:\"360\";}');
INSERT INTO `weixin_item` VALUES ('451', '359', '0', '欧琪牌优果吧冰棒(青苹果,芒果,荔枝,草莓,葡萄口味)450ml*2(马来西亚进口)', '欧琪牌优果吧冰棒(青苹果,芒果,荔枝,草莓,葡萄口味)450ml*2(马来西亚进口)', null, null, null, '1411/05/54599ffe4fd78.jpg', '12.90', '0.00', '1', '0', '0', '1415159806', '255', '1', '<h2>\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459a2377d328.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/05/5459a2a71eaa8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459a2395bdc0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459a239be46f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459a23a4ff08.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459a23c72a4f.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459a23d2bbff.jpg\" alt=\"\" /><br />\r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '1', '3', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '9556437003974', '0', 'a:10:{i:764;s:12:\"马来西亚\";i:1134;s:6:\"冰棒\";i:1135;s:9:\"青苹果\";i:1112;s:6:\"荔枝\";i:892;s:6:\"芒果\";i:678;s:6:\"草莓\";i:792;s:6:\"口味\";i:918;s:6:\"葡萄\";i:734;s:6:\"进口\";i:1136;s:3:\"450\";}');
INSERT INTO `weixin_item` VALUES ('452', '359', '0', '果町新语 双杯装 奇异果果汁果冻（香兰味）125g/杯', '果町新语 双杯奇异果果汁果冻（香兰味）125g/杯', null, null, null, '1411/05/5459c1ec5c330.jpg', '11.30', '0.00', '1', '0', '0', '1415165977', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"inshopRightTop\" class=\"mt\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:center;padding-bottom:10px;\">\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd7579885.jpg\" alt=\"\" style=\"line-height:1.5;\" /><span style=\"line-height:1.5;\"></span><span style=\"line-height:1.5;\"></span><img src=\"./data/upload/editer/image/2014/11/05/5459bd5e4bf4e.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd7460a5a.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd751eecf.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<br />\r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd7ddb7a1.jpg\" alt=\"\" style=\"line-height:1.5;\" /><img src=\"./data/upload/editer/image/2014/11/05/5459ca0843f41.jpg\" alt=\"\" /><br />\r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd88a331b.png\" alt=\"\" style=\"line-height:1.5;\" /> \r\n	</div>\r\n	<div style=\"text-align:left;\">\r\n		<img src=\"./data/upload/editer/image/2014/11/05/5459bd8e69bb0.jpg\" alt=\"\" style=\"line-height:1.5;\" /> \r\n	</div>\r\n</div>\r\n<div id=\"inshopRightBottom\">\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6948839503795', '0', 'a:6:{i:1101;s:6:\"香兰\";i:1114;s:6:\"新语\";i:1111;s:6:\"果冻\";i:1115;s:6:\"果汁\";i:1116;s:6:\"奇异\";i:1138;s:3:\"125\";}');
INSERT INTO `weixin_item` VALUES ('458', '359', '0', '果町新语 单杯装 奇异果汁果冻果蜜味 125g', '果町新语 奇异果汁果冻果蜜味单杯装 125g', null, null, null, '1411/05/5459c1271cdce.jpg', '5.90', '0.00', '1', '0', '0', '1415166282', '255', '1', '<h2>\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459c05aaad90.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05b93210.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05c371e5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05cc041a.png\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05d1a6db.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05d8abc9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05df009a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05e502a5.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/05/5459c9be8860a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c9bf616b0.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/05/5459c0a67f081.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05ea1afa.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c05f02192.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">备注：</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">此商品除包装</span><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">有黄绿两种差异外，其他并无差异。</span> \r\n</h2>\r\n<div class=\"content\">\r\n	<div class=\"productDescriptionWrapper\">\r\n		<div class=\"emptyClear\">\r\n		</div>\r\n	</div>\r\n</div>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6948839503788', '0', 'a:5:{i:1114;s:6:\"新语\";i:1111;s:6:\"果冻\";i:1115;s:6:\"果汁\";i:1116;s:6:\"奇异\";i:706;s:4:\"125g\";}');
INSERT INTO `weixin_item` VALUES ('459', '359', '0', '果町新语 双杯装 奇异果果汁果冻（果密味）125g/杯', '果町新语 双杯装 奇异果果汁果冻（果密味）125g/杯', null, null, null, '1411/05/5459c73ff2bea.jpg', '11.30', '0.00', '1', '0', '0', '1415169856', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"inshopRightTop\" class=\"mt\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:left;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459c73328f78.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c7340cd87.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c7346a683.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c734d7f99.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c735da7bb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c736c9174.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c73727521.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c7377f75c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459c737dc29d.jpg\" alt=\"\" /><br />\r\n<br />\r\n</div>\r\n<div id=\"inshopRightBottom\">\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6948839503795', '0', 'a:5:{i:1114;s:6:\"新语\";i:1111;s:6:\"果冻\";i:1115;s:6:\"果汁\";i:1116;s:6:\"奇异\";i:1138;s:3:\"125\";}');
INSERT INTO `weixin_item` VALUES ('460', '358', '0', 'EGO 巧克力味 迷你小熊饼干70g 小孩最爱的饼干', 'EGO 巧克力味 迷你小熊饼干70g 小孩最爱的饼干', null, null, null, '1411/05/5459cda2bafbc.jpg', '6.50', '0.00', '1', '0', '0', '1415171490', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459ccd9d13b4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459ccdab524b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459ccdb97c12.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459ccdc20f0a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459ccf1c2a27.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/05/5459ccdd49e70.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459ccddbe621.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459ccde3c5b3.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">备注：此商品含有麦麸，奶类等原材料，对此过敏的人群和小孩请勿食用！</span> \r\n</p>', '0', '1', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '029173094258', '0', 'a:7:{i:721;s:6:\"饼干\";i:757;s:9:\"巧克力\";i:787;s:6:\"迷你\";i:1139;s:6:\"小孩\";i:1140;s:6:\"最爱\";i:1141;s:3:\"EGO\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('461', '358', '0', 'EGO 哈密瓜迷你小熊饼干70g 小孩最爱的饼干', 'EGO 哈密瓜迷你小熊饼干70g 小孩最爱的饼干', null, null, null, '1411/05/5459d5346b99b.jpg', '6.50', '0.00', '1', '0', '0', '1415171694', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459d175e5f78.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459d17664bcc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459d177323ee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459d177b0c8a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459d17841668.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459d17a042b5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:13.63636302948px;line-height:19.0909080505371px;white-space:normal;\">备注：此商品含有麦麸，奶类等原材料，对此过敏的人群和小孩请勿食用！</span>\r\n</p>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '029173094272', '0', 'a:7:{i:721;s:6:\"饼干\";i:1142;s:9:\"哈密瓜\";i:787;s:6:\"迷你\";i:1139;s:6:\"小孩\";i:1140;s:6:\"最爱\";i:1141;s:3:\"EGO\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('462', '358', '0', 'EGO 草莓迷你小熊饼干70g 小孩最爱的饼干', 'EGO 草莓迷你小熊饼干70g 小孩最爱的饼干', null, null, null, '1411/05/5459d60c576c5.png', '6.50', '0.00', '1', '0', '0', '1415172731', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459d3c19dd2e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459d3c32d4f7.jpg\" alt=\"\" /><br />\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/05/5459d3d24adfc.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:13.63636302948px;line-height:19.0909080505371px;white-space:normal;\">备注：此商品含有麦麸，奶类等原材料，对此过敏的人群和小孩请勿食用！</span>\r\n</p>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '029173094265', '0', 'a:7:{i:721;s:6:\"饼干\";i:678;s:6:\"草莓\";i:787;s:6:\"迷你\";i:1139;s:6:\"小孩\";i:1140;s:6:\"最爱\";i:1141;s:3:\"EGO\";i:853;s:3:\"70g\";}');
INSERT INTO `weixin_item` VALUES ('463', '352', '0', '亮记师傅 烤鱿鱼丝130g （澳门进口）', '亮记师傅 烤鱿鱼丝130g （澳门进口）', null, null, null, '1411/05/5459dc3031520.jpg', '17.90', '0.00', '1', '0', '0', '1415175216', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459dc007c897.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc0134e58.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc02854af.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc033c064.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc03bd5a5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc045f7ba.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dc053b1d1.jpg\" alt=\"\" /><br />', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897041952339', '0', 'a:5:{i:1143;s:6:\"澳门\";i:1144;s:6:\"鱿鱼\";i:1145;s:6:\"师傅\";i:734;s:6:\"进口\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('464', '352', '0', '亮记师傅 白鱿鱼丝130g（（澳门进口）', '亮记师傅 白鱿鱼丝130g（（澳门进口）', null, null, null, '1411/05/5459deabc23a8.jpg', '17.90', '0.00', '1', '0', '0', '1415175851', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459de9d10ba0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459de9e0f691.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459de9e9c14a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459de9f22cf6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dea0080a2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dea0b3f8c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459dea134ae0.jpg\" alt=\"\" /><br />', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897041952322', '0', 'a:5:{i:1143;s:6:\"澳门\";i:1144;s:6:\"鱿鱼\";i:1145;s:6:\"师傅\";i:734;s:6:\"进口\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('465', '352', '0', '亮记师傅 金枪鱼 130g（澳门进口）', '亮记师傅 金枪鱼 130g（澳门进口）', null, null, null, '1411/05/5459e5664b4cf.jpg', '17.90', '0.00', '1', '0', '0', '1415177574', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/05/5459e5224a01a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e523cd389.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e52475154.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e52504233.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e53cd2818.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e53d401e2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/5459e53dead40.jpg\" alt=\"\" /><br />', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897041952384', '0', 'a:5:{i:1146;s:9:\"金枪鱼\";i:1143;s:6:\"澳门\";i:1145;s:6:\"师傅\";i:734;s:6:\"进口\";i:727;s:4:\"130g\";}');
INSERT INTO `weixin_item` VALUES ('466', '346', '0', '适运 高精纸杯 50只装', '适运 高精杯 50只装', null, null, null, '1411/07/545c61b3f3e61.jpg', '4.90', '0.00', '1', '0', '0', '1415192354', '255', '1', '<img src=\"/data/upload/editer/image/2014/11/07/545c61ce92f73.jpg\" alt=\"\" /><br />\r\n<img src=\"/data/upload/editer/image/2014/11/05/545a20d99461f.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/05/545a1ef6d88d3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a1ef9b5cd5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a1efae9326.jpg\" alt=\"\" /><br />', '0', '0', '20', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6930483230011', '0', 'a:1:{i:1147;s:6:\"高精\";}');
INSERT INTO `weixin_item` VALUES ('467', '346', '0', '适运 纸杯 中杯 50只装', '适运 中杯 50只装', null, null, null, '1411/07/545c61966f093.jpg', '3.80', '0.00', '1', '0', '0', '1415192771', '255', '1', '<img src=\"/data/upload/editer/image/2014/11/07/545c618ea51b4.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/05/545a20b645cca.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a20b71f564.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a20b7f33d9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a20b93f05d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/05/545a20b9cf587.jpg\" alt=\"\" /><br />', '0', '0', '20', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6930483200151', '0', '');
INSERT INTO `weixin_item` VALUES ('468', '365', '0', '佳洁士 魅力亮洁型牙刷 软毛（红、紫、绿）', '佳洁士 魅力亮洁型牙刷 软毛', null, null, null, '1411/06/545af9e56ec6e.jpg', '7.80', '0.00', '1', '0', '0', '1415246202', '255', '1', '<div id=\"haigouDescPic\" style=\"display:none;\">\r\n</div>\r\n<div id=\"proDescVideo\" class=\"mt\" style=\"text-align:left;padding-bottom:10px;\">\r\n	<img src=\"./data/upload/editer/image/2014/11/06/545afd7ca7d2c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7d79b4b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7dd513c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7e24a74.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7e80622.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7ee755f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7f666c9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd7fa23c3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd80a93f9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/06/545afd80ed778.jpg\" alt=\"\" /><br />\r\n<span style=\"font-family:Microsoft YaHei;\">此货品有三种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span>\r\n</div>\r\n<div id=\"prodDescDijiaAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesZhengpinAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"oldForNewDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDescTopAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"prodDesTczgAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"contractPhoneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>\r\n<div id=\"allInOneAds\" style=\"display:none;\" class=\"mb\">\r\n</div>', '0', '0', '12', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6903148072363', '0', 'a:3:{i:696;s:9:\"佳洁士\";i:673;s:6:\"牙刷\";i:1148;s:6:\"魅力\";}');
INSERT INTO `weixin_item` VALUES ('471', '365', '0', '晨宝 璀璨防滑牙刷 细毛', '晨宝 璀璨防滑牙刷 细毛', null, null, null, '1411/07/545c3fd285dcf.jpg', '3.90', '0.00', '1', '0', '0', '1415331794', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c3f605d61f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f615f922.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f61ef176.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f62bc3f8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f6344073.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f63e62ea.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f6493fce.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f65107b7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c3f65a8280.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\">此货品有三种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span><img src=\"./data/upload/editer/image/2014/11/07/545c3f66c40f8.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\">此货品有五种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span>\r\n</p>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6947185720191', '0', 'a:4:{i:1150;s:6:\"细毛\";i:673;s:6:\"牙刷\";i:1151;s:6:\"防滑\";i:1152;s:6:\"璀璨\";}');
INSERT INTO `weixin_item` VALUES ('472', '365', '0', '蓝月亮洁 牙刷 软毛', '蓝月亮洁 牙刷 软毛', null, null, null, '1411/07/545c559eb1be1.jpg', '4.80', '0.00', '1', '0', '0', '1415337374', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c558923f99.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558a4674c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558b35163.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558be01d0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558c7c99d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558d88624.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558e0975a.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558e95e84.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c558eeef4c.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c558f9d91a.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\">此货品有四种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span>\r\n</p>', '0', '0', '24', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6948031089011', '0', 'a:2:{i:1153;s:9:\"蓝月亮\";i:673;s:6:\"牙刷\";}');
INSERT INTO `weixin_item` VALUES ('473', '365', '0', '三笑 多功能牙刷 软毛', '三笑 多功能牙刷 软毛', null, null, null, '1411/07/545c5a997daec.png', '5.90', '0.00', '1', '0', '0', '1415338649', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c5a61c8c83.jpg\" alt=\"\" /><br />\r\n<br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c59da49f77.png\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c59d577450.png\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/07/545c59d78be3a.png\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c59d4d5b64.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/07/545c59d40476c.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\">此货品有四种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span> \r\n</p>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6926160707082', '0', 'a:2:{i:673;s:6:\"牙刷\";i:1154;s:9:\"多功能\";}');
INSERT INTO `weixin_item` VALUES ('474', '365', '0', '倍亮牙刷 美白卓越型 软毛', '倍亮牙刷 美白卓越型 软毛', null, null, null, '1411/07/545c5d8a04942.jpg', '1.50', '0.00', '1', '0', '0', '1415339402', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c5d74811cd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c5d756d223.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c5d7603339.jpg\" alt=\"\" /><img src=\"./data/upload/editer/image/2014/11/07/545c5d7747ea7.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c5d76aacd8.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\">此货品有五种颜色，请有颜色要求的顾客，下单时备注，无备注将随机发货。</span> \r\n</p>', '0', '0', '30', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6954842279039', '0', 'a:3:{i:673;s:6:\"牙刷\";i:690;s:6:\"美白\";i:1155;s:6:\"卓越\";}');
INSERT INTO `weixin_item` VALUES ('475', '360', '0', '星巴克 卡布其诺 盒装咖啡 1盒*10条', '星巴克 卡布其诺 盒装咖啡 1盒*10条', null, null, null, '1411/07/545c6c9052d57.jpg', '58.00', '0.00', '1', '0', '0', '1415343248', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c6c56ed229.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c57bd59f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5867850.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5948163.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c59b8800.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5a546c9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5b2264e.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c6c5be7c8f.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c6c5f20141.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" /><img src=\"./data/upload/editer/image/2014/11/07/545c6c5e84a0f.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c6c5ca674f.jpg\" alt=\"\" />\r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5d4e91b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6c5daba81.jpg\" alt=\"\" /><br />', '0', '1', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '009776155013', '0', 'a:5:{i:1156;s:9:\"卡布其\";i:1157;s:6:\"巴克\";i:1158;s:6:\"盒装\";i:763;s:6:\"咖啡\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('476', '360', '0', '星巴克 原味盒装咖啡  1盒*10条', '星巴克 原味盒装咖啡  1盒*10条', null, null, null, '1411/07/545c6d7a5a479.jpg', '58.00', '0.00', '1', '0', '0', '1415343482', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c6d5fbd13d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d60c79ba.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d613ba34.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d620cb24.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d628432c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d637fa9d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d64149c8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d647579d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d657d0ab.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d66275de.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c6d667c8cf.jpg\" alt=\"\" /><br />', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '009776155006', '0', 'a:5:{i:1157;s:6:\"巴克\";i:1158;s:6:\"盒装\";i:588;s:6:\"原味\";i:763;s:6:\"咖啡\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('477', '360', '0', '星巴克 拿铁盒装咖啡 1盒*10条', '星巴克 拿铁盒装咖啡 1盒*10条', null, null, null, '1411/07/545c6e128042a.jpg', '58.00', '0.00', '1', '0', '0', '1415343634', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c72daba732.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72db8fee3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72dc0cd68.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72dc9a4cc.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72dd8b261.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72de47612.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72dee48f0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72df5e866.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72dfcb27c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72e0b29ee.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c72e1191be.jpg\" alt=\"\" /><br />', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '009776155020', '0', 'a:4:{i:1157;s:6:\"巴克\";i:1158;s:6:\"盒装\";i:763;s:6:\"咖啡\";i:594;s:2:\"10\";}');
INSERT INTO `weixin_item` VALUES ('478', '352', '0', '海德曼 瘦身咖啡 1盒*12包', '海德曼 瘦身咖啡 1盒*12包', null, null, null, '1411/07/545c7af864b72.jpg', '37.00', '0.00', '1', '0', '0', '1415346936', '255', '1', '<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#000000;\"><strong>基本介绍---</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:18px;background-color:#FFFFFF;\">[主要成份]：巴西圣多斯黑粒咖啡，藤黄果提取物ＨＣＡ，氨基酸，纤维素多种维生素.</span>\r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">[注意事项]:孕妇及严重疾患者不宜饮用</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">[适合人群]:顽固型肥胖及多次减肥失败者,</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">[用量]:每天一次,每次一包,于每天早餐前服用.</span> \r\n</p>\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:16px;color:#000000;\"><strong>减肥原理---</strong></span>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-size:14px;font-family:\'Microsoft YaHei\';\">本品是选用巴西原始森林小粒黑咖啡，加配减肥果,藤黄果提取物ＨＣＡ氨基酸,多种维生素纤维素等高效并营养的植物瘦身成份,口味香浓纯正,在尽享美味的同时更能阻止脂肪吸收,燃烧体内囤积的多余脂肪,减肥,美体.</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">1.巴西天然小粒黑咖啡豆,纯天然.无污染.非转基因.口味香浓.</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">2.马拉巴罗望子.＂藤黄果＂提取物（ＨＣＡ）具有抑制脂肪的合成,加速脂肪燃烧.加速脂肪的代谢.</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">3复合氨基酸,提高人体面议力,使人在减肥的同时保持旺盛的精力.不影响工作和学习.</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\">4.维生素.是脂肪能量转化不可缺少的营养元素,脂肪在转化过程中.需要多种营养参与.尤其是维生素,纤维生素.如果这些成份摂入不足就会防碍脂肪代谢,进而积存体内导致肥胖.</span><span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\"></span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:tahoma, \'Hiragino Sans GB\', \'microsoft yahei\', sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#000000;font-family:\'Microsoft YaHei\';font-size:14px;\"><img src=\"./data/upload/editer/image/2014/11/07/545c7a2f28919.png\" alt=\"\" style=\"font-family:\'Microsoft YaHei\';font-size:13.63636302948px;line-height:19.0909080505371px;white-space:normal;\" /><br />\r\n</span> \r\n</p>\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"><img src=\"./data/upload/editer/image/2014/11/07/545c7a284b4e9.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7a297bd04.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7a2ad7381.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7a2bc96af.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c7a2c53cc2.jpg\" alt=\"\" /><br />\r\n</span> \r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c7a2a9ac21.jpeg\" alt=\"\" style=\"font-family:\'Microsoft YaHei\';font-size:13.63636302948px;line-height:19.0909080505371px;background-color:#FFFFFF;\" /><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:18px;line-height:1.5;\"><strong>胖子or瘦子？自己选吧！</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:1.5;\"><img src=\"/data/upload/editer/image/2014/11/07/545c7add0d012.jpeg\" alt=\"\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6941907103231', '0', 'a:4:{i:1159;s:9:\"海德曼\";i:1160;s:6:\"瘦身\";i:763;s:6:\"咖啡\";i:1117;s:2:\"12\";}');
INSERT INTO `weixin_item` VALUES ('479', '359', '0', '拉菲咖啡牛奶片（香港进口80g*5板）小孩子的最爱!', '拉菲咖啡牛奶片（香港进口80g*5板）', null, null, null, '1411/07/545c89f46d198.jpg', '9.90', '0.00', '1', '0', '0', '1415347425', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c89ccb7010.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89ce2fec4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89ce76222.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89cf11752.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89cf79a2d.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89cfe1881.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c89d0a6a3f.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710297', '0', 'a:6:{i:1090;s:6:\"拉菲\";i:547;s:6:\"香港\";i:725;s:6:\"牛奶\";i:763;s:6:\"咖啡\";i:734;s:6:\"进口\";i:1161;s:2:\"80\";}');
INSERT INTO `weixin_item` VALUES ('480', '359', '0', '拉菲原味牛奶片 （香港进口 80g*5板） 小孩的最爱！', '拉菲原味牛奶片 （香港进口 80g*5板） 小孩的最爱！', null, null, null, '1411/07/545c8ad593594.jpg', '9.90', '0.00', '1', '0', '0', '1415350997', '255', '1', '<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c8ab5b0c8d.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c8ab4baef8.jpg\" alt=\"\" style=\"font-size:11.8181819915771px;line-height:16.3636360168457px;white-space:normal;\" />\r\n</p>\r\n<p>\r\n	<img src=\"./data/upload/editer/image/2014/11/07/545c8ab64f065.jpg\" alt=\"\" />\r\n</p>\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab69d3c1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab6d2eb4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab71e066.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab7d7424.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab84a1d4.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab8ad66e.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8ab9069a0.jpg\" alt=\"\" /><br />', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710303', '0', 'a:8:{i:1090;s:6:\"拉菲\";i:547;s:6:\"香港\";i:588;s:6:\"原味\";i:725;s:6:\"牛奶\";i:1139;s:6:\"小孩\";i:1140;s:6:\"最爱\";i:734;s:6:\"进口\";i:1161;s:2:\"80\";}');
INSERT INTO `weixin_item` VALUES ('481', '359', '0', '拉菲杏仁牛奶片（香港进口80*5板）', '拉菲原味牛奶片（香港进口80*5板）', null, null, null, '1411/07/545c8bc164c8d.jpg', '9.90', '0.00', '1', '0', '0', '1415351128', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c8bb9d87ef.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbaac1b5.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbb0b300.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbb4b2f3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbbef2fb.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbc6214b.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbcb8b46.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8bbd539f4.jpg\" alt=\"\" /><br />\r\n<br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710280', '0', 'a:6:{i:1090;s:6:\"拉菲\";i:547;s:6:\"香港\";i:588;s:6:\"原味\";i:725;s:6:\"牛奶\";i:734;s:6:\"进口\";i:1161;s:2:\"80\";}');
INSERT INTO `weixin_item` VALUES ('482', '359', '0', '拉菲椰子牛奶片（香港进口80g*5板）', '拉菲椰子牛奶片（香港进口80g*5板）', null, null, null, '1411/07/545c8c3852d42.jpg', '9.90', '0.00', '1', '0', '0', '1415351352', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/07/545c8c2be1561.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c2d1539c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c2de1417.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c2e94cd1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c2f9a5d7.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c30064dd.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/07/545c8c305de98.jpg\" alt=\"\" /><br />', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '4897035710273', '0', 'a:6:{i:1090;s:6:\"拉菲\";i:825;s:6:\"椰子\";i:547;s:6:\"香港\";i:725;s:6:\"牛奶\";i:734;s:6:\"进口\";i:1161;s:2:\"80\";}');
INSERT INTO `weixin_item` VALUES ('483', '352', '0', '成都小吃 酱香花生 160g', '成都小吃 酱香花生 160g', null, null, null, '1411/12/5462ea272f0e0.jpg', '5.20', '0.00', '1', '0', '0', '1415768615', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462e9f52b574.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462e9f7a7f74.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462e9f9c5ad1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462e9fb16d82.jpg\" alt=\"\" /><br />', '0', '1', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388266', '0', 'a:5:{i:1162;s:6:\"酱香\";i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('484', '352', '0', '成都小吃 飘雪花生160g', '成都小吃 飘雪花生160g', null, null, null, '1411/12/5462ec1adf43d.jpg', '5.20', '0.00', '1', '0', '0', '1415769115', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462ec1238aad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ec1504467.jpg\" alt=\"\" /><br />', '0', '1', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388235', '0', 'a:4:{i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('485', '352', '0', '成都小吃 飘雪花生160g', '成都小吃 飘雪花生160g', null, null, null, '1411/12/5462ec1d0bda9.jpg', '5.20', '0.00', '1', '0', '0', '1415769117', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462ec1238aad.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ec1504467.jpg\" alt=\"\" /><br />', '0', '1', '0', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388235', '0', 'a:4:{i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('486', '352', '0', '成都小吃 蜂蜜花生 170g', '成都小吃 蜂蜜花生 170g', null, null, null, '1411/12/5462ecc20ae5a.jpg', '5.20', '0.00', '1', '0', '0', '1415769282', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462eca72bff6.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ecaa1b4e1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ecab83393.jpg\" alt=\"\" /><br />', '0', '0', '6', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388426', '0', 'a:5:{i:1163;s:6:\"成都\";i:895;s:6:\"蜂蜜\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1165;s:4:\"170g\";}');
INSERT INTO `weixin_item` VALUES ('487', '352', '0', '成都小吃 爆椒花生 160g', '成都小吃 爆椒花生 160g', null, null, null, '1411/12/5462ed7d5ca40.jpg', '5.20', '0.00', '1', '0', '0', '1415769469', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462ed6b73ea8.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ed6dbe3b2.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ed6f0a000.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ed709819c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ed71cda3e.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732315002', '0', 'a:4:{i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('488', '352', '0', '成都小吃 咖啡花生 150g', '成都小吃 咖啡花生 150g', null, null, null, '1411/12/5462edf04967a.jpg', '5.20', '0.00', '1', '0', '0', '1415769584', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462ede4514d1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ede56b3a3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ede632b5f.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ede6e1f29.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388402', '0', 'a:5:{i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:763;s:6:\"咖啡\";i:780;s:4:\"150g\";}');
INSERT INTO `weixin_item` VALUES ('489', '352', '0', '老醋花生 杯装 248g', '老粗花生 杯装 248g', null, null, null, '1411/12/5462ee9b980ae.jpg', '5.50', '0.00', '1', '0', '0', '1415769755', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462ee8383cd3.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ee8528017.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ee8690b18.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462ee87a3948.jpg\" alt=\"\" /><br />', '0', '0', '4', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6933657700266', '0', 'a:3:{i:1166;s:6:\"老粗\";i:951;s:6:\"花生\";i:1167;s:4:\"248g\";}');
INSERT INTO `weixin_item` VALUES ('490', '352', '0', '成都小吃 开心花生 160g', '成都小吃 开心花生 160g', null, null, null, '1411/12/5463274049b88.jpg', '5.20', '0.00', '1', '0', '0', '1415771320', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462f4a99ef2c.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462f4ab402b1.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462f4ac2b217.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388419', '0', 'a:5:{i:1163;s:6:\"成都\";i:951;s:6:\"花生\";i:1164;s:6:\"小吃\";i:1168;s:6:\"开心\";i:1121;s:4:\"160g\";}');
INSERT INTO `weixin_item` VALUES ('491', '352', '0', '成都小吃 煎豆果子160g', '成都小吃 煎豆果子160g', null, null, null, '1411/12/5462f5340734a.jpg', '5.20', '0.00', '1', '0', '0', '1415771444', '255', '1', '<img src=\"./data/upload/editer/image/2014/11/12/5462f526b0066.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462f527ec2b0.jpg\" alt=\"\" /><br />\r\n<img src=\"./data/upload/editer/image/2014/11/12/5462f52954f64.jpg\" alt=\"\" /><br />', '0', '0', '5', '0', '0', '0.00', '0.00', '0.00', '1', null, null, '0', '1', '6920732388297', '0', 'a:4:{i:1163;s:6:\"成都\";i:1169;s:6:\"果子\";i:1164;s:6:\"小吃\";i:1121;s:4:\"160g\";}');

-- ----------------------------
-- Table structure for weixin_item_attr
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_attr`;
CREATE TABLE `weixin_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_attr
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_item_cate
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_cate`;
CREATE TABLE `weixin_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_cate
-- ----------------------------
INSERT INTO `weixin_item_cate` VALUES ('342', '纸品清洁', '', '0', '0', '', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('343', '化妆护理', '', '0', '0', '', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('344', '食品饮料、酒类', '', '0', '0', '', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('365', '牙膏/牙刷', '', '364', '343|364|', '54757ea9e48fa_thumb.jpg', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('346', '纸品湿巾', '', '342', '342|', '546dfaaec6e18_thumb.jpg', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('347', '衣物清洁', '', '342', '342|', '546dfae5792fd_thumb.jpg', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('348', '家庭清洁', '', '342', '342|', '546dfb297cac1_thumb.jpg', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('361', '膨化食品', '', '351', '344|351|', '54781efa21143_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('364', '日常生活护理', '', '343', '343|', '547582fd85182_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('351', '进口食品', '', '344', '344|', '54781d888cf35_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('352', '休闲食品', '', '344', '344|', '54782166119b9_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('354', '饮料酒水', '', '344', '344|', '547824072fd21_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('362', '卫生巾', '', '356', '343|356|', '5475882038cc0_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('356', '女性护理', '', '343', '343|', '5475880d10085_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('363', '护垫', '', '356', '343|356|', '5475882c5daa1_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('358', '饼干蛋糕', '', '351', '344|351|', '54782045e5adc_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('359', '糖果/巧克力', '', '351', '344|351|', '54781b6570c7d_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('360', '冲调饮料', '', '351', '344|351|', '547822ef9fc47_thumb.gif', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('366', '沐浴露/香皂', '', '364', '343|364|', '5475814609673_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');
INSERT INTO `weixin_item_cate` VALUES ('367', '洗发/护发', '', '364', '343|364|', '5475836a2c8fc_thumb.png', '', '', '0', '0', '0', '0', '255', '1', '1', '0', '', '', '');

-- ----------------------------
-- Table structure for weixin_item_cate_tag
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_cate_tag`;
CREATE TABLE `weixin_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_cate_tag
-- ----------------------------
INSERT INTO `weixin_item_cate_tag` VALUES ('3', '1', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('4', '2', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('5', '3', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('6', '4', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('7', '5', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('8', '6', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('9', '7', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('10', '8', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('11', '9', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('12', '10', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('17', '11', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('18', '12', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('21', '13', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('23', '14', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('22', '15', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('24', '16', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('25', '17', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('26', '18', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('27', '19', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('28', '20', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('29', '21', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('30', '22', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('32', '23', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('33', '24', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('34', '25', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('35', '26', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('36', '27', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('37', '28', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('38', '29', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('39', '30', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('41', '31', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('42', '32', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('43', '33', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('44', '34', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('45', '35', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('46', '14', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('47', '36', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('48', '37', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('49', '38', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('319', '39', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('318', '40', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('317', '41', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('316', '42', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('320', '43', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('321', '44', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('322', '45', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('323', '46', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('91', '96', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('92', '97', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('93', '98', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('94', '99', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('281', '100', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('95', '101', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('282', '102', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('283', '103', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('96', '104', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('284', '105', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('97', '106', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('285', '107', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('98', '108', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('99', '109', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('286', '110', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('100', '111', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('287', '112', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('101', '113', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('288', '114', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('289', '115', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('290', '116', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('291', '117', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('292', '118', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('293', '119', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('294', '120', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('295', '121', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('296', '122', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('297', '123', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('298', '124', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('299', '125', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('300', '126', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('301', '127', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('302', '128', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('303', '129', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('304', '130', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('305', '131', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('306', '132', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('307', '133', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('308', '134', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('309', '135', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('310', '136', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('219', '137', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('311', '138', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('312', '139', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('313', '140', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('314', '141', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('260', '142', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('261', '143', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('262', '144', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('263', '145', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('264', '146', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('265', '147', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('266', '148', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('267', '149', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('268', '150', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('269', '151', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('270', '152', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('271', '153', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('272', '154', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('273', '155', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('274', '156', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('275', '157', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('276', '158', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('277', '159', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('278', '160', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('279', '161', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('280', '162', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('237', '163', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('238', '164', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('239', '165', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('240', '166', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('241', '167', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('242', '168', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('243', '169', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('244', '170', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('245', '171', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('246', '172', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('247', '173', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('248', '174', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('249', '175', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('250', '176', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('251', '177', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('206', '178', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('207', '179', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('208', '180', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('209', '181', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('210', '182', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('211', '183', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('212', '184', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('213', '185', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('214', '186', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('215', '187', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('216', '188', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('217', '189', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('218', '190', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('220', '191', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('221', '192', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('222', '193', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('223', '194', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('224', '195', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('225', '196', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('226', '196', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('226', '137', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('227', '197', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('228', '198', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('229', '199', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('230', '200', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('231', '201', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('232', '202', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('233', '203', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('234', '204', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('236', '205', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('235', '206', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('252', '207', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('253', '208', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('254', '209', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('255', '210', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('256', '211', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('257', '212', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('258', '213', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('259', '214', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('178', '215', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('179', '216', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('180', '267', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('181', '268', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('182', '269', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('183', '270', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('184', '271', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('185', '289', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('186', '290', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('187', '291', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('188', '292', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('189', '293', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('190', '294', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('191', '295', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('192', '296', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('193', '297', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('194', '330', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('195', '336', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('196', '337', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('197', '338', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('198', '339', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('199', '340', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('200', '341', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('201', '342', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('202', '343', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('203', '344', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('204', '345', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('205', '346', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('170', '347', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('171', '25', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('172', '26', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('173', '30', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('174', '348', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('175', '27', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('176', '349', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('177', '259', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('177', '28', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('163', '350', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('164', '351', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('165', '352', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('166', '353', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('167', '354', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('168', '355', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('169', '314', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('127', '356', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('128', '357', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('130', '358', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('132', '359', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('81', '360', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('82', '301', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('83', '323', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('84', '361', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('85', '300', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('86', '318', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('87', '362', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('88', '332', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('89', '192', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('74', '363', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('75', '364', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('76', '365', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('77', '366', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('78', '367', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('79', '368', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('61', '97', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('61', '369', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('62', '370', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('63', '371', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('64', '372', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('316', '373', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('316', '374', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('316', '375', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('65', '376', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('65', '377', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('66', '378', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('67', '379', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('68', '380', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('69', '381', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('70', '382', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('71', '308', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('72', '383', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('52', '384', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('53', '349', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('54', '385', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('55', '28', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('56', '27', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('57', '386', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('58', '25', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('59', '30', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('133', '387', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('135', '388', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('137', '389', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('139', '390', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('140', '246', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('141', '391', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('143', '392', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('145', '241', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('148', '393', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('150', '394', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('151', '259', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('152', '395', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('154', '237', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('156', '238', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('158', '396', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('160', '397', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('161', '218', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('113', '398', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('117', '371', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('118', '372', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('119', '399', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('119', '400', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('120', '27', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('121', '28', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('122', '401', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('123', '233', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('104', '220', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('105', '402', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('106', '403', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('107', '404', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('108', '405', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('109', '406', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('110', '302', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('111', '223', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('325', '42', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('325', '374', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('325', '375', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('326', '39', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('326', '407', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('327', '46', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('327', '408', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('327', '409', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('327', '410', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('327', '411', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('328', '41', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('328', '412', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('328', '413', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('328', '414', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('329', '44', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('329', '415', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('330', '45', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('330', '416', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('331', '43', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('331', '373', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('332', '40', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('332', '417', '0');
INSERT INTO `weixin_item_cate_tag` VALUES ('332', '418', '0');

-- ----------------------------
-- Table structure for weixin_item_comment
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_comment`;
CREATE TABLE `weixin_item_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_comment
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_item_img
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_img`;
CREATE TABLE `weixin_item_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_img
-- ----------------------------
INSERT INTO `weixin_item_img` VALUES ('2727', '143', '1410/25/544b491af2392.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2726', '142', '1410/25/544b452259f3f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2730', '145', '1410/25/544b4da70c12f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2732', '146', '1410/25/544b4f5dd66cf.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2733', '147', '1410/25/544b4fcfa3cea.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2734', '148', '1410/25/544b50429d452.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2736', '149', '1410/25/544b51cc2806e.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2735', '148', '1410/25/544b50504bf12.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2737', '150', '1410/25/544b5219e91de.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2739', '151', '1410/25/544b53950a253.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2738', '150', '1410/25/544b52253358f.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2741', '152', '1410/25/544b5559ac9a0.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2740', '151', '1410/25/544b53a4c0079.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2742', '153', '1410/25/544b55fcaa7ce.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2744', '155', '1410/25/544b56a21b8c5.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2743', '153', '1410/25/544b5609b8c63.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2770', '162', '1411/01/5454733e15b78.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2747', '160', '1410/25/544b58182995c.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2746', '155', '1410/25/544b56b693870.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2745', '155', '1410/25/544b56b68a73a.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2755', '161', '1410/25/544b5b21b3660.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2753', '161', '1410/25/544b5ae29971b.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2752', '161', '1410/25/544b5ae286be0.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2749', '160', '1410/25/544b582b35f88.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2748', '160', '1410/25/544b582b2a90c.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2771', '163', '1411/01/5454743165e00.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2772', '164', '1411/01/545474e2d06ba.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2773', '165', '1411/01/545475aaedb6e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2774', '166', '1411/01/5454767e73f98.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2775', '167', '1411/01/5454772d734f6.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2799', '410', '1411/01/5454c4547c1a3.jpg', '1414841429', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2908', '408', '1411/03/5456d9c7e2a00.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2791', '409', '1411/01/5454c0034b8b9.jpg', '1414840324', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2904', '410', '1411/03/5456d59030cc2.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2905', '410', '1411/03/5456d5903ef5c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2906', '408', '1411/03/5456d9af11d12.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2795', '409', '1411/01/5454c004c2e7a.jpg', '1414840324', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2794', '409', '1411/01/5454c00453553.jpg', '1414840324', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2793', '409', '1411/01/5454c003c52d6.jpg', '1414840324', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2792', '409', '1411/01/5454c0036ad34.jpg', '1414840324', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2776', '170', '1411/01/54547810d3858.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2777', '171', '1411/01/54547a8205625.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3155', '172', '1411/07/545c75065b595.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3156', '173', '1411/07/545c76c478346.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3157', '174', '1411/07/545c77cbea2e2.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3158', '175', '1411/07/545c78faa623a.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3159', '177', '1411/07/545c79e704d28.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3161', '178', '1411/07/545c7b593684f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3160', '478', '1411/07/545c7af864b72.jpg', '1415346936', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3182', '188', '1411/10/546017af45c2f.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3162', '180', '1411/07/545c7c8a5c02b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3166', '479', '1411/07/545c89f46d198.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3163', '181', '1411/07/545c7cd40ac5e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3170', '482', '1411/07/545c8c3852d42.jpg', '1415351352', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3169', '481', '1411/07/545c8bc164c8d.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3167', '480', '1411/07/545c8ad593594.jpg', '1415350997', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3165', '182', '1411/07/545c7ef1f1172.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3179', '184', '1411/10/54600fba70d53.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3180', '185', '1411/10/546013be87a28.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3181', '187', '1411/10/5460153bd2b81.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3183', '189', '1411/10/546018ca62613.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3185', '192', '1411/10/54601c2f41490.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3184', '191', '1411/10/54601ac41aab0.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3186', '193', '1411/10/54601d4eb1341.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3187', '194', '1411/10/54601dee28c73.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3188', '195', '1411/10/54601ec71f80d.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3189', '196', '1411/10/546020ecd6ba3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3190', '197', '1411/10/5460227eca5a3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3191', '198', '1411/10/546024f9a357c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3192', '199', '1411/10/546025c95fc5e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3193', '200', '1411/10/546031b0d997a.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3194', '201', '1411/10/546033d895937.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2763', '203', '1410/27/544df790ab943.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2764', '224', '1410/27/544df8e8c3e73.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2762', '202', '1410/27/544df5070d74a.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2761', '204', '1410/27/544df46df1cea.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3205', '205', '1411/25/5474286945831.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3203', '491', '1411/12/5462f5340734a.jpg', '1415771444', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3204', '490', '1411/12/5463274049b88.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3220', '208', '1411/28/54782dbf1d58f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3218', '208', '1411/28/54782d35e705a.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3213', '209', '1411/28/54782792826dd.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3214', '209', '1411/28/547827928edae.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3217', '208', '1411/28/54782d35ce757.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3216', '209', '1411/28/54782a1d71760.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3208', '210', '1411/28/547821fecd483.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3210', '210', '1411/28/547821feeb4a7.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3206', '211', '1411/25/54742b920916b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3172', '212', '1411/07/545c90740a736.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3207', '213', '1411/25/54742d6d87f52.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1189', '216', '1410/08/5434f351b3b20.jpg', '1412756311', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1186', '215', '1410/08/5434f30105b21.jpg', '1412756225', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1176', '215', '1410/08/5434f2fca1ff9.jpg', '1412756225', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3235', '354', '1412/02/547d68f6ed350.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1226', '219', '1410/09/5435f61ef39e1.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1225', '219', '1410/09/5435f61ee3c02.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1224', '219', '1410/09/5435f61ed3ca9.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1223', '219', '1410/09/5435f61ebae43.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1222', '219', '1410/09/5435f61e9fa21.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1221', '219', '1410/09/5435f61e896df.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1220', '219', '1410/09/5435f61e387b7.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1219', '219', '1410/09/5435f61d2c45d.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1218', '219', '1410/09/5435f61d29af8.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1209', '218', '1410/09/5435f4f08f5e8.png', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1210', '218', '1410/09/5435f4f106844.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1211', '218', '1410/09/5435f4f14e86b.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1212', '218', '1410/09/5435f4f188ed2.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1213', '218', '1410/09/5435f4f1ca571.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1214', '218', '1410/09/5435f4f230304.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1215', '218', '1410/09/5435f4f26da63.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1216', '218', '1410/09/5435f4f2aab4e.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1217', '218', '1410/09/5435f4f2f3366.jpg', '1412822259', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1227', '219', '1410/09/5435f61f11691.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1228', '219', '1410/09/5435f61f2646c.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1229', '219', '1410/09/5435f61f55c90.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1230', '219', '1410/09/5435f61f67c3d.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1231', '219', '1410/09/5435f61fb0b77.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1232', '219', '1410/09/5435f61fc61cb.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1233', '219', '1410/09/5435f61fef0f0.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1234', '219', '1410/09/5435f6200e69f.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1235', '219', '1410/09/5435f62031354.jpg', '1412822560', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1271', '223', '1410/09/5435fc3d236ec.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1270', '223', '1410/09/5435fc3ce0169.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1269', '223', '1410/09/5435fc3c779fe.png', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1268', '222', '1410/09/5435fa0b00342.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1267', '222', '1410/09/5435fa0ac0667.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1266', '222', '1410/09/5435fa0905898.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1265', '222', '1410/09/5435fa0729d67.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1264', '222', '1410/09/5435fa05a4b07.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1263', '222', '1410/09/5435fa054a71d.jpg', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1262', '222', '1410/09/5435fa04cc2e1.png', '1412823563', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3201', '489', '1411/12/5462ee9b980ae.jpg', '1415769755', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3200', '488', '1411/12/5462edf04967a.jpg', '1415769584', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3199', '487', '1411/12/5462ed7d5ca40.jpg', '1415769469', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3198', '486', '1411/12/5462ecc20ae5a.jpg', '1415769282', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3197', '485', '1411/12/5462ec1d0bda9.jpg', '1415769117', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3196', '484', '1411/12/5462ec1adf43d.jpg', '1415769115', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3195', '483', '1411/12/5462ea272f0e0.jpg', '1415768615', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1254', '221', '1410/09/5435f77c9bbb0.jpg', '1412822912', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1272', '223', '1410/09/5435fc3d5c2d7.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1273', '223', '1410/09/5435fc3daf3d2.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1274', '223', '1410/09/5435fc3e0e54f.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1275', '223', '1410/09/5435fc3e41366.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1276', '223', '1410/09/5435fc3e79f86.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1277', '223', '1410/09/5435fc3f098c3.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1278', '223', '1410/09/5435fc3f6fa25.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1279', '223', '1410/09/5435fc3fc1c30.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1280', '223', '1410/09/5435fc401ff60.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1281', '223', '1410/09/5435fc4059dde.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1282', '223', '1410/09/5435fc41194c6.jpg', '1412824129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3236', '353', '1412/02/547d6956eec2f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3238', '371', '1412/02/547d6ba71cd4b.jpeg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3176', '226', '1411/07/545c9611bf861.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3178', '225', '1411/07/545c9882da8c5.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1306', '228', '1410/09/54363def3a9fc.jpg', '1412840949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1309', '228', '1410/09/54363df0da81f.jpg', '1412840949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1317', '228', '1410/09/54363df3d3030.jpg', '1412840949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1335', '230', '1410/09/543641d31fd71.jpg', '1412841942', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1343', '231', '1410/09/543658eec66e2.jpg', '1412847855', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1360', '233', '1410/09/543661329cf56.jpg', '1412849975', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1390', '235', '1410/09/543662334ce4a.jpg', '1412850230', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1388', '235', '1410/09/54366232401e6.jpg', '1412850230', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1426', '238', '1410/09/54366857061a0.jpg', '1412851799', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1425', '238', '1410/09/54366855b6942.jpg', '1412851799', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1424', '238', '1410/09/543668536ff4e.jpg', '1412851799', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1423', '238', '1410/09/54366851a03f6.jpg', '1412851799', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1420', '237', '1410/09/5436664d1110f.gif', '1412851278', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1419', '237', '1410/09/5436664ca5ee1.gif', '1412851278', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1431', '240', '1410/09/54366940a633a.png', '1412852035', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1439', '241', '1410/09/54366b1605739.png', '1412852502', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1445', '242', '1410/10/54373d10250d1.jpg', '1412906258', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1446', '242', '1410/10/54373d10d6b11.jpg', '1412906258', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1448', '243', '1410/10/54373e864b09c.jpg', '1412906635', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1451', '243', '1410/10/54373e87f17cc.jpg', '1412906635', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1458', '244', '1410/10/54374282ac274.jpg', '1412907653', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3232', '245', '1412/02/547d5b4ec380d.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1469', '245', '1410/10/543743656e701.jpg', '1412907878', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1473', '246', '1410/10/543747bb468fb.jpg', '1412908989', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1476', '247', '1410/10/5437490aa1a08.jpg', '1412909323', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1478', '248', '1410/10/54374c6c895ab.jpg', '1412910200', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3154', '477', '1411/07/545c6e128042a.jpg', '1415343634', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3153', '476', '1411/07/545c6d7a5a479.jpg', '1415343482', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3150', '467', '1411/07/545c61966f093.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3148', '474', '1411/07/545c5d8a04942.jpg', '1415339402', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3147', '473', '1411/07/545c5a997daec.png', '1415338649', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3146', '472', '1411/07/545c559eb1be1.jpg', '1415337374', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3144', '249', '1411/06/545b0f9d230f4.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3145', '471', '1411/07/545c3fd285dcf.jpg', '1415331794', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1511', '250', '1410/10/5437780f2e655.jpg', '1412921361', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1518', '251', '1410/10/5437795b025ae.jpg', '1412921691', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1521', '252', '1410/10/543785fd6aab0.jpg', '1412924931', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1532', '253', '1410/10/54378819075a0.jpg', '1412925467', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2954', '437', '1411/04/545894628256d.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1540', '254', '1410/10/54379f2f06961.png', '1412931397', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2957', '407', '1411/04/54589b57998d0.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2962', '438', '1411/04/5458a74aa9d93.jpg', '1415096138', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2949', '436', '1411/04/5458837f90f2d.jpg', '1415086975', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2946', '433', '1411/04/545868b1eac60.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2948', '435', '1411/04/54587deea451f.jpg', '1415085550', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2947', '434', '1411/04/54586e127684c.jpg', '1415081490', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2964', '432', '1411/04/5458ab8396b43.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2967', '434', '1411/04/5458ac3347f08.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1553', '257', '1410/11/5438371a87e2f.jpg', '1412970282', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3020', '448', '1411/05/54598d03b9fee.jpg', '1415154949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2982', '442', '1411/04/5458c573193a2.jpg', '1415103859', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2990', '444', '1411/05/545985ab355d3.png', '1415153067', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2980', '442', '1411/04/5458c571adb5a.png', '1415103859', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2978', '441', '1411/04/5458c040cbe84.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2972', '440', '1411/04/5458b0ef694c8.jpg', '1415098608', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3019', '448', '1411/05/54598d036488a.jpg', '1415154949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2976', '440', '1411/04/5458b3229562e.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2968', '439', '1411/04/5458b03eba3d5.jpg', '1415098431', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2969', '439', '1411/04/5458b03ebb513.png', '1415098431', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3031', '451', '1411/05/54599ffe4fd78.jpg', '1415159806', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3029', '450', '1411/05/54599ec76919f.png', '1415159495', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2996', '445', '1411/05/545986ce3dd50.jpg', '1415153358', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2995', '445', '1411/05/545986cd8d668.jpg', '1415153358', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3017', '445', '1411/05/54598b4ddc4d9.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2940', '258', '1411/04/54585f98e745f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2994', '445', '1411/05/545986cd18cf5.jpg', '1415153358', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1576', '259', '1410/11/543838275520d.jpg', '1412970541', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3008', '447', '1411/05/54598789a9fb9.jpg', '1415153547', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3016', '447', '1411/05/545989cf77ee1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3021', '448', '1411/05/54598d0418897.jpg', '1415154949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3027', '448', '1411/05/54598ed21757d.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3028', '449', '1411/05/54599a9000464.JPG', '1415158416', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3023', '448', '1411/05/54598d0466eaf.jpg', '1415154949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3022', '448', '1411/05/54598d043ed2d.jpg', '1415154949', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1586', '260', '1410/11/54383d1392ee7.jpg', '1412971797', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3125', '464', '1411/05/5459deabc23a8.jpg', '1415175851', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3010', '447', '1411/05/5459878a0f0ad.jpg', '1415153547', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1591', '261', '1410/11/54383e3af0ca0.jpg', '1412972092', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3009', '447', '1411/05/54598789e5418.jpg', '1415153547', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2939', '262', '1411/04/54585e37edd9b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3011', '447', '1411/05/5459878a3b540.jpg', '1415153547', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3116', '460', '1411/05/5459cda2bafbc.jpg', '1415171490', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3152', '475', '1411/07/545c6c9052d57.jpg', '1415343248', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3151', '466', '1411/07/545c61b3f3e61.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3121', '461', '1411/05/5459d5346b99b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3123', '462', '1411/05/5459d60c576c5.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3012', '447', '1411/05/5459878a5c774.jpg', '1415153547', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1605', '263', '1410/11/5438408dac59d.jpg', '1412972690', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3115', '459', '1411/05/5459c73ff2bea.jpg', '1415169856', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3126', '465', '1411/05/5459e5664b4cf.jpg', '1415177574', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3113', '452', '1411/05/5459c1ec5c330.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3124', '463', '1411/05/5459dc3031520.jpg', '1415175216', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2938', '431', '1411/04/54585d9d5047d.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2935', '430', '1411/04/54585b67a28e7.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1614', '264', '1410/11/543844c4673fd.jpg', '1412973768', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1618', '265', '1410/11/54384629e2b32.jpg', '1412974126', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1641', '266', '1410/11/543846d2ed52b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1643', '267', '1410/11/543847f32230d.jpg', '1412974579', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1645', '268', '1410/11/54384b81e7556.JPG', '1412975493', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3137', '468', '1411/06/545af9e56ec6e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1651', '269', '1410/11/54384d167e9c7.JPG', '1412975896', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3112', '458', '1411/05/5459c1271cdce.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1657', '270', '1410/11/543850417e18e.jpg', '1412976707', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1662', '270', '1410/11/5438504345265.jpg', '1412976707', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1663', '271', '1410/11/54385306f255b.jpg', '1412977417', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1664', '271', '1410/11/54385307b0824.jpg', '1412977417', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1670', '275', '1410/14/543c8b397419a.jpg', '1413253966', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1685', '278', '1410/14/543c918db1979.jpg', '1413255580', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1699', '279', '1410/14/543c969b52bc6.jpeg', '1413256871', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1725', '281', '1410/14/543c9980da2fc.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1727', '282', '1410/14/543c9b654ba74.jpg', '1413258088', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1732', '283', '1410/14/543c9de67bd50.jpg', '1413258733', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1748', '284', '1410/14/543c9ec22c485.jpg', '1413258961', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1766', '285', '1410/14/543ca08c49ba9.jpg', '1413259406', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1774', '286', '1410/14/543ca194089e6.jpg', '1413259672', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2928', '291', '1411/04/5458457533348.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2929', '291', '1411/04/545845753ff82.JPG', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2933', '430', '1411/04/545847bbb1bc1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2931', '290', '1411/04/5458475ea9685.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1806', '289', '1410/14/543ca5d366f04.jpg', '1413260757', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1800', '288', '1410/14/543ca44906d3a.jpg', '1413260366', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2832', '413', '1411/01/5454e84c54586.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1826', '293', '1410/15/543de66a3f1d8.jpg', '1413342828', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1828', '294', '1410/15/543de6e52e905.jpg', '1413342951', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2840', '414', '1411/01/5454edce196ab.jpg', '1414852046', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1830', '295', '1410/15/543de8527f1bf.png', '1413343318', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2901', '419', '1411/03/5456d12740c9c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2930', '291', '1411/04/545845754a2a3.JPG', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2897', '421', '1411/03/5456cf35d79f3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2902', '419', '1411/03/5456d1274bc9b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2837', '413', '1411/01/5454e84e7a780.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2839', '414', '1411/01/5454edcdab390.jpg', '1414852046', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2838', '414', '1411/01/5454edcd588a5.jpg', '1414852046', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1840', '296', '1410/15/543de8e298cb9.png', '1413343463', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2888', '423', '1411/02/545630995569b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2894', '421', '1411/03/5456cf35b3309.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2873', '422', '1411/02/5455b7ad4e992.png', '1414903746', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2903', '419', '1411/03/5456d12757bf2.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2895', '421', '1411/03/5456cf35c1698.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2899', '419', '1411/03/5456d1272736c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2900', '419', '1411/03/5456d12735415.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2898', '421', '1411/03/5456cf35e38de.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2892', '424', '1411/03/5456cc940f775.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2893', '424', '1411/03/5456cc941aeab.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2896', '421', '1411/03/5456cf35ccb9f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1854', '297', '1410/15/543dee9c05520.jpg', '1413344925', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2889', '423', '1411/02/545630c1a7ede.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1857', '298', '1410/15/543df28df08aa.jpg', '1413345934', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1858', '299', '1410/15/543df2e534bd7.jpg', '1413346021', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1859', '300', '1410/15/543df94be5d36.jpg', '1413347671', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3229', '300', '1411/28/547841cb0bdd9.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3227', '301', '1411/28/54783d9ec4e03.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3228', '301', '1411/28/54783d9eccb02.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3224', '302', '1411/28/5478371ab8cb6.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3226', '302', '1411/28/54783aef6e436.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3221', '303', '1411/28/54782fd96da2f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3222', '303', '1411/28/54782fd982f17.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3223', '303', '1411/28/54782fd9a7253.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2915', '426', '1411/03/54574139851e3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1952', '304', '1410/15/543dff04841c6.png', '1413349127', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2911', '425', '1411/03/5456e5da015b1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2910', '425', '1411/03/5456e5d9e311a.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2909', '425', '1411/03/5456e533c5d39.png', '1414980915', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1957', '305', '1410/15/543e0033ac152.png', '1413349431', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2922', '427', '1411/03/545748bf348d1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2917', '426', '1411/03/54574186b3a34.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2914', '426', '1411/03/545740c379d3e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2913', '426', '1411/03/545740c363f3e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2830', '306', '1411/01/5454dcb48c8b7.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2925', '428', '1411/03/54575b394f80a.png', '1415011129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1976', '307', '1410/15/543e05c2a9284.jpg', '1413350850', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1977', '308', '1410/15/543e086584c26.jpg', '1413351525', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1978', '309', '1410/15/543e0c155fd2a.jpg', '1413352472', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2924', '424', '1411/03/5457493a83cec.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1990', '310', '1410/16/543fbcd4d3bf1.png', '1413463257', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2920', '427', '1411/03/545748958e5d3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2923', '427', '1411/03/545748bf4ba3f.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1993', '311', '1410/16/543fcf8b58fd5.png', '1413468045', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1994', '311', '1410/16/543fcf8c17179.jpg', '1413468045', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1995', '311', '1410/16/543fcf8cbe1e7.jpg', '1413468045', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1996', '312', '1410/16/543fd00182a0a.png', '1413468163', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1997', '312', '1410/16/543fd002142f3.jpg', '1413468163', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1998', '312', '1410/16/543fd002b1c17.jpg', '1413468163', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('1999', '313', '1410/16/543fd162d9273.jpg', '1413468519', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2006', '314', '1410/16/543fd1ffc0ddc.jpg', '1413468674', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2012', '315', '1410/16/543fdc24ad656.png', '1413471270', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2015', '316', '1410/16/543fde6c9b2b2.png', '1413471856', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2025', '317', '1410/16/543fdfc8bcbf7.png', '1413472201', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2028', '318', '1410/16/543fe08328f44.JPG', '1413472388', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2030', '319', '1410/17/5440ad45c0029.png', '1413524806', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2031', '320', '1410/17/5440ae00d8edd.png', '1413524993', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2829', '321', '1411/01/5454d7de98f52.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2825', '412', '1411/01/5454d62285ab3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2827', '412', '1411/01/5454d686e72be.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2828', '322', '1411/01/5454d71537df5.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2826', '412', '1411/01/5454d64ca6266.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2820', '323', '1411/01/5454d534debd3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2818', '324', '1411/01/5454d46eb7d09.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2817', '325', '1411/01/5454d2cec4ce1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2816', '326', '1411/01/5454d1c3371b5.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2078', '327', '1410/17/5440c3afee6cb.jpg', '1413530546', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2082', '328', '1410/17/5440c4d5010bd.png', '1413530837', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2083', '329', '1410/17/5440c5bda8cab.png', '1413531069', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2084', '330', '1410/17/5440c6c949e1b.jpg', '1413531337', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2085', '331', '1410/17/5440cdb290e27.jpg', '1413533106', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2815', '332', '1411/01/5454ce8a76b4b.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2814', '411', '1411/01/5454ce26ccf89.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2813', '411', '1411/01/5454ce267cbb9.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2811', '411', '1411/01/5454cdb4d53d4.jpg', '1414843829', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2810', '333', '1411/01/5454cd8e2f7e3.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2809', '334', '1411/01/5454cd0569494.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2808', '335', '1411/01/5454cc802a0e1.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2807', '336', '1411/01/5454cb6a46fa4.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2147', '337', '1410/18/5441fcc7bfa0f.jpg', '1413610701', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2160', '338', '1410/18/5441fd2a7b259.png', '1413610799', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2768', '339', '1411/01/54547023cf511.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2184', '340', '1410/18/5442034acbd36.png', '1413612367', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2197', '341', '1410/18/54420b0f20d13.png', '1413614355', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2204', '342', '1410/18/54420d3176616.png', '1413614900', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2760', '144', '1410/27/544df2b7866f3.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2213', '343', '1410/18/54420f4bb6eb5.jpg', '1413615437', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2215', '344', '1410/18/54421106b1449.jpg', '1413615883', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2224', '345', '1410/18/5442124c60a89.png', '1413616208', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2236', '346', '1410/18/5442130ee1184.png', '1413616404', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2248', '347', '1410/18/544213b312816.png', '1413616568', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2260', '348', '1410/18/5442145fcbee6.png', '1413616738', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2271', '349', '1410/18/544215e4e47dd.png', '1413617129', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2281', '350', '1410/18/544216cd1c67e.png', '1413617359', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2288', '351', '1410/18/544217831c06c.png', '1413617541', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2295', '352', '1410/18/54421c1d5bf85.png', '1413618717', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2309', '355', '1410/18/54421e6ecc38f.png', '1413619315', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2966', '431', '1411/04/5458abbe65e6e.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2956', '407', '1411/04/54589b5791b03.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2314', '356', '1410/18/54421fdc10513.png', '1413619680', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2319', '357', '1410/20/54447a8c45a05.png', '1413773972', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2333', '358', '1410/20/54447b30f2588.png', '1413774134', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2346', '359', '1410/20/54447c004d5d4.png', '1413774343', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2358', '360', '1410/20/54447facb8a75.png', '1413775287', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2963', '433', '1411/04/5458ab5e0cf75.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2961', '406', '1411/04/54589fc02048c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2383', '361', '1410/20/544483ec939eb.png', '1413776365', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2385', '362', '1410/20/544488d21a16f.png', '1413777618', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2387', '363', '1410/20/54448bda2f734.png', '1413778402', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2400', '364', '1410/20/54448cb191a5e.png', '1413778617', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2413', '365', '1410/20/5444900392ff5.jpg', '1413779459', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2415', '366', '1410/20/54449287eba3d.png', '1413780108', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2426', '367', '1410/20/5444bf6390546.jpg', '1413791602', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2435', '368', '1410/20/5444c0b290730.png', '1413791925', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2441', '369', '1410/20/5444c2702cead.png', '1413792371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2451', '370', '1410/20/5444c2ad5397c.png', '1413792433', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('3231', '291', '1412/02/547d45eb13c67.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2466', '372', '1410/20/5444cba13b4e9.png', '1413794726', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2479', '373', '1410/20/5444ced3b891e.png', '1413795540', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2758', '374', '1410/26/544d0655d5f3c.jpg', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2511', '375', '1410/23/5448992a0ff36.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2513', '376', '1410/23/54489c60a98ec.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2514', '376', '1410/23/54489c60aaacb.png', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2515', '376', '1410/23/54489c614cd4e.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2516', '376', '1410/23/54489c65395c1.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2517', '376', '1410/23/54489c659348e.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2518', '376', '1410/23/54489c6601e54.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2519', '376', '1410/23/54489c676614d.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2520', '376', '1410/23/54489c6be240c.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2521', '376', '1410/23/54489c6c59dc4.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2522', '376', '1410/23/54489c6d573db.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2523', '376', '1410/23/54489c6e98680.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2524', '376', '1410/23/54489c70cf112.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2525', '376', '1410/23/54489c71ebf0f.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2526', '376', '1410/23/54489c7323234.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2527', '376', '1410/23/54489c755c98a.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2528', '376', '1410/23/54489c75b7b48.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2529', '376', '1410/23/54489c76412b9.jpg', '1414044790', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2531', '377', '1410/23/54489cf8042af.png', '1414044923', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2534', '376', '1410/23/54489e05d8072.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2536', '378', '1410/23/5448abca7ce51.png', '1414048718', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2546', '379', '1410/23/5448acf2a4bc3.png', '1414049013', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2556', '380', '1410/23/5448b3ba709a5.png', '1414050750', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2566', '381', '1410/23/5448b42d10c99.png', '1414050867', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2576', '382', '1410/23/5448b75fc7232.png', '1414051683', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2586', '383', '1410/23/5448c06362525.png', '1414053991', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2595', '384', '1410/23/5448c192d2ea5.png', '1414054293', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2599', '385', '1410/23/5448c4bc7142c.png', '1414055104', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2607', '386', '1410/23/5448c527394d0.png', '1414055213', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2613', '387', '1410/23/5448ca7713f27.png', '1414056576', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2622', '388', '1410/23/5448d0288ac64.png', '1414058029', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2633', '389', '1410/23/5448d10482dd3.png', '1414058249', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2644', '390', '1410/23/5448d36c0a0f2.png', '1414058863', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2654', '391', '1410/23/5448d4b0e3c00.png', '1414059194', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2663', '392', '1410/24/5449e4b2d90ad.png', '1414128820', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2669', '393', '1410/24/5449e66741751.png', '1414129257', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2675', '394', '1410/24/5449ea3887de3.png', '1414130233', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2681', '395', '1410/24/5449f5a44cc7c.png', '1414133159', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2688', '396', '1410/24/5449f674a0126.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2689', '396', '1410/24/5449f674a1176.png', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2690', '396', '1410/24/5449f6754639c.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2691', '396', '1410/24/5449f675c6256.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2692', '396', '1410/24/5449f6767599f.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2693', '396', '1410/24/5449f676c1e78.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2694', '396', '1410/24/5449f67701cf0.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2695', '396', '1410/24/5449f6773fccd.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2696', '396', '1410/24/5449f677f3941.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2697', '396', '1410/24/5449f678cf468.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2698', '396', '1410/24/5449f6797e8d1.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2699', '396', '1410/24/5449f67a477bb.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2700', '396', '1410/24/5449f67b0133a.jpg', '1414133371', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2702', '397', '1410/24/5449f85b49112.png', '1414133854', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2713', '398', '1410/24/5449fb942729b.png', '1414134676', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2958', '405', '1411/04/54589e0820a7d.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2716', '400', '1410/24/544a0213210ab.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2717', '399', '1410/24/544a023d80c8c.png', '0', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2719', '401', '1410/24/544a039b02b5d.png', '1414136731', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2721', '402', '1410/24/544a064b6b34d.png', '1414137419', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2723', '403', '1410/24/544a089fc0f44.png', '1414138015', '255', '1');
INSERT INTO `weixin_item_img` VALUES ('2725', '404', '1410/24/544a0987c8786.png', '1414138247', '255', '1');

-- ----------------------------
-- Table structure for weixin_item_like
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_like`;
CREATE TABLE `weixin_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_like
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_item_order
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_order`;
CREATE TABLE `weixin_item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `add_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  `note` text CHARACTER SET utf8 COMMENT '客服备注',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `userName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `address_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系手机',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1:待付款 2：待发货  3:待收货 4:完成 5:关闭',
  `supportmetho` tinyint(5) DEFAULT NULL COMMENT '支付方式 1:支付宝 2:货到付款',
  `freetype` int(11) DEFAULT NULL COMMENT '用户快递方式  1:平邮 2:快递 3:ems 0:卖家包邮',
  `freeprice` decimal(10,2) DEFAULT '0.00' COMMENT '快递费用',
  `closemsg` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '关闭原因',
  `support_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `sellerRemark` text CHARACTER SET utf8 COMMENT '客服备注',
  `userfree` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '给用户配送快递方式 0:无需快递',
  `freecode` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递编号',
  `fahuoaddress` int(11) DEFAULT NULL COMMENT '发货地址',
  `fahuo_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `paytype` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付方式',
  `payorder` text CHARACTER SET utf8 COMMENT '支付方订单详情',
  `store_id` int(10) DEFAULT NULL COMMENT '上门取货店铺ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of weixin_item_order
-- ----------------------------
INSERT INTO `weixin_item_order` VALUES ('1', '201408142351351838', '1408031495', '100.00', '100.00', null, '31', 'o49SHs8j6AeO47re03iN1hghcx1Y', '卢顺成', '18030525005', '四川省成都市郫县红光镇银润南一路66号', '1', null, '0', '0.00', null, null, null, '', null, null, null, null, null, null);
INSERT INTO `weixin_item_order` VALUES ('2', '201408161246581002', '1408164418', '100.00', '100.00', null, '31', 'o49SHs8j6AeO47re03iN1hghcx1Y', '卢顺成', '18030525005', '四川省成都市郫县红光镇银润南一路66号', '1', null, '0', '0.00', null, null, null, '', null, null, null, null, null, null);
INSERT INTO `weixin_item_order` VALUES ('3', '201410141012251121', '1413252745', '8.60', '8.60', null, '31', 'o49SHs8j6AeO47re03iN1hghcx1Y', '卢顺成', '18030525005', '四川省成都市郫县红光镇银润南一路66号', '1', '1', '0', '0.00', null, null, null, '', null, null, null, null, null, null);
INSERT INTO `weixin_item_order` VALUES ('6', '201412031440491565', '1417588849', '5.90', '5.90', null, '31', 'o49SHs8j6AeO47re03iN1hghcx1Y', '卢顺成', '18030525005', '四川省成都市郫县红光镇银润南一路66号', '1', '1', '0', '0.00', null, null, null, '', null, null, null, null, null, null);
INSERT INTO `weixin_item_order` VALUES ('7', '201412061358151386', '1417845495', '5.90', '5.90', null, '44', 'o49SHs9BWnbALCNyqMPgjjsgpoJw', '潘丽', '18030505004', '四川成都成都市华润橡树湾', '5', '2', '0', '0.00', '其他原因', '1417845512', null, '', null, null, null, null, null, null);
INSERT INTO `weixin_item_order` VALUES ('8', '201412061406561785', '1417846016', '33.80', '33.80', null, '44', 'o49SHs9BWnbALCNyqMPgjjsgpoJw', '潘丽', '18030505004', '四川成都成都市华润橡树湾', '5', '2', '0', '0.00', '其他原因', '1417846051', null, '', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for weixin_item_orig
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_orig`;
CREATE TABLE `weixin_item_orig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_orig
-- ----------------------------
INSERT INTO `weixin_item_orig` VALUES ('1', '50b2e721a6c1e_thumb.jpg', '淘宝', 'taobao.com', '0');
INSERT INTO `weixin_item_orig` VALUES ('2', '50b2e726d4ade_thumb.jpg', '天猫', 'tmall.com', '0');

-- ----------------------------
-- Table structure for weixin_item_purchase
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_purchase`;
CREATE TABLE `weixin_item_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `price` float(8,2) DEFAULT NULL,
  `date` int(11) DEFAULT '0',
  `admin_id` int(11) DEFAULT '0' COMMENT '录入员',
  `number` int(11) DEFAULT '0' COMMENT '进货数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of weixin_item_purchase
-- ----------------------------
INSERT INTO `weixin_item_purchase` VALUES ('2', '144', '24.50', null, '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('3', '143', '13.75', null, '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('4', '142', '13.75', null, '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('5', '147', '16.00', null, '0', '8');
INSERT INTO `weixin_item_purchase` VALUES ('6', '148', '16.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('7', '146', '16.00', null, '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('8', '145', '16.00', null, '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('9', '152', '30.83', null, '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('10', '151', '30.83', null, '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('11', '150', '30.83', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('12', '149', '30.83', null, '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('13', '155', '31.00', null, '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('14', '153', '31.00', null, '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('15', '218', '15.50', null, '0', '17');
INSERT INTO `weixin_item_purchase` VALUES ('16', '221', '15.50', null, '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('17', '219', '15.50', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('18', '160', '21.60', null, '0', '7');
INSERT INTO `weixin_item_purchase` VALUES ('19', '161', '21.70', null, '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('20', '162', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('21', '163', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('22', '164', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('23', '166', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('24', '165', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('25', '167', '6.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('26', '223', '24.50', null, '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('27', '222', '24.50', null, '0', '7');
INSERT INTO `weixin_item_purchase` VALUES ('28', '175', '22.00', null, '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('29', '180', '13.00', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('30', '181', '13.00', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('31', '177', '15.00', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('32', '177', '15.00', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('33', '187', '14.00', null, '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('34', '185', '14.00', null, '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('35', '182', '14.00', null, '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('36', '174', '14.00', null, '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('37', '173', '14.00', null, '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('38', '172', '14.00', '1412943324', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('39', '170', '14.00', '1412943356', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('40', '172', '14.00', '1412943554', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('41', '226', '14.00', '1412943725', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('42', '171', '14.00', '1412943771', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('43', '171', '14.00', '1412944569', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('44', '184', '14.00', '1412944709', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('45', '196', '3.80', '1412944849', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('46', '197', '3.80', '1412944871', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('47', '198', '3.80', '1412944906', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('48', '199', '3.80', '1412944942', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('49', '200', '3.40', '1412945019', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('50', '201', '3.40', '1412945055', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('51', '201', '3.40', '1412945185', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('52', '189', '4.30', '1412945545', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('53', '188', '4.30', '1412945651', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('54', '193', '2.50', '1412945765', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('55', '191', '3.50', '1412945825', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('56', '192', '14.20', '1412945871', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('57', '194', '6.70', '1412945915', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('58', '195', '2.20', '1412945945', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('59', '202', '2.00', '1412946901', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('60', '203', '2.00', '1412946920', '0', '36');
INSERT INTO `weixin_item_purchase` VALUES ('61', '204', '3.00', '1412946937', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('62', '224', '3.00', '1412946956', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('63', '211', '7.50', '1412994551', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('64', '212', '23.00', '1412994581', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('65', '231', '9.50', '1412994616', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('66', '228', '9.50', '1412994696', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('67', '230', '9.50', '1412994727', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('68', '205', '8.00', '1412994779', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('69', '208', '9.50', '1412994804', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('70', '209', '9.50', '1412994835', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('71', '210', '9.50', '1412994851', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('72', '216', '10.00', '1412994906', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('73', '215', '10.00', '1412994921', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('74', '213', '10.00', '1412994942', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('75', '233', '6.50', '1412994976', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('76', '235', '6.50', '1412995010', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('77', '237', '7.00', '1412996233', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('78', '238', '7.00', '1412996261', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('79', '240', '7.00', '1412996290', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('80', '241', '7.00', '1412996355', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('81', '242', '6.50', '1412996427', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('82', '243', '6.50', '1412996493', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('83', '247', '6.50', '1412996517', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('84', '244', '6.50', '1412996541', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('85', '248', '7.50', '1412996672', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('86', '245', '6.50', '1412996698', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('87', '246', '6.50', '1412996731', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('88', '251', '9.50', '1412996801', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('89', '250', '9.50', '1412996826', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('90', '249', '9.50', '1412996850', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('91', '252', '11.00', '1412996877', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('92', '253', '11.00', '1412996892', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('93', '254', '12.50', '1412996986', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('94', '233', '12.50', '1412997013', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('95', '258', '12.50', '1412997055', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('96', '259', '12.50', '1412997083', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('97', '260', '12.00', '1412998510', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('98', '263', '7.50', '1412998551', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('99', '262', '7.00', '1412998593', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('100', '261', '7.00', '1412998627', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('101', '264', '3.20', '1412998672', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('102', '265', '3.20', '1412998701', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('103', '266', '3.20', '1412998721', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('104', '267', '3.20', '1412998741', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('105', '269', '14.00', '1412998768', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('106', '268', '27.00', '1412998802', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('107', '270', '18.00', '1412998835', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('108', '271', '10.00', '1412998853', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('109', '374', '7.20', '1414044043', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('110', '375', '6.20', '1414044072', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('111', '377', '5.80', '1414049454', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('112', '376', '5.80', '1414049476', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('113', '378', '7.00', '1414049508', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('114', '379', '7.00', '1414049562', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('115', '381', '6.80', '1414050933', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('116', '380', '7.80', '1414050948', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('117', '382', '6.00', '1414051890', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('118', '383', '4.00', '1414054396', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('119', '384', '3.80', '1414054418', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('120', '386', '3.80', '1414055242', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('121', '385', '3.20', '1414055264', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('122', '387', '3.70', '1414056659', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('123', '389', '5.50', '1414058289', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('124', '388', '4.50', '1414058306', '0', '19');
INSERT INTO `weixin_item_purchase` VALUES ('125', '390', '3.50', '1414059224', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('126', '391', '4.80', '1414059236', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('127', '393', '4.50', '1414129366', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('128', '392', '8.50', '1414129385', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('129', '394', '5.80', '1414130304', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('130', '398', '5.80', '1414134810', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('131', '397', '5.50', '1414134830', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('132', '396', '5.00', '1414134851', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('133', '395', '5.00', '1414134867', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('134', '400', '8.90', '1414136423', '0', '16');
INSERT INTO `weixin_item_purchase` VALUES ('135', '399', '11.50', '1414136442', '0', '16');
INSERT INTO `weixin_item_purchase` VALUES ('136', '401', '12.50', '1414136748', '0', '16');
INSERT INTO `weixin_item_purchase` VALUES ('137', '402', '18.75', '1414137441', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('138', '403', '20.00', '1414138054', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('139', '404', '22.50', '1414138281', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('140', '406', '12.50', '1414317716', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('141', '407', '12.50', '1414388672', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('142', '408', '10.50', '1414838531', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('143', '409', '10.50', '1414840487', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('144', '410', '10.50', '1414842560', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('145', '411', '8.50', '1414844308', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('146', '412', '8.50', '1414846272', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('147', '413', '8.50', '1414850883', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('148', '419', '2.20', '1414900466', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('149', '421', '2.20', '1414902887', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('150', '422', '2.20', '1414931142', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('151', '423', '2.20', '1414932532', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('152', '424', '3.60', '1414974729', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('153', '425', '3.60', '1414981376', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('154', '426', '3.60', '1415004644', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('155', '427', '3.60', '1415006643', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('156', '428', '3.60', '1415069333', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('157', '430', '3.60', '1415070822', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('158', '431', '11.00', '1415077448', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('159', '432', '11.00', '1415079137', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('160', '433', '11.00', '1415080234', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('161', '434', '11.00', '1415081616', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('162', '436', '7.50', '1415087039', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('163', '435', '7.50', '1415087065', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('164', '437', '10.50', '1415091535', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('165', '438', '3.40', '1415096204', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('166', '439', '3.00', '1415098530', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('167', '440', '3.00', '1415098627', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('168', '441', '3.00', '1415103330', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('169', '444', '10.00', '1415153290', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('170', '445', '10.00', '1415153392', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('171', '447', '10.00', '1415154833', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('172', '448', '10.00', '1415155638', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('173', '451', '6.50', '1415160561', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('174', '450', '6.50', '1415160578', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('175', '449', '6.50', '1415160592', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('176', '452', '6.90', '1415170030', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('177', '452', '6.90', '1415170066', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('178', '458', '10.00', '1415170373', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('179', '460', '4.50', '1415171574', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('180', '461', '4.50', '1415171712', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('181', '462', '4.50', '1415172744', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('182', '463', '12.00', '1415175235', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('183', '464', '12.00', '1415175887', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('184', '466', '3.80', '1415192515', '0', '20');
INSERT INTO `weixin_item_purchase` VALUES ('185', '467', '2.20', '1415193507', '0', '20');
INSERT INTO `weixin_item_purchase` VALUES ('186', '468', '3.40', '1415250677', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('187', '471', '0.80', '1415331968', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('188', '472', '0.80', '1415337442', '0', '24');
INSERT INTO `weixin_item_purchase` VALUES ('189', '473', '1.43', '1415338688', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('190', '474', '0.50', '1415339746', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('191', '475', '28.00', '1415343372', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('192', '476', '28.00', '1415343542', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('193', '477', '28.00', '1415343653', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('194', '478', '12.00', '1415347058', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('195', '479', '6.50', '1415347487', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('196', '480', '6.50', '1415351014', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('197', '481', '6.50', '1415351248', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('198', '482', '6.50', '1415351366', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('199', '483', '3.70', '1415768954', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('200', '484', '3.70', '1415769166', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('201', '486', '3.70', '1415769327', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('202', '487', '3.70', '1415769505', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('203', '488', '3.70', '1415769607', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('204', '489', '3.80', '1415769772', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('205', '490', '3.70', '1415771369', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('206', '491', '3.70', '1415771539', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('207', '373', '5.50', '1417575872', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('208', '372', '6.00', '1417576336', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('209', '371', '1.30', '1417577074', '0', '60');
INSERT INTO `weixin_item_purchase` VALUES ('210', '368', '3.17', '1417577635', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('211', '367', '3.60', '1417577852', '0', '14');
INSERT INTO `weixin_item_purchase` VALUES ('212', '366', '7.90', '1417577981', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('213', '365', '9.00', '1417578072', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('214', '364', '11.00', '1417578115', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('215', '370', '2.60', '1417578806', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('216', '369', '2.60', '1417578841', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('217', '363', '11.00', '1417579016', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('218', '362', '28.00', '1417579119', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('219', '361', '27.50', '1417579216', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('220', '360', '18.50', '1417579480', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('221', '359', '10.00', '1417580657', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('222', '358', '10.00', '1417580686', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('223', '357', '10.00', '1417580714', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('224', '356', '11.00', '1417581222', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('225', '355', '11.00', '1417581246', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('226', '354', '11.00', '1417581270', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('227', '353', '11.00', '1417581383', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('228', '352', '4.50', '1417581807', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('229', '351', '14.00', '1417582289', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('230', '350', '14.00', '1417582379', '0', '8');
INSERT INTO `weixin_item_purchase` VALUES ('231', '349', '14.00', '1417582456', '0', '9');
INSERT INTO `weixin_item_purchase` VALUES ('232', '348', '11.50', '1417582525', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('233', '347', '11.50', '1417582561', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('234', '346', '11.50', '1417582599', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('235', '345', '11.50', '1417582761', '0', '7');
INSERT INTO `weixin_item_purchase` VALUES ('236', '344', '6.50', '1417582825', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('237', '343', '7.50', '1417582918', '0', '16');
INSERT INTO `weixin_item_purchase` VALUES ('238', '342', '30.00', '1417583592', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('239', '341', '3.12', '1417583802', '0', '48');
INSERT INTO `weixin_item_purchase` VALUES ('240', '340', '7.50', '1417593954', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('241', '339', '7.50', '1417594004', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('242', '338', '7.50', '1417594035', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('243', '337', '7.50', '1417594063', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('244', '336', '5.50', '1417594174', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('245', '335', '5.50', '1417594232', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('246', '334', '5.50', '1417594610', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('247', '333', '5.50', '1417594637', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('249', '332', '5.50', '1417594675', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('250', '331', '7.00', '1417594839', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('251', '330', '7.00', '1417594951', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('252', '329', '7.00', '1417594993', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('253', '328', '7.00', '1417595018', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('254', '327', '7.00', '1417595050', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('255', '326', '9.17', '1417595335', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('256', '325', '9.17', '1417595375', '0', '20');
INSERT INTO `weixin_item_purchase` VALUES ('257', '324', '9.17', '1417595407', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('258', '323', '9.17', '1417595451', '0', '7');
INSERT INTO `weixin_item_purchase` VALUES ('259', '322', '9.17', '1417595482', '0', '18');
INSERT INTO `weixin_item_purchase` VALUES ('260', '321', '9.17', '1417595512', '0', '13');
INSERT INTO `weixin_item_purchase` VALUES ('261', '320', '14.50', '1417595590', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('262', '319', '14.50', '1417595627', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('263', '318', '3.80', '1417595686', '0', '8');
INSERT INTO `weixin_item_purchase` VALUES ('264', '317', '3.80', '1417595719', '0', '18');
INSERT INTO `weixin_item_purchase` VALUES ('265', '316', '3.80', '1417595742', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('266', '315', '3.80', '1417595769', '0', '10');
INSERT INTO `weixin_item_purchase` VALUES ('267', '314', '3.75', '1417596320', '0', '4');
INSERT INTO `weixin_item_purchase` VALUES ('268', '313', '3.75', '1417596351', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('269', '312', '3.75', '1417596375', '0', '9');
INSERT INTO `weixin_item_purchase` VALUES ('270', '311', '3.75', '1417596396', '0', '8');
INSERT INTO `weixin_item_purchase` VALUES ('271', '310', '3.83', '1417596440', '0', '30');
INSERT INTO `weixin_item_purchase` VALUES ('272', '309', '0.75', '1417596509', '0', '60');
INSERT INTO `weixin_item_purchase` VALUES ('273', '306', '7.00', '1417596774', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('274', '305', '38.00', '1417596902', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('275', '304', '25.00', '1417596951', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('276', '303', '1.80', '1417597104', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('277', '302', '1.80', '1417597140', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('278', '301', '1.80', '1417597167', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('279', '300', '1.80', '1417597193', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('280', '297', '1.80', '1417597230', '0', '12');
INSERT INTO `weixin_item_purchase` VALUES ('281', '297', '1.80', '1417597261', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('282', '297', '1.80', '1417597282', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('283', '296', '9.00', '1417597351', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('284', '295', '9.00', '1417597390', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('285', '294', '9.00', '1417597412', '0', '1');
INSERT INTO `weixin_item_purchase` VALUES ('286', '293', '9.00', '1417597441', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('287', '291', '11.50', '1417597466', '0', '6');
INSERT INTO `weixin_item_purchase` VALUES ('288', '290', '4.50', '1417597520', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('289', '289', '4.50', '1417597546', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('290', '288', '4.50', '1417597575', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('291', '286', '4.00', '1417597613', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('292', '285', '4.00', '1417597642', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('293', '284', '4.00', '1417597676', '0', '2');
INSERT INTO `weixin_item_purchase` VALUES ('294', '283', '4.00', '1417597698', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('295', '282', '10.00', '1417597772', '0', '3');
INSERT INTO `weixin_item_purchase` VALUES ('296', '281', '15.00', '1417597924', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('297', '279', '15.00', '1417597953', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('298', '278', '15.00', '1417597976', '0', '5');
INSERT INTO `weixin_item_purchase` VALUES ('299', '275', '15.00', '1417597996', '0', '5');

-- ----------------------------
-- Table structure for weixin_item_site
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_site`;
CREATE TABLE `weixin_item_site` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_site
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_item_tag
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_tag`;
CREATE TABLE `weixin_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_tag
-- ----------------------------
INSERT INTO `weixin_item_tag` VALUES ('142', '595');
INSERT INTO `weixin_item_tag` VALUES ('142', '596');
INSERT INTO `weixin_item_tag` VALUES ('142', '597');
INSERT INTO `weixin_item_tag` VALUES ('142', '598');
INSERT INTO `weixin_item_tag` VALUES ('142', '599');
INSERT INTO `weixin_item_tag` VALUES ('142', '600');
INSERT INTO `weixin_item_tag` VALUES ('143', '595');
INSERT INTO `weixin_item_tag` VALUES ('143', '596');
INSERT INTO `weixin_item_tag` VALUES ('143', '597');
INSERT INTO `weixin_item_tag` VALUES ('143', '599');
INSERT INTO `weixin_item_tag` VALUES ('143', '600');
INSERT INTO `weixin_item_tag` VALUES ('143', '601');
INSERT INTO `weixin_item_tag` VALUES ('144', '595');
INSERT INTO `weixin_item_tag` VALUES ('144', '596');
INSERT INTO `weixin_item_tag` VALUES ('144', '602');
INSERT INTO `weixin_item_tag` VALUES ('144', '603');
INSERT INTO `weixin_item_tag` VALUES ('144', '604');
INSERT INTO `weixin_item_tag` VALUES ('145', '599');
INSERT INTO `weixin_item_tag` VALUES ('145', '605');
INSERT INTO `weixin_item_tag` VALUES ('145', '606');
INSERT INTO `weixin_item_tag` VALUES ('145', '607');
INSERT INTO `weixin_item_tag` VALUES ('145', '608');
INSERT INTO `weixin_item_tag` VALUES ('145', '609');
INSERT INTO `weixin_item_tag` VALUES ('146', '599');
INSERT INTO `weixin_item_tag` VALUES ('146', '603');
INSERT INTO `weixin_item_tag` VALUES ('146', '605');
INSERT INTO `weixin_item_tag` VALUES ('146', '606');
INSERT INTO `weixin_item_tag` VALUES ('146', '607');
INSERT INTO `weixin_item_tag` VALUES ('147', '599');
INSERT INTO `weixin_item_tag` VALUES ('147', '605');
INSERT INTO `weixin_item_tag` VALUES ('147', '606');
INSERT INTO `weixin_item_tag` VALUES ('147', '607');
INSERT INTO `weixin_item_tag` VALUES ('147', '610');
INSERT INTO `weixin_item_tag` VALUES ('147', '611');
INSERT INTO `weixin_item_tag` VALUES ('148', '599');
INSERT INTO `weixin_item_tag` VALUES ('148', '602');
INSERT INTO `weixin_item_tag` VALUES ('148', '605');
INSERT INTO `weixin_item_tag` VALUES ('148', '606');
INSERT INTO `weixin_item_tag` VALUES ('148', '607');
INSERT INTO `weixin_item_tag` VALUES ('148', '612');
INSERT INTO `weixin_item_tag` VALUES ('148', '613');
INSERT INTO `weixin_item_tag` VALUES ('149', '602');
INSERT INTO `weixin_item_tag` VALUES ('149', '604');
INSERT INTO `weixin_item_tag` VALUES ('149', '605');
INSERT INTO `weixin_item_tag` VALUES ('149', '606');
INSERT INTO `weixin_item_tag` VALUES ('149', '607');
INSERT INTO `weixin_item_tag` VALUES ('149', '612');
INSERT INTO `weixin_item_tag` VALUES ('149', '613');
INSERT INTO `weixin_item_tag` VALUES ('150', '602');
INSERT INTO `weixin_item_tag` VALUES ('150', '604');
INSERT INTO `weixin_item_tag` VALUES ('150', '605');
INSERT INTO `weixin_item_tag` VALUES ('150', '606');
INSERT INTO `weixin_item_tag` VALUES ('150', '607');
INSERT INTO `weixin_item_tag` VALUES ('150', '608');
INSERT INTO `weixin_item_tag` VALUES ('150', '609');
INSERT INTO `weixin_item_tag` VALUES ('151', '602');
INSERT INTO `weixin_item_tag` VALUES ('151', '603');
INSERT INTO `weixin_item_tag` VALUES ('151', '604');
INSERT INTO `weixin_item_tag` VALUES ('151', '605');
INSERT INTO `weixin_item_tag` VALUES ('151', '607');
INSERT INTO `weixin_item_tag` VALUES ('151', '614');
INSERT INTO `weixin_item_tag` VALUES ('151', '615');
INSERT INTO `weixin_item_tag` VALUES ('152', '604');
INSERT INTO `weixin_item_tag` VALUES ('152', '605');
INSERT INTO `weixin_item_tag` VALUES ('152', '606');
INSERT INTO `weixin_item_tag` VALUES ('152', '607');
INSERT INTO `weixin_item_tag` VALUES ('152', '616');
INSERT INTO `weixin_item_tag` VALUES ('153', '604');
INSERT INTO `weixin_item_tag` VALUES ('153', '606');
INSERT INTO `weixin_item_tag` VALUES ('153', '617');
INSERT INTO `weixin_item_tag` VALUES ('153', '618');
INSERT INTO `weixin_item_tag` VALUES ('153', '619');
INSERT INTO `weixin_item_tag` VALUES ('155', '602');
INSERT INTO `weixin_item_tag` VALUES ('155', '604');
INSERT INTO `weixin_item_tag` VALUES ('155', '606');
INSERT INTO `weixin_item_tag` VALUES ('155', '617');
INSERT INTO `weixin_item_tag` VALUES ('155', '618');
INSERT INTO `weixin_item_tag` VALUES ('160', '604');
INSERT INTO `weixin_item_tag` VALUES ('160', '606');
INSERT INTO `weixin_item_tag` VALUES ('160', '624');
INSERT INTO `weixin_item_tag` VALUES ('160', '625');
INSERT INTO `weixin_item_tag` VALUES ('161', '602');
INSERT INTO `weixin_item_tag` VALUES ('161', '604');
INSERT INTO `weixin_item_tag` VALUES ('161', '606');
INSERT INTO `weixin_item_tag` VALUES ('161', '607');
INSERT INTO `weixin_item_tag` VALUES ('161', '626');
INSERT INTO `weixin_item_tag` VALUES ('162', '599');
INSERT INTO `weixin_item_tag` VALUES ('162', '606');
INSERT INTO `weixin_item_tag` VALUES ('162', '607');
INSERT INTO `weixin_item_tag` VALUES ('162', '627');
INSERT INTO `weixin_item_tag` VALUES ('162', '628');
INSERT INTO `weixin_item_tag` VALUES ('162', '629');
INSERT INTO `weixin_item_tag` VALUES ('162', '630');
INSERT INTO `weixin_item_tag` VALUES ('163', '599');
INSERT INTO `weixin_item_tag` VALUES ('163', '606');
INSERT INTO `weixin_item_tag` VALUES ('163', '629');
INSERT INTO `weixin_item_tag` VALUES ('163', '630');
INSERT INTO `weixin_item_tag` VALUES ('163', '631');
INSERT INTO `weixin_item_tag` VALUES ('163', '632');
INSERT INTO `weixin_item_tag` VALUES ('163', '633');
INSERT INTO `weixin_item_tag` VALUES ('164', '599');
INSERT INTO `weixin_item_tag` VALUES ('164', '602');
INSERT INTO `weixin_item_tag` VALUES ('164', '606');
INSERT INTO `weixin_item_tag` VALUES ('164', '626');
INSERT INTO `weixin_item_tag` VALUES ('164', '629');
INSERT INTO `weixin_item_tag` VALUES ('164', '634');
INSERT INTO `weixin_item_tag` VALUES ('164', '635');
INSERT INTO `weixin_item_tag` VALUES ('164', '636');
INSERT INTO `weixin_item_tag` VALUES ('165', '599');
INSERT INTO `weixin_item_tag` VALUES ('165', '602');
INSERT INTO `weixin_item_tag` VALUES ('165', '614');
INSERT INTO `weixin_item_tag` VALUES ('165', '615');
INSERT INTO `weixin_item_tag` VALUES ('165', '629');
INSERT INTO `weixin_item_tag` VALUES ('165', '630');
INSERT INTO `weixin_item_tag` VALUES ('165', '637');
INSERT INTO `weixin_item_tag` VALUES ('166', '599');
INSERT INTO `weixin_item_tag` VALUES ('166', '606');
INSERT INTO `weixin_item_tag` VALUES ('166', '607');
INSERT INTO `weixin_item_tag` VALUES ('166', '629');
INSERT INTO `weixin_item_tag` VALUES ('166', '630');
INSERT INTO `weixin_item_tag` VALUES ('166', '633');
INSERT INTO `weixin_item_tag` VALUES ('166', '637');
INSERT INTO `weixin_item_tag` VALUES ('167', '599');
INSERT INTO `weixin_item_tag` VALUES ('167', '603');
INSERT INTO `weixin_item_tag` VALUES ('167', '606');
INSERT INTO `weixin_item_tag` VALUES ('167', '628');
INSERT INTO `weixin_item_tag` VALUES ('167', '629');
INSERT INTO `weixin_item_tag` VALUES ('167', '630');
INSERT INTO `weixin_item_tag` VALUES ('167', '638');
INSERT INTO `weixin_item_tag` VALUES ('170', '620');
INSERT INTO `weixin_item_tag` VALUES ('170', '621');
INSERT INTO `weixin_item_tag` VALUES ('170', '623');
INSERT INTO `weixin_item_tag` VALUES ('170', '626');
INSERT INTO `weixin_item_tag` VALUES ('170', '639');
INSERT INTO `weixin_item_tag` VALUES ('171', '602');
INSERT INTO `weixin_item_tag` VALUES ('171', '620');
INSERT INTO `weixin_item_tag` VALUES ('171', '621');
INSERT INTO `weixin_item_tag` VALUES ('171', '622');
INSERT INTO `weixin_item_tag` VALUES ('171', '623');
INSERT INTO `weixin_item_tag` VALUES ('172', '602');
INSERT INTO `weixin_item_tag` VALUES ('172', '611');
INSERT INTO `weixin_item_tag` VALUES ('172', '620');
INSERT INTO `weixin_item_tag` VALUES ('172', '621');
INSERT INTO `weixin_item_tag` VALUES ('172', '623');
INSERT INTO `weixin_item_tag` VALUES ('173', '602');
INSERT INTO `weixin_item_tag` VALUES ('173', '604');
INSERT INTO `weixin_item_tag` VALUES ('173', '621');
INSERT INTO `weixin_item_tag` VALUES ('173', '640');
INSERT INTO `weixin_item_tag` VALUES ('173', '641');
INSERT INTO `weixin_item_tag` VALUES ('173', '642');
INSERT INTO `weixin_item_tag` VALUES ('174', '604');
INSERT INTO `weixin_item_tag` VALUES ('174', '621');
INSERT INTO `weixin_item_tag` VALUES ('174', '642');
INSERT INTO `weixin_item_tag` VALUES ('174', '643');
INSERT INTO `weixin_item_tag` VALUES ('174', '644');
INSERT INTO `weixin_item_tag` VALUES ('174', '645');
INSERT INTO `weixin_item_tag` VALUES ('175', '599');
INSERT INTO `weixin_item_tag` VALUES ('175', '606');
INSERT INTO `weixin_item_tag` VALUES ('175', '607');
INSERT INTO `weixin_item_tag` VALUES ('175', '646');
INSERT INTO `weixin_item_tag` VALUES ('175', '647');
INSERT INTO `weixin_item_tag` VALUES ('177', '599');
INSERT INTO `weixin_item_tag` VALUES ('177', '602');
INSERT INTO `weixin_item_tag` VALUES ('177', '605');
INSERT INTO `weixin_item_tag` VALUES ('177', '607');
INSERT INTO `weixin_item_tag` VALUES ('177', '628');
INSERT INTO `weixin_item_tag` VALUES ('177', '648');
INSERT INTO `weixin_item_tag` VALUES ('177', '649');
INSERT INTO `weixin_item_tag` VALUES ('178', '599');
INSERT INTO `weixin_item_tag` VALUES ('178', '605');
INSERT INTO `weixin_item_tag` VALUES ('178', '607');
INSERT INTO `weixin_item_tag` VALUES ('178', '650');
INSERT INTO `weixin_item_tag` VALUES ('178', '651');
INSERT INTO `weixin_item_tag` VALUES ('178', '652');
INSERT INTO `weixin_item_tag` VALUES ('180', '599');
INSERT INTO `weixin_item_tag` VALUES ('180', '653');
INSERT INTO `weixin_item_tag` VALUES ('180', '654');
INSERT INTO `weixin_item_tag` VALUES ('180', '655');
INSERT INTO `weixin_item_tag` VALUES ('180', '656');
INSERT INTO `weixin_item_tag` VALUES ('180', '657');
INSERT INTO `weixin_item_tag` VALUES ('180', '658');
INSERT INTO `weixin_item_tag` VALUES ('181', '599');
INSERT INTO `weixin_item_tag` VALUES ('181', '602');
INSERT INTO `weixin_item_tag` VALUES ('181', '608');
INSERT INTO `weixin_item_tag` VALUES ('181', '653');
INSERT INTO `weixin_item_tag` VALUES ('181', '655');
INSERT INTO `weixin_item_tag` VALUES ('181', '656');
INSERT INTO `weixin_item_tag` VALUES ('182', '604');
INSERT INTO `weixin_item_tag` VALUES ('182', '659');
INSERT INTO `weixin_item_tag` VALUES ('182', '660');
INSERT INTO `weixin_item_tag` VALUES ('182', '661');
INSERT INTO `weixin_item_tag` VALUES ('182', '662');
INSERT INTO `weixin_item_tag` VALUES ('184', '604');
INSERT INTO `weixin_item_tag` VALUES ('184', '659');
INSERT INTO `weixin_item_tag` VALUES ('184', '660');
INSERT INTO `weixin_item_tag` VALUES ('184', '662');
INSERT INTO `weixin_item_tag` VALUES ('184', '663');
INSERT INTO `weixin_item_tag` VALUES ('185', '604');
INSERT INTO `weixin_item_tag` VALUES ('185', '659');
INSERT INTO `weixin_item_tag` VALUES ('185', '660');
INSERT INTO `weixin_item_tag` VALUES ('185', '662');
INSERT INTO `weixin_item_tag` VALUES ('185', '666');
INSERT INTO `weixin_item_tag` VALUES ('185', '667');
INSERT INTO `weixin_item_tag` VALUES ('185', '668');
INSERT INTO `weixin_item_tag` VALUES ('187', '604');
INSERT INTO `weixin_item_tag` VALUES ('187', '659');
INSERT INTO `weixin_item_tag` VALUES ('187', '660');
INSERT INTO `weixin_item_tag` VALUES ('187', '662');
INSERT INTO `weixin_item_tag` VALUES ('187', '669');
INSERT INTO `weixin_item_tag` VALUES ('187', '670');
INSERT INTO `weixin_item_tag` VALUES ('188', '671');
INSERT INTO `weixin_item_tag` VALUES ('188', '672');
INSERT INTO `weixin_item_tag` VALUES ('188', '673');
INSERT INTO `weixin_item_tag` VALUES ('188', '674');
INSERT INTO `weixin_item_tag` VALUES ('188', '675');
INSERT INTO `weixin_item_tag` VALUES ('188', '676');
INSERT INTO `weixin_item_tag` VALUES ('188', '677');
INSERT INTO `weixin_item_tag` VALUES ('189', '671');
INSERT INTO `weixin_item_tag` VALUES ('189', '672');
INSERT INTO `weixin_item_tag` VALUES ('189', '673');
INSERT INTO `weixin_item_tag` VALUES ('189', '674');
INSERT INTO `weixin_item_tag` VALUES ('189', '676');
INSERT INTO `weixin_item_tag` VALUES ('189', '677');
INSERT INTO `weixin_item_tag` VALUES ('189', '678');
INSERT INTO `weixin_item_tag` VALUES ('191', '672');
INSERT INTO `weixin_item_tag` VALUES ('191', '679');
INSERT INTO `weixin_item_tag` VALUES ('191', '680');
INSERT INTO `weixin_item_tag` VALUES ('191', '681');
INSERT INTO `weixin_item_tag` VALUES ('191', '682');
INSERT INTO `weixin_item_tag` VALUES ('191', '683');
INSERT INTO `weixin_item_tag` VALUES ('191', '684');
INSERT INTO `weixin_item_tag` VALUES ('192', '672');
INSERT INTO `weixin_item_tag` VALUES ('192', '685');
INSERT INTO `weixin_item_tag` VALUES ('192', '686');
INSERT INTO `weixin_item_tag` VALUES ('192', '687');
INSERT INTO `weixin_item_tag` VALUES ('192', '688');
INSERT INTO `weixin_item_tag` VALUES ('193', '672');
INSERT INTO `weixin_item_tag` VALUES ('193', '679');
INSERT INTO `weixin_item_tag` VALUES ('193', '689');
INSERT INTO `weixin_item_tag` VALUES ('193', '690');
INSERT INTO `weixin_item_tag` VALUES ('193', '691');
INSERT INTO `weixin_item_tag` VALUES ('193', '692');
INSERT INTO `weixin_item_tag` VALUES ('194', '672');
INSERT INTO `weixin_item_tag` VALUES ('194', '687');
INSERT INTO `weixin_item_tag` VALUES ('194', '692');
INSERT INTO `weixin_item_tag` VALUES ('194', '693');
INSERT INTO `weixin_item_tag` VALUES ('194', '694');
INSERT INTO `weixin_item_tag` VALUES ('194', '695');
INSERT INTO `weixin_item_tag` VALUES ('195', '633');
INSERT INTO `weixin_item_tag` VALUES ('195', '672');
INSERT INTO `weixin_item_tag` VALUES ('195', '674');
INSERT INTO `weixin_item_tag` VALUES ('195', '687');
INSERT INTO `weixin_item_tag` VALUES ('195', '692');
INSERT INTO `weixin_item_tag` VALUES ('195', '696');
INSERT INTO `weixin_item_tag` VALUES ('195', '697');
INSERT INTO `weixin_item_tag` VALUES ('196', '642');
INSERT INTO `weixin_item_tag` VALUES ('196', '643');
INSERT INTO `weixin_item_tag` VALUES ('196', '644');
INSERT INTO `weixin_item_tag` VALUES ('196', '698');
INSERT INTO `weixin_item_tag` VALUES ('196', '699');
INSERT INTO `weixin_item_tag` VALUES ('196', '700');
INSERT INTO `weixin_item_tag` VALUES ('197', '640');
INSERT INTO `weixin_item_tag` VALUES ('197', '641');
INSERT INTO `weixin_item_tag` VALUES ('197', '642');
INSERT INTO `weixin_item_tag` VALUES ('197', '698');
INSERT INTO `weixin_item_tag` VALUES ('197', '700');
INSERT INTO `weixin_item_tag` VALUES ('198', '636');
INSERT INTO `weixin_item_tag` VALUES ('198', '642');
INSERT INTO `weixin_item_tag` VALUES ('198', '698');
INSERT INTO `weixin_item_tag` VALUES ('198', '700');
INSERT INTO `weixin_item_tag` VALUES ('198', '701');
INSERT INTO `weixin_item_tag` VALUES ('199', '622');
INSERT INTO `weixin_item_tag` VALUES ('199', '698');
INSERT INTO `weixin_item_tag` VALUES ('199', '702');
INSERT INTO `weixin_item_tag` VALUES ('199', '703');
INSERT INTO `weixin_item_tag` VALUES ('199', '704');
INSERT INTO `weixin_item_tag` VALUES ('199', '705');
INSERT INTO `weixin_item_tag` VALUES ('199', '706');
INSERT INTO `weixin_item_tag` VALUES ('200', '660');
INSERT INTO `weixin_item_tag` VALUES ('200', '662');
INSERT INTO `weixin_item_tag` VALUES ('200', '698');
INSERT INTO `weixin_item_tag` VALUES ('200', '700');
INSERT INTO `weixin_item_tag` VALUES ('201', '603');
INSERT INTO `weixin_item_tag` VALUES ('201', '660');
INSERT INTO `weixin_item_tag` VALUES ('201', '662');
INSERT INTO `weixin_item_tag` VALUES ('201', '666');
INSERT INTO `weixin_item_tag` VALUES ('201', '698');
INSERT INTO `weixin_item_tag` VALUES ('201', '707');
INSERT INTO `weixin_item_tag` VALUES ('202', '708');
INSERT INTO `weixin_item_tag` VALUES ('202', '709');
INSERT INTO `weixin_item_tag` VALUES ('202', '710');
INSERT INTO `weixin_item_tag` VALUES ('203', '643');
INSERT INTO `weixin_item_tag` VALUES ('203', '645');
INSERT INTO `weixin_item_tag` VALUES ('203', '711');
INSERT INTO `weixin_item_tag` VALUES ('203', '712');
INSERT INTO `weixin_item_tag` VALUES ('203', '713');
INSERT INTO `weixin_item_tag` VALUES ('203', '714');
INSERT INTO `weixin_item_tag` VALUES ('203', '715');
INSERT INTO `weixin_item_tag` VALUES ('204', '712');
INSERT INTO `weixin_item_tag` VALUES ('204', '716');
INSERT INTO `weixin_item_tag` VALUES ('204', '717');
INSERT INTO `weixin_item_tag` VALUES ('204', '718');
INSERT INTO `weixin_item_tag` VALUES ('204', '719');
INSERT INTO `weixin_item_tag` VALUES ('205', '570');
INSERT INTO `weixin_item_tag` VALUES ('205', '720');
INSERT INTO `weixin_item_tag` VALUES ('205', '721');
INSERT INTO `weixin_item_tag` VALUES ('205', '722');
INSERT INTO `weixin_item_tag` VALUES ('208', '723');
INSERT INTO `weixin_item_tag` VALUES ('208', '724');
INSERT INTO `weixin_item_tag` VALUES ('208', '725');
INSERT INTO `weixin_item_tag` VALUES ('208', '726');
INSERT INTO `weixin_item_tag` VALUES ('208', '727');
INSERT INTO `weixin_item_tag` VALUES ('209', '723');
INSERT INTO `weixin_item_tag` VALUES ('209', '724');
INSERT INTO `weixin_item_tag` VALUES ('209', '726');
INSERT INTO `weixin_item_tag` VALUES ('209', '727');
INSERT INTO `weixin_item_tag` VALUES ('209', '728');
INSERT INTO `weixin_item_tag` VALUES ('210', '723');
INSERT INTO `weixin_item_tag` VALUES ('210', '724');
INSERT INTO `weixin_item_tag` VALUES ('210', '726');
INSERT INTO `weixin_item_tag` VALUES ('210', '727');
INSERT INTO `weixin_item_tag` VALUES ('210', '729');
INSERT INTO `weixin_item_tag` VALUES ('210', '730');
INSERT INTO `weixin_item_tag` VALUES ('211', '588');
INSERT INTO `weixin_item_tag` VALUES ('211', '692');
INSERT INTO `weixin_item_tag` VALUES ('211', '731');
INSERT INTO `weixin_item_tag` VALUES ('211', '732');
INSERT INTO `weixin_item_tag` VALUES ('211', '733');
INSERT INTO `weixin_item_tag` VALUES ('211', '734');
INSERT INTO `weixin_item_tag` VALUES ('211', '735');
INSERT INTO `weixin_item_tag` VALUES ('212', '731');
INSERT INTO `weixin_item_tag` VALUES ('212', '732');
INSERT INTO `weixin_item_tag` VALUES ('212', '733');
INSERT INTO `weixin_item_tag` VALUES ('212', '734');
INSERT INTO `weixin_item_tag` VALUES ('212', '735');
INSERT INTO `weixin_item_tag` VALUES ('212', '736');
INSERT INTO `weixin_item_tag` VALUES ('212', '737');
INSERT INTO `weixin_item_tag` VALUES ('213', '582');
INSERT INTO `weixin_item_tag` VALUES ('213', '588');
INSERT INTO `weixin_item_tag` VALUES ('213', '723');
INSERT INTO `weixin_item_tag` VALUES ('213', '734');
INSERT INTO `weixin_item_tag` VALUES ('213', '738');
INSERT INTO `weixin_item_tag` VALUES ('213', '739');
INSERT INTO `weixin_item_tag` VALUES ('213', '740');
INSERT INTO `weixin_item_tag` VALUES ('215', '582');
INSERT INTO `weixin_item_tag` VALUES ('215', '723');
INSERT INTO `weixin_item_tag` VALUES ('215', '734');
INSERT INTO `weixin_item_tag` VALUES ('215', '738');
INSERT INTO `weixin_item_tag` VALUES ('215', '739');
INSERT INTO `weixin_item_tag` VALUES ('215', '740');
INSERT INTO `weixin_item_tag` VALUES ('216', '582');
INSERT INTO `weixin_item_tag` VALUES ('216', '723');
INSERT INTO `weixin_item_tag` VALUES ('216', '734');
INSERT INTO `weixin_item_tag` VALUES ('216', '738');
INSERT INTO `weixin_item_tag` VALUES ('216', '739');
INSERT INTO `weixin_item_tag` VALUES ('216', '740');
INSERT INTO `weixin_item_tag` VALUES ('216', '741');
INSERT INTO `weixin_item_tag` VALUES ('218', '606');
INSERT INTO `weixin_item_tag` VALUES ('218', '607');
INSERT INTO `weixin_item_tag` VALUES ('218', '617');
INSERT INTO `weixin_item_tag` VALUES ('218', '618');
INSERT INTO `weixin_item_tag` VALUES ('218', '742');
INSERT INTO `weixin_item_tag` VALUES ('219', '606');
INSERT INTO `weixin_item_tag` VALUES ('219', '607');
INSERT INTO `weixin_item_tag` VALUES ('219', '617');
INSERT INTO `weixin_item_tag` VALUES ('219', '619');
INSERT INTO `weixin_item_tag` VALUES ('219', '743');
INSERT INTO `weixin_item_tag` VALUES ('219', '744');
INSERT INTO `weixin_item_tag` VALUES ('221', '606');
INSERT INTO `weixin_item_tag` VALUES ('221', '617');
INSERT INTO `weixin_item_tag` VALUES ('221', '618');
INSERT INTO `weixin_item_tag` VALUES ('221', '619');
INSERT INTO `weixin_item_tag` VALUES ('221', '744');
INSERT INTO `weixin_item_tag` VALUES ('222', '596');
INSERT INTO `weixin_item_tag` VALUES ('222', '604');
INSERT INTO `weixin_item_tag` VALUES ('222', '660');
INSERT INTO `weixin_item_tag` VALUES ('222', '745');
INSERT INTO `weixin_item_tag` VALUES ('222', '746');
INSERT INTO `weixin_item_tag` VALUES ('223', '604');
INSERT INTO `weixin_item_tag` VALUES ('223', '607');
INSERT INTO `weixin_item_tag` VALUES ('223', '614');
INSERT INTO `weixin_item_tag` VALUES ('223', '660');
INSERT INTO `weixin_item_tag` VALUES ('223', '747');
INSERT INTO `weixin_item_tag` VALUES ('223', '748');
INSERT INTO `weixin_item_tag` VALUES ('224', '749');
INSERT INTO `weixin_item_tag` VALUES ('224', '750');
INSERT INTO `weixin_item_tag` VALUES ('224', '751');
INSERT INTO `weixin_item_tag` VALUES ('225', '602');
INSERT INTO `weixin_item_tag` VALUES ('225', '620');
INSERT INTO `weixin_item_tag` VALUES ('225', '621');
INSERT INTO `weixin_item_tag` VALUES ('225', '622');
INSERT INTO `weixin_item_tag` VALUES ('225', '623');
INSERT INTO `weixin_item_tag` VALUES ('225', '636');
INSERT INTO `weixin_item_tag` VALUES ('226', '620');
INSERT INTO `weixin_item_tag` VALUES ('226', '621');
INSERT INTO `weixin_item_tag` VALUES ('226', '623');
INSERT INTO `weixin_item_tag` VALUES ('226', '752');
INSERT INTO `weixin_item_tag` VALUES ('228', '638');
INSERT INTO `weixin_item_tag` VALUES ('228', '678');
INSERT INTO `weixin_item_tag` VALUES ('228', '734');
INSERT INTO `weixin_item_tag` VALUES ('228', '754');
INSERT INTO `weixin_item_tag` VALUES ('228', '755');
INSERT INTO `weixin_item_tag` VALUES ('228', '756');
INSERT INTO `weixin_item_tag` VALUES ('228', '757');
INSERT INTO `weixin_item_tag` VALUES ('228', '758');
INSERT INTO `weixin_item_tag` VALUES ('228', '759');
INSERT INTO `weixin_item_tag` VALUES ('228', '760');
INSERT INTO `weixin_item_tag` VALUES ('230', '638');
INSERT INTO `weixin_item_tag` VALUES ('230', '734');
INSERT INTO `weixin_item_tag` VALUES ('230', '754');
INSERT INTO `weixin_item_tag` VALUES ('230', '755');
INSERT INTO `weixin_item_tag` VALUES ('230', '756');
INSERT INTO `weixin_item_tag` VALUES ('230', '757');
INSERT INTO `weixin_item_tag` VALUES ('230', '758');
INSERT INTO `weixin_item_tag` VALUES ('230', '759');
INSERT INTO `weixin_item_tag` VALUES ('230', '760');
INSERT INTO `weixin_item_tag` VALUES ('230', '761');
INSERT INTO `weixin_item_tag` VALUES ('231', '734');
INSERT INTO `weixin_item_tag` VALUES ('231', '754');
INSERT INTO `weixin_item_tag` VALUES ('231', '755');
INSERT INTO `weixin_item_tag` VALUES ('231', '756');
INSERT INTO `weixin_item_tag` VALUES ('231', '757');
INSERT INTO `weixin_item_tag` VALUES ('231', '758');
INSERT INTO `weixin_item_tag` VALUES ('231', '759');
INSERT INTO `weixin_item_tag` VALUES ('231', '760');
INSERT INTO `weixin_item_tag` VALUES ('231', '769');
INSERT INTO `weixin_item_tag` VALUES ('231', '770');
INSERT INTO `weixin_item_tag` VALUES ('233', '588');
INSERT INTO `weixin_item_tag` VALUES ('233', '771');
INSERT INTO `weixin_item_tag` VALUES ('233', '772');
INSERT INTO `weixin_item_tag` VALUES ('233', '773');
INSERT INTO `weixin_item_tag` VALUES ('235', '771');
INSERT INTO `weixin_item_tag` VALUES ('235', '772');
INSERT INTO `weixin_item_tag` VALUES ('235', '773');
INSERT INTO `weixin_item_tag` VALUES ('235', '774');
INSERT INTO `weixin_item_tag` VALUES ('237', '632');
INSERT INTO `weixin_item_tag` VALUES ('237', '740');
INSERT INTO `weixin_item_tag` VALUES ('237', '775');
INSERT INTO `weixin_item_tag` VALUES ('238', '740');
INSERT INTO `weixin_item_tag` VALUES ('238', '775');
INSERT INTO `weixin_item_tag` VALUES ('240', '740');
INSERT INTO `weixin_item_tag` VALUES ('240', '775');
INSERT INTO `weixin_item_tag` VALUES ('241', '740');
INSERT INTO `weixin_item_tag` VALUES ('241', '775');
INSERT INTO `weixin_item_tag` VALUES ('241', '776');
INSERT INTO `weixin_item_tag` VALUES ('242', '721');
INSERT INTO `weixin_item_tag` VALUES ('242', '777');
INSERT INTO `weixin_item_tag` VALUES ('242', '778');
INSERT INTO `weixin_item_tag` VALUES ('242', '779');
INSERT INTO `weixin_item_tag` VALUES ('242', '780');
INSERT INTO `weixin_item_tag` VALUES ('243', '776');
INSERT INTO `weixin_item_tag` VALUES ('243', '778');
INSERT INTO `weixin_item_tag` VALUES ('243', '779');
INSERT INTO `weixin_item_tag` VALUES ('243', '781');
INSERT INTO `weixin_item_tag` VALUES ('244', '710');
INSERT INTO `weixin_item_tag` VALUES ('244', '778');
INSERT INTO `weixin_item_tag` VALUES ('244', '779');
INSERT INTO `weixin_item_tag` VALUES ('245', '721');
INSERT INTO `weixin_item_tag` VALUES ('245', '778');
INSERT INTO `weixin_item_tag` VALUES ('245', '779');
INSERT INTO `weixin_item_tag` VALUES ('245', '782');
INSERT INTO `weixin_item_tag` VALUES ('245', '783');
INSERT INTO `weixin_item_tag` VALUES ('246', '778');
INSERT INTO `weixin_item_tag` VALUES ('246', '779');
INSERT INTO `weixin_item_tag` VALUES ('246', '784');
INSERT INTO `weixin_item_tag` VALUES ('246', '785');
INSERT INTO `weixin_item_tag` VALUES ('247', '727');
INSERT INTO `weixin_item_tag` VALUES ('247', '778');
INSERT INTO `weixin_item_tag` VALUES ('247', '779');
INSERT INTO `weixin_item_tag` VALUES ('247', '786');
INSERT INTO `weixin_item_tag` VALUES ('247', '787');
INSERT INTO `weixin_item_tag` VALUES ('248', '778');
INSERT INTO `weixin_item_tag` VALUES ('248', '779');
INSERT INTO `weixin_item_tag` VALUES ('248', '788');
INSERT INTO `weixin_item_tag` VALUES ('248', '789');
INSERT INTO `weixin_item_tag` VALUES ('249', '723');
INSERT INTO `weixin_item_tag` VALUES ('249', '734');
INSERT INTO `weixin_item_tag` VALUES ('249', '790');
INSERT INTO `weixin_item_tag` VALUES ('249', '791');
INSERT INTO `weixin_item_tag` VALUES ('249', '792');
INSERT INTO `weixin_item_tag` VALUES ('249', '793');
INSERT INTO `weixin_item_tag` VALUES ('249', '794');
INSERT INTO `weixin_item_tag` VALUES ('250', '723');
INSERT INTO `weixin_item_tag` VALUES ('250', '734');
INSERT INTO `weixin_item_tag` VALUES ('250', '790');
INSERT INTO `weixin_item_tag` VALUES ('250', '792');
INSERT INTO `weixin_item_tag` VALUES ('250', '793');
INSERT INTO `weixin_item_tag` VALUES ('250', '794');
INSERT INTO `weixin_item_tag` VALUES ('250', '795');
INSERT INTO `weixin_item_tag` VALUES ('251', '723');
INSERT INTO `weixin_item_tag` VALUES ('251', '734');
INSERT INTO `weixin_item_tag` VALUES ('251', '757');
INSERT INTO `weixin_item_tag` VALUES ('251', '790');
INSERT INTO `weixin_item_tag` VALUES ('251', '792');
INSERT INTO `weixin_item_tag` VALUES ('251', '793');
INSERT INTO `weixin_item_tag` VALUES ('251', '794');
INSERT INTO `weixin_item_tag` VALUES ('252', '721');
INSERT INTO `weixin_item_tag` VALUES ('252', '734');
INSERT INTO `weixin_item_tag` VALUES ('252', '740');
INSERT INTO `weixin_item_tag` VALUES ('252', '796');
INSERT INTO `weixin_item_tag` VALUES ('252', '797');
INSERT INTO `weixin_item_tag` VALUES ('252', '798');
INSERT INTO `weixin_item_tag` VALUES ('252', '799');
INSERT INTO `weixin_item_tag` VALUES ('253', '721');
INSERT INTO `weixin_item_tag` VALUES ('253', '734');
INSERT INTO `weixin_item_tag` VALUES ('253', '740');
INSERT INTO `weixin_item_tag` VALUES ('253', '796');
INSERT INTO `weixin_item_tag` VALUES ('253', '797');
INSERT INTO `weixin_item_tag` VALUES ('253', '799');
INSERT INTO `weixin_item_tag` VALUES ('253', '800');
INSERT INTO `weixin_item_tag` VALUES ('254', '723');
INSERT INTO `weixin_item_tag` VALUES ('254', '734');
INSERT INTO `weixin_item_tag` VALUES ('254', '766');
INSERT INTO `weixin_item_tag` VALUES ('254', '801');
INSERT INTO `weixin_item_tag` VALUES ('254', '802');
INSERT INTO `weixin_item_tag` VALUES ('254', '803');
INSERT INTO `weixin_item_tag` VALUES ('254', '804');
INSERT INTO `weixin_item_tag` VALUES ('257', '638');
INSERT INTO `weixin_item_tag` VALUES ('257', '723');
INSERT INTO `weixin_item_tag` VALUES ('257', '734');
INSERT INTO `weixin_item_tag` VALUES ('257', '766');
INSERT INTO `weixin_item_tag` VALUES ('257', '801');
INSERT INTO `weixin_item_tag` VALUES ('257', '802');
INSERT INTO `weixin_item_tag` VALUES ('257', '808');
INSERT INTO `weixin_item_tag` VALUES ('258', '723');
INSERT INTO `weixin_item_tag` VALUES ('258', '734');
INSERT INTO `weixin_item_tag` VALUES ('258', '766');
INSERT INTO `weixin_item_tag` VALUES ('258', '801');
INSERT INTO `weixin_item_tag` VALUES ('258', '802');
INSERT INTO `weixin_item_tag` VALUES ('258', '804');
INSERT INTO `weixin_item_tag` VALUES ('258', '809');
INSERT INTO `weixin_item_tag` VALUES ('258', '810');
INSERT INTO `weixin_item_tag` VALUES ('259', '723');
INSERT INTO `weixin_item_tag` VALUES ('259', '734');
INSERT INTO `weixin_item_tag` VALUES ('259', '766');
INSERT INTO `weixin_item_tag` VALUES ('259', '801');
INSERT INTO `weixin_item_tag` VALUES ('259', '802');
INSERT INTO `weixin_item_tag` VALUES ('259', '804');
INSERT INTO `weixin_item_tag` VALUES ('259', '809');
INSERT INTO `weixin_item_tag` VALUES ('259', '811');
INSERT INTO `weixin_item_tag` VALUES ('260', '740');
INSERT INTO `weixin_item_tag` VALUES ('260', '812');
INSERT INTO `weixin_item_tag` VALUES ('260', '813');
INSERT INTO `weixin_item_tag` VALUES ('260', '814');
INSERT INTO `weixin_item_tag` VALUES ('261', '710');
INSERT INTO `weixin_item_tag` VALUES ('261', '734');
INSERT INTO `weixin_item_tag` VALUES ('261', '815');
INSERT INTO `weixin_item_tag` VALUES ('261', '816');
INSERT INTO `weixin_item_tag` VALUES ('261', '817');
INSERT INTO `weixin_item_tag` VALUES ('261', '818');
INSERT INTO `weixin_item_tag` VALUES ('261', '819');
INSERT INTO `weixin_item_tag` VALUES ('262', '710');
INSERT INTO `weixin_item_tag` VALUES ('262', '730');
INSERT INTO `weixin_item_tag` VALUES ('262', '734');
INSERT INTO `weixin_item_tag` VALUES ('262', '815');
INSERT INTO `weixin_item_tag` VALUES ('262', '817');
INSERT INTO `weixin_item_tag` VALUES ('262', '820');
INSERT INTO `weixin_item_tag` VALUES ('262', '821');
INSERT INTO `weixin_item_tag` VALUES ('263', '710');
INSERT INTO `weixin_item_tag` VALUES ('263', '734');
INSERT INTO `weixin_item_tag` VALUES ('263', '815');
INSERT INTO `weixin_item_tag` VALUES ('263', '817');
INSERT INTO `weixin_item_tag` VALUES ('263', '821');
INSERT INTO `weixin_item_tag` VALUES ('263', '822');
INSERT INTO `weixin_item_tag` VALUES ('263', '823');
INSERT INTO `weixin_item_tag` VALUES ('264', '581');
INSERT INTO `weixin_item_tag` VALUES ('264', '725');
INSERT INTO `weixin_item_tag` VALUES ('264', '740');
INSERT INTO `weixin_item_tag` VALUES ('264', '792');
INSERT INTO `weixin_item_tag` VALUES ('264', '817');
INSERT INTO `weixin_item_tag` VALUES ('264', '824');
INSERT INTO `weixin_item_tag` VALUES ('264', '825');
INSERT INTO `weixin_item_tag` VALUES ('264', '826');
INSERT INTO `weixin_item_tag` VALUES ('264', '827');
INSERT INTO `weixin_item_tag` VALUES ('264', '828');
INSERT INTO `weixin_item_tag` VALUES ('265', '721');
INSERT INTO `weixin_item_tag` VALUES ('265', '734');
INSERT INTO `weixin_item_tag` VALUES ('265', '754');
INSERT INTO `weixin_item_tag` VALUES ('265', '829');
INSERT INTO `weixin_item_tag` VALUES ('265', '830');
INSERT INTO `weixin_item_tag` VALUES ('266', '721');
INSERT INTO `weixin_item_tag` VALUES ('266', '734');
INSERT INTO `weixin_item_tag` VALUES ('266', '754');
INSERT INTO `weixin_item_tag` VALUES ('266', '830');
INSERT INTO `weixin_item_tag` VALUES ('266', '831');
INSERT INTO `weixin_item_tag` VALUES ('266', '832');
INSERT INTO `weixin_item_tag` VALUES ('267', '721');
INSERT INTO `weixin_item_tag` VALUES ('267', '723');
INSERT INTO `weixin_item_tag` VALUES ('267', '725');
INSERT INTO `weixin_item_tag` VALUES ('267', '734');
INSERT INTO `weixin_item_tag` VALUES ('267', '830');
INSERT INTO `weixin_item_tag` VALUES ('267', '831');
INSERT INTO `weixin_item_tag` VALUES ('267', '833');
INSERT INTO `weixin_item_tag` VALUES ('268', '547');
INSERT INTO `weixin_item_tag` VALUES ('268', '734');
INSERT INTO `weixin_item_tag` VALUES ('268', '834');
INSERT INTO `weixin_item_tag` VALUES ('268', '835');
INSERT INTO `weixin_item_tag` VALUES ('268', '836');
INSERT INTO `weixin_item_tag` VALUES ('268', '837');
INSERT INTO `weixin_item_tag` VALUES ('268', '838');
INSERT INTO `weixin_item_tag` VALUES ('269', '547');
INSERT INTO `weixin_item_tag` VALUES ('269', '734');
INSERT INTO `weixin_item_tag` VALUES ('269', '834');
INSERT INTO `weixin_item_tag` VALUES ('269', '835');
INSERT INTO `weixin_item_tag` VALUES ('269', '836');
INSERT INTO `weixin_item_tag` VALUES ('269', '837');
INSERT INTO `weixin_item_tag` VALUES ('269', '839');
INSERT INTO `weixin_item_tag` VALUES ('270', '757');
INSERT INTO `weixin_item_tag` VALUES ('270', '840');
INSERT INTO `weixin_item_tag` VALUES ('270', '841');
INSERT INTO `weixin_item_tag` VALUES ('270', '842');
INSERT INTO `weixin_item_tag` VALUES ('270', '1104');
INSERT INTO `weixin_item_tag` VALUES ('270', '1105');
INSERT INTO `weixin_item_tag` VALUES ('270', '1106');
INSERT INTO `weixin_item_tag` VALUES ('270', '1107');
INSERT INTO `weixin_item_tag` VALUES ('270', '1108');
INSERT INTO `weixin_item_tag` VALUES ('271', '734');
INSERT INTO `weixin_item_tag` VALUES ('271', '754');
INSERT INTO `weixin_item_tag` VALUES ('271', '771');
INSERT INTO `weixin_item_tag` VALUES ('271', '843');
INSERT INTO `weixin_item_tag` VALUES ('271', '844');
INSERT INTO `weixin_item_tag` VALUES ('271', '845');
INSERT INTO `weixin_item_tag` VALUES ('275', '734');
INSERT INTO `weixin_item_tag` VALUES ('275', '797');
INSERT INTO `weixin_item_tag` VALUES ('275', '849');
INSERT INTO `weixin_item_tag` VALUES ('275', '850');
INSERT INTO `weixin_item_tag` VALUES ('275', '851');
INSERT INTO `weixin_item_tag` VALUES ('275', '852');
INSERT INTO `weixin_item_tag` VALUES ('275', '853');
INSERT INTO `weixin_item_tag` VALUES ('278', '734');
INSERT INTO `weixin_item_tag` VALUES ('278', '764');
INSERT INTO `weixin_item_tag` VALUES ('278', '792');
INSERT INTO `weixin_item_tag` VALUES ('278', '854');
INSERT INTO `weixin_item_tag` VALUES ('278', '855');
INSERT INTO `weixin_item_tag` VALUES ('278', '856');
INSERT INTO `weixin_item_tag` VALUES ('278', '857');
INSERT INTO `weixin_item_tag` VALUES ('279', '734');
INSERT INTO `weixin_item_tag` VALUES ('279', '797');
INSERT INTO `weixin_item_tag` VALUES ('279', '849');
INSERT INTO `weixin_item_tag` VALUES ('279', '851');
INSERT INTO `weixin_item_tag` VALUES ('279', '852');
INSERT INTO `weixin_item_tag` VALUES ('279', '853');
INSERT INTO `weixin_item_tag` VALUES ('279', '858');
INSERT INTO `weixin_item_tag` VALUES ('279', '859');
INSERT INTO `weixin_item_tag` VALUES ('281', '734');
INSERT INTO `weixin_item_tag` VALUES ('281', '797');
INSERT INTO `weixin_item_tag` VALUES ('281', '849');
INSERT INTO `weixin_item_tag` VALUES ('281', '851');
INSERT INTO `weixin_item_tag` VALUES ('281', '852');
INSERT INTO `weixin_item_tag` VALUES ('281', '853');
INSERT INTO `weixin_item_tag` VALUES ('281', '859');
INSERT INTO `weixin_item_tag` VALUES ('282', '710');
INSERT INTO `weixin_item_tag` VALUES ('282', '733');
INSERT INTO `weixin_item_tag` VALUES ('282', '734');
INSERT INTO `weixin_item_tag` VALUES ('282', '792');
INSERT INTO `weixin_item_tag` VALUES ('282', '818');
INSERT INTO `weixin_item_tag` VALUES ('282', '863');
INSERT INTO `weixin_item_tag` VALUES ('282', '864');
INSERT INTO `weixin_item_tag` VALUES ('282', '865');
INSERT INTO `weixin_item_tag` VALUES ('283', '547');
INSERT INTO `weixin_item_tag` VALUES ('283', '710');
INSERT INTO `weixin_item_tag` VALUES ('283', '734');
INSERT INTO `weixin_item_tag` VALUES ('283', '866');
INSERT INTO `weixin_item_tag` VALUES ('283', '867');
INSERT INTO `weixin_item_tag` VALUES ('284', '547');
INSERT INTO `weixin_item_tag` VALUES ('284', '734');
INSERT INTO `weixin_item_tag` VALUES ('284', '866');
INSERT INTO `weixin_item_tag` VALUES ('284', '868');
INSERT INTO `weixin_item_tag` VALUES ('284', '869');
INSERT INTO `weixin_item_tag` VALUES ('284', '870');
INSERT INTO `weixin_item_tag` VALUES ('285', '547');
INSERT INTO `weixin_item_tag` VALUES ('285', '588');
INSERT INTO `weixin_item_tag` VALUES ('285', '734');
INSERT INTO `weixin_item_tag` VALUES ('285', '866');
INSERT INTO `weixin_item_tag` VALUES ('285', '869');
INSERT INTO `weixin_item_tag` VALUES ('285', '870');
INSERT INTO `weixin_item_tag` VALUES ('285', '871');
INSERT INTO `weixin_item_tag` VALUES ('286', '547');
INSERT INTO `weixin_item_tag` VALUES ('286', '734');
INSERT INTO `weixin_item_tag` VALUES ('286', '866');
INSERT INTO `weixin_item_tag` VALUES ('286', '869');
INSERT INTO `weixin_item_tag` VALUES ('286', '870');
INSERT INTO `weixin_item_tag` VALUES ('288', '547');
INSERT INTO `weixin_item_tag` VALUES ('288', '710');
INSERT INTO `weixin_item_tag` VALUES ('288', '734');
INSERT INTO `weixin_item_tag` VALUES ('288', '851');
INSERT INTO `weixin_item_tag` VALUES ('288', '872');
INSERT INTO `weixin_item_tag` VALUES ('288', '873');
INSERT INTO `weixin_item_tag` VALUES ('289', '547');
INSERT INTO `weixin_item_tag` VALUES ('289', '710');
INSERT INTO `weixin_item_tag` VALUES ('289', '734');
INSERT INTO `weixin_item_tag` VALUES ('289', '851');
INSERT INTO `weixin_item_tag` VALUES ('289', '867');
INSERT INTO `weixin_item_tag` VALUES ('289', '872');
INSERT INTO `weixin_item_tag` VALUES ('289', '873');
INSERT INTO `weixin_item_tag` VALUES ('290', '710');
INSERT INTO `weixin_item_tag` VALUES ('290', '734');
INSERT INTO `weixin_item_tag` VALUES ('290', '873');
INSERT INTO `weixin_item_tag` VALUES ('290', '874');
INSERT INTO `weixin_item_tag` VALUES ('290', '875');
INSERT INTO `weixin_item_tag` VALUES ('290', '876');
INSERT INTO `weixin_item_tag` VALUES ('290', '877');
INSERT INTO `weixin_item_tag` VALUES ('291', '721');
INSERT INTO `weixin_item_tag` VALUES ('291', '734');
INSERT INTO `weixin_item_tag` VALUES ('291', '740');
INSERT INTO `weixin_item_tag` VALUES ('291', '878');
INSERT INTO `weixin_item_tag` VALUES ('291', '879');
INSERT INTO `weixin_item_tag` VALUES ('293', '740');
INSERT INTO `weixin_item_tag` VALUES ('293', '880');
INSERT INTO `weixin_item_tag` VALUES ('293', '881');
INSERT INTO `weixin_item_tag` VALUES ('293', '882');
INSERT INTO `weixin_item_tag` VALUES ('294', '740');
INSERT INTO `weixin_item_tag` VALUES ('294', '881');
INSERT INTO `weixin_item_tag` VALUES ('294', '882');
INSERT INTO `weixin_item_tag` VALUES ('294', '883');
INSERT INTO `weixin_item_tag` VALUES ('295', '740');
INSERT INTO `weixin_item_tag` VALUES ('295', '881');
INSERT INTO `weixin_item_tag` VALUES ('295', '882');
INSERT INTO `weixin_item_tag` VALUES ('295', '884');
INSERT INTO `weixin_item_tag` VALUES ('296', '740');
INSERT INTO `weixin_item_tag` VALUES ('296', '763');
INSERT INTO `weixin_item_tag` VALUES ('296', '881');
INSERT INTO `weixin_item_tag` VALUES ('296', '882');
INSERT INTO `weixin_item_tag` VALUES ('297', '725');
INSERT INTO `weixin_item_tag` VALUES ('297', '754');
INSERT INTO `weixin_item_tag` VALUES ('297', '885');
INSERT INTO `weixin_item_tag` VALUES ('297', '886');
INSERT INTO `weixin_item_tag` VALUES ('297', '887');
INSERT INTO `weixin_item_tag` VALUES ('297', '888');
INSERT INTO `weixin_item_tag` VALUES ('297', '889');
INSERT INTO `weixin_item_tag` VALUES ('298', '725');
INSERT INTO `weixin_item_tag` VALUES ('298', '754');
INSERT INTO `weixin_item_tag` VALUES ('298', '825');
INSERT INTO `weixin_item_tag` VALUES ('298', '885');
INSERT INTO `weixin_item_tag` VALUES ('298', '886');
INSERT INTO `weixin_item_tag` VALUES ('298', '888');
INSERT INTO `weixin_item_tag` VALUES ('298', '889');
INSERT INTO `weixin_item_tag` VALUES ('299', '725');
INSERT INTO `weixin_item_tag` VALUES ('299', '754');
INSERT INTO `weixin_item_tag` VALUES ('299', '885');
INSERT INTO `weixin_item_tag` VALUES ('299', '886');
INSERT INTO `weixin_item_tag` VALUES ('299', '888');
INSERT INTO `weixin_item_tag` VALUES ('299', '889');
INSERT INTO `weixin_item_tag` VALUES ('299', '890');
INSERT INTO `weixin_item_tag` VALUES ('300', '725');
INSERT INTO `weixin_item_tag` VALUES ('300', '886');
INSERT INTO `weixin_item_tag` VALUES ('300', '889');
INSERT INTO `weixin_item_tag` VALUES ('300', '890');
INSERT INTO `weixin_item_tag` VALUES ('300', '891');
INSERT INTO `weixin_item_tag` VALUES ('301', '725');
INSERT INTO `weixin_item_tag` VALUES ('301', '886');
INSERT INTO `weixin_item_tag` VALUES ('301', '889');
INSERT INTO `weixin_item_tag` VALUES ('301', '891');
INSERT INTO `weixin_item_tag` VALUES ('301', '892');
INSERT INTO `weixin_item_tag` VALUES ('302', '678');
INSERT INTO `weixin_item_tag` VALUES ('302', '725');
INSERT INTO `weixin_item_tag` VALUES ('302', '886');
INSERT INTO `weixin_item_tag` VALUES ('302', '889');
INSERT INTO `weixin_item_tag` VALUES ('302', '891');
INSERT INTO `weixin_item_tag` VALUES ('303', '725');
INSERT INTO `weixin_item_tag` VALUES ('303', '825');
INSERT INTO `weixin_item_tag` VALUES ('303', '886');
INSERT INTO `weixin_item_tag` VALUES ('303', '889');
INSERT INTO `weixin_item_tag` VALUES ('303', '891');
INSERT INTO `weixin_item_tag` VALUES ('304', '734');
INSERT INTO `weixin_item_tag` VALUES ('304', '893');
INSERT INTO `weixin_item_tag` VALUES ('304', '894');
INSERT INTO `weixin_item_tag` VALUES ('304', '895');
INSERT INTO `weixin_item_tag` VALUES ('304', '896');
INSERT INTO `weixin_item_tag` VALUES ('305', '734');
INSERT INTO `weixin_item_tag` VALUES ('305', '893');
INSERT INTO `weixin_item_tag` VALUES ('305', '894');
INSERT INTO `weixin_item_tag` VALUES ('305', '895');
INSERT INTO `weixin_item_tag` VALUES ('305', '897');
INSERT INTO `weixin_item_tag` VALUES ('306', '710');
INSERT INTO `weixin_item_tag` VALUES ('306', '734');
INSERT INTO `weixin_item_tag` VALUES ('306', '892');
INSERT INTO `weixin_item_tag` VALUES ('306', '898');
INSERT INTO `weixin_item_tag` VALUES ('306', '899');
INSERT INTO `weixin_item_tag` VALUES ('307', '900');
INSERT INTO `weixin_item_tag` VALUES ('307', '901');
INSERT INTO `weixin_item_tag` VALUES ('307', '902');
INSERT INTO `weixin_item_tag` VALUES ('307', '903');
INSERT INTO `weixin_item_tag` VALUES ('307', '904');
INSERT INTO `weixin_item_tag` VALUES ('308', '734');
INSERT INTO `weixin_item_tag` VALUES ('308', '817');
INSERT INTO `weixin_item_tag` VALUES ('308', '902');
INSERT INTO `weixin_item_tag` VALUES ('308', '905');
INSERT INTO `weixin_item_tag` VALUES ('309', '981');
INSERT INTO `weixin_item_tag` VALUES ('309', '1086');
INSERT INTO `weixin_item_tag` VALUES ('309', '1170');
INSERT INTO `weixin_item_tag` VALUES ('309', '1171');
INSERT INTO `weixin_item_tag` VALUES ('309', '1172');
INSERT INTO `weixin_item_tag` VALUES ('309', '1173');
INSERT INTO `weixin_item_tag` VALUES ('309', '1174');
INSERT INTO `weixin_item_tag` VALUES ('309', '1175');
INSERT INTO `weixin_item_tag` VALUES ('310', '602');
INSERT INTO `weixin_item_tag` VALUES ('310', '734');
INSERT INTO `weixin_item_tag` VALUES ('310', '865');
INSERT INTO `weixin_item_tag` VALUES ('310', '894');
INSERT INTO `weixin_item_tag` VALUES ('310', '909');
INSERT INTO `weixin_item_tag` VALUES ('310', '910');
INSERT INTO `weixin_item_tag` VALUES ('311', '797');
INSERT INTO `weixin_item_tag` VALUES ('311', '910');
INSERT INTO `weixin_item_tag` VALUES ('311', '911');
INSERT INTO `weixin_item_tag` VALUES ('311', '912');
INSERT INTO `weixin_item_tag` VALUES ('312', '910');
INSERT INTO `weixin_item_tag` VALUES ('312', '912');
INSERT INTO `weixin_item_tag` VALUES ('312', '913');
INSERT INTO `weixin_item_tag` VALUES ('313', '678');
INSERT INTO `weixin_item_tag` VALUES ('313', '797');
INSERT INTO `weixin_item_tag` VALUES ('313', '910');
INSERT INTO `weixin_item_tag` VALUES ('313', '911');
INSERT INTO `weixin_item_tag` VALUES ('313', '912');
INSERT INTO `weixin_item_tag` VALUES ('314', '797');
INSERT INTO `weixin_item_tag` VALUES ('314', '910');
INSERT INTO `weixin_item_tag` VALUES ('314', '911');
INSERT INTO `weixin_item_tag` VALUES ('314', '912');
INSERT INTO `weixin_item_tag` VALUES ('315', '797');
INSERT INTO `weixin_item_tag` VALUES ('315', '914');
INSERT INTO `weixin_item_tag` VALUES ('315', '915');
INSERT INTO `weixin_item_tag` VALUES ('315', '916');
INSERT INTO `weixin_item_tag` VALUES ('315', '917');
INSERT INTO `weixin_item_tag` VALUES ('316', '797');
INSERT INTO `weixin_item_tag` VALUES ('316', '914');
INSERT INTO `weixin_item_tag` VALUES ('316', '915');
INSERT INTO `weixin_item_tag` VALUES ('316', '917');
INSERT INTO `weixin_item_tag` VALUES ('316', '918');
INSERT INTO `weixin_item_tag` VALUES ('317', '797');
INSERT INTO `weixin_item_tag` VALUES ('317', '892');
INSERT INTO `weixin_item_tag` VALUES ('317', '914');
INSERT INTO `weixin_item_tag` VALUES ('317', '915');
INSERT INTO `weixin_item_tag` VALUES ('317', '917');
INSERT INTO `weixin_item_tag` VALUES ('318', '797');
INSERT INTO `weixin_item_tag` VALUES ('318', '914');
INSERT INTO `weixin_item_tag` VALUES ('318', '915');
INSERT INTO `weixin_item_tag` VALUES ('318', '917');
INSERT INTO `weixin_item_tag` VALUES ('318', '919');
INSERT INTO `weixin_item_tag` VALUES ('318', '920');
INSERT INTO `weixin_item_tag` VALUES ('319', '766');
INSERT INTO `weixin_item_tag` VALUES ('319', '918');
INSERT INTO `weixin_item_tag` VALUES ('319', '921');
INSERT INTO `weixin_item_tag` VALUES ('319', '922');
INSERT INTO `weixin_item_tag` VALUES ('319', '923');
INSERT INTO `weixin_item_tag` VALUES ('320', '766');
INSERT INTO `weixin_item_tag` VALUES ('320', '918');
INSERT INTO `weixin_item_tag` VALUES ('320', '921');
INSERT INTO `weixin_item_tag` VALUES ('320', '922');
INSERT INTO `weixin_item_tag` VALUES ('320', '923');
INSERT INTO `weixin_item_tag` VALUES ('320', '924');
INSERT INTO `weixin_item_tag` VALUES ('320', '925');
INSERT INTO `weixin_item_tag` VALUES ('321', '602');
INSERT INTO `weixin_item_tag` VALUES ('321', '926');
INSERT INTO `weixin_item_tag` VALUES ('321', '927');
INSERT INTO `weixin_item_tag` VALUES ('322', '602');
INSERT INTO `weixin_item_tag` VALUES ('322', '927');
INSERT INTO `weixin_item_tag` VALUES ('323', '927');
INSERT INTO `weixin_item_tag` VALUES ('323', '928');
INSERT INTO `weixin_item_tag` VALUES ('323', '929');
INSERT INTO `weixin_item_tag` VALUES ('323', '930');
INSERT INTO `weixin_item_tag` VALUES ('324', '927');
INSERT INTO `weixin_item_tag` VALUES ('324', '928');
INSERT INTO `weixin_item_tag` VALUES ('324', '929');
INSERT INTO `weixin_item_tag` VALUES ('324', '930');
INSERT INTO `weixin_item_tag` VALUES ('325', '602');
INSERT INTO `weixin_item_tag` VALUES ('325', '927');
INSERT INTO `weixin_item_tag` VALUES ('325', '930');
INSERT INTO `weixin_item_tag` VALUES ('326', '918');
INSERT INTO `weixin_item_tag` VALUES ('326', '927');
INSERT INTO `weixin_item_tag` VALUES ('326', '929');
INSERT INTO `weixin_item_tag` VALUES ('326', '930');
INSERT INTO `weixin_item_tag` VALUES ('326', '931');
INSERT INTO `weixin_item_tag` VALUES ('326', '932');
INSERT INTO `weixin_item_tag` VALUES ('327', '766');
INSERT INTO `weixin_item_tag` VALUES ('327', '933');
INSERT INTO `weixin_item_tag` VALUES ('327', '934');
INSERT INTO `weixin_item_tag` VALUES ('328', '632');
INSERT INTO `weixin_item_tag` VALUES ('328', '766');
INSERT INTO `weixin_item_tag` VALUES ('328', '934');
INSERT INTO `weixin_item_tag` VALUES ('328', '935');
INSERT INTO `weixin_item_tag` VALUES ('329', '766');
INSERT INTO `weixin_item_tag` VALUES ('329', '895');
INSERT INTO `weixin_item_tag` VALUES ('329', '934');
INSERT INTO `weixin_item_tag` VALUES ('329', '935');
INSERT INTO `weixin_item_tag` VALUES ('330', '766');
INSERT INTO `weixin_item_tag` VALUES ('330', '934');
INSERT INTO `weixin_item_tag` VALUES ('330', '936');
INSERT INTO `weixin_item_tag` VALUES ('330', '937');
INSERT INTO `weixin_item_tag` VALUES ('331', '636');
INSERT INTO `weixin_item_tag` VALUES ('331', '766');
INSERT INTO `weixin_item_tag` VALUES ('331', '934');
INSERT INTO `weixin_item_tag` VALUES ('331', '937');
INSERT INTO `weixin_item_tag` VALUES ('331', '938');
INSERT INTO `weixin_item_tag` VALUES ('332', '723');
INSERT INTO `weixin_item_tag` VALUES ('332', '734');
INSERT INTO `weixin_item_tag` VALUES ('332', '754');
INSERT INTO `weixin_item_tag` VALUES ('332', '766');
INSERT INTO `weixin_item_tag` VALUES ('332', '890');
INSERT INTO `weixin_item_tag` VALUES ('332', '939');
INSERT INTO `weixin_item_tag` VALUES ('333', '723');
INSERT INTO `weixin_item_tag` VALUES ('333', '734');
INSERT INTO `weixin_item_tag` VALUES ('333', '754');
INSERT INTO `weixin_item_tag` VALUES ('333', '939');
INSERT INTO `weixin_item_tag` VALUES ('333', '940');
INSERT INTO `weixin_item_tag` VALUES ('334', '734');
INSERT INTO `weixin_item_tag` VALUES ('334', '754');
INSERT INTO `weixin_item_tag` VALUES ('334', '766');
INSERT INTO `weixin_item_tag` VALUES ('334', '939');
INSERT INTO `weixin_item_tag` VALUES ('334', '941');
INSERT INTO `weixin_item_tag` VALUES ('335', '723');
INSERT INTO `weixin_item_tag` VALUES ('335', '734');
INSERT INTO `weixin_item_tag` VALUES ('335', '754');
INSERT INTO `weixin_item_tag` VALUES ('335', '766');
INSERT INTO `weixin_item_tag` VALUES ('335', '939');
INSERT INTO `weixin_item_tag` VALUES ('335', '942');
INSERT INTO `weixin_item_tag` VALUES ('336', '723');
INSERT INTO `weixin_item_tag` VALUES ('336', '734');
INSERT INTO `weixin_item_tag` VALUES ('336', '754');
INSERT INTO `weixin_item_tag` VALUES ('336', '933');
INSERT INTO `weixin_item_tag` VALUES ('336', '939');
INSERT INTO `weixin_item_tag` VALUES ('337', '915');
INSERT INTO `weixin_item_tag` VALUES ('337', '943');
INSERT INTO `weixin_item_tag` VALUES ('337', '944');
INSERT INTO `weixin_item_tag` VALUES ('337', '945');
INSERT INTO `weixin_item_tag` VALUES ('337', '946');
INSERT INTO `weixin_item_tag` VALUES ('338', '915');
INSERT INTO `weixin_item_tag` VALUES ('338', '943');
INSERT INTO `weixin_item_tag` VALUES ('338', '944');
INSERT INTO `weixin_item_tag` VALUES ('338', '946');
INSERT INTO `weixin_item_tag` VALUES ('338', '947');
INSERT INTO `weixin_item_tag` VALUES ('338', '948');
INSERT INTO `weixin_item_tag` VALUES ('339', '803');
INSERT INTO `weixin_item_tag` VALUES ('339', '915');
INSERT INTO `weixin_item_tag` VALUES ('339', '943');
INSERT INTO `weixin_item_tag` VALUES ('339', '944');
INSERT INTO `weixin_item_tag` VALUES ('339', '945');
INSERT INTO `weixin_item_tag` VALUES ('339', '946');
INSERT INTO `weixin_item_tag` VALUES ('340', '915');
INSERT INTO `weixin_item_tag` VALUES ('340', '943');
INSERT INTO `weixin_item_tag` VALUES ('340', '944');
INSERT INTO `weixin_item_tag` VALUES ('340', '945');
INSERT INTO `weixin_item_tag` VALUES ('340', '946');
INSERT INTO `weixin_item_tag` VALUES ('340', '948');
INSERT INTO `weixin_item_tag` VALUES ('341', '757');
INSERT INTO `weixin_item_tag` VALUES ('341', '949');
INSERT INTO `weixin_item_tag` VALUES ('341', '950');
INSERT INTO `weixin_item_tag` VALUES ('341', '951');
INSERT INTO `weixin_item_tag` VALUES ('341', '952');
INSERT INTO `weixin_item_tag` VALUES ('342', '630');
INSERT INTO `weixin_item_tag` VALUES ('342', '757');
INSERT INTO `weixin_item_tag` VALUES ('342', '949');
INSERT INTO `weixin_item_tag` VALUES ('342', '950');
INSERT INTO `weixin_item_tag` VALUES ('342', '951');
INSERT INTO `weixin_item_tag` VALUES ('342', '953');
INSERT INTO `weixin_item_tag` VALUES ('343', '584');
INSERT INTO `weixin_item_tag` VALUES ('343', '734');
INSERT INTO `weixin_item_tag` VALUES ('343', '757');
INSERT INTO `weixin_item_tag` VALUES ('343', '796');
INSERT INTO `weixin_item_tag` VALUES ('343', '808');
INSERT INTO `weixin_item_tag` VALUES ('343', '954');
INSERT INTO `weixin_item_tag` VALUES ('343', '955');
INSERT INTO `weixin_item_tag` VALUES ('343', '956');
INSERT INTO `weixin_item_tag` VALUES ('343', '957');
INSERT INTO `weixin_item_tag` VALUES ('344', '958');
INSERT INTO `weixin_item_tag` VALUES ('344', '959');
INSERT INTO `weixin_item_tag` VALUES ('345', '725');
INSERT INTO `weixin_item_tag` VALUES ('345', '757');
INSERT INTO `weixin_item_tag` VALUES ('345', '818');
INSERT INTO `weixin_item_tag` VALUES ('345', '960');
INSERT INTO `weixin_item_tag` VALUES ('345', '961');
INSERT INTO `weixin_item_tag` VALUES ('346', '757');
INSERT INTO `weixin_item_tag` VALUES ('346', '818');
INSERT INTO `weixin_item_tag` VALUES ('346', '960');
INSERT INTO `weixin_item_tag` VALUES ('346', '961');
INSERT INTO `weixin_item_tag` VALUES ('347', '757');
INSERT INTO `weixin_item_tag` VALUES ('347', '818');
INSERT INTO `weixin_item_tag` VALUES ('347', '960');
INSERT INTO `weixin_item_tag` VALUES ('347', '961');
INSERT INTO `weixin_item_tag` VALUES ('347', '962');
INSERT INTO `weixin_item_tag` VALUES ('348', '757');
INSERT INTO `weixin_item_tag` VALUES ('348', '818');
INSERT INTO `weixin_item_tag` VALUES ('348', '960');
INSERT INTO `weixin_item_tag` VALUES ('348', '961');
INSERT INTO `weixin_item_tag` VALUES ('348', '963');
INSERT INTO `weixin_item_tag` VALUES ('349', '638');
INSERT INTO `weixin_item_tag` VALUES ('349', '725');
INSERT INTO `weixin_item_tag` VALUES ('349', '757');
INSERT INTO `weixin_item_tag` VALUES ('349', '964');
INSERT INTO `weixin_item_tag` VALUES ('349', '965');
INSERT INTO `weixin_item_tag` VALUES ('350', '757');
INSERT INTO `weixin_item_tag` VALUES ('350', '818');
INSERT INTO `weixin_item_tag` VALUES ('350', '964');
INSERT INTO `weixin_item_tag` VALUES ('350', '965');
INSERT INTO `weixin_item_tag` VALUES ('351', '725');
INSERT INTO `weixin_item_tag` VALUES ('351', '757');
INSERT INTO `weixin_item_tag` VALUES ('351', '964');
INSERT INTO `weixin_item_tag` VALUES ('351', '965');
INSERT INTO `weixin_item_tag` VALUES ('352', '800');
INSERT INTO `weixin_item_tag` VALUES ('352', '914');
INSERT INTO `weixin_item_tag` VALUES ('352', '966');
INSERT INTO `weixin_item_tag` VALUES ('353', '734');
INSERT INTO `weixin_item_tag` VALUES ('353', '737');
INSERT INTO `weixin_item_tag` VALUES ('353', '967');
INSERT INTO `weixin_item_tag` VALUES ('353', '968');
INSERT INTO `weixin_item_tag` VALUES ('354', '734');
INSERT INTO `weixin_item_tag` VALUES ('354', '737');
INSERT INTO `weixin_item_tag` VALUES ('354', '967');
INSERT INTO `weixin_item_tag` VALUES ('354', '968');
INSERT INTO `weixin_item_tag` VALUES ('355', '734');
INSERT INTO `weixin_item_tag` VALUES ('355', '737');
INSERT INTO `weixin_item_tag` VALUES ('355', '967');
INSERT INTO `weixin_item_tag` VALUES ('355', '968');
INSERT INTO `weixin_item_tag` VALUES ('355', '969');
INSERT INTO `weixin_item_tag` VALUES ('356', '729');
INSERT INTO `weixin_item_tag` VALUES ('356', '730');
INSERT INTO `weixin_item_tag` VALUES ('356', '734');
INSERT INTO `weixin_item_tag` VALUES ('356', '737');
INSERT INTO `weixin_item_tag` VALUES ('356', '967');
INSERT INTO `weixin_item_tag` VALUES ('356', '968');
INSERT INTO `weixin_item_tag` VALUES ('357', '734');
INSERT INTO `weixin_item_tag` VALUES ('357', '762');
INSERT INTO `weixin_item_tag` VALUES ('357', '763');
INSERT INTO `weixin_item_tag` VALUES ('357', '764');
INSERT INTO `weixin_item_tag` VALUES ('357', '765');
INSERT INTO `weixin_item_tag` VALUES ('357', '766');
INSERT INTO `weixin_item_tag` VALUES ('357', '767');
INSERT INTO `weixin_item_tag` VALUES ('357', '768');
INSERT INTO `weixin_item_tag` VALUES ('358', '734');
INSERT INTO `weixin_item_tag` VALUES ('358', '762');
INSERT INTO `weixin_item_tag` VALUES ('358', '763');
INSERT INTO `weixin_item_tag` VALUES ('358', '764');
INSERT INTO `weixin_item_tag` VALUES ('358', '766');
INSERT INTO `weixin_item_tag` VALUES ('358', '767');
INSERT INTO `weixin_item_tag` VALUES ('358', '970');
INSERT INTO `weixin_item_tag` VALUES ('358', '971');
INSERT INTO `weixin_item_tag` VALUES ('358', '972');
INSERT INTO `weixin_item_tag` VALUES ('359', '734');
INSERT INTO `weixin_item_tag` VALUES ('359', '762');
INSERT INTO `weixin_item_tag` VALUES ('359', '763');
INSERT INTO `weixin_item_tag` VALUES ('359', '764');
INSERT INTO `weixin_item_tag` VALUES ('359', '766');
INSERT INTO `weixin_item_tag` VALUES ('359', '767');
INSERT INTO `weixin_item_tag` VALUES ('359', '768');
INSERT INTO `weixin_item_tag` VALUES ('359', '808');
INSERT INTO `weixin_item_tag` VALUES ('360', '602');
INSERT INTO `weixin_item_tag` VALUES ('360', '625');
INSERT INTO `weixin_item_tag` VALUES ('360', '973');
INSERT INTO `weixin_item_tag` VALUES ('360', '974');
INSERT INTO `weixin_item_tag` VALUES ('360', '975');
INSERT INTO `weixin_item_tag` VALUES ('361', '625');
INSERT INTO `weixin_item_tag` VALUES ('361', '976');
INSERT INTO `weixin_item_tag` VALUES ('361', '977');
INSERT INTO `weixin_item_tag` VALUES ('361', '978');
INSERT INTO `weixin_item_tag` VALUES ('361', '979');
INSERT INTO `weixin_item_tag` VALUES ('361', '980');
INSERT INTO `weixin_item_tag` VALUES ('361', '981');
INSERT INTO `weixin_item_tag` VALUES ('361', '982');
INSERT INTO `weixin_item_tag` VALUES ('361', '983');
INSERT INTO `weixin_item_tag` VALUES ('362', '680');
INSERT INTO `weixin_item_tag` VALUES ('362', '683');
INSERT INTO `weixin_item_tag` VALUES ('362', '711');
INSERT INTO `weixin_item_tag` VALUES ('362', '976');
INSERT INTO `weixin_item_tag` VALUES ('362', '977');
INSERT INTO `weixin_item_tag` VALUES ('362', '984');
INSERT INTO `weixin_item_tag` VALUES ('362', '985');
INSERT INTO `weixin_item_tag` VALUES ('363', '986');
INSERT INTO `weixin_item_tag` VALUES ('363', '987');
INSERT INTO `weixin_item_tag` VALUES ('363', '988');
INSERT INTO `weixin_item_tag` VALUES ('363', '989');
INSERT INTO `weixin_item_tag` VALUES ('363', '990');
INSERT INTO `weixin_item_tag` VALUES ('364', '626');
INSERT INTO `weixin_item_tag` VALUES ('364', '678');
INSERT INTO `weixin_item_tag` VALUES ('364', '986');
INSERT INTO `weixin_item_tag` VALUES ('364', '987');
INSERT INTO `weixin_item_tag` VALUES ('364', '989');
INSERT INTO `weixin_item_tag` VALUES ('364', '990');
INSERT INTO `weixin_item_tag` VALUES ('364', '991');
INSERT INTO `weixin_item_tag` VALUES ('365', '986');
INSERT INTO `weixin_item_tag` VALUES ('365', '990');
INSERT INTO `weixin_item_tag` VALUES ('365', '992');
INSERT INTO `weixin_item_tag` VALUES ('365', '993');
INSERT INTO `weixin_item_tag` VALUES ('366', '994');
INSERT INTO `weixin_item_tag` VALUES ('366', '995');
INSERT INTO `weixin_item_tag` VALUES ('366', '996');
INSERT INTO `weixin_item_tag` VALUES ('366', '997');
INSERT INTO `weixin_item_tag` VALUES ('366', '998');
INSERT INTO `weixin_item_tag` VALUES ('366', '999');
INSERT INTO `weixin_item_tag` VALUES ('367', '645');
INSERT INTO `weixin_item_tag` VALUES ('367', '716');
INSERT INTO `weixin_item_tag` VALUES ('367', '717');
INSERT INTO `weixin_item_tag` VALUES ('367', '719');
INSERT INTO `weixin_item_tag` VALUES ('367', '976');
INSERT INTO `weixin_item_tag` VALUES ('367', '1000');
INSERT INTO `weixin_item_tag` VALUES ('367', '1001');
INSERT INTO `weixin_item_tag` VALUES ('367', '1002');
INSERT INTO `weixin_item_tag` VALUES ('368', '711');
INSERT INTO `weixin_item_tag` VALUES ('368', '818');
INSERT INTO `weixin_item_tag` VALUES ('368', '1000');
INSERT INTO `weixin_item_tag` VALUES ('368', '1003');
INSERT INTO `weixin_item_tag` VALUES ('368', '1004');
INSERT INTO `weixin_item_tag` VALUES ('369', '1005');
INSERT INTO `weixin_item_tag` VALUES ('369', '1006');
INSERT INTO `weixin_item_tag` VALUES ('369', '1007');
INSERT INTO `weixin_item_tag` VALUES ('369', '1008');
INSERT INTO `weixin_item_tag` VALUES ('370', '1005');
INSERT INTO `weixin_item_tag` VALUES ('370', '1008');
INSERT INTO `weixin_item_tag` VALUES ('370', '1009');
INSERT INTO `weixin_item_tag` VALUES ('370', '1010');
INSERT INTO `weixin_item_tag` VALUES ('371', '761');
INSERT INTO `weixin_item_tag` VALUES ('371', '1011');
INSERT INTO `weixin_item_tag` VALUES ('371', '1012');
INSERT INTO `weixin_item_tag` VALUES ('372', '710');
INSERT INTO `weixin_item_tag` VALUES ('372', '734');
INSERT INTO `weixin_item_tag` VALUES ('372', '898');
INSERT INTO `weixin_item_tag` VALUES ('372', '1013');
INSERT INTO `weixin_item_tag` VALUES ('372', '1014');
INSERT INTO `weixin_item_tag` VALUES ('372', '1015');
INSERT INTO `weixin_item_tag` VALUES ('373', '725');
INSERT INTO `weixin_item_tag` VALUES ('373', '734');
INSERT INTO `weixin_item_tag` VALUES ('373', '754');
INSERT INTO `weixin_item_tag` VALUES ('373', '951');
INSERT INTO `weixin_item_tag` VALUES ('373', '1016');
INSERT INTO `weixin_item_tag` VALUES ('374', '1017');
INSERT INTO `weixin_item_tag` VALUES ('374', '1018');
INSERT INTO `weixin_item_tag` VALUES ('374', '1019');
INSERT INTO `weixin_item_tag` VALUES ('374', '1020');
INSERT INTO `weixin_item_tag` VALUES ('374', '1021');
INSERT INTO `weixin_item_tag` VALUES ('374', '1022');
INSERT INTO `weixin_item_tag` VALUES ('374', '1023');
INSERT INTO `weixin_item_tag` VALUES ('375', '1018');
INSERT INTO `weixin_item_tag` VALUES ('375', '1019');
INSERT INTO `weixin_item_tag` VALUES ('375', '1020');
INSERT INTO `weixin_item_tag` VALUES ('375', '1021');
INSERT INTO `weixin_item_tag` VALUES ('375', '1022');
INSERT INTO `weixin_item_tag` VALUES ('375', '1023');
INSERT INTO `weixin_item_tag` VALUES ('375', '1024');
INSERT INTO `weixin_item_tag` VALUES ('376', '1020');
INSERT INTO `weixin_item_tag` VALUES ('376', '1021');
INSERT INTO `weixin_item_tag` VALUES ('376', '1022');
INSERT INTO `weixin_item_tag` VALUES ('376', '1023');
INSERT INTO `weixin_item_tag` VALUES ('376', '1025');
INSERT INTO `weixin_item_tag` VALUES ('377', '1020');
INSERT INTO `weixin_item_tag` VALUES ('377', '1021');
INSERT INTO `weixin_item_tag` VALUES ('377', '1022');
INSERT INTO `weixin_item_tag` VALUES ('377', '1023');
INSERT INTO `weixin_item_tag` VALUES ('377', '1025');
INSERT INTO `weixin_item_tag` VALUES ('378', '546');
INSERT INTO `weixin_item_tag` VALUES ('378', '591');
INSERT INTO `weixin_item_tag` VALUES ('378', '1017');
INSERT INTO `weixin_item_tag` VALUES ('378', '1018');
INSERT INTO `weixin_item_tag` VALUES ('378', '1026');
INSERT INTO `weixin_item_tag` VALUES ('378', '1027');
INSERT INTO `weixin_item_tag` VALUES ('378', '1028');
INSERT INTO `weixin_item_tag` VALUES ('378', '1029');
INSERT INTO `weixin_item_tag` VALUES ('378', '1030');
INSERT INTO `weixin_item_tag` VALUES ('378', '1031');
INSERT INTO `weixin_item_tag` VALUES ('379', '546');
INSERT INTO `weixin_item_tag` VALUES ('379', '591');
INSERT INTO `weixin_item_tag` VALUES ('379', '1017');
INSERT INTO `weixin_item_tag` VALUES ('379', '1018');
INSERT INTO `weixin_item_tag` VALUES ('379', '1032');
INSERT INTO `weixin_item_tag` VALUES ('379', '1033');
INSERT INTO `weixin_item_tag` VALUES ('379', '1034');
INSERT INTO `weixin_item_tag` VALUES ('380', '546');
INSERT INTO `weixin_item_tag` VALUES ('380', '591');
INSERT INTO `weixin_item_tag` VALUES ('380', '1017');
INSERT INTO `weixin_item_tag` VALUES ('380', '1018');
INSERT INTO `weixin_item_tag` VALUES ('380', '1027');
INSERT INTO `weixin_item_tag` VALUES ('380', '1028');
INSERT INTO `weixin_item_tag` VALUES ('380', '1029');
INSERT INTO `weixin_item_tag` VALUES ('380', '1030');
INSERT INTO `weixin_item_tag` VALUES ('380', '1034');
INSERT INTO `weixin_item_tag` VALUES ('381', '546');
INSERT INTO `weixin_item_tag` VALUES ('381', '591');
INSERT INTO `weixin_item_tag` VALUES ('381', '1018');
INSERT INTO `weixin_item_tag` VALUES ('381', '1024');
INSERT INTO `weixin_item_tag` VALUES ('381', '1027');
INSERT INTO `weixin_item_tag` VALUES ('381', '1028');
INSERT INTO `weixin_item_tag` VALUES ('381', '1029');
INSERT INTO `weixin_item_tag` VALUES ('381', '1030');
INSERT INTO `weixin_item_tag` VALUES ('381', '1035');
INSERT INTO `weixin_item_tag` VALUES ('382', '546');
INSERT INTO `weixin_item_tag` VALUES ('382', '591');
INSERT INTO `weixin_item_tag` VALUES ('382', '1018');
INSERT INTO `weixin_item_tag` VALUES ('382', '1024');
INSERT INTO `weixin_item_tag` VALUES ('382', '1027');
INSERT INTO `weixin_item_tag` VALUES ('382', '1029');
INSERT INTO `weixin_item_tag` VALUES ('382', '1033');
INSERT INTO `weixin_item_tag` VALUES ('382', '1035');
INSERT INTO `weixin_item_tag` VALUES ('383', '546');
INSERT INTO `weixin_item_tag` VALUES ('383', '1017');
INSERT INTO `weixin_item_tag` VALUES ('383', '1018');
INSERT INTO `weixin_item_tag` VALUES ('383', '1028');
INSERT INTO `weixin_item_tag` VALUES ('383', '1029');
INSERT INTO `weixin_item_tag` VALUES ('383', '1034');
INSERT INTO `weixin_item_tag` VALUES ('384', '546');
INSERT INTO `weixin_item_tag` VALUES ('384', '1018');
INSERT INTO `weixin_item_tag` VALUES ('384', '1024');
INSERT INTO `weixin_item_tag` VALUES ('384', '1027');
INSERT INTO `weixin_item_tag` VALUES ('384', '1028');
INSERT INTO `weixin_item_tag` VALUES ('384', '1029');
INSERT INTO `weixin_item_tag` VALUES ('384', '1035');
INSERT INTO `weixin_item_tag` VALUES ('385', '546');
INSERT INTO `weixin_item_tag` VALUES ('385', '591');
INSERT INTO `weixin_item_tag` VALUES ('385', '1018');
INSERT INTO `weixin_item_tag` VALUES ('385', '1019');
INSERT INTO `weixin_item_tag` VALUES ('385', '1024');
INSERT INTO `weixin_item_tag` VALUES ('385', '1033');
INSERT INTO `weixin_item_tag` VALUES ('385', '1035');
INSERT INTO `weixin_item_tag` VALUES ('386', '546');
INSERT INTO `weixin_item_tag` VALUES ('386', '591');
INSERT INTO `weixin_item_tag` VALUES ('386', '1017');
INSERT INTO `weixin_item_tag` VALUES ('386', '1018');
INSERT INTO `weixin_item_tag` VALUES ('386', '1019');
INSERT INTO `weixin_item_tag` VALUES ('386', '1033');
INSERT INTO `weixin_item_tag` VALUES ('386', '1034');
INSERT INTO `weixin_item_tag` VALUES ('387', '546');
INSERT INTO `weixin_item_tag` VALUES ('387', '591');
INSERT INTO `weixin_item_tag` VALUES ('387', '1017');
INSERT INTO `weixin_item_tag` VALUES ('387', '1029');
INSERT INTO `weixin_item_tag` VALUES ('387', '1030');
INSERT INTO `weixin_item_tag` VALUES ('387', '1031');
INSERT INTO `weixin_item_tag` VALUES ('387', '1036');
INSERT INTO `weixin_item_tag` VALUES ('387', '1037');
INSERT INTO `weixin_item_tag` VALUES ('388', '1018');
INSERT INTO `weixin_item_tag` VALUES ('388', '1024');
INSERT INTO `weixin_item_tag` VALUES ('388', '1038');
INSERT INTO `weixin_item_tag` VALUES ('388', '1039');
INSERT INTO `weixin_item_tag` VALUES ('388', '1040');
INSERT INTO `weixin_item_tag` VALUES ('388', '1041');
INSERT INTO `weixin_item_tag` VALUES ('389', '1017');
INSERT INTO `weixin_item_tag` VALUES ('389', '1018');
INSERT INTO `weixin_item_tag` VALUES ('389', '1024');
INSERT INTO `weixin_item_tag` VALUES ('389', '1038');
INSERT INTO `weixin_item_tag` VALUES ('389', '1039');
INSERT INTO `weixin_item_tag` VALUES ('389', '1040');
INSERT INTO `weixin_item_tag` VALUES ('389', '1042');
INSERT INTO `weixin_item_tag` VALUES ('390', '680');
INSERT INTO `weixin_item_tag` VALUES ('390', '1017');
INSERT INTO `weixin_item_tag` VALUES ('390', '1018');
INSERT INTO `weixin_item_tag` VALUES ('390', '1043');
INSERT INTO `weixin_item_tag` VALUES ('391', '1018');
INSERT INTO `weixin_item_tag` VALUES ('391', '1024');
INSERT INTO `weixin_item_tag` VALUES ('391', '1041');
INSERT INTO `weixin_item_tag` VALUES ('391', '1043');
INSERT INTO `weixin_item_tag` VALUES ('391', '1044');
INSERT INTO `weixin_item_tag` VALUES ('392', '1018');
INSERT INTO `weixin_item_tag` VALUES ('392', '1024');
INSERT INTO `weixin_item_tag` VALUES ('392', '1029');
INSERT INTO `weixin_item_tag` VALUES ('392', '1045');
INSERT INTO `weixin_item_tag` VALUES ('392', '1046');
INSERT INTO `weixin_item_tag` VALUES ('392', '1047');
INSERT INTO `weixin_item_tag` VALUES ('392', '1048');
INSERT INTO `weixin_item_tag` VALUES ('393', '1018');
INSERT INTO `weixin_item_tag` VALUES ('393', '1024');
INSERT INTO `weixin_item_tag` VALUES ('393', '1045');
INSERT INTO `weixin_item_tag` VALUES ('393', '1049');
INSERT INTO `weixin_item_tag` VALUES ('393', '1050');
INSERT INTO `weixin_item_tag` VALUES ('393', '1051');
INSERT INTO `weixin_item_tag` VALUES ('393', '1052');
INSERT INTO `weixin_item_tag` VALUES ('393', '1053');
INSERT INTO `weixin_item_tag` VALUES ('394', '543');
INSERT INTO `weixin_item_tag` VALUES ('394', '1017');
INSERT INTO `weixin_item_tag` VALUES ('394', '1018');
INSERT INTO `weixin_item_tag` VALUES ('394', '1029');
INSERT INTO `weixin_item_tag` VALUES ('394', '1045');
INSERT INTO `weixin_item_tag` VALUES ('394', '1054');
INSERT INTO `weixin_item_tag` VALUES ('394', '1055');
INSERT INTO `weixin_item_tag` VALUES ('394', '1056');
INSERT INTO `weixin_item_tag` VALUES ('394', '1057');
INSERT INTO `weixin_item_tag` VALUES ('394', '1058');
INSERT INTO `weixin_item_tag` VALUES ('395', '1065');
INSERT INTO `weixin_item_tag` VALUES ('395', '1066');
INSERT INTO `weixin_item_tag` VALUES ('395', '1067');
INSERT INTO `weixin_item_tag` VALUES ('395', '1068');
INSERT INTO `weixin_item_tag` VALUES ('395', '1069');
INSERT INTO `weixin_item_tag` VALUES ('395', '1070');
INSERT INTO `weixin_item_tag` VALUES ('396', '591');
INSERT INTO `weixin_item_tag` VALUES ('396', '787');
INSERT INTO `weixin_item_tag` VALUES ('396', '1060');
INSERT INTO `weixin_item_tag` VALUES ('396', '1062');
INSERT INTO `weixin_item_tag` VALUES ('396', '1063');
INSERT INTO `weixin_item_tag` VALUES ('396', '1064');
INSERT INTO `weixin_item_tag` VALUES ('397', '590');
INSERT INTO `weixin_item_tag` VALUES ('397', '632');
INSERT INTO `weixin_item_tag` VALUES ('397', '640');
INSERT INTO `weixin_item_tag` VALUES ('397', '680');
INSERT INTO `weixin_item_tag` VALUES ('397', '787');
INSERT INTO `weixin_item_tag` VALUES ('397', '1060');
INSERT INTO `weixin_item_tag` VALUES ('398', '591');
INSERT INTO `weixin_item_tag` VALUES ('398', '594');
INSERT INTO `weixin_item_tag` VALUES ('398', '787');
INSERT INTO `weixin_item_tag` VALUES ('398', '1071');
INSERT INTO `weixin_item_tag` VALUES ('398', '1072');
INSERT INTO `weixin_item_tag` VALUES ('398', '1073');
INSERT INTO `weixin_item_tag` VALUES ('398', '1074');
INSERT INTO `weixin_item_tag` VALUES ('399', '570');
INSERT INTO `weixin_item_tag` VALUES ('399', '589');
INSERT INTO `weixin_item_tag` VALUES ('399', '590');
INSERT INTO `weixin_item_tag` VALUES ('399', '591');
INSERT INTO `weixin_item_tag` VALUES ('399', '1075');
INSERT INTO `weixin_item_tag` VALUES ('399', '1076');
INSERT INTO `weixin_item_tag` VALUES ('399', '1077');
INSERT INTO `weixin_item_tag` VALUES ('400', '570');
INSERT INTO `weixin_item_tag` VALUES ('400', '589');
INSERT INTO `weixin_item_tag` VALUES ('400', '590');
INSERT INTO `weixin_item_tag` VALUES ('400', '591');
INSERT INTO `weixin_item_tag` VALUES ('400', '1075');
INSERT INTO `weixin_item_tag` VALUES ('400', '1076');
INSERT INTO `weixin_item_tag` VALUES ('400', '1078');
INSERT INTO `weixin_item_tag` VALUES ('401', '981');
INSERT INTO `weixin_item_tag` VALUES ('401', '1085');
INSERT INTO `weixin_item_tag` VALUES ('401', '1086');
INSERT INTO `weixin_item_tag` VALUES ('402', '582');
INSERT INTO `weixin_item_tag` VALUES ('402', '591');
INSERT INTO `weixin_item_tag` VALUES ('402', '594');
INSERT INTO `weixin_item_tag` VALUES ('402', '680');
INSERT INTO `weixin_item_tag` VALUES ('402', '682');
INSERT INTO `weixin_item_tag` VALUES ('402', '1062');
INSERT INTO `weixin_item_tag` VALUES ('402', '1072');
INSERT INTO `weixin_item_tag` VALUES ('402', '1081');
INSERT INTO `weixin_item_tag` VALUES ('402', '1082');
INSERT INTO `weixin_item_tag` VALUES ('402', '1083');
INSERT INTO `weixin_item_tag` VALUES ('403', '589');
INSERT INTO `weixin_item_tag` VALUES ('403', '590');
INSERT INTO `weixin_item_tag` VALUES ('403', '591');
INSERT INTO `weixin_item_tag` VALUES ('403', '592');
INSERT INTO `weixin_item_tag` VALUES ('403', '594');
INSERT INTO `weixin_item_tag` VALUES ('403', '1084');
INSERT INTO `weixin_item_tag` VALUES ('404', '594');
INSERT INTO `weixin_item_tag` VALUES ('404', '794');
INSERT INTO `weixin_item_tag` VALUES ('404', '1079');
INSERT INTO `weixin_item_tag` VALUES ('405', '728');
INSERT INTO `weixin_item_tag` VALUES ('405', '734');
INSERT INTO `weixin_item_tag` VALUES ('405', '892');
INSERT INTO `weixin_item_tag` VALUES ('405', '894');
INSERT INTO `weixin_item_tag` VALUES ('405', '1089');
INSERT INTO `weixin_item_tag` VALUES ('406', '728');
INSERT INTO `weixin_item_tag` VALUES ('406', '1089');
INSERT INTO `weixin_item_tag` VALUES ('407', '728');
INSERT INTO `weixin_item_tag` VALUES ('407', '734');
INSERT INTO `weixin_item_tag` VALUES ('407', '894');
INSERT INTO `weixin_item_tag` VALUES ('407', '1088');
INSERT INTO `weixin_item_tag` VALUES ('407', '1089');
INSERT INTO `weixin_item_tag` VALUES ('408', '547');
INSERT INTO `weixin_item_tag` VALUES ('408', '588');
INSERT INTO `weixin_item_tag` VALUES ('408', '734');
INSERT INTO `weixin_item_tag` VALUES ('408', '1090');
INSERT INTO `weixin_item_tag` VALUES ('408', '1091');
INSERT INTO `weixin_item_tag` VALUES ('408', '1092');
INSERT INTO `weixin_item_tag` VALUES ('408', '1093');
INSERT INTO `weixin_item_tag` VALUES ('408', '1094');
INSERT INTO `weixin_item_tag` VALUES ('409', '547');
INSERT INTO `weixin_item_tag` VALUES ('409', '734');
INSERT INTO `weixin_item_tag` VALUES ('409', '1090');
INSERT INTO `weixin_item_tag` VALUES ('409', '1091');
INSERT INTO `weixin_item_tag` VALUES ('409', '1092');
INSERT INTO `weixin_item_tag` VALUES ('409', '1093');
INSERT INTO `weixin_item_tag` VALUES ('409', '1094');
INSERT INTO `weixin_item_tag` VALUES ('409', '1095');
INSERT INTO `weixin_item_tag` VALUES ('410', '547');
INSERT INTO `weixin_item_tag` VALUES ('410', '734');
INSERT INTO `weixin_item_tag` VALUES ('410', '1090');
INSERT INTO `weixin_item_tag` VALUES ('410', '1091');
INSERT INTO `weixin_item_tag` VALUES ('410', '1092');
INSERT INTO `weixin_item_tag` VALUES ('410', '1093');
INSERT INTO `weixin_item_tag` VALUES ('410', '1096');
INSERT INTO `weixin_item_tag` VALUES ('410', '1097');
INSERT INTO `weixin_item_tag` VALUES ('411', '721');
INSERT INTO `weixin_item_tag` VALUES ('411', '734');
INSERT INTO `weixin_item_tag` VALUES ('411', '824');
INSERT INTO `weixin_item_tag` VALUES ('411', '891');
INSERT INTO `weixin_item_tag` VALUES ('411', '894');
INSERT INTO `weixin_item_tag` VALUES ('411', '950');
INSERT INTO `weixin_item_tag` VALUES ('411', '1098');
INSERT INTO `weixin_item_tag` VALUES ('412', '678');
INSERT INTO `weixin_item_tag` VALUES ('412', '721');
INSERT INTO `weixin_item_tag` VALUES ('412', '734');
INSERT INTO `weixin_item_tag` VALUES ('412', '891');
INSERT INTO `weixin_item_tag` VALUES ('412', '894');
INSERT INTO `weixin_item_tag` VALUES ('412', '950');
INSERT INTO `weixin_item_tag` VALUES ('412', '1098');
INSERT INTO `weixin_item_tag` VALUES ('413', '721');
INSERT INTO `weixin_item_tag` VALUES ('413', '734');
INSERT INTO `weixin_item_tag` VALUES ('413', '891');
INSERT INTO `weixin_item_tag` VALUES ('413', '894');
INSERT INTO `weixin_item_tag` VALUES ('413', '950');
INSERT INTO `weixin_item_tag` VALUES ('413', '1098');
INSERT INTO `weixin_item_tag` VALUES ('413', '1099');
INSERT INTO `weixin_item_tag` VALUES ('414', '721');
INSERT INTO `weixin_item_tag` VALUES ('414', '734');
INSERT INTO `weixin_item_tag` VALUES ('414', '891');
INSERT INTO `weixin_item_tag` VALUES ('414', '892');
INSERT INTO `weixin_item_tag` VALUES ('414', '894');
INSERT INTO `weixin_item_tag` VALUES ('414', '950');
INSERT INTO `weixin_item_tag` VALUES ('414', '1098');
INSERT INTO `weixin_item_tag` VALUES ('419', '678');
INSERT INTO `weixin_item_tag` VALUES ('419', '734');
INSERT INTO `weixin_item_tag` VALUES ('419', '761');
INSERT INTO `weixin_item_tag` VALUES ('419', '764');
INSERT INTO `weixin_item_tag` VALUES ('419', '1102');
INSERT INTO `weixin_item_tag` VALUES ('421', '734');
INSERT INTO `weixin_item_tag` VALUES ('421', '757');
INSERT INTO `weixin_item_tag` VALUES ('421', '761');
INSERT INTO `weixin_item_tag` VALUES ('421', '764');
INSERT INTO `weixin_item_tag` VALUES ('421', '1102');
INSERT INTO `weixin_item_tag` VALUES ('422', '721');
INSERT INTO `weixin_item_tag` VALUES ('422', '1101');
INSERT INTO `weixin_item_tag` VALUES ('422', '1102');
INSERT INTO `weixin_item_tag` VALUES ('423', '734');
INSERT INTO `weixin_item_tag` VALUES ('423', '761');
INSERT INTO `weixin_item_tag` VALUES ('423', '764');
INSERT INTO `weixin_item_tag` VALUES ('423', '765');
INSERT INTO `weixin_item_tag` VALUES ('423', '1102');
INSERT INTO `weixin_item_tag` VALUES ('424', '721');
INSERT INTO `weixin_item_tag` VALUES ('424', '757');
INSERT INTO `weixin_item_tag` VALUES ('424', '883');
INSERT INTO `weixin_item_tag` VALUES ('424', '1103');
INSERT INTO `weixin_item_tag` VALUES ('425', '721');
INSERT INTO `weixin_item_tag` VALUES ('425', '757');
INSERT INTO `weixin_item_tag` VALUES ('425', '1103');
INSERT INTO `weixin_item_tag` VALUES ('426', '721');
INSERT INTO `weixin_item_tag` VALUES ('426', '725');
INSERT INTO `weixin_item_tag` VALUES ('426', '757');
INSERT INTO `weixin_item_tag` VALUES ('426', '1103');
INSERT INTO `weixin_item_tag` VALUES ('427', '678');
INSERT INTO `weixin_item_tag` VALUES ('427', '721');
INSERT INTO `weixin_item_tag` VALUES ('427', '757');
INSERT INTO `weixin_item_tag` VALUES ('427', '1103');
INSERT INTO `weixin_item_tag` VALUES ('428', '638');
INSERT INTO `weixin_item_tag` VALUES ('428', '721');
INSERT INTO `weixin_item_tag` VALUES ('428', '757');
INSERT INTO `weixin_item_tag` VALUES ('428', '1103');
INSERT INTO `weixin_item_tag` VALUES ('430', '721');
INSERT INTO `weixin_item_tag` VALUES ('430', '757');
INSERT INTO `weixin_item_tag` VALUES ('430', '1103');
INSERT INTO `weixin_item_tag` VALUES ('431', '728');
INSERT INTO `weixin_item_tag` VALUES ('431', '734');
INSERT INTO `weixin_item_tag` VALUES ('431', '894');
INSERT INTO `weixin_item_tag` VALUES ('431', '1088');
INSERT INTO `weixin_item_tag` VALUES ('431', '1089');
INSERT INTO `weixin_item_tag` VALUES ('432', '728');
INSERT INTO `weixin_item_tag` VALUES ('432', '734');
INSERT INTO `weixin_item_tag` VALUES ('432', '894');
INSERT INTO `weixin_item_tag` VALUES ('432', '1089');
INSERT INTO `weixin_item_tag` VALUES ('432', '1109');
INSERT INTO `weixin_item_tag` VALUES ('433', '728');
INSERT INTO `weixin_item_tag` VALUES ('433', '734');
INSERT INTO `weixin_item_tag` VALUES ('433', '892');
INSERT INTO `weixin_item_tag` VALUES ('433', '894');
INSERT INTO `weixin_item_tag` VALUES ('433', '1089');
INSERT INTO `weixin_item_tag` VALUES ('433', '1109');
INSERT INTO `weixin_item_tag` VALUES ('434', '728');
INSERT INTO `weixin_item_tag` VALUES ('434', '729');
INSERT INTO `weixin_item_tag` VALUES ('434', '734');
INSERT INTO `weixin_item_tag` VALUES ('434', '894');
INSERT INTO `weixin_item_tag` VALUES ('434', '1110');
INSERT INTO `weixin_item_tag` VALUES ('435', '678');
INSERT INTO `weixin_item_tag` VALUES ('435', '880');
INSERT INTO `weixin_item_tag` VALUES ('435', '892');
INSERT INTO `weixin_item_tag` VALUES ('435', '1111');
INSERT INTO `weixin_item_tag` VALUES ('435', '1112');
INSERT INTO `weixin_item_tag` VALUES ('435', '1113');
INSERT INTO `weixin_item_tag` VALUES ('436', '887');
INSERT INTO `weixin_item_tag` VALUES ('436', '1111');
INSERT INTO `weixin_item_tag` VALUES ('436', '1113');
INSERT INTO `weixin_item_tag` VALUES ('437', '880');
INSERT INTO `weixin_item_tag` VALUES ('437', '1111');
INSERT INTO `weixin_item_tag` VALUES ('437', '1114');
INSERT INTO `weixin_item_tag` VALUES ('437', '1115');
INSERT INTO `weixin_item_tag` VALUES ('437', '1116');
INSERT INTO `weixin_item_tag` VALUES ('437', '1117');
INSERT INTO `weixin_item_tag` VALUES ('437', '1118');
INSERT INTO `weixin_item_tag` VALUES ('438', '951');
INSERT INTO `weixin_item_tag` VALUES ('438', '1119');
INSERT INTO `weixin_item_tag` VALUES ('438', '1120');
INSERT INTO `weixin_item_tag` VALUES ('438', '1121');
INSERT INTO `weixin_item_tag` VALUES ('439', '1122');
INSERT INTO `weixin_item_tag` VALUES ('439', '1123');
INSERT INTO `weixin_item_tag` VALUES ('439', '1124');
INSERT INTO `weixin_item_tag` VALUES ('440', '632');
INSERT INTO `weixin_item_tag` VALUES ('440', '1008');
INSERT INTO `weixin_item_tag` VALUES ('440', '1123');
INSERT INTO `weixin_item_tag` VALUES ('441', '684');
INSERT INTO `weixin_item_tag` VALUES ('441', '1123');
INSERT INTO `weixin_item_tag` VALUES ('441', '1125');
INSERT INTO `weixin_item_tag` VALUES ('442', '1008');
INSERT INTO `weixin_item_tag` VALUES ('442', '1123');
INSERT INTO `weixin_item_tag` VALUES ('444', '585');
INSERT INTO `weixin_item_tag` VALUES ('444', '734');
INSERT INTO `weixin_item_tag` VALUES ('444', '764');
INSERT INTO `weixin_item_tag` VALUES ('444', '1121');
INSERT INTO `weixin_item_tag` VALUES ('444', '1126');
INSERT INTO `weixin_item_tag` VALUES ('444', '1127');
INSERT INTO `weixin_item_tag` VALUES ('444', '1128');
INSERT INTO `weixin_item_tag` VALUES ('445', '585');
INSERT INTO `weixin_item_tag` VALUES ('445', '734');
INSERT INTO `weixin_item_tag` VALUES ('445', '764');
INSERT INTO `weixin_item_tag` VALUES ('445', '1121');
INSERT INTO `weixin_item_tag` VALUES ('445', '1126');
INSERT INTO `weixin_item_tag` VALUES ('445', '1129');
INSERT INTO `weixin_item_tag` VALUES ('447', '585');
INSERT INTO `weixin_item_tag` VALUES ('447', '588');
INSERT INTO `weixin_item_tag` VALUES ('447', '734');
INSERT INTO `weixin_item_tag` VALUES ('447', '764');
INSERT INTO `weixin_item_tag` VALUES ('447', '780');
INSERT INTO `weixin_item_tag` VALUES ('447', '1130');
INSERT INTO `weixin_item_tag` VALUES ('447', '1131');
INSERT INTO `weixin_item_tag` VALUES ('448', '585');
INSERT INTO `weixin_item_tag` VALUES ('448', '734');
INSERT INTO `weixin_item_tag` VALUES ('448', '764');
INSERT INTO `weixin_item_tag` VALUES ('448', '780');
INSERT INTO `weixin_item_tag` VALUES ('448', '1131');
INSERT INTO `weixin_item_tag` VALUES ('448', '1132');
INSERT INTO `weixin_item_tag` VALUES ('449', '588');
INSERT INTO `weixin_item_tag` VALUES ('449', '683');
INSERT INTO `weixin_item_tag` VALUES ('449', '724');
INSERT INTO `weixin_item_tag` VALUES ('449', '734');
INSERT INTO `weixin_item_tag` VALUES ('449', '817');
INSERT INTO `weixin_item_tag` VALUES ('449', '1133');
INSERT INTO `weixin_item_tag` VALUES ('450', '683');
INSERT INTO `weixin_item_tag` VALUES ('450', '724');
INSERT INTO `weixin_item_tag` VALUES ('450', '730');
INSERT INTO `weixin_item_tag` VALUES ('450', '734');
INSERT INTO `weixin_item_tag` VALUES ('450', '817');
INSERT INTO `weixin_item_tag` VALUES ('450', '1133');
INSERT INTO `weixin_item_tag` VALUES ('451', '678');
INSERT INTO `weixin_item_tag` VALUES ('451', '734');
INSERT INTO `weixin_item_tag` VALUES ('451', '764');
INSERT INTO `weixin_item_tag` VALUES ('451', '792');
INSERT INTO `weixin_item_tag` VALUES ('451', '892');
INSERT INTO `weixin_item_tag` VALUES ('451', '918');
INSERT INTO `weixin_item_tag` VALUES ('451', '1112');
INSERT INTO `weixin_item_tag` VALUES ('451', '1134');
INSERT INTO `weixin_item_tag` VALUES ('451', '1135');
INSERT INTO `weixin_item_tag` VALUES ('451', '1136');
INSERT INTO `weixin_item_tag` VALUES ('452', '1101');
INSERT INTO `weixin_item_tag` VALUES ('452', '1111');
INSERT INTO `weixin_item_tag` VALUES ('452', '1114');
INSERT INTO `weixin_item_tag` VALUES ('452', '1115');
INSERT INTO `weixin_item_tag` VALUES ('452', '1116');
INSERT INTO `weixin_item_tag` VALUES ('452', '1138');
INSERT INTO `weixin_item_tag` VALUES ('458', '706');
INSERT INTO `weixin_item_tag` VALUES ('458', '1111');
INSERT INTO `weixin_item_tag` VALUES ('458', '1114');
INSERT INTO `weixin_item_tag` VALUES ('458', '1115');
INSERT INTO `weixin_item_tag` VALUES ('458', '1116');
INSERT INTO `weixin_item_tag` VALUES ('459', '1111');
INSERT INTO `weixin_item_tag` VALUES ('459', '1114');
INSERT INTO `weixin_item_tag` VALUES ('459', '1115');
INSERT INTO `weixin_item_tag` VALUES ('459', '1116');
INSERT INTO `weixin_item_tag` VALUES ('459', '1138');
INSERT INTO `weixin_item_tag` VALUES ('460', '721');
INSERT INTO `weixin_item_tag` VALUES ('460', '757');
INSERT INTO `weixin_item_tag` VALUES ('460', '787');
INSERT INTO `weixin_item_tag` VALUES ('460', '853');
INSERT INTO `weixin_item_tag` VALUES ('460', '1139');
INSERT INTO `weixin_item_tag` VALUES ('460', '1140');
INSERT INTO `weixin_item_tag` VALUES ('460', '1141');
INSERT INTO `weixin_item_tag` VALUES ('461', '721');
INSERT INTO `weixin_item_tag` VALUES ('461', '787');
INSERT INTO `weixin_item_tag` VALUES ('461', '853');
INSERT INTO `weixin_item_tag` VALUES ('461', '1139');
INSERT INTO `weixin_item_tag` VALUES ('461', '1140');
INSERT INTO `weixin_item_tag` VALUES ('461', '1141');
INSERT INTO `weixin_item_tag` VALUES ('461', '1142');
INSERT INTO `weixin_item_tag` VALUES ('462', '678');
INSERT INTO `weixin_item_tag` VALUES ('462', '721');
INSERT INTO `weixin_item_tag` VALUES ('462', '787');
INSERT INTO `weixin_item_tag` VALUES ('462', '853');
INSERT INTO `weixin_item_tag` VALUES ('462', '1139');
INSERT INTO `weixin_item_tag` VALUES ('462', '1140');
INSERT INTO `weixin_item_tag` VALUES ('462', '1141');
INSERT INTO `weixin_item_tag` VALUES ('463', '727');
INSERT INTO `weixin_item_tag` VALUES ('463', '734');
INSERT INTO `weixin_item_tag` VALUES ('463', '1143');
INSERT INTO `weixin_item_tag` VALUES ('463', '1144');
INSERT INTO `weixin_item_tag` VALUES ('463', '1145');
INSERT INTO `weixin_item_tag` VALUES ('464', '727');
INSERT INTO `weixin_item_tag` VALUES ('464', '734');
INSERT INTO `weixin_item_tag` VALUES ('464', '1143');
INSERT INTO `weixin_item_tag` VALUES ('464', '1144');
INSERT INTO `weixin_item_tag` VALUES ('464', '1145');
INSERT INTO `weixin_item_tag` VALUES ('465', '727');
INSERT INTO `weixin_item_tag` VALUES ('465', '734');
INSERT INTO `weixin_item_tag` VALUES ('465', '1143');
INSERT INTO `weixin_item_tag` VALUES ('465', '1145');
INSERT INTO `weixin_item_tag` VALUES ('465', '1146');
INSERT INTO `weixin_item_tag` VALUES ('466', '1147');
INSERT INTO `weixin_item_tag` VALUES ('468', '673');
INSERT INTO `weixin_item_tag` VALUES ('468', '696');
INSERT INTO `weixin_item_tag` VALUES ('468', '1148');
INSERT INTO `weixin_item_tag` VALUES ('471', '673');
INSERT INTO `weixin_item_tag` VALUES ('471', '1150');
INSERT INTO `weixin_item_tag` VALUES ('471', '1151');
INSERT INTO `weixin_item_tag` VALUES ('471', '1152');
INSERT INTO `weixin_item_tag` VALUES ('472', '673');
INSERT INTO `weixin_item_tag` VALUES ('472', '1153');
INSERT INTO `weixin_item_tag` VALUES ('473', '673');
INSERT INTO `weixin_item_tag` VALUES ('473', '1154');
INSERT INTO `weixin_item_tag` VALUES ('474', '673');
INSERT INTO `weixin_item_tag` VALUES ('474', '690');
INSERT INTO `weixin_item_tag` VALUES ('474', '1155');
INSERT INTO `weixin_item_tag` VALUES ('475', '594');
INSERT INTO `weixin_item_tag` VALUES ('475', '763');
INSERT INTO `weixin_item_tag` VALUES ('475', '1156');
INSERT INTO `weixin_item_tag` VALUES ('475', '1157');
INSERT INTO `weixin_item_tag` VALUES ('475', '1158');
INSERT INTO `weixin_item_tag` VALUES ('476', '588');
INSERT INTO `weixin_item_tag` VALUES ('476', '594');
INSERT INTO `weixin_item_tag` VALUES ('476', '763');
INSERT INTO `weixin_item_tag` VALUES ('476', '1157');
INSERT INTO `weixin_item_tag` VALUES ('476', '1158');
INSERT INTO `weixin_item_tag` VALUES ('477', '594');
INSERT INTO `weixin_item_tag` VALUES ('477', '763');
INSERT INTO `weixin_item_tag` VALUES ('477', '1157');
INSERT INTO `weixin_item_tag` VALUES ('477', '1158');
INSERT INTO `weixin_item_tag` VALUES ('478', '763');
INSERT INTO `weixin_item_tag` VALUES ('478', '1117');
INSERT INTO `weixin_item_tag` VALUES ('478', '1159');
INSERT INTO `weixin_item_tag` VALUES ('478', '1160');
INSERT INTO `weixin_item_tag` VALUES ('479', '547');
INSERT INTO `weixin_item_tag` VALUES ('479', '725');
INSERT INTO `weixin_item_tag` VALUES ('479', '734');
INSERT INTO `weixin_item_tag` VALUES ('479', '763');
INSERT INTO `weixin_item_tag` VALUES ('479', '1090');
INSERT INTO `weixin_item_tag` VALUES ('479', '1161');
INSERT INTO `weixin_item_tag` VALUES ('480', '547');
INSERT INTO `weixin_item_tag` VALUES ('480', '588');
INSERT INTO `weixin_item_tag` VALUES ('480', '725');
INSERT INTO `weixin_item_tag` VALUES ('480', '734');
INSERT INTO `weixin_item_tag` VALUES ('480', '1090');
INSERT INTO `weixin_item_tag` VALUES ('480', '1139');
INSERT INTO `weixin_item_tag` VALUES ('480', '1140');
INSERT INTO `weixin_item_tag` VALUES ('480', '1161');
INSERT INTO `weixin_item_tag` VALUES ('481', '547');
INSERT INTO `weixin_item_tag` VALUES ('481', '588');
INSERT INTO `weixin_item_tag` VALUES ('481', '725');
INSERT INTO `weixin_item_tag` VALUES ('481', '734');
INSERT INTO `weixin_item_tag` VALUES ('481', '1090');
INSERT INTO `weixin_item_tag` VALUES ('481', '1161');
INSERT INTO `weixin_item_tag` VALUES ('482', '547');
INSERT INTO `weixin_item_tag` VALUES ('482', '725');
INSERT INTO `weixin_item_tag` VALUES ('482', '734');
INSERT INTO `weixin_item_tag` VALUES ('482', '825');
INSERT INTO `weixin_item_tag` VALUES ('482', '1090');
INSERT INTO `weixin_item_tag` VALUES ('482', '1161');
INSERT INTO `weixin_item_tag` VALUES ('483', '951');
INSERT INTO `weixin_item_tag` VALUES ('483', '1121');
INSERT INTO `weixin_item_tag` VALUES ('483', '1162');
INSERT INTO `weixin_item_tag` VALUES ('483', '1163');
INSERT INTO `weixin_item_tag` VALUES ('483', '1164');
INSERT INTO `weixin_item_tag` VALUES ('484', '951');
INSERT INTO `weixin_item_tag` VALUES ('484', '1121');
INSERT INTO `weixin_item_tag` VALUES ('484', '1163');
INSERT INTO `weixin_item_tag` VALUES ('484', '1164');
INSERT INTO `weixin_item_tag` VALUES ('485', '951');
INSERT INTO `weixin_item_tag` VALUES ('485', '1121');
INSERT INTO `weixin_item_tag` VALUES ('485', '1163');
INSERT INTO `weixin_item_tag` VALUES ('485', '1164');
INSERT INTO `weixin_item_tag` VALUES ('486', '895');
INSERT INTO `weixin_item_tag` VALUES ('486', '951');
INSERT INTO `weixin_item_tag` VALUES ('486', '1163');
INSERT INTO `weixin_item_tag` VALUES ('486', '1164');
INSERT INTO `weixin_item_tag` VALUES ('486', '1165');
INSERT INTO `weixin_item_tag` VALUES ('487', '951');
INSERT INTO `weixin_item_tag` VALUES ('487', '1121');
INSERT INTO `weixin_item_tag` VALUES ('487', '1163');
INSERT INTO `weixin_item_tag` VALUES ('487', '1164');
INSERT INTO `weixin_item_tag` VALUES ('488', '763');
INSERT INTO `weixin_item_tag` VALUES ('488', '780');
INSERT INTO `weixin_item_tag` VALUES ('488', '951');
INSERT INTO `weixin_item_tag` VALUES ('488', '1163');
INSERT INTO `weixin_item_tag` VALUES ('488', '1164');
INSERT INTO `weixin_item_tag` VALUES ('489', '951');
INSERT INTO `weixin_item_tag` VALUES ('489', '1166');
INSERT INTO `weixin_item_tag` VALUES ('489', '1167');
INSERT INTO `weixin_item_tag` VALUES ('490', '951');
INSERT INTO `weixin_item_tag` VALUES ('490', '1121');
INSERT INTO `weixin_item_tag` VALUES ('490', '1163');
INSERT INTO `weixin_item_tag` VALUES ('490', '1164');
INSERT INTO `weixin_item_tag` VALUES ('490', '1168');
INSERT INTO `weixin_item_tag` VALUES ('491', '1121');
INSERT INTO `weixin_item_tag` VALUES ('491', '1163');
INSERT INTO `weixin_item_tag` VALUES ('491', '1164');
INSERT INTO `weixin_item_tag` VALUES ('491', '1169');

-- ----------------------------
-- Table structure for weixin_item_userprice
-- ----------------------------
DROP TABLE IF EXISTS `weixin_item_userprice`;
CREATE TABLE `weixin_item_userprice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL COMMENT '商品id',
  `cate_id` int(10) NOT NULL COMMENT '会员组id',
  `user_price` decimal(10,2) DEFAULT NULL COMMENT '会员组价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_item_userprice
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_keyword
-- ----------------------------
DROP TABLE IF EXISTS `weixin_keyword`;
CREATE TABLE `weixin_keyword` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kename` varchar(300) DEFAULT NULL,
  `kecontent` varchar(500) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `imageinfo` varchar(1000) DEFAULT NULL,
  `linkinfo` varchar(1000) DEFAULT NULL,
  `ismess` tinyint(1) DEFAULT NULL,
  `isfollow` tinyint(1) DEFAULT NULL,
  `iskey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_keyword
-- ----------------------------
INSERT INTO `weixin_keyword` VALUES ('95', null, null, '2', null, 'a:3:{i:0;s:30:\"欢迎关注我的微信号码\";i:1;s:36:\"多谢关注，送上优惠信息了\";i:2;s:12:\"新品推荐\";}', 'a:3:{i:0;s:45:\"data/upload/keyword/1401/07/52cbc52384c65.jpg\";i:1;s:45:\"data/upload/keyword/1401/07/52cbc4f80776c.jpg\";i:2;s:45:\"data/upload/keyword/1401/07/52cbc52384c65.jpg\";}', 'a:3:{i:0;s:21:\"http://www.maoyan..in\";i:1;s:46:\"http://116.255.165.64/index.php?m=book&a=index\";i:2;s:46:\"http://116.255.165.64/index.php?m=book&a=index\";}', null, '1', null);
INSERT INTO `weixin_keyword` VALUES ('93', '欢迎光临', '您好，欢迎光临<a href=\"/\">温馨小店</a>', '1', '你好 您好', '', '', '', null, null, '1');
INSERT INTO `weixin_keyword` VALUES ('94', null, null, '2', null, 'a:3:{i:0;s:39:\"您好，进入商城优惠多多哦！\";i:1;s:12:\"热门优惠\";i:2;s:12:\"温馨家居\";}', 'a:3:{i:0;s:45:\"data/upload/keyword/1401/07/52cbb0f95d5fd.jpg\";i:1;s:45:\"data/upload/keyword/1401/07/52cbc52a91bf4.jpg\";i:2;s:45:\"data/upload/keyword/1401/07/52cbc52384c65.jpg\";}', 'a:3:{i:0;s:41:\"http://maoyan.in/index.php?m=book&a=index\";i:1;s:14:\"www.taobao.com\";i:2;s:46:\"http://116.255.165.64/index.php?m=book&a=index\";}', '1', null, null);
INSERT INTO `weixin_keyword` VALUES ('96', 'test1', '是个大坏蛋', '1', 'wangzheng', '', '', '', null, null, '1');

-- ----------------------------
-- Table structure for weixin_mail_queue
-- ----------------------------
DROP TABLE IF EXISTS `weixin_mail_queue`;
CREATE TABLE `weixin_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_mail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_menu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_menu`;
CREATE TABLE `weixin_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `action_name` varchar(20) NOT NULL,
  `data` varchar(120) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `often` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_menu
-- ----------------------------
INSERT INTO `weixin_menu` VALUES ('1', '全局', '0', 'setting', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('2', '核心设置', '1', 'setting', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('3', '全局参数', '148', 'setting', 'index', '&type=site', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('4', '邮件设置', '148', 'setting', 'index', '&type=mail', '', '0', '5', '1');
INSERT INTO `weixin_menu` VALUES ('172', '专辑管理', '285', 'album', 'index', '', '', '0', '4', '1');
INSERT INTO `weixin_menu` VALUES ('6', '菜单管理', '2', 'menu', 'index', '', '', '0', '7', '1');
INSERT INTO `weixin_menu` VALUES ('7', '新增', '6', 'menu', 'add', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('8', '编辑', '6', 'menu', 'edit', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('9', '删除', '6', 'menu', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('10', '运营', '0', 'operate', 'index', '', '', '0', '4', '1');
INSERT INTO `weixin_menu` VALUES ('11', '广告管理', '10', 'advert', 'index', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('12', '广告管理', '11', 'ad', 'index', '', '', '5', '0', '1');
INSERT INTO `weixin_menu` VALUES ('13', '广告位管理', '11', 'adboard', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('14', '友情链接', '10', 'flink', 'index', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('15', '友情链接', '14', 'flink', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('16', '链接分类', '14', 'flink_cate', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('17', '新增', '15', 'flink', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('18', '编辑', '15', 'flink', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('19', '删除', '15', 'flink', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('20', '新增', '16', 'flink_cate', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('21', '编辑', '16', 'flink_cate', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('22', '删除', '16', 'flink_cate', 'del', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('23', '新增', '12', 'ad', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('24', '编辑', '12', 'ad', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('25', '删除', '12', 'ad', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('26', '新增', '13', 'adboard', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('27', '编辑', '13', 'adboard', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('28', '删除', '13', 'adboard', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('29', '数据', '0', 'data', 'index', '', '', '0', '5', '1');
INSERT INTO `weixin_menu` VALUES ('258', '商品分类', '256', 'score_item_cate', 'index', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('31', '数据库管理', '29', 'backup', 'index', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('32', '数据备份', '31', 'backup', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('33', '数据恢复', '31', 'backup', 'restore', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('34', '缓存管理', '254', 'cache', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('195', '登陆接口', '245', 'oauth', 'index', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('36', '黑名单管理', '117', 'ipban', 'index', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('37', '新增', '36', 'ipban', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('38', '编辑', '36', 'ipban', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('50', '商品', '0', 'content', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('51', '商品管理', '50', 'article', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('52', '商品管理', '51', 'item', 'index', '', '', '1', '1', '1');
INSERT INTO `weixin_menu` VALUES ('54', '编辑', '52', 'article', 'edit', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('190', '删除', '52', 'item', 'delete', '', '', '0', '4', '0');
INSERT INTO `weixin_menu` VALUES ('56', '商品分类', '51', 'item_cate', 'index', '', '', '1', '6', '1');
INSERT INTO `weixin_menu` VALUES ('57', '新增', '56', 'article_cate', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('58', '编辑', '56', 'article_cate', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('59', '删除', '56', 'article_cate', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('60', '管理员管理', '1', 'admin', 'index', '', '', '0', '4', '1');
INSERT INTO `weixin_menu` VALUES ('61', '管理员管理', '60', 'admin', 'index', '', '', '7', '0', '1');
INSERT INTO `weixin_menu` VALUES ('62', '新增', '61', 'admin', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('63', '编辑', '61', 'admin', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('64', '删除', '61', 'admin', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('65', '角色管理', '60', 'admin_role', 'index', '', '', '7', '0', '1');
INSERT INTO `weixin_menu` VALUES ('66', '新增', '65', 'admin_role', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('192', '淘宝采集', '164', 'collect_alimama', 'index', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('70', '用户', '0', 'user', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('119', '新增', '149', 'user', 'add', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('118', '编辑', '149', 'user', 'edit', '', '', '0', '4', '0');
INSERT INTO `weixin_menu` VALUES ('117', '会员管理', '70', 'user', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('156', '文章分类', '154', 'article_cate', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('151', '导航设置', '216', 'nav', 'index', '', '', '0', '1', '0');
INSERT INTO `weixin_menu` VALUES ('149', '会员管理', '117', 'user', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('150', '删除', '149', 'user', 'delete', '', '', '0', '5', '0');
INSERT INTO `weixin_menu` VALUES ('152', '主导航', '151', 'nav', 'index', '&type=main', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('153', '底部导航', '151', 'nav', 'index', '&type=bottom', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('154', '文章管理', '10', 'article', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('155', '文章管理', '154', 'article', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('148', '站点设置', '2', 'setting', 'index', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('157', '添加文章', '155', 'article', 'add', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('158', '编辑', '155', 'article', 'edit', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('159', '删除', '155', 'article', 'delete', '', '', '0', '4', '0');
INSERT INTO `weixin_menu` VALUES ('160', '新增', '156', 'article_cate', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('161', '编辑', '156', 'article_cate', '编辑', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('162', '删除', '156', 'article_cate', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('164', '商品采集', '50', 'item_collect', 'index', '', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('173', '专辑管理', '172', 'album', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('174', '专辑分类', '172', 'album_cate', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('175', '新增', '174', 'album_cate', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('176', '编辑', '174', 'album_cate', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('177', '删除', '174', 'album_cate', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('178', '敏感词管理', '254', 'badword', 'index', '', '', '0', '4', '1');
INSERT INTO `weixin_menu` VALUES ('179', '新增', '178', 'badword', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('180', '编辑', '178', 'badword', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('181', '删除', '36', 'ipban', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('182', '删除', '178', 'badword', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('255', '采集马甲', '117', 'auto_user', 'index', '', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('184', '标签管理', '254', 'tag', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('185', '商品接口', '245', 'item_site', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('186', '商品评论', '51', 'item_comment', 'index', '', '', '0', '7', '0');
INSERT INTO `weixin_menu` VALUES ('187', '删除', '186', 'item_comment', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('265', '删除', '257', 'score_item', 'edit', '', '', '0', '4', '0');
INSERT INTO `weixin_menu` VALUES ('250', '一键删除', '51', 'item', 'delete_search', '', '', '0', '5', '0');
INSERT INTO `weixin_menu` VALUES ('198', '新增', '196', 'message', 'add', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('199', '商品来源', '51', 'item_orig', 'index', '', '', '0', '6', '0');
INSERT INTO `weixin_menu` VALUES ('200', '新增', '199', 'item_orig', 'add', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('201', '编辑', '199', 'item_orig', 'edit', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('202', '删除', '199', 'item_orig', 'delete', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('203', '商品审核', '51', 'item', 'check', '', '', '0', '5', '0');
INSERT INTO `weixin_menu` VALUES ('249', '添加商品', '51', 'item', 'add', '', '', '1', '3', '1');
INSERT INTO `weixin_menu` VALUES ('259', '新增', '258', 'score_item_cate', 'add', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('268', '批量添加', '164', 'collect_batch', 'index', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('269', '积分设置', '2', 'score', 'setting', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('210', '专辑审核', '172', 'album', 'check', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('257', '积分商品', '256', 'score_item', 'index', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('212', '日志管理', '29', 'log', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('213', '管理员日志', '212', 'log', 'index', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('214', '用户日志', '212', 'log', 'user', '', '', '0', '0', '1');
INSERT INTO `weixin_menu` VALUES ('215', '积分日志', '212', 'log', 'score', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('216', '界面设置', '1', 'setting', 'index', '&type=show', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('256', '积分商城', '70', 'score_item', 'index', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('254', '系统数据', '29', 'tag', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('264', '编辑', '257', 'score_item', 'edit', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('263', '添加商品', '257', 'score_item', 'add', '', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('262', '积分订单', '256', 'score_order', 'index', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('261', '删除', '258', 'score_item_cate', 'delete', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('260', '编辑', '258', 'score_item_cate', 'edit', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('232', '站内信管理', '70', 'message', 'index', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('233', '系统通知', '232', 'message', 'index', '&type=1', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('234', '用户私信', '232', 'message', 'index', '&type=2', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('235', '通知模版', '2', 'message_tpl', 'index', '&type=msg', '', '0', '4', '0');
INSERT INTO `weixin_menu` VALUES ('236', '添加模版', '235', 'message_tpl', 'add', '', '', '0', '7', '0');
INSERT INTO `weixin_menu` VALUES ('237', '编辑', '235', 'message_tpl', 'edit', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('238', '删除', '235', 'message_tpl', 'delete', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('240', '单页管理', '154', 'article', 'page', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('242', '积分记录', '269', 'score', 'logs', '', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('244', '应用', '0', 'plugin', 'index', '', '', '0', '6', '1');
INSERT INTO `weixin_menu` VALUES ('245', '系统接口', '244', 'apis', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('246', '应用管理', '244', 'plugin', 'index', '', '', '0', '3', '0');
INSERT INTO `weixin_menu` VALUES ('247', '应用中心', '246', 'plugin', 'index', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('248', '已安装应用', '246', 'plugin', 'list', '', '', '0', '0', '0');
INSERT INTO `weixin_menu` VALUES ('252', '用户整合', '245', 'integrate', 'index', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('253', '图片模式', '52', 'item', 'index', '&sm=image', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('267', '批量注册', '149', 'user', 'add_users', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('270', '邮件模板', '235', 'message_tpl', 'index', '&type=mail', '', '0', '6', '0');
INSERT INTO `weixin_menu` VALUES ('271', '短消息模板', '235', 'message_tpl', 'index', '&type=msg', '', '0', '5', '0');
INSERT INTO `weixin_menu` VALUES ('272', '附件设置', '148', 'setting', 'index', '&type=attachment', '', '0', '4', '1');
INSERT INTO `weixin_menu` VALUES ('273', '显示设置', '216', 'setting', 'index', '&type=style', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('274', '模板管理', '216', 'template', 'index', '', '', '0', '3', '1');
INSERT INTO `weixin_menu` VALUES ('275', '站点设置', '148', 'setting', 'index', '', '', '6', '1', '1');
INSERT INTO `weixin_menu` VALUES ('276', '积分设置', '269', 'score', 'setting', '', '', '0', '1', '0');
INSERT INTO `weixin_menu` VALUES ('277', '商品管理', '52', 'item', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('278', '文章管理', '155', 'article', 'index', '', '', '0', '1', '1');
INSERT INTO `weixin_menu` VALUES ('279', '会员管理', '149', 'user', 'index', '', '', '3', '1', '1');
INSERT INTO `weixin_menu` VALUES ('280', '积分商品', '257', 'score_item', 'index', '', '', '0', '1', '0');
INSERT INTO `weixin_menu` VALUES ('281', '淘宝评论', '164', 'cmt_taobao', 'index', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('282', 'SEO设置', '2', 'seo', 'url', '', '', '0', '5', '1');
INSERT INTO `weixin_menu` VALUES ('283', 'UR静态化', '282', 'seo', 'url', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('284', '页面SEO', '282', 'seo', 'page', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('285', '专辑', '0', 'album', 'index', '', '', '0', '2', '0');
INSERT INTO `weixin_menu` VALUES ('286', '注册登陆', '2', 'setting', 'user', '', '', '6', '2', '1');
INSERT INTO `weixin_menu` VALUES ('293', '编辑', '291', 'brandlist', ' edit', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('292', '新增', '291', 'brandlist', 'add', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('291', '品牌管理', '51', 'brandlist', 'index', '', '', '1', '1', '1');
INSERT INTO `weixin_menu` VALUES ('294', '删除', '291', 'brandlist', 'delete', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('295', '交易管理', '50', 'item_order', 'index', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('296', '订单管理', '295', 'item_order', 'index', '', '', '2', '255', '1');
INSERT INTO `weixin_menu` VALUES ('297', '快递方式管理', '295', 'delivery', 'index', '', '', '2', '255', '1');
INSERT INTO `weixin_menu` VALUES ('298', '发货地址管理', '295', 'address', 'index', '', '', '2', '255', '1');
INSERT INTO `weixin_menu` VALUES ('299', '微信回复', '0', 'keyword', 'index', '', '', '0', '2', '1');
INSERT INTO `weixin_menu` VALUES ('300', '回复设置', '299', 'keyword', 'index', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('301', '关键词自动回复', '300', 'keyword', 'addkeyword', '', '', '4', '255', '1');
INSERT INTO `weixin_menu` VALUES ('302', '消息自动回复', '300', 'keyword', 'addmess', '', '', '4', '255', '1');
INSERT INTO `weixin_menu` VALUES ('303', '关注自动回复', '300', 'keyword', 'addfollow', '', '', '4', '255', '1');
INSERT INTO `weixin_menu` VALUES ('304', '支付宝设置', '295', 'alipay', 'index', '', '', '2', '255', '1');
INSERT INTO `weixin_menu` VALUES ('305', '自定义菜单', '300', 'custom_menu', 'index', '', '', '4', '255', '1');
INSERT INTO `weixin_menu` VALUES ('306', '添加', '305', 'custom_menu', 'add', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('307', '编辑', '305', 'custom_menu', 'edit', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('308', '删除', '305', 'custom_menu', 'delete', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('310', '管理', '302', 'keyword', 'showmess', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('309', '编辑', '301', 'keyword', 'addkeyword_ajax', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('311', '管理', '303', 'keyword', 'showfollow', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('312', '图片选择', '301', 'keyword', 'allimages', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('313', '图片上传', '301', 'keyword', 'ajaxupload', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('314', '图片删除', '301', 'keyword', 'delimg', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('315', '单页编辑', '240', 'article', 'page_edit', '', '', '0', '255', '0');
INSERT INTO `weixin_menu` VALUES ('316', '微信支付设置', '295', 'wxpay', 'index', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('318', '会员组管理', '117', 'user_category', 'index', '', '会员组管理', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('319', '营销互动', '10', 'yingxiao', 'index', '', '营销互动功能', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('320', '大转盘', '319', 'zhuanpan', 'index', '', '大转盘', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('321', '大转盘设置', '320', 'zhuanpan', 'index', '', '设置', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('322', '中奖记录', '320', 'zhuanpan', 'log', '', '中奖记录', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('323', '会员账户', '117', 'account', 'index', '', '账户', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('324', '会员账户', '321', 'account', 'index', '', '会员账户', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('325', '充值记录', '321', 'account', 'log', '', '充值记录', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('326', '商品入库', '51', 'item', 'purchase', '', '', '0', '255', '1');
INSERT INTO `weixin_menu` VALUES ('327', '商品初使化', '51', 'item', 'crawler', '', '', '0', '255', '1');

-- ----------------------------
-- Table structure for weixin_message
-- ----------------------------
DROP TABLE IF EXISTS `weixin_message`;
CREATE TABLE `weixin_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ftid` int(10) unsigned NOT NULL,
  `from_id` int(10) NOT NULL,
  `from_name` varchar(50) NOT NULL,
  `to_id` int(10) NOT NULL,
  `to_name` varchar(50) NOT NULL,
  `add_time` int(10) NOT NULL,
  `info` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_message
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_message_tpl
-- ----------------------------
DROP TABLE IF EXISTS `weixin_message_tpl`;
CREATE TABLE `weixin_message_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_message_tpl
-- ----------------------------
INSERT INTO `weixin_message_tpl` VALUES ('1', 'msg', '1', '登录', 'login', '<p>\r\n	欢迎\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">拼品网是一个集购物与分享与一体的网站，它会带给你惊喜，它让你与心仪的宝贝不期而遇，同时和朋友一起逛，分享每一次的购物乐趣，惊喜不断<span>~</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">为了更好地开始专属于你的购物之旅，你可以：</span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">1<span>、发现更多美好</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">2<span>、寻找喜好相投的好友</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">4<span>、创建属于自己的专辑</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">5<span>、邀请你的好友一起发现美丽</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">6<span>、分享更多好东西</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">欢迎联系使用拼品网，我们随时恭候你的提问和建议。</span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">祝您玩的愉快<span>^^</span></span> \r\n	</p>\r\n</div>\r\n<p>\r\n	<br />\r\n</p>');
INSERT INTO `weixin_message_tpl` VALUES ('3', 'mail', '1', '找回密码', 'findpwd', '<p>\r\n	尊敬的{$username}:\r\n</p>\r\n<p style=\"padding-left:30px;\">\r\n	您好, 您刚才在 {$site_name} 申请了重置密码，请点击下面的链接进行重置：\r\n</p>\r\n<p style=\"padding-left:30px;\">\r\n	<a href=\"{$reset_url}\">{$reset_url}</a> \r\n</p>\r\n<p style=\"padding-left:30px;\">\r\n	此链接只能使用一次, 如果失效请重新申请. 如果以上链接无法点击，请将它拷贝到浏览器(例如IE)的地址栏中。\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$send_time}\r\n</p>');

-- ----------------------------
-- Table structure for weixin_nav
-- ----------------------------
DROP TABLE IF EXISTS `weixin_nav`;
CREATE TABLE `weixin_nav` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `mod` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_nav
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_oauth
-- ----------------------------
DROP TABLE IF EXISTS `weixin_oauth`;
CREATE TABLE `weixin_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `weixin_order_detail`;
CREATE TABLE `weixin_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `itemId` int(11) NOT NULL COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `item_attr` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品属性',
  `original_price` decimal(10,0) DEFAULT '0',
  `purchase_price` decimal(10,0) DEFAULT NULL COMMENT '进价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of weixin_order_detail
-- ----------------------------
INSERT INTO `weixin_order_detail` VALUES ('3', '201410141012251121', '194', '黑人 DARLIE 黑人 超白青柠薄荷牙膏 90g', '1410/08/5434d2df78316.jpg', '8.60', '1', '', null, null);
INSERT INTO `weixin_order_detail` VALUES ('4', '201410142323311318', '192', '云南白药 金口健牙膏 105g 激爽薄荷 ', '1410/08/5434d25eba03e.jpg', '15.20', '1', '', null, null);
INSERT INTO `weixin_order_detail` VALUES ('5', '201410142330141034', '195', '佳洁士 草本水晶啫喱牙膏 90g 清爽薄荷 ', '1410/08/5434d31c762a9.jpg', '2.90', '1', '', null, null);
INSERT INTO `weixin_order_detail` VALUES ('6', '201412031440491565', '419', 'WIN2 脆果 草莓味（马来西亚进口）', '1411/02/5455aa4b20f06.jpg', '5.90', '1', '', '0', null);
INSERT INTO `weixin_order_detail` VALUES ('7', '201412061358151386', '422', 'win2 脆果 香兰味饼干', '1411/02/5455b7ad4e992.png', '5.90', '1', '', '0', null);
INSERT INTO `weixin_order_detail` VALUES ('8', '201412061406561785', '408', '香港进口lafei拉菲原味营养麦片（原味）', '1411/01/5454c701ba2a0.jpg', '16.90', '2', '', '0', null);

-- ----------------------------
-- Table structure for weixin_pay
-- ----------------------------
DROP TABLE IF EXISTS `weixin_pay`;
CREATE TABLE `weixin_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '支付方式名称',
  `pay_type` varchar(800) DEFAULT NULL COMMENT '支付类型',
  `config` varchar(255) DEFAULT NULL COMMENT '支付参数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_pay
-- ----------------------------
INSERT INTO `weixin_pay` VALUES ('1', '微信支付', 'wxpay', 'a:5:{s:5:\"appid\";s:18:\"wx13d600977c4553ce\";s:9:\"appsecret\";s:32:\"caeb3ad6898a86f49a4a807e732948b3\";s:7:\"signkey\";s:1:\"1\";s:9:\"partnerid\";s:1:\"1\";s:10:\"partnerkey\";s:1:\"1\";}', '0', '255');
INSERT INTO `weixin_pay` VALUES ('2', '手机支付宝', 'alipay', 'a:3:{s:10:\"alipayname\";s:22:\"service@maoyanjing.com\";s:7:\"partner\";s:16:\"2088611187954811\";s:3:\"key\";s:32:\"k6oeipzbjtgrete8w6e4q6gx69c0x47p\";}', '1', '255');

-- ----------------------------
-- Table structure for weixin_score_item
-- ----------------------------
DROP TABLE IF EXISTS `weixin_score_item`;
CREATE TABLE `weixin_score_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：实物；1：虚拟',
  `img` varchar(255) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_num` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `buy_num` mediumint(8) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_score_item
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_score_item_cate
-- ----------------------------
DROP TABLE IF EXISTS `weixin_score_item_cate`;
CREATE TABLE `weixin_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_score_item_cate
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_score_log
-- ----------------------------
DROP TABLE IF EXISTS `weixin_score_log`;
CREATE TABLE `weixin_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_score_order
-- ----------------------------
DROP TABLE IF EXISTS `weixin_score_order`;
CREATE TABLE `weixin_score_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `item_num` mediumint(8) NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_score` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_score_order
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_setting
-- ----------------------------
DROP TABLE IF EXISTS `weixin_setting`;
CREATE TABLE `weixin_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_setting
-- ----------------------------
INSERT INTO `weixin_setting` VALUES ('site_name', '猫眼', '');
INSERT INTO `weixin_setting` VALUES ('site_title', '猫眼商城', '');
INSERT INTO `weixin_setting` VALUES ('site_keyword', '日用品，纸品，清洁用品', '');
INSERT INTO `weixin_setting` VALUES ('site_description', '专注百货零售', '');
INSERT INTO `weixin_setting` VALUES ('site_status', '1', '');
INSERT INTO `weixin_setting` VALUES ('closed_reason', '网站升级中。。', '');
INSERT INTO `weixin_setting` VALUES ('site_icp', '', '');
INSERT INTO `weixin_setting` VALUES ('statistics_code', '', '');
INSERT INTO `weixin_setting` VALUES ('statics_url', '', '');
INSERT INTO `weixin_setting` VALUES ('mail_server', 'a:6:{s:4:\"mode\";s:4:\"smtp\";s:4:\"host\";s:11:\"smtp.qq.com\";s:4:\"port\";s:3:\"465\";s:4:\"from\";s:20:\"admin@lushuncheng.cn\";s:13:\"auth_username\";s:20:\"admin@lushuncheng.cn\";s:13:\"auth_password\";s:13:\"lscgzwd123/*+\";}', '');
INSERT INTO `weixin_setting` VALUES ('item_check', '0', '');
INSERT INTO `weixin_setting` VALUES ('score_rule', 'a:16:{s:8:\"register\";s:2:\"20\";s:13:\"register_nums\";s:1:\"1\";s:5:\"login\";s:2:\"10\";s:10:\"login_nums\";s:1:\"5\";s:7:\"pubitem\";s:2:\"20\";s:12:\"pubitem_nums\";s:2:\"10\";s:8:\"likeitem\";s:1:\"1\";s:13:\"likeitem_nums\";s:2:\"20\";s:9:\"joinalbum\";s:1:\"2\";s:14:\"joinalbum_nums\";s:2:\"10\";s:6:\"fwitem\";s:1:\"2\";s:11:\"fwitem_nums\";s:2:\"10\";s:6:\"pubcmt\";s:1:\"1\";s:11:\"pubcmt_nums\";s:1:\"5\";s:7:\"delitem\";s:3:\"-20\";s:12:\"delitem_nums\";s:3:\"100\";}', '');
INSERT INTO `weixin_setting` VALUES ('album_cover_items', '5', '专辑封面显示图片数量');
INSERT INTO `weixin_setting` VALUES ('integrate_code', 'default', '');
INSERT INTO `weixin_setting` VALUES ('integrate_config', '', '');
INSERT INTO `weixin_setting` VALUES ('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', '');
INSERT INTO `weixin_setting` VALUES ('wall_spage_max', '5', '');
INSERT INTO `weixin_setting` VALUES ('wall_spage_size', '50', '');
INSERT INTO `weixin_setting` VALUES ('book_page_max', '100', '');
INSERT INTO `weixin_setting` VALUES ('default_keyword', '懒得逛了，我搜~', '');
INSERT INTO `weixin_setting` VALUES ('album_default_title', '默认专辑', '');
INSERT INTO `weixin_setting` VALUES ('avatar_size', '24,32,48,64,100,200', '');
INSERT INTO `weixin_setting` VALUES ('attr_allow_exts', 'jpg,gif,png,jpeg,swf', '');
INSERT INTO `weixin_setting` VALUES ('attr_allow_size', '2048', '');
INSERT INTO `weixin_setting` VALUES ('itemcate_img', 'a:2:{s:5:\"width\";s:3:\"280\";s:6:\"height\";s:3:\"280\";}', '');
INSERT INTO `weixin_setting` VALUES ('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击\"立即注册\"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布***秽、色情、赌博、******、******、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、***扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、***扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', '');
INSERT INTO `weixin_setting` VALUES ('item_cover_comments', '2', '');
INSERT INTO `weixin_setting` VALUES ('user_intro_default', '这个家伙太懒，什么都木留下~', '');
INSERT INTO `weixin_setting` VALUES ('ipban_switch', '1', '');
INSERT INTO `weixin_setting` VALUES ('score_item_img', 'a:4:{s:6:\"swidth\";s:3:\"210\";s:7:\"sheight\";s:3:\"210\";s:6:\"bwidth\";s:3:\"350\";s:7:\"bheight\";s:3:\"350\";}', '');
INSERT INTO `weixin_setting` VALUES ('seo_config', 'a:6:{s:4:\"book\";a:3:{s:5:\"title\";s:23:\"{tag_name}-{site_title}\";s:8:\"keywords\";s:23:\"逛宝贝，{site_name}\";s:11:\"description\";s:18:\"{site_description}\";}s:4:\"cate\";a:3:{s:5:\"title\";s:23:\"{cate_name}-{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:5:\"album\";a:3:{s:5:\"title\";s:6:\"专辑\";s:8:\"keywords\";s:47:\"{site_name},购物分享,淘宝网购物,专辑\";s:11:\"description\";s:18:\"{site_description}\";}s:10:\"album_cate\";a:3:{s:5:\"title\";s:11:\"{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:12:\"album_detail\";a:3:{s:5:\"title\";s:13:\"{album_title}\";s:8:\"keywords\";s:13:\"{album_intro}\";s:11:\"description\";s:23:\"杂志详细Description\";}s:4:\"item\";a:3:{s:5:\"title\";s:12:\"{item_title}\";s:8:\"keywords\";s:10:\"{item_tag}\";s:11:\"description\";s:12:\"{item_intro}\";}}', '');
INSERT INTO `weixin_setting` VALUES ('item_img', 'a:2:{s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";}', '');
INSERT INTO `weixin_setting` VALUES ('item_simg', 'a:2:{s:5:\"width\";s:3:\"220\";s:6:\"height\";s:3:\"220\";}', '');
INSERT INTO `weixin_setting` VALUES ('item_bimg', 'a:2:{s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"600\";}', '');
INSERT INTO `weixin_setting` VALUES ('attach_path', 'data/upload/', '');
INSERT INTO `weixin_setting` VALUES ('wall_distance', '500', '');
INSERT INTO `weixin_setting` VALUES ('reg_status', '1', '');
INSERT INTO `weixin_setting` VALUES ('reg_closed_reason', '<h1>暂时关闭注册</h1>', '');
INSERT INTO `weixin_setting` VALUES ('index_wall', '1', '');
INSERT INTO `weixin_setting` VALUES ('weixin_img', '1408/14/53ecd22ba19eb.jpg', '');
INSERT INTO `weixin_setting` VALUES ('weixinshop_img', '1408/14/53ecd22bab1bf.jpg', '');
INSERT INTO `weixin_setting` VALUES ('appid', 'wx13d600977c4553ce', '');
INSERT INTO `weixin_setting` VALUES ('appsecret', 'caeb3ad6898a86f49a4a807e732948b3', '');
INSERT INTO `weixin_setting` VALUES ('score_percentage', '0.1', '积分比设置');
INSERT INTO `weixin_setting` VALUES ('alipayhome', '', '收款主页');
INSERT INTO `weixin_setting` VALUES ('pay2home', '', '第二收款主页');
INSERT INTO `weixin_setting` VALUES ('qqcode', '', 'QQ二维码链接');

-- ----------------------------
-- Table structure for weixin_store
-- ----------------------------
DROP TABLE IF EXISTS `weixin_store`;
CREATE TABLE `weixin_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `tel` varchar(20) NOT NULL COMMENT '店铺电话',
  `Province` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `address` text NOT NULL COMMENT '店铺地址',
  `info` text NOT NULL COMMENT '店铺介绍',
  `status` tinyint(2) unsigned NOT NULL COMMENT '店铺状态',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_store
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_tag
-- ----------------------------
DROP TABLE IF EXISTS `weixin_tag`;
CREATE TABLE `weixin_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_tag
-- ----------------------------
INSERT INTO `weixin_tag` VALUES ('536', '300');
INSERT INTO `weixin_tag` VALUES ('537', '源码');
INSERT INTO `weixin_tag` VALUES ('538', '支付');
INSERT INTO `weixin_tag` VALUES ('539', '支持');
INSERT INTO `weixin_tag` VALUES ('540', '商城');
INSERT INTO `weixin_tag` VALUES ('541', '营销');
INSERT INTO `weixin_tag` VALUES ('542', '系统');
INSERT INTO `weixin_tag` VALUES ('543', '最新');
INSERT INTO `weixin_tag` VALUES ('544', '平台');
INSERT INTO `weixin_tag` VALUES ('545', '乐享');
INSERT INTO `weixin_tag` VALUES ('546', '空间');
INSERT INTO `weixin_tag` VALUES ('547', '香港');
INSERT INTO `weixin_tag` VALUES ('548', '全能');
INSERT INTO `weixin_tag` VALUES ('549', '首先');
INSERT INTO `weixin_tag` VALUES ('550', '独立');
INSERT INTO `weixin_tag` VALUES ('551', '优化');
INSERT INTO `weixin_tag` VALUES ('552', '高速');
INSERT INTO `weixin_tag` VALUES ('553', '300M');
INSERT INTO `weixin_tag` VALUES ('554', 'seo');
INSERT INTO `weixin_tag` VALUES ('555', '主机租用');
INSERT INTO `weixin_tag` VALUES ('556', 'vps');
INSERT INTO `weixin_tag` VALUES ('557', '在线支付');
INSERT INTO `weixin_tag` VALUES ('558', '网站');
INSERT INTO `weixin_tag` VALUES ('559', '全网');
INSERT INTO `weixin_tag` VALUES ('560', '后台');
INSERT INTO `weixin_tag` VALUES ('561', '版权');
INSERT INTO `weixin_tag` VALUES ('562', '所有');
INSERT INTO `weixin_tag` VALUES ('563', '封堵');
INSERT INTO `weixin_tag` VALUES ('564', '安全漏洞');
INSERT INTO `weixin_tag` VALUES ('565', '改过');
INSERT INTO `weixin_tag` VALUES ('566', '独有');
INSERT INTO `weixin_tag` VALUES ('567', '修复');
INSERT INTO `weixin_tag` VALUES ('568', '主机');
INSERT INTO `weixin_tag` VALUES ('569', 'windows');
INSERT INTO `weixin_tag` VALUES ('570', '200');
INSERT INTO `weixin_tag` VALUES ('571', '全景');
INSERT INTO `weixin_tag` VALUES ('572', '测试');
INSERT INTO `weixin_tag` VALUES ('573', '喜帖');
INSERT INTO `weixin_tag` VALUES ('574', '帐号');
INSERT INTO `weixin_tag` VALUES ('575', 'test');
INSERT INTO `weixin_tag` VALUES ('576', '开源');
INSERT INTO `weixin_tag` VALUES ('577', '最新版');
INSERT INTO `weixin_tag` VALUES ('578', '可用');
INSERT INTO `weixin_tag` VALUES ('579', '乐事');
INSERT INTO `weixin_tag` VALUES ('580', '美国');
INSERT INTO `weixin_tag` VALUES ('581', '美味');
INSERT INTO `weixin_tag` VALUES ('582', '经典');
INSERT INTO `weixin_tag` VALUES ('583', 'Lay\'s');
INSERT INTO `weixin_tag` VALUES ('584', '意大利');
INSERT INTO `weixin_tag` VALUES ('585', '薯片');
INSERT INTO `weixin_tag` VALUES ('586', '75');
INSERT INTO `weixin_tag` VALUES ('587', '马铃');
INSERT INTO `weixin_tag` VALUES ('588', '原味');
INSERT INTO `weixin_tag` VALUES ('589', '原木');
INSERT INTO `weixin_tag` VALUES ('590', '清风');
INSERT INTO `weixin_tag` VALUES ('591', '系列');
INSERT INTO `weixin_tag` VALUES ('592', '段卷纸');
INSERT INTO `weixin_tag` VALUES ('593', '260');
INSERT INTO `weixin_tag` VALUES ('594', '10');
INSERT INTO `weixin_tag` VALUES ('595', '多芬');
INSERT INTO `weixin_tag` VALUES ('596', '发乳');
INSERT INTO `weixin_tag` VALUES ('597', '损伤');
INSERT INTO `weixin_tag` VALUES ('598', '深度');
INSERT INTO `weixin_tag` VALUES ('599', '200ml');
INSERT INTO `weixin_tag` VALUES ('600', '理护');
INSERT INTO `weixin_tag` VALUES ('601', '日常');
INSERT INTO `weixin_tag` VALUES ('602', '瓶装');
INSERT INTO `weixin_tag` VALUES ('603', '滋养');
INSERT INTO `weixin_tag` VALUES ('604', '400ml');
INSERT INTO `weixin_tag` VALUES ('605', '海飞');
INSERT INTO `weixin_tag` VALUES ('606', '洗发露');
INSERT INTO `weixin_tag` VALUES ('607', '去屑');
INSERT INTO `weixin_tag` VALUES ('608', '丝质');
INSERT INTO `weixin_tag` VALUES ('609', '柔滑');
INSERT INTO `weixin_tag` VALUES ('610', '怡神');
INSERT INTO `weixin_tag` VALUES ('611', '冰凉');
INSERT INTO `weixin_tag` VALUES ('612', '活力');
INSERT INTO `weixin_tag` VALUES ('613', '海洋');
INSERT INTO `weixin_tag` VALUES ('614', '洗发');
INSERT INTO `weixin_tag` VALUES ('615', '露水');
INSERT INTO `weixin_tag` VALUES ('616', '发型');
INSERT INTO `weixin_tag` VALUES ('617', '清扬');
INSERT INTO `weixin_tag` VALUES ('618', '养护');
INSERT INTO `weixin_tag` VALUES ('619', '男士');
INSERT INTO `weixin_tag` VALUES ('620', '六神');
INSERT INTO `weixin_tag` VALUES ('621', '沐浴露');
INSERT INTO `weixin_tag` VALUES ('622', '清凉');
INSERT INTO `weixin_tag` VALUES ('623', '450ml');
INSERT INTO `weixin_tag` VALUES ('624', '三合一');
INSERT INTO `weixin_tag` VALUES ('625', '护理');
INSERT INTO `weixin_tag` VALUES ('626', '滋润');
INSERT INTO `weixin_tag` VALUES ('627', '茶树');
INSERT INTO `weixin_tag` VALUES ('628', '柔顺');
INSERT INTO `weixin_tag` VALUES ('629', '长效');
INSERT INTO `weixin_tag` VALUES ('630', '家庭');
INSERT INTO `weixin_tag` VALUES ('631', '去油');
INSERT INTO `weixin_tag` VALUES ('632', '绿茶');
INSERT INTO `weixin_tag` VALUES ('633', '清爽');
INSERT INTO `weixin_tag` VALUES ('634', '家庭护理');
INSERT INTO `weixin_tag` VALUES ('635', '止痒');
INSERT INTO `weixin_tag` VALUES ('636', '芦荟');
INSERT INTO `weixin_tag` VALUES ('637', '兰花');
INSERT INTO `weixin_tag` VALUES ('638', '杏仁');
INSERT INTO `weixin_tag` VALUES ('639', '艾叶健');
INSERT INTO `weixin_tag` VALUES ('640', '香型');
INSERT INTO `weixin_tag` VALUES ('641', '纯白');
INSERT INTO `weixin_tag` VALUES ('642', '舒肤佳');
INSERT INTO `weixin_tag` VALUES ('643', '柠檬');
INSERT INTO `weixin_tag` VALUES ('644', 'Safeguard');
INSERT INTO `weixin_tag` VALUES ('645', '清新');
INSERT INTO `weixin_tag` VALUES ('646', '沙宣');
INSERT INTO `weixin_tag` VALUES ('647', 'VS');
INSERT INTO `weixin_tag` VALUES ('648', '素丝');
INSERT INTO `weixin_tag` VALUES ('649', '护发');
INSERT INTO `weixin_tag` VALUES ('650', '护发素');
INSERT INTO `weixin_tag` VALUES ('651', '清润');
INSERT INTO `weixin_tag` VALUES ('652', '平衡');
INSERT INTO `weixin_tag` VALUES ('653', '精华素');
INSERT INTO `weixin_tag` VALUES ('654', '特好');
INSERT INTO `weixin_tag` VALUES ('655', '润发');
INSERT INTO `weixin_tag` VALUES ('656', '潘婷');
INSERT INTO `weixin_tag` VALUES ('657', '乳液');
INSERT INTO `weixin_tag` VALUES ('658', '修护');
INSERT INTO `weixin_tag` VALUES ('659', '沐浴乳');
INSERT INTO `weixin_tag` VALUES ('660', '力士');
INSERT INTO `weixin_tag` VALUES ('661', '白皙');
INSERT INTO `weixin_tag` VALUES ('662', 'LUX');
INSERT INTO `weixin_tag` VALUES ('663', '闪亮');
INSERT INTO `weixin_tag` VALUES ('664', '400');
INSERT INTO `weixin_tag` VALUES ('665', 'ml');
INSERT INTO `weixin_tag` VALUES ('666', '娇肤');
INSERT INTO `weixin_tag` VALUES ('667', '嫩肤');
INSERT INTO `weixin_tag` VALUES ('668', '恒久');
INSERT INTO `weixin_tag` VALUES ('669', '香氛');
INSERT INTO `weixin_tag` VALUES ('670', '精油');
INSERT INTO `weixin_tag` VALUES ('671', '青蛙王子');
INSERT INTO `weixin_tag` VALUES ('672', '牙膏');
INSERT INTO `weixin_tag` VALUES ('673', '牙刷');
INSERT INTO `weixin_tag` VALUES ('674', '水晶');
INSERT INTO `weixin_tag` VALUES ('675', '苹果');
INSERT INTO `weixin_tag` VALUES ('676', '儿童');
INSERT INTO `weixin_tag` VALUES ('677', '50g');
INSERT INTO `weixin_tag` VALUES ('678', '草莓');
INSERT INTO `weixin_tag` VALUES ('679', '高露洁');
INSERT INTO `weixin_tag` VALUES ('680', '超值');
INSERT INTO `weixin_tag` VALUES ('681', '超强');
INSERT INTO `weixin_tag` VALUES ('682', '140g');
INSERT INTO `weixin_tag` VALUES ('683', '360');
INSERT INTO `weixin_tag` VALUES ('684', '40g');
INSERT INTO `weixin_tag` VALUES ('685', '云南白药');
INSERT INTO `weixin_tag` VALUES ('686', '金口');
INSERT INTO `weixin_tag` VALUES ('687', '薄荷');
INSERT INTO `weixin_tag` VALUES ('688', '105g');
INSERT INTO `weixin_tag` VALUES ('689', '防蛀');
INSERT INTO `weixin_tag` VALUES ('690', '美白');
INSERT INTO `weixin_tag` VALUES ('691', 'Colgate');
INSERT INTO `weixin_tag` VALUES ('692', '90g');
INSERT INTO `weixin_tag` VALUES ('693', '黑人');
INSERT INTO `weixin_tag` VALUES ('694', '白青');
INSERT INTO `weixin_tag` VALUES ('695', 'DARLIE');
INSERT INTO `weixin_tag` VALUES ('696', '佳洁士');
INSERT INTO `weixin_tag` VALUES ('697', '草本');
INSERT INTO `weixin_tag` VALUES ('698', '香皂');
INSERT INTO `weixin_tag` VALUES ('699', '新型');
INSERT INTO `weixin_tag` VALUES ('700', '115g');
INSERT INTO `weixin_tag` VALUES ('701', '呵护');
INSERT INTO `weixin_tag` VALUES ('702', '强生');
INSERT INTO `weixin_tag` VALUES ('703', '婴儿');
INSERT INTO `weixin_tag` VALUES ('704', 'Johnson');
INSERT INTO `weixin_tag` VALUES ('705', 'Baby');
INSERT INTO `weixin_tag` VALUES ('706', '125G');
INSERT INTO `weixin_tag` VALUES ('707', '115');
INSERT INTO `weixin_tag` VALUES ('708', '奇强');
INSERT INTO `weixin_tag` VALUES ('709', '内衣');
INSERT INTO `weixin_tag` VALUES ('710', '100G');
INSERT INTO `weixin_tag` VALUES ('711', '汰渍');
INSERT INTO `weixin_tag` VALUES ('712', '洗衣皂');
INSERT INTO `weixin_tag` VALUES ('713', '三重');
INSERT INTO `weixin_tag` VALUES ('714', '功效');
INSERT INTO `weixin_tag` VALUES ('715', '238g');
INSERT INTO `weixin_tag` VALUES ('716', '无磷');
INSERT INTO `weixin_tag` VALUES ('717', '奥妙');
INSERT INTO `weixin_tag` VALUES ('718', '206g');
INSERT INTO `weixin_tag` VALUES ('719', 'OMO');
INSERT INTO `weixin_tag` VALUES ('720', '原野');
INSERT INTO `weixin_tag` VALUES ('721', '饼干');
INSERT INTO `weixin_tag` VALUES ('722', '物语');
INSERT INTO `weixin_tag` VALUES ('723', '台湾地区');
INSERT INTO `weixin_tag` VALUES ('724', '河马');
INSERT INTO `weixin_tag` VALUES ('725', '牛奶');
INSERT INTO `weixin_tag` VALUES ('726', 'Hemali');
INSERT INTO `weixin_tag` VALUES ('727', '130g');
INSERT INTO `weixin_tag` VALUES ('728', '布丁');
INSERT INTO `weixin_tag` VALUES ('729', '水果');
INSERT INTO `weixin_tag` VALUES ('730', '综合');
INSERT INTO `weixin_tag` VALUES ('731', '皇冠');
INSERT INTO `weixin_tag` VALUES ('732', '印尼');
INSERT INTO `weixin_tag` VALUES ('733', '曲奇');
INSERT INTO `weixin_tag` VALUES ('734', '进口');
INSERT INTO `weixin_tag` VALUES ('735', 'DANISA');
INSERT INTO `weixin_tag` VALUES ('736', '罐装');
INSERT INTO `weixin_tag` VALUES ('737', '200g');
INSERT INTO `weixin_tag` VALUES ('738', '袋泡茶');
INSERT INTO `weixin_tag` VALUES ('739', '奶茶');
INSERT INTO `weixin_tag` VALUES ('740', '120g');
INSERT INTO `weixin_tag` VALUES ('741', '港式');
INSERT INTO `weixin_tag` VALUES ('742', '女士');
INSERT INTO `weixin_tag` VALUES ('743', 'CLEAR');
INSERT INTO `weixin_tag` VALUES ('744', '175ml');
INSERT INTO `weixin_tag` VALUES ('745', '丰盈');
INSERT INTO `weixin_tag` VALUES ('746', '灵动');
INSERT INTO `weixin_tag` VALUES ('747', '润丝');
INSERT INTO `weixin_tag` VALUES ('748', '乳清');
INSERT INTO `weixin_tag` VALUES ('749', '透明');
INSERT INTO `weixin_tag` VALUES ('750', '阳光');
INSERT INTO `weixin_tag` VALUES ('751', '202g');
INSERT INTO `weixin_tag` VALUES ('752', '清香');
INSERT INTO `weixin_tag` VALUES ('753', '优格');
INSERT INTO `weixin_tag` VALUES ('754', '台湾');
INSERT INTO `weixin_tag` VALUES ('755', '小资');
INSERT INTO `weixin_tag` VALUES ('756', '可可');
INSERT INTO `weixin_tag` VALUES ('757', '巧克力');
INSERT INTO `weixin_tag` VALUES ('758', 'Office');
INSERT INTO `weixin_tag` VALUES ('759', 'Love');
INSERT INTO `weixin_tag` VALUES ('760', 'Lady');
INSERT INTO `weixin_tag` VALUES ('761', '80g');
INSERT INTO `weixin_tag` VALUES ('762', '即溶');
INSERT INTO `weixin_tag` VALUES ('763', '咖啡');
INSERT INTO `weixin_tag` VALUES ('764', '马来西亚');
INSERT INTO `weixin_tag` VALUES ('765', '香草');
INSERT INTO `weixin_tag` VALUES ('766', '饮料');
INSERT INTO `weixin_tag` VALUES ('767', 'COBIZCO');
INSERT INTO `weixin_tag` VALUES ('768', '25');
INSERT INTO `weixin_tag` VALUES ('769', '桃仁');
INSERT INTO `weixin_tag` VALUES ('770', '酸奶');
INSERT INTO `weixin_tag` VALUES ('771', '手工');
INSERT INTO `weixin_tag` VALUES ('772', 'Hamu');
INSERT INTO `weixin_tag` VALUES ('773', '130');
INSERT INTO `weixin_tag` VALUES ('774', '黑芝麻');
INSERT INTO `weixin_tag` VALUES ('775', '港澳');
INSERT INTO `weixin_tag` VALUES ('776', '椰蓉');
INSERT INTO `weixin_tag` VALUES ('777', '鲍鱼');
INSERT INTO `weixin_tag` VALUES ('778', '初五');
INSERT INTO `weixin_tag` VALUES ('779', '十月');
INSERT INTO `weixin_tag` VALUES ('780', '150g');
INSERT INTO `weixin_tag` VALUES ('781', '78g');
INSERT INTO `weixin_tag` VALUES ('782', '桃酥');
INSERT INTO `weixin_tag` VALUES ('783', '108g');
INSERT INTO `weixin_tag` VALUES ('784', '芝麻');
INSERT INTO `weixin_tag` VALUES ('785', '62g');
INSERT INTO `weixin_tag` VALUES ('786', '鸡仔');
INSERT INTO `weixin_tag` VALUES ('787', '迷你');
INSERT INTO `weixin_tag` VALUES ('788', '蛋卷');
INSERT INTO `weixin_tag` VALUES ('789', '72g');
INSERT INTO `weixin_tag` VALUES ('790', '北田');
INSERT INTO `weixin_tag` VALUES ('791', '蛋黄');
INSERT INTO `weixin_tag` VALUES ('792', '口味');
INSERT INTO `weixin_tag` VALUES ('793', '能量');
INSERT INTO `weixin_tag` VALUES ('794', '180g');
INSERT INTO `weixin_tag` VALUES ('795', '南瓜');
INSERT INTO `weixin_tag` VALUES ('796', '威化');
INSERT INTO `weixin_tag` VALUES ('797', '泰国');
INSERT INTO `weixin_tag` VALUES ('798', '榴莲');
INSERT INTO `weixin_tag` VALUES ('799', 'VFOODS');
INSERT INTO `weixin_tag` VALUES ('800', '山竹');
INSERT INTO `weixin_tag` VALUES ('801', '玉山');
INSERT INTO `weixin_tag` VALUES ('802', '固体');
INSERT INTO `weixin_tag` VALUES ('803', '小麦');
INSERT INTO `weixin_tag` VALUES ('804', '105');
INSERT INTO `weixin_tag` VALUES ('805', 'efw');
INSERT INTO `weixin_tag` VALUES ('806', 'page1');
INSERT INTO `weixin_tag` VALUES ('807', 'levi');
INSERT INTO `weixin_tag` VALUES ('808', '榛果');
INSERT INTO `weixin_tag` VALUES ('809', '山药');
INSERT INTO `weixin_tag` VALUES ('810', '谷餐');
INSERT INTO `weixin_tag` VALUES ('811', '薏仁');
INSERT INTO `weixin_tag` VALUES ('812', '木偶');
INSERT INTO `weixin_tag` VALUES ('813', '米果豆');
INSERT INTO `weixin_tag` VALUES ('814', 'ssy');
INSERT INTO `weixin_tag` VALUES ('815', '沙巴');
INSERT INTO `weixin_tag` VALUES ('816', '薯干');
INSERT INTO `weixin_tag` VALUES ('817', '越南');
INSERT INTO `weixin_tag` VALUES ('818', '袋装');
INSERT INTO `weixin_tag` VALUES ('819', '奶酪');
INSERT INTO `weixin_tag` VALUES ('820', '蔬果');
INSERT INTO `weixin_tag` VALUES ('821', 'Sabava');
INSERT INTO `weixin_tag` VALUES ('822', '干果');
INSERT INTO `weixin_tag` VALUES ('823', '菠萝蜜');
INSERT INTO `weixin_tag` VALUES ('824', '芝士');
INSERT INTO `weixin_tag` VALUES ('825', '椰子');
INSERT INTO `weixin_tag` VALUES ('826', '特产');
INSERT INTO `weixin_tag` VALUES ('827', 'Sport');
INSERT INTO `weixin_tag` VALUES ('828', 'Star');
INSERT INTO `weixin_tag` VALUES ('829', '香菜');
INSERT INTO `weixin_tag` VALUES ('830', '45g');
INSERT INTO `weixin_tag` VALUES ('831', '日香');
INSERT INTO `weixin_tag` VALUES ('832', '冬笋');
INSERT INTO `weixin_tag` VALUES ('833', '番薯');
INSERT INTO `weixin_tag` VALUES ('834', '蝴蝶牌');
INSERT INTO `weixin_tag` VALUES ('835', '果仁');
INSERT INTO `weixin_tag` VALUES ('836', '烘焙');
INSERT INTO `weixin_tag` VALUES ('837', 'Butterfly');
INSERT INTO `weixin_tag` VALUES ('838', '280g');
INSERT INTO `weixin_tag` VALUES ('839', '135g');
INSERT INTO `weixin_tag` VALUES ('840', '燕麦');
INSERT INTO `weixin_tag` VALUES ('841', '乐斯');
INSERT INTO `weixin_tag` VALUES ('842', 'DILESI');
INSERT INTO `weixin_tag` VALUES ('843', '牛轧糖');
INSERT INTO `weixin_tag` VALUES ('844', '利耕');
INSERT INTO `weixin_tag` VALUES ('845', '250g');
INSERT INTO `weixin_tag` VALUES ('846', 'Product');
INSERT INTO `weixin_tag` VALUES ('847', 'Widget');
INSERT INTO `weixin_tag` VALUES ('848', 'List');
INSERT INTO `weixin_tag` VALUES ('849', '泰式');
INSERT INTO `weixin_tag` VALUES ('850', '泡菜');
INSERT INTO `weixin_tag` VALUES ('851', '方便面');
INSERT INTO `weixin_tag` VALUES ('852', '7coin');
INSERT INTO `weixin_tag` VALUES ('853', '70g');
INSERT INTO `weixin_tag` VALUES ('854', '海鲜');
INSERT INTO `weixin_tag` VALUES ('855', '一面');
INSERT INTO `weixin_tag` VALUES ('856', 'Vit\'s');
INSERT INTO `weixin_tag` VALUES ('857', '78');
INSERT INTO `weixin_tag` VALUES ('858', '牛肉');
INSERT INTO `weixin_tag` VALUES ('859', '风味');
INSERT INTO `weixin_tag` VALUES ('860', 'jsdifajsa');
INSERT INTO `weixin_tag` VALUES ('861', 'sajdofa');
INSERT INTO `weixin_tag` VALUES ('862', 'dfaj');
INSERT INTO `weixin_tag` VALUES ('863', '金典');
INSERT INTO `weixin_tag` VALUES ('864', '多恩');
INSERT INTO `weixin_tag` VALUES ('865', '食品');
INSERT INTO `weixin_tag` VALUES ('866', '公仔');
INSERT INTO `weixin_tag` VALUES ('867', '麻油');
INSERT INTO `weixin_tag` VALUES ('868', '牛肉味');
INSERT INTO `weixin_tag` VALUES ('869', 'DOLL');
INSERT INTO `weixin_tag` VALUES ('870', '103g');
INSERT INTO `weixin_tag` VALUES ('871', '冬菜');
INSERT INTO `weixin_tag` VALUES ('872', '油炸');
INSERT INTO `weixin_tag` VALUES ('873', 'Nissin');
INSERT INTO `weixin_tag` VALUES ('874', '香港地区');
INSERT INTO `weixin_tag` VALUES ('875', '即食面');
INSERT INTO `weixin_tag` VALUES ('876', '高品质');
INSERT INTO `weixin_tag` VALUES ('877', '汤味');
INSERT INTO `weixin_tag` VALUES ('878', '焦糖');
INSERT INTO `weixin_tag` VALUES ('879', 'Lotus');
INSERT INTO `weixin_tag` VALUES ('880', '什锦');
INSERT INTO `weixin_tag` VALUES ('881', '双色');
INSERT INTO `weixin_tag` VALUES ('882', 'RINDA');
INSERT INTO `weixin_tag` VALUES ('883', '蓝莓');
INSERT INTO `weixin_tag` VALUES ('884', '蜜瓜');
INSERT INTO `weixin_tag` VALUES ('885', '北海道');
INSERT INTO `weixin_tag` VALUES ('886', '夹心糖');
INSERT INTO `weixin_tag` VALUES ('887', '果味');
INSERT INTO `weixin_tag` VALUES ('888', '公主');
INSERT INTO `weixin_tag` VALUES ('889', '42g');
INSERT INTO `weixin_tag` VALUES ('890', '提子');
INSERT INTO `weixin_tag` VALUES ('891', '林食佳');
INSERT INTO `weixin_tag` VALUES ('892', '芒果');
INSERT INTO `weixin_tag` VALUES ('893', '柚子');
INSERT INTO `weixin_tag` VALUES ('894', '韩国');
INSERT INTO `weixin_tag` VALUES ('895', '蜂蜜');
INSERT INTO `weixin_tag` VALUES ('896', '580g');
INSERT INTO `weixin_tag` VALUES ('897', '1080g');
INSERT INTO `weixin_tag` VALUES ('898', '菲律宾');
INSERT INTO `weixin_tag` VALUES ('899', '7D');
INSERT INTO `weixin_tag` VALUES ('900', '甜心');
INSERT INTO `weixin_tag` VALUES ('901', '麦芽');
INSERT INTO `weixin_tag` VALUES ('902', '棒棒糖');
INSERT INTO `weixin_tag` VALUES ('903', '糖果');
INSERT INTO `weixin_tag` VALUES ('904', '14g');
INSERT INTO `weixin_tag` VALUES ('905', '梅心');
INSERT INTO `weixin_tag` VALUES ('906', '许愿');
INSERT INTO `weixin_tag` VALUES ('907', '幸运');
INSERT INTO `weixin_tag` VALUES ('908', '星星');
INSERT INTO `weixin_tag` VALUES ('909', '百事可乐');
INSERT INTO `weixin_tag` VALUES ('910', '250ml');
INSERT INTO `weixin_tag` VALUES ('911', '汽水');
INSERT INTO `weixin_tag` VALUES ('912', 'est');
INSERT INTO `weixin_tag` VALUES ('913', '可乐');
INSERT INTO `weixin_tag` VALUES ('914', '果汁饮料');
INSERT INTO `weixin_tag` VALUES ('915', '原装进口');
INSERT INTO `weixin_tag` VALUES ('916', '石榴');
INSERT INTO `weixin_tag` VALUES ('917', '230ml');
INSERT INTO `weixin_tag` VALUES ('918', '葡萄');
INSERT INTO `weixin_tag` VALUES ('919', '菠萝');
INSERT INTO `weixin_tag` VALUES ('920', 'CHABBA');
INSERT INTO `weixin_tag` VALUES ('921', '七星');
INSERT INTO `weixin_tag` VALUES ('922', '气泡');
INSERT INTO `weixin_tag` VALUES ('923', '350ml');
INSERT INTO `weixin_tag` VALUES ('924', '香槟');
INSERT INTO `weixin_tag` VALUES ('925', '酒精');
INSERT INTO `weixin_tag` VALUES ('926', '玫瑰');
INSERT INTO `weixin_tag` VALUES ('927', '275ml');
INSERT INTO `weixin_tag` VALUES ('928', '伏特加');
INSERT INTO `weixin_tag` VALUES ('929', '调酒');
INSERT INTO `weixin_tag` VALUES ('930', 'Rio');
INSERT INTO `weixin_tag` VALUES ('931', '白兰地');
INSERT INTO `weixin_tag` VALUES ('932', '鸡尾酒');
INSERT INTO `weixin_tag` VALUES ('933', '芒果汁');
INSERT INTO `weixin_tag` VALUES ('934', '7BEST');
INSERT INTO `weixin_tag` VALUES ('935', '列子');
INSERT INTO `weixin_tag` VALUES ('936', '椰肉');
INSERT INTO `weixin_tag` VALUES ('937', '椰子汁');
INSERT INTO `weixin_tag` VALUES ('938', '8858992300200');
INSERT INTO `weixin_tag` VALUES ('939', '490ml');
INSERT INTO `weixin_tag` VALUES ('940', '水蜜桃');
INSERT INTO `weixin_tag` VALUES ('941', '甘蔗汁');
INSERT INTO `weixin_tag` VALUES ('942', '番石榴');
INSERT INTO `weixin_tag` VALUES ('943', '德博');
INSERT INTO `weixin_tag` VALUES ('944', '德国');
INSERT INTO `weixin_tag` VALUES ('945', '啤酒');
INSERT INTO `weixin_tag` VALUES ('946', '500mL');
INSERT INTO `weixin_tag` VALUES ('947', '黑啤酒');
INSERT INTO `weixin_tag` VALUES ('948', 'HARBOE');
INSERT INTO `weixin_tag` VALUES ('949', '士力架');
INSERT INTO `weixin_tag` VALUES ('950', '夹心');
INSERT INTO `weixin_tag` VALUES ('951', '花生');
INSERT INTO `weixin_tag` VALUES ('952', '51g');
INSERT INTO `weixin_tag` VALUES ('953', '460');
INSERT INTO `weixin_tag` VALUES ('954', 'FERRERO');
INSERT INTO `weixin_tag` VALUES ('955', 'ROCHER');
INSERT INTO `weixin_tag` VALUES ('956', '费列');
INSERT INTO `weixin_tag` VALUES ('957', '37.5');
INSERT INTO `weixin_tag` VALUES ('958', '角果');
INSERT INTO `weixin_tag` VALUES ('959', '148g');
INSERT INTO `weixin_tag` VALUES ('960', '德芙');
INSERT INTO `weixin_tag` VALUES ('961', '84g');
INSERT INTO `weixin_tag` VALUES ('962', '浓黑');
INSERT INTO `weixin_tag` VALUES ('963', '果粒');
INSERT INTO `weixin_tag` VALUES ('964', 'HERSHEY\'S');
INSERT INTO `weixin_tag` VALUES ('965', '82g');
INSERT INTO `weixin_tag` VALUES ('966', '百香');
INSERT INTO `weixin_tag` VALUES ('967', '奥地利');
INSERT INTO `weixin_tag` VALUES ('968', 'woogie');
INSERT INTO `weixin_tag` VALUES ('969', '柠檬味');
INSERT INTO `weixin_tag` VALUES ('970', '卡布');
INSERT INTO `weixin_tag` VALUES ('971', '奇诺');
INSERT INTO `weixin_tag` VALUES ('972', '20');
INSERT INTO `weixin_tag` VALUES ('973', '衣物');
INSERT INTO `weixin_tag` VALUES ('974', '薰衣草');
INSERT INTO `weixin_tag` VALUES ('975', '金纺');
INSERT INTO `weixin_tag` VALUES ('976', '全效');
INSERT INTO `weixin_tag` VALUES ('977', '洗衣液');
INSERT INTO `weixin_tag` VALUES ('978', '蔷薇');
INSERT INTO `weixin_tag` VALUES ('979', '688');
INSERT INTO `weixin_tag` VALUES ('980', '新旧');
INSERT INTO `weixin_tag` VALUES ('981', '随机');
INSERT INTO `weixin_tag` VALUES ('982', '发送');
INSERT INTO `weixin_tag` VALUES ('983', '包装');
INSERT INTO `weixin_tag` VALUES ('984', '千克');
INSERT INTO `weixin_tag` VALUES ('985', '3000g');
INSERT INTO `weixin_tag` VALUES ('986', '洗洁精');
INSERT INTO `weixin_tag` VALUES ('987', '方巾');
INSERT INTO `weixin_tag` VALUES ('988', '生姜');
INSERT INTO `weixin_tag` VALUES ('989', '1.5');
INSERT INTO `weixin_tag` VALUES ('990', 'kg');
INSERT INTO `weixin_tag` VALUES ('991', '温和');
INSERT INTO `weixin_tag` VALUES ('992', '金桔');
INSERT INTO `weixin_tag` VALUES ('993', '1.29');
INSERT INTO `weixin_tag` VALUES ('994', '炫彩');
INSERT INTO `weixin_tag` VALUES ('995', '皂粉');
INSERT INTO `weixin_tag` VALUES ('996', '超能');
INSERT INTO `weixin_tag` VALUES ('997', '馨香');
INSERT INTO `weixin_tag` VALUES ('998', '天然');
INSERT INTO `weixin_tag` VALUES ('999', '680g');
INSERT INTO `weixin_tag` VALUES ('1000', '洗衣粉');
INSERT INTO `weixin_tag` VALUES ('1001', '洁净');
INSERT INTO `weixin_tag` VALUES ('1002', '500g');
INSERT INTO `weixin_tag` VALUES ('1003', '净白');
INSERT INTO `weixin_tag` VALUES ('1004', '508');
INSERT INTO `weixin_tag` VALUES ('1005', '粟米');
INSERT INTO `weixin_tag` VALUES ('1006', '火鸡');
INSERT INTO `weixin_tag` VALUES ('1007', '美式');
INSERT INTO `weixin_tag` VALUES ('1008', '60');
INSERT INTO `weixin_tag` VALUES ('1009', '牛排');
INSERT INTO `weixin_tag` VALUES ('1010', '日式');
INSERT INTO `weixin_tag` VALUES ('1011', '有友');
INSERT INTO `weixin_tag` VALUES ('1012', '凤爪');
INSERT INTO `weixin_tag` VALUES ('1013', '香辣');
INSERT INTO `weixin_tag` VALUES ('1014', '龙虾');
INSERT INTO `weixin_tag` VALUES ('1015', '利进');
INSERT INTO `weixin_tag` VALUES ('1016', '甜甜');
INSERT INTO `weixin_tag` VALUES ('1017', '夜用');
INSERT INTO `weixin_tag` VALUES ('1018', '卫生巾');
INSERT INTO `weixin_tag` VALUES ('1019', '表层');
INSERT INTO `weixin_tag` VALUES ('1020', '配方');
INSERT INTO `weixin_tag` VALUES ('1021', '健康');
INSERT INTO `weixin_tag` VALUES ('1022', 'KMS');
INSERT INTO `weixin_tag` VALUES ('1023', 'ABC');
INSERT INTO `weixin_tag` VALUES ('1024', '日用');
INSERT INTO `weixin_tag` VALUES ('1025', '护垫');
INSERT INTO `weixin_tag` VALUES ('1026', '超长');
INSERT INTO `weixin_tag` VALUES ('1027', '透气');
INSERT INTO `weixin_tag` VALUES ('1028', '纯棉');
INSERT INTO `weixin_tag` VALUES ('1029', '超薄');
INSERT INTO `weixin_tag` VALUES ('1030', '少女');
INSERT INTO `weixin_tag` VALUES ('1031', '338mm');
INSERT INTO `weixin_tag` VALUES ('1032', '薄型');
INSERT INTO `weixin_tag` VALUES ('1033', '优雅');
INSERT INTO `weixin_tag` VALUES ('1034', '275mm');
INSERT INTO `weixin_tag` VALUES ('1035', '245mm');
INSERT INTO `weixin_tag` VALUES ('1036', '特长');
INSERT INTO `weixin_tag` VALUES ('1037', 'SPACE');
INSERT INTO `weixin_tag` VALUES ('1038', '超净');
INSERT INTO `weixin_tag` VALUES ('1039', '柔丝');
INSERT INTO `weixin_tag` VALUES ('1040', 'pinkcess');
INSERT INTO `weixin_tag` VALUES ('1041', '240mm');
INSERT INTO `weixin_tag` VALUES ('1042', '284mm');
INSERT INTO `weixin_tag` VALUES ('1043', '干爽');
INSERT INTO `weixin_tag` VALUES ('1044', '保护');
INSERT INTO `weixin_tag` VALUES ('1045', '苏菲');
INSERT INTO `weixin_tag` VALUES ('1046', '口袋');
INSERT INTO `weixin_tag` VALUES ('1047', '魔法');
INSERT INTO `weixin_tag` VALUES ('1048', '24cm');
INSERT INTO `weixin_tag` VALUES ('1049', '身量');
INSERT INTO `weixin_tag` VALUES ('1050', '弹力');
INSERT INTO `weixin_tag` VALUES ('1051', '吸收');
INSERT INTO `weixin_tag` VALUES ('1052', 'SOFY');
INSERT INTO `weixin_tag` VALUES ('1053', '0.1');
INSERT INTO `weixin_tag` VALUES ('1054', '定装');
INSERT INTO `weixin_tag` VALUES ('1055', '随心');
INSERT INTO `weixin_tag` VALUES ('1056', '熟睡');
INSERT INTO `weixin_tag` VALUES ('1057', '梦境');
INSERT INTO `weixin_tag` VALUES ('1058', '350');
INSERT INTO `weixin_tag` VALUES ('1059', '压花');
INSERT INTO `weixin_tag` VALUES ('1060', '手帕');
INSERT INTO `weixin_tag` VALUES ('1061', '心心相印');
INSERT INTO `weixin_tag` VALUES ('1062', '维达');
INSERT INTO `weixin_tag` VALUES ('1063', '纸巾');
INSERT INTO `weixin_tag` VALUES ('1064', 'Vinda');
INSERT INTO `weixin_tag` VALUES ('1065', '木桨');
INSERT INTO `weixin_tag` VALUES ('1066', '柔韧');
INSERT INTO `weixin_tag` VALUES ('1067', '原生');
INSERT INTO `weixin_tag` VALUES ('1068', '油性');
INSERT INTO `weixin_tag` VALUES ('1069', '吸水');
INSERT INTO `weixin_tag` VALUES ('1070', '不易');
INSERT INTO `weixin_tag` VALUES ('1071', '古龙水');
INSERT INTO `weixin_tag` VALUES ('1072', '面巾');
INSERT INTO `weixin_tag` VALUES ('1073', '香味');
INSERT INTO `weixin_tag` VALUES ('1074', '面子');
INSERT INTO `weixin_tag` VALUES ('1075', '抽取式');
INSERT INTO `weixin_tag` VALUES ('1076', '面纸');
INSERT INTO `weixin_tag` VALUES ('1077', '206mmx195mm');
INSERT INTO `weixin_tag` VALUES ('1078', '206mmx136mm');
INSERT INTO `weixin_tag` VALUES ('1079', '相印');
INSERT INTO `weixin_tag` VALUES ('1080', '面巾纸');
INSERT INTO `weixin_tag` VALUES ('1081', '卷筒');
INSERT INTO `weixin_tag` VALUES ('1082', '卫生纸');
INSERT INTO `weixin_tag` VALUES ('1083', '蓝色');
INSERT INTO `weixin_tag` VALUES ('1084', '270');
INSERT INTO `weixin_tag` VALUES ('1085', '备注');
INSERT INTO `weixin_tag` VALUES ('1086', '颜色');
INSERT INTO `weixin_tag` VALUES ('1087', '鹅蛋');
INSERT INTO `weixin_tag` VALUES ('1088', '鲜奶');
INSERT INTO `weixin_tag` VALUES ('1089', '鸡蛋');
INSERT INTO `weixin_tag` VALUES ('1090', '拉菲');
INSERT INTO `weixin_tag` VALUES ('1091', '麦片');
INSERT INTO `weixin_tag` VALUES ('1092', '营养');
INSERT INTO `weixin_tag` VALUES ('1093', 'lafei');
INSERT INTO `weixin_tag` VALUES ('1094', '240');
INSERT INTO `weixin_tag` VALUES ('1095', '螺旋藻');
INSERT INTO `weixin_tag` VALUES ('1096', '桂圆');
INSERT INTO `weixin_tag` VALUES ('1097', '红枣');
INSERT INTO `weixin_tag` VALUES ('1098', '苏打');
INSERT INTO `weixin_tag` VALUES ('1099', '香橙');
INSERT INTO `weixin_tag` VALUES ('1100', 'WIN');
INSERT INTO `weixin_tag` VALUES ('1101', '香兰');
INSERT INTO `weixin_tag` VALUES ('1102', 'win2');
INSERT INTO `weixin_tag` VALUES ('1103', '涂层');
INSERT INTO `weixin_tag` VALUES ('1104', '酥脆');
INSERT INTO `weixin_tag` VALUES ('1105', '可口');
INSERT INTO `weixin_tag` VALUES ('1106', '伴侣');
INSERT INTO `weixin_tag` VALUES ('1107', '减肥');
INSERT INTO `weixin_tag` VALUES ('1108', '438G');
INSERT INTO `weixin_tag` VALUES ('1109', '托盘');
INSERT INTO `weixin_tag` VALUES ('1110', '韩昇');
INSERT INTO `weixin_tag` VALUES ('1111', '果冻');
INSERT INTO `weixin_tag` VALUES ('1112', '荔枝');
INSERT INTO `weixin_tag` VALUES ('1113', '君子');
INSERT INTO `weixin_tag` VALUES ('1114', '新语');
INSERT INTO `weixin_tag` VALUES ('1115', '果汁');
INSERT INTO `weixin_tag` VALUES ('1116', '奇异');
INSERT INTO `weixin_tag` VALUES ('1117', '12');
INSERT INTO `weixin_tag` VALUES ('1118', '30');
INSERT INTO `weixin_tag` VALUES ('1119', '酒鬼');
INSERT INTO `weixin_tag` VALUES ('1120', '原创');
INSERT INTO `weixin_tag` VALUES ('1121', '160g');
INSERT INTO `weixin_tag` VALUES ('1122', '雪梅');
INSERT INTO `weixin_tag` VALUES ('1123', '溜溜');
INSERT INTO `weixin_tag` VALUES ('1124', '60g');
INSERT INTO `weixin_tag` VALUES ('1125', '话梅');
INSERT INTO `weixin_tag` VALUES ('1126', '杰克');
INSERT INTO `weixin_tag` VALUES ('1127', '辣味');
INSERT INTO `weixin_tag` VALUES ('1128', 'Jacker');
INSERT INTO `weixin_tag` VALUES ('1129', '烤肉');
INSERT INTO `weixin_tag` VALUES ('1130', '巨浪');
INSERT INTO `weixin_tag` VALUES ('1131', 'EDOpack');
INSERT INTO `weixin_tag` VALUES ('1132', '沙律');
INSERT INTO `weixin_tag` VALUES ('1133', '乳酸');
INSERT INTO `weixin_tag` VALUES ('1134', '冰棒');
INSERT INTO `weixin_tag` VALUES ('1135', '青苹果');
INSERT INTO `weixin_tag` VALUES ('1136', '450');
INSERT INTO `weixin_tag` VALUES ('1137', '妈妈');
INSERT INTO `weixin_tag` VALUES ('1138', '125');
INSERT INTO `weixin_tag` VALUES ('1139', '小孩');
INSERT INTO `weixin_tag` VALUES ('1140', '最爱');
INSERT INTO `weixin_tag` VALUES ('1141', 'EGO');
INSERT INTO `weixin_tag` VALUES ('1142', '哈密瓜');
INSERT INTO `weixin_tag` VALUES ('1143', '澳门');
INSERT INTO `weixin_tag` VALUES ('1144', '鱿鱼');
INSERT INTO `weixin_tag` VALUES ('1145', '师傅');
INSERT INTO `weixin_tag` VALUES ('1146', '金枪鱼');
INSERT INTO `weixin_tag` VALUES ('1147', '高精');
INSERT INTO `weixin_tag` VALUES ('1148', '魅力');
INSERT INTO `weixin_tag` VALUES ('1149', '图片下载');
INSERT INTO `weixin_tag` VALUES ('1150', '细毛');
INSERT INTO `weixin_tag` VALUES ('1151', '防滑');
INSERT INTO `weixin_tag` VALUES ('1152', '璀璨');
INSERT INTO `weixin_tag` VALUES ('1153', '蓝月亮');
INSERT INTO `weixin_tag` VALUES ('1154', '多功能');
INSERT INTO `weixin_tag` VALUES ('1155', '卓越');
INSERT INTO `weixin_tag` VALUES ('1156', '卡布其');
INSERT INTO `weixin_tag` VALUES ('1157', '巴克');
INSERT INTO `weixin_tag` VALUES ('1158', '盒装');
INSERT INTO `weixin_tag` VALUES ('1159', '海德曼');
INSERT INTO `weixin_tag` VALUES ('1160', '瘦身');
INSERT INTO `weixin_tag` VALUES ('1161', '80');
INSERT INTO `weixin_tag` VALUES ('1162', '酱香');
INSERT INTO `weixin_tag` VALUES ('1163', '成都');
INSERT INTO `weixin_tag` VALUES ('1164', '小吃');
INSERT INTO `weixin_tag` VALUES ('1165', '170g');
INSERT INTO `weixin_tag` VALUES ('1166', '老粗');
INSERT INTO `weixin_tag` VALUES ('1167', '248g');
INSERT INTO `weixin_tag` VALUES ('1168', '开心');
INSERT INTO `weixin_tag` VALUES ('1169', '果子');
INSERT INTO `weixin_tag` VALUES ('1170', '六色');
INSERT INTO `weixin_tag` VALUES ('1171', '绿蓝');
INSERT INTO `weixin_tag` VALUES ('1172', '橙黄');
INSERT INTO `weixin_tag` VALUES ('1173', '发放');
INSERT INTO `weixin_tag` VALUES ('1174', '指定');
INSERT INTO `weixin_tag` VALUES ('1175', '白紫');

-- ----------------------------
-- Table structure for weixin_topic
-- ----------------------------
DROP TABLE IF EXISTS `weixin_topic`;
CREATE TABLE `weixin_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  `src_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '引用内容类型',
  `src_id` int(10) unsigned NOT NULL COMMENT '引用内容ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0，原创；1，转发；',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `forwards` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转发数量',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_topic
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_topic_at
-- ----------------------------
DROP TABLE IF EXISTS `weixin_topic_at`;
CREATE TABLE `weixin_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_topic_at
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `weixin_topic_comment`;
CREATE TABLE `weixin_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_topic_index
-- ----------------------------
DROP TABLE IF EXISTS `weixin_topic_index`;
CREATE TABLE `weixin_topic_index` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '发布者ID',
  `add_time` int(10) unsigned NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_topic_index
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_topic_relation
-- ----------------------------
DROP TABLE IF EXISTS `weixin_topic_relation`;
CREATE TABLE `weixin_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_topic_relation
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user`;
CREATE TABLE `weixin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uc_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL COMMENT '会员组',
  `wechatid` varchar(100) NOT NULL DEFAULT '0' COMMENT '微信id',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mobile phone number',
  `mobile_valid` tinyint(1) DEFAULT '0',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男，0女',
  `tags` varchar(50) NOT NULL COMMENT '个人标签',
  `intro` varchar(500) NOT NULL,
  `byear` smallint(4) unsigned NOT NULL,
  `bmonth` tinyint(2) unsigned NOT NULL,
  `bday` tinyint(2) unsigned NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `score_level` int(10) unsigned NOT NULL DEFAULT '0',
  `cover` varchar(255) NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shares` int(10) unsigned DEFAULT '0',
  `likes` int(10) unsigned DEFAULT '0',
  `follows` int(10) unsigned DEFAULT '0',
  `fans` int(10) unsigned DEFAULT '0',
  `albums` int(10) unsigned DEFAULT '0',
  `daren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `isedit` int(2) NOT NULL DEFAULT '0',
  `user_account` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user
-- ----------------------------
INSERT INTO `weixin_user` VALUES ('30', '0', '3', 'test', null, 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, '123@16.com', '0', '', '', '0', '0', '0', '', '', '30', '30', '', '127.0.0.1', '1388639401', '1417587208', '221.237.157.62', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('31', '0', '0', 'o49SHs8j6AeO47re03iN1hghcx1Y', 'o49SHs8j6AeO47re03iN1hghcx1Y', '0', '18030525005', '1', null, '', '1', '', '', '0', '0', '0', '四川', '成都', '0', '0', '', '', '1408029982', '1417587562', '112.64.235.251', '1', '0', '0', '0', '0', '0', '0', '卢顺成', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('32', '0', '0', 'o49SHs5vb9cfcQHUtd2VL7sPlv0A', 'o49SHs5vb9cfcQHUtd2VL7sPlv0A', '0', null, '0', null, '', '1', '', '', '0', '0', '0', '奥克兰', '', '0', '0', '', '', '1408029995', '1416794171', '0', '1', '0', '0', '0', '0', '0', '0', '风筝Kite', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('33', '0', '0', 'o49SHs4lB6qOWdBVy7pKMS_ITypE', 'o49SHs4lB6qOWdBVy7pKMS_ITypE', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1409277813', '1409277813', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('34', '0', '0', 'o49SHs-7hoL6nhlLj-SctRS4ebpY', 'o49SHs-7hoL6nhlLj-SctRS4ebpY', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410050614', '1410050636', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('35', '0', '0', 'o49SHs534odVINvwquYuBM5hTCNg', 'o49SHs534odVINvwquYuBM5hTCNg', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410154159', '1410154159', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('36', '0', '0', 'o49SHs6V32EznmO5rGaYalphCMVg', 'o49SHs6V32EznmO5rGaYalphCMVg', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410746164', '1410746196', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('37', '0', '0', 'o49SHs2es_rzD3WSODPWXDMY8vFA', 'o49SHs2es_rzD3WSODPWXDMY8vFA', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410844363', '1410844420', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('38', '0', '0', 'o49SHsyIfpir47g-bcEHRlzYVnL8', 'o49SHsyIfpir47g-bcEHRlzYVnL8', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410970325', '1411291071', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('39', '0', '0', 'o49SHs4i30Y1XTrKClOIpIkx_GWY', 'o49SHs4i30Y1XTrKClOIpIkx_GWY', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1410998592', '1410998592', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('40', '0', '0', 'o49SHsxS8TGe16hCdBFBjGD17xvU', 'o49SHsxS8TGe16hCdBFBjGD17xvU', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1411122421', '1411122421', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('41', '0', '0', 'o49SHsySUrB9QwdzStzsHamK3C_g', 'o49SHsySUrB9QwdzStzsHamK3C_g', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1411145179', '1411145251', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('42', '0', '0', 'o49SHs_sgnKeqR7Ft2kX39n7NpMI', 'o49SHs_sgnKeqR7Ft2kX39n7NpMI', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1411826139', '1411826139', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('43', '0', '0', 'o49SHs9-wO-Uw0Nw-cSSMwBqmZfI', 'o49SHs9-wO-Uw0Nw-cSSMwBqmZfI', '0', null, '0', null, '', '1', '', '', '0', '0', '0', '江苏', '无锡', '0', '0', '', '', '1412670808', '1417846216', '0', '1', '0', '0', '0', '0', '0', '0', '❗文西、', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('44', '0', '0', 'o49SHs9BWnbALCNyqMPgjjsgpoJw', 'o49SHs9BWnbALCNyqMPgjjsgpoJw', '0', '18030505004', '1', null, '', '2', '', '', '0', '0', '0', '四川', '成都', '0', '0', '', '', '1412845333', '1417846241', '182.133.197.34', '1', '0', '0', '0', '0', '0', '0', '小潘潘童鞋', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('45', '0', '0', 'o49SHs64xlHNfS7C9B-nZbqnbnVg', 'o49SHs64xlHNfS7C9B-nZbqnbnVg', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1412945839', '1412945839', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('46', '0', '0', 'o49SHs6OToDu9ysD6TBUKDVsR9RY', 'o49SHs6OToDu9ysD6TBUKDVsR9RY', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1413073555', '1413073555', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('47', '0', '0', 'o49SHs-DNIqhBVQPOlpaRGcyOuE0', 'o49SHs-DNIqhBVQPOlpaRGcyOuE0', '0', '13902601045', '1', null, '', '1', '', '', '0', '0', '0', '广东', '东莞', '0', '0', '', '', '1413211187', '1414220564', '223.73.35.200', '1', '0', '0', '0', '0', '0', '0', '大脚', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('48', '0', '0', 'o49SHs_vVKT-djSF3Djhr14azXhM', 'o49SHs_vVKT-djSF3Djhr14azXhM', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1413252781', '1413252781', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('49', '0', '0', 'o49SHs-f6g7gpH56Y4lTHIEA8VN0', 'o49SHs-f6g7gpH56Y4lTHIEA8VN0', '0', null, '0', null, '', '1', '', '', '0', '0', '0', '广东', '东莞', '0', '0', '', '', '1413278109', '1414220657', '0', '1', '0', '0', '0', '0', '0', '0', '大脚发电机', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('50', '0', '0', 'o49SHs4a3e3Tt9wr98_yLUO7Eqz0', 'o49SHs4a3e3Tt9wr98_yLUO7Eqz0', '0', '18608290235', '1', null, '', '2', '', '', '0', '0', '0', '四川', '宜宾', '0', '0', '', '', '1413983923', '1417163055', '118.113.217.187', '1', '0', '0', '0', '0', '0', '0', '一场一个人的旅行', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('51', '0', '0', 'o3bajuI8oBrL0_rZrpqFw8h0yNB0', 'o3bajuI8oBrL0_rZrpqFw8h0yNB0', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1414305267', '1414305267', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('52', '0', '0', 'o49SHs7V82VDFSfbpaBl58LkZ01A', 'o49SHs7V82VDFSfbpaBl58LkZ01A', '0', '15506292322', '1', null, '', '2', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1414333503', '1416898863', '122.96.36.8', '1', '0', '0', '0', '0', '0', '0', '', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('53', '0', '0', 'o49SHsweIOTcF4vIxvitTVPEqWtU', 'o49SHsweIOTcF4vIxvitTVPEqWtU', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1415151235', '1415151235', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('54', '0', '0', 'o49SHsyhN3qdhoIYGJNFUSGhBKCk', 'o49SHsyhN3qdhoIYGJNFUSGhBKCk', '0', null, '0', null, '', '1', '', '', '0', '0', '0', '河南', '郑州', '0', '0', '', '', '1415502284', '1415502299', '0', '1', '0', '0', '0', '0', '0', '0', '圣杰建网站', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('55', '0', '0', 'o49SHs8T4upYSuOMEPuXTIiwNq-s', 'o49SHs8T4upYSuOMEPuXTIiwNq-s', '0', null, '0', null, '', '2', '', '', '0', '0', '0', '四川', '成都', '0', '0', '', '', '1415615887', '1415765174', '0', '1', '0', '0', '0', '0', '0', '0', '美智合', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('56', '0', '0', 'o49SHs0NAx92HIKgcMPwod0kT1js', 'o49SHs0NAx92HIKgcMPwod0kT1js', '0', null, '0', null, '', '2', '', '', '0', '0', '0', '江苏', '宿迁', '0', '0', '', '', '1415781357', '1415781380', '0', '1', '0', '0', '0', '0', '0', '0', '小朱', '0', '0.00');
INSERT INTO `weixin_user` VALUES ('57', '0', '0', 'o49SHswjVArm-EGPbac-c9z-GEI8', 'o49SHswjVArm-EGPbac-c9z-GEI8', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1416018430', '1416018430', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');
INSERT INTO `weixin_user` VALUES ('58', '0', '0', 'o49SHszajo4DrWgyUUVEdIOnYhfY', 'o49SHszajo4DrWgyUUVEdIOnYhfY', '0', null, '0', null, '', '0', '', '', '0', '0', '0', '', '', '0', '0', '', '', '1416462960', '1416462960', '0', '1', '0', '0', '0', '0', '0', '0', null, '0', '0.00');

-- ----------------------------
-- Table structure for weixin_user_acclog
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_acclog`;
CREATE TABLE `weixin_user_acclog` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fl` char(1) NOT NULL COMMENT '1为消费 2为充值 3为人工充值',
  `userid` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `jiner` decimal(10,2) NOT NULL,
  `addtime` varchar(30) NOT NULL,
  `info` varchar(255) NOT NULL,
  `orderid` varchar(30) NOT NULL COMMENT '//订单ID',
  `status` varchar(200) NOT NULL COMMENT '//状态',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_acclog
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user_address
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_address`;
CREATE TABLE `weixin_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `shi` varchar(50) DEFAULT NULL,
  `qu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_address
-- ----------------------------
INSERT INTO `weixin_user_address` VALUES ('23', '30', '文章·', '丰乐路', '15132468218', '河南省', '郑州市', '金水区');
INSERT INTO `weixin_user_address` VALUES ('26', '30', '随便', '努力啦', '15132468318', '天津市', '市辖区', '河东区');
INSERT INTO `weixin_user_address` VALUES ('27', '31', '卢顺成', '红光镇银润南一路66号', '18030525005', '四川省', '成都市', '郫县');
INSERT INTO `weixin_user_address` VALUES ('28', '44', '潘丽', '华润橡树湾', '18030505004', '四川', '成都', '成都市');

-- ----------------------------
-- Table structure for weixin_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_bind`;
CREATE TABLE `weixin_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_bind
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user_category
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_category`;
CREATE TABLE `weixin_user_category` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '会员组',
  `discount` int(3) DEFAULT '100' COMMENT '折扣率%',
  `score` int(3) DEFAULT '100' COMMENT '积分率',
  `ordid` tinyint(3) unsigned DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_category
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_follow`;
CREATE TABLE `weixin_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`follow_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_follow
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user_msgtip
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_msgtip`;
CREATE TABLE `weixin_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_msgtip
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_user_stat
-- ----------------------------
DROP TABLE IF EXISTS `weixin_user_stat`;
CREATE TABLE `weixin_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_user_stat
-- ----------------------------
INSERT INTO `weixin_user_stat` VALUES ('9', 'login', '1', '1353909837');
INSERT INTO `weixin_user_stat` VALUES ('13', 'login', '1', '1353909897');
INSERT INTO `weixin_user_stat` VALUES ('16', 'login', '1', '1353909964');
INSERT INTO `weixin_user_stat` VALUES ('15', 'login', '1', '1353910012');
INSERT INTO `weixin_user_stat` VALUES ('11', 'login', '1', '1353910069');
INSERT INTO `weixin_user_stat` VALUES ('7', 'login', '1', '1353910109');
INSERT INTO `weixin_user_stat` VALUES ('12', 'login', '1', '1353910146');
INSERT INTO `weixin_user_stat` VALUES ('17', 'login', '1', '1353910177');
INSERT INTO `weixin_user_stat` VALUES ('20', 'login', '1', '1353910221');
INSERT INTO `weixin_user_stat` VALUES ('6', 'login', '1', '1353910265');
INSERT INTO `weixin_user_stat` VALUES ('18', 'login', '1', '1353910348');
INSERT INTO `weixin_user_stat` VALUES ('8', 'login', '1', '1353910407');
INSERT INTO `weixin_user_stat` VALUES ('19', 'login', '1', '1353910445');
INSERT INTO `weixin_user_stat` VALUES ('10', 'login', '1', '1353910499');
INSERT INTO `weixin_user_stat` VALUES ('14', 'login', '1', '1353910539');
INSERT INTO `weixin_user_stat` VALUES ('21', 'register', '1', '1374633583');
INSERT INTO `weixin_user_stat` VALUES ('21', 'login', '1', '1374633583');
INSERT INTO `weixin_user_stat` VALUES ('22', 'register', '1', '1374724879');
INSERT INTO `weixin_user_stat` VALUES ('22', 'login', '1', '1374724879');
INSERT INTO `weixin_user_stat` VALUES ('23', 'register', '1', '1374724936');
INSERT INTO `weixin_user_stat` VALUES ('23', 'login', '1', '1374724936');
INSERT INTO `weixin_user_stat` VALUES ('24', 'register', '1', '1374724990');
INSERT INTO `weixin_user_stat` VALUES ('24', 'login', '1', '1374724990');
INSERT INTO `weixin_user_stat` VALUES ('26', 'register', '1', '1375152929');
INSERT INTO `weixin_user_stat` VALUES ('26', 'login', '1', '1375152929');
INSERT INTO `weixin_user_stat` VALUES ('27', 'register', '1', '1375154088');
INSERT INTO `weixin_user_stat` VALUES ('27', 'login', '1', '1375154088');
INSERT INTO `weixin_user_stat` VALUES ('28', 'register', '1', '1375176967');
INSERT INTO `weixin_user_stat` VALUES ('28', 'login', '1', '1375176967');
INSERT INTO `weixin_user_stat` VALUES ('29', 'register', '1', '1375250687');
INSERT INTO `weixin_user_stat` VALUES ('29', 'login', '1', '1375250687');
INSERT INTO `weixin_user_stat` VALUES ('30', 'register', '1', '1388639401');
INSERT INTO `weixin_user_stat` VALUES ('30', 'login', '1', '1388639401');
INSERT INTO `weixin_user_stat` VALUES ('31', 'register', '1', '1389005403');
INSERT INTO `weixin_user_stat` VALUES ('31', 'login', '1', '1389005403');

-- ----------------------------
-- Table structure for weixin_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `weixin_verifycode`;
CREATE TABLE `weixin_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` bigint(12) unsigned NOT NULL,
  `code_type` tinyint(2) NOT NULL COMMENT '1: reg 2:log in',
  `date` int(9) NOT NULL,
  `code` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `times` smallint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_verify` (`mobile`,`code_type`,`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of weixin_verifycode
-- ----------------------------
INSERT INTO `weixin_verifycode` VALUES ('1', '2147483647', '0', '20141014', '140859', '0');
INSERT INTO `weixin_verifycode` VALUES ('2', '18030525005', '1', '20141014', '928971', '1');
INSERT INTO `weixin_verifycode` VALUES ('3', '13902601045', '1', '20141014', '178950', '1');
INSERT INTO `weixin_verifycode` VALUES ('4', '18030525005', '1', '20141017', '448781', '2');
INSERT INTO `weixin_verifycode` VALUES ('5', '18608290235', '1', '20141022', '518363', '1');
INSERT INTO `weixin_verifycode` VALUES ('6', '15506292322', '1', '20141026', '113202', '1');
INSERT INTO `weixin_verifycode` VALUES ('7', '18982137130', '1', '20141110', '391332', '1');
INSERT INTO `weixin_verifycode` VALUES ('8', '18982137130', '1', '20141115', '857377', '1');
INSERT INTO `weixin_verifycode` VALUES ('9', '18030505004', '1', '20141130', '829952', '1');
INSERT INTO `weixin_verifycode` VALUES ('10', '18030525005', '1', '20141203', '397998', '1');

-- ----------------------------
-- Table structure for weixin_zhuanpan_config
-- ----------------------------
DROP TABLE IF EXISTS `weixin_zhuanpan_config`;
CREATE TABLE `weixin_zhuanpan_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hd_name` varchar(200) NOT NULL COMMENT '活动名称',
  `hd_info` varchar(255) NOT NULL COMMENT '活动说明',
  `hd_duijiang_info` varchar(255) NOT NULL COMMENT '兑奖信息',
  `hd_begin_time` varchar(30) NOT NULL,
  `hd_end_time` varchar(30) NOT NULL,
  `hd_chongfu_info` varchar(255) NOT NULL COMMENT '重复提示信息',
  `hd_end_info` varchar(255) NOT NULL COMMENT '活动结束说明',
  `hd_cishu` int(10) NOT NULL COMMENT '每天最大次数',
  `hd_renshu` int(10) NOT NULL COMMENT '//活动人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_zhuanpan_config
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_zhuanpan_list
-- ----------------------------
DROP TABLE IF EXISTS `weixin_zhuanpan_list`;
CREATE TABLE `weixin_zhuanpan_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `praisefeild` varchar(20) NOT NULL COMMENT '奖项标示字段',
  `praisename` varchar(20) NOT NULL COMMENT '奖项名字',
  `min` text NOT NULL COMMENT '最小角度',
  `max` text NOT NULL COMMENT '最大角度',
  `praisecontent` text NOT NULL COMMENT '奖项内容',
  `praisenumber` int(3) NOT NULL COMMENT '奖项库存次数',
  `chance` int(10) unsigned NOT NULL COMMENT '本奖项的概率',
  `shuliang` int(10) NOT NULL COMMENT '奖品数量',
  PRIMARY KEY (`id`),
  KEY `praisefeild` (`praisefeild`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奖项配置';

-- ----------------------------
-- Records of weixin_zhuanpan_list
-- ----------------------------

-- ----------------------------
-- Table structure for weixin_zhuanpan_log
-- ----------------------------
DROP TABLE IF EXISTS `weixin_zhuanpan_log`;
CREATE TABLE `weixin_zhuanpan_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL COMMENT '//用户ID',
  `username` varchar(200) NOT NULL COMMENT '//用户名',
  `u_phone` varchar(30) NOT NULL COMMENT '//用户手机号码',
  `u_name` varchar(30) NOT NULL COMMENT '//用户姓名',
  `snid` varchar(100) NOT NULL COMMENT '//SN号',
  `listid` int(10) NOT NULL COMMENT '//奖励ID',
  `addtime` varchar(30) NOT NULL COMMENT '//抽奖时间',
  `status` char(1) NOT NULL COMMENT '//发放状态',
  `do_time` varchar(30) NOT NULL COMMENT '//处理时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_zhuanpan_log
-- ----------------------------
