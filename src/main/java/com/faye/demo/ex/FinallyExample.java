package com.faye.demo.ex;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/6
 **/
public class FinallyExample {

    public static void main(String[] args) {
        int num = test(1);
        System.out.println(num);

//        exitTest(); exit 终止虚拟机
    }

    public static int test(int n){
        try {
            return n*n;
        }finally {
            return 0;
        }
    }

    //在以下 3 种特殊情况下，finally 块不会被执行
    //1.exit
    //2.cpu 停止运行
    //3.线程死亡
    public static void exitTest(){
        try{
            //终止虚拟机
            System.exit(0);
        }finally {
            System.out.println("finally");
        }
    }


}
