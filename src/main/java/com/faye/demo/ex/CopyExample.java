package com.faye.demo.ex;

import org.springframework.beans.BeanUtils;

import java.util.HashMap;
import java.util.HashSet;

/*
 * @Author cyf
 * @Description 浅拷贝与深拷贝
 * @Date 2022/4/17
 **/
public class CopyExample {

    public static void main(String[] args) {
//        Person person = new Person();
//        person.setName("faye");
//        person.setAge(16);
//
//        Person p1 = new Person();
//        BeanUtils.copyProperties(person,p1);
//        System.out.println();
//        p1.setName("liu");
//        p1.setAge(15);
//        System.out.println();

        Integer num1 = 1;
        Integer num2 = 1;
        System.out.println(num1.equals(num2));
        String s = "s";
        System.out.println(Integer.parseInt(s));

    }

}
