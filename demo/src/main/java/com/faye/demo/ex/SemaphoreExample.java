package com.faye.demo.ex;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;

/*
 * @Author cyf
 * @Description
 * @Date 2021/12/29
 **/
public class SemaphoreExample {

    public static void main(String[] args) {
        final int clientCount = 3;
        final int totalRequestCount = 10;
        Semaphore semaphore = new Semaphore(clientCount);

        ExecutorService executorService = Executors.newCachedThreadPool();
    }

}
