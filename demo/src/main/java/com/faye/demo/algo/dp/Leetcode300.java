package com.faye.demo.algo.dp;

public class Leetcode300 {

    public static void main(String[] args) {

    }

    public int lengthOfLIS(int[] nums) {

        int length = nums.length;
        boolean[][] dp = new boolean[length][length];
        for (int i = 0; i < length; i++) {
            dp[i][i] = true;
        }
        for (int l = 2; l <=length ; l++) {
            for (int i = 0; i < length; i++) {
                int j = l + i -1;

            }
        }

        return 0;
    }

}
