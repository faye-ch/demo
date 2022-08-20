package com.faye.demo.algo.dp;

import java.util.Scanner;

/*
 * @Author cyf
 * @Date 2022/5/23
 *
 * 暴力解
 * asdfas  fori
 * werasdfaswer forj
 * 当i==j 表明有公共子序列的迹象,内置 for 找最长子序列
 **/
public class NKHJ75 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s1 = scanner.nextLine();
        String s2 = scanner.nextLine();

        int max = 0;
        for (int i = 0; i < s1.length(); i++) {
            for (int j = 0; j < s2.length(); j++) {
                int tMax = 0;
                if (s1.charAt(i) != s2.charAt(j)){
                    continue;
                }
                int begin = i;
                int end = j;
                while (begin<s1.length() && end<s2.length()&&s1.charAt(begin)==s2.charAt(end) ){
                    tMax++;
                    begin++;
                    end++;
                }
                max = Math.max(tMax,max);
            }
        }
        System.out.println(max);
    }

}
