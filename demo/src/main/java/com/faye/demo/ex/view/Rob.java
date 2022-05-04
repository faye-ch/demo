package com.faye.demo.ex.view;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/4
 **/
public class Rob {

    public int rob(int [] nums){
        if (nums.length==1){
            return nums[0];
        }

        int first = nums[0];
        int second = Math.max(first,nums[1]);
        return 0;
    }

}
