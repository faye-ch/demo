package com.faye.demo.algo.doubel_pion;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/24
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

    private boolean check(String s, int i, int j) {
        while (i<j){
            if (s.charAt(i++) != s.charAt(j--)){
                return false;
            }
        }
        return true;
    }

}
