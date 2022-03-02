package com.faye.demo.ex.dcslock;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface HmcDistributeLock {

    /**
     * 锁
     */
    String value();

    /**
     * 锁的过期时间
     */
    int expireSeconds() default 10;

    /**
     * 方法参数下标
     */
    int[] argsIndexe() default {};

    /**
     * 错误信息
     */
    String message() default "";

}
