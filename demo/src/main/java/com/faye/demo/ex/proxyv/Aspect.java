package com.faye.demo.ex.proxyv;

import java.util.Arrays;

public interface Aspect {

    void before();
    void after();

    /**
     *
     * @param clazz 目标类 class 对象
     * @param aspects 接口全限定名称数组
     * @param <T>
     * @return
     */
    static <T> T getProxy(Class<T> clazz,String ... aspects){
        return null;
    }
}
