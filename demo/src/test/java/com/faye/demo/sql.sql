


        SELECT document.`images` AS img,meeting.`design_product_sn` AS designProductSn,
        job.`dev_mode` AS devMode,meeting.`order_status` AS orderStatus,.color_name AS colorName,
        skc.`quantity` AS orderNum,log.`created_by` AS operator,
        log.`gmt_created` AS DATE,pool.repair_boom AS  repairBoom,
        meeting.category_id AS categoryId,meeting.meeting_summary_id AS meetingSummaryId,
        job.id AS designJobPoolId,meeting.design_product_main_id AS designProductId,
        job.summary_id AS summaryId ,design.sample_product_id AS sampleProductId,
        meeting.id AS productMeetingId,log.old_color_option_id AS oldColorOptionId,opt.name AS oldColorName
        FROM
        product_follow_order_meeting_product_main AS meeting
        LEFT JOIN product_follow_design_product_document AS document
        ON document.design_product_main_id = meeting.design_product_main_id
        LEFT JOIN product_follow_design_product_main AS design
        ON meeting.design_product_main_id = design.id
        LEFT JOIN product_follow_design_job_pool AS job
        ON job.`design_product_sn` = meeting.`design_product_sn`
        LEFT JOIN product_follow_order_meeting_product_color AS skc
        ON skc.`order_meeting_product_id` = meeting.`id`
        LEFT JOIN `product_follow_design_product_color` AS color
        ON color.id = skc.design_product_color_id
        LEFT JOIN product_ordering_product_pool AS pool
        ON pool.design_color_id = color.id
        LEFT JOIN product_follow_order_meeting_product_color_log log
        ON log.meeting_color_id = skc.id
        LEFT JOIN product_base_option_detail opt1
        ON log.color_option_id = opt1
        LEFT JOIN product_base_option_detail opt2
        ON log.old_color_option_id = opt2.id
        WHERE meeting.id = 2077
        ORDER BY log.created_by