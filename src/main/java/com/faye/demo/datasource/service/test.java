package com.faye.demo.datasource.service;

import com.faye.demo.datasource.dao.ProductSampleNeedMapper;
import com.faye.demo.datasource.entity.ProductSampleNeed;
import com.faye.demo.datasource.service.api.IProductSampleNeedService;
import com.google.common.collect.Lists;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/14
 **/
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class test {
    
    @Autowired
    private ProductSampleNeedMapper mapper;
    @Autowired
    private IProductSampleNeedService service;
    
    @Test
    public void selectTest(){
        long begin = System.currentTimeMillis();
        List<ProductSampleNeed> list = mapper.selectJoin();
        System.out.println();
        long end = System.currentTimeMillis();
        System.out.println(end-begin);
    }

    @Test
    public void selectV2Test(){
        long begin = System.currentTimeMillis();
        List<ProductSampleNeed> list = mapper.selectOneTable();
        List<ProductSampleNeed> list1 = mapper.selectOneTable();
        List<ProductSampleNeed> list2 = mapper.selectOneTable();
        List<ProductSampleNeed> list3 = mapper.selectOneTable();
        List<ProductSampleNeed> list4 = mapper.selectOneTable();
        long end1 = System.currentTimeMillis();
        System.out.println(end1-begin);
        Map<Long, ProductSampleNeed> map2 = list1.stream().collect(Collectors.toMap(v -> v.getId(), v -> v));
        Map<Long, ProductSampleNeed> map3 = list2.stream().collect(Collectors.toMap(v -> v.getId(), v -> v));
        Map<Long, ProductSampleNeed> map4 = list3.stream().collect(Collectors.toMap(v -> v.getId(), v -> v));
        Map<Long, ProductSampleNeed> map5 = list4.stream().collect(Collectors.toMap(v -> v.getId(), v -> v));

        for (ProductSampleNeed need : list) {
            ProductSampleNeed need1 = map2.get(need.getId());
            ProductSampleNeed need2 = map3.get(need.getId());
            ProductSampleNeed need3 = map4.get(need.getId());
            ProductSampleNeed need4 = map5.get(need.getId());
            need.setBeginTime(need1.getBeginTime());
            need.setBusinessUnitId(need2.getBusinessUnitId());
            need.setDetail(need3.getDetail());
            need.setImage(need4.getImage());
        }
        long end = System.currentTimeMillis();
        System.out.println(end-begin);
    }
    
    @Test
    public void selectOneTime()throws Exception{
        long begin = System.currentTimeMillis();
        ThreadPoolExecutor taskExecutor = new ThreadPoolExecutor(1,5,3, 
                TimeUnit.SECONDS,new ArrayBlockingQueue<Runnable>(3));
        
        Future<List<ProductSampleNeed>> future = taskExecutor.submit(() -> mapper.selectOneTable());
        System.out.println(System.currentTimeMillis()-begin);
        Future<List<ProductSampleNeed>> future1 = taskExecutor.submit(() -> mapper.selectOneTable());
        System.out.println(System.currentTimeMillis()-begin);
        Future<List<ProductSampleNeed>> future2 = taskExecutor.submit(() -> mapper.selectOneTable());
        System.out.println(System.currentTimeMillis()-begin);
        Future<List<ProductSampleNeed>> future3 = taskExecutor.submit(() -> mapper.selectOneTable());
        System.out.println(System.currentTimeMillis()-begin);
        List<ProductSampleNeed> list1 = future.get();
        System.out.println(System.currentTimeMillis()-begin);
        List<ProductSampleNeed> list2 = future1.get();
        System.out.println(System.currentTimeMillis()-begin);
        List<ProductSampleNeed> list3 = future2.get();
        System.out.println(System.currentTimeMillis()-begin);
        List<ProductSampleNeed> list4 = future3.get();
        long end = System.currentTimeMillis();
        System.out.println(end-begin);
    }
    
    @Test
    public void batchInsert(){
        long begin = System.currentTimeMillis();
        for (int i = 0; i < 1000; i++) {
            ProductSampleNeed build = build();
            mapper.insert(build);
        }
        long end = System.currentTimeMillis();
        System.out.println(end-begin);
        
    }
    
    @Test
    public void batchInsertV2(){
        long begin = System.currentTimeMillis();
        List<ProductSampleNeed> list = Lists.newArrayList();
        for (int i = 1; i <=100000; i++) {
            ProductSampleNeed build = build();
            list.add(build);
            if (list.size()>=200){
                mapper.batchInsert(list);
                list.clear();
            }
            
        }
        long end = System.currentTimeMillis();
        System.out.println(end-begin);
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

    public static void main(String[] args) throws Exception {
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
    
    @Test
    public void dyDbTest(){
        ProductSampleNeed byId = service.getById(1L);
        System.out.println();
    }
    
    @Test
    public void strTest(){
        String s1 = "xx";
        s1 = s1+"bb";
        System.out.println(s1);
    }

}
