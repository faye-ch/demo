package com.faye.demo.ex.sync;

/*
 * @Author cyf
 * 测试方法
 * @Date 2022/3/2
 **/
public class Test {

    public static void main(String[] args) {

        SyncThread syncThread = new SyncThread();
        Thread thread = new Thread(syncThread);
        Thread thread1 = new Thread(syncThread);
        thread.start();
        thread1.start();

    }

}
