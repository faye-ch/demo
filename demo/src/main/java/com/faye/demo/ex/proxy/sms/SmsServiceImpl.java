package com.faye.demo.ex.proxy.sms;

/*
 * @Author cyf
 * @Date 2022/1/6
 * 目标类
 **/
public class SmsServiceImpl implements ISmsService {

    @Override
    public String send(String msg){
        System.out.println(msg);
        return msg;
    }

    @Override
    public String sendV2(String msg) {
        System.out.println("method V2:"+msg);
        return msg;
    }
}
