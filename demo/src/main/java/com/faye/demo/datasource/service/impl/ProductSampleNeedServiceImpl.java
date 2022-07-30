package com.faye.demo.datasource.service.impl;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.dbswitch.Db;
import com.faye.demo.datasource.dbswitch.DbType;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import com.faye.demo.datasource.service.api.IProductSampleNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/14
 **/
@Service
public class ProductSampleNeedServiceImpl  implements IProductSampleNeedService {
    
    @Autowired
    private ProductSampleNeedMapper mapper;

    @Db(value = DbType.SLAVE)
    @Override
    public ProductSampleNeed getById(Long id) {
        ProductSampleNeed need = null;
        try{
            need = mapper.getById(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return need;
    }

    @Override
    @Db(value = DbType.SLAVE)
    public List<ProductSampleNeed> getByList() {
        return mapper.selectOneTable();
    }
}
