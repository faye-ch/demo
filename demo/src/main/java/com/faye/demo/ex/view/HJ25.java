package com.faye.demo.ex.view;

import com.faye.demo.ex.Person;

import java.util.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/17
 **/
public class HJ25 {

    public static void main(String[] args) {
        Map<Integer, Date> map = new HashMap<>();
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(1);
        for (Integer num : list) {
            map.put(num,new Date());
        }
        List<Person> list1 = new ArrayList<>();
        list1.add(new Person("chen",18));
        list1.add(new Person("chen",18));
        Map<String, Person> map1 = list1.stream().collect(Collectors.toMap(v -> v.getName(), v -> v));
    }

}
