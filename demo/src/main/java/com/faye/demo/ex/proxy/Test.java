package com.faye.demo.ex.proxy;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/6
 **/
public class Test {

    public static void main(String[] args) {
        ISmsService smsService = (ISmsService)JdkProxyFactory.getProxy(new SmsServiceImpl());
        smsService.sendV2("hello");
    }

}
