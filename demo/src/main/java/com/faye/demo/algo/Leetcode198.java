package com.faye.demo.algo;

/*
 * @Author cyf
 * @Date 2022/5/20
 * 数组动态规划
 **/
public class Leetcode198 {

    public static void main(String[] args) {
        int[] num = {2,7,9,3,1};
        int rob = new Leetcode198().rob(num);
        System.out.println(rob);
    }

    public int rob(int[] nums) {
        if (nums.length<2){
            return Math.max(nums[0],nums[1]);
        }
        int[] dp = new int[nums.length];
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0],nums[1]);
        int max = 0;
        for (int i = 2; i < nums.length; i++) {
            dp[i] = Math.max(nums[i]+dp[i-2],dp[i-1]);
            max = Math.max(max,dp[i]);
        }
        return max;

    }

}
