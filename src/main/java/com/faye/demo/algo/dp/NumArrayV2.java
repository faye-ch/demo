package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/21
 **/
public class NumArrayV2 {

    int[] sum;

    public static void main(String[] args) {
        int[] nums = {-2, 0, 3, -5, 2, -1};
        NumArray numArray = new NumArray(nums);
        int i = numArray.sumRange(0, 5);
        System.out.println(i);
    }

    public NumArrayV2(int[] nums) {
        int length = nums.length;
        sum = new int[length+1];
        for (int i = 0; i < length; i++) {
            sum[i+1] = sum[i] + nums[i];
        }
    }

    public int sumRange(int left, int right) {
        return sum[right+1]-sum[left];
    }

}
