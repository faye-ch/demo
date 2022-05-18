package com.faye.demo.ex.niuk;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/17
 **/
public class HJ26 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        List<Character> list = new ArrayList<>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (Character.isLetter(c)){
                list.add(c);
            }
        }
        //一律转换为小写排序(忽略大小写)
        list.sort(new Comparator<Character>() {
            @Override
            public int compare(Character o1, Character o2) {
                return Character.toLowerCase(o1) - Character.toLowerCase(o2);
            }
        });

        //
        StringBuilder sb = new StringBuilder();
        for (int i = 0,j=0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (Character.isLetter(c)){
                sb.append(list.get(j++));
            }else {
                sb.append(c);
            }
        }
        System.out.println(sb.toString());
    }

}
