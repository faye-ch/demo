package com.faye.demo.algo.dp;

public class Leetcode343 {

    public static void main(String[] args) {
        int num = new Leetcode343().integerBreak(4);
        System.out.println(num);

    }

    public int integerBreak(int n) {
        int[] dp = new int[n + 1];
        for (int i = 2; i <= n; i++) {
            int curMax = 0;
            for (int j = 1; j < i; j++) {
                int n1 = j * (i - j);
                int n2 = j * dp[i - j];
                int n3 = Math.max(n1, n2);
                curMax = Math.max(curMax,n3);
            }
            dp[i] = curMax;
        }
        return dp[n];
    }

}
