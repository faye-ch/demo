package com.faye.demo.ex.niuk;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ5 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Map<String,Integer> map = new HashMap<>();
        int OX = 16;
        map.put("A",10);
        map.put("B",11);
        map.put("C",12);
        map.put("D",13);
        map.put("E",14);
        map.put("F",15);
        String str = scanner.nextLine();
        //切割ox前缀
        String oxs = str.substring(2);
        int sum = 0;
        int x = 0;
        for (int i = oxs.length()-1; i>=0; i--) {
            char c = oxs.charAt(i);
            String upperCase = String.valueOf(c).toUpperCase();
            Integer baseNum = map.get(upperCase);
            if (baseNum==null){
                baseNum = Integer.parseInt(upperCase);
            }
            int num = baseNum * (int) Math.pow(OX,x);
            x++;
            sum += num;
        }
        System.out.println(sum);

    }

}
