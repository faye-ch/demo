package com.faye.demo.algo.dp;

import com.faye.demo.algo.dp.Leetcode70;

/*
 * @Author cyf
 * @Description 递归
 * @Date 2022/5/20
 **/
public class Leetcode70V2 {

    public static void main(String[] args) {
        int climbStairs = new Leetcode70().climbStairs(4);
        System.out.println(climbStairs);
    }

    public int climbStairs(int n) {
        if (n==1) return 1;
        if (n==2) return 2;
        return climbStairs(n-1)+climbStairs(n-2);
    }

}
