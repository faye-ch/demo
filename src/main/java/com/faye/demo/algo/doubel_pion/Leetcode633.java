package com.faye.demo.algo.doubel_pion;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/24
 **/
public class Leetcode633 {

    public static void main(String[] args) {
        boolean b = new Leetcode633().judgeSquareSum(1000000000);
        System.out.println(b);
    }

    public boolean judgeSquareSum(int c) {
        long begin = 0;
        long end = (long) Math.sqrt(c);

        while (begin<=end){
            long sum = (begin*begin) + (end*end);
            if (sum==c){
                System.out.println(begin);
                System.out.println(end);
                return true;
            }
            if (sum>c || sum<0){
                end--;
            }else {
                begin++;
            }
        }
        return false;
    }
}
