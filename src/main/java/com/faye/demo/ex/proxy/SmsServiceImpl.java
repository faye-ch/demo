package com.faye.demo.ex.proxy;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/6
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
