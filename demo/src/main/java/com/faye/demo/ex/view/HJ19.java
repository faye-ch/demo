package com.faye.demo.ex.view;


import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

/*
 * @Author cyf
 * 利用 linkedHashMap 的头插法
 * 循环 while hasNext()
 * 结算循环 ctrl + D
 * @Date 2022/5/16
 **/
public class HJ19 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Map<String,Integer> map = new LinkedHashMap<>();
        while (scanner.hasNext()){
            String str = scanner.next();
            int lineN = scanner.nextInt();
            String[] split = str.split("\\\\");
            String lastStr = split[split.length - 1];
            lastStr = deal(lastStr);
            String key = lastStr+" "+lineN;
            map.put(key,map.getOrDefault(key,0)+1);
        }
        int count = 0;
        for (String s : map.keySet()) {
            count++;
            //输出最新的 8 个
            if (count > (map.keySet().size()-8)){
                System.out.println(s+" "+map.get(s));
            }
        }
    }

    private static String deal(String lastStr) {
        int lastLen = lastStr.length();
        if (lastLen<=16){
            return lastStr;
        }
        int begin = lastLen-16;
        return lastStr.substring(begin);
    }

}
