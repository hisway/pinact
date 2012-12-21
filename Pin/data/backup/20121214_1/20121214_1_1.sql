-- TuanPhp SQL Dump Program
-- 
-- DATE : 2012-12-14 17:40:28
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
INSERT INTO pin_album ( `id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time` ) VALUES  ('17','28','17','V小莲小莲V','默认专辑','','','a:1:{i:0;a:2:{s:3:\"img\";s:25:\"1212/14/50caef904c2f3.jpg\";s:5:\"intro\";s:33:\"附近找片空地，打羽毛球\";}}','1','255','0','1','0','0','1355476880');
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
INSERT INTO pin_article_page ( `cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time` ) VALUES  ('3','联系我们','<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;\">
	<br />
</p>','','','','0');
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
INSERT INTO pin_auto_user ( `id`, `name`, `users` ) VALUES  ('1','发布马甲','熊小熊zz,安土桃山,晨雪熙,V小莲小莲V,Eudora_寻寻,Prickleman,泡芙小米粒,想太多妹子,跳房子123,彩色淘,设计系小女生,wingsa区,枕水而眠,咕咕是一只猫,起个名字太累');
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
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('63','333','3','17','V小莲小莲V','','附近找片空地，打羽毛球','附近找片空地，打羽毛球','1212/14/50caef904c2f3.jpg','0.00','0.00','','1','5','1','0','0','1355476880','a:3:{i:420;s:6:\"空地\";i:421;s:9:\"羽毛球\";i:422;s:6:\"附近\";}','','','','','255','1');
INSERT INTO pin_item ( `id`, `cate_id`, `orig_id`, `uid`, `uname`, `key_id`, `title`, `intro`, `img`, `price`, `rates`, `url`, `type`, `hits`, `likes`, `comments`, `cmt_taobao_time`, `add_time`, `tag_cache`, `comments_cache`, `seo_title`, `seo_keys`, `seo_desc`, `ordid`, `status` ) VALUES  ('64','333','3','11','彩色淘','',' 练练空手道，一起运动出生大汗','
练练空手道，一起运动出生大汗','1212/14/50caf1a08f80f.jpg','0.00','0.00','','1','0','0','0','0','1355477410','a:5:{i:423;s:6:\"生大\";i:424;s:9:\"空手道\";i:425;s:6:\"练练\";i:426;s:6:\"一起\";i:427;s:6:\"运动\";}','','','','','255','1');
DROP TABLE IF EXISTS `pin_item_attr`;
CREATE TABLE `pin_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_attr ( `id`, `item_id`, `attr_name`, `attr_value` ) VALUES  ('1','63','111','222');
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
INSERT INTO pin_item_cate ( `id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc` ) VALUES  ('333','体育运动','','0','0','','','','0','0','0','0','255','1','0','0','','','');
DROP TABLE IF EXISTS `pin_item_cate_tag`;
CREATE TABLE `pin_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('3','1','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('4','2','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('5','3','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('6','4','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('7','5','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('8','6','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('9','7','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('10','8','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('11','9','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('12','10','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('17','11','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('18','12','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('21','13','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('23','14','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('22','15','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('24','16','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('25','17','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('26','18','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('27','19','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('28','20','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('29','21','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('30','22','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('32','23','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('33','24','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('34','25','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('35','26','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('36','27','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('37','28','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('38','29','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('39','30','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('41','31','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('42','32','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('43','33','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('44','34','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('45','35','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('46','14','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('47','36','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('48','37','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('49','38','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('319','39','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('318','40','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('317','41','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('316','42','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('320','43','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('321','44','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('322','45','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('323','46','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('91','96','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('92','97','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('93','98','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('94','99','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('281','100','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('95','101','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('282','102','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('283','103','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('96','104','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('284','105','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('97','106','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('285','107','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('98','108','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('99','109','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('286','110','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('100','111','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('287','112','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('101','113','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('288','114','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('289','115','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('290','116','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('291','117','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('292','118','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('293','119','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('294','120','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('295','121','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('296','122','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('297','123','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('298','124','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('299','125','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('300','126','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('301','127','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('302','128','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('303','129','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('304','130','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('305','131','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('306','132','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('307','133','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('308','134','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('309','135','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('310','136','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('219','137','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('311','138','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('312','139','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('313','140','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('314','141','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('260','142','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('261','143','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('262','144','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('263','145','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('264','146','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('265','147','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('266','148','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('267','149','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('268','150','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('269','151','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('270','152','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('271','153','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('272','154','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('273','155','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('274','156','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('275','157','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('276','158','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('277','159','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('278','160','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('279','161','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('280','162','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('237','163','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('238','164','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('239','165','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('240','166','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('241','167','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('242','168','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('243','169','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('244','170','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('245','171','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('246','172','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('247','173','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('248','174','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('249','175','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('250','176','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('251','177','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('206','178','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('207','179','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('208','180','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('209','181','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('210','182','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('211','183','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('212','184','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('213','185','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('214','186','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('215','187','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('216','188','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('217','189','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('218','190','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('220','191','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('221','192','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('222','193','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('223','194','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('224','195','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('225','196','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('226','196','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('226','137','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('227','197','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('228','198','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('229','199','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('230','200','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('231','201','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('232','202','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('233','203','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('234','204','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('236','205','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('235','206','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('252','207','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('253','208','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('254','209','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('255','210','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('256','211','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('257','212','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('258','213','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('259','214','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('178','215','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('179','216','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('180','267','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('181','268','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('182','269','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('183','270','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('184','271','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('185','289','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('186','290','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('187','291','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('188','292','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('189','293','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('190','294','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('191','295','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('192','296','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('193','297','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('194','330','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('195','336','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('196','337','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('197','338','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('198','339','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('199','340','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('200','341','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('201','342','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('202','343','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('203','344','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('204','345','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('205','346','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('170','347','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('171','25','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('172','26','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('173','30','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('174','348','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('175','27','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('176','349','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('177','259','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('177','28','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('163','350','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('164','351','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('165','352','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('166','353','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('167','354','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('168','355','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('169','314','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('127','356','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('128','357','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('130','358','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('132','359','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('81','360','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('82','301','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('83','323','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('84','361','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('85','300','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('86','318','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('87','362','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('88','332','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('89','192','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('74','363','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('75','364','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('76','365','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('77','366','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('78','367','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('79','368','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('61','97','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('61','369','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('62','370','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('63','371','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('64','372','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('316','373','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('316','374','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('316','375','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('65','376','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('65','377','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('66','378','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('67','379','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('68','380','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('69','381','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('70','382','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('71','308','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('72','383','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('52','384','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('53','349','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('54','385','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('55','28','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('56','27','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('57','386','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('58','25','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('59','30','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('133','387','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('135','388','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('137','389','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('139','390','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('140','246','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('141','391','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('143','392','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('145','241','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('148','393','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('150','394','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('151','259','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('152','395','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('154','237','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('156','238','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('158','396','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('160','397','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('161','218','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('113','398','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('117','371','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('118','372','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('119','399','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('119','400','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('120','27','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('121','28','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('122','401','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('123','233','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('104','220','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('105','402','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('106','403','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('107','404','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('108','405','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('109','406','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('110','302','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('111','223','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('325','42','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('325','374','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('325','375','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('326','39','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('326','407','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('327','46','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('327','408','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('327','409','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('327','410','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('327','411','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('328','41','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('328','412','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('328','413','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('328','414','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('329','44','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('329','415','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('330','45','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('330','416','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('331','43','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('331','373','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('332','40','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('332','417','0');
INSERT INTO pin_item_cate_tag ( `cate_id`, `tag_id`, `weight` ) VALUES  ('332','418','0');
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
DROP TABLE IF EXISTS `pin_item_like`;
CREATE TABLE `pin_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_item_like ( `item_id`, `uid`, `add_time` ) VALUES  ('63','21','1355477017');
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
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('7','新增','6','menu','add','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('8','编辑','6','menu','edit','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('9','删除','6','menu','delete','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('10','文章','0','operate','index','','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('11','广告管理','10','advert','index','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('12','广告管理','11','ad','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('13','广告位管理','11','adboard','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('14','友情链接','10','flink','index','','','0','3','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('15','友情链接','14','flink','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('16','链接分类','14','flink_cate','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('17','新增','15','flink','add','','','0','0','0');
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
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('198','新增','196','message','add','','','0','0','0');
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
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('212','日志管理','29','log','index','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('213','管理员日志','212','log','index','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('214','用户日志','212','log','user','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('215','积分日志','212','log','score','','','0','0','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('216','界面设置','1','setting','index','&type=show','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('256','积分商城','70','score_item','index','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('254','系统数据','29','tag','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('264','编辑','257','score_item','edit','','','0','3','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('263','添加商品','257','score_item','add','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('262','积分订单','256','score_order','index','','','0','255','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('261','删除','258','score_item_cate','delete','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('260','编辑','258','score_item_cate','edit','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('232','站内信管理','70','message','index','','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('233','系统通知','232','message','index','&type=1','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('234','用户私信','232','message','index','&type=2','','0','0','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('235','通知模版','2','message_tpl','index','&type=msg','','0','4','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('236','添加模版','235','message_tpl','add','','','0','7','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('237','编辑','235','message_tpl','edit','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('238','删除','235','message_tpl','delete','','','0','255','0');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('240','单页管理','154','article','page','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('242','积分记录','269','score','logs','','','0','2','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('244','应用','0','plugin','index','','','0','6','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('245','系统接口','244','apis','index','','','0','1','1');
INSERT INTO pin_menu ( `id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display` ) VALUES  ('246','应用管理','244','plugin','index','','','0','3','0');
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
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('1','main','发现','book','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('2','main','专辑','album','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('4','bottom','发现','book','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('5','main','兑换','exchange','','0','255','sys','0');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('6','bottom','专辑','album','','0','255','sys','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('7','bottom','集市','cate','?m=book&a=cate&cid=1','0','255','','1');
INSERT INTO pin_nav ( `id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status` ) VALUES  ('8','bottom','兑换','exchange','','0','255','sys','1');
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
INSERT INTO pin_oauth ( `id`, `code`, `name`, `config`, `desc`, `author`, `ordid`, `status` ) VALUES  ('10','sina','新浪微薄登录','a:2:{s:7:\"app_key\";s:0:\"\";s:10:\"app_secret\";s:0:\"\";}','申请地址：http://open.weibo.com/','PinPHP TEAM','255','1');
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
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('1','数码','1','0');
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('2','美容','1','0');
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('3','虚拟','1','0');
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('4','生活','1','0');
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('5','运动','1','0');
INSERT INTO pin_score_item_cate ( `id`, `name`, `status`, `ordid` ) VALUES  ('6','吃完','1','0');
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
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_name','活动','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_title','活动','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_keyword','活动','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_description','找活动','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_status','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('closed_reason','网站升级中。。','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('site_icp','浙ICP备号','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('statistics_code','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('statics_url','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('mail_server','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_check','0','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('score_rule','a:16:{s:8:\"register\";s:2:\"20\";s:13:\"register_nums\";s:1:\"1\";s:5:\"login\";s:2:\"10\";s:10:\"login_nums\";s:1:\"5\";s:7:\"pubitem\";s:2:\"20\";s:12:\"pubitem_nums\";s:2:\"10\";s:8:\"likeitem\";s:1:\"1\";s:13:\"likeitem_nums\";s:2:\"20\";s:9:\"joinalbum\";s:1:\"2\";s:14:\"joinalbum_nums\";s:2:\"10\";s:6:\"fwitem\";s:1:\"2\";s:11:\"fwitem_nums\";s:2:\"10\";s:6:\"pubcmt\";s:1:\"1\";s:11:\"pubcmt_nums\";s:1:\"5\";s:7:\"delitem\";s:3:\"-20\";s:12:\"delitem_nums\";s:3:\"100\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('album_cover_items','5','专辑封面显示图片数量');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('integrate_code','default','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('integrate_config','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('hot_tags','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_spage_max','3','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_spage_size','10','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('book_page_max','100','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('default_keyword','找活动。','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('album_default_title','默认专辑','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('avatar_size','24,32,48,64,100,200','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attr_allow_exts','jpg,gif,png,jpeg,swf','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attr_allow_size','2048','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('itemcate_img','a:2:{s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"170\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_protocol','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_cover_comments','2','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('user_intro_default','','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('ipban_switch','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('score_item_img','a:4:{s:6:\"swidth\";s:3:\"210\";s:7:\"sheight\";s:3:\"210\";s:6:\"bwidth\";s:3:\"350\";s:7:\"bheight\";s:3:\"350\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('seo_config','a:6:{s:4:\"book\";a:3:{s:5:\"title\";s:23:\"{tag_name}-{site_title}\";s:8:\"keywords\";s:23:\"找活动，{site_name}\";s:11:\"description\";s:18:\"{site_description}\";}s:4:\"cate\";a:3:{s:5:\"title\";s:23:\"{cate_name}-{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:5:\"album\";a:3:{s:5:\"title\";s:6:\"专辑\";s:8:\"keywords\";s:24:\"{site_name},活动专辑\";s:11:\"description\";s:18:\"{site_description}\";}s:10:\"album_cate\";a:3:{s:5:\"title\";s:11:\"{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:12:\"album_detail\";a:3:{s:5:\"title\";s:13:\"{album_title}\";s:8:\"keywords\";s:13:\"{album_intro}\";s:11:\"description\";s:11:\"Description\";}s:4:\"item\";a:3:{s:5:\"title\";s:12:\"{item_title}\";s:8:\"keywords\";s:10:\"{item_tag}\";s:11:\"description\";s:12:\"{item_intro}\";}}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_img','a:2:{s:5:\"width\";s:3:\"210\";s:6:\"height\";s:4:\"1000\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_simg','a:2:{s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('item_bimg','a:2:{s:5:\"width\";s:3:\"468\";s:6:\"height\";s:4:\"1000\";}','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('attach_path','data/upload/','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('wall_distance','500','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_status','1','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('reg_closed_reason','<h1>暂时关闭注册</h1>','');
INSERT INTO pin_setting ( `name`, `data`, `remark` ) VALUES  ('index_wall','1','');
DROP TABLE IF EXISTS `pin_tag`;
CREATE TABLE `pin_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('427','运动');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('426','一起');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('425','练练');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('424','空手道');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('423','生大');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('422','附近');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('421','羽毛球');
INSERT INTO pin_tag ( `id`, `name` ) VALUES  ('420','空地');
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
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('1','14','泡芙小米粒','浪漫一身 2012冬装新款 专柜正品 韩版大翻领格纹毛呢大衣外套','http://img03.taobaocdn.com/bao/uploaded/i3/T1o2R8XdRtXXcjNLgV_020417.jpg','0','1','0','0','0','1353896347');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('2','10','设计系小女生','浪漫一身 2012冬装新款 专柜正品 欧美范 羊毛毛纯色呢短外套','http://img03.taobaocdn.com/bao/uploaded/i3/T1L.urXiFJXXa2x2w2_043755.jpg','0','2','0','0','0','1353896347');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('3','19','安土桃山','浪漫一身 2012秋装新款 专柜正品 休闲长袖薄外套修身立领棒球衫','http://img01.taobaocdn.com/bao/uploaded/i1/T1FGLNXmJbXXbjSLvb_093718.jpg','0','3','0','0','0','1353896347');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('4','8','枕水而眠','浪漫一身 2012冬装新款 欧美仿麂皮翻领长袖 修身加厚短外套','http://img02.taobaocdn.com/bao/uploaded/i2/T1Fw5FXmxmXXc2RowZ_034012.jpg','0','4','0','0','0','1353896347');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('5','8','枕水而眠','浪漫一身 2012秋装新款 韩版蝙蝠袖长袖 假两件休闲棉质马甲外套','http://img04.taobaocdn.com/bao/uploaded/i4/T1tmvLXnhmXXXxzzQW_024228.jpg','0','5','0','0','0','1353896347');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('6','18','晨雪熙','浪漫一身  直筒带帽休闲加薄长款棉衣外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1dmCzXaxgXXcNQv71_040909.jpg','0','6','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('7','6','起个名字太累','浪漫一身 2012秋装新款 修身街头运动 拉链带帽拼接袋鼠兜短外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1yhLQXnVqXXXEh_71_042519.jpg','0','7','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('8','18','晨雪熙','浪漫宣言新款春秋修身单扣长袖女装短外套1016111','http://img03.taobaocdn.com/bao/uploaded/i3/T1ssGRXeVoXXXa7CQ5_060120.jpg','0','8','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('9','20','熊小熊zz','浪漫一身 2012秋装新款 专柜正品 韩版蝙蝠袖西装式针织开衫外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1hP1mXjRrXXcK2PU3_050554.jpg','0','9','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('10','8','枕水而眠','浪漫一身 2012秋装新款 直筒运动休闲长袖 短款立领拉链纯色外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1As6HXiBmXXcXtaPb_093121.jpg','0','10','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('11','18','晨雪熙','浪漫一身 2012秋装新款 宽松加厚运动休闲 带拉链连帽毛衣外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1_fvTXbdjXXc3i8E1_042214.jpg','0','11','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('12','20','熊小熊zz','浪漫一身 2012冬装新款 专柜正品 通勤简约 柳钉拼接时尚短外套','http://img04.taobaocdn.com/bao/uploaded/i4/T1vdvYXktiXXb1Opc__104853.jpg','0','12','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('13','14','泡芙小米粒','浪漫一身 2012秋装新款 专柜正品 亮色带帽长袖休闲格子外套','http://img02.taobaocdn.com/bao/uploaded/i2/T1h4F7XbdAXXce_eEZ_032143.jpg','0','13','0','0','0','1353896348');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('14','14','泡芙小米粒','浪漫一身 2012秋装新款 通勤OL开衫V领长袖 纯色百搭时尚小外套','http://img04.taobaocdn.com/bao/uploaded/i4/T1qdnCXlBhXXbCT873_051140.jpg','0','14','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('15','8','枕水而眠','浪漫一身 线下专柜正品 2012春装一粒扣短款西装 韩版胸花短外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1QEO7XcBdXXXWXn.U_015911.jpg','0','15','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('16','18','晨雪熙','浪漫一身 线下 专柜正品 2012春装翻领长袖中长款 夹克风衣外套女','http://img02.taobaocdn.com/bao/uploaded/i2/T1DReVXjtbXXcISRE9_104415.jpg','0','16','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('17','10','设计系小女生','浪漫一身 2012秋装新款 线下 专柜正品 韩版双排扣风衣外套','http://img03.taobaocdn.com/bao/uploaded/i3/T1Xo6dXhptXXb5KSA9_104530.jpg','0','17','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('18','17','V小莲小莲V','浪漫一身 2012秋装新款 通勤长袖翻领  OL时尚帅气小西装式短外套','http://img03.taobaocdn.com/bao/uploaded/i3/T1ms_UXi0bXXb4juQ1_041036.jpg','0','18','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('19','6','起个名字太累','浪漫一身 冬装 专柜正品 羊毛毛呢短外套  外套 女装长袖','http://img02.taobaocdn.com/bao/uploaded/i2/T1V_KxXkXuXXX2Qls4_053710.jpg','0','19','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('20','18','晨雪熙','浪漫一身 品牌女装 专柜正品 春夏装中长款抽皱褶无袖短外套','http://img01.taobaocdn.com/bao/uploaded/i1/T1vN18Xe8wXXabtx7U_014829.jpg','0','20','0','0','0','1353896349');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('21','12','跳房子123','MIYI 英国2013新款头层牛皮撞色真皮女包小包单肩包信封邮差包邮','http://img04.taobaocdn.com/bao/uploaded/i4/T1oAbZXkldXXcH5ug2_043616.jpg','0','21','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('22','7','咕咕是一只猫','MIYI 2012英伦复古学院风牛皮撞色邮差包 时尚单肩斜挎潮包女士包','http://img02.taobaocdn.com/bao/uploaded/i2/T1qrdqXXlwXXa_4U38_101909.jpg','0','22','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('23','11','彩色淘','MIYI 英伦学院风复古糖果色牛皮剑桥包 单肩包时尚女包 小包潮包','http://img03.taobaocdn.com/bao/uploaded/i3/T1yj1xXg01XXX_.NQ8_100702.jpg','0','23','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('24','11','彩色淘','MIYI 2012新款秋冬头层牛皮女包菱格链条包单肩包 真皮女包宴会包','http://img02.taobaocdn.com/bao/uploaded/i2/T1DsrnXbRkXXanw8_b_124847.jpg','0','24','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('25','7','咕咕是一只猫','MIYI 2012秋冬新款欧美时尚牛皮邮差包单肩斜挎包 复古百搭女大包','http://img01.taobaocdn.com/bao/uploaded/i1/T18U_SXklkXXcPno7._084022.jpg','0','25','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('26','15','Prickleman','MIYI秋冬新款牛皮复古OL通勤单肩斜挎女包包英伦潮款特价包邮','http://img04.taobaocdn.com/bao/uploaded/i4/T1_HC7XhlwXXbMVu7W_023330.jpg','0','26','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('27','11','彩色淘','【清仓】MIYI 简约手提包女包 单肩牛皮大包通勤包 购物包肩挎包','http://img03.taobaocdn.com/bao/uploaded/i3/T1rnuWXbXwXXaT3dnb_093439.jpg','0','27','0','0','0','1353902316');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('28','8','枕水而眠','MIYI 秋冬新款复古风撞色手提包单肩包斜挎包包 机车包邮差包女包','http://img01.taobaocdn.com/bao/uploaded/i1/T1sPfKXcxbXXXPQIYb_123402.jpg','0','28','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('29','16','Eudora_寻寻','MIYI 欧美鸵鸟纹头层牛皮单肩包斜跨复古女包邮差包 手提真皮女包','http://img04.taobaocdn.com/bao/uploaded/i4/T1gz6JXj8iXXblFxU8_100704.jpg','0','29','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('30','20','熊小熊zz','MIYI时尚可爱复古学院风糖果色单肩斜跨女包包小包牛皮邮差包特价','http://img02.taobaocdn.com/bao/uploaded/i2/T1m397XXJlXXaqnVg0_033805.jpg','0','30','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('31','12','跳房子123','MIYI 红色斜纹牛皮单肩包包女包 2012新款潮包结婚包新娘包晚宴包','http://img02.taobaocdn.com/bao/uploaded/i2/T1X697XjXbXXcMnfM._112229.jpg','0','31','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('32','12','跳房子123','MIYI米逸 新款英伦小包卡其色单肩包复古牛皮撞色复古女包邮差包','http://img04.taobaocdn.com/bao/uploaded/i4/T1DxC8Xi4eXXXO8ZZ5_054947.jpg','0','32','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('33','14','泡芙小米粒','MIYI新款鳄鱼纹翻盖潮手包牛皮女包单肩包复古包小包包 清仓包邮','http://img04.taobaocdn.com/bao/uploaded/i4/T1wBy7XflaXXX6UvwV_020442.jpg','0','33','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('34','10','设计系小女生','MIYI 2012秋冬新款头层牛皮手提包单肩包水桶真皮女包通勤包包邮','http://img01.taobaocdn.com/bao/uploaded/i1/T1tWOuXmFTXXXbvKDb_093608.jpg','0','34','0','0','0','1353902317');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('35','20','熊小熊zz','MIYI单肩小包2012新款潮时尚韩版休闲牛皮欧美红色新娘手拿女包包','http://img01.taobaocdn.com/bao/uploaded/i1/T1xtK1XnlkXXaGp4E6_062100.jpg','0','35','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('36','6','起个名字太累','MIYI韩版新款真皮女包包2012新款潮女包水桶通勤斜挎单肩机车包邮','http://img02.taobaocdn.com/bao/uploaded/i2/T1Ad58XctiXXcyC0s8_100130.jpg','0','36','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('37','13','想太多妹子','MIYI 2012秋冬新款欧美头层牛皮单肩斜挎包 韩版真皮女包通勤包包','http://img02.taobaocdn.com/bao/uploaded/i2/T1O9mQXndwXXXD_O.0_035651.jpg','0','37','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('38','6','起个名字太累','MIYI2012新款全牛皮简约主义韩版糖果女包包复古手提大包单肩包','http://img01.taobaocdn.com/bao/uploaded/i1/T17FtRXaBGXXa3dJs6_061244.jpg','0','38','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('39','17','V小莲小莲V','MIYI 鳄鱼纹晚宴包链条包单肩包 牛皮潮女包漆皮菱格包 清仓包邮','http://img01.taobaocdn.com/bao/uploaded/i1/T1h8HdXXXkXXcz7r.4_051921.jpg','0','39','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('40','20','熊小熊zz','MIYI休闲糖果色邮差包韩版撞色单肩斜挎包磨砂牛皮复古包包女包','http://img04.taobaocdn.com/bao/uploaded/i4/T1.Ly7XmhmXXcoBArb_124637.jpg','0','40','0','0','0','1353902318');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('41','13','想太多妹子','预售款 榴莲家秋冬装新款呢大衣女 双排扣气质呢大衣外套20281','http://img04.taobaocdn.com/bao/uploaded/i4/T1srf5Xm8XXXXV8lI__110350.jpg','0','41','0','0','0','1353902490');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('42','8','枕水而眠','特卖款2012秋冬新款榴莲家 风衣帅气外套 带帽风衣外套LLS1009','http://img02.taobaocdn.com/bao/uploaded/i2/T1x7C0XhxqXXbW6xwT_012127.jpg','0','42','0','0','0','1353902490');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('43','20','熊小熊zz','榴莲家2012秋季女装 韩版波点翻袖小西装外套 修身休闲西装 20072','http://img02.taobaocdn.com/bao/uploaded/i2/T1Ag54XbtuXXXfz.I5_060343.jpg','0','43','0','0','0','1353902490');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('44','18','晨雪熙','预售款 榴莲家2012秋冬新款 RENEEVON★秋款绝美公主外套20398','http://img04.taobaocdn.com/bao/uploaded/i4/T1ugbYXkpdXXa56jsZ_033049.jpg','0','44','0','0','0','1353902490');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('45','13','想太多妹子','预售定金 榴莲家 英伦双排扣毛呢外套牛角扣肩章羊毛呢大衣20459','http://img03.taobaocdn.com/bao/uploaded/i3/T1M463XeBdXXb0fkM9_074304.jpg','0','45','0','0','0','1353902490');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('46','6','起个名字太累','远步正品 韩版潮 厚底松糕高帮帆布鞋子 学生休闲鞋 女式帆布鞋','http://img04.taobaocdn.com/bao/uploaded/i4/T1ZArWXkllXXX.ujTX_085705.jpg','0','46','0','0','0','1353902641');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('47','11','彩色淘','淘金币 【远步正品】 经典糖果低帮系带韩版帆布鞋 潮 男女款情侣','http://img01.taobaocdn.com/bao/uploaded/i1/T1EzLEXaFlXXcpN3g3_050111.jpg','0','47','0','0','0','1353902641');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('48','11','彩色淘','【一淘专享价】远步经典糖果低帮系带韩版帆布鞋 潮 男女款情侣鞋','http://img01.taobaocdn.com/bao/uploaded/i1/T16.j3XdlbXXa8hGnb_123051.jpg','0','48','0','0','0','1353902641');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('49','13','想太多妹子','【远步正品】 男女帆布鞋韩版 高帮 学生情侣鞋','http://img03.taobaocdn.com/bao/uploaded/i3/T1qYjFXbXfXXXvyygU_015147.jpg','0','49','0','0','0','1353902641');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('50','13','想太多妹子','【远步正品】2012秋冬新款 星星印花女式低帮帆布鞋学生鞋','http://img01.taobaocdn.com/bao/uploaded/i1/T1K_vfXlJaXXakVJ37_064254.jpg','0','50','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('51','12','跳房子123','【远步正品】男女款 越狱 低帮帆布鞋 情侣鞋','http://img02.taobaocdn.com/bao/uploaded/i2/T1RR2RXkNcXXceltU7_063938.jpg','0','51','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('52','6','起个名字太累','【远步正品】 越狱米勒系列厚底帆布鞋松糕鞋 欧美ca276','http://img01.taobaocdn.com/bao/uploaded/i1/T1wnqyXXNfXXa2j1I0_034801.jpg','0','52','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('53','14','泡芙小米粒','淘金币 【远步正品】 2012新款 星旗条纹男女帆布鞋情侣鞋子','http://img03.taobaocdn.com/bao/uploaded/i3/T197PPXgVoXXcy8OM._112623.jpg','0','53','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('54','8','枕水而眠','【远步正品】2012秋冬新款 英伦印花松糕厚底高帮鞋 松糕鞋女款','http://img04.taobaocdn.com/bao/uploaded/i4/T1ac2vXcRvXXXE1hsU_014747.jpg','0','54','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('55','17','V小莲小莲V','【远步正品】2012秋冬新款 韩版星星印花女式低帮帆布鞋学生鞋','http://img02.taobaocdn.com/bao/uploaded/i2/T1E2O9XhFvXXbOmjZW_024241.jpg','0','55','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('56','9','wingsa区','【远步正品】2012秋冬新款男女帆布鞋韩版 女 潮 高帮 学生情侣鞋','http://img04.taobaocdn.com/bao/uploaded/i4/T1l3fIXkFgXXc53Jk9_102745.jpg','0','56','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('57','16','Eudora_寻寻','【远步正品】2012秋冬新款 印花高帮帆布鞋 韩版 学生女鞋','http://img01.taobaocdn.com/bao/uploaded/i1/T1msjzXfFmXXbavIAU_013829.jpg','0','57','0','0','0','1353902642');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('58','19','安土桃山','【远步正品】 加厚松高鞋休闲棉帆布鞋 韩版厚底帆松糕鞋','http://img01.taobaocdn.com/bao/uploaded/i1/T1RKfEXkxkXXc.bh3U_014824.jpg','0','58','0','0','0','1353902643');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('59','6','起个名字太累','【远步正品】2012秋冬季印花高帮帆布鞋 韩版 学生女鞋','http://img02.taobaocdn.com/bao/uploaded/i2/T1_tHLXn4fXXXLjDMT_013219.jpg','0','59','0','0','0','1353902643');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('60','18','晨雪熙','远步正品 韩版潮 厚底松糕鞋 高帮布鞋子学生休闲鞋 女鞋帆布鞋','http://img03.taobaocdn.com/bao/uploaded/i3/T1A4n_XglcXXcUv5g0_035537.jpg','0','60','0','0','0','1353902643');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('61','9','wingsa区','【远步正品】2012秋冬新款时尚女士平底加绒中筒雪地靴 包邮','http://img02.taobaocdn.com/bao/uploaded/i2/T1MDaHXc0rXXaonAs9_104246.jpg','0','61','0','0','0','1353902643');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('62','10','设计系小女生','【远步正品】  2011冬季时尚女士平底雪地靴 棉鞋','http://img03.taobaocdn.com/bao/uploaded/i3/T1hG1IXelfXXcX4o.9_105150.jpg','0','62','0','0','0','1353902643');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('63','17','V小莲小莲V','附近找片空地，打羽毛球','1212/14/50caef904c2f3.jpg','0','63','0','0','0','1355476880');
INSERT INTO pin_topic ( `id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time` ) VALUES  ('64','11','彩色淘','
练练空手道，一起运动出生大汗','1212/14/50caf1a08f80f.jpg','0','64','0','0','0','1355477410');
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
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('6','0','起个名字太累','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910265','192.168.1.111','1','7','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('7','0','咕咕是一只猫','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910109','192.168.1.111','1','2','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('8','0','枕水而眠','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910407','192.168.1.111','1','7','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('9','0','wingsa区','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909837','192.168.1.111','1','2','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('10','0','设计系小女生','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910499','192.168.1.111','1','4','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('11','0','彩色淘','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910069','192.168.1.111','1','6','0','0','0','2','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('12','0','跳房子123','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910146','192.168.1.111','1','4','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('13','0','想太多妹子','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909897','192.168.1.111','1','5','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('14','0','泡芙小米粒','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910539','192.168.1.111','1','5','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('15','0','Prickleman','96e79218965eb72c92a549dd5a330112','','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910012','192.168.1.111','1','1','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('16','0','Eudora_寻寻','96e79218965eb72c92a549dd5a330112','','1','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353909964','192.168.1.111','1','2','0','0','0','1','0');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('17','0','V小莲小莲V','96e79218965eb72c92a549dd5a330112','2455009233@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910177','192.168.1.111','1','4','1','0','1','2','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('18','0','晨雪熙','96e79218965eb72c92a549dd5a330112','28d6c5@yk.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910348','192.168.1.111','1','7','0','0','0','1','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('19','0','安土桃山','96e79218965eb72c92a549dd5a330112','andery@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910445','192.168.1.111','1','2','0','0','0','1','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('20','0','熊小熊zz','96e79218965eb72c92a549dd5a330112','1@qq.com','0','','','0','0','0','','','10','10','','192.168.1.111','1353895892','1353910221','192.168.1.111','1','6','0','0','0','1','1');
INSERT INTO pin_user ( `id`, `uc_uid`, `username`, `password`, `email`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `score`, `score_level`, `cover`, `reg_ip`, `reg_time`, `last_time`, `last_ip`, `status`, `shares`, `likes`, `follows`, `fans`, `albums`, `daren` ) VALUES  ('21','0','hisway','2cfa8f417474f56bb336a435004d37f9','7686574@qq.com','1','','','2012','12','14','浙江','杭州','41','41','','127.0.0.1','1355469931','1355477014','127.0.0.1','1','0','0','1','0','1','0');
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
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('21','login','2','1355477014');
INSERT INTO pin_user_stat ( `uid`, `action`, `num`, `last_time` ) VALUES  ('21','likeitem','1','1355477017');
