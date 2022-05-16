package com.faye.demo.ex.view;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/16
 **/
public class HJ21 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            String c = String.valueOf(str.charAt(i));
            String res = "[A-Z]";
            if (c.matches(res)){
                if ("Z".equals(c)){
                    password.append("a");
                    continue;
                }
                String s = c.toLowerCase();
                int ascii = s.charAt(0)+1;
                password.append((char)ascii);
                continue;
            }

            if ("1".equals(c)){
                password.append("1");
            }else if ("0".equals(c)){
                password.append("0");
            }else if ("abc".contains(c)){
                password.append("2");
            }else if ("def".contains(c)){
                password.append("3");
            }else if ("ghi".contains(c)){
                password.append("4");
            }else if ("jkl".contains(c)){
                password.append("5");
            }else if ("mno".contains(c)){
                password.append("6");
            }else if ("pqrs".contains(c)){
                password.append("7");
            }else if ("tuv".contains(c)){
                password.append("8");
            }else if ("wxyz".contains(c)){
                password.append("9");
            }else {
                password.append(c);
            }
        }
        System.out.println(password.toString());
    }

}
