package com.faye.demo.datasource.dao;

import com.faye.demo.datasource.entity.ProductSampleNeed;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductSampleNeedMapper {

    Long selectByPrimaryKey(@Param("id") Long id);
}