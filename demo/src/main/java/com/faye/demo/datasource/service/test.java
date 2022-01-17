package com.faye.demo.datasource.service;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/14
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class test {

    @Autowired
    private ProductSampleNeedMapper mapper;

    @Test
    public void test(){
        Long id = mapper.selectByPrimaryKey(1L);
        System.out.println();
    }

}
