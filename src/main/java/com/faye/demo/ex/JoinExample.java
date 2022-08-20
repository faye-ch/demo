package com.faye.demo.ex;

/*
 * @Author cyf
 * @Description
 * @Date 2021/12/29
 **/
public class JoinExample {

    private class A extends Thread{

        @Override
        public void run(){
            System.out.println("A");
        }
    }

    private class B extends Thread{

        private A a;

        public B(A a){
            this.a = a;
        }

        @Override
        public void run(){
            try {
                //A 线程插进来先执行
                a.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("B");
        }

    }

    public void test(){
        A a = new A();
        B b = new B(a);
        a.start();
        b.start();
    }

    public static void main(String[] args) {
        JoinExample example = new JoinExample();
        example.test();
    }

}
