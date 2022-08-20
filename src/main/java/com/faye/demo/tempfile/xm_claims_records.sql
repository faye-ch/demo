
create table `xm_claims_records`(
    `id` int(11) not null AUTO_INCREMENT,
    `seller_no` char(50) not null comment '保险公司编号',
    `policy_no` char(50) not null comment '保单号',
    `regist_no` char(50) default null comment '报案号',
    `customer_unique_ident_no` char(50) default null comment '客户唯一识别号(小保单号)',
    `report_date` datetime default null comment '报案时间',
    `cancel_date` datetime default null comment '注销报案时间',
    `cancel_reason` text  default null comment '报案注销原因',
    `damage_date` datetime default null comment '出险时间',
    `damage_address` varchar(50) default null comment '出险地区',
    `damage_code`  varchar(50) default null comment '出险原因代码',
    `damage_name` varchar(500) default null comment '出险原因名称',
    `claim_date` datetime default null comment '立案时间',
    `deny_date` datetime default null comment '拒赔时间',
    `deny_reason`  text default null comment '拒赔原因',
    `end_case_date` datetime default null comment '结案时间',
    `case_type` int(11) default null comment '案件状态:0报案成功; 1报案注销; 2立案注销; 3拒赔; 4结案; 6立案未结案;7不予受理',
    `case_conclusion` varchar(50) default null comment '案件结论:1正常赔付;7通融赔付;99其他',
    `sum_paid` decimal(10,2) DEFAULT NULL comment '案件赔付金额',
    `kind_info_list` mediumtext default null comment '保险json信息',
    `hos_info_list` mediumtext default null comment '医院json信息',
    `desease_info_list` mediumtext default null comment '疾病json信息',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `policy_no`(`policy_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道理赔记录'
