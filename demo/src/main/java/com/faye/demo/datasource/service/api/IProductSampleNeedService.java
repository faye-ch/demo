package com.faye.demo.datasource.service.api;

import com.faye.demo.datasource.entity.ProductSampleNeed;

import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/14
 **/
public interface IProductSampleNeedService {

    ProductSampleNeed getById(Long id);

    List<ProductSampleNeed> getByList();

}
