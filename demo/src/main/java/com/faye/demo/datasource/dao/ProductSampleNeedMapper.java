package com.faye.demo.datasource.dao;

import com.faye.demo.datasource.entity.ProductSampleNeed;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface ProductSampleNeedMapper {
    int insert(ProductSampleNeed record);

    int insertSelective(ProductSampleNeed record);

    ProductSampleNeed selectById(@Param("id") Long id);

    List<ProductSampleNeed> selectJoin();

    List<ProductSampleNeed> selectOneTable();

    void batchInsert(@Param("list") Collection<ProductSampleNeed> list);

    ProductSampleNeed getById(@Param("id") Long id);
}