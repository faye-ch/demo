package com.faye.demo.ex.niuk;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class L1143 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String oWord = scanner.nextLine();
        String tWord = scanner.nextLine();
        Map<String,String> map = new HashMap<>();
        String oPrefix = "o";
        String tPrefix = "t";
        String xPrefix = "x";
        for (int i = 0; i < oWord.length(); i++) {
            char c = oWord.charAt(i);
            String s = String.valueOf(c);
            String result = map.get(s);
            if (result==null){
                map.put(s,oPrefix);
            }
        }

        for (int i = 0; i < tWord.length(); i++) {
            char c = tWord.charAt(i);
            String s = String.valueOf(c);
            String result = map.get(s);
            if (result==null){
                map.put(s,tPrefix);
            }else {
                if (!result.equals(tPrefix)){
                    map.put(s,xPrefix);
                }
            }
        }

        int sum = 0;
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (entry.getValue().equals(xPrefix)) {
                sum +=1;
            }
        }
        System.out.println(sum);
    }

}
