package com.faye.demo.ex.view;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ6 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        StringBuilder sb = new StringBuilder();
        int base = 2;
        while (base<=num){
            if (num%base==0){
                if (base == num){
                    sb.append(base+" ");
                    break;
                }else {
                    sb.append(base+" ");
                    num = num/base;
                }
            }else {
                base++;
            }
        }
        System.out.println(sb.toString());
    }

}
