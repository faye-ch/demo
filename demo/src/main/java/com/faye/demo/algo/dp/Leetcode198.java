package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Date 2022/5/20
 * 数组动态规划
 *
 * 如果房屋数量大于两间，应该如何计算能够偷窃到的最高总金额呢？对于第 k~(k>2)间房屋，有两个选项：
    1.偷窃第 k 间房屋，那么就不能偷窃第 k-1间房屋，偷窃总金额为前 k-2 间房屋的最高总金额与第 k间房屋的金额之和。
    2.不偷窃第 k 间房屋，偷窃总金额为前 k-1 间房屋的最高总金额。

 * 边界条件为：
 * 1.dp[0] = max[0]
 * 2.dp[1] = max(nums[0],nums[1])
 *
 * 状态转移方程：
 * dp[i] = max(dp[i-2]+nums[i],dp[i-1])
 *
 **/
public class Leetcode198 {

    public static void main(String[] args) {
        int[] num = {2,7,9,3,1};
        int rob = new Leetcode198().rob(num);
        System.out.println(rob);
    }

    public int rob(int[] nums) {
        if (nums.length==1){
            return nums[0];
        }
        if (nums.length==2){
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
