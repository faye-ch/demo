package com.faye.demo.ex;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

/*
 * @Author cyf
 * BlockingQueue 实现生产者消费者问题
 * 提供了阻塞的 take() 和 put() 方法：如果队列为空 take() 将阻塞，直到队列中有内容；如果队列为满 put() 将阻塞，直到队列有空闲位置。
 * @Date 2021/12/30
 **/
public class ProducerOnComsumer {

    private static BlockingQueue<String> queue = new ArrayBlockingQueue<>(5);

    private static class Producer extends Thread{
        @Override
        public void run(){
            try {
                queue.put("producer");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("producer...");
        }
    }

    private static class Comsumer extends Thread{
        @Override
        public void run(){
            try {
                queue.take();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("comsumer");
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 2; i++) {
            Producer producer = new Producer();
            producer.start();
        }

        for (int i = 0; i < 5; i++) {
            Comsumer comsumer = new Comsumer();
            comsumer.start();
        }

        for (int i = 0; i < 3; i++) {
            Producer producer = new Producer();
            producer.start();
        }
    }

}
