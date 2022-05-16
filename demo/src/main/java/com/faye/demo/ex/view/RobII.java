package com.faye.demo.ex.view;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/5
 **/
public class RobII {

    public static void main(String[] args) {
        RobII rob = new RobII();
        int[] nums = {1,2,3};
        int num = rob.rob(nums);
        System.out.println(num);
    }

    public int rob(int [] nums){
        int num1 = this.cal(nums, 0, nums.length-1);
        int num2 = this.cal(nums, 1, nums.length-2);
        return Math.max(num1,num2);
    }

    private int cal(int[] nums,int start,int end) {
        if (nums==null || nums.length==0){
            return 0;
        }
        if (nums.length==1){
            return nums[0];
        }

        int first = nums[start];
        int second = Math.max(first,nums[start+1]);
        for (int i = start+2; i < end; i++) {
            int temp = second;
            second = Math.max(first+nums[i],second);
            first = temp;
        }
        return second;
    }

}
