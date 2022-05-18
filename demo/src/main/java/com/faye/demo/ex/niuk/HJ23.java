package com.faye.demo.ex.niuk;

import java.util.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/16
 **/
public class HJ23 {

    public static void main(String[] args) {
        Map<String,Integer> map = new HashMap<>();
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            String key = String.valueOf(c);
            map.put(key, map.getOrDefault(key, 0)+1);
        }
        Collection<Integer> values = map.values();
        int min = values.iterator().next();
        for (Integer value:values) {
            if (min > value ){
                min = value;
            }
        }
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            Integer value = entry.getValue();
            if (value==min){
                String key = entry.getKey();
                str = str.replace(key, "");
            }
        }
        System.out.println(str);
    }

}
