package com.faye.demo.ex.niuk;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/29
 **/
public class ClimbStais {

    public static void main(String[] args) {
        int num = climbStairs(4);
        System.out.println(num);
    }

    //推导出 f(x) = f(x-1) + f(x-2)
    public static int climbStairs(int n) {
        if (n==1) return 1;
        if (n==2) return 2;
        int[] step = new int[n];
        step[0] = 1;
        step[1] = 2;
        for (int i = 2; i < n; i++) {
            step[i] = step[i-1] + step[i-2];
        }
        return step[n-1];
    }
}
