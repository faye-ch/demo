package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/19
 **/
public class ClimbStaisV2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int sum = sl(n);
        System.out.println(sum);
    }

    private static int sl(int n) {
        if(n == 1){return 1;}
        if(n == 2){return 2;}
        if(n == 3){return 2;}
        int a = 1, b = 3, temp;
        for(int i = 4; i <= n; i++){
            temp = a;
            a = b;
            b = temp + b;
        }
        return b;
    }

}
