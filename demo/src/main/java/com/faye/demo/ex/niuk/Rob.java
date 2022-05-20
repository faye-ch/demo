package com.faye.demo.ex.niuk;

/*
 * @Author cyf
 * @Date 2022/5/4
 * 第一间房子和最后一间房子不同时偷
 **/
public class Rob {

    public static void main(String[] args) {
        Rob rob = new Rob();
        int[] nums = {1,2,3,1};
        int num = rob.rob(nums);
        System.out.println(num);
    }

    public int rob(int [] nums){
        if (nums==null || nums.length==0){
            return 0;
        }
        if (nums.length==1){
            return nums[0];
        }
        
        int first = nums[0];
        int second = Math.max(first,nums[1]);
        for (int i = 2; i < nums.length; i++) {
            int temp = second;
            second = Math.max(first+nums[i],second);
            first = temp;
        }
        return second;
    }

}
