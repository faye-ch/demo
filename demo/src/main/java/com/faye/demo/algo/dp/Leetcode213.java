package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Date 2022/5/20
 *
 * [2,3,2] = 3
 * [1,2,3,1] = 4
 *
 *
 *
 **/
public class Leetcode213 {

    public static void main(String[] args) {
        int[] num = {1,2,3,1};
        int rob = new Leetcode213().rob(num);
        System.out.println(rob);
    }

    public int rob(int[] nums) {
        int num1 = cal(nums,0,nums.length-1);
        int num2 = cal(nums,1,nums.length);
        return Math.max(num1,num2);
    }

    private int cal(int[] nums, int begin, int end) {
        if (nums.length==1) return nums[0];
        if (nums.length==2) return Math.max(nums[0],nums[1]);
        int first = nums[begin];
        int second = Math.max(nums[begin+1],first);
        for (int i = begin+2; i < end; i++) {
            int temp = second;
            second = Math.max(nums[i]+first,second);
            first = temp;
        }
        return second;
    }


}
