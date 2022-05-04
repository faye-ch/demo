package com.faye.demo.ex.proxy.sms;

import java.lang.reflect.Proxy;

/*
 * @Author cyf
 * 获取代理对象的工厂类
 * 运行时生成代理对象
 * @Date 2022/1/6
 **/
public class JdkProxyFactory {

    public static <T> T  getProxy(Class<T> clazz){
        return (T)Proxy.newProxyInstance(
        clazz.getClassLoader(),
        clazz.getInterfaces(),
        new DebugInvocationHandler(clazz));
    }

}
