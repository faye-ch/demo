package com.faye.demo.ex.dk;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/18
 **/
public class dk002 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String arrStr = scanner.nextLine();
        String arrStr1 = scanner.nextLine();
        int k = scanner.nextInt();

        List<Integer> arr = Arrays.stream(arrStr.split(" ")).map(Integer::valueOf).collect(Collectors.toList());
        List<Integer> arr1 = Arrays.stream(arrStr1.split(" ")).map(Integer::valueOf).collect(Collectors.toList());
        List<Integer> addList = new ArrayList<>();
        for (Integer num : arr) {
            for (Integer num1 : arr1) {
                addList.add(num + num1);
            }
        }
        addList.sort(Integer::compareTo);
        int result = 0;
        for (int i = 0; i < k; i++) {
            result = result + addList.get(i);
        }
        System.out.println(result);
    }

}
