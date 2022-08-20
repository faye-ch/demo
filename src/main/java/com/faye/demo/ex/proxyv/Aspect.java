package com.faye.demo.ex.proxyv;

import com.faye.demo.ex.basic.monad.Try;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
/*
 * 切面接口
 * 1.定义切面方法
 * 2.生成切面代理对象
 *
**/
public interface Aspect {

    void before();
    void after();

    /**
     *
     * @param clazz 目标类 class 对象
     * @param aspects 全限定名称数组 为什么是可变参数 ? 因为 Aspect 可能有多个实现类
     * @param <T>
     * @return
     */
    static <T> T getProxy(Class<T> clazz,String ... aspects)throws Exception{

        //根据全限定类名获取切面实例
        List<Try<Aspect>> aspectInsts = Arrays.stream(aspects).map(name -> Try.ofFailable(() -> {
            Class<?> aClass = Class.forName(name);
            return (Aspect) aClass.getConstructor().newInstance();
        })).filter(aspect -> aspect.isSuccess()).collect(Collectors.toList());

        //目标类实例 用于执行目标方法
        T objInst = clazz.getConstructor().newInstance();
        //生成并返回代理类
        return (T)Proxy.newProxyInstance(
                clazz.getClassLoader(),
                clazz.getInterfaces(),
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        //执行切面 before 方法
                        for (Try<Aspect> aspect : aspectInsts) {
                            aspect.get().before();
                        }
                        //执行目标方法
                        Object result = method.invoke(objInst);
                        //执行切面 after 方法
                        for (Try<Aspect> aspect : aspectInsts) {
                            aspect.get().after();
                        }
                        return result;
                    }
                }
        );
    }
}
