package com.faye.demo.ex.niuk;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/24
 **/
public class Classmate {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s = scanner.nextLine();
        boolean flag = true;
        List<Character> cls1 = new ArrayList<>();
        List<Character> cls2 = new ArrayList<>();
        cls1.add(s.charAt(0));
        for (int i = 1; i < s.length()-1; i+=2) {
            char lt = s.charAt(i + 1);
            if (lt == 'N'){
                flag = !flag;
            }
            if (flag){
                cls1.add(s.charAt(i));
            }else {
                cls2.add(s.charAt(i));
            }
        }
        System.out.println(cls1);
        System.out.println(cls2);
    }

}
