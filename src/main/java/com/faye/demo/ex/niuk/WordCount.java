package com.faye.demo.ex.niuk;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/27
 **/
public class WordCount {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        String word = scanner.nextLine();

        Map<String,Integer> map = new HashMap<>();
        String[] split = str.split("");
        for (int i = 0; i < split.length; i++) {
            String s = split[i];
            String uCase = s.toUpperCase();
            Integer count = map.get(uCase);
            if (count==null){
                map.put(uCase,1);
            }else {
                map.put(uCase,count+1);
            }
        }
        String wUCase = word.toUpperCase();
        System.out.println(map.get(wUCase));
    }

}
