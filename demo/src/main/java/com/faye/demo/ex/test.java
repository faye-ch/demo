package com.faye.demo.ex;

import java.util.*;

public class test{
    public static void main(String[] args) {
        //10:1010
        //>> 1 -> 0101(5)
        System.out.println(10>>1);

        //1:0001
        //>>1 0000
        System.out.println(2>>1);
        test[] l = new test[1];
        ArrayList<String> list = new ArrayList<>();
        Vector<String> list1 = new Vector<>();
        LinkedList linkedList = new LinkedList();

        //hashmap 支持key-null value-null
        Map<String, String> hashmap = new HashMap<>();
        hashmap.put(null,null);
        System.out.println();

        //hashtable 不支持 key-null && value-null
        Map<String, String> hashtable = new Hashtable<>();
        hashtable.put(null,null);
        System.out.println();

    }
}