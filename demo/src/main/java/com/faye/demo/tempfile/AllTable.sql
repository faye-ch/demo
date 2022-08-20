/*
SQLyog Professional v12.08 (32 bit)
MySQL - 5.6.23-log : Database - xrk_mall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xrk_mall` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xrk_mall`;

/*Table structure for table `dispatch_saletask_records` */

DROP TABLE IF EXISTS `dispatch_saletask_records`;

CREATE TABLE `dispatch_saletask_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_push` tinyint(1) DEFAULT NULL,
  `app_push_link` varchar(250) DEFAULT NULL,
  `app_push_title` varchar(100) DEFAULT NULL,
  `app_push_content` text,
  `micro_message` tinyint(1) DEFAULT NULL,
  `micro_message_link` varchar(250) DEFAULT NULL,
  `micro_message_title` varchar(100) DEFAULT NULL,
  `micro_message_content` text,
  `dispatch_time` timestamp NULL DEFAULT NULL,
  `user_list_file_name` varchar(100) DEFAULT NULL,
  `user_list_file_path` varchar(250) DEFAULT NULL,
  `dispatch_status` smallint(6) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sql` */

DROP TABLE IF EXISTS `sql`;

CREATE TABLE `sql` (
  `no` varchar(255) DEFAULT NULL,
  `pno` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_code` varchar(255) DEFAULT NULL,
  `product_no` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `risk_level` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xg_product_ticket_details` */

DROP TABLE IF EXISTS `xg_product_ticket_details`;

CREATE TABLE `xg_product_ticket_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `product_tickets_id` int(11) NOT NULL COMMENT '产品券ID',
  `ticket_no` varchar(64) DEFAULT NULL COMMENT '券号',
  `status` int(11) DEFAULT '0' COMMENT '状态(1:使用,0:停用)',
  `amount_currency` int(11) DEFAULT '1' COMMENT '兑换类型(1:推广积分)',
  `amount` int(11) DEFAULT '0' COMMENT '兑换额',
  `valid_start_at` timestamp NULL DEFAULT NULL COMMENT '生效开始时间',
  `valid_end_at` timestamp NULL DEFAULT NULL COMMENT '生效结束时间',
  `owner_no` char(50) DEFAULT NULL COMMENT '券拥有者',
  `consumer_no` char(50) DEFAULT NULL COMMENT '券消费者',
  `order_no` char(50) DEFAULT NULL COMMENT '订单号',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_ptid` (`product_tickets_id`),
  KEY `idx_cno_ptid` (`consumer_no`,`product_tickets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='产品券明细';

/*Table structure for table `xg_product_tickets` */

DROP TABLE IF EXISTS `xg_product_tickets`;

