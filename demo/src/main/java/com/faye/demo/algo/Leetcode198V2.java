package com.faye.demo.algo;

/*
 * @Author cyf
 * @Date 2022/5/20
 * 动态规划 滚动数组
 **/
public class Leetcode198V2 {

    public static void main(String[] args) {
        int[] num = {1,2,3,1};
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
        int first = nums[0];
        int second = Math.max(nums[0],nums[1]);

        for (int i = 2; i < nums.length; i++) {
            int temp = second;
            second = Math.max(nums[i]+first,second);
            first = temp;
        }
        return second;
    }

}
