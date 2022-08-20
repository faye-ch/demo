package com.faye.demo.datasource.service.impl;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class SpringTransactional {
    
    @Autowired
    private ProductSampleNeedMapper mapper;
    @Autowired
    private SpringTransactional service;
    
    public void insert(){
        service.doubleInsert();
        if (true){
            throw new RuntimeException();
        }
        ProductSampleNeed build = build();
        mapper.insert(build);
    }
    
    @Transactional
    public void doubleInsert(){
        ProductSampleNeed need1 = build();
        ProductSampleNeed need2 = build();
        mapper.insert(need1);
        mapper.insert(need2);
        
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
