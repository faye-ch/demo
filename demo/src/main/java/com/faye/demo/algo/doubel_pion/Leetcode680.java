package com.faye.demo.algo.doubel_pion;

/*
 * @Author cyf
 * @Date 2022/5/24
 *
 * abcjca
 * 关键点不知道删除哪一个，就两个都删除
 * 当 i=1，j=4 i=b != j=c
 * 只需要判断 cjc 或者 bjc 其他一个为回文串 即都为回文串
 *
 **/
public class Leetcode680 {

    public static void main(String[] args) {
        boolean b = new Leetcode680().validPalindrome("abcjca");
        System.out.println(b);
    }

    public boolean validPalindrome(String s) {
        for (int i = 0,j=s.length()-1; i < j; i++,j--) {
            if (s.charAt(i)!=s.charAt(j)){
                return check(s,i+1,j) || check(s,i,j-1);
            }
        }
        return true;
    }

    //剩下的字符串 判断是否为回文串
    private boolean check(String s, int i, int j) {
        while (i<j){
            if (s.charAt(i++) != s.charAt(j--)){
                return false;
            }
        }
        return true;
    }

}
