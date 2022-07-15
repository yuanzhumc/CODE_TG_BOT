/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 127.0.0.1:3306
 Source Schema         : cd_bot

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 05/11/2021 10:01:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cd_auth_tg_group
-- ----------------------------
DROP TABLE IF EXISTS `cd_auth_tg_group`;
CREATE TABLE `cd_auth_tg_group` (
                                    `id` bigint NOT NULL AUTO_INCREMENT,
                                    `chat_id` varchar(200) NOT NULL COMMENT '群组ID',
                                    `name` varchar(300) NOT NULL COMMENT '群组名称',
                                    `create_time` int DEFAULT NULL,
                                    `update_time` int DEFAULT NULL,
                                    `delete_time` int DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `chat_id` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='授权群组';

-- ----------------------------
-- Records of cd_auth_tg_group
-- ----------------------------
BEGIN;
INSERT INTO `cd_auth_tg_group` VALUES (1, '-1001537257987', 'CODE_TG_BOT程序', 1635152143, 1635152143, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_code_type
-- ----------------------------
DROP TABLE IF EXISTS `cd_code_type`;
CREATE TABLE `cd_code_type` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `command_id` bigint DEFAULT NULL COMMENT '命令ID',
                                `storage_time` varchar(20) NOT NULL DEFAULT 'Ym' COMMENT '存储时间',
                                `code_time` bigint NOT NULL DEFAULT '7' COMMENT 'code存储时间单位day',
                                `number` bigint NOT NULL DEFAULT '5' COMMENT '每天投放次数',
                                `pull_number` bigint DEFAULT '0' COMMENT '用户拉取次数',
                                `create_time` int DEFAULT NULL,
                                `update_time` int DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='助力码类型';

-- ----------------------------
-- Records of cd_code_type
-- ----------------------------
BEGIN;
INSERT INTO `cd_code_type` VALUES (1, 3, 'Ym', 7, 5, 5, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_admin`;
CREATE TABLE `cd_system_admin` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
                                   `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
                                   `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
                                   `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
                                   `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
                                   `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
                                   `login_num` bigint unsigned DEFAULT '0' COMMENT '登录次数',
                                   `sort` int DEFAULT '0' COMMENT '排序',
                                   `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
                                   `create_time` int DEFAULT NULL COMMENT '创建时间',
                                   `update_time` int DEFAULT NULL COMMENT '更新时间',
                                   `delete_time` int DEFAULT NULL COMMENT '删除时间',
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `username` (`username`) USING BTREE,
                                   KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of cd_system_admin
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_admin` VALUES (1, NULL, '/static/admin/images/head.jpg', 'yuanzhu', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', NULL, '', 3, 0, 1, 1635152143, 1636075005, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_auth`;
CREATE TABLE `cd_system_auth` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `title` varchar(20) NOT NULL COMMENT '权限名称',
                                  `sort` int DEFAULT '0' COMMENT '排序',
                                  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间',
                                  `delete_time` int DEFAULT NULL COMMENT '删除时间',
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of cd_system_auth
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_auth` VALUES (1, '管理员', 1, 1, '系统管理员', 1588921753, 1636075068, NULL);
INSERT INTO `cd_system_auth` VALUES (6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_auth_node`;
CREATE TABLE `cd_system_auth_node` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `auth_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
                                       `node_id` bigint DEFAULT NULL COMMENT '节点ID',
                                       PRIMARY KEY (`id`),
                                       KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
                                       KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of cd_system_auth_node
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_auth_node` VALUES (1, 6, 1);
INSERT INTO `cd_system_auth_node` VALUES (2, 6, 2);
INSERT INTO `cd_system_auth_node` VALUES (3, 6, 9);
INSERT INTO `cd_system_auth_node` VALUES (4, 6, 12);
INSERT INTO `cd_system_auth_node` VALUES (5, 6, 18);
INSERT INTO `cd_system_auth_node` VALUES (6, 6, 19);
INSERT INTO `cd_system_auth_node` VALUES (7, 6, 21);
INSERT INTO `cd_system_auth_node` VALUES (8, 6, 22);
INSERT INTO `cd_system_auth_node` VALUES (9, 6, 29);
INSERT INTO `cd_system_auth_node` VALUES (10, 6, 30);
INSERT INTO `cd_system_auth_node` VALUES (11, 6, 38);
INSERT INTO `cd_system_auth_node` VALUES (12, 6, 39);
INSERT INTO `cd_system_auth_node` VALUES (13, 6, 45);
INSERT INTO `cd_system_auth_node` VALUES (14, 6, 46);
INSERT INTO `cd_system_auth_node` VALUES (15, 6, 52);
INSERT INTO `cd_system_auth_node` VALUES (16, 6, 53);
INSERT INTO `cd_system_auth_node` VALUES (17, 1, 1);
INSERT INTO `cd_system_auth_node` VALUES (18, 1, 2);
INSERT INTO `cd_system_auth_node` VALUES (19, 1, 3);
INSERT INTO `cd_system_auth_node` VALUES (20, 1, 4);
INSERT INTO `cd_system_auth_node` VALUES (21, 1, 5);
INSERT INTO `cd_system_auth_node` VALUES (22, 1, 6);
INSERT INTO `cd_system_auth_node` VALUES (23, 1, 7);
INSERT INTO `cd_system_auth_node` VALUES (24, 1, 8);
INSERT INTO `cd_system_auth_node` VALUES (25, 1, 9);
INSERT INTO `cd_system_auth_node` VALUES (26, 1, 10);
INSERT INTO `cd_system_auth_node` VALUES (27, 1, 11);
INSERT INTO `cd_system_auth_node` VALUES (28, 1, 12);
INSERT INTO `cd_system_auth_node` VALUES (29, 1, 13);
INSERT INTO `cd_system_auth_node` VALUES (30, 1, 14);
INSERT INTO `cd_system_auth_node` VALUES (31, 1, 15);
INSERT INTO `cd_system_auth_node` VALUES (32, 1, 16);
INSERT INTO `cd_system_auth_node` VALUES (33, 1, 17);
INSERT INTO `cd_system_auth_node` VALUES (34, 1, 18);
INSERT INTO `cd_system_auth_node` VALUES (35, 1, 19);
INSERT INTO `cd_system_auth_node` VALUES (36, 1, 20);
INSERT INTO `cd_system_auth_node` VALUES (37, 1, 99);
INSERT INTO `cd_system_auth_node` VALUES (38, 1, 21);
INSERT INTO `cd_system_auth_node` VALUES (39, 1, 22);
INSERT INTO `cd_system_auth_node` VALUES (40, 1, 23);
INSERT INTO `cd_system_auth_node` VALUES (41, 1, 24);
INSERT INTO `cd_system_auth_node` VALUES (42, 1, 25);
INSERT INTO `cd_system_auth_node` VALUES (43, 1, 26);
INSERT INTO `cd_system_auth_node` VALUES (44, 1, 27);
INSERT INTO `cd_system_auth_node` VALUES (45, 1, 28);
INSERT INTO `cd_system_auth_node` VALUES (46, 1, 29);
INSERT INTO `cd_system_auth_node` VALUES (47, 1, 30);
INSERT INTO `cd_system_auth_node` VALUES (48, 1, 31);
INSERT INTO `cd_system_auth_node` VALUES (49, 1, 32);
INSERT INTO `cd_system_auth_node` VALUES (50, 1, 33);
INSERT INTO `cd_system_auth_node` VALUES (51, 1, 34);
INSERT INTO `cd_system_auth_node` VALUES (52, 1, 35);
INSERT INTO `cd_system_auth_node` VALUES (53, 1, 36);
INSERT INTO `cd_system_auth_node` VALUES (54, 1, 37);
INSERT INTO `cd_system_auth_node` VALUES (55, 1, 38);
INSERT INTO `cd_system_auth_node` VALUES (56, 1, 39);
INSERT INTO `cd_system_auth_node` VALUES (57, 1, 40);
INSERT INTO `cd_system_auth_node` VALUES (58, 1, 41);
INSERT INTO `cd_system_auth_node` VALUES (59, 1, 42);
INSERT INTO `cd_system_auth_node` VALUES (60, 1, 43);
INSERT INTO `cd_system_auth_node` VALUES (61, 1, 44);
INSERT INTO `cd_system_auth_node` VALUES (62, 1, 45);
INSERT INTO `cd_system_auth_node` VALUES (63, 1, 46);
INSERT INTO `cd_system_auth_node` VALUES (64, 1, 47);
INSERT INTO `cd_system_auth_node` VALUES (65, 1, 48);
INSERT INTO `cd_system_auth_node` VALUES (66, 1, 49);
INSERT INTO `cd_system_auth_node` VALUES (67, 1, 50);
INSERT INTO `cd_system_auth_node` VALUES (68, 1, 51);
INSERT INTO `cd_system_auth_node` VALUES (69, 1, 52);
INSERT INTO `cd_system_auth_node` VALUES (70, 1, 53);
INSERT INTO `cd_system_auth_node` VALUES (71, 1, 54);
INSERT INTO `cd_system_auth_node` VALUES (72, 1, 55);
INSERT INTO `cd_system_auth_node` VALUES (73, 1, 56);
INSERT INTO `cd_system_auth_node` VALUES (74, 1, 57);
INSERT INTO `cd_system_auth_node` VALUES (75, 1, 58);
INSERT INTO `cd_system_auth_node` VALUES (76, 1, 59);
INSERT INTO `cd_system_auth_node` VALUES (77, 1, 60);
INSERT INTO `cd_system_auth_node` VALUES (78, 1, 61);
INSERT INTO `cd_system_auth_node` VALUES (79, 1, 62);
INSERT INTO `cd_system_auth_node` VALUES (80, 1, 63);
INSERT INTO `cd_system_auth_node` VALUES (81, 1, 64);
INSERT INTO `cd_system_auth_node` VALUES (82, 1, 65);
INSERT INTO `cd_system_auth_node` VALUES (83, 1, 66);
INSERT INTO `cd_system_auth_node` VALUES (84, 1, 67);
INSERT INTO `cd_system_auth_node` VALUES (85, 1, 68);
INSERT INTO `cd_system_auth_node` VALUES (86, 1, 69);
INSERT INTO `cd_system_auth_node` VALUES (87, 1, 70);
INSERT INTO `cd_system_auth_node` VALUES (88, 1, 71);
INSERT INTO `cd_system_auth_node` VALUES (89, 1, 72);
INSERT INTO `cd_system_auth_node` VALUES (90, 1, 73);
INSERT INTO `cd_system_auth_node` VALUES (91, 1, 74);
INSERT INTO `cd_system_auth_node` VALUES (92, 1, 75);
INSERT INTO `cd_system_auth_node` VALUES (93, 1, 76);
INSERT INTO `cd_system_auth_node` VALUES (94, 1, 77);
INSERT INTO `cd_system_auth_node` VALUES (95, 1, 78);
INSERT INTO `cd_system_auth_node` VALUES (96, 1, 79);
INSERT INTO `cd_system_auth_node` VALUES (97, 1, 80);
INSERT INTO `cd_system_auth_node` VALUES (98, 1, 81);
INSERT INTO `cd_system_auth_node` VALUES (99, 1, 82);
INSERT INTO `cd_system_auth_node` VALUES (100, 1, 83);
INSERT INTO `cd_system_auth_node` VALUES (101, 1, 84);
INSERT INTO `cd_system_auth_node` VALUES (102, 1, 85);
INSERT INTO `cd_system_auth_node` VALUES (103, 1, 86);
INSERT INTO `cd_system_auth_node` VALUES (104, 1, 87);
INSERT INTO `cd_system_auth_node` VALUES (105, 1, 88);
INSERT INTO `cd_system_auth_node` VALUES (106, 1, 89);
INSERT INTO `cd_system_auth_node` VALUES (107, 1, 90);
INSERT INTO `cd_system_auth_node` VALUES (108, 1, 91);
INSERT INTO `cd_system_auth_node` VALUES (109, 1, 92);
INSERT INTO `cd_system_auth_node` VALUES (110, 1, 93);
INSERT INTO `cd_system_auth_node` VALUES (111, 1, 94);
INSERT INTO `cd_system_auth_node` VALUES (112, 1, 95);
INSERT INTO `cd_system_auth_node` VALUES (113, 1, 96);
INSERT INTO `cd_system_auth_node` VALUES (114, 1, 97);
INSERT INTO `cd_system_auth_node` VALUES (115, 1, 98);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_command
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_command`;
CREATE TABLE `cd_system_command` (
                                     `id` bigint NOT NULL AUTO_INCREMENT,
                                     `command` varchar(100) NOT NULL COMMENT '命令名称',
                                     `description` varchar(300) DEFAULT NULL COMMENT '描述',
                                     `text` text COMMENT '自动回复内容',
                                     `call_controller` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '命令指向控制器',
                                     `call_action` varchar(1000) DEFAULT NULL COMMENT '命令指向方法',
                                     `create_time` int DEFAULT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='命令表';

-- ----------------------------
-- Records of cd_system_command
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_command` VALUES (1, 'test', '这是一条测试命令', NULL, 'app\\api\\controller\\Command', 'test', NULL);
INSERT INTO `cd_system_command` VALUES (2, 'help', '使用帮助', '支持车型：种豆、东东农场、东东工厂、京喜工厂、东东萌宠、闪购盲盒、狂欢城、财富岛、健康。\n例:\n/pet code111\n或\n/pet code111&code222&code333\n欢迎订阅本频道，获取更多消息。\n', 'app\\api\\controller\\Command', 'message', NULL);
INSERT INTO `cd_system_command` VALUES (3, 'api', 'API接口对接文档', '请前往GitHub查看wiki \n https://github.com/yuanzhumc/CODE_TG_BOT/wiki/API%E5%AF%B9%E6%8E%A5%E6%96%87%E6%A1%A3', 'app\\api\\controller\\Command', 'message', NULL);
INSERT INTO `cd_system_command` VALUES (4, 'pet', '提交东东萌宠', NULL, 'app\\api\\controller\\Command', 'code', NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_config
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_config`;
CREATE TABLE `cd_system_config` (
                                    `id` int unsigned NOT NULL AUTO_INCREMENT,
                                    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
                                    `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
                                    `value` text COMMENT '变量值',
                                    `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
                                    `sort` int DEFAULT '0',
                                    `create_time` int DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `name` (`name`),
                                    KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of cd_system_config
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_config` VALUES (41, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (42, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (55, 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (56, 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (57, 'upload_allow_size', 'upload', '1024000', '允许上传的大小', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (58, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (59, 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (60, 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (61, 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (62, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (63, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (64, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (65, 'logo_title', 'site', 'CODE_TG_BOT', 'LOGO标题', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (66, 'logo_image', 'site', '/favicon.ico', 'logo图片', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (68, 'site_name', 'site', 'CODE_TG_BOT系统', '站点名称', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (69, 'site_ico', 'site', '填你的', '浏览器图标', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (70, 'site_copyright', 'site', '填你的', '版权信息', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (71, 'site_beian', 'site', '填你的', '备案信息', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (72, 'site_version', 'site', '2.0.0', '版本信息', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (75, 'sms_type', 'sms', 'alisms', '短信类型', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (76, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (77, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (78, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (79, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (80, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (81, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (82, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (83, 'tecos_bucket', 'upload', '填你的', '存储桶名称', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (84, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (85, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (86, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (88, 'tg_name', 'tg_bot', '填你的', '机器人名称', 0, NULL, NULL);
INSERT INTO `cd_system_config` VALUES (89, 'tg_token', 'tg_bot', '填你的', '机器人TOKEN', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_menu`;
CREATE TABLE `cd_system_menu` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
                                  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
                                  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
                                  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
                                  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
                                  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
                                  `sort` int DEFAULT '0' COMMENT '菜单排序',
                                  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
                                  `remark` varchar(255) DEFAULT NULL,
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间',
                                  `delete_time` int DEFAULT NULL COMMENT '删除时间',
                                  PRIMARY KEY (`id`),
                                  KEY `title` (`title`),
                                  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of cd_system_menu
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_menu` VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL);
INSERT INTO `cd_system_menu` VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL);
INSERT INTO `cd_system_menu` VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL);
INSERT INTO `cd_system_menu` VALUES (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL);
INSERT INTO `cd_system_menu` VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL);
INSERT INTO `cd_system_menu` VALUES (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL);
INSERT INTO `cd_system_menu` VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL);
INSERT INTO `cd_system_menu` VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL);
INSERT INTO `cd_system_menu` VALUES (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL);
INSERT INTO `cd_system_menu` VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL);
INSERT INTO `cd_system_menu` VALUES (254, 0, '码库管理', 'fa fa-list', '', '', '_self', 99, 1, '', 1635992760, 1636013681, NULL);
INSERT INTO `cd_system_menu` VALUES (255, 254, '码库类型', 'fa fa-list', 'code.code_type/index', '', '_self', 0, 1, '', 1635992796, 1635992796, NULL);
INSERT INTO `cd_system_menu` VALUES (256, 254, '命令管理', 'fa fa-list', 'code.tg_command/index', '', '_self', 0, 1, '', 1635994472, 1635994472, NULL);
INSERT INTO `cd_system_menu` VALUES (257, 254, '授权群组', 'fa fa-list', 'code.tg_group/index', '', '_self', 0, 1, '', 1636013712, 1636013712, NULL);
INSERT INTO `cd_system_menu` VALUES (258, 254, 'TG用户', 'fa fa-list', 'code.tg_user/index', '', '_self', 0, 1, '', 1636079486, 1636079486, NULL);
INSERT INTO `cd_system_menu` VALUES (259, 254, 'tg聊天列表', 'fa fa-list', 'code.tg_chat/index', '', '_self', 0, 1, '', 1636096040, 1636096040, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_node
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_node`;
CREATE TABLE `cd_system_node` (
                                  `id` int unsigned NOT NULL AUTO_INCREMENT,
                                  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
                                  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
                                  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
                                  `is_auth` tinyint unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`id`),
                                  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of cd_system_node
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_node` VALUES (1, 'system.admin', '管理员管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (2, 'system.admin/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (3, 'system.admin/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (4, 'system.admin/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (5, 'system.admin/password', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (6, 'system.admin/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (7, 'system.admin/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (8, 'system.admin/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (9, 'system.auth', '角色权限管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (10, 'system.auth/authorize', '授权', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (12, 'system.auth/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (13, 'system.auth/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (14, 'system.auth/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (15, 'system.auth/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (16, 'system.auth/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (17, 'system.auth/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (18, 'system.config', '系统配置管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (19, 'system.config/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (20, 'system.config/save', '保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (21, 'system.menu', '菜单管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (22, 'system.menu/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (23, 'system.menu/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (24, 'system.menu/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (25, 'system.menu/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (26, 'system.menu/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (28, 'system.menu/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (29, 'system.node', '系统节点管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (30, 'system.node/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (33, 'system.node/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (34, 'system.node/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (35, 'system.node/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (36, 'system.node/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (37, 'system.node/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (38, 'system.uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (39, 'system.uploadfile/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (40, 'system.uploadfile/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (41, 'system.uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (42, 'system.uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (43, 'system.uploadfile/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (45, 'mall.cate', '商品分类管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (46, 'mall.cate/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (47, 'mall.cate/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (48, 'mall.cate/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (49, 'mall.cate/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (50, 'mall.cate/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (51, 'mall.cate/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (52, 'mall.goods', '商城商品管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (53, 'mall.goods/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (54, 'mall.goods/stock', '入库', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (55, 'mall.goods/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (56, 'mall.goods/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (57, 'mall.goods/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (58, 'mall.goods/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (59, 'mall.goods/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `cd_system_node` VALUES (60, 'system.quick', '快捷入口管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (61, 'system.quick/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (62, 'system.quick/add', '添加', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (63, 'system.quick/edit', '编辑', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (64, 'system.quick/delete', '删除', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (65, 'system.quick/export', '导出', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (66, 'system.quick/modify', '属性修改', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (67, 'system.log', '操作日志管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (68, 'system.log/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `cd_system_node` VALUES (69, 'code.code_type', '码库管理', 1, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (70, 'code.code_type/index', '列表', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (71, 'code.code_type/add', '添加', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (72, 'code.code_type/edit', '编辑', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (73, 'code.code_type/delete', '删除', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (74, 'code.code_type/export', '导出', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (75, 'code.code_type/modify', '属性修改', 2, 1, 1635992734, 1635992734);
INSERT INTO `cd_system_node` VALUES (76, 'code.tg_command', '机器人命令管理', 1, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (77, 'code.tg_command/index', '列表', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (78, 'code.tg_command/add', '添加', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (79, 'code.tg_command/edit', '编辑', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (80, 'code.tg_command/delete', '删除', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (81, 'code.tg_command/export', '导出', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (82, 'code.tg_command/modify', '属性修改', 2, 1, 1635994451, 1635994451);
INSERT INTO `cd_system_node` VALUES (83, 'code.tg_group', '授权群组', 1, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (84, 'code.tg_group/send_msg', '发送TG消息', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (85, 'code.tg_group/index', '列表', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (86, 'code.tg_group/add', '添加', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (87, 'code.tg_group/edit', '编辑', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (88, 'code.tg_group/delete', '删除', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (89, 'code.tg_group/export', '导出', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (90, 'code.tg_group/modify', '属性修改', 2, 1, 1636013658, 1636013658);
INSERT INTO `cd_system_node` VALUES (91, 'code.tg_user', 'tg用户', 1, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (92, 'code.tg_user/send_msg', '发送TG消息', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (93, 'code.tg_user/index', '列表', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (94, 'code.tg_user/add', '添加', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (95, 'code.tg_user/edit', '编辑', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (96, 'code.tg_user/delete', '删除', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (97, 'code.tg_user/export', '导出', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (98, 'code.tg_user/modify', '属性修改', 2, 1, 1636014757, 1636014757);
INSERT INTO `cd_system_node` VALUES (99, 'system.config/setWebhook', '设置Webhook', 2, 1, 1636075022, 1636075022);
INSERT INTO `cd_system_node` VALUES (100, 'code.tg_chat', 'tg聊天列表', 1, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (101, 'code.tg_chat/index', '列表', 2, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (102, 'code.tg_chat/add', '添加', 2, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (103, 'code.tg_chat/edit', '编辑', 2, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (104, 'code.tg_chat/delete', '删除', 2, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (105, 'code.tg_chat/export', '导出', 2, 1, 1636095873, 1636095873);
INSERT INTO `cd_system_node` VALUES (106, 'code.tg_chat/modify', '属性修改', 2, 1, 1636095873, 1636095873);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_quick`;
CREATE TABLE `cd_system_quick` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
                                   `icon` varchar(100) DEFAULT NULL COMMENT '图标',
                                   `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
                                   `sort` int DEFAULT '0' COMMENT '排序',
                                   `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                   `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                   `create_time` int DEFAULT NULL COMMENT '创建时间',
                                   `update_time` int DEFAULT NULL COMMENT '更新时间',
                                   `delete_time` int DEFAULT NULL COMMENT '删除时间',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of cd_system_quick
-- ----------------------------
BEGIN;
INSERT INTO `cd_system_quick` VALUES (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL);
INSERT INTO `cd_system_quick` VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL);
INSERT INTO `cd_system_quick` VALUES (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `cd_system_quick` VALUES (6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `cd_system_quick` VALUES (7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `cd_system_quick` VALUES (8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cd_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `cd_system_uploadfile`;
CREATE TABLE `cd_system_uploadfile` (
                                        `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
                                        `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
                                        `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
                                        `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
                                        `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
                                        `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
                                        `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
                                        `image_frames` int unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
                                        `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
                                        `file_size` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
                                        `file_ext` varchar(100) DEFAULT NULL,
                                        `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
                                        `create_time` int DEFAULT NULL COMMENT '创建日期',
                                        `update_time` int DEFAULT NULL COMMENT '更新时间',
                                        `upload_time` int DEFAULT NULL COMMENT '上传时间',
                                        PRIMARY KEY (`id`),
                                        KEY `upload_type` (`upload_type`),
                                        KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of cd_system_uploadfile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cd_tg_user
-- ----------------------------
DROP TABLE IF EXISTS `cd_tg_user`;
CREATE TABLE `cd_tg_user` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `tg_id` varchar(100) NOT NULL COMMENT '用户ID',
                              `last_name` varchar(1000) DEFAULT NULL COMMENT '姓',
                              `first_name` varchar(1000) DEFAULT NULL COMMENT '名字',
                              `username` varchar(1000) DEFAULT NULL COMMENT '用户名',
                              `language_code` varchar(255) DEFAULT NULL COMMENT '语言代码',
                              `create_time` int DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `tg_id` (`tg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tg用户表';

-- ----------------------------
-- Records of cd_tg_user
-- ----------------------------
BEGIN;

COMMIT;
-- ----------------------------
-- Table structure for cd_tg_chat
-- ----------------------------
CREATE TABLE `cd_tg_chat` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `chat_id` varchar(200) DEFAULT NULL COMMENT '聊天方式ID',
                              `chat_username` varchar(1000) DEFAULT NULL COMMENT '聊天用户名',
                              `chat_type` varchar(255) DEFAULT NULL COMMENT '聊天方式',
                              `from_id` varchar(200) DEFAULT NULL COMMENT '发送者ID',
                              `from_username` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送者用户名',
                              `text` text COMMENT '发送内容',
                              `original_data` text COMMENT '原始信息',
                              `create_time` int DEFAULT NULL COMMENT '创建时间',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tg聊天列表';
-- ----------------------------
-- Records of cd_tg_user
-- ----------------------------
BEGIN;

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
