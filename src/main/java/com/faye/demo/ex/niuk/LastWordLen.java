package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description 字符串最后一个单词的长度
 * @Date 2022/4/27
 **/
public class LastWordLen {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String s = in.nextLine();
        String[] strs = s.split(" ");
        System.out.println(strs[strs.length-1].length());
    }

}
