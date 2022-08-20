package com.faye.demo.ex;

import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.util.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/30
 **/
public class test03 {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int num = scan.nextInt();
        List<Integer> list = new ArrayList<>();
        Map<Integer, Integer> map = Maps.newHashMap();
        while (num>0){
            int single = num%10;
            num = num/10;
            list.add(single);
            Integer mapNum = map.get(single);
            if (mapNum==null){
                map.put(single,1);
            }else {
                map.put(single, mapNum+1);
            }
        }

        List<Integer> list1 = new ArrayList<>();
        int max = 0;
        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
            Integer value = entry.getValue();
            if (value>max){
                max = value;
                list1.clear();
                list1.add(entry.getKey());
            }else if (value==max){
                list1.add(entry.getKey());
            }
        }
        System.out.println(Arrays.toString(list.toArray()));
        System.out.println(Arrays.toString(list1.toArray()));
    }

}
