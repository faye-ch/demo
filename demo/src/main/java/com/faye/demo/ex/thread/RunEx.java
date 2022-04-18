package com.faye.demo.ex.thread;

/*
 * @Author cyf
 * @Description 实现 runable接口的方式可以共享 实例变量
 * @Date 2022/4/18
 **/
public class RunEx implements Runnable {

    private int cnt = 0;

    @Override
    public void run() {
        cnt++;
        System.out.println(cnt);
    }

    public static void main(String[] args) {
        RunEx runEx = new RunEx();
        new Thread(runEx,"线程1").start();
        new Thread(runEx,"线程2").start();
        new Thread(runEx,"线程3").start();


    }

}
