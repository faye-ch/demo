package com.faye.demo.ex.niuk;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/27
 **/
public class HightEX {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int one = scanner.nextInt();
        scanner.nextLine();
        String str = scanner.nextLine();
        String[] strArr = str.split(" ");
        List<Integer> list = new ArrayList<>();
        for (String s : strArr) {
            int number = one - Integer.parseInt(s);
            list.add(Math.abs(number));
        }
        list = list.stream().sorted().collect(Collectors.toList());
        System.out.println(Arrays.toString(list.toArray()));
    }

}
