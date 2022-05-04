package com.faye.demo.ex.view;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ12 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s = scanner.nextLine();
        System.out.println(new StringBuilder(s).reverse());
    }

}