CREATE TABLE `xg_product_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品券ID',
  `channel_code` char(30) NOT NULL COMMENT '渠道代码',
  `product_no` char(50) NOT NULL COMMENT '商品编码',
  `category` int(11) DEFAULT '1' COMMENT '券分类(1:推广积分券)',
  `status` int(11) DEFAULT '0' COMMENT '券状态(1:使用,0:停用)',
  `priority` int(11) DEFAULT '0' COMMENT '优先级(0为最高级别)',
  `stock_num` int(11) DEFAULT '0' COMMENT '库存数量',
  `amount_currency` int(11) DEFAULT '1' COMMENT '兑换类型(1:推广积分)',
  `amount` int(11) DEFAULT '0' COMMENT '兑换额',
  `valid_time` char(30) DEFAULT NULL COMMENT '券有效时间(d:天,m:月,y:年)',
  `source_channel` char(30) DEFAULT NULL COMMENT '券来源渠道',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_pt_ccode_pno` (`channel_code`,`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品券信息';

/*Table structure for table `xg_user_product_tickets` */

DROP TABLE IF EXISTS `xg_user_product_tickets`;

CREATE TABLE `xg_user_product_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户产品券ID',
  `product_tickets_id` int(11) NOT NULL COMMENT '产品券ID',
  `uid` char(50) NOT NULL COMMENT '平台用户ID',
  `user_no` char(50) NOT NULL COMMENT '用户ID',
  `status` int(11) DEFAULT '0' COMMENT '用户券状态(1:使用,0:停用)',
  `amount_currency` int(11) DEFAULT '1' COMMENT '兑换类型(1:推广积分)',
  `amount` int(11) DEFAULT '0' COMMENT '兑换额',
  `unused_num` int(11) DEFAULT '0' COMMENT '未使用数量',
  `used_num` int(11) DEFAULT '0' COMMENT '已使用数量',
  `valid_start_at` timestamp NULL DEFAULT NULL COMMENT '生效开始时间',
  `valid_end_at` timestamp NULL DEFAULT NULL COMMENT '生效结束时间',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_ptid` (`product_tickets_id`),
  KEY `idx_uno_sts_valid_at` (`user_no`,`status`,`valid_start_at`,`valid_end_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='用户产品券信息';

/*Table structure for table `xm_addresses` */

DROP TABLE IF EXISTS `xm_addresses`;

CREATE TABLE `xm_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `companyNo` varchar(10) DEFAULT NULL,
  `no` int(11) NOT NULL COMMENT '编号，国标编号',
  `pno` int(11) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品代码，标示公司区别，如：AB_HXJK_0001',
  `region_category` varchar(50) DEFAULT NULL COMMENT '地区类别，A类、B类、C类',
  `STATUS` int(11) DEFAULT '1' COMMENT '有效-1,无效-0',
  PRIMARY KEY (`id`),
  KEY `idx_addresses_pcode` (`pno`),
  KEY `idx_addresses_code` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3425513 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地址信息';

/*Table structure for table `xm_addresses_copy` */

DROP TABLE IF EXISTS `xm_addresses_copy`;

CREATE TABLE `xm_addresses_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` int(11) NOT NULL COMMENT '编号，国标编号',
  `pno` int(11) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_addresses_pcode` (`pno`),
  KEY `idx_addresses_code` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3719 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地址信息';

/*Table structure for table `xm_addresses_copy2` */

DROP TABLE IF EXISTS `xm_addresses_copy2`;

CREATE TABLE `xm_addresses_copy2` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `companyNo` varchar(10) DEFAULT NULL,
  `no` int(11) NOT NULL COMMENT '编号，国标编号',
  `pno` int(11) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_addresses_pcode` (`pno`),
  KEY `idx_addresses_code` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=297904 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地址信息';

/*Table structure for table `xm_agent_company_ranks` */

DROP TABLE IF EXISTS `xm_agent_company_ranks`;

CREATE TABLE `xm_agent_company_ranks` (
  `head_company` char(50) NOT NULL COMMENT '母公司',
  `product_no` char(50) NOT NULL COMMENT '产品编号',
  `goods_number` int(11) DEFAULT '0' COMMENT '近7天首单人力出单数量',
  `rank` int(11) NOT NULL COMMENT '排名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='近7天各代理人保险公司首单人力产品排行榜';

/*Table structure for table `xm_agent_companys` */

DROP TABLE IF EXISTS `xm_agent_companys`;

CREATE TABLE `xm_agent_companys` (
  `head_company` char(50) NOT NULL COMMENT '母公司',
  `company_name` char(50) NOT NULL COMMENT '子公司',
  `company_id` char(50) NOT NULL COMMENT '子公司id',
  `use_status` int(11) DEFAULT '1' COMMENT '是否启用：1启用，0不启用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理人保险公司关系表';

/*Table structure for table `xm_alipay_bills` */

DROP TABLE IF EXISTS `xm_alipay_bills`;

CREATE TABLE `xm_alipay_bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `balance` decimal(12,2) DEFAULT NULL COMMENT '账户余额',
  `buyer_account` varchar(50) DEFAULT NULL COMMENT '买家支付宝人民币资金账号',
  `currency` varchar(6) DEFAULT NULL COMMENT '货币类型[156:人民币]',
  `deposit_bank_no` varchar(50) DEFAULT NULL COMMENT '充值网银流水号',
  `goods_title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `income` decimal(10,2) DEFAULT NULL COMMENT '收入金额',
  `iw_account_log_id` varchar(50) DEFAULT NULL COMMENT '账务序列号',
  `memo` varchar(300) DEFAULT NULL COMMENT '备注',
  `merchant_out_order_no` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `outcome` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `partner_id` varchar(50) DEFAULT NULL COMMENT '合作者身份ID',
  `rate` decimal(7,6) DEFAULT NULL COMMENT '支付宝收费费率',
  `seller_account` varchar(50) DEFAULT NULL COMMENT '卖家支付宝人民币资金账号',
  `seller_fullname` varchar(200) DEFAULT NULL COMMENT '卖家姓名',
  `service_fee` decimal(10,2) DEFAULT NULL COMMENT '交易服务费',
  `service_fee_ratio` decimal(7,6) DEFAULT NULL COMMENT '交易服务费率',
  `sign_product_name` varchar(100) DEFAULT NULL COMMENT '签约产品',
  `sub_trans_code_msg` varchar(200) DEFAULT NULL COMMENT '子业务类型',
  `total_fee` decimal(10,2) DEFAULT NULL COMMENT '交易总金额',
  `trade_no` varchar(100) DEFAULT NULL COMMENT '支付宝交易号',
  `trade_refund_amount` decimal(10,2) DEFAULT NULL COMMENT '累积退款金额',
  `trans_code_msg` varchar(100) DEFAULT NULL COMMENT '子业务类型',
  `trans_date` datetime DEFAULT NULL COMMENT '交易付款时间',
  PRIMARY KEY (`id`),
  KEY `ix_alibills_time` (`trans_date`) USING BTREE,
  KEY `ix_alibills_order_no` (`merchant_out_order_no`),
  KEY `ix_alibills_payid` (`trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xm_all_job` */

DROP TABLE IF EXISTS `xm_all_job`;

CREATE TABLE `xm_all_job` (
  `job_name` varchar(250) NOT NULL COMMENT '全网职业名称列表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全网职业名称表';

/*Table structure for table `xm_app_search_config_type` */

DROP TABLE IF EXISTS `xm_app_search_config_type`;

CREATE TABLE `xm_app_search_config_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'app产品列表搜索分类',
  `code` varchar(50) DEFAULT NULL COMMENT '分类code',
  `order_number` int(4) DEFAULT NULL COMMENT '序号',
  `use_status` int(4) DEFAULT '0' COMMENT '状态：0.停用，1.启用',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `sale_app` varchar(20) DEFAULT 'xrk' COMMENT '所属APP:xrk,kkyd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='app首页搜索大类配置表';

/*Table structure for table `xm_app_search_configs` */

DROP TABLE IF EXISTS `xm_app_search_configs`;

CREATE TABLE `xm_app_search_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '分类code',
  `record_type` varchar(50) DEFAULT NULL COMMENT '记录类型：cue_word.提示词，hot_recommend.热门推荐',
  `content` varchar(50) DEFAULT NULL COMMENT '提示内容',
  `hot_word` varchar(250) DEFAULT NULL COMMENT '搜索词',
  `link_url` varchar(250) DEFAULT NULL COMMENT '跳转链接',
  `bubble_text` varchar(50) DEFAULT NULL COMMENT '气泡文字',
  `bubble_type` varchar(50) DEFAULT NULL COMMENT '气泡类型：1.红字粉红底，2.黄字淡黄底，3.绿字淡绿底',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `use_status` int(4) DEFAULT '0' COMMENT '状态：-1.删除，0.停用，1.启用',
  `show_time` int(4) DEFAULT '0' COMMENT '热门推荐使用：0.不展示时间，1.展示时间',
  `order_number` int(4) DEFAULT NULL COMMENT '序号',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `sale_app` varchar(20) DEFAULT 'xrk' COMMENT '所属APP:xrk,kkyd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='app首页搜索配置表';

/*Table structure for table `xm_app_search_configs_log` */

DROP TABLE IF EXISTS `xm_app_search_configs_log`;

CREATE TABLE `xm_app_search_configs_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_type` varchar(50) DEFAULT NULL COMMENT '记录类型：cue_word.提示词，hot_recommend.热门推荐',
  `code` varchar(250) DEFAULT NULL COMMENT '类型',
  `content` varchar(50) DEFAULT NULL COMMENT '提示词变更记录',
  `hot_word` varchar(250) DEFAULT NULL COMMENT '搜索词变更记录',
  `link_url` varchar(250) DEFAULT NULL COMMENT '链接变更记录',
  `date_time` varchar(250) DEFAULT NULL COMMENT '时间变更记录',
  `use_status` varchar(250) DEFAULT NULL COMMENT '状态变更记录',
  `update_name` varchar(50) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sale_app` varchar(20) DEFAULT 'xrk' COMMENT '所属APP:xrk,kkyd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8 COMMENT='app首页搜索配置表';

/*Table structure for table `xm_attachments` */

DROP TABLE IF EXISTS `xm_attachments`;

CREATE TABLE `xm_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_no` varchar(50) NOT NULL COMMENT '关联编号',
  `sequence_number` int(11) DEFAULT '0' COMMENT '上传修改批次号,资料上传的批次，默认0即首批次， 1：修改后上传的，属于第1批次，以此类推',
  `category` varchar(20) NOT NULL COMMENT '种类，batch_order_atta: 批量单附件  group_order_atta：团险单  feedback：保单回访问题件附件',
  `type` varchar(20) NOT NULL COMMENT '附件类型，origin: 原始资料, agent_auth: 代理人复核，job_code_image: 职业代码描述截图，job_code_radio: 职业代码描述录音，no_job_code: 不确定职业，feedback：保单回访问题件附件',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(200) DEFAULT NULL COMMENT 'fastdfs地址',
  `modify_status` int(11) DEFAULT '0' COMMENT '默认0 未更改， 1：更改',
  `note` varchar(2000) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3823 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_baidu_human_analysis_log` */

DROP TABLE IF EXISTS `xm_baidu_human_analysis_log`;

CREATE TABLE `xm_baidu_human_analysis_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sso_id` bigint(20) DEFAULT NULL COMMENT '代理人sso_id',
  `log_id` bigint(20) DEFAULT NULL COMMENT '百度接口返回的唯一log_id，用于定位问题',
  `person_num` int(11) DEFAULT NULL COMMENT '百度接口检测到的人像数目',
  `foreground` longtext COMMENT '百度分割后的人像前景抠图，透明背景，Base64编码后的png格式图片',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=967 DEFAULT CHARSET=utf8 COMMENT='百度人体分析调用记录表';

/*Table structure for table `xm_bank_infos` */

DROP TABLE IF EXISTS `xm_bank_infos`;

CREATE TABLE `xm_bank_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_no` varchar(50) DEFAULT NULL COMMENT '公司编号',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `no` varchar(100) NOT NULL COMMENT '编号',
  `pno` varchar(100) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` varchar(50) DEFAULT NULL COMMENT '值',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT '状态 -1：废弃的 1：可用的',
  PRIMARY KEY (`id`),
  KEY `idx_company_no` (`company_no`),
  KEY `idx_company_no_pno` (`company_no`,`pno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5551996 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='银行信息表';

/*Table structure for table `xm_batch_order_config` */

DROP TABLE IF EXISTS `xm_batch_order_config`;

CREATE TABLE `xm_batch_order_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `channel_code` varchar(30) DEFAULT NULL COMMENT '渠道编码',
  `code` varchar(50) NOT NULL COMMENT '业务标识码',
  `value` varchar(255) NOT NULL COMMENT '配置的值',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_no` (`product_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='团险产品配置表';

/*Table structure for table `xm_batch_order_discounts` */

DROP TABLE IF EXISTS `xm_batch_order_discounts`;

CREATE TABLE `xm_batch_order_discounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_no` char(50) NOT NULL COMMENT '批量单号订单号',
  `pay_type` tinyint(2) DEFAULT '0' COMMENT '类型：1:卡券 2:葵币 3:推广费',
  `pay_name` varchar(250) DEFAULT NULL COMMENT '显示名称，如卡券名称',
  `pay_id` char(50) DEFAULT NULL COMMENT '交易号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_bills` varchar(50) DEFAULT NULL COMMENT '面额',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `process_status` int(2) DEFAULT '0' COMMENT '与第三方交互状态 0:处理中 1:成功 2:失败 3:撤销',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xbod_orderno_paytype` (`batch_no`,`pay_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='批量单折扣信息';

/*Table structure for table `xm_batch_order_excel_history` */

DROP TABLE IF EXISTS `xm_batch_order_excel_history`;

CREATE TABLE `xm_batch_order_excel_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` char(50) NOT NULL COMMENT '批量单号',
  `sequence_number` int(11) NOT NULL COMMENT '上传修改批次号',
  `origin_file_name` varchar(250) DEFAULT NULL COMMENT '上传文件名',
  `column_names` varchar(2000) NOT NULL COMMENT '解析xls列名',
  `order_data` mediumtext NOT NULL COMMENT '投保信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='新增批单投保清单历史记录表';

/*Table structure for table `xm_batch_order_items` */

DROP TABLE IF EXISTS `xm_batch_order_items`;

CREATE TABLE `xm_batch_order_items` (
  `batch_item_no` char(50) NOT NULL COMMENT '批量单项号',
  `batch_no` char(50) NOT NULL COMMENT '批量单号',
  `order_no` char(50) DEFAULT NULL COMMENT '订单号',
  `order_data` mediumtext COMMENT '投保信息',
  `batch_pay_flag` int(11) NOT NULL DEFAULT '0' COMMENT '合并支付标识，0未合并，1合并支付',
  `ret_msg` varchar(500) DEFAULT NULL COMMENT '第三方反馈信息',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单生成处理状态，-1无效 0未生成 1已生成 2生成失败 3再核保成功 4再核保失败',
  `job_class_version` varchar(50) DEFAULT NULL COMMENT '新旧订单职业标识 ,new - 新单，old - 旧单',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`batch_item_no`),
  KEY `idx_bor_batch_no` (`batch_no`),
  KEY `idx_bor_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批量单项表';

/*Table structure for table `xm_batch_order_payment` */

DROP TABLE IF EXISTS `xm_batch_order_payment`;

CREATE TABLE `xm_batch_order_payment` (
  `batch_no` char(50) NOT NULL COMMENT '批单号',
  `pay_type` char(100) DEFAULT NULL COMMENT '支付方式(渠道):alipay,weixin',
  `pay_id` char(50) DEFAULT NULL COMMENT '付款单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_account_id` char(100) DEFAULT NULL COMMENT '付款账户',
  `pay_account_name` char(50) DEFAULT NULL COMMENT '账户名称',
  `pay_account_type` tinyint(2) DEFAULT NULL COMMENT '账户类型 0:借记卡/1:存折/2:信用卡',
  `pay_note` char(250) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`batch_no`),
  KEY `idx_bop_pay_id` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批量支付账单表';

/*Table structure for table `xm_batch_order_payment_items` */

DROP TABLE IF EXISTS `xm_batch_order_payment_items`;

CREATE TABLE `xm_batch_order_payment_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_no` char(50) NOT NULL COMMENT '订单号',
  `pay_type` char(100) DEFAULT NULL COMMENT '支付方式(渠道):xrk_alipay,xrk_weixin,commision',
  `pay_id` char(50) DEFAULT NULL COMMENT '付款单号',
  `pay_name` varchar(250) DEFAULT NULL COMMENT '显示名称',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_bills` varchar(50) DEFAULT NULL COMMENT '面额',
  `pay_account_id` char(100) DEFAULT NULL COMMENT '付款账户',
  `pay_account_name` char(50) DEFAULT NULL COMMENT '账户名称',
  `pay_account_type` tinyint(2) DEFAULT NULL COMMENT '账户类型 0:借记卡/1:存折/2:信用卡',
  `usage_type` tinyint(2) DEFAULT NULL COMMENT '0:首期 1:续期',
  `hold_name` char(50) DEFAULT NULL COMMENT '账户持有人',
  `province` char(20) DEFAULT NULL COMMENT '账户所在省',
  `city` char(20) DEFAULT NULL COMMENT '账户所在市',
  `pay_note` varchar(250) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_xopi_batchno_paytype` (`batch_no`,`pay_type`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='批量账单明细';

/*Table structure for table `xm_batch_order_reason_history` */

DROP TABLE IF EXISTS `xm_batch_order_reason_history`;

CREATE TABLE `xm_batch_order_reason_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` char(50) NOT NULL COMMENT '批量单号',
  `sequence_number` int(11) NOT NULL COMMENT '上传修改批次号',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `remark_operator` char(50) NOT NULL COMMENT '备注操作人',
  `remark_time` datetime NOT NULL COMMENT '备注操作时间',
  `reason` varchar(2000) DEFAULT NULL COMMENT '反馈',
  `reason_operator` char(50) DEFAULT NULL COMMENT '反馈操作人',
  `reason_time` datetime DEFAULT NULL COMMENT '反馈操作时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1539 DEFAULT CHARSET=utf8 COMMENT='新增备注反馈记录表';

/*Table structure for table `xm_batch_order_upgrades` */

DROP TABLE IF EXISTS `xm_batch_order_upgrades`;

CREATE TABLE `xm_batch_order_upgrades` (
  `batch_upgrade_no` char(50) NOT NULL COMMENT '团险批改单号',
  `batch_no` char(50) NOT NULL COMMENT '团单号',
  `order_no` char(50) DEFAULT NULL COMMENT '订单',
  `sale_channel` char(50) DEFAULT NULL COMMENT '销售渠道',
  `policy_info_id` char(50) NOT NULL COMMENT '保单信息id',
  `upgrade_tran_no` char(50) DEFAULT NULL COMMENT '批改单交易流水号',
  `upgrade_prem` decimal(20,2) NOT NULL COMMENT '金额',
  `upgrade_effective_date` datetime NOT NULL COMMENT '生效日期',
  `upgrade_data` mediumtext COMMENT '批改单json数据',
  `ret_msg` varchar(500) DEFAULT NULL COMMENT '返回信息',
  `status` int(11) DEFAULT NULL COMMENT '状态1:待审核(初始状态) 2:审核通过 3:审核不通过 4:批改中 5:批改成功 6:批改失败 7:批改失败已废弃',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `upgrade_image_data_url` varchar(256) DEFAULT NULL COMMENT '影像资料存放地址',
  `base_order_no` char(50) NOT NULL COMMENT '原订单号',
  `operator_id` char(30) DEFAULT NULL COMMENT '助销id',
  `policy_upgrade_no` char(50) DEFAULT NULL COMMENT '批改保单记录号',
  `operator_name` char(50) DEFAULT NULL COMMENT '助销姓名',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_type` varchar(10) DEFAULT NULL,
  `audit_customer_service_id` varchar(100) DEFAULT NULL COMMENT '最后审核客服id',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_customer_service_name` varchar(50) DEFAULT NULL COMMENT '最后审核客服名字',
  PRIMARY KEY (`batch_upgrade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团险批改单表';

/*Table structure for table `xm_batch_orders` */

DROP TABLE IF EXISTS `xm_batch_orders`;

CREATE TABLE `xm_batch_orders` (
  `batch_no` char(50) NOT NULL COMMENT '批单号',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `product_name` varchar(250) DEFAULT NULL COMMENT '商品名称',
  `order_expired_date` datetime DEFAULT NULL COMMENT '订单失效日期，订单未支付才启用',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，-2=撤回，0待处理 1处理中(确认需要下单) 2关闭 3全部失败 4部分成功 5全部成功 6出单结束，7=草稿',
  `batch_pay_type` int(11) NOT NULL DEFAULT '0' COMMENT '合并支付类型，0不可合并支付，1可合并支付',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态，0未支付，1已支付(非合并支付，状态为0一直不变)',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '待支付金额',
  `total_discount` decimal(10,2) DEFAULT NULL COMMENT '总折扣',
  `batch_type` varchar(32) DEFAULT NULL COMMENT 'batch:团单, group:团险, renewal:续保',
  `sale_channel` char(50) DEFAULT NULL COMMENT '销售渠道',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `description` varchar(250) DEFAULT NULL COMMENT '说明',
  `agent_user_no` char(50) DEFAULT NULL COMMENT '代理人用户分销ID',
  `buy_user_no` char(50) DEFAULT NULL COMMENT '购买用户ID',
  `agent_user_ssoid` char(50) DEFAULT NULL COMMENT '代理人用户ssoId',
  `operator_id` char(30) DEFAULT NULL COMMENT '操作者ID',
  `init_operator_id` char(30) DEFAULT NULL COMMENT '初始操作者ID',
  `origin_file_name` varchar(250) DEFAULT NULL COMMENT '上传文件名',
  `column_names` varchar(2000) DEFAULT NULL COMMENT '解析xls列名',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认/关闭时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `agent_user_phone` char(50) DEFAULT NULL COMMENT '代理人手机号码',
  `operator_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
  `order_policy_date` datetime DEFAULT NULL COMMENT '订单投保日期',
  `operator_email` varchar(50) DEFAULT NULL COMMENT '操作人邮箱',
  `float_percent` float(3,2) DEFAULT NULL COMMENT '保费上调系数',
  `origin_batch_no` char(50) DEFAULT NULL COMMENT '原批单号',
  `audit_customer_service_id` varchar(100) DEFAULT NULL COMMENT '最后审核客服id',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_customer_service_name` varchar(50) DEFAULT NULL COMMENT '最后审核客服名字',
  `submit_time` datetime DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`batch_no`),
  KEY `idx_bo_operatorid` (`operator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批量订单表';

/*Table structure for table `xm_batch_product_dim` */

DROP TABLE IF EXISTS `xm_batch_product_dim`;

CREATE TABLE `xm_batch_product_dim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `name` varchar(200) DEFAULT NULL COMMENT '中文名',
  `simple_no` varchar(50) DEFAULT NULL COMMENT '英文名',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='团险产品维度配置表';

/*Table structure for table `xm_batch_upgrade_config` */

DROP TABLE IF EXISTS `xm_batch_upgrade_config`;

CREATE TABLE `xm_batch_upgrade_config` (
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `sale_channel` char(50) DEFAULT '' COMMENT '销售渠道：acrm后台：xrk_drp_groupon_acrm， APP：xrk_drp_groupon_app',
  `add_status` int(11) NOT NULL DEFAULT '0' COMMENT '批增状态：1支持，0不支持',
  `delete_status` int(11) NOT NULL DEFAULT '0' COMMENT '批减状态：1支持，0不支持',
  `modify_status` int(11) NOT NULL DEFAULT '0' COMMENT '修改状态：1支持，0不支持',
  `change_status` int(11) NOT NULL DEFAULT '0' COMMENT '换人状态：1支持，0不支持',
  `judge_code` varchar(5) DEFAULT 'N' COMMENT 'app批增职业-计划名是否使用原单信息制约 N-不使用，Y-使用',
  `operator_name` varchar(50) DEFAULT NULL COMMENT '操作人姓名',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `operate_type` int(11) NOT NULL DEFAULT '1',
  `offline_email` varchar(2000) DEFAULT NULL,
  `operate_days` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `job_level_group` varchar(600) DEFAULT NULL COMMENT '团险批改，职业选择配置',
  `safeguard_plan_sort` varchar(1000) DEFAULT NULL COMMENT '保障明细顺序',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团险批改配置表';

/*Table structure for table `xm_beneficiary_infos` */

DROP TABLE IF EXISTS `xm_beneficiary_infos`;

CREATE TABLE `xm_beneficiary_infos` (
  `beneficiary_no` char(50) NOT NULL DEFAULT '' COMMENT '收益人编号',
  `insured_no` char(50) DEFAULT NULL COMMENT '被保人编号',
  `customer_no` char(50) DEFAULT NULL COMMENT '客户编号',
  `relationship` char(10) DEFAULT NULL COMMENT '与被保人关系',
  `percentage` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `no` int(11) DEFAULT NULL COMMENT '受益人序号 例如1：第一受益人 2：第二受益人',
  `grade` int(11) DEFAULT NULL COMMENT '受益人顺序 例如1：第一 2：第二',
  `id_type_validate` varchar(10) NOT NULL COMMENT '证件有效止期',
  `order_item_no` varchar(50) DEFAULT NULL COMMENT '订单项号',
  PRIMARY KEY (`beneficiary_no`),
  KEY `insured_no` (`insured_no`),
  KEY `customer_no` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='受益人信息';

/*Table structure for table `xm_car_infos` */

DROP TABLE IF EXISTS `xm_car_infos`;

CREATE TABLE `xm_car_infos` (
  `order_item_no` char(50) DEFAULT NULL COMMENT '订单项号',
  `engine_no` varchar(250) DEFAULT NULL COMMENT '发动机号',
  `license_plate_no` varchar(100) DEFAULT NULL COMMENT '车牌号',
  `vin` varchar(100) DEFAULT NULL COMMENT '车架号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  KEY `order_item_no` (`order_item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='汽车信息';

/*Table structure for table `xm_card_auth_result` */

DROP TABLE IF EXISTS `xm_card_auth_result`;

CREATE TABLE `xm_card_auth_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(32) NOT NULL COMMENT '证件号',
  `card_name` varchar(50) DEFAULT NULL COMMENT '证件号上的名称',
  `card_type` varchar(20) NOT NULL COMMENT '证件类型:身份证-IDCARD',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` smallint(6) DEFAULT '1' COMMENT '1-有效,0-失效',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `card_info` text COMMENT '证件号上的信息',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作人',
  `card_file_path` varchar(200) DEFAULT NULL COMMENT '附件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='证件结果记录表';

/*Table structure for table `xm_ccb_pay_bills` */

DROP TABLE IF EXISTS `xm_ccb_pay_bills`;

CREATE TABLE `xm_ccb_pay_bills` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '下载流水号-自动递增主键',
  `downloaded_at` date DEFAULT NULL COMMENT '下载下来时的时刻',
  `merchant_order_no` varchar(100) DEFAULT NULL COMMENT '渠道交易订单号',
  `mall_order_no` varchar(100) DEFAULT NULL COMMENT '向日葵商城订单号',
  `unionpay_merchant_no` varchar(100) DEFAULT NULL COMMENT '银商订单号',
  `trade_date` date DEFAULT NULL COMMENT '交易日期',
  `trade_type` varchar(10) DEFAULT NULL COMMENT '交易类型:5301-退款，1102-H5支付，1103-扫码支付，1104-条码支付，1105-APP支付，1106-公众号支付，1107-刷卡消费，1108-代付，1109-卡要素支付，1110-绑卡支付，1111-刷脸支付',
  `trade_money` decimal(12,2) DEFAULT NULL COMMENT '交易金额',
  `charge` decimal(12,2) DEFAULT NULL COMMENT '手续费',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式:wxpay-微信支付，alipay-支付宝支付，unionpay-云闪付支付',
  `trade_status` varchar(10) DEFAULT NULL COMMENT '状态:100-交易成功，101-处理中，102-交易失败',
  `respon_code` varchar(10) DEFAULT NULL COMMENT '响应码',
  `merchant_no` varchar(100) DEFAULT NULL COMMENT '商户编号',
  PRIMARY KEY (`id`),
  KEY `idx_ccbpb_billtime_paytag` (`mall_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4682 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_certification_type_mappings` */

DROP TABLE IF EXISTS `xm_certification_type_mappings`;

CREATE TABLE `xm_certification_type_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` char(10) NOT NULL COMMENT '类型编号',
  `relate_no` char(10) NOT NULL COMMENT '关联类型编号=certification_types.no',
  `company_no` varchar(50) NOT NULL COMMENT '公司编号',
  `seller_no` varchar(50) NOT NULL COMMENT '进货商编号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cert_type_relate_no_company_no` (`relate_no`,`company_no`),
  UNIQUE KEY `uq_cert_type_relate_no_seller_no` (`relate_no`,`seller_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='证件类型映射';

/*Table structure for table `xm_certification_types` */

DROP TABLE IF EXISTS `xm_certification_types`;

CREATE TABLE `xm_certification_types` (
  `no` char(10) NOT NULL DEFAULT '1' COMMENT '类型编号',
  `name` varchar(250) DEFAULT NULL COMMENT '类型名称',
  `order_no` int(10) DEFAULT '0',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='证件类型';

/*Table structure for table `xm_channel_product_dim_members` */

DROP TABLE IF EXISTS `xm_channel_product_dim_members`;

CREATE TABLE `xm_channel_product_dim_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维度ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `channel_code` varchar(50) NOT NULL COMMENT '渠道编码',
  `product_dim_member_id` int(11) NOT NULL COMMENT '商品维度成员id',
  `channel_product_dim_id` int(11) NOT NULL COMMENT '渠道商品维度id',
  `order_no` int(11) DEFAULT NULL COMMENT '顺序号',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1:可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `channel_dims_member_ix1` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=utf8 COMMENT='渠道商品维度成员';

/*Table structure for table `xm_channel_product_dims` */

DROP TABLE IF EXISTS `xm_channel_product_dims`;

CREATE TABLE `xm_channel_product_dims` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维度ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `channel_code` varchar(50) NOT NULL COMMENT '渠道编码',
  `product_dim_id` int(11) NOT NULL COMMENT '商品维度id',
  `def_value` varchar(50) NOT NULL COMMENT '渠道默认值',
  `is_show` int(11) NOT NULL COMMENT '是否显示: 0:不显示 1:显示',
  `order_no` int(11) DEFAULT NULL COMMENT '顺序号',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1:可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `channel_dims_ix1` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='渠道商品维度';

/*Table structure for table `xm_channel_product_files` */

DROP TABLE IF EXISTS `xm_channel_product_files`;

CREATE TABLE `xm_channel_product_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` char(50) NOT NULL COMMENT '文件id',
  `file_status` int(11) NOT NULL DEFAULT '1' COMMENT '文件状态 -1:逻辑删除 1 正常启用',
  `product_no` char(50) NOT NULL COMMENT '产品编号',
  `channel_code` char(30) NOT NULL COMMENT '渠道编号',
  `terminal` char(30) DEFAULT NULL COMMENT '终端 PC端：pc   触屏版 ：touch',
  `alias` char(50) DEFAULT NULL COMMENT '文件别名，编程关联字段',
  `type` char(20) DEFAULT NULL COMMENT '类型：如img,pdf,html,txt''',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `file_txt` text COMMENT '文件内容 产品特色等',
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4662 DEFAULT CHARSET=utf8 COMMENT='渠道商品文件表';

/*Table structure for table `xm_channel_product_histories` */

DROP TABLE IF EXISTS `xm_channel_product_histories`;

CREATE TABLE `xm_channel_product_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道商产品历史表ID',
  `channel_product_id` char(50) NOT NULL COMMENT '渠道商产品表ID',
  `product_no` char(50) NOT NULL,
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `product_name` varchar(250) DEFAULT NULL COMMENT '渠道商产品标题',
  `product_subname` text COMMENT '渠道商产品子标题',
  `product_image` varchar(250) DEFAULT NULL COMMENT '渠道商产品图片',
  `product_desc` text COMMENT '渠道商产品自定义描述',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `list_status` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示在商品列表：1. 显示，0. 不显示',
  `insurancepre_status` int(5) NOT NULL DEFAULT '0' COMMENT '投保方案状态：0 关闭，1 开启，2 预发布',
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶标识，1：置顶，0：取消置顶',
  `main_product` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cph_order_no` (`order_no`),
  KEY `idx_cph_channel_code` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2523 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='渠道商商品立即记录表';

/*Table structure for table `xm_channel_product_seo` */

DROP TABLE IF EXISTS `xm_channel_product_seo`;

CREATE TABLE `xm_channel_product_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_code` char(30) NOT NULL COMMENT '渠道编号',
  `product_no` char(50) NOT NULL COMMENT '产品编号',
  `title` varchar(100) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(100) DEFAULT NULL COMMENT 'SEO 关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：-1 无效  1：有效',
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='渠道产品SEO信息表';

/*Table structure for table `xm_channel_product_shares` */

DROP TABLE IF EXISTS `xm_channel_product_shares`;

CREATE TABLE `xm_channel_product_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享ID',
  `channel_code` char(30) NOT NULL COMMENT '渠道代码',
  `product_no` char(50) NOT NULL COMMENT '商品编码',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 qq/weixin/NULL  NULL 为通用',
  `title` varchar(250) NOT NULL COMMENT '分享标题',
  `content` varchar(2048) NOT NULL COMMENT '分享内容',
  `image_url` varchar(256) NOT NULL COMMENT '分享图片',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_cps_ccode_pno_platform` (`channel_code`,`product_no`,`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=1233 DEFAULT CHARSET=utf8 COMMENT='渠道商产品分享信息';

/*Table structure for table `xm_channel_product_sort` */

DROP TABLE IF EXISTS `xm_channel_product_sort`;

CREATE TABLE `xm_channel_product_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` char(50) NOT NULL,
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `business_scene` char(50) NOT NULL COMMENT '业务场景',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(5) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `link_product_no` varchar(50) DEFAULT '' COMMENT '关联产品编号',
  PRIMARY KEY (`id`),
  KEY `idx_cp_order_no` (`order_no`),
  KEY `idx_cp_channel_code` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=78632 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='渠道商品排序表';

/*Table structure for table `xm_channel_product_templete` */

DROP TABLE IF EXISTS `xm_channel_product_templete`;

CREATE TABLE `xm_channel_product_templete` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(50) DEFAULT NULL COMMENT '模板名称',
  `channel_code` char(30) NOT NULL COMMENT '渠道编号 直销：xrk_ds，分销：xrk_drp ，直销2.0：xrk_nds',
  `product_no` char(50) DEFAULT NULL,
  `terminal` char(30) DEFAULT NULL COMMENT '终端：PC端：pc  触屏版：touch',
  `path` varchar(255) DEFAULT NULL COMMENT '模板路径',
  `desc` char(50) DEFAULT NULL COMMENT '模板描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '模板状态-1：无效 1：有效',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '模板类型 0：通用版  1：定制版',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='渠道产品模板';

/*Table structure for table `xm_channel_product_templete_relaction` */

DROP TABLE IF EXISTS `xm_channel_product_templete_relaction`;

CREATE TABLE `xm_channel_product_templete_relaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_code` char(30) NOT NULL COMMENT '渠道编号 直销：xrk_ds，分销：xrk_drp ，直销2.0：xrk_nds',
  `product_no` char(50) NOT NULL COMMENT '产品编号',
  `terminal` char(30) DEFAULT NULL COMMENT '终端：PC端：pc  触屏版：touch',
  `templete_id` int(11) NOT NULL COMMENT '模板编号',
  `percent` decimal(10,0) NOT NULL DEFAULT '100' COMMENT '百分比',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '模板状态 -1 ：无效 1：有效',
  `created_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COMMENT='渠道产品模板关系表';

/*Table structure for table `xm_channel_products` */

DROP TABLE IF EXISTS `xm_channel_products`;

CREATE TABLE `xm_channel_products` (
  `id` char(50) NOT NULL COMMENT '渠道商产品ID',
  `product_no` char(50) NOT NULL,
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `product_name` varchar(250) DEFAULT NULL COMMENT '渠道商产品标题',
  `product_subname` text COMMENT '渠道商产品子标题',
  `product_image` varchar(250) DEFAULT NULL COMMENT '渠道商产品图片',
  `product_desc` text COMMENT '渠道商产品自定义描述',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(5) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `list_status` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示在商品列表：1. 显示，0. 不显示',
  `insurancepre_status` int(5) NOT NULL DEFAULT '0' COMMENT '投保方案状态：0 关闭，1 开启，2 预发布',
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶标识，1：置顶，0：取消置顶',
  `main_product` varchar(50) DEFAULT NULL,
  `public_time` datetime DEFAULT NULL COMMENT '首次上架时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cp_channel_code_product_no` (`product_no`,`channel_code`) COMMENT '渠道商品组合唯一索引',
  KEY `idx_cp_order_no` (`order_no`),
  KEY `idx_cp_channel_code` (`channel_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='渠道商商品';

/*Table structure for table `xm_chuanglan_human_detect_log` */

DROP TABLE IF EXISTS `xm_chuanglan_human_detect_log`;

CREATE TABLE `xm_chuanglan_human_detect_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sso_id` varchar(200) DEFAULT NULL COMMENT '代理人sso_id',
  `score` varchar(50) DEFAULT NULL COMMENT '1.照⽚相似分（超过等于45分 ⼀般建议为同⼀个⼈） 2.判断是否为活体 ,hack可信度（>0.98不可信, <=0.98 可信）',
  `request_sn` varchar(200) DEFAULT NULL COMMENT '交易流⽔id（人像对比接口）',
  `image_key` varchar(200) DEFAULT NULL COMMENT '通过AES加密的随机字符串',
  `face_result` varchar(50) DEFAULT NULL COMMENT '⼈像对⽐结果 ,⼀致2000 不⼀致2001',
  `citizen_result` varchar(50) DEFAULT NULL COMMENT '身份核验结果，⼀致2000 不⼀致2001',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '请求类型1：人像对比，2 活体检测',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `image_url` varchar(2000) DEFAULT NULL COMMENT '图片地址',
  `app_source` varchar(32) DEFAULT NULL COMMENT 'xrk(向日葵app)/kkyd(咔咔有单app)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COMMENT='创蓝人体识别检测调用日志';

/*Table structure for table `xm_claims_email_templates` */

DROP TABLE IF EXISTS `xm_claims_email_templates`;

CREATE TABLE `xm_claims_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_no` varchar(255) DEFAULT NULL,
  `email_content` text,
  `topic` varchar(255) DEFAULT NULL,
  `fdfs_url` varchar(500) DEFAULT NULL,
  `use_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_claims_records` */

DROP TABLE IF EXISTS `xm_claims_records`;

CREATE TABLE `xm_claims_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` char(50) NOT NULL COMMENT '保险公司编号',
  `policy_no` char(50) NOT NULL COMMENT '保单号',
  `regist_no` char(50) DEFAULT NULL COMMENT '报案号',
  `customer_unique_ident_no` char(50) DEFAULT NULL COMMENT '客户唯一识别号(小保单号)',
  `report_date` datetime DEFAULT NULL COMMENT '报案时间',
  `cancel_date` datetime DEFAULT NULL COMMENT '注销报案时间',
  `cancel_reason` text COMMENT '报案注销原因',
  `damage_date` datetime DEFAULT NULL COMMENT '出险时间',
  `damage_address` varchar(50) DEFAULT NULL COMMENT '出险地区',
  `damage_code` varchar(50) DEFAULT NULL COMMENT '出险原因代码',
  `damage_name` varchar(500) DEFAULT NULL COMMENT '出险原因名称',
  `claim_date` datetime DEFAULT NULL COMMENT '立案时间',
  `deny_date` datetime DEFAULT NULL COMMENT '拒赔时间',
  `deny_reason` text COMMENT '拒赔原因',
  `end_case_date` datetime DEFAULT NULL COMMENT '结案时间',
  `case_type` int(11) DEFAULT NULL COMMENT '案件状态:0报案成功; 1报案注销; 2立案注销; 3拒赔; 4结案; 6立案未结案;7不予受理',
  `case_conclusion` varchar(50) DEFAULT NULL COMMENT '案件结论:1正常赔付;7通融赔付;99其他',
  `sum_paid` decimal(10,2) DEFAULT NULL COMMENT '案件赔付金额',
  `kind_info_list` mediumtext COMMENT '保险json信息',
  `hos_info_list` mediumtext COMMENT '医院json信息',
  `desease_info_list` mediumtext COMMENT '疾病json信息',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `policy_no` (`policy_no`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=utf8 COMMENT='渠道理赔记录';

/*Table structure for table `xm_claims_type` */

DROP TABLE IF EXISTS `xm_claims_type`;

CREATE TABLE `xm_claims_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `claims_type` int(11) NOT NULL COMMENT '1、渠道理赔、2、渠道报案、3、渠道协查、4、渠道自助',
  `use_status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8 COMMENT='理赔类型表';

/*Table structure for table `xm_commission_auth` */

DROP TABLE IF EXISTS `xm_commission_auth`;

CREATE TABLE `xm_commission_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_no` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编码',
  `category_id` int(11) DEFAULT NULL COMMENT '品类ID',
  `action_type` int(11) DEFAULT '0' COMMENT '操作类型：0: 新单， 1：续保，2：新单和续保',
  `start_time` datetime DEFAULT NULL COMMENT '策略起始时间',
  `stop_time` datetime DEFAULT NULL COMMENT '策略结束时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='推广费权限配置';

/*Table structure for table `xm_commission_quota_condition` */

DROP TABLE IF EXISTS `xm_commission_quota_condition`;

CREATE TABLE `xm_commission_quota_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '佣金额度条件id',
  `name` varchar(50) NOT NULL COMMENT '佣金额度条件名称',
  `create_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `use_status` int(11) DEFAULT '1' COMMENT '1-有效,0-无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_companies` */

DROP TABLE IF EXISTS `xm_companies`;

CREATE TABLE `xm_companies` (
  `parent_no` varchar(50) NOT NULL DEFAULT '',
  `company_no` varchar(50) NOT NULL DEFAULT '' COMMENT '公司编码',
  `name` varchar(200) NOT NULL COMMENT '公司名称',
  `status` int(11) DEFAULT '1' COMMENT '状态：0:停用 1 启用 ',
  `phone` char(20) DEFAULT NULL COMMENT '保险公司电话号码',
  `logo` varchar(30) DEFAULT NULL COMMENT '公司logo，保存文件号',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `sort` int(11) DEFAULT NULL COMMENT '公司排序',
  `abbreviation` varchar(20) DEFAULT NULL COMMENT '公司简称',
  `websiteaddress` varchar(70) DEFAULT NULL COMMENT '公司官网地址',
  `claim_website` varchar(500) DEFAULT NULL COMMENT '保险公司理赔url',
  `introduce` varchar(30) DEFAULT NULL COMMENT '公司介绍，保存文件号',
  `partner_code` varchar(50) DEFAULT NULL COMMENT '合作机构系统编码',
  `agent_team_code` varchar(50) DEFAULT NULL COMMENT '中介团队编码',
  PRIMARY KEY (`company_no`),
  KEY `idx_co_pno` (`parent_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险公司';

/*Table structure for table `xm_companies_branch` */

DROP TABLE IF EXISTS `xm_companies_branch`;

CREATE TABLE `xm_companies_branch` (
  `company_no` varchar(50) NOT NULL DEFAULT '' COMMENT '总公司编码',
  `branch_company_no` varchar(50) NOT NULL DEFAULT '' COMMENT '分公司编码',
  `name` varchar(200) NOT NULL COMMENT '公司名称',
  `status` int(11) DEFAULT '1' COMMENT '状态：0:停用 1 启用 ',
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `phone` char(20) DEFAULT NULL COMMENT '保险公司电话号码',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `addressee_phone` varchar(20) DEFAULT NULL COMMENT '收件人电话号码',
  `addressee_name` varchar(20) DEFAULT NULL COMMENT '收件人姓名',
  `address` varchar(200) DEFAULT NULL COMMENT '公司地址',
  PRIMARY KEY (`branch_company_no`),
  KEY `idx_co_cno` (`company_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险分公司表';

/*Table structure for table `xm_company_app_relations` */

DROP TABLE IF EXISTS `xm_company_app_relations`;

CREATE TABLE `xm_company_app_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_no` varchar(50) NOT NULL COMMENT '商城公司编码',
  `group_name` varchar(50) NOT NULL COMMENT '商城公司名称',
  `app_company_id` varchar(50) NOT NULL COMMENT 'app端公司编码',
  `app_company_name` varchar(250) DEFAULT NULL COMMENT 'app端公司名称',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='商城和app公司映射信息';

/*Table structure for table `xm_company_base_infos` */

DROP TABLE IF EXISTS `xm_company_base_infos`;

CREATE TABLE `xm_company_base_infos` (
  `company_base_no` char(50) NOT NULL COMMENT '基本信息编号=md5(公司名称+所属行业+证件类型+证件号)',
  `company_name` char(254) NOT NULL COMMENT '公司名称',
  `company_level` char(50) NOT NULL COMMENT '所属行业',
  `certification_type` char(50) NOT NULL COMMENT '证件类型',
  `certification_no` char(128) NOT NULL COMMENT '证件号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `company_level_ext` char(254) DEFAULT NULL COMMENT '所属行业大类子类扩展',
  PRIMARY KEY (`company_base_no`),
  KEY `id_company_name` (`company_name`),
  KEY `idx_oc_cno` (`certification_type`,`certification_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司基本信息表';

/*Table structure for table `xm_company_infos` */

DROP TABLE IF EXISTS `xm_company_infos`;

CREATE TABLE `xm_company_infos` (
  `company_no` char(50) NOT NULL COMMENT '公司编号',
  `company_base_no` char(50) NOT NULL COMMENT '公司基本信息编号',
  `company_document_url` varchar(2000) DEFAULT NULL COMMENT '公司资料url地址',
  `total_employee` char(10) NOT NULL COMMENT '公司总人数',
  `valid_type` int(2) NOT NULL DEFAULT '0' COMMENT '有效期类型：1：起期至止期，2：起期至永久，3：长期',
  `start_time` datetime DEFAULT NULL COMMENT '起期',
  `end_time` datetime DEFAULT NULL COMMENT '止期',
  `province_code` char(10) NOT NULL COMMENT '省',
  `province_name` char(10) NOT NULL COMMENT '省',
  `city_code` char(10) NOT NULL COMMENT '市',
  `city_name` char(24) NOT NULL COMMENT '市',
  `area_code` char(10) DEFAULT NULL COMMENT '县区',
  `area_name` char(24) DEFAULT NULL COMMENT '县区',
  `company_address` varchar(1024) NOT NULL COMMENT '详细办公地址',
  `zip_code` char(12) NOT NULL COMMENT '邮编',
  `office_phone` char(24) NOT NULL COMMENT '办公电话',
  `link_name` char(50) NOT NULL COMMENT '联系人姓名',
  `link_phone` char(24) NOT NULL COMMENT '联系人手机号',
  `link_email` char(50) NOT NULL COMMENT '联系人邮件',
  `bill_type` int(2) NOT NULL DEFAULT '0' COMMENT '发票类型：1：增值税普通发票，2：增值税专用发票',
  `taxpayer_id` varchar(30) DEFAULT NULL COMMENT '纳税人识别号',
  `attr_info` varchar(2000) DEFAULT NULL COMMENT '扩展属性JSON格式',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `legal_representative` varchar(30) DEFAULT NULL COMMENT '企业法人代表',
  `registered_capital` varchar(20) DEFAULT NULL COMMENT '注册资金',
  `currency_type` varchar(30) DEFAULT NULL COMMENT '币种',
  `company_category` varchar(100) DEFAULT NULL COMMENT '企业类别',
  `company_nature` varchar(100) DEFAULT NULL COMMENT '单位性质',
  PRIMARY KEY (`company_no`),
  KEY `id_company_base_no` (`company_base_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='公司信息表';

/*Table structure for table `xm_contract_record` */

DROP TABLE IF EXISTS `xm_contract_record`;

CREATE TABLE `xm_contract_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `appid` varchar(50) NOT NULL COMMENT '应用ID(直连商户申请的公众号或移动应用appid)',
  `mch_id` varchar(50) NOT NULL COMMENT '商户号',
  `contract_id` varchar(50) DEFAULT NULL COMMENT '委托代扣协议id',
  `contract_code` varchar(50) NOT NULL COMMENT '签约协议号',
  `plan_id` varchar(50) NOT NULL COMMENT '模板id',
  `openid` varchar(50) DEFAULT NULL COMMENT '用户标识(同一个Appid下，用户的唯一标识)',
  `contract_state` smallint(6) NOT NULL COMMENT '协议状态: -1：初始状态; 0: 已签约; 1: 未签约(解约); 9: 签约进行中',
  `request_serial` bigint(20) DEFAULT NULL COMMENT '请求序列号',
  `contract_signed_time` datetime DEFAULT NULL COMMENT '协议签署时间',
  `contract_expired_time` datetime DEFAULT NULL COMMENT '协议到期时间（目前协议时间为长期有效，可以忽略该字段）',
  `contract_terminated_time` datetime DEFAULT NULL COMMENT '协议解约时间',
  `contract_termination_mode` smallint(6) DEFAULT NULL COMMENT '协议解约方式：1：有效期过自动解约（预留功能）; 2：用户主动解约; 3：商户API解约; 4：商户平台解约; 5：注销（用户微信账户注销）; 7：用户联系客服发起的解约',
  `contract_termination_remark` varchar(256) DEFAULT NULL COMMENT '解约备注',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '状态:0-无效,1-有效',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`),
  KEY `contract_id_index` (`contract_id`),
  KEY `contract_code_plan_id_index` (`contract_code`,`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='签约/解约记录表';

/*Table structure for table `xm_coverages` */

DROP TABLE IF EXISTS `xm_coverages`;

CREATE TABLE `xm_coverages` (
  `coverage_no` char(50) NOT NULL COMMENT '险种编号',
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `coverage` char(50) DEFAULT NULL COMMENT '险种代码',
  `coverage_name` char(250) DEFAULT NULL COMMENT '险种名称',
  `coverage_prem` varchar(20) DEFAULT NULL COMMENT '保费',
  `coverage_rate` varchar(20) DEFAULT NULL COMMENT '费率',
  `coverage_sum_insured` varchar(20) DEFAULT NULL COMMENT '保额',
  `mult` int(11) NOT NULL DEFAULT '0' COMMENT '份数',
  `coverage_order` int(11) DEFAULT NULL COMMENT '险种顺序：1表示第一个，2表示第二个',
  `insured_no` char(50) DEFAULT NULL COMMENT '被保人ID',
  `note` text COMMENT '备注',
  `coverage_type` int(1) DEFAULT '0' COMMENT '险种类别，0：主险，1：附加险',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`coverage_no`),
  KEY `order_item_no` (`order_item_no`),
  KEY `insured_no` (`insured_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保单险种';

/*Table structure for table `xm_cps_callback` */

DROP TABLE IF EXISTS `xm_cps_callback`;

CREATE TABLE `xm_cps_callback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sso_id` int(11) DEFAULT NULL,
  `cps_seller_no` varchar(64) DEFAULT NULL COMMENT '渠道编号',
  `cps_order_no` varchar(64) DEFAULT NULL COMMENT '产品来源方订单号',
  `cps_product_id` varchar(32) DEFAULT NULL COMMENT '来源方产品ID',
  `product_no` varchar(50) DEFAULT NULL COMMENT '向日葵系统产品编号',
  `callback_data` text COMMENT '回调参数',
  `order_no` varchar(64) DEFAULT NULL COMMENT '我方订单编号',
  `process_type` varchar(64) DEFAULT NULL COMMENT '处理类型，2,3,5,6,7,9=未出单; 8=出单成功; 10=已退保',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cps_rec_ssoId_createdAt` (`sso_id`,`created_at`) USING BTREE,
  KEY `idx_cps_rec_orderNo_createdAt` (`order_no`,`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3233 DEFAULT CHARSET=utf8 COMMENT='CPS系统回调记录表';

/*Table structure for table `xm_cps_product_info` */

DROP TABLE IF EXISTS `xm_cps_product_info`;

CREATE TABLE `xm_cps_product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `source_product_id` varchar(128) DEFAULT NULL COMMENT '来源方产品ID',
  `source_product_url` varchar(1024) DEFAULT NULL COMMENT '来源方产品url',
  `order_result_url` varchar(1024) DEFAULT NULL COMMENT '在来源方完成订单返回的url',
  `extr_config` text COMMENT '额外特定配置，格式为json',
  `status` int(2) DEFAULT NULL COMMENT '0=无效，1=有效',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='CPS接入产品信息表';

/*Table structure for table `xm_cps_xrk_mappings` */

DROP TABLE IF EXISTS `xm_cps_xrk_mappings`;

CREATE TABLE `xm_cps_xrk_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cps_product_no` varchar(50) NOT NULL COMMENT 'cps编号',
  `cps_product_name` varchar(50) NOT NULL COMMENT 'cps产品名',
  `xrk_product_no` varchar(50) NOT NULL COMMENT 'xrk编号',
  `xrk_product_name` varchar(50) NOT NULL COMMENT 'xrk产品名',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cps_product_no` (`cps_product_no`,`cps_product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='CPS续保产品映射';

/*Table structure for table `xm_customer_base_infos` */

DROP TABLE IF EXISTS `xm_customer_base_infos`;

CREATE TABLE `xm_customer_base_infos` (
  `customer_base_no` char(50) NOT NULL COMMENT '基本信息编号=md5(姓名+性别+证件类型+证件号+出生年月日)',
  `name` char(50) NOT NULL COMMENT '客户姓名',
  `sex` char(10) NOT NULL COMMENT '客户性别',
  `certification_type` char(10) NOT NULL COMMENT '证件类型',
  `certification_no` char(50) NOT NULL COMMENT '证件号',
  `birthday` char(10) NOT NULL COMMENT '出生年月日',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`customer_base_no`),
  KEY `idx_cbi_cno_ctype` (`certification_no`,`certification_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户基本信息';

/*Table structure for table `xm_customer_infos` */

DROP TABLE IF EXISTS `xm_customer_infos`;

CREATE TABLE `xm_customer_infos` (
  `customer_no` char(50) NOT NULL COMMENT '客户编号',
  `customer_base_no` char(50) NOT NULL COMMENT '客户基本信息编码',
  `english_name` char(250) DEFAULT NULL COMMENT '英文名',
  `province` char(10) DEFAULT NULL COMMENT '省',
  `city` char(20) DEFAULT NULL COMMENT '市',
  `area` char(20) DEFAULT NULL COMMENT '区',
  `address` text COMMENT '客户地址',
  `email` char(100) DEFAULT NULL COMMENT '客户电子邮箱',
  `mobile_no` char(20) DEFAULT NULL COMMENT '客户手机号',
  `zip_code` char(10) DEFAULT NULL COMMENT '客户邮政编码',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `job_level` varchar(250) DEFAULT NULL COMMENT '职业类别',
  `attr_info` varchar(2000) DEFAULT NULL COMMENT '扩展属性JSON格式',
  `town` char(20) DEFAULT NULL COMMENT '镇',
  `city_code` varchar(50) DEFAULT NULL,
  `province_code` varchar(50) DEFAULT NULL,
  `area_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_no`),
  KEY `customer_base_no` (`customer_base_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户信息';

/*Table structure for table `xm_customer_unique_ident` */

DROP TABLE IF EXISTS `xm_customer_unique_ident`;

CREATE TABLE `xm_customer_unique_ident` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `seller_no` varchar(10) DEFAULT NULL COMMENT '进货商编码',
  `customer_no` varchar(50) DEFAULT NULL COMMENT '客户编号（关联xm_customer_infos）',
  `policy_no` varchar(200) DEFAULT NULL COMMENT '保单号',
  `customer_unique_ident_no` varchar(200) DEFAULT NULL COMMENT '客户唯一识别号（小保单号）',
  `insured_certification_no` varchar(50) DEFAULT NULL COMMENT '被保人证件号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0:无效；1:有效）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `extra_data` text COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5362 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户唯一识别信息表';

/*Table structure for table `xm_danger_distributor` */

DROP TABLE IF EXISTS `xm_danger_distributor`;

CREATE TABLE `xm_danger_distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sso_id` bigint(11) DEFAULT NULL,
  `danger_lev_id` int(11) DEFAULT NULL,
  `danger_lev_name` varchar(255) DEFAULT NULL,
  `use_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `valid_status` int(11) DEFAULT '1' COMMENT '有效状态位：1，记录有效，0、记录无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_danger_element` */

DROP TABLE IF EXISTS `xm_danger_element`;

CREATE TABLE `xm_danger_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(255) NOT NULL COMMENT '元素类型：sso_id,phone,id_card',
  `element_value` varchar(255) NOT NULL COMMENT '元素值',
  `danger_lev_id` int(11) DEFAULT NULL,
  `danger_lev_name` varchar(255) DEFAULT NULL,
  `source` int(11) DEFAULT NULL COMMENT '名单来源：1：疑似高风险代理人同步；2：向日葵系统排查同步；3：第三方平台同步；4：保险公司同步',
  `use_status` int(11) DEFAULT '1' COMMENT '有效状态位：1，有效，-1、无效',
  `assess` varchar(2048) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8 COMMENT='风险代理人元素表';

/*Table structure for table `xm_danger_element_history` */

DROP TABLE IF EXISTS `xm_danger_element_history`;

CREATE TABLE `xm_danger_element_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danger_element_id` int(11) DEFAULT NULL,
  `danger_lev_id` int(11) DEFAULT NULL,
  `danger_lev_name` varchar(255) DEFAULT NULL,
  `source` int(11) DEFAULT '1' COMMENT '名单来源：1：疑似高风险代理人同步；2：向日葵系统排查同步；3：第三方平台同步；4：保险公司同步',
  `assess` varchar(2048) DEFAULT NULL,
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5653 DEFAULT CHARSET=utf8 COMMENT='风险代理人元素变更历史表';

/*Table structure for table `xm_danger_element_record` */

DROP TABLE IF EXISTS `xm_danger_element_record`;

CREATE TABLE `xm_danger_element_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sso_id` int(11) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `danger_lev_id` int(11) DEFAULT NULL,
  `danger_lev_name` varchar(255) DEFAULT NULL,
  `source` int(11) DEFAULT '1' COMMENT '名单来源：1：疑似高风险代理人同步；2：向日葵系统排查同步；3：第三方平台同步；4：保险公司同步',
  `remark` varchar(2048) DEFAULT NULL,
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=utf8 COMMENT='风险代理人元素关联入库表';

/*Table structure for table `xm_danger_element_relation` */

DROP TABLE IF EXISTS `xm_danger_element_relation`;

CREATE TABLE `xm_danger_element_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sso_id` int(11) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `use_status` int(11) DEFAULT NULL COMMENT '有效状态位：1，有效，-1、无效',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=utf8 COMMENT='风险代理人元素关联表';

/*Table structure for table `xm_danger_lev` */

DROP TABLE IF EXISTS `xm_danger_lev`;

CREATE TABLE `xm_danger_lev` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rule_name` varchar(255) DEFAULT NULL,
  `use_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `level` int(11) DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_danger_lev_blacklist` */

DROP TABLE IF EXISTS `xm_danger_lev_blacklist`;

CREATE TABLE `xm_danger_lev_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danger_lev_id` int(11) DEFAULT NULL,
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `class_id` int(11) DEFAULT NULL,
  `subclass_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `category_id` int(11) DEFAULT NULL COMMENT '商品品类ID',
  `is_all_seller` int(11) DEFAULT '0' COMMENT '渠道是否全选：0：非全选；1：全选',
  `is_all_category` int(11) DEFAULT '0' COMMENT '品类是否全选：0：非全选；1：全选',
  `is_all_class` int(11) DEFAULT '0' COMMENT '险种是否全选：0：非全选；1：全选',
  `danger_element_id` int(11) DEFAULT NULL COMMENT '风险代理人元素ID',
  `white_list_id` bigint(20) DEFAULT NULL COMMENT '白名单表ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2652 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_danger_lev_whiteproduct` */

DROP TABLE IF EXISTS `xm_danger_lev_whiteproduct`;

CREATE TABLE `xm_danger_lev_whiteproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danger_lev_id` int(11) DEFAULT NULL,
  `seller_no` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subclass_id` int(11) DEFAULT NULL,
  `product_no` varchar(50) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `category_id` int(11) DEFAULT NULL COMMENT '商品品类ID',
  `danger_element_id` int(11) DEFAULT NULL COMMENT '风险代理人元素ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_data_match` */

DROP TABLE IF EXISTS `xm_data_match`;

CREATE TABLE `xm_data_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `policy_no` varchar(50) NOT NULL COMMENT '商品编码',
  `policy_effective_date` datetime DEFAULT NULL COMMENT '保险起始日期',
  `policy_end_date` datetime DEFAULT NULL COMMENT '保险结束日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156449 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单信息配置表';

/*Table structure for table `xm_divide_order_payment` */

DROP TABLE IF EXISTS `xm_divide_order_payment`;

CREATE TABLE `xm_divide_order_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(32) NOT NULL COMMENT '订单号',
  `total_amount` int(10) NOT NULL COMMENT '总应缴金额，单位：分',
  `divide_pay_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态:0-未分期,1-年缴分期,2-月缴分期',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态:0-失效,1-正常',
  `total_pay_count` int(11) NOT NULL COMMENT '总缴费期数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='订单分期总表';

/*Table structure for table `xm_divide_order_payment_item` */

DROP TABLE IF EXISTS `xm_divide_order_payment_item`;

CREATE TABLE `xm_divide_order_payment_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(32) NOT NULL COMMENT '订单号',
  `sub_order_no` char(32) NOT NULL COMMENT '子订单号',
  `product_no` char(20) NOT NULL COMMENT '产品编号',
  `pay_id` char(50) DEFAULT NULL COMMENT '付款单号',
  `pay_amount` int(10) NOT NULL COMMENT '金额，单位：分',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态:0-代缴费,1-已缴费,2-扣费中,3-已失效',
  `remind_time` timestamp(3) NOT NULL COMMENT '提醒时间,预购费通知时间',
  `remind_status` smallint(2) NOT NULL DEFAULT '0' COMMENT '预购费通知状态:0-未发送,1-已发送',
  `pay_count` smallint(3) NOT NULL COMMENT '缴费期数',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间，扣费成功时间',
  `start_time` timestamp(3) NOT NULL COMMENT '开始缴费时间',
  `end_time` timestamp(3) NOT NULL COMMENT '结束缴费时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2677 DEFAULT CHARSET=utf8 COMMENT='订单分期缴费记录表（分期子表）';

/*Table structure for table `xm_evaluation_records` */

DROP TABLE IF EXISTS `xm_evaluation_records`;

CREATE TABLE `xm_evaluation_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluate_key` varchar(64) DEFAULT NULL COMMENT '测算唯一识别编号',
  `evaluation_type` varchar(16) DEFAULT NULL COMMENT '测算类型，group_price=团险测算',
  `sso_id` int(11) DEFAULT NULL COMMENT '测算用户SSOID',
  `product_no` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `evaluate_data` mediumtext,
  `status` int(255) DEFAULT '1' COMMENT '1=正常，0=无效',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_eval_key` (`evaluate_key`) USING BTREE,
  KEY `idx_created_at` (`created_at`) USING BTREE,
  KEY `idx_ssoid_prodno` (`sso_id`,`product_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1622 DEFAULT CHARSET=utf8 COMMENT='测算记录表';

/*Table structure for table `xm_fail_order_monitor_config` */

DROP TABLE IF EXISTS `xm_fail_order_monitor_config`;

CREATE TABLE `xm_fail_order_monitor_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` varchar(64) DEFAULT NULL COMMENT '保险公司编号，为空时为渠道维度通用配置',
  `product_no` varchar(64) DEFAULT NULL COMMENT '产品号，为空时为产品维度通用配置',
  `statistics_period` int(11) DEFAULT NULL COMMENT '每次统计时长段,单位：分钟',
  `effective_min_count` int(11) DEFAULT NULL COMMENT '统计时长内最低请求量',
  `success_rate_threshold` int(11) DEFAULT NULL COMMENT '成功率告警阀值, 1-100',
  `config_type` tinyint(4) NOT NULL COMMENT '类型，1=订单异常配置，2=保单异常配置',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=不启动，1=启用',
  `notify_type` tinyint(4) DEFAULT NULL COMMENT '通知类型，1=邮件，2=短信',
  `notify_client_address` varchar(1024) DEFAULT NULL COMMENT '通知接收地址（邮件，手机号）',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_fail_order_monitor_config_seller_status` (`seller_no`,`status`) USING BTREE,
  KEY `idx_fail_order_monitor_config_prodNo_status` (`product_no`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='接口异常影响用户下单预警处理配置表';

/*Table structure for table `xm_featured_first_products` */

DROP TABLE IF EXISTS `xm_featured_first_products`;

CREATE TABLE `xm_featured_first_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `product_name` varchar(50) NOT NULL COMMENT '商品名称',
  `product_title` varchar(50) NOT NULL COMMENT '首页商品标题',
  `product_desc` varchar(250) DEFAULT NULL COMMENT '首页营销文案',
  `product_image` varchar(250) DEFAULT NULL COMMENT '首页商品图片',
  `product_list_desc` varchar(250) DEFAULT NULL COMMENT '列表页营销文案',
  `company_no` varchar(30) DEFAULT NULL COMMENT '代理人所属公司',
  `display_position` int(11) DEFAULT '1' COMMENT '首页展示位置：1.左边，2.右边',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='首页推荐位商品表';

/*Table structure for table `xm_files` */

DROP TABLE IF EXISTS `xm_files`;

CREATE TABLE `xm_files` (
  `id` char(30) NOT NULL COMMENT '文件ID',
  `name` varchar(50) DEFAULT NULL COMMENT '文件名',
  `src` varchar(150) DEFAULT NULL COMMENT '文件地址',
  `file_status` int(11) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `file_type` varchar(30) DEFAULT NULL COMMENT '文件类型: image/pdf',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `fdfs_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件存储';

/*Table structure for table `xm_first_order` */

DROP TABLE IF EXISTS `xm_first_order`;

CREATE TABLE `xm_first_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_user_no` char(50) NOT NULL COMMENT '代理人用户ID',
  `sale_channel` char(50) DEFAULT NULL COMMENT '销售渠道(all：全渠道，xrk_drp：分销，xrk_idv：独代)',
  `first_order_type` char(20) DEFAULT NULL COMMENT '首单类型，pay-按支付时间统计的首单，long-按长险统计的首单，had_long_order-出过长险单',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `id_agent_user_no` (`agent_user_no`) USING BTREE,
  KEY `id_first_order_type` (`first_order_type`) USING BTREE,
  KEY `id_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COMMENT='首单记录表';

/*Table structure for table `xm_flash sale_activity` */

DROP TABLE IF EXISTS `xm_flash sale_activity`;

CREATE TABLE `xm_flash sale_activity` (
  `product_no` varchar(50) NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `start_time` datetime DEFAULT NULL COMMENT '抢购开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '抢购结束时间',
  `status` int(11) NOT NULL COMMENT '0:未开始 1：活动中  2：已结束',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 预留字段',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时抢购活动表';

/*Table structure for table `xm_flash_sale_activity` */

DROP TABLE IF EXISTS `xm_flash_sale_activity`;

CREATE TABLE `xm_flash_sale_activity` (
  `product_no` varchar(50) NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `start_time` datetime DEFAULT NULL COMMENT '抢购开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '抢购结束时间',
  `status` int(11) NOT NULL COMMENT '0:未开始 1：活动中  2：已结束',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 预留字段',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时抢购活动表';

/*Table structure for table `xm_flash_sales_activity` */

DROP TABLE IF EXISTS `xm_flash_sales_activity`;

CREATE TABLE `xm_flash_sales_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `start_time` datetime DEFAULT NULL COMMENT '抢购开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '抢购结束时间',
  `status` int(11) NOT NULL COMMENT '0:正常 1：取消  2：已结束',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `platform` varchar(50) DEFAULT NULL COMMENT '平台 预留字段',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `commission_percent` decimal(10,5) DEFAULT NULL COMMENT '商品总推广费百分比',
  `commission_type_id` int(4) DEFAULT NULL COMMENT '分销额外推广费id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='限时抢购活动表';

/*Table structure for table `xm_global_age_ranges` */

DROP TABLE IF EXISTS `xm_global_age_ranges`;

CREATE TABLE `xm_global_age_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '年龄范围ID',
  `name` varchar(20) NOT NULL COMMENT '年龄范围名称',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='全局商品年龄范围';

/*Table structure for table `xm_global_category` */

DROP TABLE IF EXISTS `xm_global_category`;

CREATE TABLE `xm_global_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(200) DEFAULT NULL COMMENT '品类名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `use_status` int(11) DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态',
  `status` int(11) DEFAULT '1' COMMENT '状态：-1:停用 1:启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品品类';

/*Table structure for table `xm_global_classes` */

DROP TABLE IF EXISTS `xm_global_classes`;

CREATE TABLE `xm_global_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '大类ID',
  `name` varchar(200) DEFAULT NULL COMMENT '大类名称',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `use_status` int(11) DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态',
  `status` int(11) DEFAULT '1' COMMENT '状态：-1:停用 1:启用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局商品大类';

/*Table structure for table `xm_global_clauses` */

DROP TABLE IF EXISTS `xm_global_clauses`;

CREATE TABLE `xm_global_clauses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '全局保障权益ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局保障权益';

/*Table structure for table `xm_global_dims` */

DROP TABLE IF EXISTS `xm_global_dims`;

CREATE TABLE `xm_global_dims` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '全局维度ID',
  `name` varchar(200) DEFAULT NULL COMMENT '全局维度名称',
  `is_compare_dim` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是对比维度',
  `simple_no` varchar(50) DEFAULT NULL COMMENT '维度简码',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `global_dims_ix1` (`simple_no`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局维度';

/*Table structure for table `xm_global_features` */

DROP TABLE IF EXISTS `xm_global_features`;

CREATE TABLE `xm_global_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '亮点ID',
  `name` varchar(255) DEFAULT NULL COMMENT '亮点名称',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局商品亮点';

/*Table structure for table `xm_global_payee_channels` */

DROP TABLE IF EXISTS `xm_global_payee_channels`;

CREATE TABLE `xm_global_payee_channels` (
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `name` varchar(255) DEFAULT NULL COMMENT '收款渠道名称',
  `json_config` text COMMENT '收款渠道JSON配置数据',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`payee_channel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局收款渠道';

/*Table structure for table `xm_global_serieses` */

DROP TABLE IF EXISTS `xm_global_serieses`;

CREATE TABLE `xm_global_serieses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系列ID',
  `series_name` varchar(200) DEFAULT NULL COMMENT '系列名称',
  `company_no` varchar(20) DEFAULT NULL COMMENT '保险公司编码',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `global_serieses_ix1` (`company_no`,`series_name`)
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局商品系列';

/*Table structure for table `xm_global_subclasses` */

DROP TABLE IF EXISTS `xm_global_subclasses`;

CREATE TABLE `xm_global_subclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小类ID',
  `name` varchar(200) DEFAULT NULL COMMENT '小类名称',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `use_status` int(11) DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态',
  `status` int(11) DEFAULT '1' COMMENT '状态：-1:停用 1:启用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局商品小类';

/*Table structure for table `xm_global_sys_properties` */

DROP TABLE IF EXISTS `xm_global_sys_properties`;

CREATE TABLE `xm_global_sys_properties` (
  `prop_level_id` varchar(200) NOT NULL COMMENT '系统属性ID',
  `simple_name` varchar(100) DEFAULT NULL COMMENT '属性简称',
  `desc` varchar(200) DEFAULT NULL COMMENT '属性描述',
  `prop_value` varchar(4096) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`prop_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='全局系统属性配置';

/*Table structure for table `xm_health_notice_answer_submit_records` */

DROP TABLE IF EXISTS `xm_health_notice_answer_submit_records`;

CREATE TABLE `xm_health_notice_answer_submit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `trans_no` char(50) NOT NULL COMMENT '健康告知流水号',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `answer_code` varchar(50) NOT NULL COMMENT '答案编号',
  `answer_describe` varchar(2000) NOT NULL COMMENT '答案描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_question_id` (`question_id`),
  KEY `idx_answer_code` (`answer_code`),
  KEY `idx_trans_no` (`trans_no`),
  KEY `idx_product_no` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=194545 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='健康告知答案提交记录表';

/*Table structure for table `xm_health_notice_question_records` */

DROP TABLE IF EXISTS `xm_health_notice_question_records`;

CREATE TABLE `xm_health_notice_question_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '渠道编号',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `question_code` varchar(50) NOT NULL COMMENT '问题编号',
  `question_describe` varchar(2000) NOT NULL COMMENT '问题描述',
  `question_rules` varchar(2000) DEFAULT NULL COMMENT '问题规则描述,json格式',
  `level` int(11) DEFAULT NULL COMMENT '问题层级',
  `question_pno` varchar(50) DEFAULT NULL COMMENT '问题父编号',
  `status` int(11) NOT NULL COMMENT '状态 0-失效 1-有效',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_question_code` (`question_code`),
  KEY `idx_product_no` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=193035 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='健康告知问题记录表';

/*Table structure for table `xm_huiming_products` */

DROP TABLE IF EXISTS `xm_huiming_products`;

CREATE TABLE `xm_huiming_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省名称',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市名称',
  `config_json` text COMMENT '配置信息',
  `grade` int(11) NOT NULL DEFAULT '1' COMMENT '级别:1省,2市',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '0:下线，1:上线',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_insure_ocr_white_lists` */

DROP TABLE IF EXISTS `xm_insure_ocr_white_lists`;

CREATE TABLE `xm_insure_ocr_white_lists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(32) NOT NULL COMMENT '证件号',
  `card_type` varchar(20) NOT NULL COMMENT '根据表xm_certification_types.no',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` smallint(6) DEFAULT NULL COMMENT '1-男,0-女',
  `status` smallint(6) DEFAULT '1' COMMENT '1-有效,0-失效',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作人',
  `cert_files_url` varchar(500) DEFAULT NULL COMMENT '文件列表, 身份证包括2个url  ，{"card_front_url": "" ,"card_back_url":"" }',
  PRIMARY KEY (`id`),
  KEY `idx_card_no_type` (`card_no`,`card_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_insured_infos` */

DROP TABLE IF EXISTS `xm_insured_infos`;

CREATE TABLE `xm_insured_infos` (
  `insured_no` char(50) NOT NULL DEFAULT '' COMMENT '被保人编号',
  `order_item_no` char(50) DEFAULT NULL COMMENT '订单项号',
  `customer_no` char(50) DEFAULT NULL COMMENT '客户编号',
  `copies` int(11) DEFAULT NULL COMMENT '投保份数',
  `prem` decimal(10,2) DEFAULT NULL COMMENT '保费',
  `insured_relation` char(10) DEFAULT NULL COMMENT '投被保人关系',
  `relation_type` varchar(20) DEFAULT 'applier_insured' COMMENT '投被保人关系基准标识，applier_insured=投保人是被保人的，insured_applier=被保人是投保人的',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `op_type` int(6) DEFAULT '0' COMMENT '0-默认新增，1-团险批增，2-团险批改，3-团险批减',
  `origin_customer_no` char(50) DEFAULT NULL COMMENT '原客户编号-暂时只有批改单修改操作有值，记录批改前的客户编号',
  `insured_age` int(11) DEFAULT NULL COMMENT '投保年龄',
  PRIMARY KEY (`insured_no`),
  KEY `order_item_no` (`order_item_no`),
  KEY `customer_no` (`customer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='被保人信息';

/*Table structure for table `xm_insured_relation_mappings` */

DROP TABLE IF EXISTS `xm_insured_relation_mappings`;

CREATE TABLE `xm_insured_relation_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` char(10) NOT NULL COMMENT '编号',
  `relate_no` char(10) NOT NULL COMMENT '关联编号 = insured_relations.no',
  `company_no` varchar(50) NOT NULL COMMENT '公司编号',
  `seller_no` varchar(50) NOT NULL COMMENT '进货商编号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_insured_relations_relate_no_seller_no` (`no`,`seller_no`),
  UNIQUE KEY `uq_insured_relations_relate_no_company_no` (`no`,`company_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='被保人关系信息映射';

/*Table structure for table `xm_insured_relations` */

DROP TABLE IF EXISTS `xm_insured_relations`;

CREATE TABLE `xm_insured_relations` (
  `no` char(10) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `order_no` int(11) DEFAULT '0' COMMENT '排序号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='被保人关系信息';

/*Table structure for table `xm_intelligent_questions` */

DROP TABLE IF EXISTS `xm_intelligent_questions`;

CREATE TABLE `xm_intelligent_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `seller_no` char(50) NOT NULL COMMENT '渠道编码',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `no` varchar(50) NOT NULL COMMENT '问题编号',
  `pno` varchar(50) NOT NULL COMMENT '问题父编号',
  `describe` varchar(2000) NOT NULL COMMENT '问题描述',
  `type` varchar(50) NOT NULL COMMENT '问题类型 i-疾病；q-问题；a-答案',
  `level` int(11) DEFAULT NULL COMMENT '问题层级',
  `result` varchar(50) DEFAULT NULL COMMENT '结论',
  `result_code` varchar(50) DEFAULT NULL COMMENT '结论Code S-标准体 EX-除外承保 D-拒保 P-转人工核保',
  `serious_describe` varchar(2000) DEFAULT NULL COMMENT '重疾除外责任',
  `slight_describe` varchar(2000) DEFAULT NULL COMMENT '轻症除外责任',
  `add_prem_describe` varchar(2000) DEFAULT NULL COMMENT '加费项汇总描述',
  `add_prem` decimal(10,2) DEFAULT NULL COMMENT '基础保费加费金额',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(50) DEFAULT NULL COMMENT '保司编号',
  `classification` varchar(50) DEFAULT '0' COMMENT '问卷分类，如一个产品有两份智能核保问卷，0表示第一份，1表示第二份。如果没有多份则默认是0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116479 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='智能核保问卷表';

/*Table structure for table `xm_intelligent_records` */

DROP TABLE IF EXISTS `xm_intelligent_records`;

CREATE TABLE `xm_intelligent_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `serial_no` char(50) NOT NULL COMMENT '智能核保码',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `no` varchar(50) NOT NULL COMMENT '问题编号',
  `describe` varchar(2000) NOT NULL COMMENT '问题描述',
  `type` varchar(50) NOT NULL COMMENT '问题类型 i-疾病；q-问题；a-答案',
  `level` int(11) NOT NULL COMMENT '问题层级',
  `result` varchar(50) DEFAULT NULL COMMENT '结论',
  `result_code` varchar(50) DEFAULT NULL COMMENT '结论Code S-标准体 EX-除外承保 D-拒保 P-转人工核保',
  `question_no` varchar(50) NOT NULL COMMENT '问题父编号',
  `serious_describe` varchar(2000) DEFAULT NULL COMMENT '重疾除外责任',
  `slight_describe` varchar(2000) DEFAULT NULL COMMENT '轻症除外责任',
  `add_prem_describe` varchar(2000) DEFAULT NULL COMMENT '加费项汇总描述',
  `add_prem` decimal(10,2) DEFAULT NULL COMMENT '基础保费加费金额',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `code` varchar(50) DEFAULT NULL COMMENT '保司编号',
  PRIMARY KEY (`id`),
  KEY `idx_inteluw_no` (`no`),
  KEY `idx_serial_no` (`serial_no`),
  KEY `idx_product_no` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=193243 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='智能核保记录表';

/*Table structure for table `xm_intelligent_underwriting` */

DROP TABLE IF EXISTS `xm_intelligent_underwriting`;

CREATE TABLE `xm_intelligent_underwriting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `seller_no` char(50) NOT NULL COMMENT '渠道编码',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `sale_channel` char(50) NOT NULL COMMENT '渠道代码',
  `serial_no` char(50) NOT NULL COMMENT '智能核保码',
  `underwriting_dims` varchar(2000) DEFAULT NULL COMMENT '核保维度',
  `result_code` int(2) DEFAULT NULL COMMENT '在线核保返回码 0:可以投保 1:拒保 2:请求异常',
  `result_msg` varchar(200) DEFAULT NULL COMMENT '在线核保返回信息',
  `appoint_describe` varchar(2000) DEFAULT NULL COMMENT '特别约定项汇总描述',
  `add_prem_describe` varchar(2000) DEFAULT NULL COMMENT '加费项汇总描述',
  `add_prem` decimal(10,2) DEFAULT NULL COMMENT '基础保费加费金额',
  `add_total_prem` decimal(10,2) DEFAULT NULL COMMENT '总加费金额（包含豁免增量金额，下单后落地）',
  `expired_time` datetime NOT NULL COMMENT '过期时间，过期后需重新进行智能核保',
  `order_no` char(50) DEFAULT NULL COMMENT '使用该核保码下单的的订单号（下单后落地）',
  `order_base_prem` decimal(10,2) DEFAULT NULL COMMENT '订单原始保费金额（下单后落地）',
  `slight_describe` varchar(2000) DEFAULT NULL COMMENT '轻症除外责任描述',
  `serious_describe` varchar(2000) DEFAULT NULL COMMENT '重疾除外责任描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_inteluw_serino` (`serial_no`),
  KEY `idx_inteluw_orderno` (`order_no`),
  KEY `idx_inteluw_serino` (`serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1476 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='智能核保信息表';

/*Table structure for table `xm_invoice` */

DROP TABLE IF EXISTS `xm_invoice`;

CREATE TABLE `xm_invoice` (
  `batch_no` char(50) NOT NULL COMMENT '团单号',
  `is_need` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为默认值   1是需要，0为不需要',
  `invoice_name` varchar(80) DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(80) DEFAULT NULL COMMENT '纳税人识别码',
  `address` varchar(100) DEFAULT NULL COMMENT '收件地址',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `name` varchar(40) DEFAULT NULL COMMENT '收件人名字',
  `phone` char(13) DEFAULT NULL COMMENT '收件人电话号码',
  `invoice_type` tinyint(4) DEFAULT '1' COMMENT '1为纸质发票，2为电子发票',
  PRIMARY KEY (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团险发票地址';

/*Table structure for table `xm_job_classes` */

DROP TABLE IF EXISTS `xm_job_classes`;

CREATE TABLE `xm_job_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` int(11) DEFAULT NULL COMMENT '编号',
  `pno` int(11) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(250) NOT NULL COMMENT '名称',
  `company_code` varchar(50) DEFAULT NULL COMMENT '公司代码，标示公司区别，如：XRK、ZM（中民）',
  `code` varchar(10) DEFAULT NULL COMMENT '代码',
  `risk_level` int(11) DEFAULT NULL COMMENT '风险级别',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品代码，标示公司区别，如：AB_HXJK_0001',
  `special_flag` int(2) DEFAULT NULL COMMENT '是否特殊职业 0-否，1-是',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_job_classes_pid` (`no`),
  KEY `idx_job_classes_company_code` (`company_code`),
  KEY `idx_job_classes_risk_level` (`risk_level`),
  KEY `idx_job_classes_pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=2395764 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='行业分类信息';

/*Table structure for table `xm_job_classes_full` */

DROP TABLE IF EXISTS `xm_job_classes_full`;

CREATE TABLE `xm_job_classes_full` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` int(11) DEFAULT NULL COMMENT '编号',
  `pno` int(11) DEFAULT NULL COMMENT '父类编号',
  `name` varchar(250) NOT NULL COMMENT '名称',
  `company_code` varchar(50) DEFAULT NULL COMMENT '公司代码，标示公司区别，如：XRK、ZM（中民）',
  `code` varchar(10) DEFAULT NULL COMMENT '代码',
  `risk_level` int(11) DEFAULT NULL COMMENT '风险级别',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_job_classes_pid` (`no`),
  KEY `idx_job_classes_company_code` (`company_code`),
  KEY `idx_job_classes_risk_level` (`risk_level`),
  KEY `idx_job_classes_pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=254694 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='完整职业信息表';

/*Table structure for table `xm_manual_payment` */

DROP TABLE IF EXISTS `xm_manual_payment`;

CREATE TABLE `xm_manual_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `batch_no` char(50) NOT NULL COMMENT '批单号',
  `batch_type` varchar(32) DEFAULT NULL COMMENT 'batch:团单, group:团险',
  `pay_id` char(50) DEFAULT NULL COMMENT '支付单号',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '手工支付状态，0未支付，1已支付, 2=支付中, -1=支付信息驳回，-2=支付失败作废',
  `status` int(10) DEFAULT '1' COMMENT '0=无效，1=正常',
  `operation_at` char(100) DEFAULT NULL COMMENT '操作人',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payor` char(100) DEFAULT NULL COMMENT '付款人',
  `bank_name` varchar(100) DEFAULT '' COMMENT '开户行',
  `acc_no` varchar(25) DEFAULT '' COMMENT '银行卡号',
  `order_no` varchar(50) DEFAULT NULL COMMENT '商城订单号',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件url',
  `seq_no` int(11) DEFAULT '1' COMMENT '记录序号',
  `workflow_no` varchar(50) DEFAULT NULL COMMENT '对应工单号',
  `remark` varchar(200) DEFAULT NULL COMMENT '保存失败原因等信息',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100374 DEFAULT CHARSET=utf8 COMMENT='手工支付账单表';

/*Table structure for table `xm_marketing_cost` */

DROP TABLE IF EXISTS `xm_marketing_cost`;

CREATE TABLE `xm_marketing_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` varchar(100) NOT NULL COMMENT '合作渠道',
  `product_no` varchar(255) NOT NULL COMMENT '商品编号',
  `product_name` text COMMENT '商品名称',
  `use_status` int(11) NOT NULL COMMENT '状态： -1 删除 1 可用',
  `nature` int(11) NOT NULL COMMENT '费用性质 1：税前 2：税后',
  `include_renewal` int(2) DEFAULT '0' COMMENT '是否包含续保单：1.是，0.否',
  `quota_condition_type` int(11) DEFAULT NULL COMMENT '费用额度条件',
  `reward_start_time` datetime DEFAULT NULL COMMENT '奖励开始时间',
  `reward_end_time` datetime DEFAULT NULL COMMENT '奖励结束时间',
  `reward_mode` int(11) NOT NULL COMMENT '佣金方式 1：佣金 2：技术服务费',
  `threshold` varchar(255) DEFAULT NULL COMMENT '起征点(元)',
  `remark` text COMMENT '备注',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `conditions_item` varchar(255) DEFAULT NULL COMMENT '额度条件',
  `reward_time` int(11) DEFAULT NULL COMMENT '结算频次－－:1表示单月,2表示自定义,3周期内每个自然月单独结算,4周期累计总和一次结算',
  `merge_period` varchar(200) DEFAULT '' COMMENT '统计营销目标需要合并的多个年限，","分隔',
  `reward_job_levels` varchar(200) DEFAULT '' COMMENT '给予奖励的职业类别，多个职业类别之间以","分隔',
  `statistics_job_levels` varchar(200) DEFAULT '' COMMENT '计算达到营销目标的职业类别，多个职业类别之间以","分隔',
  `calculate_type` int(11) DEFAULT '0' COMMENT '营销目标计算方式，0-计算全部职业类别，1-计算所选职业类别',
  `extend_limit` varchar(350) DEFAULT '' COMMENT '费用额度条件扩展json',
  `new_rule` int(11) DEFAULT '0' COMMENT '1-新的计算规则，0-旧的计算规则',
  `tax_rate` int(11) DEFAULT '6' COMMENT '税后费率,0-100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='营销费用表';

/*Table structure for table `xm_marketing_cost_history` */

DROP TABLE IF EXISTS `xm_marketing_cost_history`;

CREATE TABLE `xm_marketing_cost_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_cost_id` int(11) NOT NULL COMMENT '营销费用ID',
  `seller_no` varchar(100) NOT NULL COMMENT '合作渠道',
  `product_no` varchar(255) NOT NULL COMMENT '商品编号',
  `product_name` text COMMENT '商品名称',
  `use_status` int(11) NOT NULL COMMENT '状态： -1 删除 1 可用',
  `nature` int(11) NOT NULL COMMENT '费用性质 1：税前 2：税后',
  `include_renewal` int(2) DEFAULT '0' COMMENT '是否包含续保单：1.是，0.否',
  `quota_condition_type` int(11) DEFAULT NULL COMMENT '费用额度条件',
  `reward_start_time` datetime DEFAULT NULL COMMENT '奖励开始时间',
  `reward_end_time` datetime DEFAULT NULL COMMENT '奖励结束时间',
  `reward_mode` int(11) NOT NULL COMMENT '佣金方式 1：佣金 2：技术服务费',
  `threshold` varchar(255) DEFAULT NULL COMMENT '起征点(元)',
  `remark` text COMMENT '备注',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `conditions_item` varchar(255) DEFAULT NULL COMMENT '额度条件',
  `reward_time` int(11) DEFAULT NULL COMMENT '结算频次－－:1表示单月,2表示自定义,3周期内每个自然月单独结算,4周期累计总和一次结算',
  `merge_period` varchar(200) DEFAULT '' COMMENT '统计营销目标需要合并的多个年限，","分隔',
  `reward_job_levels` varchar(200) DEFAULT '' COMMENT '给予奖励的职业类别，多个职业类别之间以","分隔',
  `statistics_job_levels` varchar(200) DEFAULT '' COMMENT '计算达到营销目标的职业类别，多个职业类别之间以","分隔',
  `calculate_type` int(11) DEFAULT '0' COMMENT '营销目标计算方式，0-计算全部职业类别，1-计算所选职业类别',
  `extend_limit` varchar(350) DEFAULT '' COMMENT '费用额度条件扩展json',
  `new_rule` int(11) DEFAULT '0' COMMENT '1-新的计算规则，0-旧的计算规则',
  `tax_rate` int(11) DEFAULT '6' COMMENT '税后费率,0-100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='营销费用历史表';

/*Table structure for table `xm_marketing_cost_target` */

DROP TABLE IF EXISTS `xm_marketing_cost_target`;

CREATE TABLE `xm_marketing_cost_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_cost_id` varchar(100) NOT NULL COMMENT '营销费用ID',
  `premiums_number` int(11) NOT NULL COMMENT '保费1或件数2',
  `marketing_cost_target` varchar(255) NOT NULL COMMENT '营销目标',
  `reward` varchar(50) DEFAULT NULL COMMENT '奖励',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `use_status` int(11) NOT NULL COMMENT '状态： -1 删除 1 可用',
  `target_productnos` varchar(350) DEFAULT NULL COMMENT '目标统计对象，为空表示取值为奖励对象，产品编号，用,分割',
  `target_productnames` text COMMENT '目标统计对象名称',
  `target_limit` text COMMENT '目标限制条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='营销目标表';

/*Table structure for table `xm_marketing_cost_target_history` */

DROP TABLE IF EXISTS `xm_marketing_cost_target_history`;

CREATE TABLE `xm_marketing_cost_target_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `marketing_cost_id` varchar(100) NOT NULL COMMENT '营销费用ID',
  `premiums_number` int(11) NOT NULL COMMENT '保费1或件数2',
  `marketing_cost_target` varchar(255) NOT NULL COMMENT '营销目标',
  `reward` varchar(50) DEFAULT NULL COMMENT '奖励',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `use_status` int(11) NOT NULL COMMENT '状态： -1 删除 1 可用',
  `markting_cost_history_id` int(11) NOT NULL COMMENT '营销费用历史记录表ID',
  `target_productnos` varchar(350) DEFAULT NULL COMMENT '目标统计对象，为空表示取值为奖励对象，产品编号，用,分割',
  `target_productnames` text COMMENT '目标统计对象名称',
  `target_limit` text COMMENT '目标限制条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8 COMMENT='营销目标历史表';

/*Table structure for table `xm_marketing_target_reward` */

DROP TABLE IF EXISTS `xm_marketing_target_reward`;

CREATE TABLE `xm_marketing_target_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '奖励id',
  `target_id` int(11) NOT NULL COMMENT '目标对象xm_marketing_cost_target的id',
  `reward_limit` text COMMENT '奖励限制条件配置',
  `reward_value` varchar(50) NOT NULL COMMENT '奖励值',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `use_status` int(11) NOT NULL COMMENT '1-可用，-1-删除',
  `cost_id` int(11) NOT NULL COMMENT '营销费用id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='目标奖励配置表';

/*Table structure for table `xm_marketing_target_reward_history` */

DROP TABLE IF EXISTS `xm_marketing_target_reward_history`;

CREATE TABLE `xm_marketing_target_reward_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `reward_id` int(11) NOT NULL COMMENT '奖励id',
  `target_id` int(11) NOT NULL COMMENT '目标对象xm_marketing_cost_target的id',
  `reward_value` varchar(50) NOT NULL COMMENT '奖励值',
  `reward_limit` text COMMENT '奖励限制条件配置',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `use_status` int(11) NOT NULL COMMENT '1-可用，-1-删除',
  `marketing_cost_target_history_id` int(11) DEFAULT NULL COMMENT '营销目标历史记录表ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='目标奖励配置历史记录表';

/*Table structure for table `xm_merchant_order_details` */

DROP TABLE IF EXISTS `xm_merchant_order_details`;

CREATE TABLE `xm_merchant_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `policy_no` varchar(100) DEFAULT NULL COMMENT '保单号',
  `belong_type` varchar(50) DEFAULT NULL COMMENT '订单归属类型，merchant=商户，manager=管理员，team_member=团员/队长',
  `belong_id` int(11) DEFAULT NULL COMMENT '归属账户sso_id',
  `belong_team_id` int(11) DEFAULT NULL COMMENT '归属账户所属团队ID',
  `belong_team_level` int(11) DEFAULT NULL COMMENT '订单代理人层级',
  `agent_id` int(11) DEFAULT NULL COMMENT '订单代理人sso_id',
  `agent_team_id` int(11) DEFAULT NULL COMMENT '订单代理人团队ID',
  `agent_team_level` int(11) DEFAULT NULL COMMENT '订单代理人团队层级',
  `biz_status` int(11) DEFAULT NULL COMMENT '订单状态，0=已关闭，1=待支付，2=已支付，3=已出单，4=已撤单，5=已退保',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`),
  KEY `policy_no` (`policy_no`),
  KEY `belong_id` (`belong_id`,`biz_status`,`created_at`),
  KEY `belong_team_id` (`belong_team_id`,`biz_status`,`created_at`),
  KEY `agent_id` (`agent_id`,`biz_status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1939 DEFAULT CHARSET=utf8 COMMENT='商户订单及归属明细表';

/*Table structure for table `xm_merchant_orders` */

DROP TABLE IF EXISTS `xm_merchant_orders`;

CREATE TABLE `xm_merchant_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `policy_no` varchar(100) DEFAULT NULL COMMENT '保单号',
  `merchant_id` varchar(100) DEFAULT NULL COMMENT '商户ssoid',
  `agent_id_level_1` varchar(100) DEFAULT NULL COMMENT '管理员ssoid',
  `agent_id_level_2` varchar(100) DEFAULT NULL COMMENT '团队长ssoid',
  `agent_id_level_3` varchar(100) DEFAULT NULL COMMENT '团员ssoid',
  `order_agent_id` varchar(100) DEFAULT NULL COMMENT '订单代理人ssoid',
  `order_agent_drp_id` varchar(100) DEFAULT NULL COMMENT '订单代理人分销ID',
  `order_buyer_drp_id` varchar(100) DEFAULT NULL COMMENT '订单购买人分销ID',
  `biz_status` int(11) DEFAULT '1' COMMENT '订单状态，0=已关闭，1=待支付，2=已支付，3=已出单，4=已撤单，5=已退保',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`),
  KEY `policy_no` (`policy_no`),
  KEY `agent_id_level_1` (`agent_id_level_1`,`created_at`,`biz_status`) USING BTREE,
  KEY `merchant_id_agtId` (`merchant_id`,`created_at`,`biz_status`) USING BTREE,
  KEY `order_agent_id` (`order_agent_id`,`created_at`,`biz_status`) USING BTREE,
  KEY `agent_id_level_2` (`agent_id_level_2`,`created_at`,`biz_status`),
  KEY `agent_id_level_3` (`agent_id_level_3`,`created_at`,`biz_status`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='商户订单表';

/*Table structure for table `xm_merchant_team_products` */

DROP TABLE IF EXISTS `xm_merchant_team_products`;

CREATE TABLE `xm_merchant_team_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `sale_channel` varchar(50) DEFAULT NULL COMMENT '销售渠道编号',
  `team_id` int(11) DEFAULT NULL COMMENT '团队id',
  `sale_status` varchar(50) DEFAULT NULL COMMENT 'pending_sale=待上架，in_sale=上架销售中，stop_sale=团队长下架，hangup_commission=推广费变动挂起',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `seq_id` int(11) DEFAULT NULL COMMENT '序号',
  `primary_sale_time` datetime DEFAULT NULL COMMENT '首次上架销售时间',
  `sale_time` datetime DEFAULT NULL COMMENT '最近上架时间',
  `hangup_time` datetime DEFAULT NULL COMMENT '最近挂起时间',
  `team_stop_sale_time` datetime DEFAULT NULL COMMENT '最近团队停售时间',
  `core_stop_sale_time` datetime DEFAULT NULL COMMENT '最近核心停售时间',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52397 DEFAULT CHARSET=utf8 COMMENT='商户团队产品表';

/*Table structure for table `xm_merchant_team_products_history` */

DROP TABLE IF EXISTS `xm_merchant_team_products_history`;

CREATE TABLE `xm_merchant_team_products_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `sale_channel` varchar(50) DEFAULT NULL COMMENT '销售渠道',
  `team_id` int(11) DEFAULT NULL COMMENT '团队ID',
  `op_type` varchar(50) DEFAULT NULL COMMENT '操作类型，start_sale=上架，stop_sale_team=团队下架，stop_sale_core=核心下架，hangup_commission=推广费变动挂起，hangup_core=核心挂起',
  `operator` varchar(50) DEFAULT NULL,
  `change_content` text COMMENT '变更明细',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205526 DEFAULT CHARSET=utf8 COMMENT='商户产品操作历史表';

/*Table structure for table `xm_message_records` */

DROP TABLE IF EXISTS `xm_message_records`;

CREATE TABLE `xm_message_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_code` varchar(50) DEFAULT NULL COMMENT '项目标示, 如：xrk_drp，xrk_ds等',
  `sender` varchar(250) DEFAULT NULL COMMENT '发送者',
  `receiver` varchar(250) DEFAULT NULL COMMENT '接收者',
  `message_type` tinyint(4) DEFAULT NULL COMMENT '消息类型：0短信，1邮件，2app通知，3微信通知',
  `title` varchar(250) DEFAULT NULL COMMENT '消息标题',
  `content` text CHARACTER SET utf8mb4 COMMENT '消息内容，包含整个http完整的head 和body，用于重放',
  `send_result` varchar(50) DEFAULT NULL COMMENT '发送结果，记录发送接口响应结果',
  `receive_status` varchar(50) DEFAULT NULL COMMENT '消息送达状态，消费者通知回调修改状态',
  `biz_no` varchar(150) DEFAULT NULL COMMENT '业务查询编号，方便定位记录',
  `biz_type` tinyint(4) DEFAULT NULL COMMENT '业务类型：1首次出单邮件记录,2重新发送出单邮件记录,3APP推送专属客服微信记录',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_xmsr_biz_no` (`biz_no`)
) ENGINE=InnoDB AUTO_INCREMENT=98765 DEFAULT CHARSET=utf8 COMMENT='消息发送记录';

/*Table structure for table `xm_message_requests` */

DROP TABLE IF EXISTS `xm_message_requests`;

CREATE TABLE `xm_message_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` char(50) DEFAULT NULL COMMENT '事件主题',
  `producer_name` varchar(255) DEFAULT NULL COMMENT '生产者名称',
  `produce_time` datetime DEFAULT NULL COMMENT '发送时间',
  `mall_order_no` varchar(150) DEFAULT NULL COMMENT '商城订单号',
  `send_result` varchar(50) DEFAULT NULL COMMENT '发送结果',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328276 DEFAULT CHARSET=utf8 COMMENT='请求消息';

/*Table structure for table `xm_message_templates` */

DROP TABLE IF EXISTS `xm_message_templates`;

CREATE TABLE `xm_message_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` char(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `company_no` varchar(50) DEFAULT NULL COMMENT '保险公司编号',
  `sale_channel` varchar(50) DEFAULT NULL COMMENT '销售渠道',
  `env_code` varchar(50) DEFAULT NULL COMMENT '环境代码，如：app、微信、pad',
  `template_type` tinyint(4) NOT NULL COMMENT '模板类型， 0：短信，1：邮件，2：app通知，3微信通知',
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `content` text COMMENT '模板内容',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态：0关闭，1正常',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_xmt_pn_cn_sn_en` (`product_no`,`company_no`,`sale_channel`,`env_code`),
  KEY `idx_xmt_et` (`event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10000317 DEFAULT CHARSET=utf8 COMMENT='消息模板';

/*Table structure for table `xm_ocr_records` */

DROP TABLE IF EXISTS `xm_ocr_records`;

CREATE TABLE `xm_ocr_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `source_info` text COMMENT '需要对比的原始信息，json格式',
  `ocr_images` text COMMENT '需要做ocr的图片url，json数组',
  `ocr_result` text COMMENT 'OCR识别结果',
  `check_result` int(11) DEFAULT NULL COMMENT '校验结果，0=未校验，1=校验成功，2校验失败',
  `check_result_remark` varchar(255) DEFAULT NULL COMMENT '校验结果信息',
  `process_result` int(11) DEFAULT NULL COMMENT '后续处理标识，0=未处理，1=处理成功，2=处理中，3=处理失败',
  `process_result_remark` varchar(255) DEFAULT NULL COMMENT '最后一次处理结果说明',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编号',
  `ocr_choose` varchar(50) DEFAULT NULL COMMENT '选择ocr的Service',
  `ocr_type` varchar(50) DEFAULT NULL COMMENT 'ocr类型',
  PRIMARY KEY (`id`),
  KEY `idx_ocr_rec_ordNo_createdAt` (`order_no`,`created_at`) USING BTREE,
  KEY `idx_ocr_productNo_orderNo` (`product_no`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1894 DEFAULT CHARSET=utf8 COMMENT='OCR记录表';

/*Table structure for table `xm_ocr_upload_conf` */

DROP TABLE IF EXISTS `xm_ocr_upload_conf`;

CREATE TABLE `xm_ocr_upload_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编码',
  `image_type` varchar(200) DEFAULT NULL COMMENT '支持上传的图片类型',
  `watermark` varchar(200) NOT NULL COMMENT '水印内容',
  `ocr_choose` varchar(50) NOT NULL COMMENT '选择ocr的Service',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `check_ocr_type` smallint(6) DEFAULT '1' COMMENT '业务类型 1-反洗钱，3-通用ocr',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_offline_import_detail` */

DROP TABLE IF EXISTS `xm_offline_import_detail`;

CREATE TABLE `xm_offline_import_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `policy_no` varchar(200) DEFAULT NULL COMMENT '保单号',
  `policy_status` int(11) DEFAULT NULL COMMENT '同步的保单状态:1已出单,3已退保',
  `status` int(11) DEFAULT NULL COMMENT '0-待同步,1-同步成功,2-同步失败',
  `reason` varchar(250) DEFAULT NULL COMMENT '失败原因',
  `form_row_data` text COMMENT '表格对应每行原始数据',
  `order_no` varchar(50) DEFAULT NULL COMMENT '生成的向日葵订单号',
  `offline_task_id` int(11) DEFAULT NULL COMMENT '关联xm_offline_import_tasks的id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8 COMMENT='同步线下订单明细表';

/*Table structure for table `xm_offline_import_tasks` */

DROP TABLE IF EXISTS `xm_offline_import_tasks`;

CREATE TABLE `xm_offline_import_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `file_name` varchar(250) DEFAULT NULL COMMENT '文件名称',
  `fdfs_path` varchar(200) DEFAULT NULL COMMENT '源文件路径',
  `policy_num` int(11) DEFAULT '0' COMMENT '保单数',
  `status` int(11) DEFAULT NULL COMMENT '0-待入库,1-入库中,2-成功,3-失败，4-部分失败',
  `table_header` varchar(1024) DEFAULT NULL COMMENT '表格头步信息',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='线下订单导入';

/*Table structure for table `xm_offline_mapping_relation` */

DROP TABLE IF EXISTS `xm_offline_mapping_relation`;

CREATE TABLE `xm_offline_mapping_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `class_id` int(11) DEFAULT NULL COMMENT '0-主险,1-附加险',
  `risk_code` varchar(150) DEFAULT NULL COMMENT '向日葵:险种代码',
  `insure_code` varchar(150) DEFAULT NULL COMMENT '保险公司:编码',
  `use_status` int(11) DEFAULT '1' COMMENT '1-有效，0-无效',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='线下产品-保险公司产品映射关系表';

/*Table structure for table `xm_offline_mapping_rules` */

DROP TABLE IF EXISTS `xm_offline_mapping_rules`;

CREATE TABLE `xm_offline_mapping_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_no` varchar(50) DEFAULT NULL COMMENT '公司编码',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `rules` text COMMENT '匹配规则',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `use_status` int(11) DEFAULT NULL COMMENT '1-有戏,0-无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='线下产品导入映射关系配置表';

/*Table structure for table `xm_offline_underwriting_infos` */

DROP TABLE IF EXISTS `xm_offline_underwriting_infos`;

CREATE TABLE `xm_offline_underwriting_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `offline_no` char(50) NOT NULL COMMENT '线下核保流水号',
  `order_no` char(50) DEFAULT NULL COMMENT '线上下单订单号',
  `sale_channel` char(50) NOT NULL COMMENT '渠道代码',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `buy_user_id` varchar(50) NOT NULL COMMENT '下单用户customer_id',
  `filling_info` text COMMENT '线下投保基本信息',
  `health_info` text COMMENT '线下投保健康问答信息',
  `filling_dim` text COMMENT '线下投保维度信息',
  `underwriting_code` varchar(50) DEFAULT NULL COMMENT '核保编码',
  `underwriting_msg` varchar(100) DEFAULT NULL COMMENT '线下核保返回信息',
  `underwriting_status` int(2) NOT NULL DEFAULT '0' COMMENT '线下核保状态 0：未提交核保(默认)，2：线下核保进行中，1.线下核保完成',
  `expired_time` datetime NOT NULL COMMENT '过期时间，过期后不再进行核保结果查询，默认线下核保提交后90天',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_oui_order_no` (`order_no`),
  KEY `idx_oui_channel_code` (`offline_no`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='线下核保信息表';

/*Table structure for table `xm_open_order_relation` */

DROP TABLE IF EXISTS `xm_open_order_relation`;

CREATE TABLE `xm_open_order_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_channel` varchar(50) DEFAULT NULL COMMENT '销售渠道',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `coop_order_no` varchar(50) DEFAULT NULL COMMENT '合作方订单号',
  `order_type` varchar(50) DEFAULT NULL COMMENT 'personal：个险，group_on：新单,upgrade：批改',
  `status` int(1) DEFAULT NULL COMMENT '当前订单状态，0：未核保，1：已核保成功，2：核保失败，3：出单成功，4：出单失败',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xm_open_order_relation` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='开放平台订单关联表';

/*Table structure for table `xm_operate_num` */

DROP TABLE IF EXISTS `xm_operate_num`;

CREATE TABLE `xm_operate_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '使用场景（资质认证弹窗inquiry_tag，）',
  `object_key_type` varchar(20) NOT NULL COMMENT '可选类型（ssoid，order_no，product_no等）',
  `object_key` varchar(50) NOT NULL,
  `object_value` bigint(50) NOT NULL DEFAULT '0' COMMENT '记录次数',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态（0：无效，1：有效）',
  `note` text COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `object_key` (`object_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=utf8 COMMENT='操作次数表';

/*Table structure for table `xm_operate_records` */

DROP TABLE IF EXISTS `xm_operate_records`;

CREATE TABLE `xm_operate_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_code` varchar(50) DEFAULT NULL COMMENT '项目标示, 如：xrk_mall_backend、mall-admin-api等',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `operator_type` varchar(250) DEFAULT NULL COMMENT '场景',
  `order_no` char(50) DEFAULT NULL COMMENT '订单号',
  `clue_no` char(200) DEFAULT NULL COMMENT '记录查找线索号',
  `content` text COMMENT '操作内容',
  `note` text COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `before_key` char(200) DEFAULT NULL COMMENT '变更前业务号',
  `after_key` char(200) DEFAULT NULL COMMENT '变更后业务号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10055 DEFAULT CHARSET=utf8 COMMENT='操作记录表';

/*Table structure for table `xm_opt_history` */

DROP TABLE IF EXISTS `xm_opt_history`;

CREATE TABLE `xm_opt_history` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_code` varchar(50) DEFAULT NULL COMMENT '公司代码，标示公司区别，如：XRK、ZM（中民）',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `opt_type` int(11) DEFAULT NULL COMMENT '修改类型： 1-职业，2-地区',
  `description` varchar(250) DEFAULT NULL COMMENT '说明',
  `fdfs_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `created_at` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=utf8 COMMENT='操作记录表 ';

/*Table structure for table `xm_order_attr_infos` */

DROP TABLE IF EXISTS `xm_order_attr_infos`;

CREATE TABLE `xm_order_attr_infos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_no` char(50) NOT NULL,
  `order_no` char(50) NOT NULL,
  `type_code` varchar(50) NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `pop_key_code` varchar(50) NOT NULL,
  `pop_key_desc` varchar(50) DEFAULT NULL,
  `pop_value_code` varchar(50) NOT NULL,
  `pop_value_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attinfo_order_item_no` (`order_item_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1826 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_order_contact_info` */

DROP TABLE IF EXISTS `xm_order_contact_info`;

CREATE TABLE `xm_order_contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_no` varchar(128) DEFAULT NULL COMMENT '订单明细号',
  `contact_type` varchar(32) DEFAULT NULL COMMENT '联系人类型：common=投被保人共同联系人',
  `contact_name` varchar(64) DEFAULT NULL COMMENT '联系人姓名',
  `certification_type` varchar(16) DEFAULT NULL COMMENT '证件类型',
  `certification_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `phone_no` varchar(18) DEFAULT NULL COMMENT '联系人电话号码',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '联系人地址',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_xm_order_contact_info_ordItmNo_createdAt` (`order_item_no`,`created_at`) USING BTREE,
  KEY `idx_xm_order_contact_info_customerNo` (`contact_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='订单联系人表';

/*Table structure for table `xm_order_discounts` */

DROP TABLE IF EXISTS `xm_order_discounts`;

CREATE TABLE `xm_order_discounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `pay_type` tinyint(2) DEFAULT '0' COMMENT '类型：1:卡券 2:葵币 3:推广费',
  `pay_name` varchar(250) DEFAULT NULL COMMENT '显示名称，如卡券名称',
  `pay_id` char(50) DEFAULT NULL COMMENT '卡券号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_bills` varchar(50) DEFAULT NULL COMMENT '面额',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `process_status` int(2) DEFAULT '0' COMMENT '与第三方交互状态 0:处理中 1:成功 2:失败 3:撤销',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_xod_order_no_pay_type` (`order_no`,`pay_type`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4007 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单折扣信息';

/*Table structure for table `xm_order_extend_props` */

DROP TABLE IF EXISTS `xm_order_extend_props`;

CREATE TABLE `xm_order_extend_props` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `prop_name` varchar(250) NOT NULL COMMENT '属性名',
  `prop_value` varchar(250) DEFAULT NULL COMMENT '属性值',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  KEY `order_item_no` (`order_item_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单自定义拓展属性项';

/*Table structure for table `xm_order_items` */

DROP TABLE IF EXISTS `xm_order_items`;

CREATE TABLE `xm_order_items` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `parent_order_item_no` char(50) DEFAULT NULL COMMENT '父类订单项号',
  `product_no` char(50) DEFAULT NULL COMMENT '产品ID',
  `seller_no` char(10) DEFAULT NULL COMMENT '进货商编码，如中民、或者后续民生保险等',
  `product_name` char(250) DEFAULT NULL COMMENT '产品名称',
  `product_type` int(11) DEFAULT '0' COMMENT '1非保险商品、0保险商品',
  `product_image` varchar(250) DEFAULT NULL COMMENT '商品图片， 默认只取一张图片',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售单价',
  `copies` int(11) DEFAULT NULL COMMENT '购买数量',
  `item_price` decimal(10,2) DEFAULT NULL COMMENT '订单项金额',
  `product_discount` decimal(10,2) DEFAULT NULL COMMENT '单品折扣金额，比例折扣需计算折扣金额，单位元',
  `attr_info` text COMMENT '产品扩展信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `product_image_fdfs_url` varchar(200) DEFAULT NULL,
  `commission_auth` int(11) DEFAULT NULL COMMENT '0:没有推广费可入账红包,1:有推广费;2:没有推广费和红包',
  `commission_auth_desc` varchar(50) DEFAULT NULL COMMENT '用户没有推广费的原因 , not_auth没资质认证，not_sign没有签约',
  PRIMARY KEY (`order_item_no`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单明细';

/*Table structure for table `xm_order_pay_no_relations` */

DROP TABLE IF EXISTS `xm_order_pay_no_relations`;

CREATE TABLE `xm_order_pay_no_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` char(50) NOT NULL COMMENT '商城订单号',
  `code` char(50) NOT NULL COMMENT '业务场景',
  `no` char(50) DEFAULT NULL COMMENT '编号',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态：0失效，1正常，2出单',
  `note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `extra` varchar(250) DEFAULT NULL COMMENT '第三方自定义参数',
  PRIMARY KEY (`id`),
  KEY `idx_order_no_code_no_status` (`order_no`,`code`,`no`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4088 DEFAULT CHARSET=utf8 COMMENT='订单和支付号关系表';

/*Table structure for table `xm_order_payment` */

DROP TABLE IF EXISTS `xm_order_payment`;

CREATE TABLE `xm_order_payment` (
  `order_no` char(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_type` char(100) DEFAULT NULL COMMENT '支付方式(渠道):alipay,weixin',
  `pay_id` char(50) DEFAULT NULL COMMENT '付款单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_account_id` char(100) DEFAULT NULL COMMENT '付款账户',
  `pay_account_name` char(50) DEFAULT NULL COMMENT '账户名称',
  `pay_account_code` char(20) DEFAULT NULL COMMENT '账号编码',
  `pay_account_type` tinyint(2) DEFAULT NULL COMMENT '账户类型 0:借记卡/1:存折/2:信用卡',
  `usage_type` tinyint(2) DEFAULT NULL COMMENT '0:首期  1:续期',
  `hold_name` char(50) DEFAULT NULL COMMENT '账户持有人',
  `province` char(20) DEFAULT NULL COMMENT '账户所在省',
  `city` char(20) DEFAULT NULL COMMENT '账户所在市',
  `pay_note` char(250) DEFAULT NULL COMMENT '备注',
  `pay_channel_no` varchar(50) DEFAULT NULL COMMENT '收款账号渠道编码',
  `pay_seller_no` varchar(50) DEFAULT NULL COMMENT '收款账号编码',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_pay_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '批量合并支付标志:0-单笔支付，1-合并支付',
  `help_pay_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否代付标志:0-自主支付，1-找人代付',
  PRIMARY KEY (`order_no`),
  KEY `xop_pay_id` (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='账单数据模型';

/*Table structure for table `xm_order_payment_items` */

DROP TABLE IF EXISTS `xm_order_payment_items`;

CREATE TABLE `xm_order_payment_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `pay_type` char(100) DEFAULT NULL COMMENT '支付方式(渠道):alipay,weixin',
  `pay_id` char(50) DEFAULT NULL COMMENT '付款单号',
  `pay_name` varchar(250) DEFAULT NULL COMMENT '显示名称',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额，单位元',
  `pay_bills` varchar(50) DEFAULT NULL COMMENT '面额',
  `pay_account_id` char(100) DEFAULT NULL COMMENT '付款账户',
  `pay_account_name` char(50) DEFAULT NULL COMMENT '账户名称',
  `pay_account_type` tinyint(2) DEFAULT NULL COMMENT '账户类型 0:借记卡/1:存折/2:信用卡',
  `usage_type` tinyint(2) DEFAULT NULL COMMENT '0:首期  1:续期',
  `hold_name` char(50) DEFAULT NULL COMMENT '账户持有人',
  `province` char(20) DEFAULT NULL COMMENT '账户所在省',
  `city` char(20) DEFAULT NULL COMMENT '账户所在市',
  `pay_note` varchar(250) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3196 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='账单明细';

/*Table structure for table `xm_order_props` */

DROP TABLE IF EXISTS `xm_order_props`;

CREATE TABLE `xm_order_props` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `prop_name` char(250) NOT NULL COMMENT '属性名',
  `prop_value` char(250) DEFAULT NULL COMMENT '属性值',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `object_type` varchar(50) DEFAULT NULL COMMENT 'object_no的对应属性类型，默认object_no对应为insured_no',
  `object_no` varchar(50) DEFAULT NULL COMMENT '关联对象编号',
  KEY `order_item_no` (`order_item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单属性项';

/*Table structure for table `xm_order_renewal_accounts` */

DROP TABLE IF EXISTS `xm_order_renewal_accounts`;

CREATE TABLE `xm_order_renewal_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `renewal_type` varchar(20) DEFAULT NULL COMMENT '续期方式:alipay-支付宝,weixin-微信,yinlian-银联,yhdk-银行代扣',
  `renewal_bank` varchar(50) DEFAULT NULL COMMENT '续期银行',
  `renewal_account_id` varchar(100) DEFAULT NULL COMMENT '续期账号:可以是卡号、支付宝号等各类付款账号',
  `renewal_account_name` char(50) DEFAULT NULL COMMENT '续期帐户所有人',
  `renewal_account_type` smallint(6) DEFAULT NULL COMMENT '续期账户类型 0:借记卡/1:存折/2:信用卡（针对银行卡类型）',
  `renewal_mobile_no` char(20) DEFAULT NULL COMMENT '续保手机号',
  `renewal_amount` decimal(10,2) DEFAULT NULL COMMENT '续费金额',
  `renewal_date` datetime DEFAULT NULL COMMENT '续费时间',
  `renewal_status` smallint(6) DEFAULT NULL COMMENT '续费状态：0未续期，1已续期',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_province` varchar(20) DEFAULT NULL COMMENT '省',
  `bank_city` varchar(30) DEFAULT NULL COMMENT '市',
  `bank_area` varchar(50) DEFAULT NULL COMMENT '区',
  `bank_province_code` varchar(50) DEFAULT NULL COMMENT '省代码',
  `bank_city_code` varchar(50) DEFAULT NULL COMMENT '市代码',
  `bank_area_code` varchar(50) DEFAULT NULL COMMENT '区代码',
  `renewal_bank_code` varchar(50) DEFAULT NULL COMMENT '银行代码',
  `auto_payment` varchar(50) DEFAULT NULL COMMENT '保费自动划扣',
  PRIMARY KEY (`id`),
  KEY `idx_ora_order_item_no` (`order_item_no`),
  KEY `idx_ora_order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18490 DEFAULT CHARSET=utf8 COMMENT='订单续期帐户表';

/*Table structure for table `xm_order_renewal_export_record` */

DROP TABLE IF EXISTS `xm_order_renewal_export_record`;

CREATE TABLE `xm_order_renewal_export_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `export_at` datetime NOT NULL COMMENT '导出时间',
  `url` text COMMENT '导出url',
  `renewal_extent` varchar(50) NOT NULL COMMENT '续保缴费时间区间',
  `use_status` int(2) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `seller_no` varchar(50) NOT NULL COMMENT '渠道编号',
  `operator_id` char(30) NOT NULL COMMENT '操作者ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='续保订单导出记录表';

/*Table structure for table `xm_order_renewal_time_record` */

DROP TABLE IF EXISTS `xm_order_renewal_time_record`;

CREATE TABLE `xm_order_renewal_time_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `renewal_time` datetime NOT NULL COMMENT '续期提醒时间点',
  `renewal_year` int(11) NOT NULL COMMENT '续保年度',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '续保状态:0-未续保,1-已续保,3-续保失败(该字段仅作为查询,真正是否续保参考表xm_policy_renewals_records)',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12339826 DEFAULT CHARSET=utf8 COMMENT='订单续期提醒记录表';

/*Table structure for table `xm_order_renewal_time_record_20210114` */

DROP TABLE IF EXISTS `xm_order_renewal_time_record_20210114`;

CREATE TABLE `xm_order_renewal_time_record_20210114` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `renewal_time` datetime NOT NULL COMMENT '续期提醒时间点',
  `renewal_year` int(11) NOT NULL COMMENT '续保年度',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5809803 DEFAULT CHARSET=utf8 COMMENT='订单续期提醒记录表';

/*Table structure for table `xm_order_risk_track` */

DROP TABLE IF EXISTS `xm_order_risk_track`;

CREATE TABLE `xm_order_risk_track` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `trans_no` char(50) NOT NULL COMMENT '业务流水号',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `track_json` varchar(2000) DEFAULT NULL COMMENT '风控轨迹json，如[{''code'':1,''date'':''2020-04-13 00:00:00'',''IsImportantStatement'':''Y''},{''code'':2,''date'':''2020-04-13 00:00:00'',''IsImportantStatement'':''Y''}]',
  `upload_status` int(1) NOT NULL COMMENT '上传状态：0未上传，1已完成，2上传失败',
  `need_risk` int(1) DEFAULT '0' COMMENT '是否需要风控校验，0不需要，1需要',
  `upload_msg` varchar(500) DEFAULT NULL COMMENT '上传信息，如失败原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='订单风控轨迹记录';

/*Table structure for table `xm_order_sale_info` */

DROP TABLE IF EXISTS `xm_order_sale_info`;

CREATE TABLE `xm_order_sale_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `sale_channel_code` varchar(50) DEFAULT NULL COMMENT '销售渠道代号',
  `sale_channel_name` varchar(50) DEFAULT NULL,
  `order_create_env` varchar(50) DEFAULT NULL COMMENT '订单创建环境，如app，h5',
  `order_promotion_media` varchar(50) DEFAULT NULL COMMENT '订单推广媒体',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`),
  KEY `sale_channel_code` (`sale_channel_code`,`order_promotion_media`)
) ENGINE=InnoDB AUTO_INCREMENT=14491 DEFAULT CHARSET=utf8 COMMENT='订单销售信息';

/*Table structure for table `xm_order_sync_records` */

DROP TABLE IF EXISTS `xm_order_sync_records`;

CREATE TABLE `xm_order_sync_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `type` int(11) NOT NULL COMMENT '同步类型：1批量同步，2订单消息订阅，3后台修改',
  `status` int(11) NOT NULL COMMENT '状态：0同步失败，1同步完成',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72573 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_order_upload_record` */

DROP TABLE IF EXISTS `xm_order_upload_record`;

CREATE TABLE `xm_order_upload_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `policy_no` char(200) NOT NULL COMMENT '保单号',
  `data_type` varchar(50) DEFAULT NULL COMMENT '数据类型，如：recall，可回溯',
  `upload_status` int(1) NOT NULL COMMENT '上传状态：0未上传，1已完成，2上传失败',
  `upload_msg` varchar(200) DEFAULT NULL COMMENT '上传信息，如失败原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='订单通用上传记录';

/*Table structure for table `xm_orders` */

DROP TABLE IF EXISTS `xm_orders`;

CREATE TABLE `xm_orders` (
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `buy_user_no` char(50) DEFAULT NULL COMMENT '下单用户ID',
  `agent_user_no` char(50) DEFAULT NULL COMMENT '代理人用户ID',
  `total_price` decimal(10,2) NOT NULL COMMENT '总费用',
  `total_discount` decimal(10,2) DEFAULT NULL COMMENT '总折扣',
  `order_expired_date` datetime DEFAULT NULL COMMENT '订单失效日期，订单未支付才启用',
  `post_fee` decimal(10,2) DEFAULT NULL COMMENT '邮费',
  `post_address` varchar(250) DEFAULT NULL COMMENT '邮寄地址',
  `zip_code` char(10) DEFAULT NULL COMMENT '邮政编码',
  `sale_order_no` char(50) DEFAULT NULL COMMENT '销售业务订单号，如：分销平台订单号',
  `coop_order_no` char(50) DEFAULT NULL COMMENT '合作方的订单号，如中民proposal_no',
  `sale_channel` char(50) DEFAULT '',
  `sale_type` char(20) DEFAULT NULL COMMENT '销售/功能类型',
  `order_type` int(2) DEFAULT '2' COMMENT '0-虚拟，1-实体，2-保险，3-批改支付单',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态，0未支付，1支付成功，2支付失败, 3状态待确认 4已退款',
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态：0关闭，1正常，2取消，-1核保中，-2核保失败',
  `delivery_status` int(11) NOT NULL DEFAULT '0' COMMENT '发货状态,0未发货，1已发货',
  `policy_status` int(11) DEFAULT '0' COMMENT '出单状态,0未出单，1已出单，2出单失败，3已退保',
  `unique_hash` char(50) NOT NULL COMMENT '唯一hash字段',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `policy_issuing_status` int(11) DEFAULT '0',
  `policy_issuing_count` int(8) DEFAULT '-1',
  `lock_time` datetime DEFAULT NULL COMMENT '订单出单上锁时间',
  `unlock_time` datetime DEFAULT NULL COMMENT '释放锁时间',
  `insure_recall_url` varchar(1024) DEFAULT NULL COMMENT '投保回溯文件url',
  PRIMARY KEY (`order_no`),
  UNIQUE KEY `uq_o_unique_hash` (`unique_hash`),
  KEY `id_orders_coop_order_no` (`coop_order_no`,`created_at`),
  KEY `id_orders_unique_hash` (`unique_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单（不单单是保险订单）';

/*Table structure for table `xm_orders_20210114` */

DROP TABLE IF EXISTS `xm_orders_20210114`;

CREATE TABLE `xm_orders_20210114` (
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `buy_user_no` char(50) DEFAULT NULL COMMENT '下单用户ID',
  `agent_user_no` char(50) DEFAULT NULL COMMENT '代理人用户ID',
  `total_price` decimal(10,2) NOT NULL COMMENT '总费用',
  `total_discount` decimal(10,2) DEFAULT NULL COMMENT '总折扣',
  `order_expired_date` datetime DEFAULT NULL COMMENT '订单失效日期，订单未支付才启用',
  `post_fee` decimal(10,2) DEFAULT NULL COMMENT '邮费',
  `post_address` varchar(250) DEFAULT NULL COMMENT '邮寄地址',
  `zip_code` char(10) DEFAULT NULL COMMENT '邮政编码',
  `sale_order_no` char(50) DEFAULT NULL COMMENT '销售业务订单号，如：分销平台订单号',
  `coop_order_no` char(50) DEFAULT NULL COMMENT '合作方的订单号，如中民proposal_no',
  `sale_channel` char(50) DEFAULT '',
  `sale_type` char(20) DEFAULT NULL COMMENT '销售/功能类型',
  `order_type` int(2) DEFAULT '2' COMMENT '0-虚拟，1-实体，2-保险，3-批改支付单',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态，0未支付，1支付成功，2支付失败, 3状态待确认 4已退款',
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态：0取消，1正常',
  `delivery_status` int(11) NOT NULL DEFAULT '0' COMMENT '发货状态,0未发货，1已发货',
  `policy_status` int(11) DEFAULT '0' COMMENT '出单状态,0未出单，1已出单，2出单失败，3已退保',
  `unique_hash` char(50) NOT NULL COMMENT '唯一hash字段',
  `note` varchar(250) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `policy_issuing_status` int(11) DEFAULT '0',
  `policy_issuing_count` int(8) DEFAULT '-1',
  `lock_time` datetime DEFAULT NULL COMMENT '订单出单上锁时间',
  `unlock_time` datetime DEFAULT NULL COMMENT '释放锁时间',
  `insure_recall_url` varchar(1024) DEFAULT NULL COMMENT '投保回溯文件url',
  PRIMARY KEY (`order_no`),
  UNIQUE KEY `uq_o_unique_hash` (`unique_hash`),
  KEY `id_orders_coop_order_no` (`coop_order_no`,`created_at`),
  KEY `id_orders_unique_hash` (`unique_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单（不单单是保险订单）';

/*Table structure for table `xm_orders_subjoin` */

DROP TABLE IF EXISTS `xm_orders_subjoin`;

CREATE TABLE `xm_orders_subjoin` (
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `forbid_batch` smallint(6) NOT NULL DEFAULT '0' COMMENT '禁止线上批改:1-禁止，0-非禁止',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单扩展表';

/*Table structure for table `xm_pay_trade_notify_records` */

DROP TABLE IF EXISTS `xm_pay_trade_notify_records`;

CREATE TABLE `xm_pay_trade_notify_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(64) DEFAULT NULL COMMENT '向日葵交易流水号',
  `merchant_notify_url` varchar(255) DEFAULT NULL COMMENT '通知地址',
  `notify_time` datetime DEFAULT NULL COMMENT '通知时间',
  `notify_type` int(11) DEFAULT NULL COMMENT '通知类型，1=成功通知，2=失败通知',
  `notify_data` text COMMENT '通知内容',
  `notify_result` int(11) DEFAULT NULL COMMENT '通知结果，0=通知失败，1=通知成功',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tradeId` (`trade_id`),
  KEY `idx_notifyTime` (`notify_time`)
) ENGINE=InnoDB AUTO_INCREMENT=555 DEFAULT CHARSET=utf8 COMMENT='支付交易通知记录表';

/*Table structure for table `xm_pay_trade_props` */

DROP TABLE IF EXISTS `xm_pay_trade_props`;

CREATE TABLE `xm_pay_trade_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(64) DEFAULT NULL COMMENT '交易流水号',
  `prop_name` varchar(50) DEFAULT NULL COMMENT '数据名称',
  `prop_val` text COMMENT '数据值',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tradeId` (`trade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8 COMMENT='支付交易额外信息表';

/*Table structure for table `xm_pay_trades` */

DROP TABLE IF EXISTS `xm_pay_trades`;

CREATE TABLE `xm_pay_trades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(64) DEFAULT NULL COMMENT '向日葵平台唯一交易号',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '向日葵商户ID',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '向日葵商户的订单号',
  `xrk_pay_channel` varchar(20) DEFAULT NULL COMMENT '向日葵收款渠道，对应xm_seller_payee_channels.payee_channel_no',
  `pay_platform` varchar(50) DEFAULT NULL COMMENT '实际支付平台：weixin=微信支付，alipay=支付宝，union=银联支付',
  `transaction_id` varchar(32) DEFAULT NULL COMMENT '支付成功的交易流水号',
  `result_url` varchar(256) DEFAULT NULL COMMENT '结果页地址',
  `notify_url` varchar(256) DEFAULT NULL COMMENT '商户通知地址',
  `time_expire` datetime DEFAULT NULL COMMENT '订单支付过期时间',
  `trade_description` varchar(100) DEFAULT NULL COMMENT '订单描述',
  `total_fee` int(11) DEFAULT NULL COMMENT '订单总金额，单位：分',
  `refund_fee` int(11) DEFAULT '0' COMMENT '退款总金额，单位：分',
  `currency` varchar(20) DEFAULT NULL COMMENT '货币类型',
  `payer` varchar(32) DEFAULT NULL COMMENT '支付人标识',
  `bank_type` varchar(32) DEFAULT NULL COMMENT '银行类型',
  `status` int(11) DEFAULT '0' COMMENT '支付订单状态，0=待支付，1=支付成功，2=关闭，3=退款',
  `pay_time` datetime DEFAULT NULL COMMENT '支付成功时间',
  `close_time` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tradeId` (`trade_id`) USING BTREE,
  KEY `idx_tradeNo` (`out_trade_no`),
  KEY `idx_transactionId` (`transaction_id`),
  KEY `idx_createdAt_payer` (`created_at`,`payer`),
  KEY `idx_payTime_payer` (`pay_time`,`payer`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 COMMENT='支付交易信息表';

/*Table structure for table `xm_payee_channel` */

DROP TABLE IF EXISTS `xm_payee_channel`;

CREATE TABLE `xm_payee_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_channel_no` varchar(50) DEFAULT NULL COMMENT '父级渠道编码',
  `payee_channel_no` varchar(50) DEFAULT NULL COMMENT '支付通道/渠道编码，支付通道 （pufa-浦发，jianhang-建行，weixin-微信官方，alipay-支付宝官方，union-银联支付）；支付渠道：（xm_seller_payee_channels.payee_channel_no）',
  `payee_channel_name` varchar(100) DEFAULT NULL COMMENT '支付渠道名称',
  `pay_switch` int(1) DEFAULT '0' COMMENT '支付开关（0-关，1-开）',
  `can_real_name_auth` int(2) DEFAULT '0' COMMENT '是否支持实名校验（0-不支持，1-支持）',
  `pay_type` int(2) DEFAULT '1' COMMENT '1-支付宝，2-微信，3-银联',
  `pay_client_type` varchar(50) DEFAULT NULL COMMENT '终端支付类型（APP，H5）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `p_payee_channel_no_pay_type` (`payee_channel_no`,`p_channel_no`,`pay_type`,`pay_client_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='支付通道表';

/*Table structure for table `xm_payee_channel_config` */

DROP TABLE IF EXISTS `xm_payee_channel_config`;

CREATE TABLE `xm_payee_channel_config` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `sale_channel` char(50) NOT NULL COMMENT '渠道',
  `seller_no` varchar(50) NOT NULL COMMENT '收款人编码',
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `order_no` int(3) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(2) DEFAULT '1' COMMENT '使用状态：0停用, 1启用',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pcg_salechannel_sellerno_payeechannelno` (`sale_channel`,`seller_no`,`payee_channel_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='渠道可用支付配置表';

/*Table structure for table `xm_payee_choose_config` */

DROP TABLE IF EXISTS `xm_payee_choose_config`;

CREATE TABLE `xm_payee_choose_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_white_list` varchar(256) DEFAULT NULL COMMENT '支付白名单',
  `pay_will_off_time` datetime DEFAULT NULL COMMENT '预挂起时间',
  `pay_support_products` varchar(1024) DEFAULT NULL COMMENT 'all不限制；不为all，只支持配置的产品可以使用浦发微信支付',
  `pay_type` int(2) DEFAULT '1' COMMENT '1-支付宝，2-微信',
  `pay_choose_channel` varchar(256) DEFAULT NULL COMMENT 'pufa-浦发，pinan-平安,xrk-走自己的官方渠道',
  `an_version` varchar(256) DEFAULT NULL COMMENT '安卓版本号',
  `ios_version` varchar(256) DEFAULT NULL COMMENT 'ios版本号',
  `version_switch` int(2) DEFAULT '1' COMMENT '是否需要判断版本号：0-不需要，1-需要，只针对App调用的支付',
  `payee_channel_no` varchar(50) DEFAULT NULL COMMENT '要替换的渠道(支付宝，微信公众号)',
  `payee_channel_noApp` varchar(50) DEFAULT NULL COMMENT '要替换微信App的渠道',
  `pay_client_type` varchar(50) DEFAULT NULL COMMENT '终端支付类型（APP，H5）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_pingan_bills` */

DROP TABLE IF EXISTS `xm_pingan_bills`;

CREATE TABLE `xm_pingan_bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `pay_id` char(30) NOT NULL COMMENT '交易编号',
  `pay_date` datetime DEFAULT NULL COMMENT '交易日期',
  `bankrupt_date` datetime DEFAULT NULL COMMENT '清算日期',
  `batch_no` varchar(20) DEFAULT NULL COMMENT '批次号',
  `withdraw_account` varchar(50) DEFAULT NULL COMMENT '收款借记卡/账号',
  `withdraw_com` bigint(20) DEFAULT NULL COMMENT '金额',
  `service_fee` bigint(20) DEFAULT NULL COMMENT '手续费',
  `tally_date` datetime DEFAULT NULL COMMENT '记账日期',
  `tally_ledger` varchar(50) DEFAULT NULL COMMENT '记账流水帐',
  `trans_code` char(20) DEFAULT NULL COMMENT '交易编码　0000：成功，其余为失败',
  `trans_msg` varchar(64) DEFAULT NULL COMMENT '交易消息',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `use_status` int(11) DEFAULT NULL COMMENT '状态:-1：删除1：可用',
  PRIMARY KEY (`id`),
  KEY `ix_pingan_time` (`pay_date`),
  KEY `ix_pingan_payid` (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='平安银行提现对账明细';

/*Table structure for table `xm_pingan_pay_bills` */

DROP TABLE IF EXISTS `xm_pingan_pay_bills`;

CREATE TABLE `xm_pingan_pay_bills` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '自动递增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `bill_time` datetime(6) DEFAULT NULL COMMENT '交易时间',
  `open_id` varchar(128) DEFAULT NULL COMMENT '商户门店open_id',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户编号',
  `shop_id` varchar(50) DEFAULT NULL COMMENT '门店编号',
  `trade_no` varchar(100) DEFAULT NULL COMMENT '交易流水号',
  `out_order_no` varchar(100) DEFAULT NULL COMMENT '外部订单号',
  `base_order_no` varchar(100) DEFAULT NULL COMMENT '原始订单号',
  `mall_order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '交易类型 1、3交易，2退款',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `pay_tag` varchar(20) DEFAULT NULL COMMENT '支付标签',
  `total_money` decimal(12,2) DEFAULT NULL COMMENT '总金额',
  `discount_money` decimal(12,2) DEFAULT NULL COMMENT '折扣金额',
  `pay_money` decimal(12,2) DEFAULT NULL COMMENT '交易金额',
  `seller_discount_money` decimal(12,2) DEFAULT NULL COMMENT '微信、支付宝渠道优惠金额',
  `currency` varchar(20) DEFAULT NULL COMMENT '币种',
  `poundage` decimal(12,5) DEFAULT NULL COMMENT '商户手续费',
  `rate` decimal(6,4) DEFAULT NULL COMMENT '商户扣率',
  `is_credit` int(1) DEFAULT NULL COMMENT '是否信用卡交易',
  PRIMARY KEY (`id`),
  KEY `idx_papb_mallorderno` (`mall_order_no`) USING BTREE,
  KEY `idx_papb_billtime_paytag` (`bill_time`,`pay_tag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_policy_clauses` */

DROP TABLE IF EXISTS `xm_policy_clauses`;

CREATE TABLE `xm_policy_clauses` (
  `clause_no` char(50) NOT NULL COMMENT '责任号',
  `order_item_no` char(50) DEFAULT NULL COMMENT '订单项号',
  `policy_coverage_no` char(50) DEFAULT NULL COMMENT '保单险种ID',
  `sub_policy_no` char(50) DEFAULT NULL COMMENT '子险号',
  `clause` char(50) DEFAULT NULL COMMENT '责任险种代码',
  `clause_name` char(250) DEFAULT NULL COMMENT '责任险种名称',
  `clause_desc` text COMMENT '条款描述',
  `clause_prem` varchar(20) DEFAULT NULL COMMENT '保费',
  `clause_sum_insured` varchar(20) DEFAULT NULL COMMENT '保额',
  `business_type` char(10) DEFAULT NULL COMMENT '业务类型（赠险、非赠险）',
  `copies` int(11) NOT NULL DEFAULT '1' COMMENT '份数',
  `order_no` int(11) DEFAULT '0' COMMENT '排序号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`clause_no`),
  KEY `order_item_no` (`order_item_no`),
  KEY `policy_clause_id` (`policy_coverage_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='责任条款';

/*Table structure for table `xm_policy_feedback` */

DROP TABLE IF EXISTS `xm_policy_feedback`;

CREATE TABLE `xm_policy_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `policy_no` char(200) NOT NULL COMMENT '保单号',
  `seller_no` varchar(50) NOT NULL COMMENT '渠道',
  `product_no` char(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `applicant_name` char(50) DEFAULT NULL COMMENT '投保人姓名',
  `applicant_phone` char(20) DEFAULT NULL COMMENT '投保人电话',
  `insured_name` char(50) DEFAULT NULL COMMENT '被保人名字',
  `agent_name` varchar(50) DEFAULT NULL COMMENT '代理人名字',
  `agent_phone` char(20) DEFAULT NULL COMMENT '代理人手机号码',
  `policy_created_at` datetime DEFAULT NULL COMMENT '承保时间',
  `feedback_type` varchar(50) DEFAULT NULL COMMENT '回访方式',
  `last_called_at` datetime DEFAULT NULL COMMENT '最后呼出时间',
  `feedback_status` varchar(50) DEFAULT NULL COMMENT '回访状态',
  `feedback_validity` varchar(50) DEFAULT NULL COMMENT '是否为问题件',
  `sort` varchar(50) DEFAULT NULL COMMENT '问题件分类',
  `reason` varchar(2000) DEFAULT NULL COMMENT '问题件原因',
  `last_process_at` datetime DEFAULT NULL COMMENT '最后处理时间',
  `process_count` int(11) DEFAULT '0' COMMENT '处理次数',
  `status` int(11) DEFAULT '1' COMMENT '1:回访未成功 0:回访成功 2 已退保',
  `last_push_at` datetime DEFAULT NULL COMMENT '最后推送时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型(0-接口导入，1-人工导入)',
  `sso_id` varchar(15) DEFAULT NULL COMMENT '代理人id',
  `cooling_off_end_date` datetime DEFAULT NULL COMMENT '犹豫期',
  PRIMARY KEY (`id`),
  KEY `xm_policy_feedback_policy_no` (`policy_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2474 DEFAULT CHARSET=utf8 COMMENT='保险公司回访问题件表';

/*Table structure for table `xm_policy_feedback_history` */

DROP TABLE IF EXISTS `xm_policy_feedback_history`;

CREATE TABLE `xm_policy_feedback_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `policy_feedback_id` int(10) DEFAULT NULL,
  `policy_no` varchar(200) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1-人工后台操作',
  `status` int(11) DEFAULT NULL COMMENT '1:回访未成功 0:回访成功 2 已退保',
  `opt_type` int(11) DEFAULT NULL COMMENT '0-导入,1-导入更新，2-更新',
  `reason` varchar(2000) DEFAULT NULL COMMENT '原因',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_policy_infos` */

DROP TABLE IF EXISTS `xm_policy_infos`;

CREATE TABLE `xm_policy_infos` (
  `order_item_no` char(50) NOT NULL DEFAULT '' COMMENT '订单项号',
  `proposal_no` char(50) DEFAULT NULL COMMENT '投保单号',
  `policy_no` char(200) DEFAULT NULL COMMENT '保单号',
  `client_no` char(50) DEFAULT NULL COMMENT '客户号',
  `extra_data` text,
  `policy_prem` decimal(10,2) DEFAULT NULL COMMENT '保单保费',
  `policy_effective_flag` tinyint(2) DEFAULT NULL COMMENT '出单是否成功，-1出单异常（团单：查到出单失败，待人工处理），0出单中(出单失败)，1出单成功',
  `is_auto_continue` tinyint(2) DEFAULT NULL COMMENT '是否自动续费 0:否 1:是',
  `policy_url` varchar(2000) DEFAULT NULL COMMENT '电子保单url',
  `account_date` char(10) DEFAULT NULL COMMENT '账务日期',
  `uw_date` char(20) DEFAULT NULL COMMENT '核保日期',
  `policy_date` char(20) DEFAULT NULL COMMENT '出单时间',
  `failed_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '出单失败时间',
  `note` text COMMENT '备注，主要记录出单失败结果',
  `comment` text COMMENT '备注，主要记录后台系统客服输入信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `policy_fdfs_url` varchar(200) DEFAULT NULL,
  `init_policy_no` varchar(200) DEFAULT NULL COMMENT '保险公司返回带有中文的保单号',
  PRIMARY KEY (`order_item_no`),
  KEY `id_pi_policy_no` (`policy_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保单信息： 支付后保存保单号，电子保单等信息';

/*Table structure for table `xm_policy_order_details` */

DROP TABLE IF EXISTS `xm_policy_order_details`;

CREATE TABLE `xm_policy_order_details` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `product_no` char(50) NOT NULL COMMENT '产品编号（冗余）',
  `order_no` char(50) NOT NULL COMMENT '订单号（冗余）',
  `insured_name` varchar(200) DEFAULT NULL COMMENT '被保人姓名，多个用户用英文,号分隔，如：张三,李四',
  `total_prem` decimal(10,2) DEFAULT NULL COMMENT '总保费',
  `base_prem` decimal(10,2) DEFAULT NULL COMMENT '基础保费',
  `additional_prem` decimal(10,2) DEFAULT NULL COMMENT '追加保费',
  `total_discount` decimal(10,2) DEFAULT NULL COMMENT '总折扣，比例折扣需要计算出折扣金额，单位元',
  `copies` int(11) DEFAULT NULL COMMENT '保险份数，与订单明细中的购买数量一致',
  `policy_effective_date` datetime DEFAULT NULL COMMENT '保险起始日期',
  `policy_end_date` datetime DEFAULT NULL COMMENT '保险结束日期',
  `pay_to_date` datetime DEFAULT NULL COMMENT '缴至时间',
  `policy_period` char(10) DEFAULT NULL,
  `cooling_off_end_date` datetime DEFAULT NULL COMMENT '冷静期截至时间=保单生效时间+冷静期天数',
  `num_of_insured` int(11) DEFAULT NULL COMMENT '被保总人数',
  `action_type` char(250) NOT NULL COMMENT '操作类型 新建(new)/续保(renew)',
  `group_type` char(10) NOT NULL COMMENT '保单类型:家庭(family)/团购(groupon)/个人(personal)',
  `applier_no` char(50) NOT NULL DEFAULT '' COMMENT '投保人编号',
  `basic_coverage` char(250) DEFAULT '' COMMENT '主险代号',
  `basic_coverage_name` char(250) DEFAULT NULL COMMENT '主险名称',
  `basic_coverage_sum_insured` decimal(10,2) DEFAULT NULL COMMENT '主险保额',
  `basic_coverage_prem` decimal(10,2) DEFAULT NULL COMMENT '主险保费',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '出单状态 0未出单，1已出单，2出单失败，3已退保',
  `pay_mode` char(50) DEFAULT NULL COMMENT '缴费方式:趸交、年缴、10年缴、其它，保存文字',
  `surrender_channel` varchar(50) DEFAULT NULL COMMENT '退保操作渠道，system-系统接口操作，mannual-人工',
  `surrender_time` datetime DEFAULT NULL COMMENT '退保时间',
  `prem_remark` varchar(128) DEFAULT NULL COMMENT '保费说明',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_item_no`),
  KEY `applier_no` (`applier_no`),
  KEY `idx_pod_orderno` (`order_no`),
  KEY `idx_xm_policy_order_details_cooling_off_end_date` (`cooling_off_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险订单明细';

/*Table structure for table `xm_policy_order_details_20210114` */

DROP TABLE IF EXISTS `xm_policy_order_details_20210114`;

CREATE TABLE `xm_policy_order_details_20210114` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `product_no` char(50) NOT NULL COMMENT '产品编号（冗余）',
  `order_no` char(50) NOT NULL COMMENT '订单号（冗余）',
  `insured_name` varchar(200) DEFAULT NULL COMMENT '被保人姓名，多个用户用英文,号分隔，如：张三,李四',
  `total_prem` decimal(10,2) DEFAULT NULL COMMENT '总保费',
  `base_prem` decimal(10,2) DEFAULT NULL COMMENT '基础保费',
  `additional_prem` decimal(10,2) DEFAULT NULL COMMENT '追加保费',
  `total_discount` decimal(10,2) DEFAULT NULL COMMENT '总折扣，比例折扣需要计算出折扣金额，单位元',
  `copies` int(11) DEFAULT NULL COMMENT '保险份数，与订单明细中的购买数量一致',
  `policy_effective_date` datetime DEFAULT NULL COMMENT '保险起始日期',
  `policy_end_date` datetime DEFAULT NULL COMMENT '保险结束日期',
  `pay_to_date` datetime DEFAULT NULL COMMENT '缴至时间',
  `policy_period` char(10) DEFAULT NULL,
  `cooling_off_end_date` datetime DEFAULT NULL COMMENT '冷静期截至时间=保单生效时间+冷静期天数',
  `num_of_insured` int(11) DEFAULT NULL COMMENT '被保总人数',
  `action_type` char(250) NOT NULL COMMENT '操作类型 新建(new)/续保(renew)',
  `group_type` char(10) NOT NULL COMMENT '保单类型:家庭(family)/团购(groupon)/个人(personal)',
  `applier_no` char(50) NOT NULL DEFAULT '' COMMENT '投保人编号',
  `basic_coverage` char(250) DEFAULT '' COMMENT '主险代号',
  `basic_coverage_name` char(250) DEFAULT NULL COMMENT '主险名称',
  `basic_coverage_sum_insured` decimal(10,2) DEFAULT NULL COMMENT '主险保额',
  `basic_coverage_prem` decimal(10,2) DEFAULT NULL COMMENT '主险保费',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '出单状态 0未出单，1已出单，2出单失败，3已退保',
  `pay_mode` char(50) DEFAULT NULL COMMENT '缴费方式:趸交、年缴、10年缴、其它，保存文字',
  `surrender_channel` varchar(50) DEFAULT NULL COMMENT '退保操作渠道，system-系统接口操作，mannual-人工',
  `surrender_time` datetime DEFAULT NULL COMMENT '退保时间',
  `prem_remark` varchar(128) DEFAULT NULL COMMENT '保费说明',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_item_no`),
  KEY `applier_no` (`applier_no`),
  KEY `idx_pod_orderno` (`order_no`),
  KEY `idx_xm_policy_order_details_cooling_off_end_date` (`cooling_off_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险订单明细';

/*Table structure for table `xm_policy_renewals_detail` */

DROP TABLE IF EXISTS `xm_policy_renewals_detail`;

CREATE TABLE `xm_policy_renewals_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `renew_id` char(50) NOT NULL COMMENT 'xm_policy_renewals_records对应id',
  `pay_date` datetime DEFAULT NULL COMMENT '实际缴费日期',
  `pay_money` decimal(10,2) DEFAULT NULL COMMENT '实缴金额',
  `fail_reason` text COMMENT '缴费失败原因',
  `status` int(11) DEFAULT '1' COMMENT '可用状态：1 成功缴费 ,2缴费失败 ',
  `main_price` decimal(10,2) DEFAULT NULL COMMENT '主险金额',
  `sub_price` decimal(10,2) DEFAULT NULL COMMENT '附加险金额',
  `sub_price_detail` varchar(128) DEFAULT NULL COMMENT '附加险具体项',
  `pay_term` char(10) DEFAULT NULL COMMENT '缴费期限',
  `policy_period` char(10) DEFAULT NULL COMMENT '保障期限',
  `pay_way` char(10) DEFAULT 'Y' COMMENT '缴费方式 按年缴Y，按月缴M',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_prd_renewid_status` (`renew_id`,`status`),
  KEY `IDX_ORDER_NO` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1212242 DEFAULT CHARSET=utf8 COMMENT='续期缴费数据相关信息';

/*Table structure for table `xm_policy_renewals_records` */

DROP TABLE IF EXISTS `xm_policy_renewals_records`;

CREATE TABLE `xm_policy_renewals_records` (
  `renew_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` varchar(50) NOT NULL COMMENT '商城订单号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态：0续保下单，1续保出单，2不再续保，3出单失败，4支付中',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `renewal_order_no` char(50) DEFAULT NULL COMMENT '新续保订单号',
  `renew_year` smallint(6) DEFAULT NULL COMMENT '续保年度(第一次续保属于第2年度)',
  `renew_num` smallint(6) DEFAULT NULL COMMENT '续保次数',
  `record_type` varchar(16) DEFAULT 'renewal' COMMENT 'renewal=真正续保，reference=仅关联关系',
  PRIMARY KEY (`renew_id`),
  KEY `IDX_RENEWAL_ORDER_NO` (`renewal_order_no`),
  KEY `IDX_ORDER_NO` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=128095 DEFAULT CHARSET=utf8 COMMENT='产品续保记录表';

/*Table structure for table `xm_policy_send_history` */

DROP TABLE IF EXISTS `xm_policy_send_history`;

CREATE TABLE `xm_policy_send_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` char(50) NOT NULL COMMENT '商城订单号',
  `product_name` varchar(250) DEFAULT NULL COMMENT '渠道商产品标题',
  `product_no` varchar(250) DEFAULT NULL COMMENT '渠道商产品编号',
  `buy_user_no` char(50) DEFAULT NULL COMMENT '下单用户ID',
  `agent_user_no` char(50) DEFAULT NULL COMMENT '下单用户ID',
  `applier_name` char(50) NOT NULL COMMENT '投保人姓名',
  `email` char(100) DEFAULT NULL COMMENT '客户电子邮箱',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态：0失败，1成功',
  `order_type` tinyint(4) DEFAULT '1' COMMENT '状态：1个险，2团险，3团险单',
  `note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_no` (`order_no`) USING BTREE,
  KEY `idx_apply_user_no` (`agent_user_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 COMMENT='发送电子保单历史表';

/*Table structure for table `xm_policy_surrender_callback` */

DROP TABLE IF EXISTS `xm_policy_surrender_callback`;

CREATE TABLE `xm_policy_surrender_callback` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `policy_no` char(200) NOT NULL COMMENT '保单号',
  `proposal_no` char(200) DEFAULT NULL COMMENT '投保单号',
  `policy_effective_date` datetime NOT NULL COMMENT '保单生效日期',
  `seller_no` varchar(50) NOT NULL COMMENT '渠道',
  `product_no` char(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `applicant_name` char(50) DEFAULT NULL COMMENT '投保人姓名',
  `applicant_phone` char(20) DEFAULT NULL COMMENT '投保人电话',
  `insured_name` char(50) DEFAULT NULL COMMENT '被保人名字',
  `apply_date` datetime DEFAULT NULL COMMENT '退保申请日期',
  `confirm_date` datetime DEFAULT NULL COMMENT '退保确认日期',
  `surrender_type` char(20) DEFAULT NULL COMMENT '退保类型,1-犹退，2-退保',
  `surrender_amount` decimal(12,2) DEFAULT NULL COMMENT '退保金额,单位/元',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `callback_data` text COMMENT '退保通知数据',
  PRIMARY KEY (`order_item_no`),
  KEY `idx_psc_policyno_confd_cat` (`policy_no`,`confirm_date`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保险公司退保数据回调';

/*Table structure for table `xm_policy_surrenders` */

DROP TABLE IF EXISTS `xm_policy_surrenders`;

CREATE TABLE `xm_policy_surrenders` (
  `order_item_no` char(50) NOT NULL COMMENT '订单项号',
  `refund_account` char(100) DEFAULT NULL COMMENT '退款账号',
  `refund_amount` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_type` char(20) DEFAULT NULL COMMENT '退款类型：犹豫期退保、部分领取、退保',
  `surrender_status` int(11) NOT NULL DEFAULT '1' COMMENT '退保状态：1退保中，2退保完成，3退保失败',
  `refund_status` int(11) NOT NULL DEFAULT '0' COMMENT '退款状态：0未退款，1退款中，2退款成功，3退款失败',
  `refund_reason` varchar(1000) DEFAULT NULL COMMENT '退保原因',
  `bank_token` char(100) NOT NULL COMMENT '银行流水号',
  `bank_card_no` char(100) DEFAULT NULL COMMENT '银行卡号',
  `bank_card_name` char(10) DEFAULT NULL COMMENT '银行卡开户名',
  `created_by` char(50) NOT NULL COMMENT '创建人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='退保记录';

/*Table structure for table `xm_policy_upgrade_infos` */

DROP TABLE IF EXISTS `xm_policy_upgrade_infos`;

CREATE TABLE `xm_policy_upgrade_infos` (
  `policy_upgrade_no` char(50) NOT NULL COMMENT '批改保单号',
  `policy_info_id` char(50) NOT NULL COMMENT '团险保单id',
  `order_no` char(50) DEFAULT NULL COMMENT '订单号',
  `upgrade_prem` decimal(20,2) NOT NULL COMMENT '金额',
  `upgrade_no` char(50) NOT NULL COMMENT '批改单号-保险公司返回',
  `upgrade_effective_date` datetime DEFAULT NULL COMMENT '生效时间',
  `base_order_no` char(50) NOT NULL COMMENT '原订单号',
  `upgrade_policy_url` varchar(2000) DEFAULT NULL COMMENT '批改保单号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `comment` text COMMENT '备注，主要记录后台系统客服输入信息',
  `policy_date` char(20) DEFAULT '' COMMENT '出单成功时间,格式为yyyy-MM-dd HH:mm:ss',
  `failed_date` char(20) DEFAULT '' COMMENT '出单失败时间，格式为yyyy-MM-dd HH:mm:ss',
  PRIMARY KEY (`policy_upgrade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团险批改保单表';

/*Table structure for table `xm_product_activity_records` */

DROP TABLE IF EXISTS `xm_product_activity_records`;

CREATE TABLE `xm_product_activity_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `activity_title` varchar(100) NOT NULL COMMENT '活动名称',
  `activity_content` varchar(250) NOT NULL COMMENT '活动内容',
  `activity_link` varchar(300) NOT NULL COMMENT '活动链接',
  `activity_type` int(11) NOT NULL DEFAULT '0' COMMENT '活动类型：预留字段',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(11) DEFAULT '1' COMMENT '0:失效 1:正常',
  `use_status` int(11) DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='商品活动记录表';

/*Table structure for table `xm_product_address` */

DROP TABLE IF EXISTS `xm_product_address`;

CREATE TABLE `xm_product_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNo` varchar(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `areaCode` varchar(10) DEFAULT NULL,
  `areaName` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `ranks` int(11) NOT NULL DEFAULT '0' COMMENT '地区排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208246 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_address_copy` */

DROP TABLE IF EXISTS `xm_product_address_copy`;

CREATE TABLE `xm_product_address_copy` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productNo` varchar(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `areaCode` varchar(6) NOT NULL,
  `areaName` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `ranks` int(11) NOT NULL DEFAULT '0' COMMENT '地区排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_age_ranges` */

DROP TABLE IF EXISTS `xm_product_age_ranges`;

CREATE TABLE `xm_product_age_ranges` (
  `age_range_id` int(11) NOT NULL COMMENT '年龄范围ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `use_status` int(11) DEFAULT '1' COMMENT '状态：-1:逻辑删除 1 可用状态 ',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`age_range_id`,`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品承保年龄范围';

/*Table structure for table `xm_product_attr_infos` */

DROP TABLE IF EXISTS `xm_product_attr_infos`;

CREATE TABLE `xm_product_attr_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `name` varchar(250) NOT NULL COMMENT '名称',
  `code` varchar(50) NOT NULL COMMENT '代码，短信：send_sms ，邮件：send_email，APP通知：send_app_notify，停售告知：stop_sale_anounce，有保单查询接口：has_policy_query_api，有重复出单接口：has_policy_retry_api',
  `value` varchar(250) NOT NULL COMMENT '值',
  `desc` text COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '使用状态：-1:逻辑删除 1 可用状态 ',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_pai_product_no` (`product_no`),
  KEY `idx_pai_sn_code` (`seller_no`,`code`),
  KEY `idx_pai_pn_code` (`product_no`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4799 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品运营扩展属性';

/*Table structure for table `xm_product_biz_pointers` */

DROP TABLE IF EXISTS `xm_product_biz_pointers`;

CREATE TABLE `xm_product_biz_pointers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务点ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `code` char(50) NOT NULL COMMENT '业务点编码',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `seller_no` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT '业务点名称',
  `rules_script` text COMMENT '业务点规则脚本',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11083 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='业务点';

/*Table structure for table `xm_product_classes` */

DROP TABLE IF EXISTS `xm_product_classes`;

CREATE TABLE `xm_product_classes` (
  `class_id` int(11) NOT NULL COMMENT '大类ID',
  `subclass_id` int(11) NOT NULL COMMENT '小类ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品类别';

/*Table structure for table `xm_product_clause_classes` */

DROP TABLE IF EXISTS `xm_product_clause_classes`;

CREATE TABLE `xm_product_clause_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权益分类';

/*Table structure for table `xm_product_clause_map` */

DROP TABLE IF EXISTS `xm_product_clause_map`;

CREATE TABLE `xm_product_clause_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权益映射ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `clauses_id` int(10) unsigned DEFAULT NULL COMMENT '保障权益ID',
  `map_key_value` varchar(100) DEFAULT NULL COMMENT '映射key的值',
  `map_value` varchar(100) DEFAULT NULL COMMENT '权益保额',
  `use_status` int(11) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `prono_clauid_status` (`product_no`,`clauses_id`,`use_status`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8 COMMENT='保障权益映射';

/*Table structure for table `xm_product_clauses` */

DROP TABLE IF EXISTS `xm_product_clauses`;

CREATE TABLE `xm_product_clauses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权益ID',
  `product_no` char(50) NOT NULL COMMENT '商品编号',
  `global_clauses_id` int(10) unsigned DEFAULT NULL COMMENT '全局保障权益ID',
  `name` varchar(250) DEFAULT NULL COMMENT '权益名称',
  `sum_insured` char(50) DEFAULT NULL COMMENT '权益保额',
  `use_status` int(11) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `coverage_id` int(11) NOT NULL DEFAULT '0' COMMENT '险种ID',
  `clause_code` varchar(150) DEFAULT NULL COMMENT '权益代码',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '权益类别，默认没有分类',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '权益排序号',
  `desc` text COMMENT '权益描述',
  `calc_script` text COMMENT '权益保额计算脚本',
  `clause_summary` varchar(255) DEFAULT NULL COMMENT '权益概述',
  `map_key` varchar(100) DEFAULT '' COMMENT '权益映射key',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26138 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保障权益';

/*Table structure for table `xm_product_coverages` */

DROP TABLE IF EXISTS `xm_product_coverages`;

CREATE TABLE `xm_product_coverages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '险种ID',
  `product_no` char(50) NOT NULL COMMENT '商品编号(冗余)',
  `global_coverage_id` int(10) unsigned DEFAULT NULL COMMENT '全局险种ID',
  `risk_code` varchar(150) DEFAULT NULL COMMENT '险种代码',
  `name` varchar(250) DEFAULT NULL COMMENT '险种名称',
  `sum_insured` char(50) DEFAULT NULL COMMENT '险种保额',
  `class_id` tinyint(2) NOT NULL DEFAULT '0' COMMENT '险种类别，0：主险，1：附加险',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '险种排序号',
  `desc` text COMMENT '险种描述',
  `calc_script` text COMMENT '险种保额计算脚本',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `dim_simple_no` varchar(50) DEFAULT NULL COMMENT '维度简码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保单险种';

/*Table structure for table `xm_product_dim_members` */

DROP TABLE IF EXISTS `xm_product_dim_members`;

CREATE TABLE `xm_product_dim_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `product_no` char(50) NOT NULL COMMENT '商品编码（搜索冗余）',
  `global_dim_id` int(11) NOT NULL COMMENT '维度ID',
  `product_dim_id` int(11) DEFAULT NULL COMMENT '商品维度ID(冗余)',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `name` varchar(100) DEFAULT NULL COMMENT '成员名称',
  `min_value` varchar(50) DEFAULT NULL COMMENT '最小值',
  `max_value` varchar(50) DEFAULT NULL COMMENT '最大值',
  `child_unit` varchar(50) DEFAULT NULL COMMENT '子级成员单位',
  `linkage_key` varchar(200) DEFAULT '' COMMENT '维度联动key',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`),
  KEY `product_dim_members_ix1` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=36424 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品维度成员';

/*Table structure for table `xm_product_dims` */

DROP TABLE IF EXISTS `xm_product_dims`;

CREATE TABLE `xm_product_dims` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维度ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `global_dim_id` int(11) NOT NULL COMMENT '全局维度ID',
  `simple_no` varchar(50) DEFAULT NULL COMMENT '维度简码',
  `name` varchar(100) DEFAULT NULL COMMENT '维度别名',
  `dim_desc` text COMMENT '维度说明',
  `def_value` varchar(200) DEFAULT NULL COMMENT '维度默认值',
  `boundary_type` varchar(2) DEFAULT '0' COMMENT '值域类型,包含两位，第一位：T时间，S性别，C自定义，J金额；第二位：S原始序列值，M分段规约成员；',
  `unit` varchar(50) DEFAULT NULL COMMENT '值域单位',
  `min_value` varchar(50) DEFAULT NULL COMMENT '最小值',
  `max_value` varchar(50) DEFAULT NULL COMMENT '最大值',
  `step` varchar(50) DEFAULT NULL COMMENT '步长',
  `order_no` int(11) DEFAULT NULL COMMENT '维度顺序号',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `dim_summary` varchar(255) DEFAULT NULL COMMENT '维度概述',
  `dim_type` varchar(32) DEFAULT 'common' COMMENT '维度类型，取值：common=通用, description=产品要素，fee=保费测算',
  `hide_set` varchar(100) DEFAULT '' COMMENT '维度隐藏设置-其他维度设置为某值时本维度隐藏',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `product_dims_ix1` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17219 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品维度';

/*Table structure for table `xm_product_features` */

DROP TABLE IF EXISTS `xm_product_features`;

CREATE TABLE `xm_product_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `feature_id` varchar(50) NOT NULL COMMENT '亮点ID',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品亮点';

/*Table structure for table `xm_product_files` */

DROP TABLE IF EXISTS `xm_product_files`;

CREATE TABLE `xm_product_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` char(30) NOT NULL COMMENT '文件ID',
  `product_no` char(50) NOT NULL COMMENT '商品编号',
  `alias` char(50) DEFAULT NULL COMMENT '文件别名，编程关联字段',
  `file_status` int(11) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `type` char(20) DEFAULT NULL COMMENT '类型：如img,pdf,html,txt',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `addition_flag` int(11) NOT NULL DEFAULT '0' COMMENT '追加上级文案的标志：1，追加；0，不追加(alias=claim_service_new时，表示理赔文案应用类型）',
  `link_pre_file` varchar(250) DEFAULT '' COMMENT '上级文案的描述语(alias=claim_service_new时，表示向日葵理赔文案)',
  `extend_param` varchar(255) DEFAULT NULL COMMENT '备注（alias=claim_service_new时，为空或者为extend_param=0则表示跟随进货商，remak=1则自定义;alias=claim_modal_document时，存储理赔电话tel和理赔跳转链接link的json）',
  PRIMARY KEY (`id`),
  KEY `index_product_no` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25604 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品文件表';

/*Table structure for table `xm_product_files_relation` */

DROP TABLE IF EXISTS `xm_product_files_relation`;

CREATE TABLE `xm_product_files_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_no` char(50) NOT NULL COMMENT '商品编号',
  `product_file_id` int(11) NOT NULL COMMENT '文件编号',
  `file_status` int(2) DEFAULT '1' COMMENT '文件状态：-1:逻辑删除 1 可用状态 ',
  `type` char(50) NOT NULL COMMENT '类型：group_acrm：acrm团险，group_app:线上团险,group_pc:pc录单团险',
  `operator_id` char(30) NOT NULL COMMENT '操作者ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_product_no` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品文件关联表';

/*Table structure for table `xm_product_globalcategory` */

DROP TABLE IF EXISTS `xm_product_globalcategory`;

CREATE TABLE `xm_product_globalcategory` (
  `category_id` int(11) NOT NULL COMMENT '商品品类ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  UNIQUE KEY `onlyone` (`category_id`,`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品品类归属表';

/*Table structure for table `xm_product_identity_auth_config` */

DROP TABLE IF EXISTS `xm_product_identity_auth_config`;

CREATE TABLE `xm_product_identity_auth_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号，为''all''表示通用',
  `auth_type` varchar(50) NOT NULL COMMENT '认证类型:  idcard-创蓝接口认证，real_name_ocr-实名OCR,currency_ocr-通用OCR，phone_idcard-三要素认证',
  `status` smallint(6) DEFAULT NULL COMMENT '1-有效，0-失效',
  `auth_value` varchar(100) NOT NULL COMMENT '需要认证的用户  ，applier-投保人，insured-被保人，benifit-收益人,如果存在两种以下用|分割',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tips_text` varchar(250) DEFAULT NULL COMMENT '标题文案',
  `priority` smallint(6) DEFAULT '1' COMMENT '优先级',
  `certificates_type_ids` varchar(100) DEFAULT NULL COMMENT '支持的证件类型id，用, 分割 ；如果为''all''表示支持所有证件类型',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '按"渠道" 配置',
  `config` varchar(1000) DEFAULT NULL COMMENT '手机三要素配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_maintainance` */

DROP TABLE IF EXISTS `xm_product_maintainance`;

CREATE TABLE `xm_product_maintainance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `seller_name` varchar(100) DEFAULT NULL COMMENT '进货商名称',
  `code` varchar(50) NOT NULL COMMENT '代码 停售告知：stop_sale_anounce',
  `desc` varchar(1000) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 -1:已失效 0:未生效 1:已生效 2已结束',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT '结束时间',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `channel_codes` varchar(100) DEFAULT '' COMMENT '挂起渠道代码集合',
  `stop_status` int(11) NOT NULL DEFAULT '0' COMMENT '挂起原因：1：产品变更；2：保司系统故障； 3：向日葵系统故障；4：保司常规系统维护；5：需求上线影响投保流程；6：其他',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_payee_config` */

DROP TABLE IF EXISTS `xm_product_payee_config`;

CREATE TABLE `xm_product_payee_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `weixin` varchar(50) NOT NULL COMMENT '微信公众号支付',
  `weixin_app` varchar(50) NOT NULL COMMENT '微信App/小程序支付',
  `alipay` varchar(50) NOT NULL COMMENT '支付宝H5支付',
  `alipay_app` varchar(50) NOT NULL COMMENT '支付宝App支付',
  `union_bank` varchar(50) NOT NULL COMMENT '银联支付',
  `offline` varchar(50) NOT NULL COMMENT '线下收款',
  `status` int(1) DEFAULT '1' COMMENT '状态（0=无效，1=正常）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product_no` (`product_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='产品支付配置表';

/*Table structure for table `xm_product_payee_config_ext` */

DROP TABLE IF EXISTS `xm_product_payee_config_ext`;

CREATE TABLE `xm_product_payee_config_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `biz_type` varchar(50) DEFAULT NULL COMMENT 'product-产品配置，seller-进货商渠道配置，payeeChannel-支付渠道配置',
  `biz_code` varchar(50) DEFAULT NULL COMMENT 'disable_creditCard-不支持信用卡支付， realname_auth-实名认证， disable_zfbPay-不支持支付宝付款，disable_wxPay-不支持支付宝付款， app_version_switch-版本控制，an_version-安卓app版本号，ios_version-苹果app版本号',
  `biz_no` varchar(50) DEFAULT NULL COMMENT '渠道编号、产品编号、支付渠道编码，根据biz_type定义',
  `biz_value` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '状态（0=无效，1=正常）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_type_code_no` (`biz_type`,`biz_code`,`biz_no`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='产品支付配置额外属性表';

/*Table structure for table `xm_product_renewal_dim_members` */

DROP TABLE IF EXISTS `xm_product_renewal_dim_members`;

CREATE TABLE `xm_product_renewal_dim_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `product_no` char(50) NOT NULL COMMENT '商品编码（搜索冗余）',
  `global_dim_id` int(11) NOT NULL COMMENT '维度ID',
  `product_dim_id` int(11) DEFAULT NULL COMMENT '商品维度ID(冗余)',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `name` varchar(100) DEFAULT NULL COMMENT '成员名称',
  `min_value` varchar(50) DEFAULT NULL COMMENT '最小值',
  `max_value` varchar(50) DEFAULT NULL COMMENT '最大值',
  `child_unit` varchar(50) DEFAULT NULL COMMENT '子级成员单位',
  `linkage_key` varchar(200) DEFAULT '' COMMENT '维度联动key',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录修改时间',
  `origin_product_no` varchar(50) NOT NULL DEFAULT 'base' COMMENT 'base-表示 续保基础的维度，产品编号时表示该产品编号续保到product_no的维度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43180 DEFAULT CHARSET=utf8 COMMENT='续保商品维度成员';

/*Table structure for table `xm_product_renewal_dims` */

DROP TABLE IF EXISTS `xm_product_renewal_dims`;

CREATE TABLE `xm_product_renewal_dims` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '维度ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `global_dim_id` int(11) NOT NULL COMMENT '全局维度ID',
  `simple_no` varchar(50) DEFAULT NULL COMMENT '维度简码',
  `name` varchar(100) DEFAULT NULL COMMENT '维度别名',
  `dim_desc` text COMMENT '维度说明',
  `def_value` varchar(200) DEFAULT NULL COMMENT '维度默认值',
  `boundary_type` varchar(2) DEFAULT '0' COMMENT '值域类型,包含两位，第一位：T时间，S性别，C自定义，J金额；第二位：S原始序列值，M分段规约成员；',
  `unit` varchar(50) DEFAULT NULL COMMENT '值域单位',
  `min_value` varchar(50) DEFAULT NULL COMMENT '最小值',
  `max_value` varchar(50) DEFAULT NULL COMMENT '最大值',
  `step` varchar(50) DEFAULT NULL COMMENT '步长',
  `order_no` int(11) DEFAULT NULL COMMENT '维度顺序号',
  `def_old_value` int(11) DEFAULT NULL COMMENT '0:默认值需与前订单一样，1:不需要，2:只能选择前订单值',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `dim_summary` varchar(255) DEFAULT NULL COMMENT '维度概述',
  `dim_type` varchar(32) DEFAULT 'common' COMMENT '维度类型，取值：common=通用, description=产品要素，fee=保费测算',
  `hide_set` varchar(100) DEFAULT '' COMMENT '维度隐藏设置-其他维度设置为某值时本维度隐藏',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `origin_product_no` varchar(50) NOT NULL DEFAULT 'base' COMMENT 'base-表示 续保基础的维度，产品编号时表示该产品编号续保到product_no的维度',
  PRIMARY KEY (`id`),
  KEY `product_dims_ix1` (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27073 DEFAULT CHARSET=utf8 COMMENT='续保商品维度';

/*Table structure for table `xm_product_renewal_history` */

DROP TABLE IF EXISTS `xm_product_renewal_history`;

CREATE TABLE `xm_product_renewal_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `renewal_process` smallint(6) NOT NULL DEFAULT '0' COMMENT '续保流程标志(1-收集续保账号、2-续保接口传送账号、3-续保接口且直接支付、4-续保接口下新单、5-按首单下单流程续保、6-停售推荐、7-即将到期短信通知划扣、8-保险公司不提供续保接口，跳转到续保描述页面、9-升级续保产品，续保跳到新产品的详情页、10-推荐、11-团险续保、12-CPS续保)',
  `grace_period` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽限期',
  `stop_sale_recommend_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '停售续保推荐产品标志:0-不推荐，1-推荐',
  `stop_sale_recommend_product` varchar(250) DEFAULT NULL COMMENT '停售续保推荐产品',
  `renewal_agent_notify_days` varchar(100) DEFAULT NULL COMMENT '续保提前通知代理人天数,格式:45|15|1|-1',
  `renewal_applier_notify_days` varchar(100) DEFAULT NULL COMMENT '续保提前通知投保人天数,格式:30|7|1|-1',
  `filter_js` text COMMENT '过滤不发送的订单的业务js',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态：0无效，1有效',
  `note` text COMMENT '描述',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `notify_agent_max_dt` int(11) DEFAULT NULL COMMENT '通知代理人最大时间',
  `notify_applier_max_dt` int(11) DEFAULT NULL COMMENT '通知购买人最大时间',
  `renew_product_no` varchar(50) DEFAULT NULL COMMENT '续保后对应新的产品',
  `start_renewal_days` varchar(100) DEFAULT NULL COMMENT '续保起始时间,格式:判断天数|大于增加|小于增加|宽限期增加，例如：续保时间3|1|4|0，距离保单结束时间大于3时T+1,否则当前时间T+4,第四个值是犹豫期内T+0(配-1时是终保日期+1)',
  `renewal_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '续保标志(0-续保、1-复购)',
  `first_order_check_status` tinyint(4) DEFAULT '0' COMMENT '续保产品首单查检标识，0-未检查过，1-已检查过订单，2-已检查过订单与保单',
  `renew_series_name` varchar(255) DEFAULT NULL COMMENT '续保系列名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='产品续保历史表';

/*Table structure for table `xm_product_renewal_series` */

DROP TABLE IF EXISTS `xm_product_renewal_series`;

CREATE TABLE `xm_product_renewal_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `renewal_process` tinyint(4) DEFAULT NULL COMMENT '续保流程, 同xm_product_renewals中对应字段',
  `renew_product_no` varchar(64) DEFAULT NULL COMMENT '默认续保产品编号',
  `renew_name_in_series` varchar(255) DEFAULT NULL COMMENT '续保产品在系列中的名称',
  `config_type` varchar(8) NOT NULL DEFAULT 'new' COMMENT '脚本等配置类型，new=使用新配置，origin=使用原有配置',
  `show_sequence` int(11) NOT NULL DEFAULT '0' COMMENT '显示顺序值，越小越靠前',
  `condition` varchar(512) DEFAULT NULL COMMENT '可展示使用的条件。 配置格式：\r\n条件组合说明：\r\n","分隔单个条件中的多值，"|"组合多个条件为一个条件组(and组合)，##合并多个条件组(or组合)\r\n关键字：\r\nage_calc_date: 年龄计算时间，取值[current_date(续保当天),policy_end_date(原单承保结束时间)]\r\nage_range: 年龄范围值，单位有[y(岁),m(月),d(天)]，范围值用"-"\r\njob_level: 职业类别\r\n示例：\r\nage_calc_date=current_date|age_range=10d-60y,65y-70y|job_level=1,2,4##age_calc_date=policy_end_date|age_range=20y-40y',
  `first_order_check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '续保产品首单查检标识，0-未检查过，1-已检查过订单，2-已检查过订单与保单',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用状态，0=失效，1=正常',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `seller_order_type` varchar(20) NOT NULL DEFAULT 'new' COMMENT 'new-调用下新单接口，renewal-调用续保接口',
  `start_renewal_days` varchar(20) DEFAULT NULL COMMENT '续保起始时间,格式:判断天数|大于增加|小于增加|宽限期增加',
  `renewal_insured_notice` smallint(6) DEFAULT NULL COMMENT ' -1-同新单,0-不需要健康告知，2-升保额需要健康告知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=434392 DEFAULT CHARSET=utf8 COMMENT='续保产品配置详情表';

/*Table structure for table `xm_product_renewals` */

DROP TABLE IF EXISTS `xm_product_renewals`;

CREATE TABLE `xm_product_renewals` (
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `renewal_process` smallint(6) NOT NULL DEFAULT '0' COMMENT '续保流程标志(1-收集续保账号、2-续保接口传送账号、3-续保接口且直接支付、4-续保接口下新单、5-按首单下单流程续保、6-停售推荐、7-即将到期短信通知划扣、8-保险公司不提供续保接口，跳转到续保描述页面、9-升级续保产品，续保跳到新产品的详情页、10-推荐、11-团险续保、12-CPS续保)',
  `grace_period` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽限期',
  `stop_sale_recommend_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '停售续保推荐产品标志:0-不推荐，1-推荐',
  `stop_sale_recommend_product` varchar(250) DEFAULT NULL COMMENT '停售续保推荐产品',
  `renewal_agent_notify_days` varchar(100) DEFAULT NULL COMMENT '续保提前通知代理人天数,格式:45|15|1|-1',
  `renewal_applier_notify_days` varchar(100) DEFAULT NULL COMMENT '续保提前通知投保人天数,格式:30|7|1|-1',
  `filter_js` text COMMENT '过滤不发送的订单的业务js',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态：0无效，1有效',
  `note` text COMMENT '描述',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `notify_agent_max_dt` int(11) DEFAULT NULL COMMENT '通知代理人最大时间',
  `notify_applier_max_dt` int(11) DEFAULT NULL COMMENT '通知购买人最大时间',
  `renew_product_no` varchar(50) DEFAULT NULL COMMENT '续保后对应新的产品',
  `start_renewal_days` varchar(100) DEFAULT NULL COMMENT '续保起始时间,格式:判断天数|大于增加|小于增加|宽限期增加',
  `renewal_tag` smallint(6) NOT NULL DEFAULT '0' COMMENT '续保标志(0-续保、1-复购)',
  `first_order_check_status` tinyint(4) DEFAULT '0' COMMENT '续保产品首单查检标识，0-未检查过，1-已检查过订单，2-已检查过订单与保单',
  `renew_series_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_no`,`renewal_process`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品续保表';

/*Table structure for table `xm_product_reveal_infos` */

DROP TABLE IF EXISTS `xm_product_reveal_infos`;

CREATE TABLE `xm_product_reveal_infos` (
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '状态:1.显示，0.不显示',
  `use_status` int(11) DEFAULT '1' COMMENT '1.可用状态，-1.逻辑删除',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息披露表';

/*Table structure for table `xm_product_scripts` */

DROP TABLE IF EXISTS `xm_product_scripts`;

CREATE TABLE `xm_product_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据表ID',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编码',
  `code` varchar(50) NOT NULL COMMENT '数据表编码',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1:逻辑删除 1 可用状态 ',
  `name` varchar(200) DEFAULT NULL COMMENT '数据表名称',
  `script_kind` varchar(2) DEFAULT NULL COMMENT '数据表类型',
  `data` longtext,
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `rate_key` varchar(200) DEFAULT '' COMMENT '计价表头字段',
  `rate_mode` int(11) DEFAULT '1' COMMENT '计价模式：1-旧方式,2-新方式,3-既走新模式也走旧方式,默认为1',
  `rate_percent` decimal(7,4) DEFAULT '1.0000' COMMENT '价格比率，默认为1。本费率表根据price_key的值寻到价格后，再乘以此值',
  `coverage_code` varchar(50) DEFAULT '' COMMENT '责任编码-对应xm_product_coverage.risk_code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5929 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品计算数据表';

/*Table structure for table `xm_product_search_infos` */

DROP TABLE IF EXISTS `xm_product_search_infos`;

CREATE TABLE `xm_product_search_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `search_text` text NOT NULL COMMENT '商品搜索信息（商品名|公司名|权益信息|职业等级|险种名称）',
  `job_level` varchar(30) DEFAULT NULL COMMENT '职业等级（1,2,3,4）',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=624 DEFAULT CHARSET=utf8 COMMENT='商品搜索信息表';

/*Table structure for table `xm_product_search_type` */

DROP TABLE IF EXISTS `xm_product_search_type`;

CREATE TABLE `xm_product_search_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型: 1:渠道，2：分类，3：权益，4：产品名称，5-职业,6-职业等级',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `order_no` int(11) DEFAULT '0' COMMENT '排序号',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品搜索基础信息类型表';

/*Table structure for table `xm_product_sell_base_infos` */

DROP TABLE IF EXISTS `xm_product_sell_base_infos`;

CREATE TABLE `xm_product_sell_base_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `class_id` int(11) DEFAULT NULL COMMENT '大类ID',
  `subclass_id` int(11) DEFAULT NULL COMMENT '小类ID',
  `age_range_id` int(11) DEFAULT NULL COMMENT '年龄范围ID',
  `company_no` varchar(50) DEFAULT NULL COMMENT '保险公司编码',
  `parent_company_no` varchar(50) DEFAULT NULL COMMENT '保险公司父编码',
  `day_type` int(4) DEFAULT '7' COMMENT '统计类型：7天|30天，对应存的数据：7|30',
  `status` tinyint(2) DEFAULT '1' COMMENT '商品状态：1上线，0下线',
  `sell_count` int(11) DEFAULT NULL COMMENT '销售数量',
  `sales_count` int(11) DEFAULT NULL COMMENT '出单人数',
  `policy_prem` decimal(18,2) DEFAULT NULL COMMENT '保费',
  `public_time` datetime DEFAULT NULL COMMENT '首次上架时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `PK` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_no` (`product_no`) USING BTREE,
  KEY `idx_cc_dt_status_ci_si_ari_cn` (`channel_code`,`class_id`,`subclass_id`,`age_range_id`,`company_no`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_sc_sc_pp_pt` (`channel_code`,`class_id`,`day_type`,`status`,`sell_count`,`sales_count`,`policy_prem`,`public_time`) USING BTREE,
  KEY `idx_cc_dt_status_ci_si` (`channel_code`,`class_id`,`subclass_id`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_si_ari` (`channel_code`,`class_id`,`subclass_id`,`age_range_id`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_si_cn` (`channel_code`,`class_id`,`subclass_id`,`company_no`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_ari_cn` (`channel_code`,`class_id`,`age_range_id`,`company_no`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_cn` (`channel_code`,`class_id`,`company_no`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ci_ari` (`channel_code`,`class_id`,`age_range_id`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ari_cn` (`channel_code`,`age_range_id`,`company_no`,`day_type`,`status`) USING BTREE,
  KEY `idx_cc_dt_status_ari_sc_sc_pp_pt` (`channel_code`,`age_range_id`,`day_type`,`status`,`sell_count`,`sales_count`,`policy_prem`,`public_time`) USING BTREE,
  KEY `idx_cc_dt_status_cn` (`channel_code`,`company_no`,`day_type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1828154 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_sell_infos` */

DROP TABLE IF EXISTS `xm_product_sell_infos`;

CREATE TABLE `xm_product_sell_infos` (
  `product_no` varchar(50) NOT NULL COMMENT '商品编号',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `sell_count` int(11) NOT NULL DEFAULT '0' COMMENT '销售数量',
  `use_status` int(11) DEFAULT '1' COMMENT '1.可用状态，-1.逻辑删除',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品销量信息表';

/*Table structure for table `xm_product_share` */

DROP TABLE IF EXISTS `xm_product_share`;

CREATE TABLE `xm_product_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(64) NOT NULL,
  `product_no` varchar(64) NOT NULL COMMENT '产品编号',
  `goods_id` varchar(64) DEFAULT NULL,
  `share_ticket` varchar(128) DEFAULT NULL COMMENT '分享编号，可区分同一个商品多次分享',
  `visit_count` int(11) DEFAULT NULL COMMENT '被访问次数',
  `goods_name` varchar(128) DEFAULT NULL,
  `goods_company_logo` varchar(256) DEFAULT NULL,
  `goods_company_id` varchar(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_prod_share_ssoid_goodsid` (`sso_id`,`goods_id`) USING BTREE,
  KEY `idx_prod_share_created_at_ssoid` (`created_at`,`sso_id`) USING BTREE,
  KEY `idx_prod_share_prodNo_ssoId` (`product_no`,`sso_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='商品分享记录表';

/*Table structure for table `xm_product_share_visit` */

DROP TABLE IF EXISTS `xm_product_share_visit`;

CREATE TABLE `xm_product_share_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL COMMENT '分享记录id',
  `sso_id` varchar(64) DEFAULT NULL COMMENT '分享人id',
  `union_id` varchar(128) DEFAULT NULL COMMENT '微信union_id',
  `open_id` varchar(128) DEFAULT NULL COMMENT '微信openid',
  `read_times` int(11) DEFAULT '1' COMMENT '第几次阅读',
  `goods_id` varchar(64) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(128) DEFAULT NULL,
  `wx_avatar` varchar(512) DEFAULT NULL COMMENT '微信头像',
  `wx_nickname` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '微信昵称',
  `gender` tinyint(4) DEFAULT '0' COMMENT '性别，1-男，2-女，其它-未知',
  `goods_company_id` varchar(11) DEFAULT NULL,
  `goods_company_logo` varchar(128) DEFAULT NULL,
  `read_status` tinyint(4) DEFAULT '0' COMMENT '分享者是否已查看，1=未查看，2=已经查看',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prod_share_visit_shareId_ssoId` (`share_id`,`sso_id`) USING BTREE,
  KEY `idx_prod_share_visit_openId_ssoId` (`open_id`,`sso_id`) USING BTREE,
  KEY `idx_prod_share_visit_ssoId_createdAt` (`sso_id`,`created_at`) USING BTREE,
  KEY `idx_prod_share_visit_createdAt` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COMMENT='用户查看商品分享动作记录表';

/*Table structure for table `xm_product_top` */

DROP TABLE IF EXISTS `xm_product_top`;

CREATE TABLE `xm_product_top` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` char(50) NOT NULL COMMENT '商品编码',
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `class_id` int(11) DEFAULT NULL COMMENT '大类ID',
  `is_top` tinyint(2) NOT NULL DEFAULT '0' COMMENT '置顶标识，1：置顶，0：取消置顶',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_no` (`product_no`) USING BTREE,
  KEY `idx_channel_code` (`channel_code`) USING BTREE,
  KEY `idx_class_id` (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_product_underwriting_components` */

DROP TABLE IF EXISTS `xm_product_underwriting_components`;

CREATE TABLE `xm_product_underwriting_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(64) NOT NULL COMMENT '产品编码',
  `component_id` int(11) NOT NULL COMMENT '组件id',
  `use_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-不使用，1-使用',
  `status` tinyint(4) DEFAULT '0' COMMENT '0-有效，1-无效',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_prod_underwriting_sts_type_prodno` (`status`,`use_type`,`product_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='产品核保组件配置表';

/*Table structure for table `xm_products` */

DROP TABLE IF EXISTS `xm_products`;

CREATE TABLE `xm_products` (
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `title` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `desc` text COMMENT '商品描述',
  `product_type` int(11) NOT NULL DEFAULT '0' COMMENT '产品类型：0保险商品',
  `company_no` varchar(50) DEFAULT NULL COMMENT '保险公司编码',
  `series_id` int(11) DEFAULT NULL COMMENT '商品系列ID',
  `series_self_name` varchar(200) DEFAULT NULL COMMENT '在系列中的自称',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '进货商编码',
  `min_dir_price` decimal(12,2) DEFAULT NULL COMMENT '本件商品的最低价格的目录价格',
  `min_price` decimal(12,2) DEFAULT NULL COMMENT '本件商品的最低销售价格',
  `sell_count` decimal(18,0) DEFAULT NULL COMMENT '商品销量',
  `attr_info` text COMMENT '商品扩展属性，json格式',
  `order_no` int(11) DEFAULT '0' COMMENT '排序号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '商品状态：1上线，0下线',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  `group_type` char(10) NOT NULL DEFAULT 'personal' COMMENT '保单类型:家庭(family)/团购(groupon)/个人(personal)',
  `is_gift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是赠险',
  `series_weight` int(11) NOT NULL DEFAULT '0' COMMENT '商品系列权重',
  `renewal_series_id` int(11) DEFAULT NULL COMMENT '续保商品系列ID',
  `claim_type` int(2) DEFAULT '0' COMMENT '理赔类型 0:非闪赔 1: 闪赔',
  `branch_company_no` varchar(50) DEFAULT '' COMMENT '分公司编号',
  `property` int(2) DEFAULT '0' COMMENT '商品属性：0-互联网产品；1-融合产品',
  `sure_sale_channels` varchar(500) DEFAULT 'xrk_drp,xrk_kkyd,xrk_nds,xrk_platform_m' COMMENT '可以上架的渠道:xrk_drp:保险人APP,xrk_kkyd:咔咔有单App,xrk_nds：直销, xrk_platform_m-M商城',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品基本信息表';

/*Table structure for table `xm_promotion_media` */

DROP TABLE IF EXISTS `xm_promotion_media`;

CREATE TABLE `xm_promotion_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_code` varchar(50) DEFAULT NULL COMMENT '媒体代码，唯一索引',
  `media_name` varchar(50) DEFAULT NULL COMMENT '媒体名称',
  `sale_channel_code` varchar(50) DEFAULT NULL COMMENT '关联的销售渠道代码',
  `media_access_id` varchar(100) DEFAULT NULL COMMENT '媒体自编ID',
  `media_access_key` varchar(150) DEFAULT NULL COMMENT '媒体接入密钥',
  `status` int(11) DEFAULT '1' COMMENT '1=正常，0=无效',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_code` (`media_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='增媒体定义表';

/*Table structure for table `xm_prospectus_products` */

DROP TABLE IF EXISTS `xm_prospectus_products`;

CREATE TABLE `xm_prospectus_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `product_name` varchar(50) NOT NULL COMMENT '商品名称',
  `app_company_id` varchar(30) DEFAULT NULL COMMENT '所属公司',
  `status` int(11) DEFAULT '1' COMMENT '上下架状态：1.上架，0.下架',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='计划书展示商品信息';

/*Table structure for table `xm_pufa_pay_bills` */

DROP TABLE IF EXISTS `xm_pufa_pay_bills`;

CREATE TABLE `xm_pufa_pay_bills` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '下载流水号-自动递增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `merchant_no` varchar(100) DEFAULT NULL COMMENT '商户号',
  `trade_date` datetime DEFAULT NULL COMMENT '交易日期',
  `trade_time` varchar(20) DEFAULT NULL COMMENT '交易时间',
  `trade_type` varchar(10) DEFAULT NULL COMMENT '交易类型:消费、退货',
  `card_no` varchar(100) DEFAULT NULL COMMENT '卡号',
  `trade_money` decimal(12,2) DEFAULT NULL COMMENT '交易金额',
  `terminal_no` varchar(50) DEFAULT NULL COMMENT '终端号',
  `settle_money` decimal(12,2) DEFAULT NULL COMMENT '清算金额',
  `charge` decimal(12,2) DEFAULT NULL COMMENT '手续费',
  `refer_no` varchar(20) DEFAULT NULL COMMENT '参考号',
  `serial_no` varchar(20) DEFAULT NULL COMMENT '流水号',
  `merchant_name` varchar(100) DEFAULT NULL COMMENT '商户名称',
  `card_type` varchar(10) DEFAULT NULL COMMENT '卡类型',
  `merchant_order_no` varchar(100) DEFAULT NULL COMMENT '商户订单号',
  `mall_order_no` varchar(100) DEFAULT NULL COMMENT '向日葵商城订单号',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付类型',
  `unionpay_merchant_no` varchar(100) DEFAULT NULL COMMENT '银商订单号',
  `refund_order_no` varchar(100) DEFAULT NULL COMMENT '退货订单号',
  `pay_money` decimal(12,2) DEFAULT NULL COMMENT '实际支付金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `pay_remark` varchar(100) DEFAULT NULL COMMENT '付款附言',
  `wallet_cheap_money` decimal(12,2) DEFAULT NULL COMMENT '钱包优惠金额',
  `merchant_cheap_money` decimal(12,2) DEFAULT NULL COMMENT '商户优惠金额',
  `issuing_bank` varchar(100) DEFAULT NULL COMMENT '发卡行',
  `branch_name` varchar(100) DEFAULT NULL COMMENT '分店简称',
  `other_cheap_money` decimal(10,2) DEFAULT NULL COMMENT '其他优惠金额',
  `stage_count` varchar(10) DEFAULT NULL COMMENT '分期期数',
  `stage_servicer` varchar(100) DEFAULT NULL COMMENT '分期服务方',
  `stage_payer` varchar(100) DEFAULT NULL COMMENT '分期付息方',
  `sub_order_no` varchar(100) DEFAULT NULL COMMENT '子订单号',
  PRIMARY KEY (`id`),
  KEY `idx_pfpb_mallorderno` (`merchant_order_no`) USING BTREE,
  KEY `idx_pfpb_billtime_paytag` (`trade_date`,`trade_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xm_questionnaire_answer_records` */

DROP TABLE IF EXISTS `xm_questionnaire_answer_records`;

CREATE TABLE `xm_questionnaire_answer_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `trans_no` char(80) NOT NULL COMMENT '问卷流水id',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `answer_text` text NOT NULL COMMENT '答案记录内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品问卷答案记录表';

/*Table structure for table `xm_recall` */

DROP TABLE IF EXISTS `xm_recall`;

CREATE TABLE `xm_recall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_no` varchar(64) DEFAULT NULL COMMENT '回溯唯一编号',
  `trace_type` varchar(16) DEFAULT NULL COMMENT '类型，insure=投保可视化回溯，diagnosis=问题诊断回溯',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `policy_no` varchar(64) DEFAULT NULL COMMENT '保单号',
  `aplier_cert_no` varchar(32) DEFAULT NULL COMMENT '投保人证件号',
  `insured_cert_no` varchar(32) DEFAULT NULL COMMENT '被保人证件号',
  `recall_file_url` varchar(512) DEFAULT NULL COMMENT '生成的可回溯文件url',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trace_no` (`trace_no`) USING BTREE,
  KEY `order_no` (`order_no`,`trace_type`) USING BTREE,
  KEY `aplier_cert_no` (`aplier_cert_no`,`created_at`),
  KEY `insured_cert_no` (`insured_cert_no`,`created_at`),
  KEY `created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8871 DEFAULT CHARSET=utf8 COMMENT='可回溯数据索引表';

/*Table structure for table `xm_recall_item` */

DROP TABLE IF EXISTS `xm_recall_item`;

CREATE TABLE `xm_recall_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_no` varchar(64) DEFAULT NULL COMMENT '回溯唯一编号',
  `data_tag` varchar(32) DEFAULT NULL COMMENT '回溯数据标签，insure_all=投保流程总数据，product_detail=商品详情页数据',
  `trace_data` mediumtext COMMENT '追踪日志数据',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_trace_no` (`trace_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11663 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_receipt` */

DROP TABLE IF EXISTS `xm_receipt`;

CREATE TABLE `xm_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(50) DEFAULT NULL COMMENT '回单号',
  `agent_user_no` varchar(50) DEFAULT NULL COMMENT '代理人分销号，同订单表中的agent_user_no',
  `payer_name` varchar(50) DEFAULT NULL COMMENT '付款人名称',
  `payer_account` varchar(50) DEFAULT NULL COMMENT '付款人账号',
  `payer_bank` varchar(50) DEFAULT NULL COMMENT '付款人账户开户银行',
  `receiver_name` varchar(50) DEFAULT NULL COMMENT '收款人名称',
  `receiver_account` varchar(50) DEFAULT NULL COMMENT '收款人账号',
  `receiver_bank` varchar(50) DEFAULT NULL COMMENT '收款人开户行',
  `money` int(10) DEFAULT NULL COMMENT '金额，单位：分',
  `pay_order_money` int(10) DEFAULT NULL COMMENT '订单扣减金额',
  `remain_money` int(10) DEFAULT NULL COMMENT '剩余金额',
  `trade_time` datetime DEFAULT NULL COMMENT '记账日期',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件Url',
  `receipt_from` varchar(20) DEFAULT NULL COMMENT '回执来源，PA=平安银行',
  `extra` varchar(1000) DEFAULT NULL COMMENT '额外信息，保存各收据方特有的信息',
  `status` int(5) DEFAULT '1' COMMENT '回执状态，-1=逻辑删除，0=无效, 1=正常',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COMMENT='回单主体信息表';

/*Table structure for table `xm_receipt_history` */

DROP TABLE IF EXISTS `xm_receipt_history`;

CREATE TABLE `xm_receipt_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) NOT NULL COMMENT '回执自增主键',
  `receipt_no` varchar(50) DEFAULT NULL COMMENT '回执单号，同xm_receipt，此字段冗余',
  `receipt_from` varchar(50) DEFAULT NULL COMMENT '回执来源，同xm_receipt，此字段冗余',
  `biz_no` varchar(50) DEFAULT NULL COMMENT '业务号，如商城订单号',
  `biz_type` varchar(20) DEFAULT NULL COMMENT '业务类型，pay_order=订单支付扣减，cancel_order=订单撤单，policy_failed=出单失败，order_refund=订单退款，receipt_edit=回单编辑，receipt_add=回单新增，receipt_refund=退还剩余金额, receipt_invalidate=回单作废',
  `money` int(10) DEFAULT NULL COMMENT '变动金额，单位：分',
  `content` varchar(1000) DEFAULT NULL COMMENT '回单变动内容，json格式',
  `operator` varchar(50) DEFAULT '' COMMENT '操作人',
  `status` int(2) DEFAULT '1' COMMENT '状态，0=无效，1=正常',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8 COMMENT='回单相关减扣编辑等操作记录表';

/*Table structure for table `xm_refund_trades` */

DROP TABLE IF EXISTS `xm_refund_trades`;

CREATE TABLE `xm_refund_trades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` char(29) NOT NULL COMMENT '向日葵平台生成唯一退款单号',
  `mch_id` varchar(50) NOT NULL,
  `out_refund_no` varchar(64) NOT NULL COMMENT '向日葵商户对应的退款单号',
  `trade_id` varchar(64) NOT NULL COMMENT '向日葵平台唯一交易号，对应表xm_pay_trades 的trade_id',
  `xrk_pay_channel` varchar(20) NOT NULL COMMENT '向日葵收款渠道，对应xrk_pay_trades.xrk_pay_channel',
  `status` int(11) NOT NULL COMMENT '状态：0-待处理，1-退款中,2-退款成功,3-退款失败',
  `refund_fee` int(11) NOT NULL COMMENT '退款金额，单位:分',
  `refund_at` datetime DEFAULT NULL COMMENT '退款日期',
  `currency` varchar(20) NOT NULL COMMENT '货币类型',
  `refund_trades_task_id` int(11) DEFAULT NULL COMMENT '关联退款处理单id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REFUND_ID` (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3508 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_refund_trades_task` */

DROP TABLE IF EXISTS `xm_refund_trades_task`;

CREATE TABLE `xm_refund_trades_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mch_id` varchar(50) NOT NULL COMMENT '向日葵商户ID',
  `mch_name` varchar(128) NOT NULL COMMENT '商户名称',
  `refund_platform` varchar(20) NOT NULL COMMENT '支付平台：janghang，sd_wx，sd_zfb',
  `created_at` datetime NOT NULL COMMENT '处理单生成日期',
  `handle_at` datetime DEFAULT NULL COMMENT '处理单处理日期',
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '处理单状态：0-处理中，1-已处理',
  `result_filepath` varchar(256) DEFAULT NULL COMMENT '导入处理结果文件路径',
  `create_filepath` varchar(256) DEFAULT NULL COMMENT '生成处理单文件路径,避免处理中下载任务单,需要每次重新生成处理单',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_renewal_call_back` */

DROP TABLE IF EXISTS `xm_renewal_call_back`;

CREATE TABLE `xm_renewal_call_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `policy_no` char(200) NOT NULL,
  `mobile_no` char(20) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',
  `call_result` int(11) DEFAULT NULL COMMENT '0-未呼叫完成,1-已接听,2-未接听',
  `renewal_send_msg` smallint(6) DEFAULT NULL COMMENT '0-未发送短信消息，1-已发送短信消息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `policy_no` (`policy_no`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_renewal_info_from_insurance` */

DROP TABLE IF EXISTS `xm_renewal_info_from_insurance`;

CREATE TABLE `xm_renewal_info_from_insurance` (
  `order_no` char(50) NOT NULL DEFAULT '' COMMENT '订单号（当保险公司返回的数据在本地查询不到相应数据时，会用一个UUID填充该字段）',
  `policy_no` char(200) DEFAULT NULL COMMENT '保单号',
  `agent_user_no` char(50) DEFAULT NULL COMMENT '代理人用户ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `product_no` char(50) DEFAULT NULL COMMENT '产品编号',
  `renewal_product_no` char(50) DEFAULT NULL COMMENT '产品编号',
  `renewal_product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `renewal_policy_no` char(200) DEFAULT NULL COMMENT '续保号',
  `renewal_total_prem` decimal(10,2) DEFAULT NULL COMMENT '续保保费',
  `renewal_policy_effective_date` datetime DEFAULT NULL COMMENT '续保保险起始日期',
  `renewal_policy_end_date` datetime DEFAULT NULL COMMENT '续保保险结束日期',
  `applier_name` char(50) DEFAULT NULL COMMENT '投保人姓名',
  `applier_sex` char(10) DEFAULT NULL COMMENT '投保人性别',
  `applier_certification_type` char(10) DEFAULT NULL COMMENT '投保人证件类型',
  `applier_certification_no` char(50) DEFAULT NULL COMMENT '投保人证件号',
  `applier_birthday` char(10) DEFAULT NULL COMMENT '投保人出生年月日',
  `applier_email` char(100) DEFAULT NULL COMMENT '投保人电子邮箱',
  `applier_mobile_no` char(20) DEFAULT NULL COMMENT '投保人手机号',
  `renewal_channel` varchar(20) DEFAULT NULL COMMENT '续保渠道：xrk-在向日葵续保，insurance_com-在保险公司续保',
  `renewal_policy_status` int(2) DEFAULT NULL COMMENT '续保保单状态：0-退保，1-在保',
  `renewal_info_json` mediumtext COMMENT '续保信息json数据',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `seller_no` varchar(50) DEFAULT '' COMMENT '渠道编号',
  `renewal_pay_date` datetime DEFAULT NULL COMMENT '续保缴费日期',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='保险公司渠道续保保单表';

/*Table structure for table `xm_renewal_introduce` */

DROP TABLE IF EXISTS `xm_renewal_introduce`;

CREATE TABLE `xm_renewal_introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_no` varchar(50) DEFAULT NULL COMMENT '公司编号',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `type` int(1) DEFAULT NULL COMMENT '0:统一规则,1:保险公司',
  `operator_name` varchar(50) DEFAULT NULL COMMENT '更新人名称',
  `operator_email` varchar(255) DEFAULT NULL COMMENT '更新人email',
  `is_deleted` int(1) DEFAULT NULL COMMENT '0未删除1删除',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `text` text COMMENT '续保规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_renewal_introduce_files` */

DROP TABLE IF EXISTS `xm_renewal_introduce_files`;

CREATE TABLE `xm_renewal_introduce_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `renewal_introduce_id` int(11) DEFAULT NULL COMMENT '续保推荐表id',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件id',
  `is_deleted` int(1) DEFAULT NULL COMMENT '0未删除1删除',
  `company_no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型：如img,pdf,html,txt''',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_sale_channel` */

DROP TABLE IF EXISTS `xm_sale_channel`;

CREATE TABLE `xm_sale_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcode` varchar(50) DEFAULT NULL COMMENT '父级销售渠道code',
  `sale_channel_type` varchar(50) DEFAULT NULL COMMENT '销售渠道类型，取值：platform=销售平台，channel=具体销售渠道',
  `sale_channel_code` varchar(50) NOT NULL COMMENT '销售渠道代码，唯一索引',
  `sale_channel_name` varchar(100) DEFAULT NULL COMMENT '销售渠道名称',
  `status` int(11) DEFAULT '1' COMMENT '1=正常，0=无效',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `json_config` text COMMENT '其它配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sale_channel_code` (`sale_channel_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='销售渠道定义表';

/*Table structure for table `xm_search_configs` */

DROP TABLE IF EXISTS `xm_search_configs`;

CREATE TABLE `xm_search_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` varchar(50) DEFAULT NULL COMMENT '商品编码',
  `product_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `hot_word` varchar(250) DEFAULT NULL COMMENT '热门词汇',
  `clause_word` varchar(250) DEFAULT NULL COMMENT '保障权益词汇',
  `job_word` varchar(250) DEFAULT NULL COMMENT '职业等级词汇',
  `use_status` int(11) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='搜索配置表';

/*Table structure for table `xm_search_homoionym_configs` */

DROP TABLE IF EXISTS `xm_search_homoionym_configs`;

CREATE TABLE `xm_search_homoionym_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_word` varchar(250) DEFAULT NULL COMMENT '搜索词',
  `search_homoionym` varchar(250) DEFAULT NULL COMMENT '搜索近义词',
  `use_status` int(4) DEFAULT '1' COMMENT '可用状态：-1.逻辑删除，1.可用状态',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型: 1:渠道，2：分类，3：权益，4：产品名称，5：职业',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3344 DEFAULT CHARSET=utf8 COMMENT='搜索近义词配置表';

/*Table structure for table `xm_self_underwriting_bank` */

DROP TABLE IF EXISTS `xm_self_underwriting_bank`;

CREATE TABLE `xm_self_underwriting_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '银行编码',
  `seller_no` varchar(50) DEFAULT NULL COMMENT '渠道编号',
  `product_no` varchar(50) NOT NULL COMMENT '产品编号',
  `single_limit` varchar(100) DEFAULT NULL COMMENT '单笔限额值',
  `day_limit` varchar(100) DEFAULT NULL COMMENT '单日限额值',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT '状态 -1：废弃的 1：可用的',
  PRIMARY KEY (`id`),
  KEY `idx_bank_code` (`bank_code`),
  KEY `idx_seller_no` (`seller_no`),
  KEY `idx_product_no` (`product_no`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='自核保银行信息表';

/*Table structure for table `xm_seller_files` */

DROP TABLE IF EXISTS `xm_seller_files`;

CREATE TABLE `xm_seller_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` varchar(50) NOT NULL COMMENT '进货商编码',
  `file_id` varchar(30) NOT NULL COMMENT '文件id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL,
  `file_status` int(11) NOT NULL DEFAULT '1',
  `alias` varchar(50) DEFAULT NULL COMMENT '文件别名',
  `link_pre_file` varchar(250) DEFAULT NULL COMMENT '追加上级文案的描述语',
  `addition_flag` int(11) NOT NULL DEFAULT '0' COMMENT '追加上级文案的标志：1，追加；0，不追加',
  `extend_param` varchar(255) DEFAULT NULL COMMENT '备注（alias=claim_modal_document时，存储理赔电话tel和理赔跳转链接link的json）',
  PRIMARY KEY (`id`),
  KEY `idx_sf_seller_no` (`seller_no`)
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=utf8 COMMENT='进货商文件信息';

/*Table structure for table `xm_seller_payee_channels` */

DROP TABLE IF EXISTS `xm_seller_payee_channels`;

CREATE TABLE `xm_seller_payee_channels` (
  `seller_no` varchar(50) NOT NULL COMMENT '收款人编码',
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `payee_channel_name` varchar(250) DEFAULT NULL COMMENT '进货商收款渠道名',
  `payee_account` varchar(100) DEFAULT NULL COMMENT '收款账号',
  `json_config` text COMMENT '其它配置信息',
  `order_no` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`seller_no`,`payee_channel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='进货商收款渠道';

/*Table structure for table `xm_seller_payee_channels_20200703` */

DROP TABLE IF EXISTS `xm_seller_payee_channels_20200703`;

CREATE TABLE `xm_seller_payee_channels_20200703` (
  `seller_no` varchar(50) NOT NULL COMMENT '收款人编码',
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `payee_channel_name` varchar(250) DEFAULT NULL COMMENT '进货商收款渠道名',
  `payee_account` varchar(100) DEFAULT NULL COMMENT '收款账号',
  `json_config` text COMMENT '其它配置信息',
  `order_no` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`seller_no`,`payee_channel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='进货商收款渠道';

/*Table structure for table `xm_seller_payee_channels_20200916` */

DROP TABLE IF EXISTS `xm_seller_payee_channels_20200916`;

CREATE TABLE `xm_seller_payee_channels_20200916` (
  `seller_no` varchar(50) NOT NULL COMMENT '收款人编码',
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `payee_channel_name` varchar(250) DEFAULT NULL COMMENT '进货商收款渠道名',
  `payee_account` varchar(100) DEFAULT NULL COMMENT '收款账号',
  `json_config` text COMMENT '其它配置信息',
  `order_no` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`seller_no`,`payee_channel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='进货商收款渠道';

/*Table structure for table `xm_seller_payee_channels_20220518` */

DROP TABLE IF EXISTS `xm_seller_payee_channels_20220518`;

CREATE TABLE `xm_seller_payee_channels_20220518` (
  `seller_no` varchar(50) NOT NULL COMMENT '收款人编码',
  `payee_channel_no` varchar(50) NOT NULL COMMENT '收款渠道编码',
  `payee_channel_name` varchar(250) DEFAULT NULL COMMENT '进货商收款渠道名',
  `payee_account` varchar(100) DEFAULT NULL COMMENT '收款账号',
  `json_config` text COMMENT '其它配置信息',
  `order_no` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`seller_no`,`payee_channel_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货商收款渠道';

/*Table structure for table `xm_sellers` */

DROP TABLE IF EXISTS `xm_sellers`;

CREATE TABLE `xm_sellers` (
  `seller_no` varchar(50) NOT NULL COMMENT '进货商编码',
  `name` varchar(255) DEFAULT NULL COMMENT '进货商名称',
  `server_prefix` varchar(100) DEFAULT NULL COMMENT '适配器服务地址',
  `json_config` text,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '渠道状态：1正常，0下线',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`seller_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='进货商';

/*Table structure for table `xm_send_message_task` */

DROP TABLE IF EXISTS `xm_send_message_task`;

CREATE TABLE `xm_send_message_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL COMMENT '发送短信时间',
  `need_sms` smallint(6) DEFAULT NULL COMMENT '是否需要发送短信1-需要，0-不需要',
  `code` varchar(32) NOT NULL COMMENT 'weixin_costomer-微信客服短信发送',
  `send_result` int(11) DEFAULT NULL COMMENT '0-失败,1-成功',
  `data` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COMMENT='发送信息触发记录表';

/*Table structure for table `xm_sys_products` */

DROP TABLE IF EXISTS `xm_sys_products`;

CREATE TABLE `xm_sys_products` (
  `product_no` varchar(50) NOT NULL,
  `product_name` varchar(355) DEFAULT NULL,
  `company_no` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xm_tag_products` */

DROP TABLE IF EXISTS `xm_tag_products`;

CREATE TABLE `xm_tag_products` (
  `id` char(50) NOT NULL COMMENT '标签商品ID',
  `product_no` varchar(50) NOT NULL COMMENT '商品编码',
  `channel_code` varchar(30) DEFAULT NULL COMMENT '渠道代码',
  `xm_tag_id` char(50) NOT NULL COMMENT '标签ID',
  `weight` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `stop_time` datetime DEFAULT NULL COMMENT '结束时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签商品表';

/*Table structure for table `xm_tags` */

DROP TABLE IF EXISTS `xm_tags`;

CREATE TABLE `xm_tags` (
  `id` char(50) NOT NULL COMMENT '标签ID',
  `channel_code` char(50) NOT NULL COMMENT '渠道代码',
  `name` varchar(50) NOT NULL COMMENT '名字',
  `weight` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签商品表';

/*Table structure for table `xm_tasks` */

DROP TABLE IF EXISTS `xm_tasks`;

CREATE TABLE `xm_tasks` (
  `task_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `seller_no` char(10) DEFAULT NULL COMMENT '进货商编码',
  `biz_code` char(50) DEFAULT NULL COMMENT '任务业务代码',
  `task_status` enum('0','1') DEFAULT '1' COMMENT '任务状态,0:禁用,1:启用',
  `script` text COMMENT '任务脚本',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`task_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_template_file` */

DROP TABLE IF EXISTS `xm_template_file`;

CREATE TABLE `xm_template_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_no` char(50) NOT NULL COMMENT '产品编号',
  `channel_code` char(30) DEFAULT NULL COMMENT '渠道代码',
  `business_scene` char(50) NOT NULL COMMENT '业务场景',
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `url` text COMMENT '模板url',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态：0失效，1正常',
  `version` char(30) DEFAULT NULL COMMENT '文件版本号',
  `note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COMMENT='模板文件表';

/*Table structure for table `xm_templete_documents` */

DROP TABLE IF EXISTS `xm_templete_documents`;

CREATE TABLE `xm_templete_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` varchar(30) NOT NULL COMMENT '文件id',
  `alias` varchar(50) DEFAULT NULL COMMENT '文件别名',
  `use_status` int(11) DEFAULT '1' COMMENT '1.可用状态，-1.逻辑删除',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='模板文案表';

/*Table structure for table `xm_thirdparty_commission` */

DROP TABLE IF EXISTS `xm_thirdparty_commission`;

CREATE TABLE `xm_thirdparty_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_no` varchar(100) NOT NULL COMMENT '合作渠道',
  `product_no` char(50) NOT NULL COMMENT '商品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `use_status` int(11) NOT NULL COMMENT '状态： -1 删除 1 可用',
  `nature` int(11) NOT NULL COMMENT '佣金性质 1：税前 2：税后',
  `quota_condition_type` varchar(100) DEFAULT NULL COMMENT '佣金额度条件 1 ：不设定条件 2：缴费期限 3：职业类别 4：保障额度 5：被保人年龄 6：计划名',
  `quota_condition_content` varchar(255) NOT NULL COMMENT '佣金额度条件内容',
  `first_commission` varchar(50) NOT NULL COMMENT '首年佣金比例',
  `second_commission` varchar(50) DEFAULT NULL COMMENT '次年佣金比例',
  `third_commission` varchar(50) DEFAULT NULL COMMENT '第三年佣金比例',
  `four_commission` varchar(50) DEFAULT NULL COMMENT '第四年佣金比例',
  `five_commission` varchar(50) DEFAULT NULL COMMENT '第五年佣金比例',
  `six_commission` varchar(50) DEFAULT NULL COMMENT '第六年佣金比例（预留）',
  `seven_commission` varchar(50) DEFAULT NULL COMMENT '第七年佣金比例（预留）',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `effect_time` datetime NOT NULL COMMENT '生效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  `front_commission` varchar(500) DEFAULT '' COMMENT '前面几年的佣金比例，用","分割',
  `latter_commission` varchar(500) DEFAULT '' COMMENT '后面每年的佣金比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_thirdparty_history_commission` */

DROP TABLE IF EXISTS `xm_thirdparty_history_commission`;

CREATE TABLE `xm_thirdparty_history_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_id` int(11) NOT NULL COMMENT '佣金id',
  `seller_no` varchar(100) NOT NULL COMMENT '合作渠道',
  `product_no` char(50) NOT NULL COMMENT '商品编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `nature` int(11) NOT NULL COMMENT '佣金性质 1：税前 2：税后',
  `quota_condition_type` varchar(100) DEFAULT NULL COMMENT '佣金额度条件 1 ：不设定条件 2：缴费期限 3：职业类别 4：保障额度 5：被保人年龄 6：计划名',
  `quota_condition_content` varchar(255) NOT NULL COMMENT '佣金额度条件内容',
  `first_commission` varchar(50) NOT NULL COMMENT '首年佣金比例',
  `second_commission` varchar(50) DEFAULT NULL COMMENT '次年佣金比例',
  `third_commission` varchar(50) DEFAULT NULL COMMENT '第三年佣金比例',
  `four_commission` varchar(50) DEFAULT NULL COMMENT '第四年佣金比例',
  `five_commission` varchar(50) DEFAULT NULL COMMENT '第五年佣金比例',
  `six_commission` varchar(50) DEFAULT NULL COMMENT '第六年佣金比例（预留）',
  `seven_commission` varchar(50) DEFAULT NULL COMMENT '第七年佣金比例（预留）',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `effect_time` datetime NOT NULL COMMENT '生效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  `front_commission` varchar(500) DEFAULT '' COMMENT '前面几年的佣金比例，用","分割',
  `latter_commission` varchar(500) DEFAULT '' COMMENT '后面每年的佣金比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_underwriting_components` */

DROP TABLE IF EXISTS `xm_underwriting_components`;

CREATE TABLE `xm_underwriting_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '组件编码',
  `name` varchar(64) DEFAULT NULL COMMENT '组件名称',
  `class_name` varchar(128) DEFAULT NULL COMMENT '组件类全名（包含包名）',
  `call_method` varchar(64) DEFAULT NULL COMMENT '组件类调用方法',
  `instance_name` varchar(64) NOT NULL COMMENT '组件实例名称',
  `mathod_params` varchar(512) DEFAULT NULL COMMENT '所需参数列表，以英文逗号分隔',
  `exec_sequence` int(11) DEFAULT NULL COMMENT '执行顺序',
  `use_scope` varchar(32) NOT NULL COMMENT '使用范围：personal_all-全部个险产品自动使用；product-按产品配置使用；其它扩展',
  `status` tinyint(4) DEFAULT '0' COMMENT '0-有效，1-无效',
  `remark` varchar(1024) DEFAULT NULL COMMENT '组件详细说明',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_underwriting_scope_sts_seq` (`use_scope`,`status`,`exec_sequence`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='核保组件定义表';

/*Table structure for table `xm_underwriting_rule_details` */

DROP TABLE IF EXISTS `xm_underwriting_rule_details`;

CREATE TABLE `xm_underwriting_rule_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(1) NOT NULL COMMENT '关联xm_underwriting_rules表 id的外键',
  `type` varchar(50) NOT NULL COMMENT '类型，limit：限制，exclude：排除',
  `content` varchar(50) NOT NULL COMMENT '内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态：0无效，1有效',
  `desc` text COMMENT '描述',
  `creator` varchar(250) DEFAULT NULL COMMENT '创建人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='核保规则配置详情表';

/*Table structure for table `xm_underwriting_rules` */

DROP TABLE IF EXISTS `xm_underwriting_rules`;

CREATE TABLE `xm_underwriting_rules` (
  `product_no` varchar(50) DEFAULT NULL,
  `is_limit_series` tinyint(1) NOT NULL COMMENT '是否限制系列产品',
  `is_limit_coverage` tinyint(1) NOT NULL COMMENT '是否按责任险种限制',
  `is_limit_count` tinyint(1) NOT NULL COMMENT '是否限制份数',
  `limit_count` int(10) NOT NULL COMMENT '限制份数',
  `is_limit_amount` tinyint(1) NOT NULL COMMENT '是否限制保额',
  `limit_amount` decimal(10,2) NOT NULL COMMENT '限制保额',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态：0无效，1有效',
  `desc` text COMMENT '描述',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_scene` varchar(50) NOT NULL DEFAULT 'product_no' COMMENT '规则场景,按照产品编号product_no, 按照商品品类product_category',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='核保规则配置表';

/*Table structure for table `xm_union_pay_infos` */

DROP TABLE IF EXISTS `xm_union_pay_infos`;

CREATE TABLE `xm_union_pay_infos` (
  `order_id` char(32) NOT NULL COMMENT '银联支付下单号,使用UUID',
  `order_no` char(50) NOT NULL COMMENT '支付订单号',
  `pay_status` int(2) NOT NULL COMMENT '支付状态 0：支付中,1：支付成功, 2:支付失败',
  `pay_amount` decimal(12,2) NOT NULL COMMENT '支付金额',
  `acc_no` char(25) NOT NULL COMMENT '银行卡号',
  `bank_name` char(100) NOT NULL COMMENT '银行名称',
  `acc_name` char(20) NOT NULL COMMENT '持卡人姓名',
  `phone` char(20) NOT NULL COMMENT '持卡人手机号',
  `certif_type` char(2) NOT NULL COMMENT '持卡人证件类型 01：身份证 02：军官证 03：护照 04：回乡证 05：台胞证 06：警官证 07：士兵证 99：其它证件',
  `certif_no` char(25) NOT NULL COMMENT '持卡人证件号码',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `query_id` char(50) DEFAULT NULL COMMENT '银联返回的查询交易进度的查询ID',
  `pay_resp_msg` varchar(1000) DEFAULT NULL,
  `pay_resp_time` datetime DEFAULT NULL COMMENT '银联回调时间',
  `query_time` datetime DEFAULT NULL COMMENT '交易查询时间',
  `query_result_msg` varchar(1000) DEFAULT NULL COMMENT '交易查询结果',
  `query_times` int(2) NOT NULL DEFAULT '0' COMMENT '查询交易进度的查询次数',
  `query_status` int(2) NOT NULL DEFAULT '0' COMMENT '查询状态 0:未查询,1:查询中',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `xm_unionpay_banks` */

DROP TABLE IF EXISTS `xm_unionpay_banks`;

CREATE TABLE `xm_unionpay_banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL COMMENT '银行名称',
  `code` char(50) DEFAULT NULL COMMENT '银行编码',
  `type` int(2) NOT NULL COMMENT '0:借记卡/1:存折/2:信用卡',
  `single_limit` decimal(12,2) NOT NULL COMMENT '单笔限额 -1表无限额',
  `cumulative_limit` decimal(12,2) NOT NULL COMMENT '累计限额 -1表无限额',
  `order_no` int(3) DEFAULT NULL COMMENT '排序号',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='银联银行卡信息表';

/*Table structure for table `xm_unionpay_bills` */

DROP TABLE IF EXISTS `xm_unionpay_bills`;

CREATE TABLE `xm_unionpay_bills` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '自动递增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `txn_code` varchar(20) DEFAULT NULL COMMENT '交易代码',
  `acq_ins_code` varchar(50) DEFAULT NULL COMMENT '代理机构标识码',
  `trace_no` varchar(50) DEFAULT NULL COMMENT '系统跟踪号',
  `txn_time` datetime DEFAULT NULL COMMENT '交易传输时间',
  `pay_card_no` varchar(50) DEFAULT NULL COMMENT '帐号',
  `txn_amt` decimal(12,2) DEFAULT NULL COMMENT '交易金额',
  `mer_cat_code` varchar(20) DEFAULT NULL COMMENT '商户类别',
  `term_type` varchar(20) DEFAULT NULL COMMENT '终端类型',
  `query_id` varchar(50) DEFAULT NULL COMMENT '查询流水号',
  `order_id` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `pay_card_type` varchar(20) DEFAULT NULL COMMENT '支付卡类型',
  `base_txn_time` varchar(50) DEFAULT NULL COMMENT '原始交易日期时间',
  `merchant_fee` varchar(50) DEFAULT NULL COMMENT '商户手续费',
  `settlement_amount` varchar(50) DEFAULT NULL COMMENT '结算金额',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `txn_type` varchar(20) DEFAULT NULL COMMENT '交易类型',
  `txn_sub_type` varchar(20) DEFAULT NULL COMMENT '交易子类',
  `biz_type` varchar(20) DEFAULT NULL COMMENT '业务类型',
  `acc_type` varchar(20) DEFAULT NULL COMMENT '帐号类型',
  `bill_type` varchar(20) DEFAULT NULL COMMENT '账单类型',
  `bill_no` varchar(50) DEFAULT NULL COMMENT '账单号码',
  `interact_mode` varchar(20) DEFAULT NULL COMMENT '交互方式',
  `orig_qry_id` varchar(50) DEFAULT NULL COMMENT '原交易查询流水号',
  `mer_id` varchar(50) DEFAULT NULL COMMENT '商户代码',
  `sub_mer_id` varchar(50) DEFAULT NULL COMMENT '二级商户代码',
  `sub_mer_abbr` varchar(50) DEFAULT NULL COMMENT '二级商户简称',
  `term_id` varchar(20) DEFAULT NULL COMMENT '终端号',
  `mer_reserved` varchar(200) DEFAULT NULL COMMENT '商户自定义域',
  `settle_date` datetime DEFAULT NULL COMMENT '清算日期',
  PRIMARY KEY (`id`),
  KEY `ix_upbills_order_id` (`order_id`) USING BTREE,
  KEY `ix_upbills_settle_date` (`settle_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=738 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_user_infos` */

DROP TABLE IF EXISTS `xm_user_infos`;

CREATE TABLE `xm_user_infos` (
  `id` varchar(50) NOT NULL COMMENT '用户ID',
  `name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(250) DEFAULT NULL COMMENT '用户头像',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 1: 正常 0: 锁定',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='C端用户';

/*Table structure for table `xm_user_subaccounts` */

DROP TABLE IF EXISTS `xm_user_subaccounts`;

CREATE TABLE `xm_user_subaccounts` (
  `id` varchar(50) NOT NULL COMMENT '用户ID',
  `subaccount_id` varchar(50) DEFAULT NULL COMMENT '用户子账号ID',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '0: 锁定 1: 正常',
  `refresh_token` varchar(250) DEFAULT NULL COMMENT '后台刷新token',
  `account_type` int(11) NOT NULL DEFAULT '0' COMMENT '0: 微信用户 1: mysso 2: 新浪微博 3: 腾讯微博 4: 豆瓣 5: ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户绑定账号信息';

/*Table structure for table `xm_users` */

DROP TABLE IF EXISTS `xm_users`;

CREATE TABLE `xm_users` (
  `id` varchar(50) NOT NULL COMMENT '分销平台用户ID',
  `loginname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '0: 锁定 1: 正常',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户中心';

/*Table structure for table `xm_wallet_authorizations` */

DROP TABLE IF EXISTS `xm_wallet_authorizations`;

CREATE TABLE `xm_wallet_authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `uid` varchar(50) DEFAULT '' COMMENT '用户ID，一般指SSOID',
  `payid` char(30) DEFAULT NULL COMMENT '钱包交易号',
  `item_no` varchar(50) DEFAULT NULL COMMENT '授权项编码',
  `item_name` varchar(255) DEFAULT NULL COMMENT '授权项名称',
  `trade_no` char(50) DEFAULT NULL COMMENT '交易编号',
  `trade_amount` decimal(10,2) DEFAULT NULL COMMENT '交易金额，单位为元',
  `auth_type` varchar(50) DEFAULT NULL COMMENT '授权类型，对应钱包resource_channel',
  `auth_amount` decimal(10,2) DEFAULT NULL COMMENT '授权金额，单位为元',
  `auth_status` smallint(6) DEFAULT '0' COMMENT '授权状态，0失败，1成功',
  `auth_result` varchar(255) DEFAULT NULL COMMENT '授权结果，主要记录失败结果',
  `sys_id` int(11) DEFAULT NULL COMMENT '体系ID',
  `sys_name` varchar(50) DEFAULT NULL COMMENT '体系名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_xm_wallet_authorizations_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=74805 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_weixin_bills` */

DROP TABLE IF EXISTS `xm_weixin_bills`;

CREATE TABLE `xm_weixin_bills` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '自动递增主键',
  `downloaded_at` datetime DEFAULT NULL COMMENT '下载下来时的时刻',
  `bill_time` datetime(6) DEFAULT NULL COMMENT '交易时间',
  `appid` varchar(50) DEFAULT NULL COMMENT '公众账号ID',
  `mchid` varchar(50) DEFAULT NULL COMMENT '商户号',
  `sub_mchid` varchar(50) DEFAULT NULL COMMENT '子商户号',
  `device_info` varchar(50) DEFAULT NULL COMMENT '设备号',
  `payid` varchar(50) DEFAULT NULL COMMENT '微信订单号',
  `order_no` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `cuserid` varchar(50) DEFAULT NULL COMMENT '用户标识',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '交易类型',
  `pay_status` varchar(20) DEFAULT NULL COMMENT '交易状态',
  `pay_bank` varchar(50) DEFAULT NULL COMMENT '付款银行',
  `money_kind` varchar(10) DEFAULT NULL COMMENT '货币种类',
  `total_money` decimal(12,2) DEFAULT NULL COMMENT '总金额',
  `red_money` decimal(12,2) DEFAULT NULL COMMENT '企业红包金额',
  `refund_weixin_no` varchar(50) DEFAULT NULL COMMENT '微信退款单号',
  `refund_mch_no` varchar(50) DEFAULT NULL COMMENT '商户退款单号',
  `refund_money` decimal(12,2) DEFAULT NULL COMMENT '退款金额',
  `refund_red_money` decimal(12,2) DEFAULT NULL COMMENT '企业红包退款金额',
  `refund_type` varchar(30) DEFAULT NULL COMMENT '退款类型',
  `refund_status` varchar(20) DEFAULT NULL COMMENT '退款状态',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `mch_data` varchar(200) DEFAULT NULL COMMENT '商户数据包',
  `poundage` decimal(12,5) DEFAULT NULL COMMENT '手续费',
  `rate` decimal(6,4) DEFAULT NULL COMMENT '费率',
  PRIMARY KEY (`id`),
  KEY `ix_wxbills_payid` (`payid`) USING BTREE,
  KEY `ix_wxbills_order_no` (`order_no`) USING BTREE,
  KEY `ix_wxbills_time` (`bill_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;

/*Table structure for table `xm_white_lists` */

DROP TABLE IF EXISTS `xm_white_lists`;

CREATE TABLE `xm_white_lists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `list_type` enum('white','black') NOT NULL COMMENT '名单类型',
  `object_type` char(50) DEFAULT NULL COMMENT '类型',
  `object_name` char(20) DEFAULT NULL COMMENT '类型名称',
  `object_no_type` char(30) DEFAULT NULL COMMENT '单号类型',
  `object_no` varchar(50) DEFAULT NULL COMMENT '白名单号',
  `name` char(50) DEFAULT NULL COMMENT '姓名',
  `phone` char(30) DEFAULT NULL COMMENT '手机号码',
  `risk_type` char(200) DEFAULT NULL COMMENT '风险类型',
  `reject_reason` varchar(8000) DEFAULT NULL COMMENT '拒绝原因',
  `reject_company` char(50) DEFAULT NULL COMMENT '拒绝公司',
  `reject_product_no` char(50) DEFAULT NULL COMMENT '拒绝产品',
  `forward_product_no` char(50) DEFAULT NULL COMMENT '转投产品',
  `status` int(11) DEFAULT '1' COMMENT '状态：1生效，0失效',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  `danger_lev_id` int(11) DEFAULT NULL COMMENT '风险类型ID',
  `danger_lev_name` varchar(255) DEFAULT NULL COMMENT '风险类型名称',
  `operator` varchar(250) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2378 DEFAULT CHARSET=utf8 COMMENT='白名单表';