package com.faye.demo.ex.proxy.sms;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/*
 * @Author cyf
 * jdk 动态代理类:传入目标类的 class对象
 * 增强逻辑在这里写
 * @Date 2022/1/6
 **/
public class DebugInvocationHandler<T> implements InvocationHandler {

    private final Class<T> clazz;

    public DebugInvocationHandler(Class<T> clazz){
        this.clazz = clazz;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("before");
        Object tarObj = clazz.newInstance();
        Object result = method.invoke(tarObj, args);
        System.out.println("after");
        return result;
    }
}
