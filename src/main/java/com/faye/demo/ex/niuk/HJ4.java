package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ4 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        int wf = 8;
        int bg=0;
        int end = wf;
        while (str.length()>0){
            String substring = "";
            if (str.length()<wf){
                substring = str.substring(bg);
                String opt = opt(wf - substring.length());
                System.out.println(substring+opt);
                str = "";
            }else {
                substring = str.substring(bg, end);
                System.out.println(substring);
                str = str.substring(end);
            }
        }
    }

    public static String opt(int length){
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append("0");
        }
        return sb.toString();
    }

}
