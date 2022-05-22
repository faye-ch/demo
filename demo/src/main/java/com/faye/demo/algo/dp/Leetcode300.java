package com.faye.demo.algo.dp;

public class Leetcode300 {

     /*
      * 10 9 2 5 8 7 101
      * i=0 , 10 dp0=1
      * i=1 j=0,10 9 dp1=1
      * i=2 j=1,10 9 2 dp2=1
      * i=3 j=2,10 9 2 5 dp3=2
      * i=4 j=3,10 9 2 5 8 dp4=3
      * i=5 j=4,10 9 2 5 8 7 dp5=3
      * i=6 j=5,10 9 2 5 8 7 101 dp6 = 4
      *
      * dp[i] = Max(dp[i],dp[j]+1)
      * 如 i=6
      * i=6 j=0,101 10 Y dp6=2
      * i=6 j=1,101 9  Y dp6=2
      * i=6 j=2,101 2  Y dp6=2  dp[6]=max(dp[6]=2,dp[2]+1)=2
      * i=6 j=3,101 5  Y dp6=3  dp[6]=max(dp[6]=2,dp[3]+1) = 3
      * i=6 j=4,101 8  Y dp6=4  dp[6]=max(dp[6]=3,dp[4]+1) = 4
      * i=6 j=5,101 7  Y dp6=4  dp[6]=max(dp[6]=4,dp[6]+1) = 4
      *
      * 总结
      * 关键点1: 遍历方式 -> 遍历长度
      * 关键点2: dp[i] = Max(dp[i],dp[j]+1) dp[i]代表内层遍历的上一次的最大值，dp[j]+1代表当前，dp[j]为历史记录
      */
    public static void main(String[] args) {
        int[] nums = {10,9,2,5,8,7,101};
        int num = new Leetcode300().lengthOfLIS(nums);
        System.out.println(num);
    }

    public int lengthOfLIS(int[] nums) {
        int length = nums.length;
        if (length==0){
            return 0;
        }
        int[] dp = new int[length];
        dp[0]=1;
        int max = 0;
        for (int L = 1; L < length; L++) {
            dp[L] = 1;
            for (int j = 0; j < L; j++) {
                dp[L] = Math.max(dp[L],dp[j]+1);
            }
            max = Math.max(dp[L],max);
        }
        return max;
    }

}
