package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Date 2022/5/20
 *
 **/
public class Leetcode62 {

    public static void main(String[] args) {
        int num = new Leetcode62().uniquePaths(3,7);
        System.out.println(num);
    }

    public int uniquePaths(int m, int n) {
        if (m==0 || n==0){
            return 0;
        }
        int[][] dp = new int[m][n];
        dp[0][0] = 1;
        for (int i = 1; i < m; i++) {
            dp[i][0] = 1;
        }
        for (int j = 0; j < n; j++) {
            dp[0][j] = 1;
        }
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                dp[i][j] = dp[i-1][j] + dp[i][j-1];
            }
        }
        return dp[m-1][n-1];
    }

}
