package com.faye.demo.ex;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/18
 **/
public class test05 {

    public static void main(String[] args) {
        String s1 = "before";//创建 before 对象，并使S1指向 before
        String s2 = s1;//将S1引用的before地址，赋值给S2
        s2 = "after";//创建 atfer 对象，使S2指向 after对象
        // S1 不会被改变
        System.out.println(s1);//before
        System.out.println(s2);//after


        Integer num1 = 1000;
        Integer num2 = num1;
        num2 = 1001;
        System.out.println(num1);
        System.out.println(num2);
    }

}
