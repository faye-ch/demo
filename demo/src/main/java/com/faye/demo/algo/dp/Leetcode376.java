package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/22
 **/
public class Leetcode376{

    public static void main(String[] args) {
        int[] nums = {1,17,5,10,13,15,10,5,16,8};
        int num = new Leetcode376().wiggleMaxLength(nums);
        System.out.println(num);
    }

    public int wiggleMaxLength(int[] nums) {
        int length = nums.length;
        if (length == 0){
            return 0;
        }

        int up = 1;
        int down = 1;
        for (int i = 1; i < length; i++) {
            if (nums[i] > nums[i-1]){
                up = down +1;
            }else if (nums[i] < nums[i-1]){
                down = up+1;
            }
        }
        return Math.max(up,down);
    }

}