-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- 主机: p95aloup.zzcdb.dnstoo.com:4009
-- 生成日期: 2016 年 04 月 12 日 13:46
-- 服务器版本: 5.5.35
-- PHP 版本: 5.2.17
-- 
-- 数据库: `inuo`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_card_config`
-- 

CREATE TABLE `multi_addon_card_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notify_url` text NOT NULL,
  `about_url` text NOT NULL,
  `address` text NOT NULL,
  `tel` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_addon_card_config`
-- 

INSERT INTO `multi_addon_card_config` VALUES (1, '#', '#', '河南郑州', '10086', '', '2015-11-19 16:38:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_coupon`
-- 

CREATE TABLE `multi_addon_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `coupon_menu_id` int(16) NOT NULL COMMENT '代金券分类ID',
  `code` varchar(255) NOT NULL COMMENT '代金券码',
  `status` int(11) NOT NULL COMMENT '1为已经使用',
  `price` int(16) NOT NULL COMMENT '代金卷价格',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ctime` int(16) NOT NULL COMMENT '创建时间',
  `last_time` int(16) NOT NULL COMMENT '最后使用时间',
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_addon_coupon`
-- 

INSERT INTO `multi_addon_coupon` VALUES (1, 1, '211613', 0, 1, 0, 1455785657, 1455863400, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_coupon_menu`
-- 

CREATE TABLE `multi_addon_coupon_menu` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
  `name` varchar(255) NOT NULL COMMENT '优惠券名字',
  `price` varchar(255) NOT NULL COMMENT '优惠券价格',
  `num` int(12) NOT NULL COMMENT '优惠券数量',
  `last_time` varchar(255) NOT NULL COMMENT '过期时间',
  `ctime` int(16) NOT NULL COMMENT '创建时间',
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_addon_coupon_menu`
-- 

INSERT INTO `multi_addon_coupon_menu` VALUES (1, '1', '1', 1, '1455863400', 1455785657, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_score`
-- 

CREATE TABLE `multi_addon_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `score` float NOT NULL,
  `image` text NOT NULL,
  `status` int(11) NOT NULL,
  `recommend` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_addon_score`
-- 

INSERT INTO `multi_addon_score` VALUES (1, '儿时的辣条', 12, '56299216a9397.jpg', 1, 1, 3, '2015-10-23 09:49:10', 0);
INSERT INTO `multi_addon_score` VALUES (2, '真牛皮鞋', 25, '5629930dbe4aa.jpg', 1, 1, 1, '2015-10-23 09:53:17', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_score_order`
-- 

CREATE TABLE `multi_addon_score_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `orderid` text NOT NULL,
  `score_id` int(11) NOT NULL,
  `totalscore` float NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- 导出表中的数据 `multi_addon_score_order`
-- 

INSERT INTO `multi_addon_score_order` VALUES (9, 1, 1, '1602190244003', 1, 12, 0, '2016-02-19 14:44:00', 0);
INSERT INTO `multi_addon_score_order` VALUES (10, 1, 1, '1602190244122', 1, 12, 0, '2016-02-19 14:44:12', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_sign_config`
-- 

CREATE TABLE `multi_addon_sign_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `first_sign` float NOT NULL,
  `continue_sign` float NOT NULL,
  `max_sign` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_addon_sign_config`
-- 

INSERT INTO `multi_addon_sign_config` VALUES (1, '签到系统', 6, 2, 30, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_addon_sign_record`
-- 

CREATE TABLE `multi_addon_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `score` float NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_addon_sign_record`
-- 

INSERT INTO `multi_addon_sign_record` VALUES (1, 1, 6, '2016-02-18 14:15:25', 0);
INSERT INTO `multi_addon_sign_record` VALUES (2, 1, 8, '2016-02-19 14:15:46', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_admin`
-- 

CREATE TABLE `multi_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `token` text,
  `lastip` text NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_admin`
-- 

INSERT INTO `multi_admin` VALUES (1, 0, 'admin', '21232f297a57a5a743894a0e4a801fc3', '10086', 'admin@admin.com', '6l8WPhxL6o7sMNFvt8LInfzzBHULh8f', '', '333', 1, '2016-01-05 11:17:31');
INSERT INTO `multi_admin` VALUES (2, 0, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1604583867@qq.com', NULL, '', '1', 1, '2016-03-26 18:35:55');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_ads`
-- 

CREATE TABLE `multi_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `sub` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `adsname` text NOT NULL COMMENT '1幻灯片2插件位3广告位',
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- 
-- 导出表中的数据 `multi_ads`
-- 

INSERT INTO `multi_ads` VALUES (1, '轮播1', '', 30, '', '1', '', 0, '2016-03-26 09:54:28', 136);
INSERT INTO `multi_ads` VALUES (2, '轮播2', '', 31, '', '1', '', 0, '2016-03-26 09:54:33', 136);
INSERT INTO `multi_ads` VALUES (3, '首页广告1', '', 5, '', '3', '', 0, '2016-03-26 10:07:28', 136);
INSERT INTO `multi_ads` VALUES (4, '首页广告2', '', 4, '', '3', '', 0, '2016-03-26 10:07:33', 136);
INSERT INTO `multi_ads` VALUES (5, '首页广告3', '', 3, '', '3', '', 0, '2016-03-26 10:07:36', 136);
INSERT INTO `multi_ads` VALUES (6, '首页广告4', '2222', 2, '', '3', '', 222, '2016-03-26 10:07:40', 136);
INSERT INTO `multi_ads` VALUES (7, '更多', '好玩', 39, '', '2', '', 0, '2016-03-26 10:07:43', 136);
INSERT INTO `multi_ads` VALUES (8, '报名', '', 33, '', '2', '', 0, '2016-03-26 10:07:48', 136);
INSERT INTO `multi_ads` VALUES (9, '积分', '', 34, '', '2', '', 0, '2016-03-26 10:07:51', 136);
INSERT INTO `multi_ads` VALUES (10, '大转盘', '', 32, '', '2', '', 0, '2016-03-26 10:07:54', 136);
INSERT INTO `multi_ads` VALUES (11, '会员卡', '', 36, '', '2', '', 0, '2016-03-26 10:07:56', 136);
INSERT INTO `multi_ads` VALUES (12, '客户', '', 37, '', '2', '', 0, '2016-03-26 10:08:00', 136);
INSERT INTO `multi_ads` VALUES (13, '二维码', '', 38, '', '2', '', 0, '2016-03-26 10:08:03', 136);
INSERT INTO `multi_ads` VALUES (14, '卡券', '', 35, '', '2', '', 222, '2016-03-26 10:09:59', 136);
INSERT INTO `multi_ads` VALUES (15, '1', '1', 31, '1', '1', '1', 1, '2016-03-26 18:10:50', 136);
INSERT INTO `multi_ads` VALUES (16, '1号广告', '这是广告一号', 30, '', '1', '', 0, '2016-04-06 17:07:18', 140);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_alipay`
-- 

CREATE TABLE `multi_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) DEFAULT NULL COMMENT '安全检验码',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_alipay`
-- 

INSERT INTO `multi_alipay` VALUES (1, 'xiujida@163.com', '2088411818635564', 'q97lmadjh6rfmy3y94ngx7rx7iedulne', '2016-01-05 10:15:13');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_analysis`
-- 

CREATE TABLE `multi_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `trades` float NOT NULL,
  `registers` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shops` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- 
-- 导出表中的数据 `multi_analysis`
-- 

INSERT INTO `multi_analysis` VALUES (1, 0, 0, 1, 0, '2015-11-16 21:57:10', 0);
INSERT INTO `multi_analysis` VALUES (2, 3, 46, 0, 3, '2016-03-24 17:19:41', 46);
INSERT INTO `multi_analysis` VALUES (3, 5, 180, 0, 5, '2016-03-24 17:19:50', 16);
INSERT INTO `multi_analysis` VALUES (4, 9, 286, 0, 9, '2016-03-24 17:19:58', 23);
INSERT INTO `multi_analysis` VALUES (5, 1, 36, 0, 1, '2016-03-24 17:20:01', 7);
INSERT INTO `multi_analysis` VALUES (6, 2, 84, 0, 2, '2016-03-24 17:20:11', 8);
INSERT INTO `multi_analysis` VALUES (7, 5, 90, 0, 5, '2016-03-24 17:20:15', 2);
INSERT INTO `multi_analysis` VALUES (8, 65, 72, 0, 0, '2016-03-24 17:20:19', 8);
INSERT INTO `multi_analysis` VALUES (9, 6, 48, 0, 0, '2016-03-24 17:20:31', 10);
INSERT INTO `multi_analysis` VALUES (10, 2, 38, 0, 0, '2016-03-24 17:20:34', 8);
INSERT INTO `multi_analysis` VALUES (11, 1, 24, 0, 0, '2016-03-24 17:20:37', 3);
INSERT INTO `multi_analysis` VALUES (12, 12, 664, 0, 0, '2016-03-24 17:20:40', 5);
INSERT INTO `multi_analysis` VALUES (13, 1, 84, 0, 0, '2016-03-24 17:20:46', 1);
INSERT INTO `multi_analysis` VALUES (14, 16, 293, 0, 0, '2016-03-12 16:23:26', 0);
INSERT INTO `multi_analysis` VALUES (15, 1, 32, 0, 0, '2016-03-13 22:41:04', 0);
INSERT INTO `multi_analysis` VALUES (16, 0, 0, 3, 0, '2016-03-25 17:36:07', 2);
INSERT INTO `multi_analysis` VALUES (17, 1, 0, 2, 0, '2016-03-28 17:10:48', 2);
INSERT INTO `multi_analysis` VALUES (18, 1, 14, 0, 0, '2016-03-29 15:39:20', 0);
INSERT INTO `multi_analysis` VALUES (19, 0, 0, 2, 0, '2016-03-30 14:31:13', 2);
INSERT INTO `multi_analysis` VALUES (20, 0, 0, 2, 0, '2016-04-01 10:08:35', 2);
INSERT INTO `multi_analysis` VALUES (21, 3, 23.8, 0, 0, '2016-04-05 14:43:57', 0);
INSERT INTO `multi_analysis` VALUES (22, 33, 202.4, 3, 0, '2016-04-06 23:04:23', 2);
INSERT INTO `multi_analysis` VALUES (23, 10, 7.09, 0, 0, '2016-04-07 16:36:22', 0);
INSERT INTO `multi_analysis` VALUES (24, 0, 0, 6, 0, '2016-04-12 21:24:52', 5);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_artical`
-- 

CREATE TABLE `multi_artical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `author` text NOT NULL,
  `sub` text NOT NULL,
  `content` text NOT NULL,
  `remark` text,
  `visiter` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_artical`
-- 

INSERT INTO `multi_artical` VALUES (1, 136, '文章功能测试', 23, '1', '1', '<p>2222</p>', '1', 11, '2016-04-06 17:06:34');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_auth_group`
-- 

CREATE TABLE `multi_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_auth_group`
-- 

INSERT INTO `multi_auth_group` VALUES (1, '超级管理员', 1, '1', '2015-11-06 11:46:17');
INSERT INTO `multi_auth_group` VALUES (2, '普通管理员', 1, '58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1', '2016-01-05 11:03:01');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_auth_group_access`
-- 

CREATE TABLE `multi_auth_group_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- 导出表中的数据 `multi_auth_group_access`
-- 

INSERT INTO `multi_auth_group_access` VALUES (1, 1, 1);
INSERT INTO `multi_auth_group_access` VALUES (3, 2, 2);
INSERT INTO `multi_auth_group_access` VALUES (5, 4, 2);
INSERT INTO `multi_auth_group_access` VALUES (6, 5, 2);
INSERT INTO `multi_auth_group_access` VALUES (7, 6, 2);
INSERT INTO `multi_auth_group_access` VALUES (8, 7, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_auth_rule`
-- 

CREATE TABLE `multi_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

-- 
-- 导出表中的数据 `multi_auth_rule`
-- 

INSERT INTO `multi_auth_rule` VALUES (1, 'Admin/Index/index', '系统首页', 1, 1, '', '2015-10-14 05:51:29');
INSERT INTO `multi_auth_rule` VALUES (2, 'Admin/Index/userChart', '用户分析', 1, 1, '', '2015-10-18 10:19:06');
INSERT INTO `multi_auth_rule` VALUES (3, 'Admin/Config/shopSet', '商城设置', 1, 1, '', '2015-10-14 18:15:02');
INSERT INTO `multi_auth_rule` VALUES (4, 'Admin/Config/addressSet', '地址设置', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (5, 'Admin/Config/tplSet', '模板设置', 1, 1, '', '2015-10-14 14:04:24');
INSERT INTO `multi_auth_rule` VALUES (6, 'Admin/Config/alipaySet', '支付宝设置', 1, 1, '', '2015-10-14 14:04:46');
INSERT INTO `multi_auth_rule` VALUES (7, 'Admin/Config/wxPrintSet', '微信打印机设置', 1, 1, '', '2015-10-14 14:05:04');
INSERT INTO `multi_auth_rule` VALUES (8, 'Admin/Config/smsSet', '短信验证设置', 1, 1, '', '2015-10-14 14:05:26');
INSERT INTO `multi_auth_rule` VALUES (9, 'Admin/Config/wxTplMsgSet', '微信模板消息设置', 1, 1, '', '2015-10-14 14:05:45');
INSERT INTO `multi_auth_rule` VALUES (10, 'Admin/Weixin/wxSet', '微信设置', 1, 1, '', '2015-10-14 14:07:56');
INSERT INTO `multi_auth_rule` VALUES (11, 'Admin/Weixin/wxMenuSet', '微信菜单设置', 1, 1, '', '2015-10-14 14:08:13');
INSERT INTO `multi_auth_rule` VALUES (12, 'Admin/Weixin/wxReplySet', '自定义回复设置', 1, 1, '', '2015-10-14 14:08:26');
INSERT INTO `multi_auth_rule` VALUES (13, 'Admin/Shop/ads', '广告管理', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (14, 'Admin/Shop/menu', '菜单管理', 1, 1, '', '2015-10-14 14:09:00');
INSERT INTO `multi_auth_rule` VALUES (15, 'Admin/Shop/product', '商品管理', 1, 1, '', '2015-10-14 14:09:15');
INSERT INTO `multi_auth_rule` VALUES (16, 'Admin/Order/order', '订单管理', 1, 1, '', '2015-10-14 14:09:41');
INSERT INTO `multi_auth_rule` VALUES (17, 'Admin/Trade/trade', '财务管理', 1, 1, '', '2015-10-14 14:09:59');
INSERT INTO `multi_auth_rule` VALUES (18, 'Admin/User/authGroup', '用户组管理', 1, 1, '', '2015-10-14 14:10:16');
INSERT INTO `multi_auth_rule` VALUES (19, 'Admin/Addon/addon', '插件管理', 1, 1, '', '2015-10-14 14:11:01');
INSERT INTO `multi_auth_rule` VALUES (20, 'Admin/User/authRule', '权限管理', 1, 1, '', '2015-10-14 14:10:16');
INSERT INTO `multi_auth_rule` VALUES (21, 'Admin/User/user', '用户管理', 1, 1, '', '2015-10-14 18:18:46');
INSERT INTO `multi_auth_rule` VALUES (22, 'Admin/Config/addProvince', '添加省份', 1, 1, '', '2015-10-14 18:19:00');
INSERT INTO `multi_auth_rule` VALUES (23, 'Admin/Config/modifyProvince', '修改省份', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (24, 'Admin/Config/delProvince', '删除省份', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (25, 'Admin/Config/addCity', '添加城市', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (26, 'Admin/Config/city', '城市管理', 1, 1, '', '2015-10-14 18:19:56');
INSERT INTO `multi_auth_rule` VALUES (27, 'Admin/Config/delCity', '删除城市', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (28, 'Admin/Config/modifyCity', '修改城市', 1, 1, '', '2015-10-14 14:03:58');
INSERT INTO `multi_auth_rule` VALUES (29, 'Admin/File/imageUploader', '图片管理', 1, 1, '', '2015-10-14 18:20:12');
INSERT INTO `multi_auth_rule` VALUES (30, 'Admin/File/delImage', '删除图片', 1, 1, '', '2015-10-14 18:20:18');
INSERT INTO `multi_auth_rule` VALUES (31, 'Admin/File/uploadImage', '上传图片', 1, 1, '', '2015-10-14 18:20:24');
INSERT INTO `multi_auth_rule` VALUES (32, 'Admin/Shop/addMenu', '添加菜单', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (33, 'Admin/Shop/modifyMenu', '修改菜单', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (34, 'Admin/Shop/delMenu', '删除菜单', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (35, 'Admin/Shop/addProduct', '添加商品', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (36, 'Admin/Shop/modifyProduct', '修改商品', 1, 1, '', '2015-10-14 14:08:44');
INSERT INTO `multi_auth_rule` VALUES (37, 'Admin/Shop/updateProduct', '更新商品', 1, 1, '', '2015-10-18 11:09:21');
INSERT INTO `multi_auth_rule` VALUES (38, 'Admin/Shop/delProduct', '删除商品', 1, 1, '', '2015-10-14 18:21:04');
INSERT INTO `multi_auth_rule` VALUES (39, 'Admin/Shop/addAds', '添加广告', 1, 1, '', '2015-10-14 18:21:11');
INSERT INTO `multi_auth_rule` VALUES (40, 'Admin/Shop/modifyAds', '修改广告', 1, 1, '', '2015-10-14 18:21:17');
INSERT INTO `multi_auth_rule` VALUES (41, 'Admin/Shop/delAds', '删除广告', 1, 1, '', '2015-10-14 18:21:23');
INSERT INTO `multi_auth_rule` VALUES (42, 'Admin/User/login', '用户登录', 1, 1, '', '2015-10-14 18:21:31');
INSERT INTO `multi_auth_rule` VALUES (43, 'Admin/User/logout', '用户注销', 1, 1, '', '2015-10-14 18:21:37');
INSERT INTO `multi_auth_rule` VALUES (44, 'Admin/User/delUser', '删除用户', 1, 1, '', '2015-10-14 18:21:43');
INSERT INTO `multi_auth_rule` VALUES (45, 'Admin/User/addUser', '添加用户', 1, 1, '', '2015-10-14 18:21:48');
INSERT INTO `multi_auth_rule` VALUES (46, 'Admin/User/modifyUser', '修改用户', 1, 1, '', '2015-10-14 18:21:54');
INSERT INTO `multi_auth_rule` VALUES (47, 'Admin/User/addAuthGroup', '添加用户组', 1, 1, '', '2015-10-14 18:22:00');
INSERT INTO `multi_auth_rule` VALUES (48, 'Admin/User/modifyAuthGroup', '修改用户组', 1, 1, '', '2015-10-14 18:22:09');
INSERT INTO `multi_auth_rule` VALUES (49, 'Admin/User/delAuthGroup', '删除用户组', 1, 1, '', '2015-10-14 18:22:14');
INSERT INTO `multi_auth_rule` VALUES (50, 'Admin/Base/getNotify', '系统通知', 1, 1, '', '2015-10-18 10:16:38');
INSERT INTO `multi_auth_rule` VALUES (51, 'Admin/Addon/addonShop', '插件商店', 1, 1, '', '2015-10-14 14:11:01');
INSERT INTO `multi_auth_rule` VALUES (52, 'Admin/Index/orderChart', '订单分析', 1, 1, '', '2015-10-18 10:19:17');
INSERT INTO `multi_auth_rule` VALUES (53, 'Admin/Index/productChart', '商品分析', 1, 1, '', '2015-10-18 10:19:35');
INSERT INTO `multi_auth_rule` VALUES (54, 'Admin/Shop/comment', '评论管理', 1, 1, '', '2015-10-14 18:21:23');
INSERT INTO `multi_auth_rule` VALUES (55, 'Admin/Shop/productSearch', '商品搜索', 1, 1, '', '2015-10-18 10:21:13');
INSERT INTO `multi_auth_rule` VALUES (56, 'Admin/Order/search', '订单搜索', 1, 1, '', '2015-10-18 10:24:07');
INSERT INTO `multi_auth_rule` VALUES (57, 'Admin/Shop/delComment', '删除评论', 1, 1, '', '2015-10-14 18:21:23');
INSERT INTO `multi_auth_rule` VALUES (58, 'Admin/Order/update', '订单操作', 1, 1, '', '2015-10-18 11:00:46');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_comment`
-- 

CREATE TABLE `multi_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `name` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_comment`
-- 

INSERT INTO `multi_comment` VALUES (1, 136, 1, 792, '清月曦', '不错呦', NULL, '2016-04-07 16:59:10');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_config`
-- 

CREATE TABLE `multi_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `tel` text NOT NULL,
  `address` text NOT NULL,
  `qrcode` text NOT NULL,
  `oauth` tinyint(1) NOT NULL,
  `oauth_debug` int(1) NOT NULL,
  `balance_payment` tinyint(1) NOT NULL,
  `wechat_payment` tinyint(1) NOT NULL,
  `alipay_payment` tinyint(1) NOT NULL,
  `cool_payment` tinyint(1) NOT NULL,
  `theme` text NOT NULL,
  `remark` text,
  `recommend_shop` text,
  `tx_fee` float NOT NULL COMMENT '提现手续费',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_config`
-- 

INSERT INTO `multi_config` VALUES (1, '校内派', '0374-8588991', '河南省许昌市', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGU7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lEdkhCcGZsSGxSbjlXYTd3eE5pAAIEEQ9yVgMEAAAAAA%3D%3D', 1, 0, 1, 1, 1, 1, 'waimai', '', '1,8,9,16,12,19', 0.011, '2016-04-07 14:56:34');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_contact`
-- 

CREATE TABLE `multi_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `province` text,
  `city` text,
  `district` text,
  `address` text NOT NULL,
  `postcode` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_contact`
-- 

INSERT INTO `multi_contact` VALUES (1, 2, '崔', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-06 17:44:52');
INSERT INTO `multi_contact` VALUES (2, 792, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_feedback`
-- 

CREATE TABLE `multi_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `multi_feedback`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `multi_file`
-- 

CREATE TABLE `multi_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `ext` text NOT NULL,
  `type` text NOT NULL,
  `savename` text NOT NULL,
  `savepath` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

-- 
-- 导出表中的数据 `multi_file`
-- 

INSERT INTO `multi_file` VALUES (1, '55e6b902cef38.jpg', 'jpg', 'image/jpeg', '56149e72a10c4.jpg', '2015-10-07/', '2015-10-07 12:24:18');
INSERT INTO `multi_file` VALUES (2, '5615e26f54d75.jpg', 'jpg', 'image/jpeg', '563c4f4336719.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (3, '5615ea4fd93f4.jpg', 'jpg', 'image/jpeg', '563c4f433762a.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (4, '5615eaa90c582.jpg', 'jpg', 'image/jpeg', '563c4f4337c28.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (5, '5615eaa90d34c.jpg', 'jpg', 'image/jpeg', '563c4f4338996.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (6, '5615eaa90dfad.jpg', 'jpg', 'image/jpeg', '563c4f4339b2d.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (7, '5615eaa90e804.jpg', 'jpg', 'image/jpeg', '563c4f433ab12.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `multi_file` VALUES (9, '1-370x370-1420.jpg', 'jpg', 'image/jpeg', '563c52adac85f.jpg', '2015-11-06/', '2015-11-06 15:11:41');
INSERT INTO `multi_file` VALUES (10, '1-370x370-5844-4KHF8KDU.jpg', 'jpg', 'image/jpeg', '563c52bb4b7eb.jpg', '2015-11-06/', '2015-11-06 15:11:55');
INSERT INTO `multi_file` VALUES (11, '1-370x370-5985-9KPFBWR1.jpg', 'jpg', 'image/jpeg', '563c52bb4bced.jpg', '2015-11-06/', '2015-11-06 15:11:55');
INSERT INTO `multi_file` VALUES (12, '1-370x370-6486-BXPDCPCU.jpg', 'jpg', 'image/jpeg', '563c540523c16.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (13, '1-370x370-5942-KCHKPX9K.jpg', 'jpg', 'image/jpeg', '563c540524b9c.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (14, '1-370x370-4394-3YU37TSK.jpg', 'jpg', 'image/jpeg', '563c54052539a.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (15, '1-370x370-3265-PU41F9AB.jpg', 'jpg', 'image/jpeg', '563c540525aca.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (16, '1-370x370-4854-4TC46UPX.jpg', 'jpg', 'image/jpeg', '563c5405260d0.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (17, '1-370x370-6423-YSDU6WA6.jpg', 'jpg', 'image/jpeg', '563c540526487.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `multi_file` VALUES (18, '55fa7cf5d3c70.jpg', 'jpg', 'image/jpeg', '563c61f936dbd.jpg', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (19, '55fa79e11089e.png', 'png', 'image/jpeg', '563c61f937aff.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (20, '55fa76b46c708.png', 'png', 'image/jpeg', '563c61f938112.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (21, '55fa763dbe297.png', 'png', 'image/jpeg', '563c61f9385ba.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (22, '55fa76266b041.png', 'png', 'image/jpeg', '563c61f938931.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (23, '55fa759ae7a02.png', 'png', 'image/jpeg', '563c61f938cac.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (24, '55fa73efc80f0.png', 'png', 'image/jpeg', '563c61f939289.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (25, '55fa737d985f2.png', 'png', 'image/jpeg', '563c61f9395ed.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (26, '563885a8a6b84.jpg', 'jpg', 'image/jpeg', '563c61f93985d.jpg', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `multi_file` VALUES (27, '1417595621584.jpg', 'jpg', 'image/jpeg', '563c68eff3721.jpg', '2015-11-06/', '2015-11-06 16:46:40');
INSERT INTO `multi_file` VALUES (28, '1417597271905.jpg', 'jpg', 'image/jpeg', '563c695de2403.jpg', '2015-11-06/', '2015-11-06 16:48:29');
INSERT INTO `multi_file` VALUES (29, '1434268044104.jpg', 'jpg', 'image/jpeg', '563c695de2cbe.jpg', '2015-11-06/', '2015-11-06 16:48:29');
INSERT INTO `multi_file` VALUES (30, '56332ab690d5a.jpg', 'jpg', 'image/jpeg', '56e26376be595.jpg', '2016-03-11/', '2016-03-11 14:19:34');
INSERT INTO `multi_file` VALUES (31, '56332aceadb31.jpg', 'jpg', 'image/jpeg', '56e2638503403.jpg', '2016-03-11/', '2016-03-11 14:19:49');
INSERT INTO `multi_file` VALUES (32, 'icon_dazhuanpan.png', 'png', 'image/png', '56e286150aba1.png', '2016-03-11/', '2016-03-11 16:47:17');
INSERT INTO `multi_file` VALUES (33, 'icon_huodongbaoming.png', 'png', 'image/png', '56e2867c67ab5.png', '2016-03-11/', '2016-03-11 16:49:00');
INSERT INTO `multi_file` VALUES (34, 'icon_jifen.png', 'png', 'image/png', '56e2884a14ae6.png', '2016-03-11/', '2016-03-11 16:56:42');
INSERT INTO `multi_file` VALUES (35, 'icon_coupon.png', 'png', 'image/png', '56e2887d5a3ff.png', '2016-03-11/', '2016-03-11 16:57:33');
INSERT INTO `multi_file` VALUES (36, 'icon_card.png', 'png', 'image/png', '56e288b77caf6.png', '2016-03-11/', '2016-03-11 16:58:31');
INSERT INTO `multi_file` VALUES (37, 'icon_kehuguanli.png', 'png', 'image/png', '56e289bc27610.png', '2016-03-11/', '2016-03-11 17:02:52');
INSERT INTO `multi_file` VALUES (38, 'icon_erweima.png', 'png', 'image/png', '56e289e1c1135.png', '2016-03-11/', '2016-03-11 17:03:29');
INSERT INTO `multi_file` VALUES (39, 'icon_add.png', 'png', 'image/png', '56e28a2a771f2.png', '2016-03-11/', '2016-03-11 17:04:42');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_loc_city`
-- 

CREATE TABLE `multi_loc_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- 导出表中的数据 `multi_loc_city`
-- 

INSERT INTO `multi_loc_city` VALUES (1, 0, 1, '郑州市');
INSERT INTO `multi_loc_city` VALUES (2, 0, 1, '洛阳市');
INSERT INTO `multi_loc_city` VALUES (3, 0, 2, '海淀区');
INSERT INTO `multi_loc_city` VALUES (4, 0, 2, '朝阳区');
INSERT INTO `multi_loc_city` VALUES (5, 0, 3, '邯郸市');
INSERT INTO `multi_loc_city` VALUES (6, 0, 4, '合肥市');
INSERT INTO `multi_loc_city` VALUES (7, 136, 6, '郑州市');
INSERT INTO `multi_loc_city` VALUES (8, 136, 5, '太原市');
INSERT INTO `multi_loc_city` VALUES (9, 140, 7, '郑州');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_loc_district`
-- 

CREATE TABLE `multi_loc_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `zipcode` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `multi_loc_district`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `multi_loc_province`
-- 

CREATE TABLE `multi_loc_province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- 导出表中的数据 `multi_loc_province`
-- 

INSERT INTO `multi_loc_province` VALUES (1, 0, '河南省');
INSERT INTO `multi_loc_province` VALUES (2, 0, '北京市');
INSERT INTO `multi_loc_province` VALUES (3, 0, '河北省');
INSERT INTO `multi_loc_province` VALUES (4, 0, '安微省');
INSERT INTO `multi_loc_province` VALUES (5, 136, '山西省');
INSERT INTO `multi_loc_province` VALUES (6, 136, '河南省');
INSERT INTO `multi_loc_province` VALUES (7, 140, '河南');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_log`
-- 

CREATE TABLE `multi_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `multi_log`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `multi_menu`
-- 

CREATE TABLE `multi_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `pid` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- 导出表中的数据 `multi_menu`
-- 

INSERT INTO `multi_menu` VALUES (1, '水果', 0, 0, '', 1, '2016-03-26 10:17:26', 136);
INSERT INTO `multi_menu` VALUES (2, '生鲜', 0, 0, '', 0, '2016-03-26 10:18:22', 136);
INSERT INTO `multi_menu` VALUES (3, '外卖', 0, 0, '', 0, '2016-03-26 10:18:35', 136);
INSERT INTO `multi_menu` VALUES (4, '超市', 0, 24, '', 0, '2016-01-05 10:30:11', 0);
INSERT INTO `multi_menu` VALUES (5, '社区1', 1, 24, '', 0, '2016-01-05 16:14:31', 0);
INSERT INTO `multi_menu` VALUES (6, '水果', 0, 10, '2', 1, '2016-03-28 17:15:12', 138);
INSERT INTO `multi_menu` VALUES (7, '蔬菜', 0, 25, '1', 1, '2016-03-28 17:22:22', 138);
INSERT INTO `multi_menu` VALUES (8, '菜单1号', 0, 33, '', 0, '2016-04-06 17:07:52', 140);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_order`
-- 

CREATE TABLE `multi_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `orderid` text NOT NULL,
  `totalprice` text NOT NULL,
  `payment` text NOT NULL,
  `pay_status` int(11) NOT NULL,
  `delivery_time` text NOT NULL,
  `freight` float NOT NULL,
  `discount` int(11) NOT NULL,
  `remark` text,
  `status` int(11) NOT NULL COMMENT '0:未处理，1:已发货，-2:退货中，-3:退货完成，-4:申请退货，-1:交易取消，2:交易完成',
  `time` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `multi_order`
-- 

INSERT INTO `multi_order` VALUES (1, 136, 2, '1604061104233', '7.00', '2', 0, '10:30-11:30', 2, 2, '', -1, '2016-04-06 23:04:23');
INSERT INTO `multi_order` VALUES (2, 136, 792, '1604070320031', '7.00', '0', 1, '10:30-11:30', 2, 2, '哈', 0, '2016-04-07 15:20:03');
INSERT INTO `multi_order` VALUES (3, 136, 792, '1604070322391', '0.01', '2', 0, '10:30-11:30', 0, 0, '', 1, '2016-04-07 15:22:39');
INSERT INTO `multi_order` VALUES (4, 136, 792, '1604070323049', '0.01', '2', 0, '10:30-11:30', 0, 0, '', 1, '2016-04-07 15:23:04');
INSERT INTO `multi_order` VALUES (5, 136, 792, '1604070324113', '0.01', '2', 1, '10:30-11:30', 0, 0, '', -1, '2016-04-07 15:24:11');
INSERT INTO `multi_order` VALUES (6, 136, 792, '1604070333357', '0.01', '0', 1, '10:30-11:30', 0, 0, '', -1, '2016-04-07 15:33:35');
INSERT INTO `multi_order` VALUES (7, 136, 792, '1604070338434', '0.01', '0', 1, '10:30-11:30', 0, 0, '', -1, '2016-04-07 15:38:43');
INSERT INTO `multi_order` VALUES (8, 136, 792, '1604070341197', '0.01', '0', 1, '10:30-11:30', 0, 0, '', -1, '2016-04-07 15:41:19');
INSERT INTO `multi_order` VALUES (9, 136, 792, '1604070355221', '0.01', '0', 1, '10:30-11:30', 0, 0, '', -1, '2016-04-07 15:55:22');
INSERT INTO `multi_order` VALUES (10, 136, 792, '1604070431308', '0.01', '0', 1, '10:30-11:30', 0, 0, '', 1, '2016-04-07 16:31:30');
INSERT INTO `multi_order` VALUES (11, 136, 792, '1604070436224', '0.01', '0', 1, '10:30-11:30', 0, 0, '', 2, '2016-04-07 16:36:22');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_order_contact`
-- 

CREATE TABLE `multi_order_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `province` text,
  `city` text,
  `district` text,
  `address` text NOT NULL,
  `postcode` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `multi_order_contact`
-- 

INSERT INTO `multi_order_contact` VALUES (1, 2, 1, '崔', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-06 17:44:52');
INSERT INTO `multi_order_contact` VALUES (2, 792, 2, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (3, 792, 3, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (4, 792, 4, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (5, 792, 5, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (6, 792, 6, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (7, 792, 7, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (8, 792, 8, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (9, 792, 9, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (10, 792, 10, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_contact` VALUES (11, 792, 11, '哈', '10086', '河南', '郑州', NULL, '哈哈', NULL, NULL, '2016-04-07 15:20:03');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_order_detail`
-- 

CREATE TABLE `multi_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `sku_id` int(11) NOT NULL,
  `sku_name` text NOT NULL,
  `num` int(11) NOT NULL,
  `price` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `multi_order_detail`
-- 

INSERT INTO `multi_order_detail` VALUES (1, 1, 1, 2, 10, '橙子（美味可口）', 0, '', 1, '5', NULL, '2016-04-06 23:04:23');
INSERT INTO `multi_order_detail` VALUES (2, 2, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '5', NULL, '2016-04-07 15:20:03');
INSERT INTO `multi_order_detail` VALUES (3, 3, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:22:39');
INSERT INTO `multi_order_detail` VALUES (4, 4, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:23:04');
INSERT INTO `multi_order_detail` VALUES (5, 5, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:24:11');
INSERT INTO `multi_order_detail` VALUES (6, 6, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:33:35');
INSERT INTO `multi_order_detail` VALUES (7, 7, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:38:43');
INSERT INTO `multi_order_detail` VALUES (8, 8, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:41:19');
INSERT INTO `multi_order_detail` VALUES (9, 9, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 15:55:22');
INSERT INTO `multi_order_detail` VALUES (10, 10, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', NULL, '2016-04-07 16:31:30');
INSERT INTO `multi_order_detail` VALUES (11, 11, 1, 792, 10, '橙子（美味可口）', 0, '', 1, '0.01', '1', '2016-04-07 16:59:10');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_product`
-- 

CREATE TABLE `multi_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subname` text,
  `price` text NOT NULL,
  `old_price` float NOT NULL,
  `unit` text NOT NULL,
  `score` float NOT NULL,
  `sales` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `albums` text NOT NULL,
  `visiter` int(11) NOT NULL,
  `psku` tinyint(1) NOT NULL,
  `file_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:售罄，-1:下架，1:出售',
  `label` text COMMENT '标签值',
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- 
-- 导出表中的数据 `multi_product`
-- 

INSERT INTO `multi_product` VALUES (1, 136, 1, '橙子（美味可口）', '', '0.01', 0, '', 12, 0, 0, '29,24,', 16, 1, 10, '<p>哈哈哈哈哈哈哈</p>', 1, '推荐', '', 0, '2016-04-07 15:20:53');
INSERT INTO `multi_product` VALUES (2, 138, 6, '香蕉', '222', '12', 0, '个', 12, 0, 0, '', 1, 0, 9, '', 1, '推荐', '', 0, '2016-04-01 15:25:18');
INSERT INTO `multi_product` VALUES (3, 0, 5, '苹果', '美味', '12', 0, '', 12, 0, 0, '', 13, 0, 11, '', 1, '推荐', '', 0, '2016-03-13 22:51:45');
INSERT INTO `multi_product` VALUES (4, 0, 1, '香梨', '', '12', 0, '', 12, 0, 0, '', 0, 0, 17, '', 1, '推荐', '', 0, '2016-03-13 22:51:31');
INSERT INTO `multi_product` VALUES (5, 0, 1, '葡萄', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 16, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (6, 0, 1, '菠萝', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 15, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (7, 0, 1, '火龙果', NULL, '12', 0, '', 12, 0, 0, '', 2, 0, 14, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (8, 0, 1, '奇异果', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 13, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (9, 0, 1, '蓝莓', NULL, '12', 0, '', 12, 0, 0, '', 1, 0, 12, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (10, 0, 2, '清蒸鲈鱼', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 24, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (11, 0, 2, '香辣大闸蟹', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 18, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (12, 0, 2, '大米饽饽嫩羊肉', NULL, '12', 0, '', 12, 0, 0, '', 1, 0, 26, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (13, 0, 2, '蘸汁菠菜', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 25, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (14, 0, 2, '手抓羊排', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 23, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (15, 0, 5, '美汁活鲍', '', '12', 0, '', 12, 0, 0, '', 0, 0, 22, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (16, 0, 2, '香辣花甲', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 20, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (17, 0, 2, '香辣蛏子', NULL, '12', 0, '', 12, 0, 0, '', 0, 0, 19, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (18, 0, 5, '清蒸黄花鱼', '', '12', 0, '', 12, 0, 0, '', 0, 0, 21, '', 1, '', '', 0, '2016-01-05 11:02:23');
INSERT INTO `multi_product` VALUES (19, 0, 5, '红烧排骨', '', '12', 0, '', 12, 0, 0, '', 1, 1, 27, '', 1, NULL, '', 0, '2016-01-11 18:39:35');
INSERT INTO `multi_product` VALUES (21, 0, 4, '肉末茄子', '好吃不贵', '12', 0, '', 12, 0, 0, '24,18,', 0, 1, 28, '<p>哈哈哈哈哈哈</p>', 1, '推荐', '', 0, '2016-03-13 22:51:37');
INSERT INTO `multi_product` VALUES (22, 140, 8, '哇哈哈', '好喝的哇哈哈', '10', 12, '1', 10, 0, 0, '22,28,', 0, 0, 11, '<p><img src="/multi/Public/Uploads/20160406/1459933830133613.jpg" title="1459933830133613.jpg" alt="1453362949.jpg"/></p>', 1, '热销', '这是备注', 0, '2016-04-06 17:10:32');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_product_label`
-- 

CREATE TABLE `multi_product_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subname` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `multi_product_label`
-- 

INSERT INTO `multi_product_label` VALUES (1, 136, '热销', '热销', '', '2016-03-26 10:28:51');
INSERT INTO `multi_product_label` VALUES (2, 136, '推荐', '推荐', '', '2016-03-26 10:28:55');
INSERT INTO `multi_product_label` VALUES (3, 136, '特卖', '特卖', '', '2016-03-26 11:08:11');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_product_sku`
-- 

CREATE TABLE `multi_product_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `path` text,
  `price` float NOT NULL COMMENT '价格',
  `freight` float NOT NULL,
  `store` int(11) NOT NULL COMMENT '库存',
  `sales` int(11) NOT NULL COMMENT '销售量',
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- 
-- 导出表中的数据 `multi_product_sku`
-- 

INSERT INTO `multi_product_sku` VALUES (24, 136, 1, '红色', NULL, 5, 2, 10, 0, NULL, '2016-04-06 15:24:00');
INSERT INTO `multi_product_sku` VALUES (25, 136, 1, '蓝色', NULL, 6, 2, 11, 0, NULL, '2016-04-06 15:24:24');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_shop`
-- 

CREATE TABLE `multi_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '店铺管理员',
  `file_id` int(11) NOT NULL,
  `name` text,
  `subname` text,
  `notification` text,
  `reminder` text,
  `employee` text,
  `qq` text,
  `tel` text,
  `address` text,
  `freight` float NOT NULL,
  `full` int(11) NOT NULL COMMENT '满',
  `discount` float NOT NULL DEFAULT '1',
  `delivery_time` text,
  `rank` int(11) NOT NULL,
  `money` float NOT NULL,
  `status` int(11) NOT NULL COMMENT '-1：关闭，0:未审核，1:休息，2:正常',
  `lng` float NOT NULL COMMENT '经度',
  `lat` float NOT NULL COMMENT '纬度',
  `remark` text,
  `coupon` int(11) NOT NULL COMMENT '开启优惠券',
  `shoplist` int(11) NOT NULL COMMENT '首页是否显示店铺列表',
  `is_show` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

-- 
-- 导出表中的数据 `multi_shop`
-- 

INSERT INTO `multi_shop` VALUES (1, 3, 95, '365生活馆', '欢迎来到365生活馆', '欢迎来到365生活馆', '欢迎来到365生活馆', '154,155', '3219857546', '03748588991', '河南省,许昌市,魏都区,文渊路,', 2, 0, 1, ' 10:30-20:30', 0, 0.11, 0, 113.875, 34.0485, '', 1, 0, 0, '2016-03-28 16:15:36');
INSERT INTO `multi_shop` VALUES (2, 1, 8, '一米鲜', '', '这里是一米鲜商城，欢迎您的加入！', '你好，我是小蚂蚁', '7,6,4', '1552974441', '03746096871', '河南省,许昌市,魏都区,明理路,', 0, 10, 0, '10:30-16:00,18:30-21:30', 0, 3.18, 2, 113.875, 34.0477, '有什么可以帮您？', 0, 0, 0, '2015-12-29 17:40:47');
INSERT INTO `multi_shop` VALUES (3, 8, 187, '校内派测试', '12123123', '欢迎来到校内派商城12', '欢迎来到校内派商城2', ',2', '42131', '132339727572', '河南省,许昌市,魏都区,文渊路,', 0, 20, 0, '', 0, 0.3, 2, 113.875, 34.0491, '', 0, 0, 0, '2016-03-19 09:36:07');
INSERT INTO `multi_shop` VALUES (8, 13, 63, '许院早餐百分百', '', '人是铁，饭是钢，一顿不吃饿得慌。希望同学们，不要为了多睡一会，不吃早餐呀。如果你实在是起不来，就下订单吧，我们送到你的寝室。为了你的健康，请关注我们哦！', '人是铁，饭是钢。一顿不吃，你心发慌。', '12', '3219857546', '0374-8588991', '河南省,许昌市,魏都区,明理路,', 1, 0, 0, '6:20-9:30', 0, 0, 2, 113.876, 34.0477, '一切都是为了你的健康。', 0, 0, 0, '2015-12-30 14:06:05');
INSERT INTO `multi_shop` VALUES (9, 3, 24, '新青年创业咖啡', '', '新青年创业咖啡，选好料，做好产品，是我们的基本宗旨！', '', '', '3219857546', '03748588991', '河南省,许昌市,魏都区,文渊路,', 0, 0, 0, '10:30-18:30', 0, 0, 2, 113.876, 34.0484, '亲，现磨咖啡，小心烫口哦！', 0, 0, 0, '2015-12-30 11:37:57');
INSERT INTO `multi_shop` VALUES (12, 16, 139, '罗拉快跑极速商城', '综合商城', '营业时间早上九点至晚九点~', '罗拉快跑~现在下单，五分钟即可送达~', '10', '790661029', '13290757016', '河南省,许昌市,魏都区,文渊路,', 0, 0, 0, '9:00-21:00', 0, 0, 2, 113.876, 34.0499, '', 0, 0, 0, '2015-12-30 14:37:57');
INSERT INTO `multi_shop` VALUES (16, 13, 113, '乐果●水果快递', '', '', '', '12', '3219857546', '0374-8588991', '河南省,许昌市,魏都区,文渊路,', 3, 0, 0, '10:00-20:00', 0, 0, 2, 113.876, 34.0482, '', 0, 0, 0, '2015-12-30 12:02:13');
INSERT INTO `multi_shop` VALUES (17, 39, 0, '校园微打印', '校园微打印', '', '', '', '609843551', '13083605380', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (18, 42, 432, '海岛那年众筹超市', '', '', '', '', '2027339178', '', '海南省,海口市,龙华区,崇师路,', 0, 0, 0, '', 0, 0, 2, 110.34, 19.9878, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (19, 16, 148, 'From.爱.创意工坊', '', '', '', '10', '', '', '四川省,成都市,武侯区,校中路,', 0, 0, 0, '', 0, 0, 2, 104.076, 30.6466, '', 0, 0, 0, '2015-12-30 17:48:11');
INSERT INTO `multi_shop` VALUES (22, 73, 204, '7', '7', '11111111', '11111111111', '37', '1164364697', '18846933052', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '11111', 0, 0, 0, '2016-03-05 21:09:45');
INSERT INTO `multi_shop` VALUES (24, 79, 455, '快乐外卖', '交职院-快餐', '', '', '', '976952589', '13436296015', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-02-22 12:54:11');
INSERT INTO `multi_shop` VALUES (28, 85, 185, '小鸡小鸡快递', '小鸡', '小鸡小鸡快递入驻哎吆嗨O中工微信公众号', '', '', '1761918550', '18439898701', '河南省,郑州市,新郑市,G107,', 3, 0, 0, '12:00-13:00至17:00-20:00', 0, 0, 2, 113.692, 34.5917, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (29, 79, 0, '重庆交通职业学院', '交院', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (30, 79, 0, '公共运输学院', '公共', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (31, 97, 0, '许愿闺蜜阁', '一站式校园服务平台，大学生活的贴身', '一站式校园服务平台，大学生活的贴身', '真实的为在校师生提供便利，这里是诚信友善爱的天堂。', '96', '1241370747', '15537440013', '河南省,许昌市,魏都区,闻理路,', 0, 0, 0, '11:30—14:00,17:30—22:30', 0, 0, 2, 113.876, 34.0498, '下单后请及时查收，如有问题请联系15537440013', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (37, 110, 188, '鲜果', '', '爱上鲜果', '请在营业时间下单', '', '877303438', '15638957375', '河南省,南阳市,宛城区,未来大道(西路),', 0, 0, 0, '10:30-17:30', 0, 0, 2, 112.56, 32.9708, '', 0, 0, 0, '2016-01-10 18:57:30');
INSERT INTO `multi_shop` VALUES (40, 127, 190, '叶县365外卖', '', '亲们，调试已完成，可以下单啦！本月为试营业，有不足之处还望大家多多指正！', '您已下单成功，切勿二次重复下单！请您稍等，我们将马上为您安排送餐服务！', '9', '13290925152', '13290925152', '河南省,平顶山市,叶县,文化路,', 0, 0, 1, '10:30--20:00', 0, 10.08, 2, 113.368, 33.6294, '备注', 1, 0, 0, '2016-03-11 13:10:19');
INSERT INTO `multi_shop` VALUES (50, 153, 205, '没蒙古特产专卖', '', '本店经营销售正宗内蒙古特产美食及工艺品，质量真实，价格公道。', '拍单的亲 请先与店主QQ或者电话先联系确认，谢谢合作。', '', '384321143', '14747226148', '内蒙古自治区,包头市,昆都仑区,富林路,北门-西', 8, 0, 0, '00:00-24:00', 0, 0, 2, 109.832, 40.6454, '', 0, 0, 0, '2016-03-02 22:16:03');
INSERT INTO `multi_shop` VALUES (51, 157, 467, '小吃街2222号', '', '营业时间朝九晚五', '么么哒', '', '2421372161', '13290757016', '河南省,许昌市,魏都区,学府街,', 0.5, 6, 0.03, '10:30-23:30', 0, 0, 2, 113.864, 34.0489, '', 1, 1, 1, '2016-03-03 09:57:49');
INSERT INTO `multi_shop` VALUES (52, 157, 467, '小吃街88888号', '', '111111111111111111', '11111111111111111111', '', '2421372161', '13295047102', '河南省,许昌市,魏都区,魏文路,', 1, 6, 0.05, '10:30-23:00', 0, 0, 2, 113.863, 34.047, '', 0, 1, 1, '2016-03-03 10:26:29');
INSERT INTO `multi_shop` VALUES (53, 160, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 10:58:04');
INSERT INTO `multi_shop` VALUES (60, 163, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (61, 164, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (62, 165, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (63, 166, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (64, 167, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (65, 168, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (66, 169, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (67, 170, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (68, 172, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 14:35:04');
INSERT INTO `multi_shop` VALUES (69, 173, 469, '郑工微打印', '', '全校宿舍楼支持配送业务！', '', '', '1007292508', '15093531102', '', 0, 0, 0, '13:00-14:00,21:00-22:00', 0, 2, 2, 0, 0, '', 0, 0, 0, '2016-03-06 13:30:18');
INSERT INTO `multi_shop` VALUES (70, 173, 470, '郑工商城', '', '欢迎光临郑工商城！', '', '', '1007292508', '15093531102', '', 2, 15, 0, '', 0, 0, 2, 0, 0, '我们会在每天晚上10:30之前为大家配送，请大家谅解！', 0, 1, 1, '2016-03-03 16:07:38');
INSERT INTO `multi_shop` VALUES (71, 174, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 18:11:30');
INSERT INTO `multi_shop` VALUES (72, 175, 888, '水果屋', '新鲜水果', '新鲜水果开始供应啦', '', '', '125465652', '13579511909', '新疆维吾尔自治区,克拉玛依市,克拉玛依区,东外环路,', 0, 0, 0, '13:40-14:40      19:00-20:40', 0, 0, 2, 84.9345, 45.5529, '', 0, 1, 1, '2016-03-11 20:01:33');
INSERT INTO `multi_shop` VALUES (73, 176, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 18:11:30');
INSERT INTO `multi_shop` VALUES (74, 180, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 18:47:48');
INSERT INTO `multi_shop` VALUES (75, 182, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-03 18:53:28');
INSERT INTO `multi_shop` VALUES (76, 185, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-04 08:28:57');
INSERT INTO `multi_shop` VALUES (77, 187, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-04 09:12:58');
INSERT INTO `multi_shop` VALUES (78, 188, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-04 09:35:52');
INSERT INTO `multi_shop` VALUES (79, 189, 476, '来货', '', '', '', '', '', '', '', 0, 0, 1, '', 0, 0, 2, 0, 0, '', 0, 1, 1, '2016-03-04 11:02:05');
INSERT INTO `multi_shop` VALUES (80, 13, 577, '新青年创业咖啡', '', '你的一个想法，或许可以创造一个伟大的时代。', '', '', '3219857546', '0374-8588991', '河南省,许昌市,魏都区,开拓路,', 1, 10, 0.03, '8:00-20:30', 0, 0, 2, 113.871, 34.05, '', 0, 0, 1, '2016-03-13 22:43:16');
INSERT INTO `multi_shop` VALUES (81, 191, 475, '工科校园超市', '四川工业科技学院校园超市', '更贴心的校园超市，为工科学子服务。主要销售水果，各种零食，饮料，香烟，生活用品。', '', 'WGB809600393', '2439964467', '18280535513        636805', '四川省,德阳市,罗江县,金雁大桥,', 1, 10, 0.9, '12:10-13:40,18:00-22:00', 0, 0, 2, 104.507, 31.3292, '', 0, 1, 1, '2016-03-04 11:12:29');
INSERT INTO `multi_shop` VALUES (82, 189, 474, '三只小馋猫', '', '额外给', '的人还不', '', '924343998', '18939527959', '河南省,郑州市,金水区,春华路,', 0, 9, 0, '', 0, 0, 2, 113.663, 34.8029, '', 0, 1, 1, '2016-03-04 11:40:46');
INSERT INTO `multi_shop` VALUES (83, 192, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-04 11:47:11');
INSERT INTO `multi_shop` VALUES (87, 161, 0, '校内派', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 1, 0, 0, '2016-03-04 18:28:59');
INSERT INTO `multi_shop` VALUES (89, 204, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-05 17:16:49');
INSERT INTO `multi_shop` VALUES (90, 206, 713, '商大校园', '助手', '你好玩，大家才好玩', '小心购物', 'daipeng998', '1162336755', '18515393342', '河南省,商丘市,梁园区,X020,', 0, 100, 0, '12:00—13:00', 0, 0, 2, 115.725, 34.4095, '', 0, 0, 0, '2016-03-05 17:44:51');
INSERT INTO `multi_shop` VALUES (91, 209, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-05 17:46:23');
INSERT INTO `multi_shop` VALUES (92, 206, 714, '五谷鱼粉', '', '你好', '', 'daipeng998', '2222222', '18515394444', '河南省,平顶山市,汝州市,S241,', 0, 0, 0, '0', 0, 0, 2, 112.972, 34.0281, '', 0, 0, 0, '2016-03-05 17:46:23');
INSERT INTO `multi_shop` VALUES (93, 211, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 08:34:01');
INSERT INTO `multi_shop` VALUES (94, 73, 0, '1', '1', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (95, 73, 0, '2', '2', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (96, 73, 0, '3', '3', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (97, 73, 0, '3', '3', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (98, 213, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (99, 73, 0, '4', '4', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (100, 73, 0, '5', '5', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (101, 73, 0, '6', '6', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (102, 73, 0, '8', '8', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (103, 73, 0, '9', '9', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (104, 73, 0, '10', '10', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (105, 222, 727, '夏派进口饮料', '你妹妹的', '进店不要钱', '小心剁手', '', '74110', '1373885799X', '上海市,上海市,黄浦区,成都北路,408号', 0, 1000, 7, '10:30-17:00', 0, 0, 2, 121.474, 31.2362, '', 0, 1, 1, '2016-03-09 23:20:33');
INSERT INTO `multi_shop` VALUES (107, 226, 0, '默认店铺', '', '', '', '', '', '', '宁夏回族自治区,银川市,金凤区,贺兰山中路,', 0, 0, 1, '', 0, 0, 2, 106.265, 38.5075, '', 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (108, 228, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 08:33:48');
INSERT INTO `multi_shop` VALUES (109, 231, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 08:38:14');
INSERT INTO `multi_shop` VALUES (110, 233, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 11:18:04');
INSERT INTO `multi_shop` VALUES (111, 235, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 11:24:57');
INSERT INTO `multi_shop` VALUES (112, 236, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-07 14:41:36');
INSERT INTO `multi_shop` VALUES (113, 255, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-09 08:36:43');
INSERT INTO `multi_shop` VALUES (114, 260, 723, '郑州烧烤超市', '芭比Q烧烤超市', '', '', '274', '2529736581', '0371-55057082', '河南省,郑州市,金水区,X007(鸿苑路),', 0, 300, 9.8, '6:00-21:00', 0, 1, 2, 113.818, 34.8797, '为保证用户体验，请至少提前4小时下单，团体客户请至少提前一天。', 0, 0, 1, '2016-03-12 20:59:35');
INSERT INTO `multi_shop` VALUES (115, 267, 883, '工科校园超市', '', '亲爱的新老顾客，有了你们，工科校园超市才会更好，谢谢你们的支持。有的东西不齐全，望理解。后期会陆续有水果，快餐，等都是送货上门。周末营业时间为9点到23点平时中午12点15到13点40.   18点到22点', '请同学们在填写地址的时候希望填写寝室号。联系电话尽量填写短号。由于配送原因，希望大家选购商品金量超过起送价，超过起送价可以免运费，因为我们配送员也很辛苦哟。同学们还可以跟寝室的AA付款哟。谢谢支持理解。', '470,297,196,533,549', '2439964467', '18280535513', '四川省,德阳市,罗江县,金雁大桥,', 0.9, 17, 0.95, '12:10-13:40,18：00-19:00,19:00-20:00,20:00-21:00,21:00-22:00', 0, 159.2, 1, 104.508, 31.3275, '', 0, 1, 0, '2016-03-13 22:04:40');
INSERT INTO `multi_shop` VALUES (116, 271, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-09 18:31:59');
INSERT INTO `multi_shop` VALUES (117, 284, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-10 08:51:46');
INSERT INTO `multi_shop` VALUES (118, 355, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-10 11:22:35');
INSERT INTO `multi_shop` VALUES (119, 387, 734, '辽宁广惠智能装备', '广惠智能', '', '', '韩培培,周义', '2098936028', '', '辽宁省,抚顺市,顺城区,上马线,', 0, 0, 1, '', 0, 0, 2, 123.848, 41.938, '', 0, 0, 0, '2016-03-10 15:42:31');
INSERT INTO `multi_shop` VALUES (121, 428, 0, '楠园八舍零食铺', '', '', '', '', '1134244906', '15320456507', '重庆市,重庆市,北碚区,融汇南路,', 1, 5, 0.95, '6:00-7:40\r\n21:00-24:00', 0, 0, 2, 106.425, 29.8236, '', 0, 1, 1, '2016-03-12 16:20:25');
INSERT INTO `multi_shop` VALUES (122, 447, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-11 08:37:42');
INSERT INTO `multi_shop` VALUES (123, 197, 745, '恒信镖局', '', '', '', '李小信', '1140576689', '0371-55955674', '河南省,郑州市,惠济区,古园街,', 1, 0, 0, '8：00~7：00', 0, 0, 2, 113.613, 34.8679, '', 0, 0, 0, '2016-03-11 08:37:42');
INSERT INTO `multi_shop` VALUES (124, 458, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-11 08:37:42');
INSERT INTO `multi_shop` VALUES (126, 482, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-11 15:03:10');
INSERT INTO `multi_shop` VALUES (127, 514, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-11 20:40:49');
INSERT INTO `multi_shop` VALUES (128, 175, 886, '克拉玛依特色凉皮', '凉皮 擀面皮 牛筋面 高旦面 红薯皮', '克拉玛依特色凉皮 擀面皮 牛筋面 高旦面 红薯皮       （非清真）', '', '', '125465652', '13579511909', '新疆维吾尔自治区,克拉玛依市,克拉玛依区,东外环路,', 0, 0, 0, '13：40-14:30       19:00-20:40', 0, 0, 2, 84.9348, 45.5531, '', 0, 1, 1, '2016-03-11 20:40:49');
INSERT INTO `multi_shop` VALUES (129, 575, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-12 09:47:19');
INSERT INTO `multi_shop` VALUES (130, 428, 0, '李七', '', '', '', '', '', '', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 0, 0, '2016-03-13 18:08:29');
INSERT INTO `multi_shop` VALUES (131, 698, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-13 18:08:29');
INSERT INTO `multi_shop` VALUES (132, 267, 0, '快餐', '', '', '', '', '', '18280535513', '', 0, 0, 0, '', 0, 0, 2, 0, 0, '', 0, 1, 0, '2016-03-13 18:08:29');
INSERT INTO `multi_shop` VALUES (133, 760, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 2, 0, 0, NULL, 0, 0, 0, '2016-03-14 08:54:34');
INSERT INTO `multi_shop` VALUES (134, 8, 187, '2313', '123123', '123123', '123123', ',2', '123123', '31231', ',,,,', 20, 20, 8, '', 0, 0, 2, 122.666, 34.7087, '', 0, 0, 0, '2016-03-25 15:13:50');
INSERT INTO `multi_shop` VALUES (135, 1, 37, 'pidong店铺1', 'xigua', '打西瓜真好吃', '没有', '', '10086', '10010', '河南省,郑州市,二七区,一马路,', 0, 0, 0, '', 0, 0, 2, 113.667, 34.7516, '', 0, 0, 0, '2016-03-25 17:50:25');
INSERT INTO `multi_shop` VALUES (136, 789, 37, '默认店铺', '哈哈', '11', '22', ',2,792,793', '1604583867', '10086', '河南省,郑州市,金水区,文化路,52号附32号', 0, 20, 2, '10:30-11:30,14:30-15:30', 0, 9880.01, 2, 113.673, 34.7913, '哈哈', 0, 0, 0, '2016-04-07 15:25:13');
INSERT INTO `multi_shop` VALUES (138, 789, 29, '2号店', '我的小店', '1111', '11111111', NULL, '1604583867', '10086', '河南省郑州市金水区南阳新村街道怡丰·新都汇2期', 2, 20, 1, '10:30-11:30', 0, 0, 2, 113.649, 34.7853, '222', 0, 1, 1, '2016-04-07 10:21:41');
INSERT INTO `multi_shop` VALUES (139, 790, 0, '默认店铺', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2016-04-01 10:08:35');
INSERT INTO `multi_shop` VALUES (140, 791, 1, 'pidong2号店', '嘻嘻哈哈', '你好，买一送一', '坏了不陪', NULL, '117930219', '10010', '河南省郑州市金水区文化路街道河南农业大学', 1, 10, 1, '', 0, 0, 2, 113.663, 34.7847, '', 0, 1, 0, '2016-04-06 17:19:41');
INSERT INTO `multi_shop` VALUES (141, 794, 30, '测试', '111', '测试', '测试', NULL, '123123', '132339727572', '河南省郑州市中原区棉纺路街道棉三厂家属院', 2, 20, 2, '', 0, 0, 0, 113.616, 34.7596, '', 0, 0, 0, '2016-04-12 21:07:05');
INSERT INTO `multi_shop` VALUES (142, 794, 31, '测试2', '测试2', '11', '11', NULL, '11', '11', '河南省平顶山市汝州市小屯镇路寨村', 2, 2, 2, '', 0, 0, 0, 113.006, 34.0285, '', 0, 0, 0, '2016-04-12 21:09:01');
INSERT INTO `multi_shop` VALUES (143, 794, 0, '1', '1', '1', '1', NULL, '1', '1', '河南省平顶山市宝丰县商酒务镇商酒务镇焦楼村标准化卫生所', 1, 1, 1, '1', 0, 0, 0, 112.983, 33.9747, '1', 0, 0, 0, '2016-04-12 21:11:39');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_sms`
-- 

CREATE TABLE `multi_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `pass` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_sms`
-- 

INSERT INTO `multi_sms` VALUES (1, '#', '#', '2016-01-05 10:16:01');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_trade`
-- 

CREATE TABLE `multi_trade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `tradeid` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` float NOT NULL,
  `payment` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_trade`
-- 

INSERT INTO `multi_trade` VALUES (1, 136, '1', 2, 10, '支付宝支付', '1', '2016-03-26 17:35:33');
INSERT INTO `multi_trade` VALUES (2, 136, '1604070324113', 792, 0.01, '支付宝支付', NULL, '2016-04-07 15:25:13');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_tx`
-- 

CREATE TABLE `multi_tx` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `txid` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `name` text NOT NULL,
  `money` float NOT NULL,
  `fee` float NOT NULL COMMENT '手续费',
  `tx` float NOT NULL COMMENT '最终提现',
  `status` int(11) NOT NULL COMMENT '0：申请提现1：通过-1拒绝取消',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_tx`
-- 

INSERT INTO `multi_tx` VALUES (1, '1604071202517', 789, 136, '1604583867@qq.com', '清月曦', 120, 1.32, 118.68, 0, '2016-04-07 12:02:50');
INSERT INTO `multi_tx` VALUES (2, '1604071203044', 789, 136, '1604583867@qq.com', '清月曦', 150, 1.65, 148.35, -1, '2016-04-07 12:03:07');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_user`
-- 

CREATE TABLE `multi_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL COMMENT '默认地址',
  `tuijianren_id` int(11) NOT NULL,
  `openid` text NOT NULL,
  `username` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `token` text,
  `avater` text NOT NULL,
  `sex` tinyint(4) NOT NULL COMMENT '1:男,2女',
  `city` text NOT NULL,
  `province` text NOT NULL,
  `country` text NOT NULL,
  `language` text NOT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `money` float NOT NULL,
  `score` float NOT NULL,
  `status` int(11) NOT NULL,
  `is_cert` int(11) NOT NULL COMMENT '是否认证',
  `lastip` text NOT NULL,
  `ctime` text NOT NULL,
  `buy_num` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0:普通用户,2:店铺管理员',
  `level` int(11) NOT NULL COMMENT '等级',
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=796 ;

-- 
-- 导出表中的数据 `multi_user`
-- 

INSERT INTO `multi_user` VALUES (2, 3, 0, 'oojFxs4s3PSZVjL-X5UpFPhNfG0c', 'AI.何青.wemall', '', '', '21232f297a57a5a743894a0e4a801fc3', '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDVc2kT8kAf3zOaicA94KJGfXofhVBcibYkJr6qaviazGtAprVBKkvEISFShWiaCu0LFbiakQIz9pjTOicg/0', 1, '', 'Louth', '', 'zh_CN', 1, 338.08, 1747, 1, 0, '0.0.0.0', '2015-10-19 12:40:19', 197, 2, 0, '', '2016-04-11 18:49:55');
INSERT INTO `multi_user` VALUES (8, 0, 0, '', '1', '13233972757', '', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 1, '', '2015-12-28 17:56:55', 0, 2, 0, NULL, '2016-03-19 10:31:04');
INSERT INTO `multi_user` VALUES (13, 0, 0, '', '13213368101', '13213368101', '', '9eb52aaa8c89c21076cef3208b6e7e0e', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-29 14:14:56', 0, 2, 0, NULL, '2015-12-29 06:14:56');
INSERT INTO `multi_user` VALUES (16, 0, 0, '', 'From爱', '13290757016', '', '73534bd1214334e5c3aa8fe323746776', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-29 15:18:14', 0, 2, 0, NULL, '2015-12-29 07:18:14');
INSERT INTO `multi_user` VALUES (39, 0, 0, '', '校园微打印', '13083605380', '', '08d902292f634d462243ef3c2e86f244', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-30 14:56:50', 0, 2, 0, NULL, '2015-12-30 06:56:50');
INSERT INTO `multi_user` VALUES (42, 0, 0, '', 'hdnn123', '13518845953', '', '2019c60acb11fd7b2089edafa45b37e8', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-30 15:04:29', 0, 2, 0, NULL, '2015-12-30 07:04:29');
INSERT INTO `multi_user` VALUES (73, 0, 0, '', 'xiaoyuankuba', '18846933052', '', '65734cfbfa51c6ea7d517cb7b98460cd', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-30 19:03:47', 0, 2, 0, NULL, '2015-12-30 11:03:47');
INSERT INTO `multi_user` VALUES (79, 0, 0, '', '双福校园', '13436296015', '', 'b26718f8122dca1640d8b449d03e8599', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-30 19:45:56', 0, 2, 0, NULL, '2015-12-30 11:45:56');
INSERT INTO `multi_user` VALUES (85, 0, 0, '', 'ayhzygxy', '18439898701', '', 'ae1859adc1aae417e078ea40089e5b52', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-30 21:14:23', 0, 2, 0, NULL, '2015-12-30 13:14:23');
INSERT INTO `multi_user` VALUES (97, 0, 0, '', '许愿闺蜜阁', '15537440013', '', '07eb236f16da2f008a32507a92fa459e', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2015-12-31 11:53:31', 0, 2, 0, NULL, '2015-12-31 03:53:31');
INSERT INTO `multi_user` VALUES (110, 0, 0, '', 'weichenfuwu', '15638957375', '', '3aeed28128b5eee713adf4bbc866cda2', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-01-05 16:39:10', 0, 2, 0, NULL, '2016-01-05 08:39:10');
INSERT INTO `multi_user` VALUES (127, 0, 0, '', '王志强', '13290925152', '', '277ed5bead527677d35727748669f36f', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-01-08 10:23:10', 0, 2, 0, NULL, '2016-01-08 02:23:10');
INSERT INTO `multi_user` VALUES (153, 0, 0, '', '神采飞扬', '14747226148', '', '5da681a41525cd57318fef413c02d592', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-01-12 20:21:28', 0, 2, 0, NULL, '2016-01-12 12:21:28');
INSERT INTO `multi_user` VALUES (154, 0, 0, 'opi_TwMR_b1jzwrV4KaHTB4qGGTc', 'AI.何青.wemall', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB77wpDoIcmQtk5GHNpJD3bBaW6St2Af9yomaTyT7akxFRekmNHNTygorS8tboeqGhqUYvBDNcL5Q/0', 1, '', 'Louth', '', 'zh_CN', 1, 0, 91, 1, 0, '', '2016-03-02 22:15:53', 17, 0, 0, NULL, '2016-03-11 19:00:56');
INSERT INTO `multi_user` VALUES (155, 0, 0, 'opi_TwCMZAHNUqRU4bmWdP5fiwmI', '小蚂蚁联盟静静', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRafibHzNZQYPn82XE88aN35RKzDAuylJiciaLAd7YdDfgjs26ib4F5hqR8MdQlfmfUgIibEwn0QgP4vgz/0', 2, 'Xuchang', 'Henan', '', 'zh_CN', 1, 0.06, 238, 1, 0, '', '2016-03-03 08:43:39', 28, 0, 0, '', '2016-03-26 18:27:50');
INSERT INTO `multi_user` VALUES (156, 0, 0, 'opi_TwFMMyBPbPIVG3lyQOmLkLnc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 34, 1, 0, '', '2016-03-03 08:51:09', 3, 0, 0, NULL, '2016-03-13 22:43:33');
INSERT INTO `multi_user` VALUES (157, 0, 0, '', '小爱2016', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 09:34:56', 0, 2, 0, NULL, '2016-03-03 09:34:56');
INSERT INTO `multi_user` VALUES (158, 0, 0, 'opi_TwA5i5aLhwJVBLchRKIJya0g', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 10, 1, 0, '', '2016-03-03 09:59:47', 5, 0, 0, NULL, '2016-03-03 11:05:05');
INSERT INTO `multi_user` VALUES (159, 0, 0, 'opi_TwC9IcbzEgCWH1QmRwhQKZfQ', '邵凯华', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSib6sxHdRa6aAdbpr2iaK7k1m9fyPrEBh9ZRzuXuw3vgw0t4Np1gZfd0FF2fkPuibTkaDticib6w6Unic/0', 1, 'Xinyang', 'Henan', '', 'zh_CN', 1, 0, 246, 1, 0, '', '2016-03-03 10:00:51', 26, 0, 0, NULL, '2016-03-11 11:31:31');
INSERT INTO `multi_user` VALUES (160, 0, 0, '', 'heqing_ceshi', '15378708792', '', 'e89e679f1eb4b03f341f8409c4cd68cb', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 10:54:23', 0, 2, 0, NULL, '2016-03-03 10:54:23');
INSERT INTO `multi_user` VALUES (161, 0, 0, '', '20162016', '13233972757', '', '78b1b288987c5c0df8c802201f558b33', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 11:08:44', 0, 2, 0, NULL, '2016-03-03 11:08:44');
INSERT INTO `multi_user` VALUES (162, 0, 0, '', 'From小爱', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 11:31:18', 0, 2, 0, NULL, '2016-03-03 11:31:18');
INSERT INTO `multi_user` VALUES (163, 0, 0, '', '小爱2017', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 11:54:08', 0, 2, 0, NULL, '2016-03-03 11:54:08');
INSERT INTO `multi_user` VALUES (164, 0, 0, '', '小爱2018', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 11:57:34', 0, 2, 0, NULL, '2016-03-03 11:57:34');
INSERT INTO `multi_user` VALUES (165, 0, 0, '', 'rerere', '15238027761', '', 'b3283e65dce1bdfedb03da2211f5f2c9', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 11:59:25', 0, 2, 0, NULL, '2016-03-03 11:59:25');
INSERT INTO `multi_user` VALUES (166, 0, 0, '', '小爱2019', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 12:00:22', 0, 2, 0, NULL, '2016-03-03 12:00:22');
INSERT INTO `multi_user` VALUES (167, 0, 0, '', 'uiui', '15238027761', '', 'b3283e65dce1bdfedb03da2211f5f2c9', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 12:01:05', 0, 2, 0, NULL, '2016-03-03 12:01:05');
INSERT INTO `multi_user` VALUES (171, 0, 0, 'opi_TwAeKfwUtjZ3RNnbPD-DUcL8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 12:33:33', 68, 0, 0, NULL, '2016-03-09 10:11:08');
INSERT INTO `multi_user` VALUES (173, 0, 0, '', '木木', '15093531102', '', 'd892baabefda631f53a034d9abe4104c', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 1, '', '2016-03-03 14:35:36', 0, 2, 0, NULL, '2016-03-08 16:54:33');
INSERT INTO `multi_user` VALUES (174, 0, 0, '', 'KNsherry', '18864671581', '', '678c18448a2cfd0bba450e594244060b', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 16:24:30', 0, 2, 0, NULL, '2016-03-03 16:24:30');
INSERT INTO `multi_user` VALUES (175, 0, 0, '', 'liulidan', '13579511909', '', '7035f693e829be33abfe795db9b09099', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 17:40:50', 0, 2, 0, NULL, '2016-03-03 17:40:50');
INSERT INTO `multi_user` VALUES (176, 0, 0, '', 'hxq', '18697373103', '', 'b0c7c80d5cb457313ac5cd81f99f2f89', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 17:49:01', 0, 2, 0, NULL, '2016-03-03 17:49:01');
INSERT INTO `multi_user` VALUES (177, 0, 0, 'opi_TwEzG-db3S_NwTzgtZmVLKhw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:08:47', 0, 0, 0, NULL, '2016-03-03 18:08:47');
INSERT INTO `multi_user` VALUES (178, 0, 0, 'opi_TwMt8UjiumSVJH8biAv8aKh4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:11:31', 0, 0, 0, NULL, '2016-03-03 18:11:31');
INSERT INTO `multi_user` VALUES (179, 0, 0, 'opi_TwP1uiC1ammHj85xqbL6SkSA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:12:35', 0, 0, 0, NULL, '2016-03-03 18:12:35');
INSERT INTO `multi_user` VALUES (180, 0, 0, '', 'weizimebaby@qq.com', '13393860905', '', 'b0903c5423d09b7350e016d642c411ce', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:44:03', 0, 2, 0, NULL, '2016-03-03 18:44:03');
INSERT INTO `multi_user` VALUES (181, 0, 0, 'opi_TwHLW-aktP-92ELA7z5ya8hU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:44:44', 0, 0, 0, NULL, '2016-03-03 18:44:44');
INSERT INTO `multi_user` VALUES (182, 0, 0, '', 'yingda', '18011344058', '', '7b907294f8d08b19a5861e59fc6cf136', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 18:49:12', 0, 2, 0, NULL, '2016-03-03 18:49:12');
INSERT INTO `multi_user` VALUES (183, 0, 0, 'opi_TwDpWaSjupSrOJR_T1RuX-3Y', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 20:51:44', 0, 0, 0, NULL, '2016-03-03 20:51:44');
INSERT INTO `multi_user` VALUES (184, 0, 0, 'opi_TwDqrpKSHTxlqP3SdZu_izUs', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 20:55:55', 0, 0, 0, NULL, '2016-03-03 20:55:55');
INSERT INTO `multi_user` VALUES (185, 0, 0, '', '豆豆', '15732197800', '', '2dc2a2c742301563035d90ef842a54ce', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 22:09:06', 0, 2, 0, NULL, '2016-03-03 22:09:06');
INSERT INTO `multi_user` VALUES (186, 0, 0, 'opi_TwAPY2ApypSdhKt_EbFOlb6E', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-03 22:14:40', 0, 0, 0, NULL, '2016-03-03 22:14:40');
INSERT INTO `multi_user` VALUES (187, 0, 0, '', '小爱2020', '13295047102', '', 'dfdaed694386a4d60d3371a36aba0f54', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 08:29:24', 0, 2, 0, NULL, '2016-03-04 08:29:24');
INSERT INTO `multi_user` VALUES (188, 0, 0, '', 'qwert', '18860898338', '', '44973ddaae4cb8f17e73712d1dda561f', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 09:26:10', 0, 2, 0, NULL, '2016-03-04 09:26:10');
INSERT INTO `multi_user` VALUES (189, 0, 0, '', 'shengdabaishi', '18939527959', '', '04f2bd5e0ce529081e206da079ab7518', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 10:02:51', 0, 2, 0, NULL, '2016-03-04 10:02:51');
INSERT INTO `multi_user` VALUES (190, 0, 0, 'opi_TwJYYn2avQyVDHlnmF4vyHn0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 10:40:14', 0, 0, 0, NULL, '2016-03-04 10:40:14');
INSERT INTO `multi_user` VALUES (191, 0, 0, '', '809600393@qq.com', '18280535513', '', '2141f71b3658c8b8ab0ecb0c48db8386', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 10:53:55', 0, 2, 0, NULL, '2016-03-04 10:53:55');
INSERT INTO `multi_user` VALUES (192, 0, 0, '', '华立未来', '18086527416', '', '36350bd75ce94f2c469585588e9caf6c', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 11:45:06', 0, 2, 0, NULL, '2016-03-04 11:45:06');
INSERT INTO `multi_user` VALUES (193, 0, 0, 'opi_TwC57PP4R2cABhSP85xqNQJk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 12:13:07', 0, 0, 0, NULL, '2016-03-04 12:13:07');
INSERT INTO `multi_user` VALUES (194, 0, 0, 'opi_TwNmpnjI-IfNOWKKAprVs30Q', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 15:04:32', 0, 0, 0, NULL, '2016-03-04 15:04:32');
INSERT INTO `multi_user` VALUES (195, 0, 0, 'opi_TwIT36nT11yYbf79R0oxh5uA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-04 15:34:53', 0, 0, 0, NULL, '2016-03-04 15:34:53');
INSERT INTO `multi_user` VALUES (196, 0, 0, 'opi_TwL0L6FEDblOk8u4Fn1Qzhug', 'Sunshine', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IgpbiaHUZia7ILkMJOlIdHVUmITLdEulGNDOib6clpW2FVDgoeCpEsHBjmNppLvwq3NDGCdgwOMN1buDkxpofltxRD/0', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 19, 1, 0, '', '2016-03-04 18:35:50', 19, 0, 0, NULL, '2016-03-13 23:32:11');
INSERT INTO `multi_user` VALUES (197, 0, 0, '', '信姐', '18937120651', '', '4977cad0a7eedbd7083bb32f5ace4323', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 00:33:21', 0, 2, 0, NULL, '2016-03-05 00:33:21');
INSERT INTO `multi_user` VALUES (198, 0, 0, 'opi_TwH2jPPSRPEcHGcB0VSx5Jl0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 15:27:17', 0, 0, 0, NULL, '2016-03-05 15:27:17');
INSERT INTO `multi_user` VALUES (199, 0, 0, 'opi_TwG_i0DtBGMxzbj4pKcR5QeA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 16:17:01', 0, 0, 0, NULL, '2016-03-05 16:17:01');
INSERT INTO `multi_user` VALUES (200, 0, 0, 'opi_TwJmtffnSr7pEUeOAAfIWTqU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 16:17:24', 0, 0, 0, NULL, '2016-03-05 16:17:24');
INSERT INTO `multi_user` VALUES (201, 0, 0, 'opi_TwLOwieoFOq4cu-dB6TH889I', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 16:38:56', 0, 0, 0, NULL, '2016-03-05 16:38:56');
INSERT INTO `multi_user` VALUES (202, 0, 0, 'opi_TwP9Xu7YhaveiTvVG3BVC9w0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 16:45:05', 0, 0, 0, NULL, '2016-03-05 16:45:05');
INSERT INTO `multi_user` VALUES (203, 0, 0, 'opi_TwK_vAat8LkuS8f-TdAftlpY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 16:47:49', 0, 0, 0, NULL, '2016-03-05 16:47:49');
INSERT INTO `multi_user` VALUES (204, 0, 0, '', 'xinxiandai1993@sina.com', '18515393342', '', 'ad3dd2450c210fddcdc3826a053dd414', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:08:36', 0, 2, 0, NULL, '2016-03-05 17:08:36');
INSERT INTO `multi_user` VALUES (205, 0, 0, 'opi_TwF4wyqBvcgEBJIRF9MVvqF8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:08:43', 0, 0, 0, NULL, '2016-03-05 17:08:43');
INSERT INTO `multi_user` VALUES (206, 0, 0, '', 'sqxywbxh@sina.com', '18515393342', '', 'ada76bdb9ec9d52e02e64c1d30a6a4ea', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:10:09', 0, 2, 0, NULL, '2016-03-05 17:10:09');
INSERT INTO `multi_user` VALUES (207, 0, 0, 'opi_TwG1XeP3rGWeloT_fMRJmf7M', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:16:28', 1, 0, 0, NULL, '2016-03-06 13:30:03');
INSERT INTO `multi_user` VALUES (208, 0, 0, 'opi_TwBx4ORUqZGeMITtko1QRw4k', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:27:12', 0, 0, 0, NULL, '2016-03-05 17:27:12');
INSERT INTO `multi_user` VALUES (209, 0, 0, '', '97196636', '18653590623', '', '5aefd25e5546aa6e38c2736f800f4c15', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 17:30:09', 0, 2, 0, NULL, '2016-03-05 17:30:09');
INSERT INTO `multi_user` VALUES (210, 0, 0, 'opi_TwCV_Tr1Ftgpv4S73NbeHyGk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 18:38:40', 0, 0, 0, NULL, '2016-03-05 18:38:40');
INSERT INTO `multi_user` VALUES (211, 0, 0, '', 'xay0501@qq.com', '15279250570', '', 'b41a6e5937ad660373113e9a07eebe3a', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 20:02:24', 0, 2, 0, NULL, '2016-03-05 20:02:24');
INSERT INTO `multi_user` VALUES (212, 0, 0, 'opi_TwBDBXJW2puetebjA8WqyPtA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 20:21:05', 0, 0, 0, NULL, '2016-03-05 20:21:05');
INSERT INTO `multi_user` VALUES (213, 0, 0, '', '511951687@qq.com', '18604411819', '', 'db67126cbf99e95351882fead94e8f1c', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 20:55:35', 0, 2, 0, NULL, '2016-03-05 20:55:35');
INSERT INTO `multi_user` VALUES (214, 0, 0, 'opi_TwJK-0Aw-knaKb5UpgbNsNms', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 22:13:40', 0, 0, 0, NULL, '2016-03-05 22:13:40');
INSERT INTO `multi_user` VALUES (215, 0, 0, 'opi_TwJ4ZeZrZQlpKmZ8EsdgxAGE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-05 22:32:00', 0, 0, 0, NULL, '2016-03-05 22:32:00');
INSERT INTO `multi_user` VALUES (216, 0, 0, 'opi_TwJeesaan900nTjW-fj0zxU4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 08:12:27', 0, 0, 0, NULL, '2016-03-06 08:12:27');
INSERT INTO `multi_user` VALUES (217, 0, 0, 'opi_TwKb-iqM_YQXv0QnNqaQKM20', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 09:03:14', 6, 0, 0, NULL, '2016-03-06 09:35:49');
INSERT INTO `multi_user` VALUES (218, 0, 0, 'opi_TwOiHjTRy-wrJr91tE1KsHek', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 10:52:43', 0, 0, 0, NULL, '2016-03-06 10:52:43');
INSERT INTO `multi_user` VALUES (219, 0, 0, 'opi_TwM7VC0TaCjiOmry--qHSVYY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 11:21:16', 0, 0, 0, NULL, '2016-03-06 11:21:16');
INSERT INTO `multi_user` VALUES (220, 0, 0, 'opi_TwEaXGs31dsFwGsQpJmksNTw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 11:52:10', 0, 0, 0, NULL, '2016-03-06 11:52:10');
INSERT INTO `multi_user` VALUES (221, 0, 0, 'opi_TwC0PbIwdEsbLYYEDb_OMoos', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 12:36:56', 0, 0, 0, NULL, '2016-03-06 12:36:56');
INSERT INTO `multi_user` VALUES (222, 0, 0, '', '13486646393', '13486646393', '', '8aa319fdaaab835ca69927c73cbf875b', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 14:26:02', 0, 2, 0, NULL, '2016-03-06 14:26:02');
INSERT INTO `multi_user` VALUES (223, 0, 0, 'opi_TwN95iOVP_E6DjZTA0L3oJX0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 14:39:56', 0, 0, 0, NULL, '2016-03-06 14:39:56');
INSERT INTO `multi_user` VALUES (224, 0, 0, 'opi_TwGY8i9bw2WMW5QEaNd_DfoY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 17:10:08', 0, 0, 0, NULL, '2016-03-06 17:10:08');
INSERT INTO `multi_user` VALUES (225, 0, 0, 'o9eByw7dZg9_uAJEffHQh_4FK2kA', '深水炸弹', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/cOfMIO7Xkic5ick24JfuJF4NFTVwmsmGnQ247OuoWc7cf0phnvLicaPRKicjGAVvAbuv8k4vxic9Ipu3NUkjywznB0PQmjHS3Eepa/0', 1, '郑州', '河南', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-06 18:54:49', 0, 0, 0, NULL, '2016-03-06 19:06:29');
INSERT INTO `multi_user` VALUES (226, 0, 0, '', 'machao', '18295190220', '', 'f6f9ffb08b2574a1a864eebe4076b0f5', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 19:04:51', 0, 2, 0, NULL, '2016-03-06 19:04:51');
INSERT INTO `multi_user` VALUES (227, 0, 0, 'opi_TwOJnsOjGKDRpZmKIJk5O7Wc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 20:53:36', 0, 0, 0, NULL, '2016-03-06 20:53:36');
INSERT INTO `multi_user` VALUES (228, 0, 0, '', 'z785976928', '15606057006', '', '8fd37aa28010f0a8c25d11914ed0ec5f', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 21:32:35', 0, 2, 0, NULL, '2016-03-06 21:32:35');
INSERT INTO `multi_user` VALUES (229, 0, 0, 'opi_TwLbm0y3Px2PeSZeZwdGLSsU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 23:15:16', 0, 0, 0, NULL, '2016-03-06 23:15:16');
INSERT INTO `multi_user` VALUES (230, 0, 0, 'opi_TwPfHAJuOKokEZOygfKsdmiQ', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-06 23:49:48', 0, 0, 0, NULL, '2016-03-06 23:49:48');
INSERT INTO `multi_user` VALUES (231, 0, 0, '', '15836247999', '15836247999', '', 'fe1a10e4576c9db0b40e26b9ffa38ea5', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 08:37:11', 0, 2, 0, NULL, '2016-03-07 08:37:11');
INSERT INTO `multi_user` VALUES (232, 0, 0, 'opi_TwIXu6x7q2NniqY4HNY359Qc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 09:55:29', 0, 0, 0, NULL, '2016-03-07 09:55:29');
INSERT INTO `multi_user` VALUES (233, 0, 0, '', 'as1102asd', '18242521573', '', '229928bbd8d21d98b43d8bb0ef658d2e', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 11:12:57', 0, 2, 0, NULL, '2016-03-07 11:12:57');
INSERT INTO `multi_user` VALUES (234, 0, 0, 'opi_TwAAhhO1dif9PpKaC6VKST2w', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 11:20:37', 0, 0, 0, NULL, '2016-03-07 11:20:37');
INSERT INTO `multi_user` VALUES (235, 0, 0, '', '15868839196', '15868839196', '', '0636be2018472ab070f31575a9a956bf', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 11:21:30', 0, 2, 0, NULL, '2016-03-07 11:21:30');
INSERT INTO `multi_user` VALUES (236, 0, 0, '', 'hsxy1088', '13131878519', '', 'aafff810d3cac1b6d5d2f3e7836bf4e2', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 11:35:37', 0, 2, 0, NULL, '2016-03-07 11:35:37');
INSERT INTO `multi_user` VALUES (237, 0, 0, 'opi_TwPDen5aiqZYgDXDOK0hmcdY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 11:48:57', 0, 0, 0, NULL, '2016-03-07 11:48:57');
INSERT INTO `multi_user` VALUES (238, 0, 0, 'opi_TwKdC7jCN4y9oVOQ7YA-ILDI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 12:49:46', 0, 0, 0, NULL, '2016-03-07 12:49:46');
INSERT INTO `multi_user` VALUES (239, 0, 0, 'opi_TwNJTY6T1lJZBhNE9uQjwB88', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 13:26:20', 0, 0, 0, NULL, '2016-03-07 13:26:20');
INSERT INTO `multi_user` VALUES (240, 0, 0, 'opi_TwOdyHVVDSZiJwdmwmmfj24E', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 19:35:46', 0, 0, 0, NULL, '2016-03-07 19:35:46');
INSERT INTO `multi_user` VALUES (241, 0, 0, 'opi_TwJjfp7szktn8LChykuJ_Sp0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-07 20:03:27', 0, 0, 0, NULL, '2016-03-07 20:03:27');
INSERT INTO `multi_user` VALUES (242, 0, 0, 'opi_TwIUGqVaSm7rMf5xzvN_NcHg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 08:33:04', 0, 0, 0, NULL, '2016-03-08 08:33:04');
INSERT INTO `multi_user` VALUES (243, 0, 0, 'opi_TwL_-07cqDoAxpCH_jkgw8tM', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 09:17:56', 0, 0, 0, NULL, '2016-03-08 09:17:56');
INSERT INTO `multi_user` VALUES (244, 0, 0, 'opi_TwDNAsW9SYKgsnNbLohFELN4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 09:37:23', 0, 0, 0, NULL, '2016-03-08 09:37:23');
INSERT INTO `multi_user` VALUES (245, 0, 0, 'opi_TwLmsPOkpskpNFpxKUwTbrAs', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 10:29:58', 0, 0, 0, NULL, '2016-03-08 10:29:58');
INSERT INTO `multi_user` VALUES (246, 0, 0, 'opi_TwP3gwsrDwPNIou4k6IWxBTA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 10:57:57', 0, 0, 0, NULL, '2016-03-08 10:57:57');
INSERT INTO `multi_user` VALUES (247, 0, 0, 'opi_TwIZJdnLjyRdoP_ze1WojAk8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 11:03:36', 0, 0, 0, NULL, '2016-03-08 11:03:36');
INSERT INTO `multi_user` VALUES (248, 0, 0, 'opi_TwM4kkASQkypvm69ToazmnYk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 11:46:53', 0, 0, 0, NULL, '2016-03-08 11:46:53');
INSERT INTO `multi_user` VALUES (249, 0, 0, 'opi_TwEpjv5mJt8sgXfV_7x106Jg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 14:10:33', 0, 0, 0, NULL, '2016-03-08 14:10:33');
INSERT INTO `multi_user` VALUES (250, 0, 0, 'opi_TwMzC7kAfMipDXtzgZLsjnxA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 15:14:13', 0, 0, 0, NULL, '2016-03-08 15:14:13');
INSERT INTO `multi_user` VALUES (251, 0, 0, 'opi_TwA5-h8YfnHZ8YXj2U0zTfiE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 16:53:08', 0, 0, 0, NULL, '2016-03-08 16:53:08');
INSERT INTO `multi_user` VALUES (252, 0, 0, 'opi_TwDxyBe9XoAnVX3Vg0S5-NA4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 16:54:38', 0, 0, 0, NULL, '2016-03-08 16:54:38');
INSERT INTO `multi_user` VALUES (253, 0, 0, 'opi_TwEx8l-5xDlhSCS0PYA_NqZE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 17:26:18', 0, 0, 0, NULL, '2016-03-08 17:26:18');
INSERT INTO `multi_user` VALUES (254, 0, 0, 'opi_TwHB4xeCflybIvseYLF1NBBY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 17:40:08', 0, 0, 0, NULL, '2016-03-08 17:40:08');
INSERT INTO `multi_user` VALUES (255, 0, 0, '', 'gongshangxueyuan', '13297028007', '', '8e75acac24c9a57dbd00e6a91740e7b4', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 18:07:18', 0, 2, 0, NULL, '2016-03-08 18:07:18');
INSERT INTO `multi_user` VALUES (256, 0, 0, 'opi_TwBSMqQ-SRUz8XE9k4aYxcGQ', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 19:23:04', 0, 0, 0, NULL, '2016-03-08 19:23:04');
INSERT INTO `multi_user` VALUES (257, 0, 0, 'opi_TwOLGEbYn4loPwMR-qt4kUkg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 19:44:42', 0, 0, 0, NULL, '2016-03-08 19:44:42');
INSERT INTO `multi_user` VALUES (258, 0, 0, 'opi_TwFvp44g2eOV1xMhHnwei4jI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-08 20:00:08', 0, 0, 0, NULL, '2016-03-08 20:00:08');
INSERT INTO `multi_user` VALUES (259, 0, 0, 'opi_TwMcOP1M6MF_aQdYCa9hQX7Y', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 07:55:30', 0, 0, 0, NULL, '2016-03-09 07:55:30');
INSERT INTO `multi_user` VALUES (260, 0, 0, '', '郑州烧烤超市', '13525572192', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 11:14:42', 0, 2, 0, NULL, '2016-03-09 11:14:42');
INSERT INTO `multi_user` VALUES (261, 0, 0, 'opi_TwNx_PB1cbVccfuEvx9W4KpE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 11:48:09', 0, 0, 0, NULL, '2016-03-09 11:48:09');
INSERT INTO `multi_user` VALUES (262, 0, 0, 'opi_TwMbOI_ODcL3ZIuU-ZruD2Wk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 11:48:40', 0, 0, 0, NULL, '2016-03-09 11:48:40');
INSERT INTO `multi_user` VALUES (263, 0, 0, 'opi_TwOQJKrEndt5b5jOenHS_d_8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 11:57:59', 0, 0, 0, NULL, '2016-03-09 11:57:59');
INSERT INTO `multi_user` VALUES (264, 0, 0, 'opi_TwCcOOsgo4OZDPyM3VNFIPT8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 12:16:32', 0, 0, 0, NULL, '2016-03-09 12:16:32');
INSERT INTO `multi_user` VALUES (265, 0, 0, 'opi_TwKKp-1bdsY50tG1vK_OA_Uc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 12:38:22', 0, 0, 0, NULL, '2016-03-09 12:38:22');
INSERT INTO `multi_user` VALUES (266, 0, 0, 'opi_TwBuMICPr23ysfemtteWhRgY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 12:43:15', 0, 0, 0, NULL, '2016-03-09 12:43:15');
INSERT INTO `multi_user` VALUES (267, 0, 0, '', 'sswodeyouxiang@126.com', '18280535513', '', '9488011ea2942d53efafc3499b5c4bbd', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 1, '', '2016-03-09 13:09:12', 0, 2, 0, NULL, '2016-03-10 17:01:38');
INSERT INTO `multi_user` VALUES (268, 0, 0, 'opi_TwDZT9WWXjM8CBJB2LF52v5I', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 14:11:24', 0, 0, 0, NULL, '2016-03-09 14:11:24');
INSERT INTO `multi_user` VALUES (269, 0, 0, 'opi_TwMCvyThdmw3t2cFPzoeGR2I', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 14:29:03', 1, 0, 0, NULL, '2016-03-09 14:30:17');
INSERT INTO `multi_user` VALUES (270, 0, 0, 'opi_TwHOfF9hrcwHFZNmj_zCzXs0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 15:13:49', 0, 0, 0, NULL, '2016-03-09 15:13:49');
INSERT INTO `multi_user` VALUES (271, 0, 0, '', '15651799688', '15651799688', '', '61cfadbfe62ca94aa8ae52698fe556a7', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 17:57:08', 0, 2, 0, NULL, '2016-03-09 17:57:08');
INSERT INTO `multi_user` VALUES (272, 0, 0, 'opi_TwK-wi-pnPmHMVlw9z9kzVxA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 17:57:43', 1, 0, 0, NULL, '2016-03-12 20:11:23');
INSERT INTO `multi_user` VALUES (273, 0, 0, 'opi_TwDT4fkanLGoiQX965K9Ok3Q', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 17:57:51', 0, 0, 0, NULL, '2016-03-09 17:57:51');
INSERT INTO `multi_user` VALUES (274, 0, 0, 'opi_TwCuImSgZylMinZbaJVEd7gU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 18:08:02', 0, 0, 0, NULL, '2016-03-09 18:08:02');
INSERT INTO `multi_user` VALUES (275, 0, 0, 'ois_bwkTgiS4jhqEPZ8nMKrV2uQA', '邵凯华', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSib6sxHdRa6aAdbpr2iaK7k1m9fyPrEBh9ZRzuXuw3vgw0t4Np1gZfd0FF2fkPuibTkaDticib6w6Unic/0', 1, '信阳', '河南', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 18:33:03', 0, 0, 0, NULL, '2016-03-11 09:52:50');
INSERT INTO `multi_user` VALUES (276, 0, 0, 'ois_bwuwYIwnCuhLaUujhXHnTxMs', 'Sunshine', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IgpbiaHUZia7ILkMJOlIdHVUmITLdEulGNDOib6clpW2FVDgoeCpEsHBjmNppLvwq3NDGCdgwOMN1buDkxpofltxRD/0', 1, '巴中', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-09 18:56:37', 0, 0, 0, NULL, '2016-03-14 09:09:40');
INSERT INTO `multi_user` VALUES (277, 0, 0, 'opi_TwMEBN_gl5ETZ6GPPqUqrAI0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 18:56:51', 0, 0, 0, NULL, '2016-03-09 18:56:51');
INSERT INTO `multi_user` VALUES (278, 0, 0, 'ois_bwmg2Qx-d7bP-_rKrg8IrxmQ', 'AI.何青.wemall', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB77wpDoIcmQtk5GHNpJD3bBaW6St2Af9yomaTyT7akxFRekmNHNTygorS8tboeqGhqUYvBDNcL5Q/0', 1, '', '劳斯', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 19:06:11', 0, 0, 0, NULL, '2016-03-11 09:31:27');
INSERT INTO `multi_user` VALUES (279, 0, 0, 'opi_TwGxMRg_YUbB4O1ZNdTeSnyY', 'Acute袁飞????', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaLJgOfHMjGnDJAtpibQ2pUPoiaM7nq5yJiabiaTCUTr11xzeXOIPM5PiaX6ryT0mibicp3z48jWFHxxq9w7WR2zykaxNI/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 19:25:59', 0, 0, 0, NULL, '2016-03-10 20:16:19');
INSERT INTO `multi_user` VALUES (280, 0, 0, 'ois_bwnLT0XjKMp-tQS32BckR3zQ', '我是哇哦！我是邓佳????', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/jhhKw5fEYamsmZbEuZPdxnfp6GHScEvqTGWeZX5PsaHlmNXzVPnPdLWWia8bLAhwm5FOEYFyG2x2iczVcDwYcE7PEyNSWdd2Re/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 19:32:06', 0, 0, 0, NULL, '2016-03-09 19:32:06');
INSERT INTO `multi_user` VALUES (281, 0, 0, 'opi_TwNVvO-kZmvt2RxacmiaBjHU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 19:32:12', 0, 0, 0, NULL, '2016-03-09 19:32:12');
INSERT INTO `multi_user` VALUES (282, 0, 0, 'opi_TwLUUJTXFSi9adLUklk9Nv4M', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 19:41:28', 0, 0, 0, NULL, '2016-03-09 19:41:28');
INSERT INTO `multi_user` VALUES (283, 0, 0, 'opi_TwFxBds_QVqhzOTAIkVK8Alc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 19:44:50', 0, 0, 0, NULL, '2016-03-09 19:44:50');
INSERT INTO `multi_user` VALUES (284, 0, 0, '', '何青青', '15378708792', '', 'e89e679f1eb4b03f341f8409c4cd68cb', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 19:53:11', 0, 2, 0, NULL, '2016-03-09 19:53:11');
INSERT INTO `multi_user` VALUES (285, 0, 0, 'ois_bwu1UJBrlqT_HGIvfQQCA6aY', '小朋友゜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsdqhAOCIUyLXsDanpoyLG3icGgnhWHM5fX40JMqxicCYpqlPAxwvoRia4f6ZaIuJzPT6BFBHE1Q1VgC/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 19:53:17', 0, 0, 0, NULL, '2016-03-09 19:53:17');
INSERT INTO `multi_user` VALUES (286, 0, 0, 'ois_bwvzOXEH4nViHiw-Lc83v5aM', '为爱啟程，落英缤纷', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Igu9w7bqFBcWqcPzD4CIHGa7E6DzrPoY7cYgwRCJeMFKYcaseHFxWIibGPE7jK6nehZNibLSjibvicYklAibdoe0GZ9e/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:22:05', 0, 0, 0, NULL, '2016-03-09 20:22:05');
INSERT INTO `multi_user` VALUES (287, 0, 0, 'ois_bwv1XKa6zEPJQOgiOsDdYEoI', '#ty', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYvwMHHOg4bAgLpLvHsO91leBNz2ibh4BB5Tv7KUb8uTWQKIYL8uUibwuACxe92hDREzPvPXia9jaicYF/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:22:22', 0, 0, 0, NULL, '2016-03-09 20:22:22');
INSERT INTO `multi_user` VALUES (288, 0, 0, 'opi_TwBaXXrOcz30ZskmCcvGuK4U', '#ty', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYvwMHHOg4bAgLpLvHsO91leBNz2ibh4BB5Tv7KUb8uTWQKIYL8uUibwuACxe92hDREzPvPXia9jaicYF/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:22:27', 0, 0, 0, NULL, '2016-03-09 20:22:29');
INSERT INTO `multi_user` VALUES (289, 0, 0, 'opi_TwKnNANovVQxAd3Enc4V1hhM', '为爱啟程，落英缤纷', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Igu9w7bqFBcWqcPzD4CIHGa7E6DzrPoY7cYgwRCJeMFKYcaseHFxWIibGPE7jK6nehZNibLSjibvicYklAibdoe0GZ9e/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:22:52', 0, 0, 0, NULL, '2016-03-09 20:22:53');
INSERT INTO `multi_user` VALUES (290, 0, 0, 'opi_TwM7mx50uLnk0aBb1JB0Qbik', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 20:26:03', 0, 0, 0, NULL, '2016-03-09 20:26:03');
INSERT INTO `multi_user` VALUES (291, 0, 0, 'ois_bwjKxtGrdLrbsZqnCB0xo_j4', '烈酒灼喉_傅谨言', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadEmomBm3FrWRMk83HEpytn6LJlfu9hTLbpsgibJTL8POA72C4ZIfXrjpU8qHwtgjSBPlEpBRKAzn1vkXOUP4Uxm/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:32:27', 0, 0, 0, NULL, '2016-03-09 20:32:27');
INSERT INTO `multi_user` VALUES (292, 0, 0, 'opi_TwN79ElquBhWG7CAUAJ0crzc', '烈酒灼喉_傅谨言', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadEmomBm3FrWRMk83HEpytn6LJlfu9hTLbpsgibJTL8POA72C4ZIfXrjpU8qHwtgjSBPlEpBRKAzn1vkXOUP4Uxm/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:32:36', 0, 0, 0, NULL, '2016-03-09 20:32:37');
INSERT INTO `multi_user` VALUES (293, 0, 0, 'opi_TwBkuq9M6qwzayAkQlWMjkDk', '难事', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyepribsjLFJha5gVYh5zzlkXGUWeqIYeoFBRmC1wSck9BLm4OoWJPmJENkia2acWc1wBrkxbmM6Deic/0', 1, '', '', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-09 20:43:26', 1, 0, 0, NULL, '2016-03-10 11:13:16');
INSERT INTO `multi_user` VALUES (294, 0, 0, 'ois_bwjoPOadCPUTbRJl4wyHmHT8', '', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybicsWic943ibiczzdWbic27Nc0edCMJGwy1uk80PhMjvIFRgPr5cIoWZ6eEoedxXI8Esataf4RNvELaWFw/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:48:33', 0, 0, 0, NULL, '2016-03-09 20:48:33');
INSERT INTO `multi_user` VALUES (295, 0, 0, 'opi_TwEjUlMnDXXPq1cW2aiNgpro', '', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybicsWic943ibiczzdWbic27Nc0edCMJGwy1uk80PhMjvIFRgPr5cIoWZ6eEoedxXI8Esataf4RNvELaWFw/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:48:39', 0, 0, 0, NULL, '2016-03-09 20:48:40');
INSERT INTO `multi_user` VALUES (296, 0, 0, 'ois_bwkxOHhPAEpl4zFNCeBSLvz4', '加名', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7a1PHntWUgwWq34qQWOAILl1p0IaibP0shq4syWZ8qdQhJ3PhJiclhojx4C4tMqdjZJxbb5aWXHeHjw/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 20:59:34', 0, 0, 0, NULL, '2016-03-09 20:59:34');
INSERT INTO `multi_user` VALUES (297, 0, 0, 'opi_TwBprcswhITmuGF_pQCu75Uw', '加名', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7a1PHntWUgwWq34qQWOAILl1p0IaibP0shq4syWZ8qdQhJ3PhJiclhojx4C4tMqdjZJxbb5aWXHeHjw/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 3, 1, 0, '', '2016-03-09 20:59:44', 3, 0, 0, NULL, '2016-03-12 08:26:57');
INSERT INTO `multi_user` VALUES (298, 0, 0, 'ois_bwm4K27ZDWTCvxOhWAhaxO-0', '52267', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rQZeyM1jibKX1rIYBrNRYSGzHgXGqLiaiaZPbVy01JwzLHXibryiccLTD0qDWBdgthc0y0c94xWHBRVNYqzfdf0nFWCjssfJmweTA/0', 1, '乐山', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:02:24', 0, 0, 0, NULL, '2016-03-09 21:02:24');
INSERT INTO `multi_user` VALUES (299, 0, 0, 'opi_TwGDKNhwx2qN4ObctEISRcHg', '52267', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7aw7oJFaYMpvpicB4gxN0OkCJhRRJk4pINdBzmX68GDXNmt7lBzC3xRyskEyCviaLlSb3cvSXn3uc2X/0', 1, 'Leshan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:03:33', 0, 0, 0, NULL, '2016-03-11 12:13:34');
INSERT INTO `multi_user` VALUES (300, 0, 0, 'ois_bwvxVsKszNCN0sn5YYE4Au0c', '丶苦中作乐丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELL5uTSaWKF13tkcicHsavHkNe3LZJjlMNBzx3sJ0oUDxykA5qibfERCooDArBXAyxZuEGW5XYh6SzIGUQwCH7MWKQ6BVj0E7Cibk/0', 1, '资阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:11:45', 0, 0, 0, NULL, '2016-03-09 21:11:45');
INSERT INTO `multi_user` VALUES (301, 0, 0, 'opi_TwKTl15oQN-DzvMHdoIgZwxg', '丶苦中作乐丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELL5uTSaWKF13tkcicHsavHkNe3LZJjlMNBzx3sJ0oUDxykA5qibfERCooDArBXAyxZuEGW5XYh6SzIGUQwCH7MWKQ6BVj0E7Cibk/0', 1, 'Ziyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:11:54', 0, 0, 0, NULL, '2016-03-09 21:11:56');
INSERT INTO `multi_user` VALUES (302, 0, 0, 'opi_TwALIBxTzrQFHmg_BMxNP1uo', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 21:12:36', 0, 0, 0, NULL, '2016-03-09 21:12:36');
INSERT INTO `multi_user` VALUES (303, 0, 0, 'opi_TwFQDhH64IkmQZY3scPqWtCo', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 21:13:28', 0, 0, 0, NULL, '2016-03-09 21:13:28');
INSERT INTO `multi_user` VALUES (304, 0, 0, 'ois_bwtCMfLDyzkMZIxElfiQfgxQ', 'ZI', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClLVa6zqvSSjibP3icBtfTOebib9GGeNiaK2ShyLEOZbHGhSIceLw91jRrwtyXnibcFyNmzEc9dqReck2LFkWzvFqhDic/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:19:25', 0, 0, 0, NULL, '2016-03-09 21:19:25');
INSERT INTO `multi_user` VALUES (305, 0, 0, 'opi_TwDsnEfUN3ZYCPmNPsyLV3uY', 'ZI', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClLVa6zqvSSjibP3icBtfTOebib9GGeNiaK2ShyLEOZbHGhSIceLw91jRrwtyXnibcFyNmzEc9dqReck2LFkWzvFqhDic/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:19:31', 0, 0, 0, NULL, '2016-03-09 21:19:32');
INSERT INTO `multi_user` VALUES (306, 0, 0, 'opi_TwC-WaUWSGbWzo6qPfDVjS1M', '明天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafTdJe9Yax7g66MQsg9rYw6bR32ITWcZmTE4HRl8yEBSqJzIbblzGicmL5xHSlMj3vVLxoqKg2mOtiabKXwHjf0Vc/0', 2, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:19:38', 0, 0, 0, NULL, '2016-03-09 21:19:40');
INSERT INTO `multi_user` VALUES (307, 0, 0, 'opi_TwK9MbFXW-WXtizTTiKw-4ps', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 21:24:03', 0, 0, 0, NULL, '2016-03-09 21:24:03');
INSERT INTO `multi_user` VALUES (308, 0, 0, 'ois_bwu7cIibHdP15tM-vYS2zhxw', '年少轻狂的青春ζ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDEyhMJSicArcNH2eCYWPVnrH5BkhFEiaDxKqKb8juXToz9mIFhyDNPfm6iaLHZ9Bh6gvZvoD85nkDpQ/0', 1, '广元', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:27:26', 0, 0, 0, NULL, '2016-03-09 21:27:26');
INSERT INTO `multi_user` VALUES (309, 0, 0, 'ois_bwgcQk_w4M5_cTFIE8IQKdzg', 'an', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClEnsFpicaygxGuayKzoHbo1Kian5ibtsvpxpicDmjd6ibBe8vg5ztUMGurNcuf5bkKttFfsuTBTOrdibwNXYemdJeRXl/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:27:35', 0, 0, 0, NULL, '2016-03-09 21:27:35');
INSERT INTO `multi_user` VALUES (310, 0, 0, 'opi_TwM8uCpewvNO-Ws7ZO5VW5to', '年少轻狂的青春ζ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDEyhMJSicArcNH2eCYWPVnrH5BkhFEiaDxKqKb8juXToz9mIFhyDNPfm6iaLHZ9Bh6gvZvoD85nkDpQ/0', 1, 'Guangyuan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:27:37', 0, 0, 0, NULL, '2016-03-09 21:27:38');
INSERT INTO `multi_user` VALUES (311, 0, 0, 'opi_TwFMmNn3_wcBtHn0R8c6MIsE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 21:27:48', 0, 0, 0, NULL, '2016-03-09 21:27:48');
INSERT INTO `multi_user` VALUES (312, 0, 0, 'ois_bwsKZZnGXmB7RZ72z7r1ZMFk', 'ゑ を あ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqZj9XQo1HbZhrnlNib7xpoWWTd8ThkThok8BhZcnBkYx9vbO9lWLKEcRqva4MSZPKWMNhd6gIANoW/0', 2, '广安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:27:48', 0, 0, 0, NULL, '2016-03-09 21:27:48');
INSERT INTO `multi_user` VALUES (313, 0, 0, 'opi_TwI5D0lPw3r2RdP9pom_B_7E', 'ゑ を あ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqZj9XQo1HbZhrnlNib7xpoWWTd8ThkThok8BhZcnBkYx9vbO9lWLKEcRqva4MSZPKWMNhd6gIANoW/0', 2, 'Kwong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:28:13', 0, 0, 0, NULL, '2016-03-09 21:28:14');
INSERT INTO `multi_user` VALUES (314, 0, 0, 'ois_bwl-OnVhMFkULhKRVN8d1S5U', '斌彬', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYqugBZR2NyUjyicncQDAMYtWjpwNTH0YrLX4AtLbpv2PicrmkjHeCIMwYOibfeEQ9hAJ74vibbzTssXH/0', 1, '成都', '四川', '', 'en', 0, 0, 0, 1, 0, '', '2016-03-09 21:36:58', 0, 0, 0, NULL, '2016-03-09 22:27:38');
INSERT INTO `multi_user` VALUES (315, 0, 0, 'opi_TwJ6lFx505mewuqNsx8Fh6BA', '斌彬', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYqugBZR2NyUjyicncQDAMYtWjpwNTH0YrLX4AtLbpv2PicrmkjHeCIMwYOibfeEQ9hAJ74vibbzTssXH/0', 1, 'Chengdu', 'Sichuan', '', 'en', 1, 0, 0, 1, 0, '', '2016-03-09 21:37:05', 0, 0, 0, NULL, '2016-03-09 21:37:06');
INSERT INTO `multi_user` VALUES (316, 0, 0, 'ois_bwm5SJ_95RK8zyzwC-X1ecvU', '低调淡淡', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybictI6L7ETvsUILBUxSV34d6SC9WzPlsbVcIjM8PPLAcywPtW7eR6PUsM9cp4yrFYvyicOCFWHiaJMUA/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:41:15', 0, 0, 0, NULL, '2016-03-09 21:41:15');
INSERT INTO `multi_user` VALUES (317, 0, 0, 'opi_TwBcStfkqtfrOJsw_r6fnu34', '低调淡淡', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybictI6L7ETvsUILBUxSV34d6SC9WzPlsbVcIjM8PPLAcywPtW7eR6PUsM9cp4yrFYvyicOCFWHiaJMUA/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 21:41:21', 0, 0, 0, NULL, '2016-03-09 21:42:06');
INSERT INTO `multi_user` VALUES (318, 0, 0, 'opi_TwJ8dvJRMEkmli-Si-O3wkEM', '悦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkvWNI53aUh2tZzfH95XMH8tjvHS2quebeP0rm9IJDic6u9tSC8kFfcVmcBor8xNLibRZpPdSN8jnhlCLTPdaNGVw/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:03:55', 0, 0, 0, NULL, '2016-03-09 22:03:57');
INSERT INTO `multi_user` VALUES (319, 0, 0, 'ois_bwqaHJWUYGjF71NBG9mYTsbA', '杜玲', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Xiarh1nCpkzPbB9G2Y1ZSNpWFaia83K2Q3S1zEW0gsxwxH9ZkiaDOlK4aITq05qAUl03bibnibZzPM2xGN45vDJ5MibKY1ib45h3JGR/0', 2, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:11:16', 0, 0, 0, NULL, '2016-03-09 22:11:16');
INSERT INTO `multi_user` VALUES (320, 0, 0, 'opi_TwAd6pLEJ36VPdPPIU3jiunI', '杜玲', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Xiarh1nCpkzPbB9G2Y1ZSNpWFaia83K2Q3S1zEW0gsxwxH9ZkiaDOlK4aITq05qAUl03bibnibZzPM2xGN45vDJ5MibKY1ib45h3JGR/0', 2, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:11:23', 0, 0, 0, NULL, '2016-03-09 22:11:24');
INSERT INTO `multi_user` VALUES (321, 0, 0, 'ois_bwizXAVN9cLMgtGlbRf2JH0Q', '平昌倍耐力轮胎服务中心', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELDGf5ibUkwQfPfBbpbbz9DHcgdlb9OktvteiaX22k4EeXQPxpicia5fTBsyXoa2Tm0eg75uHVeE4ps3g/0', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:23:53', 0, 0, 0, NULL, '2016-03-09 22:23:53');
INSERT INTO `multi_user` VALUES (322, 0, 0, 'opi_TwPun_VwqShXjo_HvcFznivs', '平昌倍耐力轮胎服务中心', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELDGf5ibUkwQfPfBbpbbz9DHcgdlb9OktvteiaX22k4EeXQPxpicia5fTBsyXoa2Tm0eg75uHVeE4ps3g/0', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:23:57', 0, 0, 0, NULL, '2016-03-09 22:23:58');
INSERT INTO `multi_user` VALUES (323, 0, 0, 'ois_bwnPcmOnIoDP0KS_606cDCos', '暖暖。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsYbkMSZBK1ia9o2mkEJdQ2iaKHSqQyEh7sHgib83UVbDlCEVfbbUsFaae1iaschpXZJCRmKlUvreucue/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:25:09', 0, 0, 0, NULL, '2016-03-09 22:25:09');
INSERT INTO `multi_user` VALUES (324, 0, 0, 'opi_TwMSDSEJCWvBK6vTp4pb5ojU', 'Timeless', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybicn7A7ItsX68TbZHISwcCnwHV8B9ianf4aovJJXCor5scPSbLDaPSV0MgQZjo0kw7DfdKmF6HvBiaNyKclpkWDcyx/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 22:25:41', 0, 0, 0, NULL, '2016-03-09 22:25:42');
INSERT INTO `multi_user` VALUES (325, 0, 0, 'ois_bwov-O7IxenLmM4m6bmyfR6k', '猫扑扑不到的幸福', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/4A5zWWwbicKUtZOjnYMJ6cIRproCxfgs9PR0Xh404wicvpaiaMYrEwYTPFOibWqUicLzYwgzccibAiaibRDAhXcNZmvThII1Cwdl0wXs/0', 1, '绵阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:00:33', 0, 0, 0, NULL, '2016-03-09 23:00:33');
INSERT INTO `multi_user` VALUES (326, 0, 0, 'opi_TwMmXSF996YqLmcHvfMSIWeQ', '猫扑扑不到的幸福', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/4A5zWWwbicKUtZOjnYMJ6cIRproCxfgs9PR0Xh404wicvpaiaMYrEwYTPFOibWqUicLzYwgzccibAiaibRDAhXcNZmvThII1Cwdl0wXs/0', 1, 'Mianyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:00:53', 0, 0, 0, NULL, '2016-03-09 23:00:54');
INSERT INTO `multi_user` VALUES (327, 0, 0, 'opi_TwEcwQjunj9u4QRqDvSj8JUA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 23:09:06', 0, 0, 0, NULL, '2016-03-09 23:09:06');
INSERT INTO `multi_user` VALUES (328, 0, 0, 'ois_bwixMc7LHwXjyfor0sqHgems', '6636CX', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafAkVohA8cnyhL5ADBlVGwPtEEGplISaXRdUp4UKzH2fwEZy8OfYAFy5ibJuwFQWHRwjp3plvoGNHmMq9ibOmw52d/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:10:46', 0, 0, 0, NULL, '2016-03-09 23:10:46');
INSERT INTO `multi_user` VALUES (329, 0, 0, 'opi_TwCV9UNGaliqcLNKdBdmnBYw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 23:17:47', 0, 0, 0, NULL, '2016-03-09 23:17:47');
INSERT INTO `multi_user` VALUES (330, 0, 0, 'ois_bwirHq1y2COPnyQD03DLWSf4', '唥眼观迣鎅', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Clt3MciaLWJF7LGn1Jpia4r0stBfTsCIRoB3o3QXCKI5Zv1TMiczEX51ictJg8ugoXPoTMKhnAt8EQnzHpflag4Hmso/0', 1, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:20:22', 0, 0, 0, NULL, '2016-03-09 23:20:22');
INSERT INTO `multi_user` VALUES (331, 0, 0, 'opi_TwAEwjMaCyOPSs_l4iWMgicw', '唥眼观迣鎅', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Clt3MciaLWJF7LGn1Jpia4r0stBfTsCIRoB3o3QXCKI5Zv1TMiczEX51ictJg8ugoXPoTMKhnAt8EQnzHpflag4Hmso/0', 1, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:21:14', 0, 0, 0, NULL, '2016-03-09 23:21:15');
INSERT INTO `multi_user` VALUES (332, 0, 0, 'ois_bwkl1Oi0YIA4p3e-xqN4Sd68', '小白', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJxH0riacFo1tZImXdL0JkkTOHndWvJWMmzcSDw0502GIiaZTVWRucIy5XiaNvThu6dNiauYibVc4icXSSQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:21:26', 0, 0, 0, NULL, '2016-03-09 23:21:26');
INSERT INTO `multi_user` VALUES (333, 0, 0, 'ois_bwvI3Y-lVLwriVTSFI2Z6mI8', '阿順丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb96coNJ3QR0y5bgu4euwzW1uc7MZ0Mq3P8hyBljmAylia7zge1ZsHc3oIKJHWjnxqQaibtBaO5eHm4azxjkb2qw7n/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:21:39', 0, 0, 0, NULL, '2016-03-09 23:21:39');
INSERT INTO `multi_user` VALUES (334, 0, 0, 'opi_TwJQXY_Q7y1JpkeXDhTYk_aM', '小白', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJxH0riacFo1tZImXdL0JkkTOHndWvJWMmzcSDw0502GIiaZTVWRucIy5XiaNvThu6dNiauYibVc4icXSSQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:21:41', 0, 0, 0, NULL, '2016-03-09 23:21:42');
INSERT INTO `multi_user` VALUES (335, 0, 0, 'opi_TwEn22nhthV_uW0M3Medg98g', '阿順丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb96coNJ3QR0y5bgu4euwzW1uc7MZ0Mq3P8hyBljmAylia7zge1ZsHc3oIKJHWjnxqQaibtBaO5eHm4azxjkb2qw7n/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:22:04', 0, 0, 0, NULL, '2016-03-09 23:22:05');
INSERT INTO `multi_user` VALUES (336, 0, 0, 'opi_TwC3maqh43r0RmZDmmYR9HUk', '暖暖。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsYbkMSZBK1ia9o2mkEJdQ2iaKHSqQyEh7sHgib83UVbDlCEVfbbUsFaae1iaschpXZJCRmKlUvreucue/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:23:39', 0, 0, 0, NULL, '2016-03-09 23:23:40');
INSERT INTO `multi_user` VALUES (337, 0, 0, 'opi_TwBWFXsnHxLpRG-4gHj0tI_A', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-09 23:38:14', 0, 0, 0, NULL, '2016-03-09 23:38:14');
INSERT INTO `multi_user` VALUES (338, 0, 0, 'opi_TwA6Boyndw4xlEGlce5hIBNw', '6636CX', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafAkVohA8cnyhL5ADBlVGwPtEEGplISaXRdUp4UKzH2fwEZy8OfYAFy5ibJuwFQWHRwjp3plvoGNHmMq9ibOmw52d/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-09 23:52:09', 0, 0, 0, NULL, '2016-03-09 23:52:10');
INSERT INTO `multi_user` VALUES (339, 0, 0, 'opi_TwNDAsnejC6_NqlZ9SdBIKM4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 06:34:45', 0, 0, 0, NULL, '2016-03-10 06:34:45');
INSERT INTO `multi_user` VALUES (340, 0, 0, 'opi_TwE8gT3JBh7w0bs97Xtpu6nw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 07:09:01', 0, 0, 0, NULL, '2016-03-10 07:09:01');
INSERT INTO `multi_user` VALUES (341, 0, 0, 'opi_TwF168QAvEONfIDjHbWSRCMc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 07:27:33', 0, 0, 0, NULL, '2016-03-10 07:27:33');
INSERT INTO `multi_user` VALUES (342, 0, 0, 'ois_bwgFrISLNhe17c9hh9eRWYj0', '我好方`', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRSktuh2muQibg5JDTFejvI2MPULiaEKzibbGPeyBjLav7MvVQ52iaoibyke9sq34Bbdmgt897PSCrN8iaR/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 07:27:48', 0, 0, 0, NULL, '2016-03-10 07:27:48');
INSERT INTO `multi_user` VALUES (343, 0, 0, 'opi_TwBk5n7uIEc1F9WZG-fmggT4', '@脸皮质量好', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRSktuh2muQibg5JDTFejvI2MPULiaEKzibbGPeyBjLav7MvVQ52iaoibyke9sq34Bbdmgt897PSCrN8iaR/0', 1, '', '', '', 'zh_CN', 1, 0, 4, 1, 0, '', '2016-03-10 07:27:56', 1, 0, 0, NULL, '2016-03-13 20:12:46');
INSERT INTO `multi_user` VALUES (344, 0, 0, 'opi_TwM_yyxAG2kvZnWtn8DxPkdo', 'stare', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4ypfxME2TmwHnWWqroeJPrWV1VdEvwhgmLW5roicQtzWX1OcIDrMNCHJCb42tM9IInd85VgibmtLvMQQljicAkRiayfMlw1CSCRso/0', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 37, 1, 0, '', '2016-03-10 07:44:07', 4, 0, 0, NULL, '2016-03-12 09:47:56');
INSERT INTO `multi_user` VALUES (345, 0, 0, 'opi_TwNiA7yjb7ed7pj04VL8J3II', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 08:19:00', 0, 0, 0, NULL, '2016-03-10 08:19:00');
INSERT INTO `multi_user` VALUES (346, 0, 0, 'ois_bwlywPqfa1ikD3glARUbrYTU', '穿鞋子的猫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8PnD9OX4d3TsOXsp5owl9trEwibibI0jAM5zib5SFcnTLfaiaTIVrmAic00mGHau0TlfKMn4DPbEdo8agh/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 09:20:58', 0, 0, 0, NULL, '2016-03-10 09:20:58');
INSERT INTO `multi_user` VALUES (347, 0, 0, 'opi_TwIzlYqF6NSHyNl3aEKzxfwQ', '穿鞋子的猫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8PnD9OX4d3TsOXsp5owl9trEwibibI0jAM5zib5SFcnTLfaiaTIVrmAic00mGHau0TlfKMn4DPbEdo8agh/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 09:21:19', 0, 0, 0, NULL, '2016-03-10 09:21:21');
INSERT INTO `multi_user` VALUES (348, 0, 0, 'ois_bwlQQ9qvP8xIWrBaUMf0Lcxw', 'W', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadO80zcriaobv03jPztQBB3pBfyDVicnLlibKUwPWicq9FKicrxswK9tx3gZ5ibVVwLYvqkDic1q2Vv3XWkcF66z4ictRA9/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 09:24:32', 0, 0, 0, NULL, '2016-03-10 09:24:32');
INSERT INTO `multi_user` VALUES (349, 0, 0, 'opi_TwM_uTECV2NiA-94PjXQGQFU', 'W', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadO80zcriaobv03jPztQBB3pBfyDVicnLlibKUwPWicq9FKicrxswK9tx3gZ5ibVVwLYvqkDic1q2Vv3XWkcF66z4ictRA9/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 09:24:48', 0, 0, 0, NULL, '2016-03-10 09:24:50');
INSERT INTO `multi_user` VALUES (350, 0, 0, 'ois_bwssQOPROG2uF8g8H5ZtAflA', '似水流年～方', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iae7yYWjz46XTJeISHKicl1GxkxEPxWphxlnzp6bk33Gsj3uaicEkV20licuxYUGY9ryXeIlN8xzbV7vQibichKR4n4EH/0', 2, '', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 10:12:24', 0, 0, 0, NULL, '2016-03-10 10:12:24');
INSERT INTO `multi_user` VALUES (351, 0, 0, 'ois_bwmH911YFSGhaGFQppYWrznw', '刘巧', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmhtxpE9ltK36tKzEPdzjaibszgrNicEuJFQ1L8Er0Nu1g3PRc4Pjic4BiaCHfh680L5SZicTibXLmnqKHQg2kQ95s4YE/0', 2, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 10:14:46', 0, 0, 0, NULL, '2016-03-10 10:14:46');
INSERT INTO `multi_user` VALUES (352, 0, 0, 'opi_TwKDzpMdpfOzbcbWNzap3jPQ', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 10:25:45', 0, 0, 0, NULL, '2016-03-10 10:25:45');
INSERT INTO `multi_user` VALUES (353, 0, 0, 'ois_bwuH4a7jW3BcCWmrGgztgfVE', '星.星°', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafCMXPEia7JA57HEnPRbUgcf4Ha09QuAUEU7HE1Pg5eictapAHFunicOGekmfzdtibEUI3xOyx6HZ8jQfeevyIDQ68U/0', 1, '', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 10:31:27', 0, 0, 0, NULL, '2016-03-10 10:31:27');
INSERT INTO `multi_user` VALUES (354, 0, 0, 'opi_TwB0XkgA49y3VYR4yVvQpMks', '星.星°', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafCMXPEia7JA57HEnPRbUgcf4Ha09QuAUEU7HE1Pg5eictapAHFunicOGekmfzdtibEUI3xOyx6HZ8jQfeevyIDQ68U/0', 1, '', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 10:31:33', 0, 0, 0, NULL, '2016-03-10 10:31:35');
INSERT INTO `multi_user` VALUES (355, 0, 0, '', '千伶百俐', '15730313182', '', '6092d391a6ae36001e43f6857811fc20', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 10:58:46', 0, 2, 0, NULL, '2016-03-10 10:58:46');
INSERT INTO `multi_user` VALUES (356, 0, 0, 'ois_bwkNOPF9zhVZsK1THpGDKgjM', 'Mr.Z.', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ekbZRkfvgokIzAJhYNiaasgib0FiauH8Ht1am5GDCnEcbo0yAHu0nibSJJgZ71ia3bhTXmrViac8H3xNRMQNLUOYtJMlq0QFz1iaxpL/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 11:57:51', 0, 0, 0, NULL, '2016-03-10 11:57:51');
INSERT INTO `multi_user` VALUES (357, 0, 0, 'opi_TwM-B4zD8a1j4bkwneb4ym6Y', 'Mr.Z.', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ekbZRkfvgokIzAJhYNiaasgib0FiauH8Ht1am5GDCnEcbo0yAHu0nibSJJgZ71ia3bhTXmrViac8H3xNRMQNLUOYtJMlq0QFz1iaxpL/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-10 11:57:57', 1, 0, 0, NULL, '2016-03-11 19:10:06');
INSERT INTO `multi_user` VALUES (358, 0, 0, 'ois_bwtY5DJ089MC4ydYoJE8RL6s', '雨逝', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2aJc0jPLW8gWpz8xr78sgbXWW9OPfxSxVNEFiaP2u8ylaW73TgzlFWzjHYKCW60lJykDZ7t1djNbY/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:01:19', 0, 0, 0, NULL, '2016-03-10 12:01:19');
INSERT INTO `multi_user` VALUES (359, 0, 0, 'opi_TwBjnOfWarMWtbpG4CFEf5sU', '雨逝', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2aJc0jPLW8gWpz8xr78sgbXWW9OPfxSxVNEFiaP2u8ylaW73TgzlFWzjHYKCW60lJykDZ7t1djNbY/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:01:28', 0, 0, 0, NULL, '2016-03-10 12:01:29');
INSERT INTO `multi_user` VALUES (360, 0, 0, 'ois_bwnFgt0ykK5M6IRT83c3SeNA', '勿依勿念，一世心安。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaf3VcvSh7KEOqwofBib8rvzibkqnnCia7I9L8PIS2iaYPvlJ6FibT07H9eps7rjLYduxpHlu8AkklW1xVsGUzM1lqAOn/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:04:51', 0, 0, 0, NULL, '2016-03-10 12:04:51');
INSERT INTO `multi_user` VALUES (361, 0, 0, 'opi_TwI7ztLvyGrXwE1r4myP83bM', '勿依勿念，一世心安。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaf3VcvSh7KEOqwofBib8rvzibkqnnCia7I9L8PIS2iaYPvlJ6FibT07H9eps7rjLYduxpHlu8AkklW1xVsGUzM1lqAOn/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:04:56', 0, 0, 0, NULL, '2016-03-10 12:04:58');
INSERT INTO `multi_user` VALUES (362, 0, 0, 'ois_bwkzQiVMs1MTxys1fPnBqa4A', '流年缱绻、', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/AibTFU4oGHFicVa2rRDfZBDOSkX7ibzGhic4pCp2gOu4Mdib9JLBaHckdoibPaPHDeBDZL1kic5DiaKgPE8ialqAKiaQbEpaK6RbEr8icOJ/0', 1, '', '台北市', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:10:17', 0, 0, 0, NULL, '2016-03-10 12:10:17');
INSERT INTO `multi_user` VALUES (363, 0, 0, 'opi_TwP7eHiT2k-SOLIwXF_SLZfQ', '流年缱绻、', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/AibTFU4oGHFicVa2rRDfZBDOSkX7ibzGhic4pCp2gOu4Mdib9JLBaHckdoibPaPHDeBDZL1kic5DiaKgPE8ialqAKiaQbEpaK6RbEr8icOJ/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:10:24', 0, 0, 0, NULL, '2016-03-10 12:10:25');
INSERT INTO `multi_user` VALUES (364, 0, 0, 'ois_bwtECefLSaR7wOVOXUuPtIu4', 'WLT', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:55:45', 0, 0, 0, NULL, '2016-03-10 12:55:45');
INSERT INTO `multi_user` VALUES (365, 0, 0, 'opi_TwHqH1j_ei27uxkw35r6PZZU', 'WLT', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 12:55:52', 0, 0, 0, NULL, '2016-03-10 12:55:54');
INSERT INTO `multi_user` VALUES (366, 0, 0, 'ois_bwk3vuRepyaQGx2EGCf7K4JQ', '陈MonT', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELyZu6fw7NSOPIaKY2PxiaUQb8uJiacJKN951lo9hK26AWO98Oofwrp8wibud5D08cJlj8b8bfibbt9OA/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:16:12', 0, 0, 0, NULL, '2016-03-10 13:16:12');
INSERT INTO `multi_user` VALUES (367, 0, 0, 'ois_bwsZNvRooBD2YX0hLmQ24KfA', '彩鸿', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCynia8oZkZv2CdOlwibwLodo2CmHu7fMKtdzLss3OEDaJ8PxLzTIlenicL6rvORuzpOydE3lSt2StWw/0', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:16:14', 0, 0, 0, NULL, '2016-03-10 13:16:14');
INSERT INTO `multi_user` VALUES (368, 0, 0, 'opi_TwHFJuWqaqWHbL5BENNUS1X4', '陈MonT', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELyZu6fw7NSOPIaKY2PxiaUQb8uJiacJKN951lo9hK26AWO98Oofwrp8wibud5D08cJlj8b8bfibbt9OA/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:16:15', 0, 0, 0, NULL, '2016-03-10 13:16:16');
INSERT INTO `multi_user` VALUES (369, 0, 0, 'ois_bwiTIIvu0Z_Ywb6xfqY3SHVc', 'T.Q.S€', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7a0ELjiahGD3DWRLVeEDBeauPFQdklCbNnNYSfjhpahRmYhdN8ic62FicJ4qxwgdhvWfibSAwBicMRsibBl/0', 1, '乐山', '四川', '', 'zh_TW', 1, 0, 0, 1, 0, '', '2016-03-10 13:17:54', 0, 0, 0, NULL, '2016-03-10 13:17:54');
INSERT INTO `multi_user` VALUES (370, 0, 0, 'opi_TwFzru4K_pc3kiIKNrv-I2Fg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 13:18:02', 0, 0, 0, NULL, '2016-03-10 13:18:02');
INSERT INTO `multi_user` VALUES (371, 0, 0, 'ois_bwuyGPzW9DugzRN4Ep9g9tRo', '旧梦失辞', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRQUibTDCwuMbWMR6iauTrvoQHNgmnfsariaMGkIujiaAmwibBI7hnQRY35K2Zvgibzib5OJg9YIjwYgwribq/0', 2, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:18:23', 0, 0, 0, NULL, '2016-03-10 13:18:23');
INSERT INTO `multi_user` VALUES (372, 0, 0, 'ois_bwjsODld9VYPuRuTBWYBuYmY', '稻草小姐', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiatwMW7fEEVBzD76f59kI3TcnJtXZrPA7gSZGqahS05VMvbBJXqZpeic7rZicGFmOZxLPLMiammJHqfIYyEgmwI7xF/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:18:39', 0, 0, 0, NULL, '2016-03-10 13:18:39');
INSERT INTO `multi_user` VALUES (373, 0, 0, 'ois_bwqiTfsexAkTuTr8-FALkeME', '哈灵子', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaCQRFciacNgYclQ4iafyNt1nDlNCKWV8wZ4JLiaysiclkic7PjMb13KsM1C9hsvVh4TjqA1Ahrkc5LCFskNRhia99xlj/0', 2, '泸州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:19:42', 0, 0, 0, NULL, '2016-03-10 13:19:42');
INSERT INTO `multi_user` VALUES (374, 0, 0, 'opi_TwAw_iF3AbNcUQuujYf_1WMs', '哈灵子', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaCQRFciacNgYclQ4iafyNt1nDlNCKWV8wZ4JLiaysiclkic7PjMb13KsM1C9hsvVh4TjqA1Ahrkc5LCFskNRhia99xlj/0', 2, 'Luzhou', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:19:51', 0, 0, 0, NULL, '2016-03-10 13:19:53');
INSERT INTO `multi_user` VALUES (375, 0, 0, 'ois_bwru5aHxy-WCQaTxX1KFoDFY', '大木', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Cn31KicxtPFlRNTtgvlichVxhGA9wjhIfxCvgt2nJdibZhZlUdHiaFxwljm473855icFK3vYtaEtaczbKPDOtEibaOJZR/0', 2, '德阳', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-10 13:20:10', 0, 0, 0, NULL, '2016-03-10 13:22:41');
INSERT INTO `multi_user` VALUES (376, 0, 0, 'opi_TwHIkHJG8AvHy9z0_AXSj0JI', '大木', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Cn31KicxtPFlRNTtgvlichVxhGA9wjhIfxCvgt2nJdibZhZlUdHiaFxwljm473855icFK3vYtaEtaczbKPDOtEibaOJZR/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:20:14', 0, 0, 0, NULL, '2016-03-10 13:20:15');
INSERT INTO `multi_user` VALUES (377, 0, 0, 'ois_bwj_xUXCC1TJVY6REfN91WuQ', 'spiders man', '', '', '', NULL, '', 2, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:21:48', 0, 0, 0, NULL, '2016-03-10 13:21:48');
INSERT INTO `multi_user` VALUES (378, 0, 0, 'opi_TwGIfMI4iFWceo7qVzmw-sV8', '旧梦失辞', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRQUibTDCwuMbWMR6iauTrvoQHNgmnfsariaMGkIujiaAmwibBI7hnQRY35K2Zvgibzib5OJg9YIjwYgwribq/0', 2, 'Florida', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 13:23:32', 0, 0, 0, NULL, '2016-03-10 13:23:33');
INSERT INTO `multi_user` VALUES (379, 0, 0, 'opi_TwFH5ItPJ9UFpDsyo4EJCQJ8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 13:23:53', 0, 0, 0, NULL, '2016-03-10 13:23:53');
INSERT INTO `multi_user` VALUES (380, 0, 0, 'opi_TwKh8U5SGUE3nQIQcKdH5cZw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 13:27:57', 0, 0, 0, NULL, '2016-03-10 13:27:57');
INSERT INTO `multi_user` VALUES (381, 0, 0, 'opi_TwCWeX9phifTVPxHnQSku6cQ', 'Daisy智', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/uHTAvha8wDiaa3oxkGMpCfVEe0yIFypuounoqm24uibGeMSGENxt4XHMSEE7ia6SZF7zY9aXk2wZ87oAFgF1RlxJfaKoYt3Kxtl/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 14:00:29', 0, 0, 0, NULL, '2016-03-11 18:27:56');
INSERT INTO `multi_user` VALUES (382, 0, 0, 'ois_bwiDg7pi_3XY_GSVo2Wohi0M', 'AleXander  MCqueen', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/JDKmw2Lw4RsukE4JGl9WrWgo2x0sZKf2jZx3RnxOtsticbP6qrYg1O8NYVvKIfJNOlmsjcAdxlj9ROicNgPreOlIGByCKGW0zK/0', 2, '墨尔本', '维多利亚', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 14:01:14', 0, 0, 0, NULL, '2016-03-10 14:01:14');
INSERT INTO `multi_user` VALUES (383, 0, 0, 'opi_TwPpNcP3Cfhc6F-w_aRB3f94', 'AleXander  MCqueen', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/JDKmw2Lw4RsukE4JGl9WrWgo2x0sZKf2jZx3RnxOtsticbP6qrYg1O8NYVvKIfJNOlmsjcAdxlj9ROicNgPreOlIGByCKGW0zK/0', 2, '', '', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-10 14:01:21', 1, 0, 0, NULL, '2016-03-12 20:11:48');
INSERT INTO `multi_user` VALUES (384, 0, 0, 'ois_bwh7m0JvLWFKF9ApI6_IviRI', '房艺紫', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 14:24:58', 0, 0, 0, NULL, '2016-03-10 14:24:58');
INSERT INTO `multi_user` VALUES (385, 0, 0, 'opi_TwLFpM9ZXnwdErXGDofdeAGc', '房艺紫', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 14:25:03', 0, 0, 0, NULL, '2016-03-10 14:25:05');
INSERT INTO `multi_user` VALUES (386, 0, 0, 'opi_TwIEVd1GNJcCHqZEp2GVYbZ8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 14:40:20', 0, 0, 0, NULL, '2016-03-10 14:40:20');
INSERT INTO `multi_user` VALUES (387, 0, 0, '', '辽宁广惠智能装备', '13840199528', '', 'ea087c2baec8be44a8d10f258b407eb5', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 15:32:32', 0, 2, 0, NULL, '2016-03-10 15:32:32');
INSERT INTO `multi_user` VALUES (388, 0, 0, 'ois_bwlzzC9D5m_QVtjIIATt8AYo', 'B仔', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCoYy5hpjn9oNPc4GD6hPyzJJxcuDBwN6EibyQxSY7licarFbxqqpJZX5EddNkQk0rkJVn8wTlwZsqtic7BYeAVicVEjpBUrsQolnM/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 15:57:27', 0, 0, 0, NULL, '2016-03-10 15:57:27');
INSERT INTO `multi_user` VALUES (389, 0, 0, 'opi_TwOOr0JX3XcWq5eDG0leKvao', 'B仔', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCoYy5hpjn9oNPc4GD6hPyzJJxcuDBwN6EibyQxSY7licarFbxqqpJZX5EddNkQk0rkJVn8wTlwZsqtic7BYeAVicVEjpBUrsQolnM/0', 1, '', '', '', 'zh_CN', 1, 0, 3, 1, 0, '', '2016-03-10 15:57:33', 3, 0, 0, NULL, '2016-03-10 16:00:46');
INSERT INTO `multi_user` VALUES (390, 0, 0, 'opi_TwDkStUSCQD6cXlyWb77FS-g', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 16:20:23', 0, 0, 0, NULL, '2016-03-10 16:20:23');
INSERT INTO `multi_user` VALUES (391, 0, 0, 'ois_bwlNrj8ZZGxSV7M__pVkMnhQ', '━╋あ浮生若梦゜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA57diaocFWtWt0gBVo0n4RovALsEhVI8flF2H0SOep2DeFhBh9n04VGTlbXLiaicpa3Bfu869xXIBtw/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 16:29:00', 0, 0, 0, NULL, '2016-03-10 16:29:00');
INSERT INTO `multi_user` VALUES (392, 0, 0, 'opi_TwI3K4KWLCx1bQqbxh8TfE9U', '━╋あ浮生若梦゜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA57diaocFWtWt0gBVo0n4RovALsEhVI8flF2H0SOep2DeFhBh9n04VGTlbXLiaicpa3Bfu869xXIBtw/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 16:29:11', 0, 0, 0, NULL, '2016-03-10 16:29:12');
INSERT INTO `multi_user` VALUES (393, 0, 0, 'opi_TwMPwtcJq4bT9o9kDXS_swFo', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 16:38:25', 0, 0, 0, NULL, '2016-03-10 16:38:25');
INSERT INTO `multi_user` VALUES (394, 0, 0, 'ois_bwvq9vgK2-MI2EsrFNXQk4iw', '空白', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjyvRZ3UJYm7hr9sSnoKDb08IGicbNtIAR65Gc2fWn3ZLCGMNfwmjzgmO3Yc21ibFQCR8dOicw8r1A5vOCszpzIRc6/0', 2, '', '南蒂拉杜马蒂', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 16:52:46', 0, 0, 0, NULL, '2016-03-10 16:52:46');
INSERT INTO `multi_user` VALUES (395, 0, 0, 'ois_bwjBEGHuNUCw8o_KYSRIGlKw', '谌杨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb9XZ41jyQmoibmbZhF5PRT02v3WlLlJC4nI4K9aVR8SvZG9iafjuiccnW2JskV8iaRhEWGvic9cZXhPG5KATOibaMbO9M/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 16:57:15', 0, 0, 0, NULL, '2016-03-10 16:57:15');
INSERT INTO `multi_user` VALUES (396, 0, 0, 'opi_TwPH4UKCZeGjIvQCL8UYb4f0', '谌杨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb9XZ41jyQmoibmbZhF5PRT02v3WlLlJC4nI4K9aVR8SvZG9iafjuiccnW2JskV8iaRhEWGvic9cZXhPG5KATOibaMbO9M/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 16:57:23', 0, 0, 0, NULL, '2016-03-10 16:57:25');
INSERT INTO `multi_user` VALUES (397, 0, 0, 'opi_TwJChwq-cDT2lZ8dk8SkqZ_0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 17:15:01', 0, 0, 0, NULL, '2016-03-10 17:15:01');
INSERT INTO `multi_user` VALUES (398, 0, 0, 'ois_bwmFE_5XfyTzTmaieHq7b1Ao', '曾小贱，贱人曾', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadriaGkOAOQH25A9acYRqbEqYic1VvoAXJgxUBlZzd6MNk2GhqwdnCFKMYwUoib8xIvar32ia0k9l5vXENDfvbAic8Je/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 17:25:01', 0, 0, 0, NULL, '2016-03-10 17:25:01');
INSERT INTO `multi_user` VALUES (399, 0, 0, 'opi_TwPhUljfihGtu2ufWUjWU1uM', '曾小贱，贱人曾', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadriaGkOAOQH25A9acYRqbEqYic1VvoAXJgxUBlZzd6MNk2GhqwdnCFKMYwUoib8xIvar32ia0k9l5vXENDfvbAic8Je/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 17:25:08', 0, 0, 0, NULL, '2016-03-10 17:25:10');
INSERT INTO `multi_user` VALUES (400, 0, 0, 'opi_TwLUvXnn4KFDg0TKCydzFW0c', 'T.Q.S€', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7a0ELjiahGD3DWRLVeEDBeauPFQdklCbNnNYSfjhpahRmYhdN8ic62FicJ4qxwgdhvWfibSAwBicMRsibBl/0', 1, 'Leshan', 'Sichuan', '', 'zh_TW', 1, 0, 0, 1, 0, '', '2016-03-10 17:53:09', 0, 0, 0, NULL, '2016-03-10 17:53:11');
INSERT INTO `multi_user` VALUES (401, 0, 0, 'ois_bwgXJ8NaLi3dxtNZSdzzTF2c', '张涛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafdrwB2U7mATWsPo2C6XDqiat8uIWVZMwhwicmpLWibCRBc8hj247jbHicibeCvQXeLmCCkIsuFq7SR9qrJh7icFeu7eE/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:12:05', 0, 0, 0, NULL, '2016-03-10 18:12:05');
INSERT INTO `multi_user` VALUES (402, 0, 0, 'opi_TwD3B-ST5MIueF3xi6OTFFXU', '张涛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafdrwB2U7mATWsPo2C6XDqiat8uIWVZMwhwicmpLWibCRBc8hj247jbHicibeCvQXeLmCCkIsuFq7SR9qrJh7icFeu7eE/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-10 18:12:38', 1, 0, 0, NULL, '2016-03-10 20:09:19');
INSERT INTO `multi_user` VALUES (403, 0, 0, 'ois_bwvKZtqEt6b7R8Dq_y1fz2zM', 'christy', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOUwUQXYhHzJob9YNdL1EYq0k5du2AsCRqvEIZ5t9NalqI270UFl1LWTRibcaVH0yyR68hJbZmdNZv/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:17:13', 0, 0, 0, NULL, '2016-03-10 18:17:13');
INSERT INTO `multi_user` VALUES (404, 0, 0, 'ois_bwkghGHp3h9RbktiNzCN0P1Y', '姑娘', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA6x8Sf61gVO4O49TS8T2YRy6b77c41zRGRr0Po73egUMDUebDxibqfhwTqibIVcqicLWAEo7Jq9eYCQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:17:17', 0, 0, 0, NULL, '2016-03-10 18:17:17');
INSERT INTO `multi_user` VALUES (405, 0, 0, 'ois_bwk8bQ_l2LblRyIYB4jqMZoM', '木木', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaGSyYsGKuo5NxUe6L4jaZ76BX4jTteEQPtZg6T8ibdnPoy8LbJ7SMF9HOyGd7O87teQEZdlh1b8Lm4AVaJrzmrJ/0', 1, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:27:30', 0, 0, 0, NULL, '2016-03-10 18:27:30');
INSERT INTO `multi_user` VALUES (406, 0, 0, 'opi_TwHz81rGgT_SrFNEceHpB2Q4', '木木', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaGSyYsGKuo5NxUe6L4jaZ76BX4jTteEQPtZg6T8ibdnPoy8LbJ7SMF9HOyGd7O87teQEZdlh1b8Lm4AVaJrzmrJ/0', 1, 'Florida', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:27:35', 0, 0, 0, NULL, '2016-03-10 18:27:36');
INSERT INTO `multi_user` VALUES (407, 0, 0, 'opi_TwP0l8o-U39D6BJI7hMbUGB4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 18:43:30', 0, 0, 0, NULL, '2016-03-10 18:43:30');
INSERT INTO `multi_user` VALUES (408, 0, 0, 'ois_bwuYQnL6vZT6szmx2ghjoYgg', 'shenxia', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/JDKmw2Lw4RuSRnAQwCcv3xgfNagzduJIqXlBhhT03kHsF1JBkRDs7Ry99ibrhWIH3VhJUJ8LP1sB5LqBIUnxSseGlYdGHvLcg/0', 2, '', '基尔代尔', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 18:54:56', 0, 0, 0, NULL, '2016-03-10 18:54:56');
INSERT INTO `multi_user` VALUES (409, 0, 0, 'ois_bwpBaoskbPBmA1fJAvE5MBV8', '提拉米苏ペ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7axvpB1hib0duSI10uicoAtoicOW0o3e4YXlXts24JJYCnicPPrvOOicHHp7xwoYGNeicpw09H0InNBdNwc/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 19:03:36', 0, 0, 0, NULL, '2016-03-10 19:03:36');
INSERT INTO `multi_user` VALUES (410, 0, 0, 'opi_TwM4ap5cK0TWGLpzmmCyg53I', '提拉米苏ペ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7axvpB1hib0duSI10uicoAtoicOW0o3e4YXlXts24JJYCnicPPrvOOicHHp7xwoYGNeicpw09H0InNBdNwc/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 19:03:43', 0, 0, 0, NULL, '2016-03-10 19:03:45');
INSERT INTO `multi_user` VALUES (411, 0, 0, 'opi_TwISdO0UiDAQym55BZKEIB3M', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 19:26:34', 0, 0, 0, NULL, '2016-03-10 19:26:34');
INSERT INTO `multi_user` VALUES (412, 0, 0, 'opi_TwGOlDVYxQgkPXvCxeGcrFjE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 19:27:56', 0, 0, 0, NULL, '2016-03-10 19:27:56');
INSERT INTO `multi_user` VALUES (413, 0, 0, 'opi_TwNRBHNeyRZo2FIIHf287Udo', '姑娘', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA6x8Sf61gVO4O49TS8T2YRy6b77c41zRGRr0Po73egUMDUebDxibqfhwTqibIVcqicLWAEo7Jq9eYCQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 19:30:13', 0, 0, 0, NULL, '2016-03-10 19:30:14');
INSERT INTO `multi_user` VALUES (414, 0, 0, 'opi_TwPaoRgn1U6Bg_kC6OyrZhB0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 19:36:59', 0, 0, 0, NULL, '2016-03-10 19:36:59');
INSERT INTO `multi_user` VALUES (415, 0, 0, 'opi_TwLT5Ykxs2cGGV8yWlzsRzCM', '稻草小姐', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiatwMW7fEEVBzD76f59kI3TcnJtXZrPA7gSZGqahS05VMvbBJXqZpeic7rZicGFmOZxLPLMiammJHqfIYyEgmwI7xF/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 19:42:59', 0, 0, 0, NULL, '2016-03-10 19:43:00');
INSERT INTO `multi_user` VALUES (416, 0, 0, 'opi_TwOzTigKOVsgww91UvSPyIcc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 19:47:15', 2, 0, 0, NULL, '2016-03-11 14:35:37');
INSERT INTO `multi_user` VALUES (417, 0, 0, 'ois_bwvcskQMDtvaKbfvbEe-KOlQ', 'Amoヽ晴天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5MrQ0GXoNicyPLPJ3uNly63rtr6UiaakFzLibxNKggBsoIjWWianDuHdEbNg7No3xBpBscVHjdGuHVatAUoaJibpfZ66DrByic2OCCU/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 20:06:45', 0, 0, 0, NULL, '2016-03-10 20:06:45');
INSERT INTO `multi_user` VALUES (418, 0, 0, 'opi_TwJ_dz4h103WvCmj_zBN1lo8', 'Amoヽ晴天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5MrQ0GXoNicyPLPJ3uNly63rtr6UiaakFzLibxNKggBsoIjWWianDuHdEbNg7No3xBpBscVHjdGuHVatAUoaJibpfZ66DrByic2OCCU/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 20:07:14', 0, 0, 0, NULL, '2016-03-10 20:07:16');
INSERT INTO `multi_user` VALUES (419, 0, 0, 'opi_TwAVH--6-p4JiWCKvqcy2nRc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 20:13:26', 0, 0, 0, NULL, '2016-03-10 20:13:26');
INSERT INTO `multi_user` VALUES (420, 0, 0, 'ois_bwl4aDV41mfaW-vuE0x05rNU', '江韦波', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68Asar5CC9a515JBS7GX3p9AvawPvoTrGcJ7N2MAp1R5oD0YJZ6XpQ6Qf1qREicArXme6wyvyofwWckK/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 20:21:27', 0, 0, 0, NULL, '2016-03-10 20:21:27');
INSERT INTO `multi_user` VALUES (421, 0, 0, 'opi_TwOXDRatVpavSKJHBBByLbSc', '江韦波', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68Asar5CC9a515JBS7GX3p9AvawPvoTrGcJ7N2MAp1R5oD0YJZ6XpQ6Qf1qREicArXme6wyvyofwWckK/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 20:21:32', 0, 0, 0, NULL, '2016-03-10 20:21:33');
INSERT INTO `multi_user` VALUES (422, 0, 0, 'opi_TwJStMTEbpsnAAWXEuv-I4F4', '安琪拉的灰烬', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafpuym9wvibKCC1OhLfrrlCg7rORxoXjGgsY2ibITtCSXI6F31nV7hB1RWjkvXicbYzJCW4GSUl1HeUe7MWP1I8Ll8/0', 2, '', '', '', 'zh_CN', 1, 0, 2, 1, 0, '', '2016-03-10 20:24:47', 1, 0, 0, NULL, '2016-03-13 13:34:57');
INSERT INTO `multi_user` VALUES (423, 0, 0, 'ois_bwuesZN8ceAp-Za4wtcxQRow', '一次就好i', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1V64IV3AGVsweRcia6sMxn78CC9yoPCqquTQP3zEMm3dulct92r8nrxLVLkRwxCndMuCKuOKtbLwwIbwfU1SFheZ/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 20:34:59', 0, 0, 0, NULL, '2016-03-10 20:34:59');
INSERT INTO `multi_user` VALUES (424, 0, 0, 'opi_TwG4SuUMcdVbyK9VfYYRFLuU', '一次就好i', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1V64IV3AGVsweRcia6sMxn78CC9yoPCqquTQP3zEMm3dulct92r8nrxLVLkRwxCndMuCKuOKtbLwwIbwfU1SFheZ/0', 1, '', '', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-10 20:35:04', 1, 0, 0, NULL, '2016-03-10 20:38:14');
INSERT INTO `multi_user` VALUES (425, 0, 0, 'opi_TwJjao_dHMglSvhdU8Jk3CS0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 20:40:18', 0, 0, 0, NULL, '2016-03-10 20:40:18');
INSERT INTO `multi_user` VALUES (426, 0, 0, 'ois_bwpFHoxJ4Ay99NxFW5nB6kzY', '浮尘乱了思绪', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRUgniaVbiaa9AYtuGp1AQjPQkwuEibcmac5IzWiaV0AN0gPc0UlrJFrbnj0zJ14mUibYxfs5p06Kicsw9p/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:21:28', 0, 0, 0, NULL, '2016-03-10 21:21:28');
INSERT INTO `multi_user` VALUES (427, 0, 0, 'opi_TwCA6osKRvM2G3J1ydPWq5P4', '浮尘乱了思绪', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRUgniaVbiaa9AYtuGp1AQjPQkwuEibcmac5IzWiaV0AN0gPc0UlrJFrbnj0zJ14mUibYxfs5p06Kicsw9p/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:21:34', 0, 0, 0, NULL, '2016-03-10 21:21:35');
INSERT INTO `multi_user` VALUES (428, 0, 0, '', 'xndx123', '13114015171', '', 'eaafb62ee6bf79a542345dc3d41f1f50', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 21:28:18', 0, 2, 0, NULL, '2016-03-10 21:28:18');
INSERT INTO `multi_user` VALUES (429, 0, 0, 'ois_bwmHUWn2sAKSNYn_sgDRnCfg', '热心村民', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI7EPC8fNOhPoOjSvpHhviaNic7JEgRUFWCibLuF1HZviaJokicaiaIEbMePb7vYcByrL3PVVejWsVtxu4g/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:30:45', 0, 0, 0, NULL, '2016-03-10 21:30:45');
INSERT INTO `multi_user` VALUES (430, 0, 0, 'opi_TwMcNq-4VCx3k3HTNqrqMJFM', '热心村民', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI7EPC8fNOhPoOjSvpHhviaNic7JEgRUFWCibLuF1HZviaJokicaiaIEbMePb7vYcByrL3PVVejWsVtxu4g/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:30:49', 0, 0, 0, NULL, '2016-03-10 21:30:50');
INSERT INTO `multi_user` VALUES (431, 0, 0, 'ois_bwgoF4Pa9iYwNsSz_B7aj8aE', '税莲', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/rdLewqnPRqjZ0P6tEVibicGibUl7WOfvbnkPI0s5gRsARLryZQkBeI2EnuZYukMIc36xrHkicy4G2aRPcvwFpOAuy7UgSqKkhAyT/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:33:27', 0, 0, 0, NULL, '2016-03-10 21:33:27');
INSERT INTO `multi_user` VALUES (432, 0, 0, 'opi_TwCNk2NzlAiVWbnfJtdaI1yY', '税莲', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/rdLewqnPRqjZ0P6tEVibicGibUl7WOfvbnkPI0s5gRsARLryZQkBeI2EnuZYukMIc36xrHkicy4G2aRPcvwFpOAuy7UgSqKkhAyT/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 7, 1, 0, '', '2016-03-10 21:33:32', 3, 0, 0, NULL, '2016-03-11 21:26:28');
INSERT INTO `multi_user` VALUES (433, 0, 0, 'opi_TwGOVhZWgN6YoNfqG9KB5GdA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 21:33:41', 0, 0, 0, NULL, '2016-03-10 21:33:41');
INSERT INTO `multi_user` VALUES (434, 0, 0, 'opi_TwO39rHL8RWYNzBKOC4lja7U', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 21:44:52', 0, 0, 0, NULL, '2016-03-10 21:44:52');
INSERT INTO `multi_user` VALUES (435, 0, 0, 'ois_bwmo-7PCNOkWGaVdIsjQnITw', '不忘初心', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/pksIKbiaiay0DXtEfbmRQLF31vwBDzk1btHcxMLwCVxueQOBOxxibzGJev2PkXLM83CUha3tANrZptmbQDdnuwy4M2kunlWpPBS/0', 2, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:49:56', 0, 0, 0, NULL, '2016-03-10 21:49:56');
INSERT INTO `multi_user` VALUES (436, 0, 0, 'ois_bwvAe9Y7mes9ell3j1QOsf5E', '0', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRQ2ItAT2yCKG1TgAYfSavbFArB5m2NIhrGkU6lYxdBls65KuwQosyhgvEAzXNp4fO5O7DPwibmWDt/0', 2, '雅安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:55:15', 0, 0, 0, NULL, '2016-03-10 21:55:15');
INSERT INTO `multi_user` VALUES (437, 0, 0, 'opi_TwGLfQNH-BbcyM8T3EsmMD6o', '0', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRQ2ItAT2yCKG1TgAYfSavbFArB5m2NIhrGkU6lYxdBls65KuwQosyhgvEAzXNp4fO5O7DPwibmWDt/0', 2, 'Yaan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:55:18', 0, 0, 0, NULL, '2016-03-10 21:55:19');
INSERT INTO `multi_user` VALUES (438, 0, 0, 'ois_bwo2ETPJzTStfF7lzsB6M0As', '荒城', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyYzfibTIiaZxP9B1lzaSZBkqypw7CYJ8W9yrKg0k1jDOdkZOQrziahcCmPiaUgSDiaatw95SVD3iaXibSD1/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:59:22', 0, 0, 0, NULL, '2016-03-10 21:59:22');
INSERT INTO `multi_user` VALUES (439, 0, 0, 'opi_TwGAMTnxy6J9BZZ9Ew8RGaj0', '荒城', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyYzfibTIiaZxP9B1lzaSZBkqypw7CYJ8W9yrKg0k1jDOdkZOQrziahcCmPiaUgSDiaatw95SVD3iaXibSD1/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 21:59:28', 0, 0, 0, NULL, '2016-03-10 21:59:29');
INSERT INTO `multi_user` VALUES (440, 0, 0, 'ois_bwiEcJn-G7GfqSt0ZRILtRtU', '做自己嘛。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaQcvcYDic10eMZ3pwghqcQ6tZlFVT5iaM372tqa4naASwk97Fqbb0nvLUpwplib82Xm9IRYiaK8GQHlVonI7DF30lq/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:10:09', 0, 0, 0, NULL, '2016-03-10 22:10:09');
INSERT INTO `multi_user` VALUES (441, 0, 0, 'opi_TwEgU9k4LUtCgxW9P5e9dcRY', '做自己嘛。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaQcvcYDic10eMZ3pwghqcQ6tZlFVT5iaM372tqa4naASwk97Fqbb0nvLUpwplib82Xm9IRYiaK8GQHlVonI7DF30lq/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 1, 1, 0, '', '2016-03-10 22:10:13', 1, 0, 0, NULL, '2016-03-10 22:12:00');
INSERT INTO `multi_user` VALUES (442, 0, 0, 'ois_bwruRmHdavSEMmJkevkGd0t8', '蟓薷毅蓦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8Pqflama0udicxwRPzXU4M6UZMOa7pmFMjlKld9KF0xHZNXiavHHbOueU2dH8v9Nsx8AiaDOkOfmrwAE/0', 1, '乐山', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:13:09', 0, 0, 0, NULL, '2016-03-10 22:13:09');
INSERT INTO `multi_user` VALUES (443, 0, 0, 'opi_TwCz4xJd8hiMPqHU-54gX7NE', '蟓薷毅蓦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8Pqflama0udicxwRPzXU4M6UZMOa7pmFMjlKld9KF0xHZNXiavHHbOueU2dH8v9Nsx8AiaDOkOfmrwAE/0', 1, 'Leshan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:13:15', 0, 0, 0, NULL, '2016-03-10 22:13:17');
INSERT INTO `multi_user` VALUES (444, 0, 0, 'ois_bwq1mtOLNbkjeteVgWyVqXfQ', 'Duan', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeDC3jhjhPQNqztC0xmvoZQG0jfoYf332EZYJURUUIBH3tLxcdlFniaAnXJhpg3VcOJBQVpXvOAFQ20JRjRTfXqC/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:13:31', 0, 0, 0, NULL, '2016-03-10 22:13:31');
INSERT INTO `multi_user` VALUES (445, 0, 0, 'ois_bwgLcquq1HVv9tvuSSThZvag', '艾', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaduWpVBRuUib2z3kykfbxxDfn46KU57TQica5IogKexDXuU9kyk5xicmPAI7TxvicsDOdXIGErSOsxnRANicNfq5icdnf/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:20:22', 0, 0, 0, NULL, '2016-03-10 22:20:22');
INSERT INTO `multi_user` VALUES (446, 0, 0, 'opi_TwOQ6Ma0rF_P-HAw7kWWJwO0', '艾', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaduWpVBRuUib2z3kykfbxxDfn46KU57TQica5IogKexDXuU9kyk5xicmPAI7TxvicsDOdXIGErSOsxnRANicNfq5icdnf/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:20:27', 0, 0, 0, NULL, '2016-03-10 22:20:28');
INSERT INTO `multi_user` VALUES (447, 0, 0, '', 'fanfanlaila', '15932590765', '', '51e833e5602f4476959737f8623c0c1a', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 22:31:08', 0, 2, 0, NULL, '2016-03-10 22:31:08');
INSERT INTO `multi_user` VALUES (448, 0, 0, 'ois_bwoTaotqxvFJSwH5ROciE660', 'Undercover', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsYPiahO4NOcUuu0vt8WYWftbKuzZxXHCTLdtLeGW0icqTXsNSCk1UuRA6TFv8662zlk7qCCxg6x82s/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:39:40', 0, 0, 0, NULL, '2016-03-10 22:39:40');
INSERT INTO `multi_user` VALUES (449, 0, 0, 'opi_TwLcZEd8hti3_5SV4uoYmAOk', 'Undercover', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsYPiahO4NOcUuu0vt8WYWftbKuzZxXHCTLdtLeGW0icqTXsNSCk1UuRA6TFv8662zlk7qCCxg6x82s/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:39:46', 0, 0, 0, NULL, '2016-03-10 22:39:47');
INSERT INTO `multi_user` VALUES (450, 0, 0, 'ois_bwmTjkB7hZOnsgLxEy0d6InQ', '仅此而已', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIdZZGrV9NpegWGfgoX5ibicodLX077F5aGv4GoEP2klKzjVOSziaXoZmI3Xyia4TY4C5r3VKFiaHstibzQ/0', 1, '', '米斯', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:39:48', 0, 0, 0, NULL, '2016-03-10 22:39:48');
INSERT INTO `multi_user` VALUES (451, 0, 0, 'opi_TwIoBGAeauV0GgVDNOf2_i30', '仅此而已', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIdZZGrV9NpegWGfgoX5ibicodLX077F5aGv4GoEP2klKzjVOSziaXoZmI3Xyia4TY4C5r3VKFiaHstibzQ/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:39:52', 0, 0, 0, NULL, '2016-03-10 22:39:53');
INSERT INTO `multi_user` VALUES (452, 0, 0, 'opi_TwNVJOtrx7I-LHCuUIYWHvhk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 22:41:17', 0, 0, 0, NULL, '2016-03-10 22:41:17');
INSERT INTO `multi_user` VALUES (453, 0, 0, 'ois_bwhSwa0wk3-nvfg5XIJThazg', '马姗', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhtXuxf7TVzXCNeVR03fr0rD5MfkO9ShIo9yyI7kXibjicRoBxS8b3PrjfyyMjltpwbmW1cYWs0bLMP0ib5QgjBFre/0', 2, '', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-10 22:42:14', 0, 0, 0, NULL, '2016-03-10 22:44:08');
INSERT INTO `multi_user` VALUES (454, 0, 0, 'opi_TwANbGvv5j-1YIob1FNY_WYw', '马姗', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhtXuxf7TVzXCNeVR03fr0rD5MfkO9ShIo9yyI7kXibjicRoBxS8b3PrjfyyMjltpwbmW1cYWs0bLMP0ib5QgjBFre/0', 2, '', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:42:33', 0, 0, 0, NULL, '2016-03-10 22:42:34');
INSERT INTO `multi_user` VALUES (455, 0, 0, 'opi_TwDGRBdrZeNjmmmHeq6660OY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 22:44:51', 0, 0, 0, NULL, '2016-03-10 22:44:51');
INSERT INTO `multi_user` VALUES (456, 0, 0, 'ois_bwkGMnlsXIH4781sjdspAVT8', '八个肾的男人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjsiccGx4twLTp5o4H6cOC5emNQAzxVickw8aJTR9QrQBqOswwuF4ZwgFUdOT5tvdxB5odjXtW5yiahhSyYMCoup3e/0', 1, '广元', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-10 22:47:32', 0, 0, 0, NULL, '2016-03-10 22:47:32');
INSERT INTO `multi_user` VALUES (457, 0, 0, 'opi_TwCkmVV_0U6ZoqpxSXT4edHg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-10 23:04:49', 0, 0, 0, NULL, '2016-03-10 23:04:49');
INSERT INTO `multi_user` VALUES (458, 0, 0, '', '13055628229', '13055628229', '', '7f2f0332aaa06eeea119a681632f4c41', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 00:18:06', 0, 2, 0, NULL, '2016-03-11 00:18:06');
INSERT INTO `multi_user` VALUES (459, 0, 0, 'opi_TwJnwCFc8QqwvpHCauDUWypw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 02:03:10', 0, 0, 0, NULL, '2016-03-11 02:03:10');
INSERT INTO `multi_user` VALUES (460, 0, 0, 'ois_bwsJGRPDpGHDTV2MjNaFDHYI', '刘', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicObLmq3CIz6rY2zqwU6GSoT2Pl2fltLsgm0phhicJCPMhwehTM0x7ibbK6sdial5S3nyuwUsY5FyUR2L/0', 1, '福州', '福建', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 07:33:32', 0, 0, 0, NULL, '2016-03-11 07:33:32');
INSERT INTO `multi_user` VALUES (461, 0, 0, 'ois_bwmfAzMrWhVnVhO7hWvjua-A', '谢林易', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRydQER02Qz0lkDkqy8lVZTT13IFIqe1Z4hkzgnUwTNuSM1FpVciccIlMGoBNMz3W03Uic22UJCOGJR9/0', 0, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 07:43:02', 0, 0, 0, NULL, '2016-03-11 07:43:02');
INSERT INTO `multi_user` VALUES (462, 0, 0, 'ois_bwnDdCNaCnZmIpp2QFWTVDmA', '他', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRYXMbaE1320zTxS3kaOuIm83kLys3LrJfQ8lRoqad1u7A1ZQRicvs6vkmwVTEgflK03mkUpZiaqNZz/0', 2, '', '巴黎', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 08:39:57', 0, 0, 0, NULL, '2016-03-11 08:39:57');
INSERT INTO `multi_user` VALUES (463, 0, 0, 'ois_bwoJyUM7mm5x9H73nrTgQsRs', '6x', '', '', '', NULL, '', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 08:53:54', 0, 0, 0, NULL, '2016-03-11 08:53:54');
INSERT INTO `multi_user` VALUES (464, 0, 0, 'ois_bwvrQaH4iARKeHqvgpJYjx3c', '゛Sentimental丶释怀', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWKSxZVibCMyDHuhH2Tnwn1KicnguZiaNe8108icUUt6RULHwoAEWVS5rRQJmNr2fBSsibcshbxzRiaO3IAUjFk9BhCic/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 09:02:58', 0, 0, 0, NULL, '2016-03-11 09:02:58');
INSERT INTO `multi_user` VALUES (465, 0, 0, 'ois_bwv0i0n49RLUi4TuxBxK0ZMg', 'trouble', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRfWr9RYiaeAMc6RnicLUNj6vNAcKeBrBdiapSoMpoKpdic6S2I50jlFh7aIbu6icUZFzEGgph0now1oNc/0', 1, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 09:03:07', 0, 0, 0, NULL, '2016-03-11 09:03:07');
INSERT INTO `multi_user` VALUES (466, 0, 0, 'ois_bwvZOc58Dk-CRpUDjyxxFEWY', '__Yf', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iia4AD7nOfvficOwG1e4RprypXMfFanh6thFtByfk5wQtRmvCInDnFxlEYorwVm5VSw5kGjShvvHIcnWD63TtFMZc/0', 2, '', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-11 09:20:31', 0, 0, 0, NULL, '2016-03-11 09:21:14');
INSERT INTO `multi_user` VALUES (467, 0, 0, 'ois_bwqInHNPNCugj_JzK4cNhIdg', '蕊阿碧', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA8HG0Fta9Z1GB9U76tDYOLQCepiaGeNeaoASrESyo85jyMel7vZnn0k3xGNZZe7OhoKNiaviachJgQwITGYc2LsWtOXeFj1BoAKE/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 10:25:48', 0, 0, 0, NULL, '2016-03-11 16:08:46');
INSERT INTO `multi_user` VALUES (468, 0, 0, 'ois_bwgpP0pUuX6cEfbU0yAYbbjo', '@', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRfJXWCW9jzicOEuwAbdRnBaOZBEfzRgI52beWZKjn9FSdqVvotVXboKeiaOQHeGonAnicnSsrtCGyAG/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 10:35:28', 0, 0, 0, NULL, '2016-03-11 10:35:28');
INSERT INTO `multi_user` VALUES (469, 0, 0, 'opi_TwLthQ6DwwlxetkqxL-GZQLg', '@', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRfJXWCW9jzicOEuwAbdRnBaOZBEfzRgI52beWZKjn9FSdqVvotVXboKeiaOQHeGonAnicnSsrtCGyAG/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 2, 1, 0, '', '2016-03-11 10:35:33', 2, 0, 0, NULL, '2016-03-11 11:09:23');
INSERT INTO `multi_user` VALUES (470, 0, 0, 'opi_TwJ1X9QHxYF3fo8wjHqZpBhI', '蕊阿碧', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA8HG0Fta9Z1GB9U76tDYOLQCepiaGeNeaoASrESyo85jyMel7vZnn0k3xGNZZe7OhoKNiaviachJgQwITGYc2LsWtOXeFj1BoAKE/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 10:38:18', 0, 0, 0, NULL, '2016-03-11 10:38:19');
INSERT INTO `multi_user` VALUES (471, 0, 0, 'opi_TwF9vmVHn5Xtrda764swpaVI', '他', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRYXMbaE1320zTxS3kaOuIm83kLys3LrJfQ8lRoqad1u7A1ZQRicvs6vkmwVTEgflK03mkUpZiaqNZz/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 10:40:47', 0, 0, 0, NULL, '2016-03-11 10:40:47');
INSERT INTO `multi_user` VALUES (472, 0, 0, 'opi_TwBjFDasSTfpR_yc6GXaN7LM', '゛Sentimental丶释怀', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWKSxZVibCMyDHuhH2Tnwn1KicnguZiaNe8108icUUt6RULHwoAEWVS5rRQJmNr2fBSsibcshbxzRiaO3IAUjFk9BhCic/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 10, 1, 0, '', '2016-03-11 10:42:45', 2, 0, 0, NULL, '2016-03-13 19:39:07');
INSERT INTO `multi_user` VALUES (473, 0, 0, 'opi_TwPT_QI599_CL5voFY1DgZUI', 'trouble', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRfWr9RYiaeAMc6RnicLUNj6vNAcKeBrBdiapSoMpoKpdic6S2I50jlFh7aIbu6icUZFzEGgph0now1oNc/0', 1, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 11:27:52', 0, 0, 0, NULL, '2016-03-11 11:27:53');
INSERT INTO `multi_user` VALUES (474, 0, 0, 'opi_TwKiQN2E5rq9_S7kAiYW7KFE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 11:52:25', 0, 0, 0, NULL, '2016-03-11 11:52:25');
INSERT INTO `multi_user` VALUES (475, 0, 0, 'ois_bwjHKItV1hFluSJyq39db-V8', '宋全民', '', '', '', NULL, '', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 12:04:51', 0, 0, 0, NULL, '2016-03-11 12:04:51');
INSERT INTO `multi_user` VALUES (476, 0, 0, 'opi_TwF5_Yu1bESJSdlOlKGVzIIo', '宋全民', '', '', '', NULL, '', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 12:05:24', 0, 0, 0, NULL, '2016-03-11 12:05:25');
INSERT INTO `multi_user` VALUES (477, 0, 0, 'opi_TwNKsbMLaC9OTbDu81NVTm74', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 12:42:45', 0, 0, 0, NULL, '2016-03-11 12:42:45');
INSERT INTO `multi_user` VALUES (478, 0, 0, 'ois_bwtRFNsEdWZfLY9FlZSt6AZg', '瞿阳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/tpibCu2BuicvYXfzkwRxf6xOMQsF4z5THJONtiacl46G6hJAqHcK8zO0M6XCCbxethLQQ1S8q6bdhKDGRWnwme9kaF8PPj0eWYu/0', 1, '遂宁', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 13:50:03', 0, 0, 0, NULL, '2016-03-11 14:11:10');
INSERT INTO `multi_user` VALUES (479, 0, 0, 'opi_TwABl24qf0x7kdhrpNbbohAI', '瞿阳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/tpibCu2BuicvYXfzkwRxf6xOMQsF4z5THJONtiacl46G6hJAqHcK8zO0M6XCCbxethLQQ1S8q6bdhKDGRWnwme9kaF8PPj0eWYu/0', 1, 'Suining', 'Sichuan', '', 'zh_CN', 1, 0, 2, 1, 0, '', '2016-03-11 13:51:20', 2, 0, 0, NULL, '2016-03-11 14:46:21');
INSERT INTO `multi_user` VALUES (480, 0, 0, 'ois_bwp4XEgAbhlZHxVFvx0oswiU', '小@雍', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/HmrLtD3NichA8MgoJIDHkiazDHYZnJdyfia64OKvc4cNOnJN6n91xJtRXsy8Sdof9b4IOuvjTDFGcPnBagLny06raicenUqnwD3L/0', 2, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 14:09:20', 0, 0, 0, NULL, '2016-03-11 14:09:20');
INSERT INTO `multi_user` VALUES (481, 0, 0, 'opi_TwP8G9UmvZjfMiAaF1aQEv1k', '小@雍', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/HmrLtD3NichA8MgoJIDHkiazDHYZnJdyfia64OKvc4cNOnJN6n91xJtRXsy8Sdof9b4IOuvjTDFGcPnBagLny06raicenUqnwD3L/0', 2, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 14:09:25', 0, 0, 0, NULL, '2016-03-11 14:09:27');
INSERT INTO `multi_user` VALUES (482, 0, 0, '', '露露', '18839922725', '', '6f87441132dfdde867d055b35ade0c17', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 14:43:03', 0, 2, 0, NULL, '2016-03-11 14:43:03');
INSERT INTO `multi_user` VALUES (483, 0, 0, 'opi_TwHASFt3c3ox9xr7kIzrr4Bw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 14:44:55', 0, 0, 0, NULL, '2016-03-11 14:44:55');
INSERT INTO `multi_user` VALUES (484, 0, 0, 'opi_TwJXjn81o982oDfSiNO-wwOo', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 14:55:15', 1, 0, 0, NULL, '2016-03-13 15:29:30');
INSERT INTO `multi_user` VALUES (485, 0, 0, 'opi_TwBlstTsKlqi-d3QlDa0RD64', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 14:56:57', 0, 0, 0, NULL, '2016-03-11 14:56:57');
INSERT INTO `multi_user` VALUES (486, 0, 0, 'ois_bwjEoqNBI0XfajMyaHx2yauw', '若水', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTReaMbvzHtwyqYSmTeBW0hhEwxbiayORkb3eBMlDHm99OAta1h3anAMPQ6cRVXfRuSLoicnjDSphE8o/0', 2, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 14:57:11', 0, 0, 0, NULL, '2016-03-11 14:57:11');
INSERT INTO `multi_user` VALUES (487, 0, 0, 'opi_TwLLORd93bweWMvKc6Mdxtf0', '若水', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTReaMbvzHtwyqYSmTeBW0hhEwxbiayORkb3eBMlDHm99OAta1h3anAMPQ6cRVXfRuSLoicnjDSphE8o/0', 2, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 14:57:16', 0, 0, 0, NULL, '2016-03-11 14:57:17');
INSERT INTO `multi_user` VALUES (488, 0, 0, 'ois_bwleTZQVE3uF72omnByWUOdQ', '何启航', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeP2YgiaYibJPWKwVI5Yg6fuf1zhEI1cnibia5cbtRVvSBKMQpu5UqT1mBT7icLLxiaa4AEvKveaRJP0QgryQz8pqbR5Z/0', 1, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 15:22:28', 0, 0, 0, NULL, '2016-03-11 15:22:28');
INSERT INTO `multi_user` VALUES (489, 0, 0, 'opi_TwB4-mBD6rB7WdeJbxQpcOxg', '何启航', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeP2YgiaYibJPWKwVI5Yg6fuf1zhEI1cnibia5cbtRVvSBKMQpu5UqT1mBT7icLLxiaa4AEvKveaRJP0QgryQz8pqbR5Z/0', 1, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 15:22:55', 0, 0, 0, NULL, '2016-03-11 15:22:56');
INSERT INTO `multi_user` VALUES (490, 0, 0, 'opi_TwGru--G5a7AP_rmfy9IpjEo', '何杰', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ytJCHw8icp22uPGo9afM1AkPvcAqQUYcbWrf3Ra5e9ykuqrI8RmoTgXbBWfqqPLglJvrglXqECRzN9cUaPibpDDD3JfZ9kicCLU/0', 1, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 5, 1, 0, '', '2016-03-11 16:03:55', 1, 0, 0, NULL, '2016-03-11 16:27:50');
INSERT INTO `multi_user` VALUES (491, 0, 0, 'opi_TwOLumvcrPKAO11RzY5eHxmw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 17:26:02', 0, 0, 0, NULL, '2016-03-11 17:26:02');
INSERT INTO `multi_user` VALUES (492, 0, 0, 'opi_TwMSfwJdBIa5_UE9Bzr2g314', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 17:39:39', 0, 0, 0, NULL, '2016-03-11 17:39:39');
INSERT INTO `multi_user` VALUES (493, 0, 0, 'opi_TwBsh0Sk8-zjLEdpCL-UtFoE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 17:46:57', 0, 0, 0, NULL, '2016-03-11 17:46:57');
INSERT INTO `multi_user` VALUES (494, 0, 0, 'opi_TwCPjv2aXvIaWhBUcwh6isRI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 17:48:49', 0, 0, 0, NULL, '2016-03-11 17:48:49');
INSERT INTO `multi_user` VALUES (495, 0, 0, 'opi_TwADC7ru1ti97RYgDkVCzNzQ', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 18:01:05', 0, 0, 0, NULL, '2016-03-11 18:01:05');
INSERT INTO `multi_user` VALUES (496, 0, 0, 'ois_bwsxQomSfHpi_ry71lq6ngrw', '小怪  笨笨 ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadlFErz1Id5rVZYGicDVBGtEDq5LH7T88rKhOLiamic2mCiaB43QdIL8RR8wxbeKkcpia9iag1L8TSo0lSl4VaA8h2Zoq/0', 2, '佛山', '广东', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:25:16', 0, 0, 0, NULL, '2016-03-11 18:25:16');
INSERT INTO `multi_user` VALUES (497, 0, 0, 'opi_TwLOc2Cw1s_Cw_QJeTG_S64U', '小怪  笨笨 ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadlFErz1Id5rVZYGicDVBGtEDq5LH7T88rKhOLiamic2mCiaB43QdIL8RR8wxbeKkcpia9iag1L8TSo0lSl4VaA8h2Zoq/0', 2, 'Foshan', 'Guangdong', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:25:21', 0, 0, 0, NULL, '2016-03-11 18:25:22');
INSERT INTO `multi_user` VALUES (498, 0, 0, 'ois_bwhToYcqf0gmf1iir1Q-4tOQ', '妞妞', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2c5ib7kG4nFR1mFLibllMBVDGIcBdenIe2RHGyZTHonPG0npmic69lTc6E80u2doN0jnVxp8XO9JdS1/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:29:27', 0, 0, 0, NULL, '2016-03-11 18:29:28');
INSERT INTO `multi_user` VALUES (499, 0, 0, 'opi_TwMKFz8f6BKPi0QYloZL26OY', '妞妞', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2c5ib7kG4nFR1mFLibllMBVDGIcBdenIe2RHGyZTHonPG0npmic69lTc6E80u2doN0jnVxp8XO9JdS1/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:29:40', 0, 0, 0, NULL, '2016-03-11 18:29:41');
INSERT INTO `multi_user` VALUES (500, 0, 0, 'ois_bwqJ5zywDXz0YQTCRwf5J80Y', '旧友i', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClDv7VAqcdQkut2UibsBibjxoA6CzZRpAeHDU4OGJiaiaZhOBibLDjLIzBgJ4ZF3PjFibPUmauicaYbPgibFPN7UpKhiaeFk/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:30:34', 0, 0, 0, NULL, '2016-03-11 18:30:34');
INSERT INTO `multi_user` VALUES (501, 0, 0, 'opi_TwGN9kSqjYGWwq12XLx0a9e4', '旧友i', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClDv7VAqcdQkut2UibsBibjxoA6CzZRpAeHDU4OGJiaiaZhOBibLDjLIzBgJ4ZF3PjFibPUmauicaYbPgibFPN7UpKhiaeFk/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:30:38', 0, 0, 0, NULL, '2016-03-11 18:30:39');
INSERT INTO `multi_user` VALUES (502, 0, 0, 'ois_bwj3pkhDmCPXk2gQFLVQa4-w', '露', '', '', '', NULL, '', 2, '绵阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:32:58', 0, 0, 0, NULL, '2016-03-11 18:32:58');
INSERT INTO `multi_user` VALUES (503, 0, 0, 'opi_TwF_GMgCPqxITRbGJy7PVgyE', '露', '', '', '', NULL, '', 2, 'Mianyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:33:05', 0, 0, 0, NULL, '2016-03-11 18:33:07');
INSERT INTO `multi_user` VALUES (504, 0, 0, 'ois_bwlqoDk9lD2SLkrQJwKQr_zk', '墨白渲染沫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmOxmI5fw3wAWV434xTNvHKWZLC4wialwSOF6OUOnKIxkO7pJciaOpBHOAtcalKJ6fRvUFXdDTefiad8aoibPpBvw3p/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:35:06', 0, 0, 0, NULL, '2016-03-11 18:35:06');
INSERT INTO `multi_user` VALUES (505, 0, 0, 'opi_TwJIr3mamBOH9E6ezCv6Edj8', '墨白渲染沫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmOxmI5fw3wAWV434xTNvHKWZLC4wialwSOF6OUOnKIxkO7pJciaOpBHOAtcalKJ6fRvUFXdDTefiad8aoibPpBvw3p/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:35:29', 0, 0, 0, NULL, '2016-03-11 18:35:30');
INSERT INTO `multi_user` VALUES (506, 0, 0, 'ois_bwnnFLAtckmZIGgaEnfhZ0NI', 'Kristin', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2cWaN6iaaR6VdrcyUxDB5gib2CoVlaQHHGLgiaFRR2pqeFnlxqt9nUicPVgic6Uf0uUecpMlQpGaJkBEh/0', 1, '浦东新区', '上海', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:56:25', 0, 0, 0, NULL, '2016-03-11 18:56:25');
INSERT INTO `multi_user` VALUES (507, 0, 0, 'opi_TwMk6pszzrT7nN8naGHmPG50', 'Kristin', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibDqIgPzshT2cWaN6iaaR6VdrcyUxDB5gib2CoVlaQHHGLgiaFRR2pqeFnlxqt9nUicPVgic6Uf0uUecpMlQpGaJkBEh/0', 1, 'Pudong New District', 'Shanghai', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:56:29', 0, 0, 0, NULL, '2016-03-11 18:56:30');
INSERT INTO `multi_user` VALUES (508, 0, 0, 'ois_bwsDkewlkopMO4jneaFETjBU', 'XX', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iia5pppoUuq7oBDX3zXuT1d69aicQEZI5EYVTurgmdxveKXoMv7ZULTtWI6blD6oZPqEAkbklUTPT2oB6yXhjOgVm/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:58:09', 0, 0, 0, NULL, '2016-03-11 18:58:09');
INSERT INTO `multi_user` VALUES (509, 0, 0, 'opi_TwKWHQs-GysVD1sFQAXLIUB4', 'XX', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iia5pppoUuq7oBDX3zXuT1d69aicQEZI5EYVTurgmdxveKXoMv7ZULTtWI6blD6oZPqEAkbklUTPT2oB6yXhjOgVm/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 18:58:23', 0, 0, 0, NULL, '2016-03-11 18:58:25');
INSERT INTO `multi_user` VALUES (510, 0, 0, 'ois_bwtbUXuVSvc7OG_XnQlIXJYU', '杜红红', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSkCm4SCG4Pperb1nPxN5lxHj3j4P5uwkEXImEiamodMu6BIlP774Z7d5FU4LicE2LTWcVNYicN8Ut2/0', 2, '纽波特', '威尔士', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:04:22', 0, 0, 0, NULL, '2016-03-11 19:04:22');
INSERT INTO `multi_user` VALUES (511, 0, 0, 'opi_TwE0EhZPs8mU2vJpmd2ViR1g', '杜红红', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSkCm4SCG4Pperb1nPxN5lxHj3j4P5uwkEXImEiamodMu6BIlP774Z7d5FU4LicE2LTWcVNYicN8Ut2/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:04:37', 0, 0, 0, NULL, '2016-03-11 19:04:38');
INSERT INTO `multi_user` VALUES (512, 0, 0, 'ois_bwg5GPblC3buhCq_oBvolVRo', '顺其自然', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD1Q9GTWFo1wXI6Cc6od84GSibB3kR1ap2XduIh3YUQOg3lTxvK37lmzjVic6rD00iam1dko1xL4fibVg/0', 1, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:07:42', 0, 0, 0, NULL, '2016-03-11 19:07:42');
INSERT INTO `multi_user` VALUES (513, 0, 0, 'opi_TwEmSWCkPDOw-jeFGmsIc5M4', '顺其自然', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD1Q9GTWFo1wXI6Cc6od84GSibB3kR1ap2XduIh3YUQOg3lTxvK37lmzjVic6rD00iam1dko1xL4fibVg/0', 1, 'Florida', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:08:02', 0, 0, 0, NULL, '2016-03-11 19:08:03');
INSERT INTO `multi_user` VALUES (514, 0, 0, '', '德能并进，知行合一', '18443128957', '', 'd8022a60c99314ed4cda718aeeb4dea6', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 19:16:53', 0, 2, 0, NULL, '2016-03-11 19:16:53');
INSERT INTO `multi_user` VALUES (515, 0, 0, 'ois_bws2h1xlayVZbn09Npk1DbCw', '李晓', '', '', '', NULL, '', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:24:50', 0, 0, 0, NULL, '2016-03-11 19:24:50');
INSERT INTO `multi_user` VALUES (516, 0, 0, 'opi_TwAlNZMT4rK5lYgd9b0z6WHA', '李晓', '', '', '', NULL, '', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:24:58', 0, 0, 0, NULL, '2016-03-11 19:24:59');
INSERT INTO `multi_user` VALUES (517, 0, 0, 'ois_bwsCHowQxBD_3U02pxj7Gpjs', '陈霞霞。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iae7yYWjz46XTELF8ccpJYwUgElXqaXvU7W2ibUVpLJ5Fhx162yVhWcnh65cc5QUPU9ticK0FMAqtWmKicxic956aTzs/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:35:18', 0, 0, 0, NULL, '2016-03-11 19:35:18');
INSERT INTO `multi_user` VALUES (518, 0, 0, 'opi_TwGFsdchvem4BMJ9DjR0ZZ3s', '陈霞霞。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iae7yYWjz46XTELF8ccpJYwUgElXqaXvU7W2ibUVpLJ5Fhx162yVhWcnh65cc5QUPU9ticK0FMAqtWmKicxic956aTzs/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:35:25', 0, 0, 0, NULL, '2016-03-11 19:35:26');
INSERT INTO `multi_user` VALUES (519, 0, 0, 'ois_bwlEi942rBusi9fWuPIWFaPU', '木子青争', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/uHTAvha8wDiaa3oxkGMpCfer404udx2XTlC46nJNMwAcbz1EdOC1mKDOyNpahHUSdZmzS8DJZFygagfQBHlNnX8oReM2uw4Ik/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:39:06', 0, 0, 0, NULL, '2016-03-11 19:39:06');
INSERT INTO `multi_user` VALUES (520, 0, 0, 'opi_TwBpGP1IwOk1aUZBZ1uqdRYg', '木子青争', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/uHTAvha8wDiaa3oxkGMpCfer404udx2XTlC46nJNMwAcbz1EdOC1mKDOyNpahHUSdZmzS8DJZFygagfQBHlNnX8oReM2uw4Ik/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 19:39:25', 0, 0, 0, NULL, '2016-03-11 19:39:27');
INSERT INTO `multi_user` VALUES (521, 0, 0, 'ois_bwpcc5AL-FF0rDHeb_bL20t0', 'Caiso', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:09:26', 0, 0, 0, NULL, '2016-03-11 20:09:26');
INSERT INTO `multi_user` VALUES (522, 0, 0, 'opi_TwDYACEf9M3SQEUM0e3yis5w', 'Caiso', '', '', '', NULL, '', 0, '', '', '', 'zh_CN', 1, 0, 4, 1, 0, '', '2016-03-11 20:09:31', 1, 0, 0, NULL, '2016-03-11 20:17:05');
INSERT INTO `multi_user` VALUES (523, 0, 0, 'opi_TwOLgLjJGRbOzYnQYntnXlTU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 20:10:49', 0, 0, 0, NULL, '2016-03-11 20:10:49');
INSERT INTO `multi_user` VALUES (524, 0, 0, 'ois_bwrf3WFwAYjIMxLFkX3aYf7g', 'F', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybib76F24wRMqdxAy5ov7ARV0LKB03ZjsIh0Q2O90c1t2ibKBdqiaf3Se2d9WibMS58uH4su3xVdbNIfzEUxe7JNtzFO/0', 1, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:16:41', 0, 0, 0, NULL, '2016-03-11 20:16:41');
INSERT INTO `multi_user` VALUES (525, 0, 0, 'ois_bwjHFnQOUTVX6oP_KXGDCXXw', 'Xiao-', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDG4e3g4uJQfx1ib4WJqxE0aib5XaOsFq27JpOXBVG9K2WjAqSNqZapfnJwib4CYDIOtUWoOuujVHzicw/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:21:13', 0, 0, 0, NULL, '2016-03-11 20:21:13');
INSERT INTO `multi_user` VALUES (526, 0, 0, 'opi_TwPHMweIcKbpbEORFeQEuyA8', 'Xiao-', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDG4e3g4uJQfx1ib4WJqxE0aib5XaOsFq27JpOXBVG9K2WjAqSNqZapfnJwib4CYDIOtUWoOuujVHzicw/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:21:16', 0, 0, 0, NULL, '2016-03-11 20:21:17');
INSERT INTO `multi_user` VALUES (527, 0, 0, 'opi_TwCdrQRIwX-gEkI-GfbmfDGw', '后天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsTLy2zZicRvjKDXV6STzGCbBbGefIz7hVqUldNZLR7kNQEh9qbyvNibdR8hyx4UcHGiap4icTrAlKBWia/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:22:08', 0, 0, 0, NULL, '2016-03-11 20:34:42');
INSERT INTO `multi_user` VALUES (528, 0, 0, 'ois_bwpHjsqGWJAvGwWKBBXuh27M', '花开不败', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOfxXDzlcbia2fWNToic6S61FyBPNU3KfgvrB9hZL2rLx4w0mZr2fyXx7uG89dpJBapnKFV72Gy333U/0', 2, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:31:25', 0, 0, 0, NULL, '2016-03-11 20:31:25');
INSERT INTO `multi_user` VALUES (529, 0, 0, 'opi_TwFDiIhwOYrlczOy6QXnc7Ys', '花开不败', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOfxXDzlcbia2fWNToic6S61FyBPNU3KfgvrB9hZL2rLx4w0mZr2fyXx7uG89dpJBapnKFV72Gy333U/0', 2, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:31:42', 0, 0, 0, NULL, '2016-03-11 20:31:45');
INSERT INTO `multi_user` VALUES (530, 0, 0, 'ois_bwvL4y71GCr2xC1NqnF7KBFc', '佘勇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iiaib2ianiaBnEe4GYicj66hVKRUQ3KlSC2h5rzaxplWMALzib3F9P2HKcOWB4oYzcMXcMBF67eQGwYwj9QFFU00URnYm/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:34:05', 0, 0, 0, NULL, '2016-03-11 20:34:05');
INSERT INTO `multi_user` VALUES (531, 0, 0, 'opi_TwMiltjCkIalGKHnGqy97xbg', '佘勇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iiaib2ianiaBnEe4GYicj66hVKRUQ3KlSC2h5rzaxplWMALzib3F9P2HKcOWB4oYzcMXcMBF67eQGwYwj9QFFU00URnYm/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:34:10', 0, 0, 0, NULL, '2016-03-11 20:34:11');
INSERT INTO `multi_user` VALUES (532, 0, 0, 'ois_bwq86r933VJ2RyGoK9NC6k4A', '后天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsTLy2zZicRvjKDXV6STzGCbBbGefIz7hVqUldNZLR7kNQEh9qbyvNibdR8hyx4UcHGiap4icTrAlKBWia/0', 1, '爱达荷福尔斯', '爱达荷州', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:34:40', 0, 0, 0, NULL, '2016-03-11 20:34:40');
INSERT INTO `multi_user` VALUES (533, 0, 0, 'opi_TwI7RgO9sH3ry_ndxf1gQATM', '邓时雨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYoKSRBQ3EChaCib9WV7icVkuE7TTicVd3wRlZ1UicfVdA9UXyfib3DIgaANHpgvx97f2PgBiaEQ0IZTsBm/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:37:14', 0, 0, 0, NULL, '2016-03-11 20:37:15');
INSERT INTO `multi_user` VALUES (534, 0, 0, 'ois_bwtiV8kEMNEb0MUlkcHTBfMk', '逗比小哥', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjM3NCcZq5hpVH2SIibMZ3FFkKLcEwk2DicibgFdxbIUImM73onGR9VWmUibo6NXTzrSQ20uDZcktbOicdtxNMgpb8Cx/0', 1, '', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:45:37', 0, 0, 0, NULL, '2016-03-11 20:45:37');
INSERT INTO `multi_user` VALUES (535, 0, 0, 'opi_TwPlR-cijn-EX4-rWWQQULps', '逗比小哥', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjM3NCcZq5hpVH2SIibMZ3FFkKLcEwk2DicibgFdxbIUImM73onGR9VWmUibo6NXTzrSQ20uDZcktbOicdtxNMgpb8Cx/0', 1, '', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:45:42', 0, 0, 0, NULL, '2016-03-11 20:45:43');
INSERT INTO `multi_user` VALUES (536, 0, 0, 'ois_bwib-it5M5Wz5CaWVvTPppnM', '大林', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rQZeyM1jibKX1rIYBrNRYSXzBSSbzOsXDKkFbHDRdbk4KunvBLp6Libe4Cibmw0aToUFa65MKQG6gN1tR23jxYWL96gocibabXicY/0', 1, '', '凯里', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:46:26', 0, 0, 0, NULL, '2016-03-11 20:46:26');
INSERT INTO `multi_user` VALUES (537, 0, 0, 'opi_TwCki0DeNW1fujM3DUco6_Qc', '大林', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rQZeyM1jibKX1rIYBrNRYSXzBSSbzOsXDKkFbHDRdbk4KunvBLp6Libe4Cibmw0aToUFa65MKQG6gN1tR23jxYWL96gocibabXicY/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:46:31', 0, 0, 0, NULL, '2016-03-11 20:46:32');
INSERT INTO `multi_user` VALUES (538, 0, 0, 'ois_bwnkAOMLPSCMWZa1f3qHI9FA', '单调◎黑', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/L0icJ4UKEb2SCdOPlbYl1nxHaG8QkmOcw7nD3KeUJCkwgicroMibuYLGTaibU1OzI4PUplTplvN1CUVWjTH9mVNA18K2bvIMNavia/0', 1, '', '首尔', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:53:51', 0, 0, 0, NULL, '2016-03-11 20:53:51');
INSERT INTO `multi_user` VALUES (539, 0, 0, 'opi_TwPN3NjLH_DPKHieMuAJPbKY', '单调◎黑', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/L0icJ4UKEb2SCdOPlbYl1nxHaG8QkmOcw7nD3KeUJCkwgicroMibuYLGTaibU1OzI4PUplTplvN1CUVWjTH9mVNA18K2bvIMNavia/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 20:53:57', 0, 0, 0, NULL, '2016-03-11 20:56:30');
INSERT INTO `multi_user` VALUES (540, 0, 0, 'opi_TwDLa1Nr5AcSk9a5CR9k1TSc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 20:54:14', 0, 0, 0, NULL, '2016-03-11 20:54:14');
INSERT INTO `multi_user` VALUES (541, 0, 0, 'opi_TwHUNC-0M8W_PkOZjUCcSC1E', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 21:01:18', 0, 0, 0, NULL, '2016-03-11 21:01:18');
INSERT INTO `multi_user` VALUES (542, 0, 0, 'ois_bwm3acAjKe1DWEnw9kziBRfI', '_门神_', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IgG4RD3LViaC05PribHp9axFZHJD16qdEzYxDLHF7HVHneRtZCmGOsStMAXMFQ7cnkLUTeibempdN99EUoYuAeqJEn/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:23:36', 0, 0, 0, NULL, '2016-03-11 21:23:36');
INSERT INTO `multi_user` VALUES (543, 0, 0, 'opi_TwGCBH8mGpRkEGNpLpTes9oQ', '_门神_', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IgG4RD3LViaC05PribHp9axFZHJD16qdEzYxDLHF7HVHneRtZCmGOsStMAXMFQ7cnkLUTeibempdN99EUoYuAeqJEn/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:23:50', 0, 0, 0, NULL, '2016-03-11 21:23:51');
INSERT INTO `multi_user` VALUES (544, 0, 0, 'ois_bwjxcn7qiuu6i5hgncX0WuVE', 'meta君QAQ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAhkk4maosxQ3bEqtMo2rdjhIibjMPpzFjf63QS6RLQFIa18WYxxNUZPbjWia8WHT0ZYf8OSCgwaGDA/0', 1, '广元', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:34:57', 0, 0, 0, NULL, '2016-03-11 21:34:57');
INSERT INTO `multi_user` VALUES (545, 0, 0, 'opi_TwCTbO9SoA3Zdunzg8DmkZfc', 'meta君QAQ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAhkk4maosxQ3bEqtMo2rdjhIibjMPpzFjf63QS6RLQFIa18WYxxNUZPbjWia8WHT0ZYf8OSCgwaGDA/0', 1, 'Guangyuan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:35:00', 0, 0, 0, NULL, '2016-03-11 21:35:02');
INSERT INTO `multi_user` VALUES (546, 0, 0, 'ois_bwgzytu9nQ5zlXx85bqO1tzE', '南箫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIjCJN8S1hYXWvX6tE2nKUzxHyRvkbwicLom66BRskxOVKibAL3nibRy7oxODltaQheZQictxfcqicnKOQ/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:49:26', 0, 0, 0, NULL, '2016-03-11 21:49:26');
INSERT INTO `multi_user` VALUES (547, 0, 0, 'opi_TwAt3xmRhgHr_T-PPYn9t_WU', '南箫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIjCJN8S1hYXWvX6tE2nKUzxHyRvkbwicLom66BRskxOVKibAL3nibRy7oxODltaQheZQictxfcqicnKOQ/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 21:49:32', 0, 0, 0, NULL, '2016-03-11 21:49:33');
INSERT INTO `multi_user` VALUES (548, 0, 0, 'ois_bwpxR2KL-V45kK3DpiGmcY08', '张雨佳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8PsriaFrvdSB35bkDhvxKpibG1EiatrkuhZIhcz8RP5QbKlVLNibt88y42ehIibypO9YZQgzrKYbhULvyO/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:08:46', 0, 0, 0, NULL, '2016-03-11 22:08:46');
INSERT INTO `multi_user` VALUES (549, 0, 0, 'opi_TwCGJ65k4iiuiv1CXterqJbI', '张雨佳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iade5SfiaicWb8PsriaFrvdSB35bkDhvxKpibG1EiatrkuhZIhcz8RP5QbKlVLNibt88y42ehIibypO9YZQgzrKYbhULvyO/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 2, 1, 0, '', '2016-03-11 22:09:36', 1, 0, 0, NULL, '2016-03-13 13:06:30');
INSERT INTO `multi_user` VALUES (550, 0, 0, 'ois_bwtsA4qz_N6SUyDCtDF_Ug5Y', 'W╮', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRVdicyQbP345YQ5wx3T6l5wqoibKe7ROb5wTwPxjwCHPiaxHjxdcfNfnf9B4JyfpzYZZma3w8N0ZESb/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:15:12', 0, 0, 0, NULL, '2016-03-11 22:15:12');
INSERT INTO `multi_user` VALUES (551, 0, 0, 'opi_TwBEY39043UMK6EoQQZBwUW8', 'W╮', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRVdicyQbP345YQ5wx3T6l5wqoibKe7ROb5wTwPxjwCHPiaxHjxdcfNfnf9B4JyfpzYZZma3w8N0ZESb/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:15:19', 0, 0, 0, NULL, '2016-03-11 22:15:20');
INSERT INTO `multi_user` VALUES (552, 0, 0, 'ois_bwkEgIUw8qMlbtTn71RtGXBU', '雨飞的天空', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pBsIAOolXaf9hjSib3vfot0DlSkia20j0biaWMHiaibicKf9VypsGibDMZI6nmeQAn8n1Yddxiaefnpl52caK7PVVmbtOjnbjpOia0GtQ/0', 1, '成都', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-11 22:15:50', 0, 0, 0, NULL, '2016-03-11 22:16:06');
INSERT INTO `multi_user` VALUES (553, 0, 0, 'ois_bwt_F6XGjEtjbPM9RqJUt_VQ', '宸宸', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyQH8uMmibrbA1Ku0gxQo0tiajE0mBFY54w52T2Lu9BicgSqT9EblCs6CO8vfCq5sPyfmO71oYHmbF7k/0', 2, '自贡', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-11 22:28:13', 0, 0, 0, NULL, '2016-03-11 22:31:08');
INSERT INTO `multi_user` VALUES (554, 0, 0, 'opi_TwDs9sC-yYFKy0zeDNYfuErI', '宸宸', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyQH8uMmibrbA1Ku0gxQo0tiajE0mBFY54w52T2Lu9BicgSqT9EblCs6CO8vfCq5sPyfmO71oYHmbF7k/0', 2, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:28:17', 0, 0, 0, NULL, '2016-03-11 22:28:18');
INSERT INTO `multi_user` VALUES (555, 0, 0, 'ois_bwknLGVIYMekDnXSTCqjBt9U', '茫茫然', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYvFnsLphpoAAdU1eOeLxlyGN6icMbGNZJz0ic0uXFv8ic5YSRnyZ5TjeZpAs3B5rSyicXgamfMOPmFe9/0', 2, '广安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:45:59', 0, 0, 0, NULL, '2016-03-11 22:45:59');
INSERT INTO `multi_user` VALUES (556, 0, 0, 'opi_TwJCn9e4A_ixsoWEG72m9Dvg', '茫茫然', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYvFnsLphpoAAdU1eOeLxlyGN6icMbGNZJz0ic0uXFv8ic5YSRnyZ5TjeZpAs3B5rSyicXgamfMOPmFe9/0', 2, 'Kwong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:46:07', 0, 0, 0, NULL, '2016-03-11 22:46:08');
INSERT INTO `multi_user` VALUES (557, 0, 0, 'opi_TwKPK6G8cxkGKk4rngVx85Yo', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-11 22:47:24', 0, 0, 0, NULL, '2016-03-11 22:47:24');
INSERT INTO `multi_user` VALUES (558, 0, 0, 'opi_TwNSXv3edSoDX1KN2h5kJfKg', 'Duan', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeDC3jhjhPQNqztC0xmvoZQG0jfoYf332EZYJURUUIBH3tLxcdlFniaAnXJhpg3VcOJBQVpXvOAFQ20JRjRTfXqC/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:51:19', 0, 0, 0, NULL, '2016-03-11 22:51:20');
INSERT INTO `multi_user` VALUES (559, 0, 0, 'opi_TwEkmqzPtH1B7EEXfxrcMLlk', '谢林易', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRydQER02Qz0lkDkqy8lVZTT13IFIqe1Z4hkzgnUwTNuSM1FpVciccIlMGoBNMz3W03Uic22UJCOGJR9/0', 0, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:53:49', 0, 0, 0, NULL, '2016-03-11 22:53:50');
INSERT INTO `multi_user` VALUES (560, 0, 0, 'ois_bwvrZF6s-Az2xR4lz3Br9hmM', '迷梦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacFmbhfxXowAtiapjBAUicgltM8ZphlcFnKnIhZ4E8reHHjv2HZNQJ41WH2AY9EEKHbicE83cnzLsKHcOrp532CEJI/0', 2, '遂宁', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:56:15', 0, 0, 0, NULL, '2016-03-11 22:56:15');
INSERT INTO `multi_user` VALUES (561, 0, 0, 'opi_TwISYfMfhwi88ZXBed4x1otk', '迷梦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacFmbhfxXowAtiapjBAUicgltM8ZphlcFnKnIhZ4E8reHHjv2HZNQJ41WH2AY9EEKHbicE83cnzLsKHcOrp532CEJI/0', 2, 'Suining', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:56:23', 0, 0, 0, NULL, '2016-03-11 22:56:24');
INSERT INTO `multi_user` VALUES (562, 0, 0, 'ois_bwgzccZBDXABZhqM4YYka9tU', ' Claire', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhbXFLXwF1d1HGajrhEZyCI6PMx3XwF7DalPVuqDycyfBPGM6AarsibU2Y6jStOsXRQBaMAOsUZSahBUvuz0B3N5/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:59:35', 0, 0, 0, NULL, '2016-03-11 22:59:35');
INSERT INTO `multi_user` VALUES (563, 0, 0, 'opi_TwHkNsSnYcVynk1of5boBnDc', ' Claire', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhbXFLXwF1d1HGajrhEZyCI6PMx3XwF7DalPVuqDycyfBPGM6AarsibU2Y6jStOsXRQBaMAOsUZSahBUvuz0B3N5/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 22:59:40', 0, 0, 0, NULL, '2016-03-11 22:59:42');
INSERT INTO `multi_user` VALUES (564, 0, 0, 'opi_TwHHDtS8Cgo-NrXwGaugZ4kE', '云中的angeljbr', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsfpwtsOXRJuqAt8oPC8M0P3mOXzUZbjPuhXGwCKLzGeu0qJI03lvOcUme2jT5EU390h4wVSWgfua/0', 2, 'Liangshan', 'Sichuan', '', 'zh_CN', 1, 0, 4, 1, 0, '', '2016-03-11 23:03:23', 2, 0, 0, NULL, '2016-03-12 16:09:05');
INSERT INTO `multi_user` VALUES (565, 0, 0, 'ois_bwlTZyROK3m10up8XGzVBVOs', '杨桃', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCUaehGCyufpr9s9FIhFpk8FnAE174FFnYRg3aib6icWYkXGy3qH4iamHwmxNJKQRPJZVFZ9ByTfloIicUr9sOQF9mWZuRSYtw6DQI/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 23:12:07', 0, 0, 0, NULL, '2016-03-11 23:12:07');
INSERT INTO `multi_user` VALUES (566, 0, 0, 'opi_TwB5lfUa7afUVZ1ddBofw6TQ', '杨桃', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCUaehGCyufpr9s9FIhFpk8FnAE174FFnYRg3aib6icWYkXGy3qH4iamHwmxNJKQRPJZVFZ9ByTfloIicUr9sOQF9mWZuRSYtw6DQI/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 23:12:20', 0, 0, 0, NULL, '2016-03-11 23:12:21');
INSERT INTO `multi_user` VALUES (567, 0, 0, 'ois_bwggkb18l5dQxGCqNNdmZmmg', 'I', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaPT0BsOsicNYCYJiaF1rLcTNeXYN4pmK3Z3959boMa3oe8AwXbJtgiaBtr6akj5jjB58X0gYF6G9JaLwibjcWXkoph/0', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 23:56:54', 0, 0, 0, NULL, '2016-03-11 23:56:54');
INSERT INTO `multi_user` VALUES (568, 0, 0, 'opi_TwNHgvhrku0O-1v_NkZGUfew', 'I', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaPT0BsOsicNYCYJiaF1rLcTNeXYN4pmK3Z3959boMa3oe8AwXbJtgiaBtr6akj5jjB58X0gYF6G9JaLwibjcWXkoph/0', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-11 23:56:58', 0, 0, 0, NULL, '2016-03-11 23:57:00');
INSERT INTO `multi_user` VALUES (569, 0, 0, 'ois_bwlbml3eRd9zCdRL0bhG1mgE', '冰糖葫芦娃', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb8glGCNMPnowxcdhVV3qS4v5RStIqXobicaMzT5gRqMIWGK4Ao6zYQ6c0YEU2LDsO6icB3ApmVg6fqpAmLHiaaZ3uL/0', 1, '资阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 00:32:52', 0, 0, 0, NULL, '2016-03-12 00:32:52');
INSERT INTO `multi_user` VALUES (570, 0, 0, 'opi_TwGGpxYoLt7FyfzF7deRE-yU', '冰糖葫芦娃', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb8glGCNMPnowxcdhVV3qS4v5RStIqXobicaMzT5gRqMIWGK4Ao6zYQ6c0YEU2LDsO6icB3ApmVg6fqpAmLHiaaZ3uL/0', 1, 'Ziyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 00:32:56', 0, 0, 0, NULL, '2016-03-12 00:32:57');
INSERT INTO `multi_user` VALUES (571, 0, 0, 'opi_TwOrS9fTOaklQZuA3_wMpA8M', 'spiders man', '', '', '', NULL, '', 2, 'Florida', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 03:13:56', 0, 0, 0, NULL, '2016-03-12 03:13:57');
INSERT INTO `multi_user` VALUES (572, 0, 0, 'ois_bwjisPNHQMKOliYjd1Myw7ZI', '❀       胖   大    海', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/e53Jia30YfDqntogzR7ZR50YOzoRj5VWZLWJk3QQ05xPhviawFedrzJPiaUiacYPMJpMZC5gpuUoibfeYZ3WsKYjqjnbWsFuwiccUw/0', 2, '常州', '江苏', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 09:14:30', 0, 0, 0, NULL, '2016-03-12 09:14:30');
INSERT INTO `multi_user` VALUES (573, 0, 0, 'opi_TwKoMKNxYDiJYZy_yVlbEy7Q', '❀       胖   大    海', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/e53Jia30YfDqntogzR7ZR50YOzoRj5VWZLWJk3QQ05xPhviawFedrzJPiaUiacYPMJpMZC5gpuUoibfeYZ3WsKYjqjnbWsFuwiccUw/0', 2, 'Changzhou', 'Jiangsu', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 09:14:37', 0, 0, 0, NULL, '2016-03-12 09:14:38');
INSERT INTO `multi_user` VALUES (574, 0, 0, 'ois_bwghYkX_eG_1hhFTEVjOo1lU', '  ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacxbOicLcByzla0OGosO7OQ3yk9Hqh9soI3TNkKaShfJNmJ71liaJoXa5e5dm4hVTvylgiaY7X6b1XJfIOibnK5IneW/0', 2, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 09:33:38', 0, 0, 0, NULL, '2016-03-12 09:33:38');
INSERT INTO `multi_user` VALUES (575, 0, 0, '', 'gaopengjidi@126.com', '15304841009', '', '7cf703b441135f0e5e744839a6f2cd4c', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 09:45:56', 0, 2, 0, NULL, '2016-03-12 09:45:56');
INSERT INTO `multi_user` VALUES (576, 0, 0, 'ois_bwrlpGV8aoeib-SaasYF65r0', '明天会更好', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkOKX6W0wAiaZKBA8Cs8XVBTPV6CWO9mC2y1MzWQb82icgJMP4jYyRDy6UOFiaL3gtxLcZc6zyJ2Fln09xAGo9Te6q/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 09:45:59', 0, 0, 0, NULL, '2016-03-12 09:45:59');
INSERT INTO `multi_user` VALUES (577, 0, 0, 'opi_TwNl8azEZyCyvG99naHI2Jzs', '明天会更好', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkOKX6W0wAiaZKBA8Cs8XVBTPV6CWO9mC2y1MzWQb82icgJMP4jYyRDy6UOFiaL3gtxLcZc6zyJ2Fln09xAGo9Te6q/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 09:46:07', 0, 0, 0, NULL, '2016-03-12 09:46:08');
INSERT INTO `multi_user` VALUES (578, 0, 0, 'opi_TwOi-7KbshhHp9jIQB5W0m8I', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 09:57:08', 0, 0, 0, NULL, '2016-03-12 09:57:08');
INSERT INTO `multi_user` VALUES (579, 0, 0, 'ois_bwlpB_PmfdzanVBQFdlbg5O0', ' ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiatwMW7fEEVB2ICjU0usHtib7sCxzr428sSPGYksX4KynicceFeu4fYbmx408REBpMhZDGeicF9p8KFFrYptPqrichP/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 10:30:30', 0, 0, 0, NULL, '2016-03-12 10:30:30');
INSERT INTO `multi_user` VALUES (580, 0, 0, 'opi_TwAlQDtQvWIQ1-U72Sx2extY', ' ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiatwMW7fEEVB2ICjU0usHtib7sCxzr428sSPGYksX4KynicceFeu4fYbmx408REBpMhZDGeicF9p8KFFrYptPqrichP/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 10:30:34', 0, 0, 0, NULL, '2016-03-12 10:30:35');
INSERT INTO `multi_user` VALUES (581, 0, 0, 'ois_bwvBstQcgzEAtl7u8yeArgjI', 'Penny', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaCQRFciacNgYdUXwoGJODqFwRozb83JMKFCdzA7PUvUyLIfK8nBqxNPrxJdAaU3K2L67Fetviciaic5SiaEoRYI8E9ic/0', 2, '', '重庆', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 10:36:39', 0, 0, 0, NULL, '2016-03-12 10:36:39');
INSERT INTO `multi_user` VALUES (582, 0, 0, 'opi_TwNHQw0Z0eCVEnTKUXtGGPrE', 'Penny', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaCQRFciacNgYdUXwoGJODqFwRozb83JMKFCdzA7PUvUyLIfK8nBqxNPrxJdAaU3K2L67Fetviciaic5SiaEoRYI8E9ic/0', 2, '', 'Chongqing', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 10:36:43', 0, 0, 0, NULL, '2016-03-12 10:36:44');
INSERT INTO `multi_user` VALUES (583, 0, 0, 'opi_TwFiQmTc9goWjMAzEUxJIiP4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 10:44:01', 0, 0, 0, NULL, '2016-03-12 10:44:01');
INSERT INTO `multi_user` VALUES (584, 0, 0, 'opi_TwLIwvZ7loT_wE5ylG6pdNME', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 10:45:02', 0, 0, 0, NULL, '2016-03-12 10:45:02');
INSERT INTO `multi_user` VALUES (585, 0, 0, 'ois_bwsuHS--TWhal_d9iaLuXzNk', '古城', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOQG3zSfjvibx5UbZTuicuZJoFibLRxmN5dWlzfjpcJmFF8KrUJJa4d9a5FaBwia1rOIeIlCkKgDLWf3g/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:02:16', 0, 0, 0, NULL, '2016-03-12 11:02:16');
INSERT INTO `multi_user` VALUES (586, 0, 0, 'opi_TwKf6HG_xhk-3fvr2WIgFcuA', '古城', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOQG3zSfjvibx5UbZTuicuZJoFibLRxmN5dWlzfjpcJmFF8KrUJJa4d9a5FaBwia1rOIeIlCkKgDLWf3g/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:02:25', 0, 0, 0, NULL, '2016-03-12 11:02:26');
INSERT INTO `multi_user` VALUES (587, 0, 0, 'opi_TwIiHz27H8A3xhFwPAhjnQS8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 11:06:03', 0, 0, 0, NULL, '2016-03-12 11:06:03');
INSERT INTO `multi_user` VALUES (588, 0, 0, 'ois_bwv6gV_vHTrhx724CEM0nnag', '超哥', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeDsORCTUeGbEBKcjicqO3SlViaSOxazKdFbDEUFnQdHwsGmn3j1y3CkBR9d2bNnvcTJjRFeEFrtMFRDzjn7icNUY4/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:18:40', 0, 0, 0, NULL, '2016-03-12 11:18:40');
INSERT INTO `multi_user` VALUES (589, 0, 0, 'opi_TwMM_HXzR70gEtvP6420ZZx8', '超哥', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iaeDsORCTUeGbEBKcjicqO3SlViaSOxazKdFbDEUFnQdHwsGmn3j1y3CkBR9d2bNnvcTJjRFeEFrtMFRDzjn7icNUY4/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:19:01', 0, 0, 0, NULL, '2016-03-12 11:19:03');
INSERT INTO `multi_user` VALUES (590, 0, 0, 'ois_bwislpH0DGssBMP178u04wXk', '战无不胜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibhY3bThL62vlHTYlnXmUGZFgWORrQhlkib0e84XNcJwAzsdSibHCV7VSZVfoR53b70Tg36a400EMic032CeYvhNYv/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:28:52', 0, 0, 0, NULL, '2016-03-12 11:28:52');
INSERT INTO `multi_user` VALUES (591, 0, 0, 'opi_TwFaJMg_p9z1Y5Kf7xyNKSqA', '战无不胜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibhY3bThL62vlHTYlnXmUGZFgWORrQhlkib0e84XNcJwAzsdSibHCV7VSZVfoR53b70Tg36a400EMic032CeYvhNYv/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 5, 1, 0, '', '2016-03-12 11:29:37', 2, 0, 0, NULL, '2016-03-12 12:05:58');
INSERT INTO `multi_user` VALUES (592, 0, 0, 'ois_bwtvkwkc5sSzQeViKNyf1ntQ', 'Sunrise', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKzibYktDg7lU0vmpp1p0Cia5MntxHGUhyL7iczd2QH2uLWBZG7u9WcNeMv207o1PqmZL8fYAVgt0SUA/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:30:25', 0, 0, 0, NULL, '2016-03-12 11:30:25');
INSERT INTO `multi_user` VALUES (593, 0, 0, 'opi_TwB5sMvVfgFuGhSl-3agUMIU', 'Sunrise', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKzibYktDg7lU0vmpp1p0Cia5MntxHGUhyL7iczd2QH2uLWBZG7u9WcNeMv207o1PqmZL8fYAVgt0SUA/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:30:33', 0, 0, 0, NULL, '2016-03-12 11:30:34');
INSERT INTO `multi_user` VALUES (594, 0, 0, 'ois_bwor4JSodSgb5RCFmC-Qq49Q', '神经病院负责人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYr8RnqCtmxDpqB84IrEBelzO0gccxpEWNzwGKTfQQWWCAyVkhAQ2dahiaOVfGlZUFaWTc2TwkT9PB/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:36:04', 0, 0, 0, NULL, '2016-03-12 11:36:04');
INSERT INTO `multi_user` VALUES (595, 0, 0, 'opi_TwGx2HYGpRjkwCfWMAnXtvBE', '神经病院负责人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYr8RnqCtmxDpqB84IrEBelzO0gccxpEWNzwGKTfQQWWCAyVkhAQ2dahiaOVfGlZUFaWTc2TwkT9PB/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:36:11', 0, 0, 0, NULL, '2016-03-12 11:36:12');
INSERT INTO `multi_user` VALUES (596, 0, 0, 'ois_bwpfEueMTauAnFbA92E84U9g', '袁朗', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjLQyawPeNN5JkyYZLYkqaibhbVvIee6Png1w7LSDXIg9fccibaZxhiaINYRAeibKgu6gnTHJt1OmRpDQhuPGCk7U9z/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:36:11', 0, 0, 0, NULL, '2016-03-12 11:36:11');
INSERT INTO `multi_user` VALUES (597, 0, 0, 'opi_TwPonqL3eUJKFC3UyGqOz40Q', '袁朗', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjLQyawPeNN5JkyYZLYkqaibhbVvIee6Png1w7LSDXIg9fccibaZxhiaINYRAeibKgu6gnTHJt1OmRpDQhuPGCk7U9z/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:36:17', 0, 0, 0, NULL, '2016-03-12 11:36:18');
INSERT INTO `multi_user` VALUES (598, 0, 0, 'opi_TwPw0i1IgGkJ_0vJsGbs4lww', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 11:39:25', 0, 0, 0, NULL, '2016-03-12 11:39:25');
INSERT INTO `multi_user` VALUES (599, 0, 0, 'opi_TwOAywuZlOPKYzZ0le1SYTEA', '佳英', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiadL4LzYUiaWsAJmIOoRSTicmH4Q2ib2SzFUmDyxStKlzElqmcSYicQZbPDwc7HS09Bh4IvOWwSzhibCloaXJqK0L7kW/0', 2, 'Mianyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 11:55:22', 0, 0, 0, NULL, '2016-03-12 11:55:23');
INSERT INTO `multi_user` VALUES (600, 0, 0, 'opi_TwDBUDNpetC_c0o3jGrLjq6s', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 11:55:53', 0, 0, 0, NULL, '2016-03-12 11:55:53');
INSERT INTO `multi_user` VALUES (601, 0, 0, 'ois_bwvMh0oEsJPcbeFyZk9d7-rU', '奔跑者', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybic97E30ug27nXCnFIJHP4m2gynwZbibPG3ZQCckevib1eZt436eiahKxaicL0mpicbicoFSAAMTyjS2eMUHmKKuAMZofk/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 12:09:44', 0, 0, 0, NULL, '2016-03-12 12:09:44');
INSERT INTO `multi_user` VALUES (602, 0, 0, 'ois_bwgBHlqSkvwc4wdDdZjyjZik', '欲握玫瑰，必承其痛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsWmqibuTRCvlNAnk9PlAjPIoBgPbHDoY26KOdBDKFBaBYAGRQjnS7fuHeAG9WocFa7B0JYoCanJF4/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 12:59:53', 0, 0, 0, NULL, '2016-03-12 12:59:53');
INSERT INTO `multi_user` VALUES (603, 0, 0, 'opi_TwE0mgj-2xn02F0V1G8314cM', '欲握玫瑰，必承其痛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsWmqibuTRCvlNAnk9PlAjPIoBgPbHDoY26KOdBDKFBaBYAGRQjnS7fuHeAG9WocFa7B0JYoCanJF4/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 13:00:03', 0, 0, 0, NULL, '2016-03-12 13:00:04');
INSERT INTO `multi_user` VALUES (604, 0, 0, 'ois_bwk4h0il7yp6nODtwLrchfoM', '易小力呀易小力～', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iad9RRLDqC2SIgxnjbTtAcUialNlia1ZScjfenUv3pU6I57gFoibPiboBze52BicpEhdCazCviaF3Qnhc6WWaj0YvicNCwQ/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 13:14:34', 0, 0, 0, NULL, '2016-03-12 13:14:34');
INSERT INTO `multi_user` VALUES (605, 0, 0, 'opi_TwONe5GwWAvM4MMc11Lveztw', '易小力呀易小力～', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iad9RRLDqC2SIgxnjbTtAcUialNlia1ZScjfenUv3pU6I57gFoibPiboBze52BicpEhdCazCviaF3Qnhc6WWaj0YvicNCwQ/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 13:14:39', 0, 0, 0, NULL, '2016-03-12 13:14:40');
INSERT INTO `multi_user` VALUES (606, 0, 0, 'opi_TwDZp8rMqJm9bePczIL-PtHw', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 14:51:51', 0, 0, 0, NULL, '2016-03-12 14:51:51');
INSERT INTO `multi_user` VALUES (607, 0, 0, 'opi_TwEVN46-ch7-RnQESYlQEiaQ', '一指浅水', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Igu9RtDanZUgySHVUvqhIKln1BHkAqSTYwNqIX3dU7ibIyic9KJpyxOIGanJhcP14oRZU4qzvV5NlkpVDoo9vxWe0/0', 1, 'Mianyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 14:58:58', 0, 0, 0, NULL, '2016-03-12 14:58:59');
INSERT INTO `multi_user` VALUES (608, 0, 0, 'opi_TwJv3IubAwBLH9MVJhjy3LrE', '奔跑者', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybic97E30ug27nXCnFIJHP4m2gynwZbibPG3ZQCckevib1eZt436eiahKxaicL0mpicbicoFSAAMTyjS2eMUHmKKuAMZofk/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 15:18:11', 0, 0, 0, NULL, '2016-03-12 15:18:13');
INSERT INTO `multi_user` VALUES (609, 0, 0, 'opi_TwFvOSNJowYR__h2-klaXa7o', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 15:34:45', 0, 0, 0, NULL, '2016-03-12 15:34:45');
INSERT INTO `multi_user` VALUES (610, 0, 0, 'opi_TwNjDuNBtQ0QPSKussLXfXNg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 15:47:04', 0, 0, 0, NULL, '2016-03-12 15:47:04');
INSERT INTO `multi_user` VALUES (611, 0, 0, 'ois_bwj_8xeEc22wD5vqYSXkMDi0', '殷振宇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRdGPW7U2uZcabtleWQOODnlS0BHG0icDmwhHtQRibNJEXzKQiaTkH6ibJU4LYicYTn5YNBXZAHibqLMqc6/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 15:50:40', 0, 0, 0, NULL, '2016-03-12 15:50:40');
INSERT INTO `multi_user` VALUES (612, 0, 0, 'opi_TwD03IjV9HM2HiFOQTATovaU', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 10, 1, 0, '', '2016-03-12 16:18:43', 2, 0, 0, NULL, '2016-03-12 16:26:34');
INSERT INTO `multi_user` VALUES (613, 0, 0, 'opi_TwEHiE__qzF73k-OQUmTlWlk', '殷振宇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRdGPW7U2uZcabtleWQOODnlS0BHG0icDmwhHtQRibNJEXzKQiaTkH6ibJU4LYicYTn5YNBXZAHibqLMqc6/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 16:47:49', 0, 0, 0, NULL, '2016-03-12 16:47:50');
INSERT INTO `multi_user` VALUES (614, 0, 0, 'ois_bwtKmQraISlxVoAs7karQW8I', 'FORGIVE''''-', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AseUxyRcTeibhjqYUYYOLKqPKiabR40fF7xFJeic3kia3TDB0s6xEYUa89MqNgUYFN5GNaZWhNhKSGFJA/0', 2, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 16:54:24', 0, 0, 0, NULL, '2016-03-12 16:54:24');
INSERT INTO `multi_user` VALUES (615, 0, 0, 'opi_TwLxF1-GVKv069ttfn04Yaj8', 'FORGIVE''''-', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AseUxyRcTeibhjqYUYYOLKqPKiabR40fF7xFJeic3kia3TDB0s6xEYUa89MqNgUYFN5GNaZWhNhKSGFJA/0', 2, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 16:54:28', 0, 0, 0, NULL, '2016-03-12 16:54:29');
INSERT INTO `multi_user` VALUES (616, 0, 0, 'opi_TwJIuDkfbHwLV4znGr_SqqcA', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 17:44:29', 0, 0, 0, NULL, '2016-03-12 17:44:29');
INSERT INTO `multi_user` VALUES (617, 0, 0, 'opi_TwDye8TU9XRRpYpnzkBPaAZE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 18:00:42', 0, 0, 0, NULL, '2016-03-12 18:00:42');
INSERT INTO `multi_user` VALUES (618, 0, 0, 'ois_bwhtYHlE_b6Kr0XC068VikWA', 'Hey', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaVgOIOXibqrDdcDic2TSjYo4wQmnJyFS59QaLPP79Rw7q0S48mLNVc4G7nMOkia14A5TDgO9b2b0vNeYNPaiadOnNia/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 18:39:33', 0, 0, 0, NULL, '2016-03-12 18:39:33');
INSERT INTO `multi_user` VALUES (619, 0, 0, 'opi_TwLz2-GBbk1ApXbmJSGoCuxs', 'Hey', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaVgOIOXibqrDdcDic2TSjYo4wQmnJyFS59QaLPP79Rw7q0S48mLNVc4G7nMOkia14A5TDgO9b2b0vNeYNPaiadOnNia/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 18:39:38', 0, 0, 0, NULL, '2016-03-12 18:39:39');
INSERT INTO `multi_user` VALUES (620, 0, 0, 'ois_bwmyQ5b-pB06fOt5nQlKvXMA', '(*¯︶¯*)', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC2DhOYFoQNacIdA1dTdbjjN0s77slzeiamsNfDehORdibzJiadRQicSJSQKsEBTHpib3fOBPUkF59NJFQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:30:37', 0, 0, 0, NULL, '2016-03-12 19:30:37');
INSERT INTO `multi_user` VALUES (621, 0, 0, 'opi_TwFOw6viSVyHDPJ05G1cZIqc', '(*¯︶¯*)', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC2DhOYFoQNacIdA1dTdbjjN0s77slzeiamsNfDehORdibzJiadRQicSJSQKsEBTHpib3fOBPUkF59NJFQ/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:31:02', 0, 0, 0, NULL, '2016-03-12 19:31:03');
INSERT INTO `multi_user` VALUES (622, 0, 0, 'ois_bwsCjHp8-uhNyDzrZ70be2OY', '凯哥', '', '', '', NULL, '', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:33:02', 0, 0, 0, NULL, '2016-03-12 19:33:02');
INSERT INTO `multi_user` VALUES (623, 0, 0, 'opi_TwMGVLyMLhabr7mQmAPZD068', '凯哥', '', '', '', NULL, '', 1, '', '', '', 'zh_CN', 1, 0, 3, 1, 0, '', '2016-03-12 19:33:13', 1, 0, 0, NULL, '2016-03-12 20:07:53');
INSERT INTO `multi_user` VALUES (624, 0, 0, 'ois_bwvvFVjs149T3qLtAODcTBRQ', '一朵芙蓉著秋雨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaPT0BsOsicNYAbiaUup9rVoUoAricp5ia8SQQo0Ew7CsRBNEen2SzpaCWQ1E5HJH2GJHxdRqI3gRgnBThz8yiaIENL9/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:34:16', 0, 0, 0, NULL, '2016-03-12 19:34:16');
INSERT INTO `multi_user` VALUES (625, 0, 0, 'opi_TwB7SWpKYM_1AuNBntvSsEmQ', '一朵芙蓉著秋雨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaPT0BsOsicNYAbiaUup9rVoUoAricp5ia8SQQo0Ew7CsRBNEen2SzpaCWQ1E5HJH2GJHxdRqI3gRgnBThz8yiaIENL9/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:34:22', 0, 0, 0, NULL, '2016-03-12 19:34:23');
INSERT INTO `multi_user` VALUES (626, 0, 0, 'ois_bwkc7MSI2-V7drRWMHt-xHAU', '李阳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDZOgBqmHvS1SLE8ZWPCaoC5oQ0C8xLVqSg0ZlUffZIsDOicics1Z30gwAR5RuMgXuic8jNrGdDvGpiaA/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:40:37', 0, 0, 0, NULL, '2016-03-12 19:40:37');
INSERT INTO `multi_user` VALUES (627, 0, 0, 'opi_TwADNSa--p2QaCu_-nYW6bVk', '李阳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDZOgBqmHvS1SLE8ZWPCaoC5oQ0C8xLVqSg0ZlUffZIsDOicics1Z30gwAR5RuMgXuic8jNrGdDvGpiaA/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:41:08', 0, 0, 0, NULL, '2016-03-12 19:41:09');
INSERT INTO `multi_user` VALUES (628, 0, 0, 'ois_bwicZ6invCXTJBV9Fn_2DPbM', '天兵哥 海济', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqbbDLSwYMHiacUtOBDB6TkGNn9HT5p106NaZVBUR4Q6qf3DGmOLmLazaGMQictEYyjGyiavN64luTDa/0', 1, '乐山', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:49:28', 0, 0, 0, NULL, '2016-03-12 19:49:28');
INSERT INTO `multi_user` VALUES (629, 0, 0, 'opi_TwBSCFPE4hQ_hJSyhg4AfUIY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 19:50:45', 0, 0, 0, NULL, '2016-03-12 19:50:45');
INSERT INTO `multi_user` VALUES (630, 0, 0, 'ois_bwkP01v27dKQvbAICXWHYqGo', 'Sunrise', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadrOibWkxCicsicVMzVIHewtwUicWiah72rVMy2BdiakcU8MfLPkE6d2b5myXPQibic3NwJpcfxZibCQKC1ibtoibS5XwVlTicK/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 19:50:49', 0, 0, 0, NULL, '2016-03-12 19:50:49');
INSERT INTO `multi_user` VALUES (631, 0, 0, 'ois_bwvFoFfVy_CiYg5v1f0VIwWU', '潇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb8EdUXJQ1sm1kKOORsfibYr9ibu1icksItD6H4kmfqyheuSwIKU2X3LLmTXo4icjR0ibPC2ozC2Ab1B0iaIiaibric2ibPGs5/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:23:38', 0, 0, 0, NULL, '2016-03-12 20:23:38');
INSERT INTO `multi_user` VALUES (632, 0, 0, 'opi_TwL2wna0BiZbUUwCa7g24yus', '潇', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAyb8EdUXJQ1sm1kKOORsfibYr9ibu1icksItD6H4kmfqyheuSwIKU2X3LLmTXo4icjR0ibPC2ozC2Ab1B0iaIiaibric2ibPGs5/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:23:51', 0, 0, 0, NULL, '2016-03-12 20:23:53');
INSERT INTO `multi_user` VALUES (633, 0, 0, 'ois_bwtxkJDPPW886Im6s9tEYKTI', '雪', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyceHgia8zr057AbXAt6NLliacnenmTQ1ykSPd4MfEtXnuYrEeVudWFYiaoibSjY2QU2U2S5PN039ykRC/0', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:30:54', 0, 0, 0, NULL, '2016-03-12 20:30:54');
INSERT INTO `multi_user` VALUES (634, 0, 0, 'opi_TwDzTKEqbQleRDso0vCAWhQE', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-12 20:44:53', 0, 0, 0, NULL, '2016-03-12 20:44:53');
INSERT INTO `multi_user` VALUES (635, 0, 0, 'ois_bwuWMdbQ1mHoiUwmGiNvH_lA', '晴天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRbh59Txg92KmF8xFn6828IjiaWicOjGSJonNk1jqEiczhuBKIWgs2DhOquPdtEnhsqXb47qSMC2SZg2/0', 1, '内江', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:49:17', 0, 0, 0, NULL, '2016-03-12 20:49:17');
INSERT INTO `multi_user` VALUES (636, 0, 0, 'opi_TwF5--2_7vsZXTur_HcKbhxw', '晴天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRbh59Txg92KmF8xFn6828IjiaWicOjGSJonNk1jqEiczhuBKIWgs2DhOquPdtEnhsqXb47qSMC2SZg2/0', 1, 'Neijiang', 'Sichuan', '', 'zh_CN', 1, 0, 5, 1, 0, '', '2016-03-12 20:49:22', 2, 0, 0, NULL, '2016-03-12 21:17:56');
INSERT INTO `multi_user` VALUES (637, 0, 0, 'ois_bwrI4l5TfITCdCLn4WK8d53Q', '欣语', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyXzr12oGUW5xgT0hdN5sH9r0ysAicIJoiczDcaUlH5eBjjJAlCfUjNuR6gjejOA6uXRAs2n9EicdH3C/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:55:57', 0, 0, 0, NULL, '2016-03-12 20:55:57');
INSERT INTO `multi_user` VALUES (638, 0, 0, 'ois_bwnh55-vCuVkqTfgCGhXIqXM', '刘燕枚', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYiaSn7KsvOiaAdxiasQMQEE63Yvy3nNsP9gQ9PhmfLzsykJ9WTCFku2Rv9fm79q9tqRNJlXiaxH9d8Ou/0', 2, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:56:03', 0, 0, 0, NULL, '2016-03-12 20:56:03');
INSERT INTO `multi_user` VALUES (639, 0, 0, 'opi_TwKR2AJHhbbVDbASp5bjsQcM', '刘燕枚', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYiaSn7KsvOiaAdxiasQMQEE63Yvy3nNsP9gQ9PhmfLzsykJ9WTCFku2Rv9fm79q9tqRNJlXiaxH9d8Ou/0', 2, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:56:07', 0, 0, 0, NULL, '2016-03-12 20:56:08');
INSERT INTO `multi_user` VALUES (640, 0, 0, 'ois_bwqOroqJLZUj0jhItWl8YArA', '任鑫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnmQjKwb8uicfy7OzClL3icCqsGMFVEHmcGFgDCUJCkA8loaKSjpmnqHusVeFjqibb09BsOVUhe7C5puQTp68UA0Zj/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:59:31', 0, 0, 0, NULL, '2016-03-12 20:59:31');
INSERT INTO `multi_user` VALUES (641, 0, 0, 'opi_TwLWa2iBhOFBOgpAeq8GH3u0', '任鑫', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnmQjKwb8uicfy7OzClL3icCqsGMFVEHmcGFgDCUJCkA8loaKSjpmnqHusVeFjqibb09BsOVUhe7C5puQTp68UA0Zj/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 20:59:41', 0, 0, 0, NULL, '2016-03-12 20:59:42');
INSERT INTO `multi_user` VALUES (642, 0, 0, 'ois_bwgolmWsmRYEhH8ran7Xt7Dc', '活腻了的番茄', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4N5DNwNIs3JAficGAJPWgREt2N4dSVFsN8Eo6iaceia0lp4IE7MWKYABicuuSBAqgDtFFaa7aOvC98F6ERw0XeB1lcWzG23zYvFYw/0', 2, '眉山', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 21:00:55', 0, 0, 0, NULL, '2016-03-12 21:00:55');
INSERT INTO `multi_user` VALUES (643, 0, 0, 'opi_TwEkXWRX-STJ-Jb1GHQ-Ux0s', '活腻了的番茄', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4N5DNwNIs3JAficGAJPWgREt2N4dSVFsN8Eo6iaceia0lp4IE7MWKYABicuuSBAqgDtFFaa7aOvC98F6ERw0XeB1lcWzG23zYvFYw/0', 2, 'Meishan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 21:01:01', 0, 0, 0, NULL, '2016-03-12 21:01:02');
INSERT INTO `multi_user` VALUES (644, 0, 0, 'ois_bwpDFSNlvVnVp-sw3Vw_HDc0', 'hold不住的心', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/uHTAvha8wDiaDuy1ibVT1bZwQFDQDicC4vVjER3kbxZSfHGKjJxmlrzC3d6XG0eDK6nkLBsOh78J817kU2S1mE8pibvr6IjqSQmp/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 21:13:44', 0, 0, 0, NULL, '2016-03-12 21:13:44');
INSERT INTO `multi_user` VALUES (645, 0, 0, 'ois_bwlB9x07IlbenaHM3kdSN9nY', 'C。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmAquicBLicKOuypKMoew6VZklbib8SicpeVjeK6VlOl6MOJTXPgAaFVNbVh52hAzNY3hXibFrnFjQaxPFtxcbibcfJlw/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-12 21:37:42', 0, 0, 0, NULL, '2016-03-12 21:37:42');
INSERT INTO `multi_user` VALUES (646, 0, 0, 'opi_TwFKGqZs3Afj-2yZ8nTh3wAw', 'C。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL4y5J55lrTKywHrsjibstmsegWWCQnITr9FRXh90cIDekibvhWxxJglWLcsJQiacJWIfTic5GkJjuJc7aM7o4P0RAa83039aoW2AE/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 2, 1, 0, '', '2016-03-12 21:37:47', 2, 0, 0, NULL, '2016-03-13 21:55:51');
INSERT INTO `multi_user` VALUES (647, 0, 0, 'opi_TwEA-PpBpq6cg3aTfWeMmQtY', '天兵哥 海济', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqbbDLSwYMHiacUtOBDB6TkGNn9HT5p106NaZVBUR4Q6qf3DGmOLmLazaGMQictEYyjGyiavN64luTDa/0', 1, 'Leshan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 07:45:43', 0, 0, 0, NULL, '2016-03-13 07:45:43');
INSERT INTO `multi_user` VALUES (648, 0, 0, 'opi_TwAFVa86AhhrfbBv26NVqdDs', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 08:03:52', 0, 0, 0, NULL, '2016-03-13 08:03:52');
INSERT INTO `multi_user` VALUES (649, 0, 0, 'opi_TwIHFmlp9Rux32GMx8nSaE4E', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 08:42:13', 0, 0, 0, NULL, '2016-03-13 08:42:13');
INSERT INTO `multi_user` VALUES (650, 0, 0, 'opi_TwDDMts7i7eHdNsAT-2yXIJc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 08:53:25', 0, 0, 0, NULL, '2016-03-13 08:53:25');
INSERT INTO `multi_user` VALUES (651, 0, 0, 'opi_TwC19RIbGPWVQD1ccyYoixRI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 08:58:34', 0, 0, 0, NULL, '2016-03-13 08:58:34');
INSERT INTO `multi_user` VALUES (652, 0, 0, 'opi_TwEQmOdrFeWBc-VVtlIRbcT4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 09:01:36', 0, 0, 0, NULL, '2016-03-13 09:01:36');
INSERT INTO `multi_user` VALUES (653, 0, 0, 'opi_TwETSVtOaX5gaEqWIPDnDJgs', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 09:14:30', 1, 0, 0, NULL, '2016-03-13 11:45:22');
INSERT INTO `multi_user` VALUES (654, 0, 0, 'opi_TwBi8j58urWW0zJcOCcDCwYM', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 09:22:04', 0, 0, 0, NULL, '2016-03-13 09:22:04');
INSERT INTO `multi_user` VALUES (655, 0, 0, 'opi_TwBwTvWhV2fAR_QpUFHVe8qQ', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 09:45:43', 0, 0, 0, NULL, '2016-03-13 09:45:43');
INSERT INTO `multi_user` VALUES (656, 0, 0, 'opi_TwD_xibVnk7k9WF4vQFMJWRc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 10:12:19', 0, 0, 0, NULL, '2016-03-13 10:12:19');
INSERT INTO `multi_user` VALUES (657, 0, 0, 'opi_TwISMKlsoS0tN2ThDrdEqiLI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 10:20:11', 0, 0, 0, NULL, '2016-03-13 10:20:11');
INSERT INTO `multi_user` VALUES (658, 0, 0, 'opi_TwFW4TWwPphS0oCanQ4l0DpY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 10:32:37', 0, 0, 0, NULL, '2016-03-13 10:32:37');
INSERT INTO `multi_user` VALUES (659, 0, 0, 'ois_bwoh5_ATARWjopG3ojsJ8sMU', '好好活', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCaXl8SSetycO11VibVQRoLca5XOloP4ricfWSlXzkCDqWZM66thR4CtBSGELs2kkKgFxKBkVD4Q3TA/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 10:46:35', 0, 0, 0, NULL, '2016-03-13 10:46:35');
INSERT INTO `multi_user` VALUES (660, 0, 0, 'ois_bwhQbLUZxae7ecwX4H7IuumY', '啦啦啦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqQicGTYrRwL5oqicmtf46nlBoTxumoM5rtkVvdtW7lCx025aP4H7UXib0dEusmpokNRQrZKflgXjRxP/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 10:52:59', 0, 0, 0, NULL, '2016-03-13 10:52:59');
INSERT INTO `multi_user` VALUES (661, 0, 0, 'opi_TwF-k3QHgGZMnniIh7GmohiI', '啦啦啦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/urC1LWEaQrkVTZAicWICdqQicGTYrRwL5oqicmtf46nlBoTxumoM5rtkVvdtW7lCx025aP4H7UXib0dEusmpokNRQrZKflgXjRxP/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 10:53:09', 0, 0, 0, NULL, '2016-03-13 10:53:10');
INSERT INTO `multi_user` VALUES (662, 0, 0, 'opi_TwDCuQX_i0_eIKzDJUEOE5jg', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 11:08:54', 0, 0, 0, NULL, '2016-03-13 11:08:54');
INSERT INTO `multi_user` VALUES (663, 0, 0, 'ois_bws09aqbLYE2L0I6OWw_kZLU', '梧雨锐', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacsg71rNibm2PPbCZkFSjPAPJOTEibqiaAC9LuEWBEG2hTXApe0A24MD0cUEQtO0xZxzhZ7LZI5aY0bp8LHdqBq2ibD/0', 1, '悉尼', '新南威尔士', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-13 11:23:29', 0, 0, 0, NULL, '2016-03-13 11:24:03');
INSERT INTO `multi_user` VALUES (664, 0, 0, 'opi_TwBF6h-aepioKpSRZTe0OV4s', '梧雨锐', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacsg71rNibm2PPbCZkFSjPAPJOTEibqiaAC9LuEWBEG2hTXApe0A24MD0cUEQtO0xZxzhZ7LZI5aY0bp8LHdqBq2ibD/0', 1, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:23:34', 0, 0, 0, NULL, '2016-03-13 11:23:35');
INSERT INTO `multi_user` VALUES (665, 0, 0, 'ois_bwhyKh5SwaPISwut6xehnutY', '优乐多', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyekMYc8nsnQcsmVttPAMMyKYoNUEHWfZDglzX08WN3YQ4I29xCEG8FHyDquickg9d34pnL0p9QbVib/0', 1, '绵阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:24:55', 0, 0, 0, NULL, '2016-03-13 11:24:55');
INSERT INTO `multi_user` VALUES (666, 0, 0, 'opi_TwPbHcGVFhWN9ALqCHpgqScM', '优乐多', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyekMYc8nsnQcsmVttPAMMyKYoNUEHWfZDglzX08WN3YQ4I29xCEG8FHyDquickg9d34pnL0p9QbVib/0', 1, 'Mianyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:25:06', 0, 0, 0, NULL, '2016-03-13 11:25:07');
INSERT INTO `multi_user` VALUES (667, 0, 0, 'ois_bwhZePRsq027xeGAhekzsXsI', '☞♚☜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafqmgSCe52qUGwaDpH2BT5UgVdtxC948Khrd7ySS14wDWOAaEJ9VAcKUkQX1MpMxiblrmFDmvwXfNASQ0aMoz7ib4/0', 1, '广元', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:25:59', 0, 0, 0, NULL, '2016-03-13 11:25:59');
INSERT INTO `multi_user` VALUES (668, 0, 0, 'opi_TwD4h69tYP8xl2X8E3_SzHl8', '☞♚☜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafqmgSCe52qUGwaDpH2BT5UgVdtxC948Khrd7ySS14wDWOAaEJ9VAcKUkQX1MpMxiblrmFDmvwXfNASQ0aMoz7ib4/0', 1, 'Guangyuan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:26:12', 0, 0, 0, NULL, '2016-03-13 11:26:14');
INSERT INTO `multi_user` VALUES (669, 0, 0, 'ois_bwhs1qmaCiKa94co7KizC-3Y', '小☆俊', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iae3e1H4WFlLOW7qgXq1vic7JEr4z0f4x7KHnmmhbxJ6ic8yfzibgbvVle6OhbSSnBklmWIgkFPbyKzFQ/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:27:44', 0, 0, 0, NULL, '2016-03-13 11:27:44');
INSERT INTO `multi_user` VALUES (670, 0, 0, 'ois_bwtbHdZ2I2vxb_l0lGNLkSAk', 'Encroa', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD8RZkc7VlMLhqQlFEuCUialqZ9VJ1hLFFLnx81tWVIgLxHLadPRiaSsPQyCZPe94GuFY61T8Twly3w/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:28:05', 0, 0, 0, NULL, '2016-03-13 11:28:05');
INSERT INTO `multi_user` VALUES (671, 0, 0, 'opi_TwNLxXD-P2CHU4wQk28LE9Q0', 'Encroa', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD8RZkc7VlMLhqQlFEuCUialqZ9VJ1hLFFLnx81tWVIgLxHLadPRiaSsPQyCZPe94GuFY61T8Twly3w/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:28:40', 0, 0, 0, NULL, '2016-03-13 11:28:41');
INSERT INTO `multi_user` VALUES (672, 0, 0, 'ois_bwsnfmVTDD27xvaQjJ8oECoc', 'M丶雨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AscxtibnXZckiaMSZ27wOupbic9AiaCddfaQgWWUXduO7SOEBjlpM8f1UY9M3JJmJHI6oBTWPXqX5Od0M/0', 1, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:33:19', 0, 0, 0, NULL, '2016-03-13 11:33:19');
INSERT INTO `multi_user` VALUES (673, 0, 0, 'opi_TwFbO2WGhp2G1GUAP9EE9-fo', 'M丶雨', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AscxtibnXZckiaMSZ27wOupbic9AiaCddfaQgWWUXduO7SOEBjlpM8f1UY9M3JJmJHI6oBTWPXqX5Od0M/0', 1, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:33:28', 0, 0, 0, NULL, '2016-03-13 11:34:02');
INSERT INTO `multi_user` VALUES (674, 0, 0, 'ois_bwu7zH4qNVnwIkEYAfV7xz-E', '波波·学长', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkdJDWbic3PNJUvYX3c7qPTCA7fdFHjOO6Oe324pqCMexPjicpgVkgsSh9a1XOuy1bK0xXwJibg5jvgmx5jBDaKib9J/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:34:40', 0, 0, 0, NULL, '2016-03-13 11:34:40');
INSERT INTO `multi_user` VALUES (675, 0, 0, 'opi_TwDQkLmVTXXXYzndNQF2dvKo', '波波·学长', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkdJDWbic3PNJUvYX3c7qPTCA7fdFHjOO6Oe324pqCMexPjicpgVkgsSh9a1XOuy1bK0xXwJibg5jvgmx5jBDaKib9J/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:34:57', 0, 0, 0, NULL, '2016-03-13 11:34:59');
INSERT INTO `multi_user` VALUES (676, 0, 0, 'ois_bwox0uDohOV_V1ObTpyWjY6w', '追寻光的年', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmTXo86fntleZ3xicPVKiaX9lztEibHibC5nK9AqWSJ3KjicgHdooLVLcIJ4haSULg7crK6AvsVg8GtQtrvCjdL6UmRX/0', 1, '达州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:37:35', 0, 0, 0, NULL, '2016-03-13 11:37:35');
INSERT INTO `multi_user` VALUES (677, 0, 0, 'opi_TwP5Ow57L33JJdLOcboKlt3c', '追寻光的年', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmTXo86fntleZ3xicPVKiaX9lztEibHibC5nK9AqWSJ3KjicgHdooLVLcIJ4haSULg7crK6AvsVg8GtQtrvCjdL6UmRX/0', 1, 'Florida', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:37:53', 0, 0, 0, NULL, '2016-03-13 11:37:54');
INSERT INTO `multi_user` VALUES (678, 0, 0, 'ois_bwvyk4PIMXSr3LgGSRd_OT5I', 'what''s up!', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacJ2DJdfQg8RchdedicNwiciay2l5RTgg62eghIdViaDf1pnoW5pGoIYUTAcR0P4kP35gFteMQyOofQicbe09BJaAgr8/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:40:21', 0, 0, 0, NULL, '2016-03-13 11:40:21');
INSERT INTO `multi_user` VALUES (679, 0, 0, 'opi_TwCM5-sdMnTf7jZKSlZmNIJ4', 'what''s up!', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iacJ2DJdfQg8RchdedicNwiciay2l5RTgg62eghIdViaDf1pnoW5pGoIYUTAcR0P4kP35gFteMQyOofQicbe09BJaAgr8/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:40:27', 0, 0, 0, NULL, '2016-03-13 11:40:28');
INSERT INTO `multi_user` VALUES (680, 0, 0, 'ois_bwkoF0-8G_FvS-QAfPA6csuo', '心亦凡物', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClcavqmJW1JGJNuFpn88okFvGwI4XCcHKXLrhR2ozIDpcxlnZXDHvfLp3CpwgCNwDMhAG17soNKB8MH3bxr2R9J/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:47:22', 0, 0, 0, NULL, '2016-03-13 11:47:22');
INSERT INTO `multi_user` VALUES (681, 0, 0, 'opi_TwETmjXL7YevFG0sEUrF8Z3M', '心亦凡物', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClcavqmJW1JGJNuFpn88okFvGwI4XCcHKXLrhR2ozIDpcxlnZXDHvfLp3CpwgCNwDMhAG17soNKB8MH3bxr2R9J/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:47:37', 0, 0, 0, NULL, '2016-03-13 11:47:38');
INSERT INTO `multi_user` VALUES (682, 0, 0, 'ois_bwnG_NOIa3WVeSi2nMPRgUx8', 'Hz', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmpbHqxsiaw2NORTS2MxpnyOMeEbHcS15k4V7ia7sMa4o1nJ434oicDObRdhCWjHX9QMtMbkpy1EhNnF8ybjBiaWBJJ/0', 1, '广安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:56:26', 0, 0, 0, NULL, '2016-03-13 11:56:26');
INSERT INTO `multi_user` VALUES (683, 0, 0, 'opi_TwO-Xb7Ed8IDfbPrmbxittzE', 'Hz', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmpbHqxsiaw2NORTS2MxpnyOMeEbHcS15k4V7ia7sMa4o1nJ434oicDObRdhCWjHX9QMtMbkpy1EhNnF8ybjBiaWBJJ/0', 1, 'Kwong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 11:56:37', 0, 0, 0, NULL, '2016-03-13 11:56:41');
INSERT INTO `multi_user` VALUES (684, 0, 0, 'ois_bwnirvhomhv-dT19XR4iZf4I', '强宝。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhSMWicWjZpkhnBaxzPicmh0RoZcF5ibK9ESlA2KY8xAZu5J8eB3ShcUIuhiaBBmS2iaqKESwbibraxuTskOYxnHGe3uP/0', 1, '厦门', '福建', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 12:19:56', 0, 0, 0, NULL, '2016-03-13 12:19:56');
INSERT INTO `multi_user` VALUES (685, 0, 0, 'ois_bwv0_mq8sucAs6sY3R9C7jls', '伊贰乙', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYp0AbicZNCFtG12VJicvEdibm8ojZvxIicNOtPKIHT64Z2ibxxf108odLPhk8sicjn7x8u6aEzdZ7Vwc3K/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 12:25:50', 0, 0, 0, NULL, '2016-03-13 12:25:50');
INSERT INTO `multi_user` VALUES (686, 0, 0, 'opi_TwEiM5vE4IrEYh1tQDfxerOI', '伊贰乙', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYp0AbicZNCFtG12VJicvEdibm8ojZvxIicNOtPKIHT64Z2ibxxf108odLPhk8sicjn7x8u6aEzdZ7Vwc3K/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 12:25:56', 0, 0, 0, NULL, '2016-03-13 12:25:57');
INSERT INTO `multi_user` VALUES (687, 0, 0, 'opi_TwJWWhpeW9h5IWjtyUNd-6ak', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 12:34:28', 0, 0, 0, NULL, '2016-03-13 12:34:28');
INSERT INTO `multi_user` VALUES (688, 0, 0, 'opi_TwBUwLuAvIPrJDGT1AyGnel0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 12:49:03', 0, 0, 0, NULL, '2016-03-13 12:49:03');
INSERT INTO `multi_user` VALUES (689, 0, 0, 'ois_bwu11dGuF-jnMVrSfmK_sktU', '周星星', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybicGU5iahPXwjpAl9AiaRoFibliaIvSDnGVcbuwVOFNqhySpIgY7D4bajCozSibwSTicH9iam0jQPJKLVqcFzE7fz3kC88a/0', 1, '', '安徽', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:11:19', 0, 0, 0, NULL, '2016-03-13 13:11:19');
INSERT INTO `multi_user` VALUES (690, 0, 0, 'opi_TwCxCzRfwSV3cF1fMe445tRQ', '周星星', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybicGU5iahPXwjpAl9AiaRoFibliaIvSDnGVcbuwVOFNqhySpIgY7D4bajCozSibwSTicH9iam0jQPJKLVqcFzE7fz3kC88a/0', 1, '', 'Anhui', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:11:41', 0, 0, 0, NULL, '2016-03-13 13:11:43');
INSERT INTO `multi_user` VALUES (691, 0, 0, 'ois_bwlt2bc1af_nfEKWTEQ6ImO8', '他的梦，晚安', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyTRkIdUeak4ia70Fd6sicA4ibJuF4oJGcOfAV2Jqo1OYzdM6xh95icFZQQfJ7MTWeBzhqWTaP6OuDcW8/0', 2, '', '布尔根兰', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:21:06', 0, 0, 0, NULL, '2016-03-13 13:21:06');
INSERT INTO `multi_user` VALUES (692, 0, 0, 'opi_TwKQh5u98le1MlSAb7HbzTwU', '他的梦，晚安', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyTRkIdUeak4ia70Fd6sicA4ibJuF4oJGcOfAV2Jqo1OYzdM6xh95icFZQQfJ7MTWeBzhqWTaP6OuDcW8/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:21:11', 0, 0, 0, NULL, '2016-03-13 13:21:12');
INSERT INTO `multi_user` VALUES (693, 0, 0, 'ois_bwpUydh4rIdE8KXPr-8bTlGA', 'dsjjj', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOZdyEiclXj4V2MTiaM8iaaFNFOfib0J0uwLpOUCdicWvYIdILnS7aIUiarNeQgWR2ia2duUrV7akoWIhukw/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:23:15', 0, 0, 0, NULL, '2016-03-13 13:23:15');
INSERT INTO `multi_user` VALUES (694, 0, 0, 'opi_TwDS8M6T5GGCR7poPUeQdzaw', 'dsjjj', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOZdyEiclXj4V2MTiaM8iaaFNFOfib0J0uwLpOUCdicWvYIdILnS7aIUiarNeQgWR2ia2duUrV7akoWIhukw/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:23:21', 0, 0, 0, NULL, '2016-03-13 13:23:22');
INSERT INTO `multi_user` VALUES (695, 0, 0, 'opi_TwO4ZKQ22jQIOZ_Qxs1X0AL0', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 13:27:01', 0, 0, 0, NULL, '2016-03-13 13:27:01');
INSERT INTO `multi_user` VALUES (696, 0, 0, 'opi_TwMPxdLY2seYGF5auQ5U6S74', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 13:35:01', 0, 0, 0, NULL, '2016-03-13 13:35:01');
INSERT INTO `multi_user` VALUES (697, 0, 0, 'opi_TwEHSuchsFchGatU6aNQU2pY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 13:40:08', 0, 0, 0, NULL, '2016-03-13 13:40:08');
INSERT INTO `multi_user` VALUES (698, 0, 0, '', 'l227887', '13157659413', '', '15ebaaab06bebefad9849fd355b5ba8e', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 13:42:43', 0, 2, 0, NULL, '2016-03-13 13:42:43');
INSERT INTO `multi_user` VALUES (699, 0, 0, 'ois_bwkHgFFfIy6dVgOkdctuB8Hw', '文兵', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOf2amQDgeNzvmw3AQQ4nNVMe5Ut9Ac367CRVmGmOB3gkbau3DsP1ibC5s0u6fPJflqJUicsVb8ic0tr/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:47:29', 0, 0, 0, NULL, '2016-03-13 13:47:29');
INSERT INTO `multi_user` VALUES (700, 0, 0, 'opi_TwPUQ7SUIpr6-gxzYDmfv6oE', '文兵', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOf2amQDgeNzvmw3AQQ4nNVMe5Ut9Ac367CRVmGmOB3gkbau3DsP1ibC5s0u6fPJflqJUicsVb8ic0tr/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 13:47:33', 0, 0, 0, NULL, '2016-03-13 13:47:34');
INSERT INTO `multi_user` VALUES (701, 0, 0, 'opi_TwPjl3lZNaCCIDM8GpUorwnk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 13:59:20', 1, 0, 0, NULL, '2016-03-13 19:52:06');
INSERT INTO `multi_user` VALUES (702, 0, 0, 'opi_TwD3qI3x67aAtMtlg0CZY_Bk', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 14:01:32', 0, 0, 0, NULL, '2016-03-13 14:01:32');
INSERT INTO `multi_user` VALUES (703, 0, 0, 'ois_bwif3iuyx8fS5sfXpdOaOsmc', '金沙童话', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iiac84HHUib5UxW9HRVmpd6ZkMsM2GTuM8lWHfHrPwPNCLmb1OM9Te7H3zBpibrHSDArnIbSNYQe83BU7PIw7ljaxI/0', 1, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:13:05', 0, 0, 0, NULL, '2016-03-13 14:13:05');
INSERT INTO `multi_user` VALUES (704, 0, 0, 'opi_TwMcWjy6wkErRTLLs91iVEpo', '金沙童话', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Iiac84HHUib5UxW9HRVmpd6ZkMsM2GTuM8lWHfHrPwPNCLmb1OM9Te7H3zBpibrHSDArnIbSNYQe83BU7PIw7ljaxI/0', 1, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:15:56', 0, 0, 0, NULL, '2016-03-13 14:15:57');
INSERT INTO `multi_user` VALUES (705, 0, 0, 'ois_bwq1HoxG3423tjdYsEGWqC5w', '终点不明沿途风景', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7aibTP1BfaAqNU8lSHFGAEdj8XU1f9OYCFIdDVIO9mVEuILaJR3vsTLxiasRmfxBSVldIIO3sUlRwRW/0', 1, '九龙城区', '香港', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:42:51', 0, 0, 0, NULL, '2016-03-13 14:42:51');
INSERT INTO `multi_user` VALUES (706, 0, 0, 'opi_TwN4i0vnIlut1igYdhLodyTc', '终点不明沿途风景', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RIKTZdhRD1UTM5eCOUp7aibTP1BfaAqNU8lSHFGAEdj8XU1f9OYCFIdDVIO9mVEuILaJR3vsTLxiasRmfxBSVldIIO3sUlRwRW/0', 1, 'Kowloon City', 'Hong Kong', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:42:57', 0, 0, 0, NULL, '2016-03-13 14:42:58');
INSERT INTO `multi_user` VALUES (707, 0, 0, 'ois_bwpR8-TXQzXK2-BM1m7Adu6E', '饭饭', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYpQq3D1UYbI5G4Nb7HOv77CMwQLRRXIUvYoyaGAZEAwonH9NfY1ZfYfamnesph0HSOHjIVrH7a0R/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:42:57', 0, 0, 0, NULL, '2016-03-13 14:42:57');
INSERT INTO `multi_user` VALUES (708, 0, 0, 'opi_TwFZkhtlp5sB5bqlVR9BOXSQ', '饭饭', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYpQq3D1UYbI5G4Nb7HOv77CMwQLRRXIUvYoyaGAZEAwonH9NfY1ZfYfamnesph0HSOHjIVrH7a0R/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:43:07', 0, 0, 0, NULL, '2016-03-13 14:43:08');
INSERT INTO `multi_user` VALUES (709, 0, 0, 'ois_bwl1oqMXiTpDst4r54t7NPKM', '阿九丶根本瘦不下来', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRXRgxpDyibIGxLiaOPokACq1sIgMA6KoPhtV2XUMSTHYGAP6souuuKEI8cUlFWOia62XtRb1ArYMNPm/0', 2, '', '劳斯', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 14:48:34', 0, 0, 0, NULL, '2016-03-13 14:48:34');
INSERT INTO `multi_user` VALUES (710, 0, 0, 'opi_TwLss-Po1LSDER_FVpylcO0o', '阿九丶根本瘦不下来', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRXRgxpDyibIGxLiaOPokACq1sIgMA6KoPhtV2XUMSTHYGAP6souuuKEI8cUlFWOia62XtRb1ArYMNPm/0', 2, '', '', '', 'zh_CN', 1, 0, 8, 1, 0, '', '2016-03-13 14:48:49', 2, 0, 0, NULL, '2016-03-13 14:53:28');
INSERT INTO `multi_user` VALUES (711, 0, 0, 'ois_bwq1sm0ujNDuzIrPTFQX9xJQ', '李丽婷jy', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhdEdHE3M23x0ym62XBWTKZuIcg6E1PPibCUsASfOpiaeqlBEiasay1Vgjc3t0WeiaMV8b3suWr0pMwjxvbcUNZB3UQ/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:00:48', 0, 0, 0, NULL, '2016-03-13 15:00:48');
INSERT INTO `multi_user` VALUES (712, 0, 0, 'opi_TwOPjg78WnZdIRhS-FmIqu9M', '李丽婷jy', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhdEdHE3M23x0ym62XBWTKZuIcg6E1PPibCUsASfOpiaeqlBEiasay1Vgjc3t0WeiaMV8b3suWr0pMwjxvbcUNZB3UQ/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:00:55', 0, 0, 0, NULL, '2016-03-13 15:00:56');
INSERT INTO `multi_user` VALUES (713, 0, 0, 'ois_bwhYGDBuEWbT3caBczs9wd2M', '看不见', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pBsIAOolXaf9hjSib3vfotA39icSwxNnhX2QZAk4PyL0rDEQTweLhOduc8VBLf6rFnQweeg7icqPOJKZmWprAibjPoZU0iagY81hA/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:03:03', 0, 0, 0, NULL, '2016-03-13 15:03:03');
INSERT INTO `multi_user` VALUES (714, 0, 0, 'opi_TwAhDdv6O4ZpK1okjTrA9pgI', '看不见', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pBsIAOolXaf9hjSib3vfotA39icSwxNnhX2QZAk4PyL0rDEQTweLhOduc8VBLf6rFnQweeg7icqPOJKZmWprAibjPoZU0iagY81hA/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:03:11', 0, 0, 0, NULL, '2016-03-13 15:03:12');
INSERT INTO `multi_user` VALUES (715, 0, 0, 'ois_bwg19OqOcq2_3vEJDl1H8pMA', '蓝卿', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYkYuGproSev2Y4VpHCCF1qXm0jhEBQqDeat3n7YfTDYiam5pnc3HO2qkpKmwOVEFTtw230588S4lb/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:06:56', 0, 0, 0, NULL, '2016-03-13 15:06:56');
INSERT INTO `multi_user` VALUES (716, 0, 0, 'opi_TwOX02qWgu8e56rlL8M3oXds', '蓝卿', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiayMiciaTicqiajYkYuGproSev2Y4VpHCCF1qXm0jhEBQqDeat3n7YfTDYiam5pnc3HO2qkpKmwOVEFTtw230588S4lb/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:07:03', 0, 0, 0, NULL, '2016-03-13 15:07:04');
INSERT INTO `multi_user` VALUES (717, 0, 0, 'ois_bwsZ3Vnm_tvHUu9PD8w0X76A', '陪你一起。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsZ0vC9aFZMa8FQ7GToH8pR8cupbML3yib3JCUbF5ib6M2mzLymVqKyic3eJcyLcecSIZFqNftn1ic6kS/0', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:40:01', 0, 0, 0, NULL, '2016-03-13 15:40:01');
INSERT INTO `multi_user` VALUES (718, 0, 0, 'opi_TwOI4JGBa_E1fqCm_3Wg2ibA', '陪你一起。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsZ0vC9aFZMa8FQ7GToH8pR8cupbML3yib3JCUbF5ib6M2mzLymVqKyic3eJcyLcecSIZFqNftn1ic6kS/0', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 15:40:07', 0, 0, 0, NULL, '2016-03-13 15:40:09');
INSERT INTO `multi_user` VALUES (719, 0, 0, 'ois_bwl33pGTX6_9m9PHaBJK9OeI', '心瑶—非你莫属', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnQASU2RvTXfUWmmDvKRrfwO8IVIh1icTOf05o8X5Oj7NT04ibO7Om8vNlnSYZANK6icymoWL6hCYLfLsP1HpxYCZr/0', 1, '成都', '四川', '', 'zh_CN', 0, 0, 0, 1, 0, '', '2016-03-13 15:44:44', 0, 0, 0, NULL, '2016-03-13 21:56:38');
INSERT INTO `multi_user` VALUES (720, 0, 0, 'ois_bwjPSZHai_HHj0tB6mqTNS4E', '吴尼玛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRYq2cPNuTAlshiajYZRa33kR2nRI76picfCkr7O80tz8JHRMpNN2Z1kbAHwEXnVT5lquPuBhLugBB4/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:03:00', 0, 0, 0, NULL, '2016-03-13 16:03:00');
INSERT INTO `multi_user` VALUES (721, 0, 0, 'opi_TwF3W_iTbyIkE3SJ9NhVqwQU', '吴尼玛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRYq2cPNuTAlshiajYZRa33kR2nRI76picfCkr7O80tz8JHRMpNN2Z1kbAHwEXnVT5lquPuBhLugBB4/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:03:04', 0, 0, 0, NULL, '2016-03-13 16:03:06');
INSERT INTO `multi_user` VALUES (722, 0, 0, 'opi_TwDqEIdYrIWL6Hnugqa5ieAY', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 16:05:11', 0, 0, 0, NULL, '2016-03-13 16:05:11');
INSERT INTO `multi_user` VALUES (723, 0, 0, 'ois_bwjyy_zwsJz2SjXc3nvnkfvQ', '孤雁', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/jhhKw5fEYakdqNjPUDgnCDW5Wpukwk25mUFZ4eC69fld5jSo3hOe5UbVISdUrdB1Envz82BDrwJKUBmRHUwHmTPTrEQBujZG/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:10:08', 0, 0, 0, NULL, '2016-03-13 16:10:08');
INSERT INTO `multi_user` VALUES (724, 0, 0, 'opi_TwIZd8cXUfizZWdL4wP7exrs', '孤雁', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/jhhKw5fEYakdqNjPUDgnCDW5Wpukwk25mUFZ4eC69fld5jSo3hOe5UbVISdUrdB1Envz82BDrwJKUBmRHUwHmTPTrEQBujZG/0', 1, 'Nanchong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:10:13', 0, 0, 0, NULL, '2016-03-13 16:10:15');
INSERT INTO `multi_user` VALUES (725, 0, 0, 'ois_bwmJ2bhfgf6ClfSTLFhzQ8bg', '。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaaicCBFcOmmnrwL32NUImVCHYeWU4Cz3HRNhNMxzZFeicwrpx6dsLpYJbdakk094uXpMjWUCfOY9FWOzVByMb2iaP/0', 2, '眉山', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:12:49', 0, 0, 0, NULL, '2016-03-13 16:12:49');
INSERT INTO `multi_user` VALUES (726, 0, 0, 'ois_bwptNmO3D5s95b4rOGn-6DN8', '假小人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOUOicFnhxoVuOlvOy35wxhK0stxIbru0tibCXpkLbGyWUxkY3nLDefKm0YVNjmv32Tibynib0ib2IKruW/0', 1, '宜宾', '四川', '', 'en', 1, 0, 0, 1, 0, '', '2016-03-13 16:36:45', 0, 0, 0, NULL, '2016-03-13 16:36:45');
INSERT INTO `multi_user` VALUES (727, 0, 0, 'opi_TwFdSRFavCOHKESCPxQDRbw8', '假小人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOUOicFnhxoVuOlvOy35wxhK0stxIbru0tibCXpkLbGyWUxkY3nLDefKm0YVNjmv32Tibynib0ib2IKruW/0', 1, 'Yibin', 'Sichuan', '', 'en', 1, 0, 0, 1, 0, '', '2016-03-13 16:36:53', 0, 0, 0, NULL, '2016-03-13 16:36:54');
INSERT INTO `multi_user` VALUES (728, 0, 0, 'ois_bwsHA708nUYMjkxBy4LToJj0', '你的眼睛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOXZZYg2V2QXeAmUpR78pUkP2J185gpuiakFC7XCFvnTT0YicxVTEaAGiaehibjuPCI3RFmeZPncoJPXn/0', 1, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:40:08', 0, 0, 0, NULL, '2016-03-13 16:40:08');
INSERT INTO `multi_user` VALUES (729, 0, 0, 'opi_TwFqUqFLyrT-V7QEcpccU08k', '你的眼睛', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOXZZYg2V2QXeAmUpR78pUkP2J185gpuiakFC7XCFvnTT0YicxVTEaAGiaehibjuPCI3RFmeZPncoJPXn/0', 1, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:40:13', 0, 0, 0, NULL, '2016-03-13 16:40:14');
INSERT INTO `multi_user` VALUES (730, 0, 0, 'ois_bwhRqZhreQkyMg8OhJkSdoJU', '易冷丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafhGAeqlvrn5tDeJjQibQqQ5bxOrr9yP5CVKENKlwkzZKDl6RTmRZroElQ2hFke9WyHycOTITTvRLQ2yJBlvLhgX/0', 1, '泸州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:51:23', 0, 0, 0, NULL, '2016-03-13 16:51:23');
INSERT INTO `multi_user` VALUES (731, 0, 0, 'opi_TwIiYtT54mciKZeDu-CSShNQ', '易冷丶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafhGAeqlvrn5tDeJjQibQqQ5bxOrr9yP5CVKENKlwkzZKDl6RTmRZroElQ2hFke9WyHycOTITTvRLQ2yJBlvLhgX/0', 1, 'Luzhou', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 16:51:43', 0, 0, 0, NULL, '2016-03-13 16:51:44');
INSERT INTO `multi_user` VALUES (732, 0, 0, 'opi_TwLquidRoUop1hKL5I-m8_sc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 16:57:36', 0, 0, 0, NULL, '2016-03-13 16:57:36');
INSERT INTO `multi_user` VALUES (733, 0, 0, 'opi_TwB93242Qg2fmrkAP8Xzq7j4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 17:17:04', 0, 0, 0, NULL, '2016-03-13 17:17:04');
INSERT INTO `multi_user` VALUES (734, 0, 0, 'opi_TwAeO8keCARXyiob7d-q11Ds', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 17:17:17', 0, 0, 0, NULL, '2016-03-13 17:17:17');
INSERT INTO `multi_user` VALUES (735, 0, 0, 'ois_bwrbJWy8eEge5xwpsudcnO7A', 'HH~', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSFMZ8AKcq4lLh0xt5LnhZ9Uwzib34P72VBjZZ2m7wQmWCQFSRAs2g9XnOpvCicnwUtTibQLDfvfmPC/0', 2, '', '西米斯', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:28:41', 0, 0, 0, NULL, '2016-03-13 17:28:41');
INSERT INTO `multi_user` VALUES (736, 0, 0, 'opi_TwGB9tAHxl4BAl-BwjYzwXGw', 'HH~', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOSFMZ8AKcq4lLh0xt5LnhZ9Uwzib34P72VBjZZ2m7wQmWCQFSRAs2g9XnOpvCicnwUtTibQLDfvfmPC/0', 2, '', 'Westmeath', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:28:47', 0, 0, 0, NULL, '2016-03-13 17:28:48');
INSERT INTO `multi_user` VALUES (737, 0, 0, 'ois_bwiLtqmo5apo0gG0jvIXg5Sg', 'Echo', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhuhUUMqjOoK8XqsJZQfDLngU0sHVfXBFnwzp7x3KQMUBxyvol2POSBYBfJVWXj0x522c0GibMfDb8XkqibJiax8eB/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:31:24', 0, 0, 0, NULL, '2016-03-13 17:31:24');
INSERT INTO `multi_user` VALUES (738, 0, 0, 'opi_TwEmFdbE3sg4QqpZHKvc4Cc0', 'Echo', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhuhUUMqjOoK8XqsJZQfDLngU0sHVfXBFnwzp7x3KQMUBxyvol2POSBYBfJVWXj0x522c0GibMfDb8XkqibJiax8eB/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:31:27', 0, 0, 0, NULL, '2016-03-13 17:31:29');
INSERT INTO `multi_user` VALUES (739, 0, 0, 'opi_TwLgWlSH3Rm1NIJ2Ug2ZNRc4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 17:38:36', 0, 0, 0, NULL, '2016-03-13 17:38:36');
INSERT INTO `multi_user` VALUES (740, 0, 0, 'ois_bwkgXOUw6dHb-KCtI5I_a180', '下一站丶永远', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4yaoUwXIyicP9qGb6HladaRmQ3gxTEDDHjtxCX8VFdomPo28ZKRyLh6YGhlhC97xzuHsyfXJnQFR0IhZ1IHGMNJem99kS7ym0s/0', 1, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:39:58', 0, 0, 0, NULL, '2016-03-13 17:39:58');
INSERT INTO `multi_user` VALUES (741, 0, 0, 'opi_TwJ115ZrvAJpuFEeFwU58l9A', '下一站丶永远', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4yaoUwXIyicP9qGb6HladaRmQ3gxTEDDHjtxCX8VFdomPo28ZKRyLh6YGhlhC97xzuHsyfXJnQFR0IhZ1IHGMNJem99kS7ym0s/0', 1, 'Zigong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:40:09', 0, 0, 0, NULL, '2016-03-13 17:40:10');
INSERT INTO `multi_user` VALUES (742, 0, 0, 'ois_bwiKwcSgnTKqD5ApKfAkQJ1Y', '凉爽西瓜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafmqRAsJvic2byu1iccMl6J0eSgHvicdzGLzZNMb1MXxQOHAvYLz1tIeH1F5EObEYqVD5X6qejHgt81XuUnPhjt2jq/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:56:06', 0, 0, 0, NULL, '2016-03-13 17:56:06');
INSERT INTO `multi_user` VALUES (743, 0, 0, 'opi_TwFKggsZnSxE9out4bd3tuYY', '凉爽西瓜', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafmqRAsJvic2byu1iccMl6J0eSgHvicdzGLzZNMb1MXxQOHAvYLz1tIeH1F5EObEYqVD5X6qejHgt81XuUnPhjt2jq/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:56:10', 0, 0, 0, NULL, '2016-03-13 17:56:11');
INSERT INTO `multi_user` VALUES (744, 0, 0, 'ois_bwnmyV7pEFqW8CBYLwoK9aOk', '我还是我', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Ihp0GDND0OEX40BXibvhymlMDWXsPFqDRO9t7mCJK6Czpw2WKibN3MfNYWe2HZs9pv5NAsZDwvfeoJicIV40yh7Agf/0', 1, '广安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:57:35', 0, 0, 0, NULL, '2016-03-13 17:57:35');
INSERT INTO `multi_user` VALUES (745, 0, 0, 'opi_TwFh0S3rCCNLx7MAhokuXT9Q', '我还是我', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8Ihp0GDND0OEX40BXibvhymlMDWXsPFqDRO9t7mCJK6Czpw2WKibN3MfNYWe2HZs9pv5NAsZDwvfeoJicIV40yh7Agf/0', 1, 'Kwong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 17:58:07', 0, 0, 0, NULL, '2016-03-13 17:58:09');
INSERT INTO `multi_user` VALUES (746, 0, 0, 'ois_bwpsv1_U1nz1vfFbFJGVAMe0', '不能玖伴  莂説嗳我', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Cnz7pFFVws9sO0Dt3g9kMkwibHefukFXTKKaRnrSruGnyaLgsibtFxicEBWEScJZibBa5bZMMjibU7cRqJO2pLt8ww3F/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:02:42', 0, 0, 0, NULL, '2016-03-13 18:02:42');
INSERT INTO `multi_user` VALUES (747, 0, 0, 'ois_bwm14SsZjkYU10MwjZW0w5hE', '豪', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibzYJ3Ifux6C7yOjxcRb6NgMkH9uAibricc7qj9EQlyeia8pzlNG6KibtnI5q29JhjYB1oibYQCyOOgsb6ic62xpFvU2f/0', 1, '广安', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:03:54', 0, 0, 0, NULL, '2016-03-13 18:03:54');
INSERT INTO `multi_user` VALUES (748, 0, 0, 'ois_bwpiq5OzHsuI5ixvtqdG5ldM', '政', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjC78yEotIicN8VoerPkG3SwMQvRZz2P1g9j2xibmzaD1hmXlx7suBdn26q9KicQOvI7LrB2pzWOyQJk1iczthblgLo/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:03:54', 0, 0, 0, NULL, '2016-03-13 18:03:54');
INSERT INTO `multi_user` VALUES (749, 0, 0, 'opi_TwMXNs5hU-3Won7re3KNs7ok', '政', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjC78yEotIicN8VoerPkG3SwMQvRZz2P1g9j2xibmzaD1hmXlx7suBdn26q9KicQOvI7LrB2pzWOyQJk1iczthblgLo/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:03:59', 0, 0, 0, NULL, '2016-03-13 18:04:00');
INSERT INTO `multi_user` VALUES (750, 0, 0, 'opi_TwBhURJZfvngvOAwO_OwVv7Q', '豪', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibzYJ3Ifux6C7yOjxcRb6NgMkH9uAibricc7qj9EQlyeia8pzlNG6KibtnI5q29JhjYB1oibYQCyOOgsb6ic62xpFvU2f/0', 1, 'Kwong', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:04:05', 0, 0, 0, NULL, '2016-03-13 18:04:06');
INSERT INTO `multi_user` VALUES (751, 0, 0, 'ois_bwgvg1xcn8AMyWqKehEJWqgQ', '殴阳', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iafJtbcicib9mueUt0vZeywwYyIrIGe9drChIQedCdLlu1qrV96LK8xbpKTstZBDrdq3GjelDzb7fbW0iaCmQX3jEwG/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:06:18', 0, 0, 0, NULL, '2016-03-13 18:06:18');
INSERT INTO `multi_user` VALUES (752, 0, 0, 'ois_bwt2OtZqgF_OdQlkXNWBS9Pk', '空城～泪', '', '', '', NULL, '', 1, '巴中', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:07:44', 0, 0, 0, NULL, '2016-03-13 18:07:44');
INSERT INTO `multi_user` VALUES (753, 0, 0, 'opi_TwErJ41m2Z0PHV4zLT-hQs3A', '空城～泪', '', '', '', NULL, '', 1, 'Pakistan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:07:58', 0, 0, 0, NULL, '2016-03-13 18:07:59');
INSERT INTO `multi_user` VALUES (754, 0, 0, 'opi_TwCZmFpWqQx3AD0DPpnceNxc', '不能玖伴  莂説嗳我', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Cnz7pFFVws9sO0Dt3g9kMkwibHefukFXTKKaRnrSruGnyaLgsibtFxicEBWEScJZibBa5bZMMjibU7cRqJO2pLt8ww3F/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:12:07', 0, 0, 0, NULL, '2016-03-13 18:12:08');
INSERT INTO `multi_user` VALUES (755, 0, 0, 'opi_TwOgpMgpqEc3dESKIPqWXW-8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 18:18:08', 0, 0, 0, NULL, '2016-03-13 18:18:08');
INSERT INTO `multi_user` VALUES (756, 0, 0, 'ois_bwub0WsYMpFE5mHQz8gC17zs', '夏了一夏天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOTrKqx2gmrsZw0IgicwUBXJ6yo4ecg5SDNhlNC6icghicxHxUoobiaAJSib3xuGVYAjqlnmiaFNtTqYbYg/0', 1, '泸州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:28:15', 0, 0, 0, NULL, '2016-03-13 18:28:15');
INSERT INTO `multi_user` VALUES (757, 0, 0, 'opi_TwFRX6P6wq6MBUqgN4Cyb0HE', '夏了一夏天', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhWoTkfLlcicOTrKqx2gmrsZw0IgicwUBXJ6yo4ecg5SDNhlNC6icghicxHxUoobiaAJSib3xuGVYAjqlnmiaFNtTqYbYg/0', 1, 'Luzhou', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:28:21', 0, 0, 0, NULL, '2016-03-13 18:28:22');
INSERT INTO `multi_user` VALUES (758, 0, 0, 'ois_bwv-Dwg3diYdiGNC_8H2LpPs', '代代代、代秋俊', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CnUZJjzagIRyQibG3hicFLV0vN04bJwGmCBySjCHAonT9iaRbW7kQJCCGMibLcjichKUQ4FMe2a4qI7phd7Va2Tg9h83/0', 1, '泸州', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:29:38', 0, 0, 0, NULL, '2016-03-13 18:29:38');
INSERT INTO `multi_user` VALUES (759, 0, 0, 'opi_TwK7DMUDmmRUKtFjMnYg8z1k', '八个肾的男人', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IjsiccGx4twLTp5o4H6cOC5emNQAzxVickw8aJTR9QrQBqOswwuF4ZwgFUdOT5tvdxB5odjXtW5yiahhSyYMCoup3e/0', 1, 'Guangyuan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 18:57:52', 0, 0, 0, NULL, '2016-03-13 18:57:54');
INSERT INTO `multi_user` VALUES (760, 0, 0, '', 'wx236652', '17865186557', '', 'a4de33ef4f0fda172a4a5dc1c8e88d3f', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 19:41:58', 0, 2, 0, NULL, '2016-03-13 19:41:58');
INSERT INTO `multi_user` VALUES (761, 0, 0, 'opi_TwHpBMkS2QWNBXQDJG1Euh_g', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 20:14:11', 0, 0, 0, NULL, '2016-03-13 20:14:11');
INSERT INTO `multi_user` VALUES (762, 0, 0, 'opi_TwEBoqzSgGFd5phbVWH3APp8', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 20:30:32', 0, 0, 0, NULL, '2016-03-13 20:30:32');
INSERT INTO `multi_user` VALUES (763, 0, 0, 'opi_TwB5cTBtNQ563dUI_quUY_AI', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 20:32:36', 0, 0, 0, NULL, '2016-03-13 20:32:36');
INSERT INTO `multi_user` VALUES (764, 0, 0, 'opi_TwOrvMLW1UokcNCaY3lWelG4', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 20:47:54', 0, 0, 0, NULL, '2016-03-13 20:47:54');
INSERT INTO `multi_user` VALUES (765, 0, 0, 'ois_bwkBSujn2HM-HWIa3ezpZob4', '刁菇凉，', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmNcCb4XXziaNE9tiahXwjSc2ibzzqNp7OMuIF7UxUdcZQZ2qqYEt6HPAcpRhlK5wM8nDhgrDjW9YTkIib4n8dPoL1m/0', 2, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:14:03', 0, 0, 0, NULL, '2016-03-13 21:14:03');
INSERT INTO `multi_user` VALUES (766, 0, 0, 'ois_bwvRemQqxKbd48YE-YJKeYqs', 'が﹏池♂小西℡', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsUnZ0uMg1eibEILYlxgHHkSL5RUWva9yxZx8ic1GPICAlgD55XBNspbvzO7hjwr8yv85ukKFEQlr5F/0', 2, '北碚', '重庆', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:14:09', 0, 0, 0, NULL, '2016-03-13 21:14:09');
INSERT INTO `multi_user` VALUES (767, 0, 0, 'opi_TwMAHVVe1a26KfEnN0PI0Zvk', 'が﹏池♂小西℡', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7Ck6j9IYu68AsUnZ0uMg1eibEILYlxgHHkSL5RUWva9yxZx8ic1GPICAlgD55XBNspbvzO7hjwr8yv85ukKFEQlr5F/0', 2, 'Beibei', 'Chongqing', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:14:18', 0, 0, 0, NULL, '2016-03-13 21:14:20');
INSERT INTO `multi_user` VALUES (768, 0, 0, 'opi_TwEOc3Ae-xEg1u65Q5Bc_zq4', '刁菇凉，', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CmNcCb4XXziaNE9tiahXwjSc2ibzzqNp7OMuIF7UxUdcZQZ2qqYEt6HPAcpRhlK5wM8nDhgrDjW9YTkIib4n8dPoL1m/0', 2, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:14:25', 0, 0, 0, NULL, '2016-03-13 21:14:27');
INSERT INTO `multi_user` VALUES (769, 0, 0, 'opi_TwOnVlTcMkKGwdZInBbWrq64', '。', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IiaaicCBFcOmmnrwL32NUImVCHYeWU4Cz3HRNhNMxzZFeicwrpx6dsLpYJbdakk094uXpMjWUCfOY9FWOzVByMb2iaP/0', 2, 'Meishan', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:32:01', 0, 0, 0, NULL, '2016-03-13 21:32:02');
INSERT INTO `multi_user` VALUES (770, 0, 0, 'ois_bwlP-fAi0_2qxTx-8PROiwmU', 'zy ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/cnwOoEJancTnXpTcRwpTSyTicklQib26xfZmXGp7Jv9WmSicNVBK9EujiaicWHZS1E9Ex7T8VRteccN1IYicFBUEY8OcPh2bwgYNjk/0', 2, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:47:50', 0, 0, 0, NULL, '2016-03-13 21:47:50');
INSERT INTO `multi_user` VALUES (771, 0, 0, 'opi_TwPu4jQBXjpM9b8uV4RElG_0', 'zy ', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/cnwOoEJancTnXpTcRwpTSyTicklQib26xfZmXGp7Jv9WmSicNVBK9EujiaicWHZS1E9Ex7T8VRteccN1IYicFBUEY8OcPh2bwgYNjk/0', 2, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:47:59', 0, 0, 0, NULL, '2016-03-13 21:48:03');
INSERT INTO `multi_user` VALUES (772, 0, 0, 'ois_bwjLmwTwEDGS3JD_Z1eCr34k', '华', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBgFZ0flbN5c2uk3p5QjdsGWZdEKmXwF0HiblwZLD20RqryUhZLksibj6TA8uYGQTlF81rRfvv1StCHBCqoqQpdKCYoCLrOIIql8/0', 2, '', '慕尼黑', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:56:31', 0, 0, 0, NULL, '2016-03-13 21:56:31');
INSERT INTO `multi_user` VALUES (773, 0, 0, 'opi_TwL97iJzQNBZSdgob0WgM3Jo', '华', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBgFZ0flbN5c2uk3p5QjdsGWZdEKmXwF0HiblwZLD20RqryUhZLksibj6TA8uYGQTlF81rRfvv1StCHBCqoqQpdKCYoCLrOIIql8/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 21:56:47', 0, 0, 0, NULL, '2016-03-13 21:56:49');
INSERT INTO `multi_user` VALUES (774, 0, 0, 'ois_bwraNro7Df2o92D4YnsBFm1A', 'goust', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/50MDfv1yMzf0ib15KtQcSNpDDn2emicBqNTo6s3Q73ka5Hl5O5icp0wCicPDCibpqens8BV28jxWBM9B2icfKLB69Wsog8hVCD7goJ/0', 2, '洛杉矶', '加利福尼亚', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 22:41:58', 0, 0, 0, NULL, '2016-03-13 22:41:58');
INSERT INTO `multi_user` VALUES (775, 0, 0, 'opi_TwH83oMRMxE9LgCMh2TEg0SE', 'goust', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/50MDfv1yMzf0ib15KtQcSNpDDn2emicBqNTo6s3Q73ka5Hl5O5icp0wCicPDCibpqens8BV28jxWBM9B2icfKLB69Wsog8hVCD7goJ/0', 2, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 22:42:02', 0, 0, 0, NULL, '2016-03-13 22:42:03');
INSERT INTO `multi_user` VALUES (776, 0, 0, 'ois_bwodJpSECoZhq4pZXcw913pQ', '言叶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClBb7q7zibU74kquibZiabsKNb0fTCHSBgak21VFicPB3bBgJXATKyt1yAz3hCWcicrfofdAJkM9gNgbFeTic6rvKK4icL/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 22:57:41', 0, 0, 0, NULL, '2016-03-13 22:57:41');
INSERT INTO `multi_user` VALUES (777, 0, 0, 'opi_TwNLGySo_c3_dmgBkQWIwtz8', '言叶', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7ClBb7q7zibU74kquibZiabsKNb0fTCHSBgak21VFicPB3bBgJXATKyt1yAz3hCWcicrfofdAJkM9gNgbFeTic6rvKK4icL/0', 0, '', '', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-13 22:57:47', 0, 0, 0, NULL, '2016-03-13 22:57:49');
INSERT INTO `multi_user` VALUES (778, 0, 0, 'opi_TwEi3UdsTYqjziW2Kd_tE40c', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-13 23:01:44', 0, 0, 0, NULL, '2016-03-13 23:01:44');
INSERT INTO `multi_user` VALUES (779, 0, 0, 'ois_bwszyW-jiG8tpDNkyZH8vIFQ', 'Gourd', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhaYYpZHSqtVxVggKzznWsAZ4eWGrjwgwXcTm64ficuwiaFBMXqI9dLlBeWibhoUoiaibpD7M3EniaHL9eiaCAGUqOAEVt/0', 1, '德阳', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 00:06:12', 0, 0, 0, NULL, '2016-03-14 00:06:12');
INSERT INTO `multi_user` VALUES (780, 0, 0, 'opi_TwKjH-4Y1gC2_li1j3AieYf4', 'Gourd', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/FyGJ7IWG8IhaYYpZHSqtVxVggKzznWsAZ4eWGrjwgwXcTm64ficuwiaFBMXqI9dLlBeWibhoUoiaibpD7M3EniaHL9eiaCAGUqOAEVt/0', 1, 'Deyang', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 00:06:16', 0, 0, 0, NULL, '2016-03-14 00:06:17');
INSERT INTO `multi_user` VALUES (781, 0, 0, 'ois_bwhUJfRatD3s-eyRSt9OyAfA', '郑卓航', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rQZeyM1jibKX1rIYBrNRYSaBUD5BPB2b05gYKBamnv0RRffd8T5ZFBHRVMGVm30rM9WuQ3vh3zTDKbibLALT5e8hlhQnSpMRqY/0', 1, '南充', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 02:38:04', 0, 0, 0, NULL, '2016-03-14 02:38:04');
INSERT INTO `multi_user` VALUES (782, 0, 0, 'ois_bwj0F-4Or8O88KlDCf9rDQKg', '深爱', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/Ib5852jAybibJiaOEZEoMWfjJB9oLouGvDdIiaFrtQl23I97E7b7kEcKrGNb6zWDlNXQC9J8WibRCkbd9iaxCpReE2efutxXsiah66/0', 2, '自贡', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 07:40:41', 0, 0, 0, NULL, '2016-03-14 07:40:41');
INSERT INTO `multi_user` VALUES (783, 0, 0, 'ois_bwjK4j0HUMug3yzGFaKByQeU', '小蚂蚁联盟静静', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/7ib8Nhc1U7iadU6pXKAnxTRafibHzNZQYPn82XE88aN35RKzDAuylJiciaLAd7YdDfgjs26ib4F5hqR8MdQlfmfUgIibEwn0QgP4vgz/0', 2, '许昌', '河南', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 09:04:32', 0, 0, 0, NULL, '2016-03-14 09:04:32');
INSERT INTO `multi_user` VALUES (784, 0, 0, 'ois_bwoMpqkpUkCTQ125QFp4Byvc', '倩哥哥mia', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ekbZRkfvgokkn4SJXDtm7yiabWtZqaqU6pt3Eexgjs7Ep1YW62Wq7rx3F5u5lNtGeGQhGmKIoDESBVrAWNYaqzyibWuwBmDrDV/0', 2, '宜宾', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 09:21:05', 0, 0, 0, NULL, '2016-03-14 09:21:05');
INSERT INTO `multi_user` VALUES (785, 0, 0, 'opi_TwEgENUSNYJRWRza_EmuNtf0', '倩哥哥mia', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/ekbZRkfvgokkn4SJXDtm7yiabWtZqaqU6pt3Eexgjs7Ep1YW62Wq7rx3F5u5lNtGeGQhGmKIoDESBVrAWNYaqzyibWuwBmDrDV/0', 2, 'Yibin', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 09:21:15', 0, 0, 0, NULL, '2016-03-14 09:21:16');
INSERT INTO `multi_user` VALUES (786, 0, 0, 'ois_bwtvde73w32VpzxjB9Hn_wiw', 'V', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkYWAbmtO6ocic0ZUdjuksliar1MoY079cNb5ibDJKjEF2ZIMhFW0rZXvV4FEzibUjsd83ibLaEVN4icGanroScpFzQcL/0', 1, '成都', '四川', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 09:25:49', 0, 0, 0, NULL, '2016-03-14 09:25:49');
INSERT INTO `multi_user` VALUES (787, 0, 0, 'opi_TwC6VB5awxXQla-lbqudK5ew', 'V', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/xXu3u96z7CkYWAbmtO6ocic0ZUdjuksliar1MoY079cNb5ibDJKjEF2ZIMhFW0rZXvV4FEzibUjsd83ibLaEVN4icGanroScpFzQcL/0', 1, 'Chengdu', 'Sichuan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '2016-03-14 09:25:55', 0, 0, 0, NULL, '2016-03-14 09:25:56');
INSERT INTO `multi_user` VALUES (788, 0, 0, 'opi_TwOIxv0e8IPMFG5G5JdTulYc', '', '', '', '', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-14 10:32:29', 0, 0, 0, NULL, '2016-03-14 10:32:29');
INSERT INTO `multi_user` VALUES (789, 0, 0, '', '清月曦', '18538753627', '2869626928@qq.com', '6412121cbb2dc2cb9e460cfee7046be2', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-03-25 17:36:07', 0, 2, 0, NULL, '2016-04-06 17:41:28');
INSERT INTO `multi_user` VALUES (790, 0, 0, '', '2034210985', '32121321', '2034210985@qq.com', 'e89e679f1eb4b03f341f8409c4cd68cb', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-04-01 10:08:35', 0, 2, 0, '', '2016-04-07 13:57:47');
INSERT INTO `multi_user` VALUES (791, 0, 0, '', 'pidong', '18737131820', '1163765691@qq.com', '461be1adb19fd3527ad315b6e0a3d20c', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-04-06 17:01:33', 0, 2, 0, '', '2016-04-07 13:47:48');
INSERT INTO `multi_user` VALUES (792, 0, 0, 'oojFxs1CQD_2G98Os0bI5qNAIhcw', '清月曦', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RlGLCAicgu0iasMLVwSAGt7njA3iad95PcGf3e3yO1uxosx8NuYaljB8iaFUwpibGjGicv4EVPs4CicK1ts3Hmr1KQJsGiaX0Re0wwMQ/0', 1, 'Zhengzhou', 'Henan', '', 'zh_CN', 1, 992.94, 120, 1, 0, '', '', 10, 0, 0, NULL, '2016-04-07 16:36:22');
INSERT INTO `multi_user` VALUES (793, 0, 0, 'oojFxsymgje_Q392jaDiQoB95-sw', 'listTouch', '', '', '', NULL, 'http://wx.qlogo.cn/mmopen/RlGLCAicgu0iasMLVwSAGt7lGibdrAlT4t58Tg85x7sibg26iaS7869AR8DqmBTF88x6boTmt4XRCpcgj1GAxMEicfY5FcWmIib2dbO/0', 1, 'Zhengzhou', 'Henan', '', 'zh_CN', 1, 0, 0, 1, 0, '', '', 0, 0, 0, NULL, '2016-04-07 15:22:01');
INSERT INTO `multi_user` VALUES (794, 0, 0, '', '测试', '', '786699892@qq.com', 'e89e679f1eb4b03f341f8409c4cd68cb', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-04-12 21:00:33', 0, 2, 0, NULL, '2016-04-12 21:00:33');
INSERT INTO `multi_user` VALUES (795, 0, 0, '', 'hmily', '', '136119282@qq.com', 'b0dcd34076665b5dd8036f69180bebcc', NULL, '', 0, '', '', '', '', 0, 0, 0, 1, 0, '', '2016-04-12 21:24:52', 0, 2, 0, NULL, '2016-04-12 21:24:51');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_user_favorites`
-- 

CREATE TABLE `multi_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` text CHARACTER SET latin1 NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` text CHARACTER SET latin1,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- 导出表中的数据 `multi_user_favorites`
-- 

INSERT INTO `multi_user_favorites` VALUES (3, '3', 2, NULL, '2015-11-19 00:51:26', 0);
INSERT INTO `multi_user_favorites` VALUES (4, '3', 2, NULL, '2015-11-19 00:51:37', 0);
INSERT INTO `multi_user_favorites` VALUES (5, '3', 2, NULL, '2015-11-20 15:37:49', 0);
INSERT INTO `multi_user_favorites` VALUES (6, '3', 2, NULL, '2015-11-20 15:37:52', 0);
INSERT INTO `multi_user_favorites` VALUES (7, '3', 2, NULL, '2015-11-20 15:37:52', 0);
INSERT INTO `multi_user_favorites` VALUES (8, '3', 2, NULL, '2015-11-20 15:37:53', 0);
INSERT INTO `multi_user_favorites` VALUES (9, '3', 2, NULL, '2015-11-20 15:39:03', 0);
INSERT INTO `multi_user_favorites` VALUES (10, '3', 2, NULL, '2015-11-20 15:39:04', 0);
INSERT INTO `multi_user_favorites` VALUES (11, '3', 2, NULL, '2015-11-20 16:07:53', 0);
INSERT INTO `multi_user_favorites` VALUES (12, '3', 2, NULL, '2015-11-20 16:07:56', 0);
INSERT INTO `multi_user_favorites` VALUES (13, '3', 2, NULL, '2015-11-20 16:07:59', 0);
INSERT INTO `multi_user_favorites` VALUES (14, '3', 2, NULL, '2015-11-20 16:08:02', 0);
INSERT INTO `multi_user_favorites` VALUES (15, '3', 2, NULL, '2015-11-20 16:08:23', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_user_shop`
-- 

CREATE TABLE `multi_user_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=485 ;

-- 
-- 导出表中的数据 `multi_user_shop`
-- 

INSERT INTO `multi_user_shop` VALUES (1, 2, 136, '2016-03-26 17:43:18');
INSERT INTO `multi_user_shop` VALUES (2, 155, 136, '2016-03-26 18:19:58');
INSERT INTO `multi_user_shop` VALUES (3, 155, 9, '2016-03-03 08:50:35');
INSERT INTO `multi_user_shop` VALUES (4, 156, 9, '2016-03-03 08:51:09');
INSERT INTO `multi_user_shop` VALUES (5, 154, 16, '2016-03-03 09:00:57');
INSERT INTO `multi_user_shop` VALUES (6, 155, 8, '2016-03-03 09:01:25');
INSERT INTO `multi_user_shop` VALUES (7, 155, 19, '2016-03-03 09:01:33');
INSERT INTO `multi_user_shop` VALUES (8, 158, 51, '2016-03-03 09:59:48');
INSERT INTO `multi_user_shop` VALUES (9, 159, 51, '2016-03-03 10:00:51');
INSERT INTO `multi_user_shop` VALUES (10, 158, 52, '2016-03-03 10:33:56');
INSERT INTO `multi_user_shop` VALUES (11, 159, 52, '2016-03-03 10:34:23');
INSERT INTO `multi_user_shop` VALUES (12, 158, 1, '2016-03-03 10:44:40');
INSERT INTO `multi_user_shop` VALUES (13, 159, 1, '2016-03-03 10:44:45');
INSERT INTO `multi_user_shop` VALUES (14, 155, 2, '2016-03-03 11:45:42');
INSERT INTO `multi_user_shop` VALUES (15, 155, 16, '2016-03-03 11:57:14');
INSERT INTO `multi_user_shop` VALUES (16, 155, 12, '2016-03-03 11:57:27');
INSERT INTO `multi_user_shop` VALUES (17, 171, 40, '2016-03-03 12:33:33');
INSERT INTO `multi_user_shop` VALUES (18, 177, 1, '2016-03-03 18:08:47');
INSERT INTO `multi_user_shop` VALUES (19, 177, 19, '2016-03-03 18:08:56');
INSERT INTO `multi_user_shop` VALUES (20, 177, 12, '2016-03-03 18:09:17');
INSERT INTO `multi_user_shop` VALUES (21, 178, 16, '2016-03-03 18:11:31');
INSERT INTO `multi_user_shop` VALUES (22, 179, 19, '2016-03-03 18:12:35');
INSERT INTO `multi_user_shop` VALUES (23, 177, 9, '2016-03-03 18:28:36');
INSERT INTO `multi_user_shop` VALUES (24, 181, 12, '2016-03-03 18:44:44');
INSERT INTO `multi_user_shop` VALUES (25, 181, 19, '2016-03-03 18:45:38');
INSERT INTO `multi_user_shop` VALUES (26, 181, 8, '2016-03-03 18:46:23');
INSERT INTO `multi_user_shop` VALUES (27, 183, 19, '2016-03-03 20:51:44');
INSERT INTO `multi_user_shop` VALUES (28, 184, 12, '2016-03-03 20:55:55');
INSERT INTO `multi_user_shop` VALUES (29, 186, 63, '2016-03-03 22:14:40');
INSERT INTO `multi_user_shop` VALUES (30, 156, 60, '2016-03-04 10:10:24');
INSERT INTO `multi_user_shop` VALUES (31, 190, 19, '2016-03-04 10:40:14');
INSERT INTO `multi_user_shop` VALUES (32, 193, 63, '2016-03-04 12:13:07');
INSERT INTO `multi_user_shop` VALUES (33, 194, 1, '2016-03-04 15:04:32');
INSERT INTO `multi_user_shop` VALUES (34, 159, 9, '2016-03-04 15:04:55');
INSERT INTO `multi_user_shop` VALUES (35, 156, 80, '2016-03-04 15:11:58');
INSERT INTO `multi_user_shop` VALUES (36, 159, 3, '2016-03-04 15:24:42');
INSERT INTO `multi_user_shop` VALUES (37, 190, 82, '2016-03-04 15:24:57');
INSERT INTO `multi_user_shop` VALUES (38, 159, 80, '2016-03-04 15:26:15');
INSERT INTO `multi_user_shop` VALUES (39, 195, 9, '2016-03-04 15:34:53');
INSERT INTO `multi_user_shop` VALUES (40, 195, 8, '2016-03-04 15:35:07');
INSERT INTO `multi_user_shop` VALUES (41, 171, 8, '2016-03-04 16:51:36');
INSERT INTO `multi_user_shop` VALUES (42, 159, 55, '2016-03-04 17:40:25');
INSERT INTO `multi_user_shop` VALUES (43, 159, 87, '2016-03-04 17:55:22');
INSERT INTO `multi_user_shop` VALUES (44, 156, 19, '2016-03-04 18:21:45');
INSERT INTO `multi_user_shop` VALUES (45, 196, 80, '2016-03-04 18:35:50');
INSERT INTO `multi_user_shop` VALUES (46, 156, 16, '2016-03-04 18:37:25');
INSERT INTO `multi_user_shop` VALUES (47, 159, 40, '2016-03-05 10:03:53');
INSERT INTO `multi_user_shop` VALUES (48, 155, 84, '2016-03-05 13:22:44');
INSERT INTO `multi_user_shop` VALUES (49, 154, 84, '2016-03-05 13:23:06');
INSERT INTO `multi_user_shop` VALUES (50, 158, 69, '2016-03-05 13:25:59');
INSERT INTO `multi_user_shop` VALUES (51, 198, 40, '2016-03-05 15:27:17');
INSERT INTO `multi_user_shop` VALUES (52, 199, 19, '2016-03-05 16:17:01');
INSERT INTO `multi_user_shop` VALUES (53, 200, 9, '2016-03-05 16:17:24');
INSERT INTO `multi_user_shop` VALUES (54, 200, 19, '2016-03-05 16:17:37');
INSERT INTO `multi_user_shop` VALUES (55, 154, 19, '2016-03-05 16:19:36');
INSERT INTO `multi_user_shop` VALUES (56, 201, 19, '2016-03-05 16:38:56');
INSERT INTO `multi_user_shop` VALUES (57, 202, 19, '2016-03-05 16:45:05');
INSERT INTO `multi_user_shop` VALUES (58, 203, 16, '2016-03-05 16:47:49');
INSERT INTO `multi_user_shop` VALUES (59, 203, 8, '2016-03-05 16:47:54');
INSERT INTO `multi_user_shop` VALUES (60, 203, 1, '2016-03-05 16:48:01');
INSERT INTO `multi_user_shop` VALUES (61, 205, 12, '2016-03-05 17:08:43');
INSERT INTO `multi_user_shop` VALUES (62, 207, 69, '2016-03-05 17:16:28');
INSERT INTO `multi_user_shop` VALUES (63, 207, 70, '2016-03-05 17:16:47');
INSERT INTO `multi_user_shop` VALUES (64, 208, 16, '2016-03-05 17:27:12');
INSERT INTO `multi_user_shop` VALUES (65, 205, 92, '2016-03-05 17:49:36');
INSERT INTO `multi_user_shop` VALUES (66, 205, 90, '2016-03-05 17:50:58');
INSERT INTO `multi_user_shop` VALUES (67, 210, 69, '2016-03-05 18:38:40');
INSERT INTO `multi_user_shop` VALUES (68, 210, 70, '2016-03-05 18:39:23');
INSERT INTO `multi_user_shop` VALUES (69, 212, 19, '2016-03-05 20:21:05');
INSERT INTO `multi_user_shop` VALUES (70, 214, 40, '2016-03-05 22:13:40');
INSERT INTO `multi_user_shop` VALUES (71, 215, 90, '2016-03-05 22:32:00');
INSERT INTO `multi_user_shop` VALUES (72, 181, 9, '2016-03-06 00:29:48');
INSERT INTO `multi_user_shop` VALUES (73, 181, 80, '2016-03-06 00:30:28');
INSERT INTO `multi_user_shop` VALUES (74, 181, 1, '2016-03-06 00:31:13');
INSERT INTO `multi_user_shop` VALUES (75, 216, 12, '2016-03-06 08:12:27');
INSERT INTO `multi_user_shop` VALUES (76, 217, 40, '2016-03-06 09:03:14');
INSERT INTO `multi_user_shop` VALUES (77, 207, 8, '2016-03-06 09:52:49');
INSERT INTO `multi_user_shop` VALUES (78, 207, 16, '2016-03-06 09:53:41');
INSERT INTO `multi_user_shop` VALUES (79, 218, 63, '2016-03-06 10:52:43');
INSERT INTO `multi_user_shop` VALUES (80, 219, 19, '2016-03-06 11:21:16');
INSERT INTO `multi_user_shop` VALUES (81, 220, 40, '2016-03-06 11:52:10');
INSERT INTO `multi_user_shop` VALUES (82, 221, 19, '2016-03-06 12:36:57');
INSERT INTO `multi_user_shop` VALUES (83, 223, 16, '2016-03-06 14:39:57');
INSERT INTO `multi_user_shop` VALUES (84, 223, 8, '2016-03-06 14:40:27');
INSERT INTO `multi_user_shop` VALUES (85, 223, 1, '2016-03-06 14:41:37');
INSERT INTO `multi_user_shop` VALUES (86, 224, 40, '2016-03-06 17:10:08');
INSERT INTO `multi_user_shop` VALUES (87, 223, 9, '2016-03-06 18:57:01');
INSERT INTO `multi_user_shop` VALUES (88, 227, 19, '2016-03-06 20:53:37');
INSERT INTO `multi_user_shop` VALUES (89, 223, 19, '2016-03-06 21:31:17');
INSERT INTO `multi_user_shop` VALUES (90, 229, 63, '2016-03-06 23:15:16');
INSERT INTO `multi_user_shop` VALUES (91, 230, 19, '2016-03-06 23:49:48');
INSERT INTO `multi_user_shop` VALUES (92, 232, 19, '2016-03-07 09:55:29');
INSERT INTO `multi_user_shop` VALUES (93, 232, 8, '2016-03-07 09:56:21');
INSERT INTO `multi_user_shop` VALUES (94, 234, 19, '2016-03-07 11:20:37');
INSERT INTO `multi_user_shop` VALUES (95, 237, 19, '2016-03-07 11:48:57');
INSERT INTO `multi_user_shop` VALUES (96, 238, 40, '2016-03-07 12:49:46');
INSERT INTO `multi_user_shop` VALUES (97, 239, 9, '2016-03-07 13:26:20');
INSERT INTO `multi_user_shop` VALUES (98, 240, 19, '2016-03-07 19:35:46');
INSERT INTO `multi_user_shop` VALUES (99, 241, 62, '2016-03-07 20:03:27');
INSERT INTO `multi_user_shop` VALUES (100, 242, 40, '2016-03-08 08:33:04');
INSERT INTO `multi_user_shop` VALUES (101, 243, 80, '2016-03-08 09:17:56');
INSERT INTO `multi_user_shop` VALUES (102, 159, 16, '2016-03-08 09:32:50');
INSERT INTO `multi_user_shop` VALUES (103, 159, 17, '2016-03-08 09:35:10');
INSERT INTO `multi_user_shop` VALUES (104, 159, 18, '2016-03-08 09:37:00');
INSERT INTO `multi_user_shop` VALUES (105, 244, 40, '2016-03-08 09:37:23');
INSERT INTO `multi_user_shop` VALUES (106, 159, 22, '2016-03-08 09:37:35');
INSERT INTO `multi_user_shop` VALUES (107, 159, 24, '2016-03-08 09:38:08');
INSERT INTO `multi_user_shop` VALUES (108, 159, 30, '2016-03-08 09:39:36');
INSERT INTO `multi_user_shop` VALUES (109, 159, 31, '2016-03-08 09:40:33');
INSERT INTO `multi_user_shop` VALUES (110, 159, 37, '2016-03-08 09:41:43');
INSERT INTO `multi_user_shop` VALUES (111, 159, 50, '2016-03-08 10:14:36');
INSERT INTO `multi_user_shop` VALUES (112, 245, 19, '2016-03-08 10:29:58');
INSERT INTO `multi_user_shop` VALUES (113, 245, 12, '2016-03-08 10:31:25');
INSERT INTO `multi_user_shop` VALUES (114, 246, 19, '2016-03-08 10:57:57');
INSERT INTO `multi_user_shop` VALUES (115, 247, 19, '2016-03-08 11:03:36');
INSERT INTO `multi_user_shop` VALUES (116, 248, 40, '2016-03-08 11:46:54');
INSERT INTO `multi_user_shop` VALUES (117, 249, 40, '2016-03-08 14:10:33');
INSERT INTO `multi_user_shop` VALUES (118, 250, 19, '2016-03-08 15:14:13');
INSERT INTO `multi_user_shop` VALUES (119, 159, 53, '2016-03-08 15:15:45');
INSERT INTO `multi_user_shop` VALUES (120, 159, 60, '2016-03-08 15:16:05');
INSERT INTO `multi_user_shop` VALUES (121, 159, 61, '2016-03-08 15:18:41');
INSERT INTO `multi_user_shop` VALUES (122, 159, 62, '2016-03-08 15:19:05');
INSERT INTO `multi_user_shop` VALUES (123, 159, 63, '2016-03-08 15:19:21');
INSERT INTO `multi_user_shop` VALUES (124, 159, 64, '2016-03-08 15:19:38');
INSERT INTO `multi_user_shop` VALUES (125, 159, 65, '2016-03-08 15:19:54');
INSERT INTO `multi_user_shop` VALUES (126, 159, 66, '2016-03-08 15:20:22');
INSERT INTO `multi_user_shop` VALUES (127, 159, 67, '2016-03-08 15:20:40');
INSERT INTO `multi_user_shop` VALUES (128, 159, 68, '2016-03-08 15:20:55');
INSERT INTO `multi_user_shop` VALUES (129, 159, 69, '2016-03-08 15:21:09');
INSERT INTO `multi_user_shop` VALUES (130, 159, 70, '2016-03-08 16:01:04');
INSERT INTO `multi_user_shop` VALUES (131, 159, 81, '2016-03-08 16:02:21');
INSERT INTO `multi_user_shop` VALUES (132, 159, 82, '2016-03-08 16:02:59');
INSERT INTO `multi_user_shop` VALUES (133, 159, 83, '2016-03-08 16:03:31');
INSERT INTO `multi_user_shop` VALUES (134, 159, 90, '2016-03-08 16:04:32');
INSERT INTO `multi_user_shop` VALUES (135, 159, 92, '2016-03-08 16:05:37');
INSERT INTO `multi_user_shop` VALUES (136, 159, 112, '2016-03-08 16:07:31');
INSERT INTO `multi_user_shop` VALUES (137, 251, 19, '2016-03-08 16:53:08');
INSERT INTO `multi_user_shop` VALUES (138, 251, 16, '2016-03-08 16:53:35');
INSERT INTO `multi_user_shop` VALUES (139, 252, 16, '2016-03-08 16:54:38');
INSERT INTO `multi_user_shop` VALUES (140, 253, 1, '2016-03-08 17:26:18');
INSERT INTO `multi_user_shop` VALUES (141, 253, 19, '2016-03-08 17:26:47');
INSERT INTO `multi_user_shop` VALUES (142, 254, 63, '2016-03-08 17:40:08');
INSERT INTO `multi_user_shop` VALUES (143, 159, 94, '2016-03-08 17:50:38');
INSERT INTO `multi_user_shop` VALUES (144, 159, 98, '2016-03-08 17:51:14');
INSERT INTO `multi_user_shop` VALUES (145, 256, 80, '2016-03-08 19:23:04');
INSERT INTO `multi_user_shop` VALUES (146, 257, 63, '2016-03-08 19:44:42');
INSERT INTO `multi_user_shop` VALUES (147, 258, 40, '2016-03-08 20:00:08');
INSERT INTO `multi_user_shop` VALUES (148, 232, 9, '2016-03-08 22:23:57');
INSERT INTO `multi_user_shop` VALUES (149, 259, 80, '2016-03-09 07:55:30');
INSERT INTO `multi_user_shop` VALUES (150, 200, 80, '2016-03-09 10:39:02');
INSERT INTO `multi_user_shop` VALUES (151, 261, 40, '2016-03-09 11:48:09');
INSERT INTO `multi_user_shop` VALUES (152, 262, 40, '2016-03-09 11:48:40');
INSERT INTO `multi_user_shop` VALUES (153, 263, 40, '2016-03-09 11:58:00');
INSERT INTO `multi_user_shop` VALUES (154, 264, 40, '2016-03-09 12:16:33');
INSERT INTO `multi_user_shop` VALUES (155, 265, 40, '2016-03-09 12:38:22');
INSERT INTO `multi_user_shop` VALUES (156, 266, 16, '2016-03-09 12:43:15');
INSERT INTO `multi_user_shop` VALUES (157, 268, 19, '2016-03-09 14:11:24');
INSERT INTO `multi_user_shop` VALUES (158, 269, 40, '2016-03-09 14:29:03');
INSERT INTO `multi_user_shop` VALUES (159, 159, 29, '2016-03-09 14:59:22');
INSERT INTO `multi_user_shop` VALUES (160, 270, 40, '2016-03-09 15:13:49');
INSERT INTO `multi_user_shop` VALUES (161, 159, 115, '2016-03-09 15:32:08');
INSERT INTO `multi_user_shop` VALUES (162, 272, 19, '2016-03-09 17:57:43');
INSERT INTO `multi_user_shop` VALUES (163, 273, 40, '2016-03-09 17:57:51');
INSERT INTO `multi_user_shop` VALUES (164, 274, 114, '2016-03-09 18:08:02');
INSERT INTO `multi_user_shop` VALUES (165, 277, 16, '2016-03-09 18:56:51');
INSERT INTO `multi_user_shop` VALUES (166, 154, 115, '2016-03-09 19:30:21');
INSERT INTO `multi_user_shop` VALUES (167, 281, 115, '2016-03-09 19:32:12');
INSERT INTO `multi_user_shop` VALUES (168, 282, 40, '2016-03-09 19:41:28');
INSERT INTO `multi_user_shop` VALUES (169, 283, 40, '2016-03-09 19:44:50');
INSERT INTO `multi_user_shop` VALUES (170, 196, 115, '2016-03-09 20:10:16');
INSERT INTO `multi_user_shop` VALUES (171, 288, 115, '2016-03-09 20:22:29');
INSERT INTO `multi_user_shop` VALUES (172, 289, 115, '2016-03-09 20:22:53');
INSERT INTO `multi_user_shop` VALUES (173, 290, 1, '2016-03-09 20:26:03');
INSERT INTO `multi_user_shop` VALUES (174, 292, 115, '2016-03-09 20:32:37');
INSERT INTO `multi_user_shop` VALUES (175, 293, 115, '2016-03-09 20:43:27');
INSERT INTO `multi_user_shop` VALUES (176, 295, 115, '2016-03-09 20:48:40');
INSERT INTO `multi_user_shop` VALUES (177, 297, 115, '2016-03-09 20:59:45');
INSERT INTO `multi_user_shop` VALUES (178, 299, 115, '2016-03-09 21:03:34');
INSERT INTO `multi_user_shop` VALUES (179, 301, 115, '2016-03-09 21:11:56');
INSERT INTO `multi_user_shop` VALUES (180, 302, 80, '2016-03-09 21:12:36');
INSERT INTO `multi_user_shop` VALUES (181, 303, 80, '2016-03-09 21:13:28');
INSERT INTO `multi_user_shop` VALUES (182, 305, 115, '2016-03-09 21:19:32');
INSERT INTO `multi_user_shop` VALUES (183, 306, 115, '2016-03-09 21:19:40');
INSERT INTO `multi_user_shop` VALUES (184, 307, 16, '2016-03-09 21:24:03');
INSERT INTO `multi_user_shop` VALUES (185, 310, 115, '2016-03-09 21:27:38');
INSERT INTO `multi_user_shop` VALUES (186, 311, 40, '2016-03-09 21:27:48');
INSERT INTO `multi_user_shop` VALUES (187, 313, 115, '2016-03-09 21:28:14');
INSERT INTO `multi_user_shop` VALUES (188, 315, 115, '2016-03-09 21:37:06');
INSERT INTO `multi_user_shop` VALUES (189, 317, 115, '2016-03-09 21:41:22');
INSERT INTO `multi_user_shop` VALUES (190, 318, 115, '2016-03-09 22:03:57');
INSERT INTO `multi_user_shop` VALUES (191, 320, 115, '2016-03-09 22:11:24');
INSERT INTO `multi_user_shop` VALUES (192, 322, 115, '2016-03-09 22:23:58');
INSERT INTO `multi_user_shop` VALUES (193, 324, 115, '2016-03-09 22:25:42');
INSERT INTO `multi_user_shop` VALUES (194, 326, 115, '2016-03-09 23:00:54');
INSERT INTO `multi_user_shop` VALUES (195, 327, 40, '2016-03-09 23:09:06');
INSERT INTO `multi_user_shop` VALUES (196, 329, 40, '2016-03-09 23:17:47');
INSERT INTO `multi_user_shop` VALUES (197, 331, 115, '2016-03-09 23:21:15');
INSERT INTO `multi_user_shop` VALUES (198, 334, 115, '2016-03-09 23:21:42');
INSERT INTO `multi_user_shop` VALUES (199, 335, 115, '2016-03-09 23:22:05');
INSERT INTO `multi_user_shop` VALUES (200, 336, 115, '2016-03-09 23:23:40');
INSERT INTO `multi_user_shop` VALUES (201, 337, 16, '2016-03-09 23:38:14');
INSERT INTO `multi_user_shop` VALUES (202, 337, 1, '2016-03-09 23:40:51');
INSERT INTO `multi_user_shop` VALUES (203, 338, 115, '2016-03-09 23:52:10');
INSERT INTO `multi_user_shop` VALUES (204, 339, 40, '2016-03-10 06:34:46');
INSERT INTO `multi_user_shop` VALUES (205, 340, 40, '2016-03-10 07:09:01');
INSERT INTO `multi_user_shop` VALUES (206, 341, 80, '2016-03-10 07:27:33');
INSERT INTO `multi_user_shop` VALUES (207, 343, 115, '2016-03-10 07:27:57');
INSERT INTO `multi_user_shop` VALUES (208, 344, 115, '2016-03-10 07:44:12');
INSERT INTO `multi_user_shop` VALUES (209, 345, 63, '2016-03-10 08:19:00');
INSERT INTO `multi_user_shop` VALUES (210, 251, 8, '2016-03-10 08:25:48');
INSERT INTO `multi_user_shop` VALUES (211, 251, 1, '2016-03-10 08:26:37');
INSERT INTO `multi_user_shop` VALUES (212, 347, 115, '2016-03-10 09:21:21');
INSERT INTO `multi_user_shop` VALUES (213, 349, 115, '2016-03-10 09:24:50');
INSERT INTO `multi_user_shop` VALUES (214, 352, 8, '2016-03-10 10:25:45');
INSERT INTO `multi_user_shop` VALUES (215, 354, 115, '2016-03-10 10:31:35');
INSERT INTO `multi_user_shop` VALUES (216, 159, 114, '2016-03-10 11:34:47');
INSERT INTO `multi_user_shop` VALUES (217, 357, 115, '2016-03-10 11:57:58');
INSERT INTO `multi_user_shop` VALUES (218, 359, 115, '2016-03-10 12:01:29');
INSERT INTO `multi_user_shop` VALUES (219, 361, 115, '2016-03-10 12:04:58');
INSERT INTO `multi_user_shop` VALUES (220, 363, 115, '2016-03-10 12:10:25');
INSERT INTO `multi_user_shop` VALUES (221, 365, 115, '2016-03-10 12:55:54');
INSERT INTO `multi_user_shop` VALUES (222, 368, 115, '2016-03-10 13:16:16');
INSERT INTO `multi_user_shop` VALUES (223, 370, 63, '2016-03-10 13:18:02');
INSERT INTO `multi_user_shop` VALUES (224, 374, 115, '2016-03-10 13:19:53');
INSERT INTO `multi_user_shop` VALUES (225, 376, 115, '2016-03-10 13:20:15');
INSERT INTO `multi_user_shop` VALUES (226, 378, 115, '2016-03-10 13:23:33');
INSERT INTO `multi_user_shop` VALUES (227, 379, 40, '2016-03-10 13:23:53');
INSERT INTO `multi_user_shop` VALUES (228, 380, 80, '2016-03-10 13:27:57');
INSERT INTO `multi_user_shop` VALUES (229, 381, 115, '2016-03-10 14:00:30');
INSERT INTO `multi_user_shop` VALUES (230, 383, 115, '2016-03-10 14:01:23');
INSERT INTO `multi_user_shop` VALUES (231, 385, 115, '2016-03-10 14:25:05');
INSERT INTO `multi_user_shop` VALUES (232, 386, 70, '2016-03-10 14:40:20');
INSERT INTO `multi_user_shop` VALUES (233, 389, 115, '2016-03-10 15:57:34');
INSERT INTO `multi_user_shop` VALUES (234, 390, 40, '2016-03-10 16:20:23');
INSERT INTO `multi_user_shop` VALUES (235, 392, 115, '2016-03-10 16:29:12');
INSERT INTO `multi_user_shop` VALUES (236, 393, 9, '2016-03-10 16:38:25');
INSERT INTO `multi_user_shop` VALUES (237, 396, 115, '2016-03-10 16:57:25');
INSERT INTO `multi_user_shop` VALUES (238, 397, 16, '2016-03-10 17:15:01');
INSERT INTO `multi_user_shop` VALUES (239, 397, 9, '2016-03-10 17:17:20');
INSERT INTO `multi_user_shop` VALUES (240, 399, 115, '2016-03-10 17:25:10');
INSERT INTO `multi_user_shop` VALUES (241, 400, 115, '2016-03-10 17:53:11');
INSERT INTO `multi_user_shop` VALUES (242, 402, 115, '2016-03-10 18:12:39');
INSERT INTO `multi_user_shop` VALUES (243, 272, 16, '2016-03-10 18:23:28');
INSERT INTO `multi_user_shop` VALUES (244, 272, 12, '2016-03-10 18:26:29');
INSERT INTO `multi_user_shop` VALUES (245, 406, 115, '2016-03-10 18:27:36');
INSERT INTO `multi_user_shop` VALUES (246, 272, 9, '2016-03-10 18:28:02');
INSERT INTO `multi_user_shop` VALUES (247, 272, 8, '2016-03-10 18:28:19');
INSERT INTO `multi_user_shop` VALUES (248, 272, 1, '2016-03-10 18:28:39');
INSERT INTO `multi_user_shop` VALUES (249, 407, 80, '2016-03-10 18:43:30');
INSERT INTO `multi_user_shop` VALUES (250, 272, 114, '2016-03-10 18:48:03');
INSERT INTO `multi_user_shop` VALUES (251, 410, 115, '2016-03-10 19:03:45');
INSERT INTO `multi_user_shop` VALUES (252, 411, 40, '2016-03-10 19:26:34');
INSERT INTO `multi_user_shop` VALUES (253, 412, 114, '2016-03-10 19:27:56');
INSERT INTO `multi_user_shop` VALUES (254, 413, 115, '2016-03-10 19:30:14');
INSERT INTO `multi_user_shop` VALUES (255, 414, 80, '2016-03-10 19:36:59');
INSERT INTO `multi_user_shop` VALUES (256, 196, 19, '2016-03-10 19:39:45');
INSERT INTO `multi_user_shop` VALUES (257, 415, 115, '2016-03-10 19:43:00');
INSERT INTO `multi_user_shop` VALUES (258, 416, 40, '2016-03-10 19:47:15');
INSERT INTO `multi_user_shop` VALUES (259, 418, 115, '2016-03-10 20:07:16');
INSERT INTO `multi_user_shop` VALUES (260, 419, 16, '2016-03-10 20:13:26');
INSERT INTO `multi_user_shop` VALUES (261, 279, 115, '2016-03-10 20:16:19');
INSERT INTO `multi_user_shop` VALUES (262, 421, 115, '2016-03-10 20:21:33');
INSERT INTO `multi_user_shop` VALUES (263, 422, 115, '2016-03-10 20:24:48');
INSERT INTO `multi_user_shop` VALUES (264, 424, 115, '2016-03-10 20:35:05');
INSERT INTO `multi_user_shop` VALUES (265, 425, 19, '2016-03-10 20:40:18');
INSERT INTO `multi_user_shop` VALUES (266, 427, 115, '2016-03-10 21:21:35');
INSERT INTO `multi_user_shop` VALUES (267, 430, 115, '2016-03-10 21:30:50');
INSERT INTO `multi_user_shop` VALUES (268, 432, 115, '2016-03-10 21:33:33');
INSERT INTO `multi_user_shop` VALUES (269, 433, 40, '2016-03-10 21:33:41');
INSERT INTO `multi_user_shop` VALUES (270, 434, 40, '2016-03-10 21:44:53');
INSERT INTO `multi_user_shop` VALUES (271, 437, 115, '2016-03-10 21:55:19');
INSERT INTO `multi_user_shop` VALUES (272, 439, 115, '2016-03-10 21:59:29');
INSERT INTO `multi_user_shop` VALUES (273, 441, 115, '2016-03-10 22:10:14');
INSERT INTO `multi_user_shop` VALUES (274, 443, 115, '2016-03-10 22:13:17');
INSERT INTO `multi_user_shop` VALUES (275, 446, 115, '2016-03-10 22:20:28');
INSERT INTO `multi_user_shop` VALUES (276, 449, 115, '2016-03-10 22:39:47');
INSERT INTO `multi_user_shop` VALUES (277, 451, 115, '2016-03-10 22:39:53');
INSERT INTO `multi_user_shop` VALUES (278, 452, 40, '2016-03-10 22:41:17');
INSERT INTO `multi_user_shop` VALUES (279, 454, 115, '2016-03-10 22:42:34');
INSERT INTO `multi_user_shop` VALUES (280, 455, 12, '2016-03-10 22:44:51');
INSERT INTO `multi_user_shop` VALUES (281, 457, 40, '2016-03-10 23:05:07');
INSERT INTO `multi_user_shop` VALUES (282, 266, 9, '2016-03-11 00:15:59');
INSERT INTO `multi_user_shop` VALUES (283, 469, 115, '2016-03-11 10:35:35');
INSERT INTO `multi_user_shop` VALUES (284, 470, 115, '2016-03-11 10:38:19');
INSERT INTO `multi_user_shop` VALUES (285, 471, 115, '2016-03-11 10:40:47');
INSERT INTO `multi_user_shop` VALUES (286, 472, 115, '2016-03-11 10:42:47');
INSERT INTO `multi_user_shop` VALUES (287, 473, 115, '2016-03-11 11:27:53');
INSERT INTO `multi_user_shop` VALUES (288, 474, 40, '2016-03-11 11:52:25');
INSERT INTO `multi_user_shop` VALUES (289, 476, 115, '2016-03-11 12:05:25');
INSERT INTO `multi_user_shop` VALUES (290, 477, 123, '2016-03-11 12:42:45');
INSERT INTO `multi_user_shop` VALUES (291, 479, 115, '2016-03-11 13:51:21');
INSERT INTO `multi_user_shop` VALUES (292, 481, 115, '2016-03-11 14:09:27');
INSERT INTO `multi_user_shop` VALUES (293, 483, 1, '2016-03-11 14:44:55');
INSERT INTO `multi_user_shop` VALUES (294, 483, 19, '2016-03-11 14:45:28');
INSERT INTO `multi_user_shop` VALUES (295, 483, 16, '2016-03-11 14:45:38');
INSERT INTO `multi_user_shop` VALUES (296, 483, 12, '2016-03-11 14:46:19');
INSERT INTO `multi_user_shop` VALUES (297, 483, 8, '2016-03-11 14:46:32');
INSERT INTO `multi_user_shop` VALUES (298, 484, 40, '2016-03-11 14:55:15');
INSERT INTO `multi_user_shop` VALUES (299, 485, 40, '2016-03-11 14:56:57');
INSERT INTO `multi_user_shop` VALUES (300, 487, 115, '2016-03-11 14:57:17');
INSERT INTO `multi_user_shop` VALUES (301, 489, 115, '2016-03-11 15:22:56');
INSERT INTO `multi_user_shop` VALUES (302, 221, 9, '2016-03-11 15:44:12');
INSERT INTO `multi_user_shop` VALUES (303, 490, 115, '2016-03-11 16:03:56');
INSERT INTO `multi_user_shop` VALUES (304, 491, 9, '2016-03-11 17:26:02');
INSERT INTO `multi_user_shop` VALUES (305, 492, 40, '2016-03-11 17:39:40');
INSERT INTO `multi_user_shop` VALUES (306, 493, 40, '2016-03-11 17:46:57');
INSERT INTO `multi_user_shop` VALUES (307, 494, 40, '2016-03-11 17:48:49');
INSERT INTO `multi_user_shop` VALUES (308, 495, 123, '2016-03-11 18:01:05');
INSERT INTO `multi_user_shop` VALUES (309, 497, 115, '2016-03-11 18:25:22');
INSERT INTO `multi_user_shop` VALUES (310, 499, 115, '2016-03-11 18:29:41');
INSERT INTO `multi_user_shop` VALUES (311, 501, 115, '2016-03-11 18:30:39');
INSERT INTO `multi_user_shop` VALUES (312, 503, 115, '2016-03-11 18:33:07');
INSERT INTO `multi_user_shop` VALUES (313, 505, 115, '2016-03-11 18:35:30');
INSERT INTO `multi_user_shop` VALUES (314, 507, 115, '2016-03-11 18:56:30');
INSERT INTO `multi_user_shop` VALUES (315, 509, 115, '2016-03-11 18:58:25');
INSERT INTO `multi_user_shop` VALUES (316, 511, 115, '2016-03-11 19:04:38');
INSERT INTO `multi_user_shop` VALUES (317, 513, 115, '2016-03-11 19:08:03');
INSERT INTO `multi_user_shop` VALUES (318, 516, 115, '2016-03-11 19:24:59');
INSERT INTO `multi_user_shop` VALUES (319, 518, 115, '2016-03-11 19:35:26');
INSERT INTO `multi_user_shop` VALUES (320, 520, 115, '2016-03-11 19:39:27');
INSERT INTO `multi_user_shop` VALUES (321, 522, 115, '2016-03-11 20:09:33');
INSERT INTO `multi_user_shop` VALUES (322, 523, 19, '2016-03-11 20:10:49');
INSERT INTO `multi_user_shop` VALUES (323, 526, 115, '2016-03-11 20:21:17');
INSERT INTO `multi_user_shop` VALUES (324, 527, 19, '2016-03-11 20:22:08');
INSERT INTO `multi_user_shop` VALUES (325, 527, 8, '2016-03-11 20:23:10');
INSERT INTO `multi_user_shop` VALUES (326, 527, 16, '2016-03-11 20:23:44');
INSERT INTO `multi_user_shop` VALUES (327, 529, 115, '2016-03-11 20:31:45');
INSERT INTO `multi_user_shop` VALUES (328, 531, 115, '2016-03-11 20:34:11');
INSERT INTO `multi_user_shop` VALUES (329, 527, 115, '2016-03-11 20:34:42');
INSERT INTO `multi_user_shop` VALUES (330, 533, 115, '2016-03-11 20:37:15');
INSERT INTO `multi_user_shop` VALUES (331, 535, 115, '2016-03-11 20:45:43');
INSERT INTO `multi_user_shop` VALUES (332, 537, 115, '2016-03-11 20:46:32');
INSERT INTO `multi_user_shop` VALUES (333, 540, 40, '2016-03-11 20:54:14');
INSERT INTO `multi_user_shop` VALUES (334, 539, 115, '2016-03-11 20:56:30');
INSERT INTO `multi_user_shop` VALUES (335, 541, 40, '2016-03-11 21:01:18');
INSERT INTO `multi_user_shop` VALUES (336, 543, 115, '2016-03-11 21:23:51');
INSERT INTO `multi_user_shop` VALUES (337, 545, 115, '2016-03-11 21:35:02');
INSERT INTO `multi_user_shop` VALUES (338, 547, 115, '2016-03-11 21:49:33');
INSERT INTO `multi_user_shop` VALUES (339, 549, 115, '2016-03-11 22:09:58');
INSERT INTO `multi_user_shop` VALUES (340, 551, 115, '2016-03-11 22:15:20');
INSERT INTO `multi_user_shop` VALUES (341, 554, 115, '2016-03-11 22:28:18');
INSERT INTO `multi_user_shop` VALUES (342, 556, 115, '2016-03-11 22:46:08');
INSERT INTO `multi_user_shop` VALUES (343, 557, 40, '2016-03-11 22:47:24');
INSERT INTO `multi_user_shop` VALUES (344, 558, 115, '2016-03-11 22:51:21');
INSERT INTO `multi_user_shop` VALUES (345, 559, 115, '2016-03-11 22:53:50');
INSERT INTO `multi_user_shop` VALUES (346, 561, 115, '2016-03-11 22:56:24');
INSERT INTO `multi_user_shop` VALUES (347, 563, 115, '2016-03-11 22:59:42');
INSERT INTO `multi_user_shop` VALUES (348, 564, 115, '2016-03-11 23:03:24');
INSERT INTO `multi_user_shop` VALUES (349, 566, 115, '2016-03-11 23:12:21');
INSERT INTO `multi_user_shop` VALUES (350, 568, 115, '2016-03-11 23:57:00');
INSERT INTO `multi_user_shop` VALUES (351, 570, 115, '2016-03-12 00:32:57');
INSERT INTO `multi_user_shop` VALUES (352, 571, 115, '2016-03-12 03:13:57');
INSERT INTO `multi_user_shop` VALUES (353, 573, 115, '2016-03-12 09:14:38');
INSERT INTO `multi_user_shop` VALUES (354, 577, 115, '2016-03-12 09:46:08');
INSERT INTO `multi_user_shop` VALUES (355, 578, 19, '2016-03-12 09:57:08');
INSERT INTO `multi_user_shop` VALUES (356, 578, 12, '2016-03-12 09:57:33');
INSERT INTO `multi_user_shop` VALUES (357, 578, 8, '2016-03-12 09:57:48');
INSERT INTO `multi_user_shop` VALUES (358, 580, 115, '2016-03-12 10:30:35');
INSERT INTO `multi_user_shop` VALUES (359, 582, 115, '2016-03-12 10:36:44');
INSERT INTO `multi_user_shop` VALUES (360, 583, 19, '2016-03-12 10:44:01');
INSERT INTO `multi_user_shop` VALUES (361, 584, 8, '2016-03-12 10:45:02');
INSERT INTO `multi_user_shop` VALUES (362, 586, 115, '2016-03-12 11:02:26');
INSERT INTO `multi_user_shop` VALUES (363, 587, 40, '2016-03-12 11:06:03');
INSERT INTO `multi_user_shop` VALUES (364, 589, 115, '2016-03-12 11:19:03');
INSERT INTO `multi_user_shop` VALUES (365, 591, 115, '2016-03-12 11:29:38');
INSERT INTO `multi_user_shop` VALUES (366, 593, 115, '2016-03-12 11:30:34');
INSERT INTO `multi_user_shop` VALUES (367, 595, 115, '2016-03-12 11:36:12');
INSERT INTO `multi_user_shop` VALUES (368, 597, 115, '2016-03-12 11:36:18');
INSERT INTO `multi_user_shop` VALUES (369, 598, 63, '2016-03-12 11:39:25');
INSERT INTO `multi_user_shop` VALUES (370, 599, 115, '2016-03-12 11:55:23');
INSERT INTO `multi_user_shop` VALUES (371, 600, 9, '2016-03-12 11:55:53');
INSERT INTO `multi_user_shop` VALUES (372, 600, 16, '2016-03-12 11:56:39');
INSERT INTO `multi_user_shop` VALUES (373, 603, 115, '2016-03-12 13:00:04');
INSERT INTO `multi_user_shop` VALUES (374, 605, 115, '2016-03-12 13:14:40');
INSERT INTO `multi_user_shop` VALUES (375, 606, 40, '2016-03-12 14:51:51');
INSERT INTO `multi_user_shop` VALUES (376, 607, 115, '2016-03-12 14:58:59');
INSERT INTO `multi_user_shop` VALUES (377, 608, 115, '2016-03-12 15:18:13');
INSERT INTO `multi_user_shop` VALUES (378, 609, 12, '2016-03-12 15:34:45');
INSERT INTO `multi_user_shop` VALUES (379, 610, 40, '2016-03-12 15:47:04');
INSERT INTO `multi_user_shop` VALUES (380, 612, 121, '2016-03-12 16:18:43');
INSERT INTO `multi_user_shop` VALUES (381, 613, 115, '2016-03-12 16:47:50');
INSERT INTO `multi_user_shop` VALUES (382, 612, 19, '2016-03-12 16:49:53');
INSERT INTO `multi_user_shop` VALUES (383, 612, 16, '2016-03-12 16:50:40');
INSERT INTO `multi_user_shop` VALUES (384, 615, 115, '2016-03-12 16:54:29');
INSERT INTO `multi_user_shop` VALUES (385, 616, 40, '2016-03-12 17:44:29');
INSERT INTO `multi_user_shop` VALUES (386, 617, 40, '2016-03-12 18:00:42');
INSERT INTO `multi_user_shop` VALUES (387, 619, 115, '2016-03-12 18:39:39');
INSERT INTO `multi_user_shop` VALUES (388, 621, 115, '2016-03-12 19:31:03');
INSERT INTO `multi_user_shop` VALUES (389, 623, 115, '2016-03-12 19:33:17');
INSERT INTO `multi_user_shop` VALUES (390, 625, 115, '2016-03-12 19:34:23');
INSERT INTO `multi_user_shop` VALUES (391, 627, 115, '2016-03-12 19:41:09');
INSERT INTO `multi_user_shop` VALUES (392, 629, 63, '2016-03-12 19:50:45');
INSERT INTO `multi_user_shop` VALUES (393, 632, 115, '2016-03-12 20:23:53');
INSERT INTO `multi_user_shop` VALUES (394, 634, 9, '2016-03-12 20:44:53');
INSERT INTO `multi_user_shop` VALUES (395, 634, 19, '2016-03-12 20:45:02');
INSERT INTO `multi_user_shop` VALUES (396, 636, 115, '2016-03-12 20:49:24');
INSERT INTO `multi_user_shop` VALUES (397, 639, 115, '2016-03-12 20:56:08');
INSERT INTO `multi_user_shop` VALUES (398, 641, 115, '2016-03-12 20:59:42');
INSERT INTO `multi_user_shop` VALUES (399, 643, 115, '2016-03-12 21:01:02');
INSERT INTO `multi_user_shop` VALUES (400, 646, 115, '2016-03-12 21:37:48');
INSERT INTO `multi_user_shop` VALUES (401, 647, 115, '2016-03-13 07:45:43');
INSERT INTO `multi_user_shop` VALUES (402, 648, 40, '2016-03-13 08:03:52');
INSERT INTO `multi_user_shop` VALUES (403, 649, 40, '2016-03-13 08:42:13');
INSERT INTO `multi_user_shop` VALUES (404, 650, 40, '2016-03-13 08:53:25');
INSERT INTO `multi_user_shop` VALUES (405, 651, 40, '2016-03-13 08:58:34');
INSERT INTO `multi_user_shop` VALUES (406, 652, 40, '2016-03-13 09:01:36');
INSERT INTO `multi_user_shop` VALUES (407, 653, 40, '2016-03-13 09:14:30');
INSERT INTO `multi_user_shop` VALUES (408, 654, 114, '2016-03-13 09:22:04');
INSERT INTO `multi_user_shop` VALUES (409, 655, 40, '2016-03-13 09:45:43');
INSERT INTO `multi_user_shop` VALUES (410, 656, 40, '2016-03-13 10:12:19');
INSERT INTO `multi_user_shop` VALUES (411, 657, 40, '2016-03-13 10:20:11');
INSERT INTO `multi_user_shop` VALUES (412, 658, 40, '2016-03-13 10:32:37');
INSERT INTO `multi_user_shop` VALUES (413, 661, 115, '2016-03-13 10:53:10');
INSERT INTO `multi_user_shop` VALUES (414, 662, 40, '2016-03-13 11:08:54');
INSERT INTO `multi_user_shop` VALUES (415, 664, 115, '2016-03-13 11:23:35');
INSERT INTO `multi_user_shop` VALUES (416, 666, 115, '2016-03-13 11:25:07');
INSERT INTO `multi_user_shop` VALUES (417, 668, 115, '2016-03-13 11:26:14');
INSERT INTO `multi_user_shop` VALUES (418, 671, 115, '2016-03-13 11:28:41');
INSERT INTO `multi_user_shop` VALUES (419, 673, 115, '2016-03-13 11:34:02');
INSERT INTO `multi_user_shop` VALUES (420, 675, 115, '2016-03-13 11:34:59');
INSERT INTO `multi_user_shop` VALUES (421, 677, 115, '2016-03-13 11:37:54');
INSERT INTO `multi_user_shop` VALUES (422, 679, 115, '2016-03-13 11:40:28');
INSERT INTO `multi_user_shop` VALUES (423, 681, 115, '2016-03-13 11:47:38');
INSERT INTO `multi_user_shop` VALUES (424, 683, 115, '2016-03-13 11:56:41');
INSERT INTO `multi_user_shop` VALUES (425, 686, 115, '2016-03-13 12:25:57');
INSERT INTO `multi_user_shop` VALUES (426, 687, 40, '2016-03-13 12:34:28');
INSERT INTO `multi_user_shop` VALUES (427, 688, 40, '2016-03-13 12:49:03');
INSERT INTO `multi_user_shop` VALUES (428, 690, 115, '2016-03-13 13:11:43');
INSERT INTO `multi_user_shop` VALUES (429, 692, 115, '2016-03-13 13:21:12');
INSERT INTO `multi_user_shop` VALUES (430, 694, 115, '2016-03-13 13:23:22');
INSERT INTO `multi_user_shop` VALUES (431, 695, 123, '2016-03-13 13:27:01');
INSERT INTO `multi_user_shop` VALUES (432, 696, 9, '2016-03-13 13:35:01');
INSERT INTO `multi_user_shop` VALUES (433, 697, 40, '2016-03-13 13:40:08');
INSERT INTO `multi_user_shop` VALUES (434, 700, 115, '2016-03-13 13:47:34');
INSERT INTO `multi_user_shop` VALUES (435, 701, 40, '2016-03-13 13:59:20');
INSERT INTO `multi_user_shop` VALUES (436, 702, 9, '2016-03-13 14:01:32');
INSERT INTO `multi_user_shop` VALUES (437, 704, 115, '2016-03-13 14:15:57');
INSERT INTO `multi_user_shop` VALUES (438, 706, 115, '2016-03-13 14:42:58');
INSERT INTO `multi_user_shop` VALUES (439, 708, 115, '2016-03-13 14:43:08');
INSERT INTO `multi_user_shop` VALUES (440, 710, 115, '2016-03-13 14:48:49');
INSERT INTO `multi_user_shop` VALUES (441, 712, 115, '2016-03-13 15:00:56');
INSERT INTO `multi_user_shop` VALUES (442, 714, 115, '2016-03-13 15:03:12');
INSERT INTO `multi_user_shop` VALUES (443, 716, 115, '2016-03-13 15:07:04');
INSERT INTO `multi_user_shop` VALUES (444, 718, 115, '2016-03-13 15:40:09');
INSERT INTO `multi_user_shop` VALUES (445, 721, 115, '2016-03-13 16:03:06');
INSERT INTO `multi_user_shop` VALUES (446, 722, 40, '2016-03-13 16:05:11');
INSERT INTO `multi_user_shop` VALUES (447, 724, 115, '2016-03-13 16:10:15');
INSERT INTO `multi_user_shop` VALUES (448, 727, 115, '2016-03-13 16:36:54');
INSERT INTO `multi_user_shop` VALUES (449, 729, 115, '2016-03-13 16:40:14');
INSERT INTO `multi_user_shop` VALUES (450, 731, 115, '2016-03-13 16:51:44');
INSERT INTO `multi_user_shop` VALUES (451, 732, 40, '2016-03-13 16:57:36');
INSERT INTO `multi_user_shop` VALUES (452, 733, 114, '2016-03-13 17:17:04');
INSERT INTO `multi_user_shop` VALUES (453, 734, 114, '2016-03-13 17:17:17');
INSERT INTO `multi_user_shop` VALUES (454, 736, 115, '2016-03-13 17:28:48');
INSERT INTO `multi_user_shop` VALUES (455, 738, 115, '2016-03-13 17:31:29');
INSERT INTO `multi_user_shop` VALUES (456, 739, 40, '2016-03-13 17:38:36');
INSERT INTO `multi_user_shop` VALUES (457, 741, 115, '2016-03-13 17:40:10');
INSERT INTO `multi_user_shop` VALUES (458, 743, 115, '2016-03-13 17:56:11');
INSERT INTO `multi_user_shop` VALUES (459, 745, 115, '2016-03-13 17:58:09');
INSERT INTO `multi_user_shop` VALUES (460, 749, 115, '2016-03-13 18:04:00');
INSERT INTO `multi_user_shop` VALUES (461, 750, 115, '2016-03-13 18:04:06');
INSERT INTO `multi_user_shop` VALUES (462, 753, 115, '2016-03-13 18:07:59');
INSERT INTO `multi_user_shop` VALUES (463, 754, 115, '2016-03-13 18:12:08');
INSERT INTO `multi_user_shop` VALUES (464, 755, 40, '2016-03-13 18:18:08');
INSERT INTO `multi_user_shop` VALUES (465, 757, 115, '2016-03-13 18:28:22');
INSERT INTO `multi_user_shop` VALUES (466, 759, 115, '2016-03-13 18:57:54');
INSERT INTO `multi_user_shop` VALUES (467, 761, 40, '2016-03-13 20:14:11');
INSERT INTO `multi_user_shop` VALUES (468, 762, 40, '2016-03-13 20:30:32');
INSERT INTO `multi_user_shop` VALUES (469, 763, 8, '2016-03-13 20:32:36');
INSERT INTO `multi_user_shop` VALUES (470, 764, 80, '2016-03-13 20:47:54');
INSERT INTO `multi_user_shop` VALUES (471, 767, 115, '2016-03-13 21:14:20');
INSERT INTO `multi_user_shop` VALUES (472, 768, 115, '2016-03-13 21:14:27');
INSERT INTO `multi_user_shop` VALUES (473, 769, 115, '2016-03-13 21:32:02');
INSERT INTO `multi_user_shop` VALUES (474, 771, 115, '2016-03-13 21:48:03');
INSERT INTO `multi_user_shop` VALUES (475, 773, 115, '2016-03-13 21:56:49');
INSERT INTO `multi_user_shop` VALUES (476, 775, 115, '2016-03-13 22:42:03');
INSERT INTO `multi_user_shop` VALUES (477, 777, 115, '2016-03-13 22:57:49');
INSERT INTO `multi_user_shop` VALUES (478, 778, 40, '2016-03-13 23:01:45');
INSERT INTO `multi_user_shop` VALUES (479, 780, 115, '2016-03-14 00:06:17');
INSERT INTO `multi_user_shop` VALUES (480, 155, 115, '2016-03-14 09:20:00');
INSERT INTO `multi_user_shop` VALUES (481, 785, 115, '2016-03-14 09:21:16');
INSERT INTO `multi_user_shop` VALUES (482, 787, 115, '2016-03-14 09:25:56');
INSERT INTO `multi_user_shop` VALUES (483, 788, 40, '2016-03-14 10:32:29');
INSERT INTO `multi_user_shop` VALUES (484, 2, 3, '2016-03-18 15:41:11');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_wx_config`
-- 

CREATE TABLE `multi_wx_config` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `appid` text NOT NULL,
  `appsecret` text NOT NULL,
  `encodingaeskey` text NOT NULL,
  `switch` int(11) NOT NULL,
  `mchid` text NOT NULL,
  `key` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `multi_wx_config`
-- 

INSERT INTO `multi_wx_config` VALUES (1, 'wemall', 'wx6d040141df50d9a3', '523c93737918e8476654cc8f73133824', 'vkG6JOKy7f2f2nejqJFlOJkjJEK5JJlN5JjjSQ6Q2gM', 0, '1243050102', '0IVTlxNMurPnBga2ulahd7g4m36jirgR', '2016-04-07 15:05:57');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_wx_menu`
-- 

CREATE TABLE `multi_wx_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` text,
  `name` text NOT NULL,
  `key` text NOT NULL,
  `url` text NOT NULL,
  `pid` int(5) NOT NULL DEFAULT '0',
  `rank` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `multi_wx_menu`
-- 

INSERT INTO `multi_wx_menu` VALUES (1, 'view', '商业版', '', 'http://1.inuoer.com/wemall/App/Index/index', 0, '', 0, NULL, '2015-11-06 17:25:17');
INSERT INTO `multi_wx_menu` VALUES (2, 'view', '分销版', '', 'http://1.inuoer.com/wfx/App/Shop/index', 0, '', 0, NULL, '2015-11-06 17:25:28');
INSERT INTO `multi_wx_menu` VALUES (3, 'click', 'QQ客服', 'qqkf', '', 0, '', 0, '2034210985', '2015-12-31 16:19:22');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_wx_print`
-- 

CREATE TABLE `multi_wx_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `apikey` varchar(100) DEFAULT NULL COMMENT 'apikey',
  `mkey` varchar(100) DEFAULT NULL COMMENT '秘钥',
  `partner` varchar(100) DEFAULT NULL COMMENT '用户id',
  `machine_code` varchar(100) DEFAULT NULL COMMENT '机器码',
  `switch` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- 导出表中的数据 `multi_wx_print`
-- 

INSERT INTO `multi_wx_print` VALUES (1, 40, '792b5530109d7c1527eb5bb5921f5f4bbf0fe6c1', 'juvn63uqnmf7', '3706', '4004506294', 1, '2016-03-06 09:35:12');
INSERT INTO `multi_wx_print` VALUES (4, 136, '12', '2', '789', '3', 1, '2016-04-06 16:59:03');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_wx_reply`
-- 

CREATE TABLE `multi_wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `key` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `multi_wx_reply`
-- 

INSERT INTO `multi_wx_reply` VALUES (1, 'text', '恭喜你加入WeMall，欢迎体验WeMall商业版，WeMall分销版和WeMall开源版。WeMall商业版更新，速度提升30%，致力于打造世界上最快，体验最好的微商城。客服QQ：2034210985', '', 23, '', 'subscribe', '', '2016-01-05 10:19:53');
INSERT INTO `multi_wx_reply` VALUES (2, 'news', '欢迎来到商业版wemall商城', '欢迎来到商业版wemall商城', 28, 'http://1.inuoer.com/3/App/Index/index', '商城', '', '2016-01-05 10:23:41');

-- --------------------------------------------------------

-- 
-- 表的结构 `multi_wx_tplmsg`
-- 

CREATE TABLE `multi_wx_tplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id_short` text NOT NULL,
  `template_id` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `multi_wx_tplmsg`
-- 

INSERT INTO `multi_wx_tplmsg` VALUES (1, 'OPENTM201785396', '2fXIC52dOVv9NXPbpBN7O9C9W5N5qT28G6OuzVilUt4', '2015-11-16 13:30:56');
INSERT INTO `multi_wx_tplmsg` VALUES (2, 'OPENTM207791277', 'gdKGxJYc6N-sKc7yvv1Gcf9YOOinCy2WiqPcTs3NfWU', '2016-01-06 20:41:45');
INSERT INTO `multi_wx_tplmsg` VALUES (3, 'OPENTM207763419', 'Geb3MkzmDZBCpz4Kwk6SwROTyRbxNC7ZsTigg8B3yw0', '2016-04-07 16:27:07');
