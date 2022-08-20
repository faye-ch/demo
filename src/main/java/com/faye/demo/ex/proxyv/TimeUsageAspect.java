package com.faye.demo.ex.proxyv;

/*
 * @Author cyf
 * 切面实现类
 * @Date 2022/1/10
 **/
public class TimeUsageAspect implements Aspect {

    long start;

    @Override
    public void before() {
        start = System.currentTimeMillis();
    }

    @Override
    public void after() {
        long usages = System.currentTimeMillis() - start;
        System.out.format("time usage : %dms\n",usages);
    }
}
