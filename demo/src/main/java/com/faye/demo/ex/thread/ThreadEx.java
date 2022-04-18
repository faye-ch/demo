package com.faye.demo.ex.thread;

/*
 * @Author cyf
 * @Description 继承 Thread 的方式不能共享实例变量
 * @Date 2022/4/18
 **/
public class ThreadEx extends Thread {

    private int cnt = 0;

    public ThreadEx(String name){
        setName(name);
    }

    @Override
    public void run() {
        cnt++;
        System.out.println(cnt);
    }

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            new ThreadEx("线程："+i).start();
        }
    }
}
