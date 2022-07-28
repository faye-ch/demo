package com.faye.demo.ex.anno;

import org.junit.Test;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/*
 * @Author cyf
 * 获取代理对象需要的参数：目标类class,切面类class
 * 注解动态代理思路：获取标注在 clazz 上的注解，获取注解中的属性(class)->创建切面实例->切面编程，只需要传一个参数：目标类class
 * 普通动态代理思路：传入 目标类class,切面类class
 **/
public class ObjectFactory {

    public static <T> T newInstance(Class<T> clazz)throws Exception{
        //获取标注在目标类上的注解(注解值是代理增强类)
        Annotation[] annotations = clazz.getAnnotations();
        List<IAspect> list = new ArrayList<>();

        for (Annotation annotation : annotations) {
            if (annotation instanceof Aspect){
                Class type = ((Aspect) annotation).type();
                IAspect aspect = (IAspect)type.getConstructor().newInstance();//代理增强类实例
                list.add(aspect);
            }
        }
        T tarObj = clazz.getConstructor().newInstance();
        //Proxy.newProxyInstance 三个参数:目标类的类加载器、目标类的接口、代理方法的实现
        return (T)Proxy.newProxyInstance(
                clazz.getClassLoader(),
                clazz.getInterfaces(),
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        list.forEach(x->x.before());
                        Object result = method.invoke(tarObj);
                        list.forEach(x->x.after());
                        return tarObj;
                    }
                }
        );
    }

    @Test
    public void test()throws Exception{
        IOrder order = newInstance(Order.class);
        order.pay();
    }

}
