package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/19
 **/
public class CilmbStaisV3 {

    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            int n = scanner.nextInt();
            solution(n);
        }
    }

    private static void solution(int n) {
        int step1 = 1, step2 = 1, step3 = 2;
        int step4 = n == 1 || n == 2 ? 1 : 2;
        for (int i = 4; i <= n; i++) {
            step4 = step3 + step1;
            step1 = step2;
            step2 = step3;
            step3 = step4;
        }
        System.out.println(step4);
    }

}
