package com.faye.demo.ex;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/*
 * @Author cyf
 * wait notifyAll 是属于 Object 方法的
 * 为什么 wait notifyAll 一定要用在同步代码块中 ? 因为同步代码块中有锁，如果用在没有锁的地方则没有意义了
 * wait 挂起期间会释放锁 ，这是因为如果没有释放，那么其他线程就无法进入对象的同步方法或者同步控制块中，那么就无法执行 notify 来唤醒线程了，造成死锁
 *
 * 一个对象有多少个锁 ?
 * 一个对象内有两个 synchronized 方法，线程一在访问方法1时，其他线程能否访问方法二 ?
 *  对象的内置锁是唯一的，当线程一访问方法1，其他线程不能访问方法2
 *
 **/
public class WaitOnNotifyExample {

    public synchronized void before(){
        System.out.println("before");
        notifyAll();
    }

    public synchronized void afer(){
        try {
            wait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("after");
    }

    public static void main(String[] args) {
        WaitOnNotifyExample waitOnNotifyExample = new WaitOnNotifyExample();
        ExecutorService executorService = Executors.newCachedThreadPool();
        executorService.execute(()->waitOnNotifyExample.before());
        executorService.execute(()->waitOnNotifyExample.afer());
    }

}
