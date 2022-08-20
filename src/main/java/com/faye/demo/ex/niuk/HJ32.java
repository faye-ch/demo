package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Date 2022/5/19
 * 最长回文字串
 * dp[i][j] = dp[i+1][j-1]
 **/
public class HJ32 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s = scanner.nextLine();
        if (s.length()<2){
            System.out.println(1);
        }
        int n = s.length();
        boolean[][] dp = new boolean[n][n];
        for (int i = 0; i < n ; i++) {
            dp[i][i] = true;
        }

        int max = 0;
        for (int L = 2; L <= s.length(); L++) {
            for (int i = 0; i <= s.length(); i++) {
                int j = L + i -1;
                if (j >= s.length()){
                    break;
                }
                if (s.charAt(i) != s.charAt(j)){
                    dp[i][j] = false;
                }else {
                    if (j - i < 3){
                        dp[i][j] = true;
                    }else {
                        dp[i][j] = dp[i+1][j-1];
                    }
                }
                if (dp[i][j] && j-i+1>max){
                    max = j-i+1;
                }
            }
        }
        System.out.println(max);
    }
}
