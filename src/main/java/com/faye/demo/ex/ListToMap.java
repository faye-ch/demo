package com.faye.demo.ex;

import com.google.common.collect.Lists;
import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/22
 **/
public class ListToMap {

    public static void main(String[] args) {
        List<Student> list = Lists.newArrayList(new Student("faye",11)
                ,new Student("chen",12),new Student("wang",13));

        Map<String, Student> map = list.stream().collect(Collectors.toMap(Student::getName, v -> v));

        System.out.println();
    }

    @Data
    @Builder
    public static class Student{

        private String name;

        private Integer age;

    }
}
