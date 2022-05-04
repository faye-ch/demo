package com.faye.demo.ex.view;

import java.util.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ14 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = Integer.valueOf(in.nextLine());
        String[] array = new String[n];
        for (int i = 0; i < n; i++) {
            array[i] = in.nextLine();
        }
        Arrays.sort(array);
        for (String str : array) {
            System.out.println(str);
        }
    }

}
