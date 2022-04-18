package com.faye.demo.ex;

import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/30
 **/
public class test03 {

    public static void main(String[] args) {
//        //map get null
//        Map<String,String> map = new HashMap<>();
//        String s = map.get(null);
//        System.out.println();
//
//        //NaN
//        double b1 = 0.0;
//        double b2 = 0.0;
//        System.out.println(b1/b2);
//
//        //Infinite
//        double b3 = 1.0;
//        double b4 = 0.0;
//        System.out.println(b3/b4);
//
//        //
//        Integer b5 = 1;
//        Integer i1 = 0;
//        System.out.println(b5/i1);


        String s = "abc";
        if (StringUtils.isBlank(s) || s.length()<2){
            System.out.println("ok");
        }

//        double number = 15;
//        double numbers = 25;
//        System.out.println(1-(number/numbers));


    }

}
