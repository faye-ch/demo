package com.faye.demo.algo.doubel_pion;

/*
 * @Author cyf
 * @Date 2022/5/24
 *
 * 使用双指针，一个指针指向值较小的元素，一个指针指向值较大的元素。指向较小元素的指针从头向尾遍历，指向较大元素的指针从尾向头遍历。
 * 如果两个指针指向元素的和 sum == target，那么得到要求的结果；
 * 如果 sum > target，移动较大的元素，使 sum 变小一些；
 * 如果 sum < target，移动较小的元素，使 sum 变大一些。
 *
 * 思路：用空间换时间
 *
 **/
public class Leetcode167 {

    public static void main(String[] args) {
        int[] nums = {2,3,4};
        int[] ints = new Leetcode167().twoSum(nums,6);
        for (int i : ints) {
            System.out.print(i+",");
        }
    }

    public int[] twoSum(int[] numbers, int target) {
        int begin = 0;
        int end =  numbers.length-1;

        while (begin<end){
            int num1 = numbers[begin];
            int num2 = numbers[end];
            int sum = num1+num2;
            if (sum==target){
                return new int[]{begin+1,end+1};
            }
            if (sum > target){
                end--;
            }else {
                begin--;
            }
        }
        return new int[]{};
    }

}
