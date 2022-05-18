package com.faye.demo.ex.niuk;


import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ9 {

    public static void main(String[] args) {
//        m1();
        m2();
    }

    //9876673
    //3766789
    //利用indexOf 找 str 中字母的首个位置
    private static void m2() {
        Scanner scanner = new Scanner(System.in);
        //逆序排列
        StringBuilder stringBuilder = new StringBuilder(scanner.nextLine()).reverse();
        String str = stringBuilder.toString();

        //结果集
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < str.length(); i++) {
            int index = str.indexOf(str.charAt(i));
            if (index == i) {
                result.append(str.charAt(i));
            }
        }
        System.out.println(result.toString());

    }

    // 使用 set 去重
    private static void m1() {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        String[] split = str.split("");
        Set<String> set = new HashSet<>();
        StringBuilder sb = new StringBuilder();
        for (int i = split.length-1; i >=0 ; i--) {
            boolean b = set.add(split[i]);
            if (b){
                sb.append(split[i]);
            }
        }
        System.out.println(sb.toString());
    }

}
