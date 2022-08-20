package com.faye.demo.algo.dp;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/23
 **/
public class NKHJ24 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] nums = new int[n];
        for (int i = 0; i < n; i++) {
            nums[i] = scanner.nextInt();
        }

        int[] dpL = new int[n];
        int[] dpR = new int[n];

        for (int i = 1; i < n; i++) {
            dpL[i] = 1;
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]){
                    dpL[i] = Math.max(dpL[i],dpL[j]+1);
                }
            }
        }

        for (int i = n-1; i >0 ; i--) {
            dpR[i] = 1;
            for (int j = n-1; j > i ; j++) {
                dpR[i] = Math.max(dpR[i],dpR[j]+1);
            }
        }

        int max = 0;
        for (int i = 0; i < n; i++) {
            int res = dpL[i] + dpR[i] -1;
            max = Math.max(max,res);
        }
        System.out.println(n-max);
    }

}
