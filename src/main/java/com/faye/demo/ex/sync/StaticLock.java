package com.faye.demo.ex.sync;

/*
 * @Author cyf
 * 类锁
 * @Date 2022/3/2
 **/
public class StaticLock {

    private static int i = 0;

    public static synchronized void mothod(){
        for (int j = 0; j < 100; j++) {
            System.out.println(Thread.currentThread()+" --- "+i);
            i++;
        }
    }

}
