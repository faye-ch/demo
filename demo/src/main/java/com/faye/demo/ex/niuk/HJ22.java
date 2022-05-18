package com.faye.demo.ex.niuk;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * @Author cyf
 * @Date 2022/5/16
 * 提前消费
 **/
public class HJ22 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num = Integer.parseInt(scanner.next());
        List<Integer> results = new ArrayList<>();
        while (num!=0) {
            int goods = 0;
            while (num>=2){
                int dv = num/3;
                goods = goods + dv;
                num = dv+(num-dv*3);
                if (num==2){
                    goods++;
                    break;
                }
            }
            results.add(goods);
            num = Integer.parseInt(scanner.next());
        }

        for (Integer result : results) {
            System.out.println(result);
        }
    }

}
