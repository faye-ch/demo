package com.faye.demo.ex.proxy.sms;
/*
 * @Author cyf
 * @Description
 * @Date 2022/1/6
 **/
public class Test {

    public static void main(String[] args) {
        ISmsService smsService = JdkProxyFactory.getProxy(SmsServiceImpl.class);
        smsService.sendV2("hello");
    }

}
