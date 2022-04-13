package com.faye.demo.ex;

import com.google.common.collect.Lists;

import java.util.ArrayList;
import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/13
 **/
public class ArrayOrLinkTheListTest {

    public static void main(String[] args) {

        //插入时间复杂度对比
        ArrayOrLinkTheListTest test = new ArrayOrLinkTheListTest();
//        test.arraylistAdd();
        //118 ms
//        test.linkedlistAdd();

        //按照位置插入
//        test.linkedlistOnAdd();
        test.arraylistOnAdd();

    }

    private void arraylistOnAdd() {
        List<String> arrayList = Lists.newArrayList();
        long startDate = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            int index = 0;
            arrayList.add(index,i+"");
        }
        long results = System.currentTimeMillis()-startDate;
        System.out.println("array按照位置插入 :"+results);
    }

    private void linkedlistOnAdd() {
        List<String> linkedList = Lists.newLinkedList();
        long startDate = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            int index = 0;
            if (i>1){
                index = linkedList.size()-1;
            }
            linkedList.add(index,i+"");
        }
        long results = System.currentTimeMillis()-startDate;
        System.out.println("linked按照位置插入 :"+results);
    }

    private void linkedlistAdd() {
        List<String> linkedList = Lists.newLinkedList();
        long startDate = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            linkedList.add(i+"");
        }
        long results = System.currentTimeMillis()-startDate;
        System.out.println("linked末尾插入 :" +results);
    }

    private void arraylistAdd(){
        List<String> arrayList = new ArrayList<>();
        long startDate = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            arrayList.add(i+"");
        }
        long results = System.currentTimeMillis()-startDate;
        System.out.println("array末尾插入 :"+results);
    }

}
