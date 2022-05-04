package com.faye.demo.ex.thread;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/18
 **/
public class ThreadJoinEx {

    public static void main(String[] args) throws Exception{

        Target t1 = new Target("线程1");
        Target t2 = new Target("线程1");
        Thread thread = new Thread(t1);
        Thread thread1 = new Thread(t2);
        thread.start();
        thread.join();
        thread1.start();

    }

    static class Target implements Runnable{

        private String name;

        public Target(String name){
            this.name = name;
        }

        public String getName() {
            return name;
        }

        @Override
        public void run() {
            for (int i = 0; i < 5 ; i++) {
                System.out.println(this.getName()+i);
            }
        }
    }

}
