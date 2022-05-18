package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ11 {

    public static void main(String[] args) {
//        m1();
        m2();
    }

    private static void m2() {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        for (int i = str.length()-1; i >= 0 ; i--) {
            System.out.print(str.charAt(i));
        }
    }

    private static void m1() {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        StringBuilder sb = new StringBuilder(str);
        System.out.println(sb.reverse());
    }

}
