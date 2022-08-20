package com.faye.demo.algo.dp;

import java.util.Arrays;

/*
 * @Author cyf
 * @Date 2022/5/22
 *
 * 遍历长度
 * [1,2] [2,3] [3,4]
 * 遍历
 * L=1 , pairs[L] = [2,3] pairs[i=0] = [1,2] N
 * L=2 , pairs[L] = [3,4] pairs[i=0] = [2,3] Y dp[2] = max(dp[2]=1,dp[1]+1) =2
 *
 **/
public class Leetcode646 {

    public static void main(String[] args) {

    }

    public int findLongestChain(int[][] pairs) {
        Arrays.sort(pairs,(a,b)->a[0]-b[0]);
        int length = pairs.length;
        int[] dp = new int[length];
        for (int L = 1; L < length; L++) {
            for (int i = 0; i < L; i++) {
                if (pairs[i][1] < pairs[L][0]){
                    dp[L] = Math.max(dp[L],dp[i]+1);
                }
            }
        }
        int max = 0;
        for (int i : dp) {
            max = Math.max(i,max);
        }
        return max;
    }

}
