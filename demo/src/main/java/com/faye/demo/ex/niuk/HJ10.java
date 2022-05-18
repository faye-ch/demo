package com.faye.demo.ex.niuk;

import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ10 {
    public static void main(String[] args) {
//        m1();
        m2();
    }

    private static void m2() {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            int index = str.indexOf(c);
            if (i==index){
                sb.append(c);
            }
        }
        System.out.println(sb.length());
    }

    private static void m1() {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        String[] split = str.split("");
        Set<String> set = new HashSet<>();
        for (int i = 0; i < split.length; i++) {
            set.add(split[i]);
        }
        System.out.println(set.size());
    }
}
