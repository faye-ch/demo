package com.faye.demo.ex.view;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/17
 **/
public class HJ24V2 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            int n = sc.nextInt();
            int[] arr = new int[n];
            for (int i = 0; i < n; i++) {
                arr[i] = sc.nextInt();
            }

            int[] dpL = new int[n];
            int[] dpR = new int[n];
            dpL[0] = 1;
            dpR[n - 1] = 1;
            for (int i = 0; i < n; i++) {
                dpL[i] = 1;
                for (int j = 0; j < i; j++) {
                    if (arr[i]>arr[j]){
                        dpL[i] = Math.max(dpL[i],dpL[j]+1);
                    }
                }
            }

            for (int i = n-1; i >=0 ; i--) {
                dpR[i] = 1;
                for (int j = n-1; j > i; j--) {
                    if (arr[i] > arr[j]){
                        dpR[i] = Math.max(dpR[i],dpR[j]+1);
                    }
                }
            }

            int[] results = new int[n];
            for (int i = 0; i < n; i++) {
                results[i] = dpL[i] + dpR[i]-1;
            }

            int max = 1;
            for (int i = 0; i < n; i++) {
                max = Math.max(max,results[i]);
            }
            System.out.println(n-max);
        }

    }

}
