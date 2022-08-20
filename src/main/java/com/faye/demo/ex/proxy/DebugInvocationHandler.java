package com.faye.demo.ex.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/*
 * @Author cyf
 * jdk 动态代理类
 * @Date 2022/1/6
 **/
public class DebugInvocationHandler implements InvocationHandler {

    private final Object target;

    public DebugInvocationHandler(Object target){
        this.target = target;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("before");
        Object result = method.invoke(target, args);
        System.out.println("after");
        return result;
    }
}
