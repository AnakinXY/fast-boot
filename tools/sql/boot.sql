# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20057
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 8.0.28)
# 数据库: boot
# 生成时间: 2023-11-09 12:28:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 sys_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父节点id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父节点id路径',
  `sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态(1:正常;0:禁用)',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '修改人ID',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除标识(1:已删除;0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`id`, `name`, `parent_id`, `tree_path`, `sort`, `status`, `create_by`, `update_by`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'普鲁顿科技',0,'0',1,1,1,1,'2022-04-19 12:46:37','2022-04-19 12:46:37',0),
	(2,'研发部门',1,'0,1',1,1,2,2,'2022-04-19 12:46:37','2022-04-19 12:46:37',0),
	(3,'测试部门',1,'0,1',1,1,2,2,'2022-04-19 12:46:37','2023-10-23 11:29:40',0),
	(4,'销售部门',1,'0,1',1,1,1,1,'2022-04-19 12:46:37','2022-04-19 12:46:37',0);

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典项名称',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典项值',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态(1:正常;0:禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` bigint NOT NULL DEFAULT '0' COMMENT '是否默认(1:是;0:否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;

INSERT INTO `sys_dict` (`id`, `type_code`, `name`, `value`, `sort`, `status`, `remark`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'gender','男','1',1,1,'','2019-05-05 13:07:52','2022-06-12 23:20:39',0),
	(2,'gender','女','2',2,1,'','2019-04-19 11:33:00','2019-07-02 14:23:05',0),
	(3,'gender','未知','0',1,1,'','2020-10-17 08:09:31','2023-10-23 12:12:01',0);

/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_dict_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型编码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1:正常;0:禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;

INSERT INTO `sys_dict_type` (`id`, `name`, `code`, `status`, `remark`, `created_at`, `updated_at`)
VALUES
	(1,'性别','gender',1,'','2019-12-06 19:03:32','2022-06-12 16:21:28');

