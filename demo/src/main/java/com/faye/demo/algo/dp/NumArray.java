package com.faye.demo.algo.dp;

import java.sql.PreparedStatement;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/21
 **/
public class NumArray {

    int[][] dp;

    public static void main(String[] args) {
        int[] nums = {-2, 0, 3, -5, 2, -1};
        NumArray numArray = new NumArray(nums);
        int i = numArray.sumRange(0, 5);
        System.out.println(i);
    }

    public NumArray(int[] nums) {
        int length = nums.length;
        dp = new int[length][length];
        for (int i = 0; i < length; i++) {
            dp[i][i] = nums[i];
        }
        for (int l = 2; l <=length; l++) {
            for (int i = 0; i < length; i++) {
                int j = l + i -1;
                if (j>=length){
                    break;
                }
                dp[i][j] = dp[i][j-1]+nums[j];
            }
        }
    }

    public int sumRange(int left, int right) {
        return dp[left][right];
    }

}
