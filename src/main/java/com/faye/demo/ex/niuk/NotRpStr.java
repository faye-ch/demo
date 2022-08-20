package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description  xx 暴力
 * @Date 2022/4/27
 **/
public class NotRpStr {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        String[] split = str.split("");
        if (split.length==1){
            System.out.println(0);
        }
        int l = 0;
        int h = 1;
        while (h<split.length){
            String s1 = split[l];
            String s2 = split[h];
            if (s1.equals(s2)){
                l++;
                h = l+1;
                continue;
            }
            h++;
            if (h==split.length-1)
                System.out.println(l);
        }
    }

}
