package com.faye.demo.ex.anno;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/11
 **/
public class TimeUsageAspect implements IAspect {

    @Override
    public void before() {
        System.out.println("before");
    }

    @Override
    public void after() {
        System.out.println("after");
    }
}
