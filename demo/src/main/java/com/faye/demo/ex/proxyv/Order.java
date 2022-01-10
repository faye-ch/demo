package com.faye.demo.ex.proxyv;

/*
 * @Author cyf
 * 目标实现类
 * @Date 2022/1/10
 **/
public class Order implements IOrder {

    int state = 0;

    @Override
    public void pay() throws InterruptedException {
        Thread.sleep(50);
        this.state = 1;
    }

    @Override
    public void show() {
        System.out.println("order state:"+this.state);
    }
}
