package com.faye.demo.datasource.service;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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

    public static void main(String[] args)throws Exception {
        ProductSampleNeed need1 = new ProductSampleNeed();
        need1.setId(1L);
        need1.setGmtCreated(new Date());
        Thread.sleep(1000);
        ProductSampleNeed need2 = new ProductSampleNeed();
        need2.setId(2L);
        need2.setGmtCreated(new Date());
        List<ProductSampleNeed> list = Lists.newArrayList();
        list.add(need2);
        list.add(need1);
        List<ProductSampleNeed> list2 = list.stream().sorted(Comparator.comparing(ProductSampleNeed::getGmtCreated)
                .reversed()).collect(Collectors.toList());
        System.out.println();
    }

}
