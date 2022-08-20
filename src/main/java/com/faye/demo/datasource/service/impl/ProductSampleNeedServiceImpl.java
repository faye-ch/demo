package com.faye.demo.datasource.service.impl;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.dbswitch.Db;
import com.faye.demo.datasource.dbswitch.DbType;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import com.faye.demo.datasource.service.api.IProductSampleNeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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

    @Override
    public void insert() {
        ProductSampleNeed build = build();
        
    }

    private ProductSampleNeed build() {
        Date now = new Date();
        ProductSampleNeed need = new ProductSampleNeed();
        need.setSupplierServiceCategory(1L);
        need.setStatus(1);
        need.setRelationSampleProductLimit(1);
        need.setOwnerUserId(1L);
        need.setName("faye");
        need.setModifiedBy("faye");
        need.setImage("faye");
        need.setId(null);
        need.setGmtModified(now);
        need.setGmtCreated(now);
        need.setEndTime(now);
        need.setDetail("faye");
        need.setCreatedBy("faye");
        need.setBusinessUnitId(1L);
        need.setBeginTime(now);
        return need;
    }
}
