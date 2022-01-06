package com.faye.demo.ex.proxy;

import com.faye.demo.ex.proxy.DebugInvocationHandler;

import java.lang.reflect.Proxy;

/*
 * @Author cyf
 * 获取代理对象的工厂类
 * @Date 2022/1/6
 **/
public class JdkProxyFactory {

    public static Object getProxy(Object target){
        return Proxy.newProxyInstance(
        target.getClass().getClassLoader(),
        target.getClass().getInterfaces(),
        new DebugInvocationHandler(target));
    }

}
