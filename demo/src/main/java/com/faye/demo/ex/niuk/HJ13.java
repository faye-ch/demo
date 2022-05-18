package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ13 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        String[] split = str.split(" ");
        for (int i = split.length-1; i >=0 ; i--) {
            System.out.print(split[i]);
            if (i!=0){
                System.out.print(" ");
            }
        }
    }

}
