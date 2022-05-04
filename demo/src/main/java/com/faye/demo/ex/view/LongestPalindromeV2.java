package com.faye.demo.ex.view;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/29
 **/
public class LongestPalindromeV2 {

    public String longestPalindrome(String s){
        int len = s.length();
        if (len<3){
            return s;
        }
        boolean[][] bp = new boolean[len][len];

        //初始化
        int maxLen = 1;
        int begin = 0;
        for (int i = 0; i < len; i++) {
            bp[i][i] = true;
        }

        for (int L = 0; L <= len; L++) {
            for (int i = 0; i < len ; i++) {
                int j = L + i -1;
                char left = s.charAt(i);
                char right = s.charAt(j);
                if (left == right){
                    bp[i][j] = false;
                }else {
                    if (j-i < 3){
                        bp[i][j] = true;
                    }else {
                        bp[i][j] = bp[i+1][j-1];
                    }
                }
                if (bp[i][j] && j-i+1 > maxLen){
                    maxLen = j -i + 1;
                    begin = i;
                }
            }
        }
        return s.substring(begin,begin + maxLen);
    }

}
