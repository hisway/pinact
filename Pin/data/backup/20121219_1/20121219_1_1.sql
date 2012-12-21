-- TuanPhp SQL Dump Program
-- 
-- DATE : 2012-12-19 17:48:35
-- Vol : 1
DROP TABLE IF EXISTS `pin_ad`;
CREATE TABLE `pin_ad` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_ad ( `id`, `board_id`, `type`, `name`, `url`, `content`, `extimg`, `extval`, `desc`, `start_time`, `end_time`, `clicks`, `add_time`, `ordid`, `status` ) VALUES  ('27','3','image','米','','1212/19/50d18a2dd7f56.jpg','','','','1355846400','1356710400','0','0','255','1');
DROP TABLE IF EXISTS `pin_adboard`;
CREATE TABLE `pin_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('1','首页焦点图','indexfocus','439','283','小图调用扩展图','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('2','首页会员下方','indexmb','0','0','图片调用扩展图','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('3','专辑页面焦点图','albumfocus','470','283','扩展字段值为用户ID','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('4','首页会员下方-左','banner','142','44','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('5','首页会员下方-右','banner','135','44','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('6','专辑页创建按钮上方','banner','170','60','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('7','专辑页创建按钮下方','banner','0','0','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('8','关注我们','followus','0','0','小图调用扩展图','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('9','首页顶部伸缩广告','banner','960','90','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('10','导航下方横幅','banner','960','90','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('11','底部横幅','banner','960','90','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('12','发现页热门标签下方','banner','200','100','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('13','详细页评论下方','banner','390','90','','1');
INSERT INTO pin_adboard ( `id`, `name`, `tpl`, `width`, `height`, `description`, `status` ) VALUES  ('14','详细页导航下方','banner','960','90','','1');
DROP TABLE IF EXISTS `pin_admin`;
CREATE TABLE `pin_admin` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_admin ( `id`, `username`, `password`, `role_id`, `last_ip`, `last_time`, `email`, `status` ) VALUES  ('1','admin','21232f297a57a5a743894a0e4a801fc3','1','127.0.0.1','1355466221','admin@8jys.com','1');
DROP TABLE IF EXISTS `pin_admin_auth`;
CREATE TABLE `pin_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_admin_role`;
CREATE TABLE `pin_admin_role` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_admin_role ( `id`, `name`, `remark`, `ordid`, `status` ) VALUES  ('1','超级管理员','超级管理员','0','1');
DROP TABLE IF EXISTS `pin_album`;
CREATE TABLE `pin_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('25','28','6','起个名字太累','专辑','','','a:1:{i:0;a:2:{s:3:\"img\";s:25:\"1212/19/50d1738e85ed9.jpg\";s:5:\"intro\";s:19:\"lkjzflk运动是否\";}}','1','255','0','1','0','0','1355903887');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('24','28','16','Eudora_寻寻','专辑','','','a:1:{i:0;a:2:{s:3:\"img\";s:25:\"1212/19/50d16e965530f.jpg\";s:5:\"intro\";s:4:\"4488\";}}','1','255','0','1','0','0','1355902614');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('19','28','15','Prickleman','默认','','','a:3:{i:0;a:2:{s:3:\"img\";s:25:\"1212/19/50d171e1b9ddb.jpg\";s:5:\"intro\";s:8:\"qqqqqqqq\";}i:1;a:2:{s:3:\"img\";s:25:\"1212/19/50d1716be56f6.jpg\";s:5:\"intro\";s:4:\"8888\";}i:2;a:2:{s:3:\"img\";s:25:\"1212/15/50cb8ee082c52.jpg\";s:5:\"intro\";s:17:\"33333333333333333\";}}','1','255','0','3','0','0','1355517666');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('20','28','20','熊小熊zz','专辑','','','a:3:{i:0;a:2:{s:3:\"img\";s:25:\"1212/19/50d162aa967f8.jpg\";s:5:\"intro\";s:3:\"888\";}i:1;a:2:{s:3:\"img\";s:25:\"1212/18/50d0181a05dac.jpg\";s:5:\"intro\";s:10:\"6666666666\";}i:2;a:2:{s:3:\"img\";s:25:\"1212/18/50d00d00c2a1a.jpg\";s:5:\"intro\";s:36:\"111111111111111111111111111111111111\";}}','1','255','0','3','0','0','1355812097');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('21','28','7','咕咕是一只猫','专辑','','','a:1:{i:0;a:2:{s:3:\"img\";s:25:\"1212/18/50d00d9bf1298.jpg\";s:5:\"intro\";s:15:\"222222222222222\";}}','1','255','0','1','0','0','1355812252');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('22','28','10','设计系小女生','专辑','','','a:3:{i:0;a:2:{s:3:\"img\";s:25:\"1212/18/50d0229637605.jpg\";s:5:\"intro\";s:4:\"8888\";}i:1;a:2:{s:3:\"img\";s:25:\"1212/18/50d014378aca9.jpg\";s:5:\"intro\";s:16:\"5555555555555555\";}i:2;a:2:{s:3:\"img\";s:25:\"1212/18/50d00e4316b98.jpg\";s:5:\"intro\";s:20:\"33333333333333333333\";}}','1','255','0','3','0','0','1355812419');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('23','28','8','枕水而眠','专辑','','','a:3:{i:0;a:2:{s:3:\"img\";s:25:\"1212/19/50d162de98714.jpg\";s:5:\"intro\";s:6:\"运动\";}i:1;a:2:{s:3:\"img\";s:25:\"1212/19/50d160cf86dfd.jpg\";s:5:\"intro\";s:12:\"999999999999\";}i:2;a:2:{s:3:\"img\";s:25:\"1212/18/50d011c948005.jpg\";s:5:\"intro\";s:15:\"444444444444444\";}}','1','255','0','3','0','0','1355813321');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('17','28','17','V小莲小莲V','默认专辑','','','a:5:{i:0;a:2:{s:3:\"img\";s:25:\"1212/18/50d02b6a5bcfd.jpg\";s:5:\"intro\";s:10:\"8888888888\";}i:1;a:2:{s:3:\"img\";s:25:\"1212/18/50cfd04b83e9e.jpg\";s:5:\"intro\";s:15:\"看青春演出\";}i:2;a:2:{s:3:\"img\";s:25:\"1212/15/50cb90216f6a0.jpg\";s:5:\"intro\";s:17:\"DDDDDDDDDDDDDDDDD\";}i:3;a:2:{s:3:\"img\";s:25:\"1212/15/50cb86e41efce.jpg\";s:5:\"intro\";s:17:\"22222222222222222\";}i:4;a:2:{s:3:\"img\";s:25:\"1212/14/50caef904c2f3.jpg\";s:5:\"intro\";s:33:\"附近找片空地，打羽毛球\";}}','1','255','0','4','0','0','1355476880');
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('18','28','11','彩色淘','默认专辑','','','a:1:{i:0;a:2:{s:3:\"img\";s:25:\"1212/14/50caf1a08f80f.jpg\";s:5:\"intro\";s:44:\"
练练空手道，一起运动出生大汗\";}}','1','255','0','1','0','0','1355477410');
DROP TABLE IF EXISTS `pin_album_cate`;
CREATE TABLE `pin_album_cate` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_album_cate ( `id`, `name`, `img`, `ordid`, `albums`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('28','体育运动','','0','0','1','体育运动','','');
DROP TABLE IF EXISTS `pin_album_comment`;
CREATE TABLE `pin_album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_album_follow`;
CREATE TABLE `pin_album_follow` (
  `uid` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`album_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_album_item`;
CREATE TABLE `pin_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`item_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('17','63','附近找片空地，打羽毛球','1355476880');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('18','64','
练练空手道，一起运动出生大汗','1355477410');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('17','65','22222222222222222','1355515621');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('19','66','33333333333333333','1355517666');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('17','67','DDDDDDDDDDDDDDDDD','1355517985');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('17','68','看青春演出','1355796556');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('20','69','111111111111111111111111111111111111','1355812097');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('21','70','222222222222222','1355812252');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('22','71','33333333333333333333','1355812419');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('23','72','444444444444444','1355813321');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('22','73','5555555555555555','1355813943');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('20','74','6666666666','1355814938');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('22','75','8888','1355817622');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('17','76','8888888888','1355819882');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('23','77','999999999999','1355899089');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('20','78','888','1355899563');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('23','79','运动','1355899614');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('24','80','4488','1355902614');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('19','81','8888','1355903340');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('19','82','qqqqqqqq','1355903458');
INSERT INTO pin_album_item ( `album_id`, `item_id`, `intro`, `add_time` ) VALUES  ('25','83','lkjzflk运动是否','1355903887');
DROP TABLE IF EXISTS `pin_article`;
CREATE TABLE `pin_article` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_article ( `id`, `cate_id`, `title`, `colors`, `author`, `tags`, `img`, `intro`, `info`, `comments`, `hits`, `ordid`, `add_time`, `last_time`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('1','2','111111111','','111111111','','','111111111111','<p style=\"text-indent:2em;\">
	<img src=\"http://localhost/pin/static/js/kindeditor/plugins/emoticons/images/9.gif\" border=\"0\" alt=\"\" /> 
</p>
<img src=\"/pin/data/upload/editer/image/2012/12/15/50cb77ee70834.jpg\" alt=\"\" />','0','0','255','1355511864','0','1','','','');
DROP TABLE IF EXISTS `pin_article_cate`;
CREATE TABLE `pin_article_cate` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('1','1','网站信息','','','0','0','255','1','','','');
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('2','1','关于我们','','','1','1|','255','1','','','');
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('3','1','联系我们','','','1','1|','255','1','','','');
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('5','1','内置文章','','','0','0','255','1','','','');
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('6','1','积分规则','','','5','5|','255','1','','','');
INSERT INTO pin_article_cate ( `id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('7','1','兑换说明','','','5','5|','255','1','','','');
DROP TABLE IF EXISTS `pin_article_page`;
CREATE TABLE `pin_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('2','关于我们','<br />','','','','0');
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('3','联系我们','','','','','0');
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('4','加入我们','<br />','','','','0');
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('6','会员加减分规则','<p>
	<strong>积分兑换</strong>
</p>
<p>
	<br />
</p>
<p>
	积分是为了答谢支持PinPHP网站会员而制定的一种奖励方式，您可以进入账户中的积分页面查看积分明细，同时PinPHP会推出各类积分兑换活动，请随时关注关于积分的活动告知。
</p>
<p>
	<br />
</p>
<p>
	<strong>积分获得：</strong>
</p>
<p>
	<br />
</p>
<p>
	1、会员注册：会员注册即送20点积分，一个账户只能得一次注册积分；
</p>
<p>
	<br />
</p>
<p>
	2、每日登录：会员每日首次登录PinPHP网站能获得10积分，每日上限5次；
</p>
<p>
	<br />
</p>
<p>
	3、发布分享：会员分享新商品到PinPHP网站能获得20积分，每日上限10次；
</p>
<p>
	<br />
</p>
<p>
	4、添加喜欢：针对PinPHP网站上的商品会员点击喜欢可获得1积分，每日上限10次；
</p>
<p>
	<br />
</p>
<p>
	5、添加到专辑：会员把喜欢的商品添加进个人的专辑中可获得2积分，每日上限10次；
</p>
<p>
	<br />
</p>
<p>
	6、转发分享：会员转发PinPHP网站上商品到其他网站上可获2积分，每日上限10次；
</p>
<p>
	<br />
</p>
<p>
	7、发布评论：会员评论PinPHP网站商品可获1积分，每日上线5次。
</p>
<p>
	<br />
</p>
<p>
	<strong>积分扣除：</strong>
</p>
<p>
	<br />
</p>
<p>
	1、删除分享：会员删除自己添加的商品减20积分，每日上限100次；
</p>
<p>
	<br />
</p>
<p>
	2、兑换商品：会员使用积分兑换自己喜欢的商品会扣除相对应的积分。
</p>
<p>
	<br />
</p>
<div>
	<br />
</div>','','','','0');
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('7','兑换说明','1、奖品价格已经包含邮寄费用在内，您无须另行支付。兑奖前请确认您的帐户中有足够数量的积分！<br />
2、奖品寄送方式：QQ直充类奖品兑奖审核通过后会直接充入您的QQ号码中，其余虚拟奖品采用在线发送卡密的方式；实体奖品全部采用快递方式。<br />
3、虚拟奖品有效期：虚拟卡密类奖品除手机充值卡10/20/30元卡密，因为充值卡金额少，有效期比较短，大约一周左右,其余卡密类奖品有效期为1个月；虚拟卡直冲类为即时发货即时到账，无有效期限制！积分兑换含有有效期的奖品，请尽快充值使用，如过有效期未充值导致卡密失效，PinPHP网概不负责。<br />
4、确认您的奖品邮寄地址、联系电话正确无误后提交兑奖申请！如因您未提供详细信息或信息错误，导致奖品错投或无法寄送，网站不负任何责任，并不再补发奖品。<br />
5、实物奖品将在兑奖提交后的2-5工作日内发出(奖品状态您可通过“积分订单”查询)！<br />
6、实物奖品按照会员申请的要求发出去之后，无破损、短缺等质量问题或因个人喜好（色泽、外观）要求退换货将无法受理。<br />
7、兑奖中心所有实物奖品颜色均为随机发送, 敬请谅解！<br />
<br />
<strong>注意：</strong><br />
<br />
1、签收奖品前，务必仔细检查货物是否完好！如果发现有破损、短缺情况，请直接让快递公司退回，无需承担任何费用，并及时与我们联系。签收后提出货物破损等问题，一律责任自负！无法受理退换货要求！他人代签与本人签收一样。<br />
2、收到奖品7天内，若发现质量问题，请及时与我们联系并提供图片说明。如因个人使用不当导致的奖品问题无法更换。<br />
3、如提交兑奖后，由于商家缺货导致无法发货的情况，会员会收到站内信息通知并取消兑奖，请重新选择其他奖品兑换。<br />
<br />
兑奖过程中如有问题请通过“联系我们”联系咨询。<br />
以上奖品图片仅供参考,请您以收取的实物为准！如有异议请联系客服人员确认奖品情况。<br />','','','','0');
DROP TABLE IF EXISTS `pin_auto_user`;
CREATE TABLE `pin_auto_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_auto_user ( `id`, `name`, `users` ) VALUES  ('1','马甲','熊小熊zz,安土桃山,晨雪熙,V小莲小莲V,Eudora_寻寻,Prickleman,泡芙小米粒,想太多妹子,跳房子123,彩色淘,设计系小女生,wingsa区,枕水而眠,咕咕是一只猫,起个名字太累');
DROP TABLE IF EXISTS `pin_badword`;
CREATE TABLE `pin_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_flink`;
CREATE TABLE `pin_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_flink_cate`;
CREATE TABLE `pin_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_ipban`;
CREATE TABLE `pin_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_item`;
CREATE TABLE `pin_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned DEFAULT NULL,
  `orig_id` smallint(6) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `uname` varchar(20) NOT NULL,
  `key_id` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `url` text,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:商品,2:图片',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `address` char(50) NOT NULL,
  `tag_cache` text NOT NULL,
  `comments_cache` text NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keys` varchar(255) DEFAULT NULL,
  `seo_desc` text,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_id` (`key_id`),
  KEY `cid` (`cate_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('63','333','3','17','V小莲小莲V','','打羽毛球','附近找片空地，打羽毛球','1212/14/50caef904c2f3.jpg','0.00','0.00','','1','66','1','3','0','1355476880','2012-12-17','2012-12-21','杭州','a:3:{i:420;s:6:\"空地\";i:421;s:9:\"羽毛球\";i:422;s:6:\"附近\";}','a:2:{i:0;a:4:{s:2:\"id\";i:3;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:4:\"3333\";}i:1;a:4:{s:2:\"id\";i:2;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:4:\"2222\";}}','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('64','333','3','11','彩色淘','',' 练练空手道','练练空手道，一起运动出生大汗','1212/14/50caf1a08f80f.jpg','0.00','0.00','','1','23','1','0','0','1355477410','2012-12-17','2012-12-21','杭州','a:5:{i:423;s:6:\"生大\";i:424;s:9:\"空手道\";i:425;s:6:\"练练\";i:426;s:6:\"一起\";i:427;s:6:\"运动\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('65','338','3','17','V小莲小莲V','','看画展','博物馆看画展','1212/15/50cb86e41efce.jpg','0.00','0.00','','1','4','1','0','0','1355515621','2012-12-17','2012-12-21','杭州','a:1:{i:433;s:6:\"画展\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('66','335','3','15','Prickleman','','骑自行车','西湖休闲骑','1212/15/50cb8ee082c52.jpg','0.00','0.00','','1','5','1','0','0','1355517666','2012-12-17','2012-12-21','杭州','a:1:{i:432;s:9:\"自行车\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('68','338','3','17','V小莲小莲V','','演唱会','看青春演出','1212/18/50cfd04b83e9e.jpg','10.00','0.00','','1','3','1','3','0','1355796556','2012-12-17','2012-12-21','杭州','a:1:{i:434;s:9:\"演唱会\";}','a:2:{i:0;a:4:{s:2:\"id\";i:6;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:12:\"我要参加\";}i:1;a:4:{s:2:\"id\";i:5;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:6:\"不错\";}}','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('69','341','3','20','熊小熊zz','','111111111111111','111111111111111111111111111111111111','1212/18/50d00d00c2a1a.jpg','11.00','0.00','','1','1','0','0','0','1355812097','2012-12-17','2012-12-21','杭州','a:1:{i:435;s:15:\"111111111111111\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('70','341','3','7','咕咕是一只猫','','222222','222222222222222','1212/18/50d00d9bf1298.jpg','22.00','0.00','','1','5','0','0','0','1355812252','2012-12-17','2012-12-21','杭州','a:1:{i:436;s:6:\"222222\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('71','341','3','10','设计系小女生','','33333333','33333333333333333333','1212/18/50d00e4316b98.jpg','33.00','0.00','','1','0','0','0','0','1355812419','2012-12-17','2012-12-21','杭州','a:1:{i:437;s:8:\"33333333\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('72','341','3','8','枕水而眠','','444444444','444444444444444','1212/18/50d011c948005.jpg','0.00','0.00','','1','8','0','0','0','1355813321','2012-12-17','2012-12-21','西湖','a:1:{i:438;s:9:\"444444444\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('73','341','3','10','设计系小女生','','5555555555','5555555555555555','1212/18/50d014378aca9.jpg','5.00','0.00','','1','2','0','0','0','1355813943','2012-12-17','2012-12-21','杭州','a:1:{i:443;s:3:\"888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('74','341','3','20','熊小熊zz','','66666666','6666666666','1212/18/50d0181a05dac.jpg','6.00','0.00','','1','1','1','2','0','1355814938','2012-12-19','2012-12-19','杭州','a:2:{i:446;s:8:\"66666666\";i:443;s:3:\"888\";}','a:2:{i:0;a:4:{s:2:\"id\";i:8;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:3:\"www\";}i:1;a:4:{s:2:\"id\";i:7;s:3:\"uid\";i:21;s:5:\"uname\";s:6:\"hisway\";s:4:\"info\";s:3:\"ggg\";}}','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('75','340','3','10','设计系小女生','','888','8888','1212/18/50d0229637605.jpg','0.00','0.00','','1','9','1','0','0','1355817622','2012-12-11','2012-12-20','杭州','a:1:{i:443;s:3:\"888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('76','341','3','17','V小莲小莲V','','888888888','8888888888','1212/18/50d02b6a5bcfd.jpg','0.00','0.00','','1','1','0','0','0','1355819882','2012-12-19','2012-12-19','德胜新村','a:1:{i:443;s:3:\"888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('77','341','3','8','枕水而眠','','9999运动','999999999999','1212/19/50d160cf86dfd.jpg','0.00','0.00','','1','7','0','0','0','1355899089','2012-12-20','2012-12-25','西湖','a:2:{i:427;s:6:\"运动\";i:444;s:4:\"9999\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('78','341','3','20','熊小熊zz','','888','888','1212/19/50d162aa967f8.jpg','0.00','0.00','','1','1','0','0','0','1355899562','2012-12-11','2012-12-04','888','a:1:{i:443;s:3:\"888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('79','338','3','8','枕水而眠','','运动','运动','1212/19/50d162de98714.jpg','0.00','0.00','','1','4','0','0','0','1355899614','2012-12-15','2012-12-24','运动','a:1:{i:445;s:3:\"777\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('80','340','3','16','Eudora_寻寻','','4488','4488','1212/19/50d16e965530f.jpg','0.00','0.00','','1','3','0','0','0','1355902614','2012-12-13','2012-12-11','44888','a:1:{i:443;s:3:\"888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('81','339','3','15','Prickleman','','8888','8888','1212/19/50d1716be56f6.jpg','0.00','0.00','','1','3','0','0','0','1355903340','2012-12-13','2012-12-24','8888','a:1:{i:448;s:4:\"8888\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('82','339','3','15','Prickleman','','qqqqqqq','qqqqqqqq','1212/19/50d171e1b9ddb.jpg','0.00','0.00','','1','0','0','0','0','1355903457','2012-12-04','2012-12-18','qqqq','a:1:{i:449;s:7:\"qqqqqqq\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `start_time`, `end_time`, `address`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('83','339','3','6','起个名字太累','','wwwwwwwwww','lkjzflk运动是否','1212/19/50d1738e85ed9.jpg','0.00','0.00','','1','1','0','0','0','1355903887','2012-12-17','2012-12-16','wwwwwwwwwwww','a:1:{i:450;s:10:\"wwwwwwwwww\";}','','','','','255','1');
DROP TABLE IF EXISTS `pin_item_attr`;
CREATE TABLE `pin_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_attr ( `id`, `item_id`, `attr_name`, `attr_value` ) VALUES  ('2','63','时间','2012.12.15');
INSERT INTO pin_item_attr ( `id`, `item_id`, `attr_name`, `attr_value` ) VALUES  ('3','63','地点','杭州');
INSERT INTO pin_item_attr ( `id`, `item_id`, `attr_name`, `attr_value` ) VALUES  ('4','68','时间','12.25');
INSERT INTO pin_item_attr ( `id`, `item_id`, `attr_name`, `attr_value` ) VALUES  ('5','68','地点','杭州');
DROP TABLE IF EXISTS `pin_item_cate`;
CREATE TABLE `pin_item_cate` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('341','活动灵感','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('340','休闲娱乐','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('339','做做公益','','0','0','','','','0','0','0','1','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('338','演出展会','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('337','结伴出游','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('336','朋友聚会','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('335','骑自行车','','333','333|','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('334','海吃海喝','','0','0','','','','0','0','0','0','255','1','0','0','','','');
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('333','体育运动','','0','0','','','','0','0','0','0','255','1','0','0','','','');
DROP TABLE IF EXISTS `pin_item_cate_tag`;
CREATE TABLE `pin_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_item_comment`;
CREATE TABLE `pin_item_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('1','63','21','hisway','11111111111111111','1355478269','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('2','63','21','hisway','2222','1355478516','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('3','63','21','hisway','3333','1355478540','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('4','68','21','hisway','好','1355796702','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('5','68','21','hisway','不错','1355796772','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('6','68','21','hisway','我要参加','1355796777','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('7','74','21','hisway','ggg','1355820437','1');
INSERT INTO pin_item_comment ( `id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status` ) VALUES  ('8','74','21','hisway','www','1355820440','1');
DROP TABLE IF EXISTS `pin_item_img`;
CREATE TABLE `pin_item_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('284','63','1212/14/50caef904c2f3.jpg','1355476880','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('285','64','1212/14/50caf1a08f80f.jpg','1355477410','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('286','65','1212/15/50cb86e41efce.jpg','1355515621','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('287','66','1212/15/50cb8ee082c52.jpg','1355517666','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('288','67','1212/15/50cb90216f6a0.jpg','1355517985','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('289','68','1212/18/50cfd04b83e9e.jpg','1355796556','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('290','69','1212/18/50d00d00c2a1a.jpg','1355812097','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('291','70','1212/18/50d00d9bf1298.jpg','1355812252','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('292','71','1212/18/50d00e4316b98.jpg','1355812419','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('293','72','1212/18/50d011c948005.jpg','1355813321','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('294','73','1212/18/50d014378aca9.jpg','1355813943','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('295','74','1212/18/50d0181a05dac.jpg','1355814938','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('296','75','1212/18/50d0229637605.jpg','1355817622','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('297','76','1212/18/50d02b6a5bcfd.jpg','1355819882','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('298','77','1212/19/50d160cf86dfd.jpg','1355899089','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('299','78','1212/19/50d162aa967f8.jpg','1355899562','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('300','79','1212/19/50d162de98714.jpg','1355899614','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('301','80','1212/19/50d16e965530f.jpg','1355902614','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('302','81','1212/19/50d1716be56f6.jpg','1355903340','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('303','82','1212/19/50d171e1b9ddb.jpg','1355903458','255','1');
INSERT INTO pin_item_img ( `id`, `item_id`, `url`, `add_time`, `ordid`, `status` ) VALUES  ('304','83','1212/19/50d1738e85ed9.jpg','1355903887','255','1');
DROP TABLE IF EXISTS `pin_item_like`;
CREATE TABLE `pin_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('63','21','1355477017');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('64','21','1355500926');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('68','21','1355796687');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('66','21','1355807590');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('65','21','1355807597');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('74','21','1355820425');
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('75','21','1355898831');
DROP TABLE IF EXISTS `pin_item_orig`;
CREATE TABLE `pin_item_orig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_orig ( `id`, `img`, `name`, `url`, `ordid` ) VALUES  ('3','','自发','','255');
DROP TABLE IF EXISTS `pin_item_site`;
CREATE TABLE `pin_item_site` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_item_tag`;
CREATE TABLE `pin_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('63','420');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('63','421');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('63','422');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('64','423');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('64','424');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('64','425');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('64','426');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('64','427');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('65','433');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('66','432');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('67','431');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('68','434');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('69','435');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('70','436');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('71','437');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('72','438');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('73','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('74','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('74','446');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('75','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('76','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('77','427');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('77','444');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('78','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('79','445');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('80','443');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('81','448');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('82','449');
INSERT INTO pin_item_tag ( `item_id`, `tag_id` ) VALUES  ('83','450');
DROP TABLE IF EXISTS `pin_mail_queue`;
CREATE TABLE `pin_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_menu`;
CREATE TABLE `pin_menu` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('1','全局','0','setting','index','','','0','7','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('2','核心设置','1','setting','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('3','全局参数','148','setting','index','&type=site','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('4','邮件设置','148','setting','index','&type=mail','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('172','专辑管理','285','album','index','','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('6','菜单管理','2','menu','index','','','0','7','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('7','新增','6','menu','add','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('8','编辑','6','menu','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('9','删除','6','menu','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('10','文章','0','operate','index','','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('11','广告管理','10','advert','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('12','广告管理','11','ad','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('13','广告位管理','11','adboard','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('14','友情链接','10','flink','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('15','友情链接','14','flink','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('16','链接分类','14','flink_cate','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('17','新增','15','flink','add','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('18','编辑','15','flink','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('19','删除','15','flink','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('20','新增','16','flink_cate','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('21','编辑','16','flink_cate','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('22','删除','16','flink_cate','del','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('23','新增','12','ad','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('24','编辑','12','ad','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('25','删除','12','ad','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('26','新增','13','adboard','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('27','编辑','13','adboard','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('28','删除','13','adboard','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('29','数据','0','data','index','','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('258','商品分类','256','score_item_cate','index','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('31','数据库管理','29','backup','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('32','数据备份','31','backup','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('33','数据恢复','31','backup','restore','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('34','缓存管理','254','cache','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('195','登陆接口','245','oauth','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('36','黑名单管理','117','ipban','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('37','新增','36','ipban','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('38','编辑','36','ipban','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('50','活动','0','content','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('51','活动管理','50','article','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('52','活动管理','51','item','index','','','1','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('54','编辑','52','article','edit','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('190','删除','52','item','delete','','','0','4','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('56','活动分类','51','item_cate','index','','','1','6','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('57','新增','56','article_cate','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('58','编辑','56','article_cate','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('59','删除','56','article_cate','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('60','管理员管理','1','admin','index','','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('61','管理员管理','60','admin','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('62','新增','61','admin','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('63','编辑','61','admin','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('64','删除','61','admin','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('65','角色管理','60','admin_role','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('66','新增','65','admin_role','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('70','用户','0','user','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('119','新增','149','user','add','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('118','编辑','149','user','edit','','','0','4','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('117','会员管理','70','user','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('156','文章分类','154','article_cate','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('151','导航设置','216','nav','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('149','会员管理','117','user','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('150','删除','149','user','delete','','','0','5','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('152','主导航','151','nav','index','&type=main','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('153','底部导航','151','nav','index','&type=bottom','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('154','文章管理','10','article','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('155','文章管理','154','article','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('148','站点设置','2','setting','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('157','添加文章','155','article','add','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('158','编辑','155','article','edit','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('159','删除','155','article','delete','','','0','4','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('160','新增','156','article_cate','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('161','编辑','156','article_cate','编辑','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('162','删除','156','article_cate','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('164','活动采集','50','item_collect','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('173','专辑管理','172','album','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('174','专辑分类','172','album_cate','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('175','新增','174','album_cate','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('176','编辑','174','album_cate','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('177','删除','174','album_cate','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('178','敏感词管理','254','badword','index','','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('179','新增','178','badword','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('180','编辑','178','badword','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('181','删除','36','ipban','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('182','删除','178','badword','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('255','采集马甲','117','auto_user','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('184','标签管理','254','tag','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('185','活动接口','245','item_site','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('186','活动评论','51','item_comment','index','','','0','7','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('187','删除','186','item_comment','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('265','删除','257','score_item','edit','','','0','4','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('250','一键删除','51','item','delete_search','','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('198','新增','196','message','add','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('199','活动来源','51','item_orig','index','','','0','6','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('200','新增','199','item_orig','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('201','编辑','199','item_orig','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('202','删除','199','item_orig','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('203','活动审核','51','item','check','','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('249','添加活动','51','item','add','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('259','新增','258','score_item_cate','add','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('269','积分设置','2','score','setting','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('210','专辑审核','172','album','check','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('257','积分商品','256','score_item','index','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('212','日志管理','29','log','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('213','管理员日志','212','log','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('214','用户日志','212','log','user','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('215','积分日志','212','log','score','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('216','界面设置','1','setting','index','&type=show','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('256','积分商城','70','score_item','index','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('254','系统数据','29','tag','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('264','编辑','257','score_item','edit','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('263','添加商品','257','score_item','add','','','0','2','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('262','积分订单','256','score_order','index','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('261','删除','258','score_item_cate','delete','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('260','编辑','258','score_item_cate','edit','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('232','站内信管理','70','message','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('233','系统通知','232','message','index','&type=1','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('234','用户私信','232','message','index','&type=2','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('235','通知模版','2','message_tpl','index','&type=msg','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('236','添加模版','235','message_tpl','add','','','0','7','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('237','编辑','235','message_tpl','edit','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('238','删除','235','message_tpl','delete','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('240','单页管理','154','article','page','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('242','积分记录','269','score','logs','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('244','应用','0','plugin','index','','','0','6','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('245','系统接口','244','apis','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('246','应用管理','244','plugin','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('247','应用中心','246','plugin','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('248','已安装应用','246','plugin','list','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('252','用户整合','245','integrate','index','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('253','图片模式','52','item','index','&sm=image','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('267','批量注册','149','user','add_users','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('270','邮件模板','235','message_tpl','index','&type=mail','','0','6','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('271','短消息模板','235','message_tpl','index','&type=msg','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('272','附件设置','148','setting','index','&type=attachment','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('273','显示设置','216','setting','index','&type=style','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('274','模板管理','216','template','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('275','站点设置','148','setting','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('276','积分设置','269','score','setting','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('277','活动管理','52','item','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('278','文章管理','155','article','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('279','会员管理','149','user','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('280','积分商品','257','score_item','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('282','SEO设置','2','seo','url','','','0','5','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('283','UR静态化','282','seo','url','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('284','页面SEO','282','seo','page','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('285','专辑','0','album','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('286','注册登陆','2','setting','user','','','0','2','1');
DROP TABLE IF EXISTS `pin_message`;
CREATE TABLE `pin_message` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_message_tpl`;
CREATE TABLE `pin_message_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_message_tpl ( `id`, `type`, `is_sys`, `name`, `alias`, `content` ) VALUES  ('1','msg','1','登录','login','<p>
	欢迎
</p>
<p>
	<br />
</p>
<div>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">活动网是一个集活动与分享与一体的网站，它会带给你惊喜，它让你走出家门，和朋友一起，分享每一次活动乐趣，惊喜不断<span>~</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">为了更好地开始专属于你的活动之旅，你可以：</span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">1<span>、发现更多活动</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">2<span>、寻找喜好相投的好友</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">4<span>、创建属于自己的专辑</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">5<span>、邀请你的好友一起参加活动</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span>
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">6<span>、分享更多好东西</span></span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">欢迎联系使用活动网，我们随时恭候你的提问和建议。</span><span style=\"font-size:10.5000pt;font-family:\'宋体\';\"></span> 
	</p>
	<p>
		<span style=\"font-size:10.5000pt;font-family:\'宋体\';\">祝您玩的愉快<span>^^</span></span> 
	</p>
</div>
<p>
	<br />
</p>');
INSERT INTO pin_message_tpl ( `id`, `type`, `is_sys`, `name`, `alias`, `content` ) VALUES  ('3','mail','1','找回密码','findpwd','<p>
	尊敬的{$username}:
</p>
<p style=\"padding-left:30px;\">
	您好, 您刚才在 {$site_name} 申请了重置密码，请点击下面的链接进行重置：
</p>
<p style=\"padding-left:30px;\">
	<a href=\"{$reset_url}\">{$reset_url}</a> 
</p>
<p style=\"padding-left:30px;\">
	此链接只能使用一次, 如果失效请重新申请. 如果以上链接无法点击，请将它拷贝到浏览器(例如IE)的地址栏中。
</p>
<p style=\"text-align:right;\">
	{$site_name}
</p>
<p style=\"text-align:right;\">
	{$send_time}
</p>');
DROP TABLE IF EXISTS `pin_nav`;
CREATE TABLE `pin_nav` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('1','main','发现','book','','0','255','sys','0');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('2','main','专辑','album','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('9','main','找活动','cate','?m=book&a=cate&cid=333','0','255','','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('4','bottom','发现','book','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('5','main','兑换','exchange','','0','255','sys','0');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('6','bottom','专辑','album','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('7','bottom','集市','cate','?m=book&a=cate&cid=1','0','255','','0');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('8','bottom','兑换','exchange','','0','255','sys','0');
DROP TABLE IF EXISTS `pin_oauth`;
CREATE TABLE `pin_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_oauth ( `id`, `code`, `name`, `config`, `desc`, `author`, `ordid`, `status` ) VALUES  ('10','sina','新浪微博登录','a:2:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";}','申请地址：http://open.weibo.com/','PinPHP TEAM','255','1');
INSERT INTO pin_oauth ( `id`, `code`, `name`, `config`, `desc`, `author`, `ordid`, `status` ) VALUES  ('9','qq','QQ登录','a:2:{s:7:\"app_key\";s:9:\"100346701\";s:10:\"app_secret\";s:32:\"03c2cb5757c640bc3b3db01a14378090\";}','申请地址：http://connect.opensns.qq.com/','PinPHP TEAM','255','1');
DROP TABLE IF EXISTS `pin_score_item`;
CREATE TABLE `pin_score_item` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_score_item_cate`;
CREATE TABLE `pin_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_score_log`;
CREATE TABLE `pin_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('1','9','wingsa区','login','10','1353909837');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('2','13','想太多妹子','login','10','1353909897');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('3','16','Eudora_寻寻','login','10','1353909964');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('4','15','Prickleman','login','10','1353910012');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('5','11','彩色淘','login','10','1353910069');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('6','7','咕咕是一只猫','login','10','1353910109');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('7','12','跳房子123','login','10','1353910146');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('8','17','V小莲小莲V','login','10','1353910177');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('9','20','熊小熊zz','login','10','1353910221');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('10','6','起个名字太累','login','10','1353910265');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('11','18','晨雪熙','login','10','1353910348');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('12','8','枕水而眠','login','10','1353910407');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('13','19','安土桃山','login','10','1353910445');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('14','10','设计系小女生','login','10','1353910499');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('15','14','泡芙小米粒','login','10','1353910539');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('16','21','hisway','register','20','1355469931');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('17','21','hisway','login','10','1355469931');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('18','21','hisway','login','10','1355477014');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('19','21','hisway','likeitem','1','1355477017');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('20','21','hisway','likeitem','1','1355500926');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('21','21','hisway','login','10','1355792698');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('22','21','hisway','likeitem','1','1355796687');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('23','21','hisway','likeitem','1','1355807590');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('24','21','hisway','likeitem','1','1355807597');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('25','21','hisway','likeitem','1','1355820425');
INSERT INTO pin_score_log ( `id`, `uid`, `uname`, `action`, `score`, `add_time` ) VALUES  ('26','21','hisway','likeitem','1','1355898831');
DROP TABLE IF EXISTS `pin_score_order`;
CREATE TABLE `pin_score_order` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_setting`;
CREATE TABLE `pin_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_name','活动网','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_title','活动网','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_keyword','活动网','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_description','找活动，上活动网！','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_status','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('closed_reason','网站升级中。。','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_icp','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('statistics_code','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('statics_url','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('mail_server','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_check','0','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('score_rule','a:16:{s:8:\"register\";s:2:\"20\";s:13:\"register_nums\";s:1:\"1\";s:5:\"login\";s:2:\"10\";s:10:\"login_nums\";s:1:\"5\";s:7:\"pubitem\";s:2:\"20\";s:12:\"pubitem_nums\";s:2:\"10\";s:8:\"likeitem\";s:1:\"1\";s:13:\"likeitem_nums\";s:2:\"20\";s:9:\"joinalbum\";s:1:\"2\";s:14:\"joinalbum_nums\";s:2:\"10\";s:6:\"fwitem\";s:1:\"2\";s:11:\"fwitem_nums\";s:2:\"10\";s:6:\"pubcmt\";s:1:\"1\";s:11:\"pubcmt_nums\";s:1:\"5\";s:7:\"delitem\";s:3:\"-20\";s:12:\"delitem_nums\";s:3:\"100\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('album_cover_items','6','专辑封面显示图片数量');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('integrate_code','default','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('integrate_config','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('hot_tags','运动,羽毛球,户外,公益,888','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_spage_max','6','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_spage_size','5','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('book_page_max','100','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('default_keyword','找活动。','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('album_default_title','专辑','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('avatar_size','24,32,48,64,100,200','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attr_allow_exts','jpg,gif,png,jpeg,swf','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attr_allow_size','2048','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('itemcate_img','a:2:{s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"170\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_protocol','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_cover_comments','4','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('user_intro_default','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('ipban_switch','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('score_item_img','a:4:{s:6:\"swidth\";s:3:\"210\";s:7:\"sheight\";s:3:\"210\";s:6:\"bwidth\";s:3:\"350\";s:7:\"bheight\";s:3:\"350\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('seo_config','a:6:{s:4:\"book\";a:3:{s:5:\"title\";s:23:\"{tag_name}-{site_title}\";s:8:\"keywords\";s:23:\"找活动，{site_name}\";s:11:\"description\";s:18:\"{site_description}\";}s:4:\"cate\";a:3:{s:5:\"title\";s:23:\"{cate_name}-{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:5:\"album\";a:3:{s:5:\"title\";s:6:\"专辑\";s:8:\"keywords\";s:24:\"{site_name},活动专辑\";s:11:\"description\";s:18:\"{site_description}\";}s:10:\"album_cate\";a:3:{s:5:\"title\";s:11:\"{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:12:\"album_detail\";a:3:{s:5:\"title\";s:13:\"{album_title}\";s:8:\"keywords\";s:13:\"{album_intro}\";s:11:\"description\";s:11:\"Description\";}s:4:\"item\";a:3:{s:5:\"title\";s:12:\"{item_title}\";s:8:\"keywords\";s:10:\"{item_tag}\";s:11:\"description\";s:12:\"{item_intro}\";}}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_img','a:2:{s:5:\"width\";s:3:\"210\";s:6:\"height\";s:4:\"1000\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_simg','a:2:{s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_bimg','a:2:{s:5:\"width\";s:3:\"468\";s:6:\"height\";s:4:\"1000\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attach_path','data/upload/','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_distance','200','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_status','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_closed_reason','<h1>暂时关闭注册</h1>','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('index_wall','1','');
DROP TABLE IF EXISTS `pin_tag`;
CREATE TABLE `pin_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('434','演唱会');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('433','画展');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('432','自行车');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('450','wwwwwwwwww');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('427','运动');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('426','一起');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('425','练练');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('424','空手道');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('423','生大');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('422','附近');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('421','羽毛球');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('420','空地');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('449','qqqqqqq');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('448','8888');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('447','4488');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('446','66666666');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('445','777');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('443','888');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('444','9999');
DROP TABLE IF EXISTS `pin_topic`;
CREATE TABLE `pin_topic` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('1','17','V小莲小莲V','22222222222222222','1212/15/50cb86e41efce.jpg','0','65','0','0','0','1355515621');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('2','15','Prickleman','33333333333333333','1212/15/50cb8ee082c52.jpg','0','66','0','0','0','1355517666');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('3','17','V小莲小莲V','DDDDDDDDDDDDDDDDD','1212/15/50cb90216f6a0.jpg','0','67','0','0','0','1355517985');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('4','17','V小莲小莲V','看青春演出','1212/18/50cfd04b83e9e.jpg','0','68','0','0','0','1355796556');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('5','20','熊小熊zz','111111111111111111111111111111111111','1212/18/50d00d00c2a1a.jpg','0','69','0','0','0','1355812098');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('6','7','咕咕是一只猫','222222222222222','1212/18/50d00d9bf1298.jpg','0','70','0','0','0','1355812252');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('7','10','设计系小女生','33333333333333333333','1212/18/50d00e4316b98.jpg','0','71','0','0','0','1355812419');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('8','8','枕水而眠','444444444444444','1212/18/50d011c948005.jpg','0','72','0','0','0','1355813321');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('9','10','设计系小女生','5555555555555555','1212/18/50d014378aca9.jpg','0','73','0','0','0','1355813944');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('10','20','熊小熊zz','6666666666','1212/18/50d0181a05dac.jpg','0','74','0','0','0','1355814938');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('11','10','设计系小女生','8888','1212/18/50d0229637605.jpg','0','75','0','0','0','1355817622');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('12','17','V小莲小莲V','8888888888','1212/18/50d02b6a5bcfd.jpg','0','76','0','0','0','1355819882');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('13','8','枕水而眠','999999999999','1212/19/50d160cf86dfd.jpg','0','77','0','0','0','1355899089');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('14','20','熊小熊zz','888','1212/19/50d162aa967f8.jpg','0','78','0','0','0','1355899563');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('15','8','枕水而眠','运动','1212/19/50d162de98714.jpg','0','79','0','0','0','1355899614');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('16','16','Eudora_寻寻','4488','1212/19/50d16e965530f.jpg','0','80','0','0','0','1355902614');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('17','15','Prickleman','8888','1212/19/50d1716be56f6.jpg','0','81','0','0','0','1355903340');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('18','15','Prickleman','qqqqqqqq','1212/19/50d171e1b9ddb.jpg','0','82','0','0','0','1355903458');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('19','6','起个名字太累','lkjzflk运动是否','1212/19/50d1738e85ed9.jpg','0','83','0','0','0','1355903887');
DROP TABLE IF EXISTS `pin_topic_at`;
CREATE TABLE `pin_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`tid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_topic_comment`;
CREATE TABLE `pin_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_topic_index`;
CREATE TABLE `pin_topic_index` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '发布者ID',
  `add_time` int(10) unsigned NOT NULL,
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_topic_index ( `uid`, `tid`, `author_id`, `add_time` ) VALUES  ('21','1','17','1355515621');
INSERT INTO pin_topic_index ( `uid`, `tid`, `author_id`, `add_time` ) VALUES  ('21','3','17','1355517985');
INSERT INTO pin_topic_index ( `uid`, `tid`, `author_id`, `add_time` ) VALUES  ('21','4','17','1355796556');
INSERT INTO pin_topic_index ( `uid`, `tid`, `author_id`, `add_time` ) VALUES  ('21','12','17','1355819882');
DROP TABLE IF EXISTS `pin_topic_relation`;
CREATE TABLE `pin_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY (`tid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_user`;
CREATE TABLE `pin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uc_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('1','0','安小然07','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','0','0','','192.168.1.111','1353895892','0','0','1','0','0','0','0','0','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('2','0','D暖暖的色调D','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','0','0','','192.168.1.111','1353895892','0','0','1','0','0','0','0','0','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('3','0','洗耍耍洗耍','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','0','0','','192.168.1.111','1353895892','0','0','1','0','0','0','0','0','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('4','0','农家小雪','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','0','0','','192.168.1.111','1353895892','0','0','1','0','0','0','0','0','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('5','0','熊霹雳','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','0','0','','192.168.1.111','1353895892','0','0','1','0','0','0','0','0','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('6','0','起个名字太累','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910265','192.168.1.111','1','8','0','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('7','0','咕咕是一只猫','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910109','192.168.1.111','1','3','0','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('8','0','枕水而眠','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910407','192.168.1.111','1','10','0','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('9','0','wingsa区','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909837','192.168.1.111','1','2','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('10','0','设计系小女生','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910499','192.168.1.111','1','7','1','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('11','0','彩色淘','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910069','192.168.1.111','1','6','1','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('12','0','跳房子123','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910146','192.168.1.111','1','4','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('13','0','想太多妹子','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909897','192.168.1.111','1','5','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('14','0','泡芙小米粒','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910539','192.168.1.111','1','5','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('15','0','Prickleman','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910012','192.168.1.111','1','4','1','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('16','0','Eudora_寻寻','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909964','192.168.1.111','1','3','0','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('17','0','V小莲小莲V','96e79218965eb72c92a549dd5a330112','2455009233@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910177','192.168.1.111','1','8','3','0','1','2','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('18','0','晨雪熙','96e79218965eb72c92a549dd5a330112','28d6c5@yk.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910348','192.168.1.111','1','7','0','0','0','1','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('19','0','安土桃山','96e79218965eb72c92a549dd5a330112','andery@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910445','192.168.1.111','1','2','0','0','0','1','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('20','0','熊小熊zz','96e79218965eb72c92a549dd5a330112','1@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910221','192.168.1.111','1','9','1','0','0','2','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('21','0','hisway','2cfa8f417474f56bb336a435004d37f9','7686574@qq.com','1','羽毛球','','2012','12','14','浙江','杭州','57','57','','127.0.0.1','1355469931','1355792698','127.0.0.1','1','0','0','1','0','1','0');
DROP TABLE IF EXISTS `pin_user_address`;
CREATE TABLE `pin_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_user_bind`;
CREATE TABLE `pin_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `pin_user_follow`;
CREATE TABLE `pin_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`follow_uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_user_follow ( `uid`, `follow_uid`, `add_time`, `mutually` ) VALUES  ('21','17','1355477217','0');
DROP TABLE IF EXISTS `pin_user_msgtip`;
CREATE TABLE `pin_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_user_msgtip ( `uid`, `type`, `num` ) VALUES  ('17','1','1');
DROP TABLE IF EXISTS `pin_user_stat`;
CREATE TABLE `pin_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('9','login','1','1353909837');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('13','login','1','1353909897');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('16','login','1','1353909964');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('15','login','1','1353910012');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('11','login','1','1353910069');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('7','login','1','1353910109');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('12','login','1','1353910146');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('17','login','1','1353910177');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('20','login','1','1353910221');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('6','login','1','1353910265');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('18','login','1','1353910348');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('8','login','1','1353910407');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('19','login','1','1353910445');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('10','login','1','1353910499');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('14','login','1','1353910539');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('21','register','1','1355469931');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('21','login','1','1355792698');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('21','likeitem','1','1355898831');
