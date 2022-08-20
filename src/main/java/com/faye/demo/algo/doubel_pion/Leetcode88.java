package com.faye.demo.algo.doubel_pion;

import java.util.Arrays;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/24
 **/
public class Leetcode88 {

    public static void main(String[] args) {
        int[] nums1 = {1,2,3,0,0,0};
        int[] nums2 = {2,5,6};
        new Leetcode88().merge(nums1,3,nums2,3);
        for (int i : nums1) {
            System.out.print(i+",");
        }
    }

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = m,nIdx = 0; i < nums1.length && nIdx<n; i++,nIdx++) {
            nums1[i] = nums2[nIdx];
        }
        Arrays.sort(nums1);
    }

}
