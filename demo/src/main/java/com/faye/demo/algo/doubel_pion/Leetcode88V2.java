package com.faye.demo.algo.doubel_pion;

import java.util.Arrays;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/24
 **/
public class Leetcode88V2 {

    public static void main(String[] args) {
        int[] nums1 = {1,2,3,0,0,0};
        int[] nums2 = {2,5,6};
        new Leetcode88V2().merge(nums1,3,nums2,3);
        for (int i : nums1) {
            System.out.print(i+",");
        }
    }

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        int p1 = 0,p2 = 0;
        int[] sord = new int[m+n];
        int cur;
        while (p1 < m || p2 < n){
            if (p1 == m){
                cur = nums2[p2];
            }else if (p2 ==n){
                cur = nums1[p1];
            }else if (nums1[p1] < nums2[p2]){
                cur = nums1[p1++];
            }else{
                cur = nums2[p2++];
            }
            sord[p1 + p2 -1] = cur;
        }
        for (int i = 0; i < sord.length; i++) {
            nums1[i] = sord[i];
        }
    }

}
