package com.faye.demo.ex;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/27
 **/
public class test04 {

    public static void main(String[] args) {
        int num = 5;
        //右移高位添0 低位丢掉
        //101 >> 1
        //00000010
        System.out.println(num>>1);
        //&位运算
        //101(5)
        //001
        //001

        //010(2)
        //001
        //000
        int number = 2;
        System.out.println(number&1);
    }

}
