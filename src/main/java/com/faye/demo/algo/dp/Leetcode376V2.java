package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/23
 **/
public class Leetcode376V2 {

    public static void main(String[] args) {

    }

    public int wiggleMaxLength(int[] nums) {

        //关键点
        //1.使用包装类解决初始问题 flag!=null 第一次可正可负
        //2.使用 continue 解决后续执行问题

        int sum = 0;
        Boolean flag = null;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i]==nums[i-1]){
                continue;
            }
            if (nums[i] < nums[i-1]){
                if (flag!=null && flag){
                    continue;//上一次为正
                }
                flag = true;
            }else {
                if (flag!=null && !flag){
                    continue;//上一次为负
                }
                flag = false;
            }
        }
        return sum;
    }

}
