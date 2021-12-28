package com.faye.demo.ex;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description flatMap 将多维的转为一维的
 * @Date 2021/12/22
 **/
public class FlatMapEx {

    public static void main(String[] args) {
        List<List<Integer>> dmLists = new ArrayList<>
                (Arrays.asList(Arrays.asList(1,2,3),Arrays.asList(4,5,6)));
        System.out.println(dmLists);

        List<Integer> numList = dmLists.stream().flatMap(Collection::stream).collect(Collectors.toList());
        System.out.println(numList);
    }

}
