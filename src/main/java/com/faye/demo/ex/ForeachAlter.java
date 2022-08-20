package com.faye.demo.ex;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/18
 **/
public class ForeachAlter {

    public static void main(String[] args) {
        List<Person> list = Arrays.asList(new Person("cyun",15), new Person("yui",20));
        for (Person person : list) {
            person.setAge(100);
        }
        System.out.println();

    }

}
