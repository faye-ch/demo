package com.faye.demo.ex.anno;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/11
 **/
@Aspect(type = TimeUsageAspect.class)
public class Order implements IOrder {

    @Override
    public void pay() {
        System.out.println("pay");
    }

    @Override
    public void show() {
        System.out.println("show");
    }
}
