package com.faye.demo.algo;

/*
 * @Author cyf
 * @Date 2022/5/20
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 *
 * 动态规划 : dp[i] = dp[i-1] + dp[i-2]
 * 1阶 = 1 1
 * 2阶 = 2 11 12
 * 3阶 = 3 11 12 21
 * 4阶 = 5 1111 211 121 112 22
 * 使用滚动数组模拟真实数组：因为是累加，使用过的累加就不需要记录了
 **/
public class Leetcode70 {

    public static void main(String[] args) {
        int climbStairs = new Leetcode70().climbStairs(4);
        System.out.println(climbStairs);
    }

    /**
     * dp[i] = dp[i-1] + dp[i-2]
     */
    public int climbStairs(int n) {
        int step1 = 1;
        int step2 = 2;
        int step3 = 3;
        if (n==1)return step1;
        if (n==2)return step2;
        for (int i = 2; i < n; i++) {
            step3 = step1+step2;
            step1 = step2;
            step2 = step3;
        }
        return step3;
    }
}
