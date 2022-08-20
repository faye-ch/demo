package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * 动态规划
 * @Date 2022/5/19
 **/
public class CilmbStaisV4 {
    /*
     * 1 (1)
     * 2 11 (1)
     * 3 11 3 (2)
     * 4 1111 13 31 (3)
     * 5 11111 311 131 113 (4)
     * 根据规律得出 step[i] = step[i-1] + step[i-3]
    **/

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] step = new int[n+1];
        step[1] = 1;
        step[2] = 1;
        step[3] = 2;
        for (int i = 4; i <= n; i++) {
            step[i] = step[i-1] + step[i-3];
        }
        System.out.println(step[n]);
    }

}
