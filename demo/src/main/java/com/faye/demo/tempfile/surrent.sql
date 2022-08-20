
create table xm_email_job(
    `id` int(11) not null AUTO_INCREMENT,
    `policy_no` char(50) not null comment '保单号',
    `order_no` char(50) not null comment '订单号',
    `status` int(11) not null comment '发送状态:0-未发送 1-已发送',
    `type`  int(11) not null comment '业务类型:0-退保通知',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY(`id`),
    KEY `policy_no`(`policy_no`),
    KEY `order_no`(`order_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件发送任务'