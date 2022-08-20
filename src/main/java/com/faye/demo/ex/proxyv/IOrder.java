package com.faye.demo.ex.proxyv;

/**
 * 目标接口
 */
public interface IOrder {

    void pay()throws InterruptedException;

    void show();

}
