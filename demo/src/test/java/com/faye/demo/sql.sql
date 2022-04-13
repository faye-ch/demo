#首页柱状图统计
#2022-4-4
#####################################################################################################################
#reset query cache;
#EXPLAIN
SELECT
a.fk_student_offer_item_step_id,
a1.step_name,
COUNT(a.fk_student_id) student_count,
SUM(a.offer_item_per_student_step) offer_item_count

FROM (
	SELECT a.fk_student_offer_item_step_id, a.fk_student_id, COUNT(a.id) offer_item_per_student_step

	FROM get_sale_center.m_student_offer_item a
	INNER JOIN (
			SELECT DISTINCT a.id FROM (
				#父子代理的BD权限，儿子下面的学生，父亲的BD，第一层的权限
				SELECT a.id FROM get_sale_center.m_student_offer_item a
				INNER JOIN get_sale_center.r_student_agent b ON a.fk_student_id=b.fk_student_id AND b.is_active=1
				INNER JOIN get_sale_center.m_agent c ON b.fk_agent_id=c.id AND c.fk_parent_agent_id IS NOT NULL #第一层，儿子下面的学生
				INNER JOIN get_sale_center.r_agent_staff d ON c.fk_parent_agent_id=d.fk_agent_id AND d.is_active=1 AND d.fk_staff_id IN(51,54,55,56,57,58,59,60,61,62,71,72,73,73,74,74,74,75,75,75,75,76,76,76,77,77,77,78,78,78,79,80,80,80,81,81,81,82,82,82,83,83,83,84,84,84,85,85,85,86,86,86,87,87,87,88,88,88,89,89,89,90,90,90,91,91,91,92,92,92,93,93,93,96,96,98,98,98,99,99,99,99,100,100,100,101,101,101,102,102,103,103,104,104,726,783,783,783,784,784,784,848) #第一层，父亲的BD
				UNION ALL
				#父子代理的BD权限，儿子下面的学生，父亲的BD，第二层的权限
				SELECT a.id FROM get_sale_center.m_student_offer_item a
				INNER JOIN get_sale_center.r_student_agent b ON a.fk_student_id=b.fk_student_id AND b.is_active=1
				INNER JOIN get_sale_center.m_agent c ON b.fk_agent_id=c.id AND c.fk_parent_agent_id IS NOT NULL #第二层，儿子下面的学生
				INNER JOIN get_sale_center.m_agent d ON c.fk_parent_agent_id=d.id AND d.fk_parent_agent_id IS NOT NULL #第二层的父亲，对应第一层的儿子
				INNER JOIN get_sale_center.r_agent_staff e ON d.fk_parent_agent_id=e.fk_agent_id AND e.is_active=1 AND e.fk_staff_id IN(51,54,55,56,57,58,59,60,61,62,71,72,73,73,74,74,74,75,75,75,75,76,76,76,77,77,77,78,78,78,79,80,80,80,81,81,81,82,82,82,83,83,83,84,84,84,85,85,85,86,86,86,87,87,87,88,88,88,89,89,89,90,90,90,91,91,91,92,92,92,93,93,93,96,96,98,98,98,99,99,99,99,100,100,100,101,101,101,102,102,103,103,104,104,726,783,783,783,784,784,784,848)#第一层，父亲的BD
				UNION ALL
				#BD的权限
				SELECT a.id FROM get_sale_center.m_student_offer_item a
				INNER JOIN get_sale_center.r_student_agent b ON a.fk_student_id=b.fk_student_id AND b.is_active = 1
				INNER JOIN get_sale_center.r_agent_staff c ON b.fk_agent_id=c.fk_agent_id AND c.is_active = 1 AND c.fk_staff_id IN(51,54,55,56,57,58,59,60,61,62,71,72,73,73,74,74,74,75,75,75,75,76,76,76,77,77,77,78,78,78,79,80,80,80,81,81,81,82,82,82,83,83,83,84,84,84,85,85,85,86,86,86,87,87,87,88,88,88,89,89,89,90,90,90,91,91,91,92,92,92,93,93,93,96,96,98,98,98,99,99,99,99,100,100,100,101,101,101,102,102,103,103,104,104,726,783,783,783,784,784,784,848,0,1,1,1,1,1)
				UNION ALL
				#项目成员的权限
				SELECT a.id FROM get_sale_center.m_student_offer_item a
				INNER JOIN get_sale_center.s_student_project_role_staff b ON a.fk_student_offer_id=b.fk_table_id AND b.fk_table_name='m_student_offer' AND b.is_active=1 AND b.fk_staff_id IN(51,54,55,56,57,58,59,60,61,62,71,72,73,73,74,74,74,75,75,75,75,76,76,76,77,77,77,78,78,78,79,80,80,80,81,81,81,82,82,82,83,83,83,84,84,84,85,85,85,86,86,86,87,87,87,88,88,88,89,89,89,90,90,90,91,91,91,92,92,92,93,93,93,96,96,98,98,98,99,99,99,99,100,100,100,101,101,101,102,102,103,103,104,104,726,783,783,783,784,784,784,848)
				UNION ALL
				#申请计划对应的申请方案创建人的权限
				SELECT a.id FROM get_sale_center.m_student_offer_item a
				INNER JOIN get_sale_center.m_student_offer b ON a.fk_student_offer_id=b.id
				INNER JOIN get_permission_center.m_staff c ON b.gmt_create_user=c.login_id AND c.id IN(51,54,55,56,57,58,59,60,61,62,71,72,73,73,74,74,74,75,75,75,75,76,76,76,77,77,77,78,78,78,79,80,80,80,81,81,81,82,82,82,83,83,83,84,84,84,85,85,85,86,86,86,87,87,87,88,88,88,89,89,89,90,90,90,91,91,91,92,92,92,93,93,93,96,96,98,98,98,99,99,99,99,100,100,100,101,101,101,102,102,103,103,104,104,726,783,783,783,784,784,784,848)
			) a
		) z ON a.id=z.id

	#国家的过滤条件
	INNER JOIN get_sale_center.m_student b ON a.fk_student_id=b.id AND b.fk_company_id IN(2)

	#项目成员的过滤条件
	#INNER JOIN (
	#	SELECT a.fk_table_id
	#	FROM get_sale_center.s_student_project_role_staff a
	#	WHERE a.fk_table_name='m_student_offer' AND a.is_active=1 AND a.fk_staff_id IN(736,135)
	#	GROUP BY a.fk_table_id
	#) c ON a.fk_student_offer_id = c.fk_table_id

	#BD名称中英+bd编号的过滤条件
	#INNER JOIN (
	#	SELECT a.id FROM get_permission_center.m_staff a
	#	LEFT JOIN get_sale_center.r_staff_bd_code b ON a.id=b.fk_staff_id
	#	WHERE a.`name` LIKE('%陈%') OR a.name_en LIKE('%Ted%') OR b.bd_code LIKE('%001%')
	#) d ON a.fk_staff_id=d.id

	WHERE 1=1
	#权限国家过滤
	#AND a.fk_student_offer_item_step_id IS NOT NULL
	AND a.is_follow=0
	AND a.fk_area_country_id IN(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53)

	#AND a.gmt_create>='2021-1-1' AND a.gmt_create<'2022-1-1'
	#AND a.fk_area_country_id IN(1,2,3)

	GROUP BY a.fk_student_offer_item_step_id, a.fk_student_id
) a
LEFT JOIN get_sale_center.u_student_offer_item_step a1 ON a.fk_student_offer_item_step_id = a1.id
GROUP BY a.fk_student_offer_item_step_id
ORDER BY a1.step_order
;

