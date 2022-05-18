package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description 求二进制
 * @Date 2022/4/28
 **/
public class HJ15 {

    public static void main(String[] args) {
//        solu();
        bry();
    }

    //二进制
    private static void bry() {
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        StringBuilder sb = new StringBuilder();
        while (num>=1){
            if ((num&1)==1){
                sb.append(1);
            }else {
                sb.append(0);
            }
            num = num>>1;
        }
        System.out.println(sb.reverse().toString());
    }

    private static void solu() {
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        if (num==0){
            System.out.println(0);
        }
        int count = 0;
        while (num>=1){
            if ((num&1)==1){
                count++;
            }
            num = num>>1;
        }
        System.out.println(count);
    }

}
