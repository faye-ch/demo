package com.faye.demo.ex;

import lombok.Data;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/17
 **/
@Data
public class Person {

    private String name;

    private Integer age;

    public Person(String name,Integer age){
        this.name = name;
        this.age = age;
    }

    public static void test(){
        //不能直接访问类实例成员
        //可以通过对象访问
//        Person person = new Person();
//        String name = person.name;
    }

}