/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父节点ID路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型(1:菜单；2:目录；3:外链；4:按钮)',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由路径(浏览器地址栏路径)',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径(vue页面完整路径，省略.vue后缀)',
  `perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态(1-显示;0-隐藏)',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跳转路径',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单管理';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`id`, `parent_id`, `tree_path`, `name`, `type`, `path`, `component`, `perm`, `visible`, `sort`, `icon`, `redirect`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,0,'0','系统管理',2,'/system','Layout','',1,99,'system','/system/user','2021-08-28 09:12:21','2023-10-29 00:21:37',0),
	(2,1,'0,1','用户管理',1,'user','system/user/index','',1,1,'user','','2021-08-28 09:12:21','2021-08-28 09:12:21',0),
	(3,1,'0,1','角色管理',1,'role','system/role/index','',1,2,'role','','2021-08-28 09:12:21','2021-08-28 09:12:21',0),
	(4,1,'0,1','菜单管理',1,'menu','system/menu/index','',1,3,'menu','','2021-08-28 09:12:21','2021-08-28 09:12:21',0),
	(5,1,'0,1','部门管理',1,'dept','system/dept/index','',1,4,'tree','','2021-08-28 09:12:21','2021-08-28 09:12:21',0),
	(6,1,'0,1','字典管理',1,'dict','system/dict/index','',1,5,'dict','','2021-08-28 09:12:21','2021-08-28 09:12:21',0),
	(7,0,'0','会员管理',2,'/ums','Layout','',1,30,'homepage','/ums/user','2023-10-23 14:13:17','2023-10-29 00:22:41',0),
	(8,2,'0,1,2','用户新增',4,'','','sys:user:add',1,1,'','','2022-10-23 11:04:08','2022-10-23 11:04:11',0),
	(9,2,'0,1,2','用户编辑',4,'','','sys:user:edit',1,2,'','','2022-10-23 11:04:08','2022-10-23 11:04:11',0),
	(10,2,'0,1,2','用户删除',4,'','','sys:user:delete',1,3,'','','2022-10-23 11:04:08','2022-10-23 11:04:11',0),
	(11,3,'0,1,3','角色新增',4,'','','sys:role:add',1,1,'','','2023-05-20 23:39:09','2023-05-20 23:39:09',0),
	(12,3,'0,1,3','角色编辑',4,'','','sys:role:edit',1,2,'','','2023-05-20 23:40:31','2023-05-20 23:40:31',0),
	(13,3,'0,1,3','角色删除',4,'','','sys:role:delete',1,3,'','','2023-05-20 23:41:08','2023-05-20 23:41:08',0),
	(14,4,'0,1,4','菜单新增',4,'','','sys:menu:add',1,1,'','','2023-05-20 23:41:35','2023-05-20 23:41:35',0),
	(15,4,'0,1,4','菜单编辑',4,'','','sys:menu:edit',1,3,'','','2023-05-20 23:41:58','2023-05-20 23:41:58',0),
	(16,4,'0,1,4','菜单删除',4,'','','sys:menu:delete',1,3,'','','2023-05-20 23:44:18','2023-05-20 23:44:18',0),
	(17,5,'0,1,5','部门新增',4,'','','sys:dept:add',1,1,'','','2023-05-20 23:45:00','2023-05-20 23:45:00',0),
	(18,5,'0,1,5','部门编辑',4,'','','sys:dept:edit',1,2,'','','2023-05-20 23:46:16','2023-05-20 23:46:16',0),
	(19,5,'0,1,5','部门删除',4,'','','sys:dept:delete',1,3,'','','2023-05-20 23:46:36','2023-05-20 23:46:36',0),
	(20,6,'0,1,6','字典类型新增',4,'','','sys:dict_type:add',1,1,'','','2023-05-21 00:16:06','2023-05-21 00:16:06',0),
	(21,6,'0,1,6','字典类型编辑',4,'','','sys:dict_type:edit',1,2,'','','2023-05-21 00:27:37','2023-05-21 00:27:37',0),
	(22,6,'0,1,6','字典类型删除',4,'','','sys:dict_type:delete',1,3,'','','2023-05-21 00:29:39','2023-05-21 00:29:39',0),
	(23,6,'0,1,6','字典数据新增',4,'','','sys:dict:add',1,4,'','','2023-05-21 00:46:56','2023-05-21 00:47:06',0),
	(24,6,'0,1,6','字典数据编辑',4,'','','sys:dict:edit',1,5,'','','2023-05-21 00:47:36','2023-05-21 00:47:36',0),
	(25,6,'0,1,6','字典数据删除',4,'','','sys:dict:delete',1,6,'','','2023-05-21 00:48:10','2023-05-21 00:48:20',0),
	(26,2,'0,1,2','重置密码',4,'','','sys:user:reset_pwd',1,4,'','','2023-05-21 00:49:18','2023-05-21 00:49:18',0),
	(27,7,'0,7','会员列表',1,'user','ums/user/index','',1,1,'monitor','','2023-10-23 14:15:32','2023-10-23 14:15:48',0),
	(28,7,'0,7','第三方列表',1,'third','ums/third/index','',1,1,'monitor','','2023-10-23 14:15:32','2023-10-23 14:15:48',0);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色编码',
  `sort` int NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态(1-正常；0-停用)',
  `data_scope` tinyint NOT NULL COMMENT '数据权限(0-所有数据；1-部门及子部门数据；2-本部门数据；3-本人数据)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `name`, `code`, `sort`, `status`, `data_scope`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'超级管理员','ROOT',1,1,0,'2018-12-23 16:00:00','2021-05-21 14:56:51',0),
	(2,'系统管理员','ADMIN',2,1,1,NULL,'2021-03-25 12:39:54',0),
	(3,'访问游客','GUEST',3,0,0,'2019-05-05 16:00:00','2023-11-08 11:14:27',0),
	(4,'系统管理员1','ADMIN1',2,1,1,NULL,'2021-03-25 12:39:54',0),
	(5,'系统管理员2','ADMIN2',2,1,1,NULL,'2021-03-25 12:39:54',0),
	(6,'系统管理员3','ADMIN3',2,1,1,NULL,'2021-03-25 12:39:54',1697988542);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES
	(5,1),
	(5,2),
	(5,31),
	(5,32),
	(5,33),
	(5,88),
	(5,3),
	(5,70),
	(5,71),
	(5,72),
	(4,1),
	(4,4),
	(4,73),
	(4,74),
	(4,75),
	(4,5),
	(4,76),
	(4,77),
	(4,78),
	(2,1),
	(2,2),
	(2,31),
	(2,32),
	(2,33),
	(2,88),
	(2,3),
	(2,70),
	(2,71),
	(2,72),
	(2,4),
	(2,73),
	(2,74),
	(2,75),
	(2,5),
	(2,76),
	(2,77),
	(2,78),
	(2,6),
	(2,79),
	(2,81),
	(2,84),
	(2,85),
	(2,86),
	(2,87),
	(2,7),
	(2,104),
	(2,105),
	(2,8),
	(2,106),
	(2,107),
	(1,1),
	(1,2),
	(1,31),
	(1,32),
	(1,33),
	(1,88),
	(1,3),
	(1,70),
	(1,71),
	(1,72),
	(1,4),
	(1,73),
	(1,74),
	(1,75),
	(1,5),
	(1,76),
	(1,77),
	(1,78),
	(1,6),
	(1,79),
	(1,81),
	(1,84),
	(1,85),
	(1,86),
	(1,87),
	(1,7),
	(1,104),
	(1,105),
	(1,8),
	(1,106),
	(1,107),
	(1,9),
	(1,108),
	(1,109),
	(1,110);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别((1:男;2:女))',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `dept_id` int NOT NULL COMMENT '部门ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态((1:正常;0:禁用))',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` bigint NOT NULL DEFAULT '0' COMMENT '逻辑删除标识(0:未删除;1:已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `username`, `nickname`, `gender`, `password`, `dept_id`, `avatar`, `mobile`, `status`, `email`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'kyle','总监',2,'2be7b79b4067d1d315c0ef99b4d34f61cbba08ba7882cbb0576d8193bac332d8',1,'https://img.imguo.com/files/2023/10/13/7d51f441-9554-4008-9120-304254e00ce5.jpeg','17621590365',1,'kyle@163.com','2019-10-10 13:41:22','2019-10-10 13:41:22',0),
	(2,'admin','系统管理员',1,'2be7b79b4067d1d315c0ef99b4d34f61cbba08ba7882cbb0576d8193bac332d8',1,'https://oss.youlai.tech/youlai-boot/2023/05/16/811270ef31f548af9cffc026dfc3777b.gif','17621210366',1,'','2019-10-10 13:41:22','2022-07-31 12:39:30',0),
	(3,'test','测试小用户',1,'2be7b79b4067d1d315c0ef99b4d34f61cbba08ba7882cbb0576d8193bac332d8',3,'https://oss.youlai.tech/youlai-boot/2023/05/16/811270ef31f548af9cffc026dfc3777b.gif','17621210366',1,'kyle@163.com','2021-06-05 01:31:29','2021-06-05 01:31:29',0);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	(1,1),
	(1,2),
	(2,2),
	(3,3);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `id_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `gender` tinyint NOT NULL DEFAULT '0' COMMENT '性别 0 未知 1男 2女',
  `signature` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '签名',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `tags` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'tags',
  `source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WXAPP' COMMENT '来源，APP H5',
  `source_uid` int NOT NULL DEFAULT '0' COMMENT '邀请uid',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `mobile`, `username`, `nickname`, `avatar`, `id_card`, `gender`, `signature`, `birthday`, `tags`, `source`, `source_uid`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'18627111090','kneng1','kneng1','https://img.imguo.com/files/2023/09/13/f8788e78-44b2-49b3-8dd4-78b77c91a95f.jpg','',1,'','0001-01-01','','WXAPP',0,'2020-10-12 22:39:09','2023-10-25 08:12:46',0),
	(2,'18627111091','k2','k2','https://img.imguo.com/files/2023/09/13/f8788e78-44b2-49b3-8dd4-78b77c91a95f.jpg','',2,'',NULL,'','WXAPP',0,'2022-10-12 22:43:35','2023-10-27 17:22:01',1698398521),
	(3,'18627111092','开','k3','https://img.imguo.com/files/2023/09/13/f8788e78-44b2-49b3-8dd4-78b77c91a95f.jpg','',0,'',NULL,'','WXAPP',0,'2023-10-12 23:28:07','2023-10-27 17:22:01',1698398521),
	(4,'18627111093','靠','k4','https://img.imguo.com/files/2023/09/13/f8788e78-44b2-49b3-8dd4-78b77c91a95f.jpg','',0,'',NULL,'','WXAPP',0,'2023-10-12 23:58:20','2023-10-27 17:22:01',1698398521),
	(5,'18627111094','考','k5','https://img.imguo.com/files/2023/10/13/27fbf0f2-a0ac-49c3-928c-267514c0b6b0.jpeg','420117',1,'tags','1986-06-17','tags','WXAPP',1,'2023-10-13 08:38:39','2023-10-27 17:22:01',1698398521),
	(6,'18627111089','kneng','nick','https://img.imguo.com/files/2023/10/13/bdc842a3-8582-4a49-9828-7455244c02f5.jpeg','',1,'tags','1986-01-01','','APP',0,'2023-10-13 18:17:19','2023-10-24 15:39:03',1698133143),
	(7,'18627111095','kneng','kt','https://img.imguo.com/files/2023/10/13/7d51f441-9554-4008-9120-304254e00ce5.jpeg','',0,'testtags','1986-02-01','','APP',0,'2021-10-13 19:05:27','2023-10-31 17:04:22',0);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_third
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_third`;

CREATE TABLE `user_third` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int NOT NULL COMMENT '会员ID',
  `platform` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'wxapp' COMMENT '第三方应用',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方唯一ID',
  `unionid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '小程序unionid',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方会员昵称',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '第三方会员头像',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='第三方登录表';

LOCK TABLES `user_third` WRITE;
/*!40000 ALTER TABLE `user_third` DISABLE KEYS */;

INSERT INTO `user_third` (`id`, `uid`, `platform`, `openid`, `unionid`, `nickname`, `avatar`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(4,7,'wxapp','odbtT5eCbsuLGOdUDW7EcY5ZT-Bg','odbtT5eCbsuLGOdUDW7EcY5ZT-Bg','kyle','https://img.imguo.com/files/2023/10/13/7d51f441-9554-4008-9120-304254e00ce5.jpeg','2023-10-12 22:39:38','2023-10-24 17:43:03',0);

/*!40000 ALTER TABLE `user_third` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
