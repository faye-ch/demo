package com.faye.demo.ex.sync;

/*
 * @Author cyf
 * 对象锁
 * @Date 2022/3/2
 **/
public class LockObject {

    private static int i = 0;

    public synchronized void method(){
        for (int j = 0; j < 100; j++) {
            System.out.println(Thread.currentThread()+" --- "+i);
            i++;
        }
    }

}
