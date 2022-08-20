package com.faye.demo.ex;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/*
 * @Author cyf
 * 只有获得了该对象的锁的线程才能执行以下的方法体
 **/
public class LockExample {

    private Lock lock = new ReentrantLock();

    public void fuc(){
        lock.lock();
        try{
            for (int i = 0; i < 10 ; i++) {
                System.out.print(i+" ");
            }
        }finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        LockExample example = new LockExample();
        ExecutorService executorService = Executors.newCachedThreadPool();
        executorService.execute(()->example.fuc());
        executorService.execute(()->example.fuc());

    }

}
