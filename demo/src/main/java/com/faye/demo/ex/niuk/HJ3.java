package com.faye.demo.ex.niuk;

import java.util.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/27
 **/
public class HJ3 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String N = scanner.nextLine();
        Set<Integer> set = new HashSet<>();
        for (int i = 0; i < Integer.parseInt(N); i++) {
            String next = scanner.nextLine();
            set.add(Integer.parseInt(next));
        }
        List<Integer> list = set.stream().sorted().collect(Collectors.toList());
        for (Integer num : list) {
            System.out.println(num);
        }
    }
}
