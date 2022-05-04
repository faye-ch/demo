package com.faye.demo.ex.proxy.sms;

/**
 * 目标抽象接口
 * 目标类抽象出来的接口
 */
public interface ISmsService {

    String send(String msg);

    String sendV2(String msg);

}
