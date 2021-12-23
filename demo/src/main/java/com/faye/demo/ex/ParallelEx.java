package com.faye.demo.ex;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.function.IntConsumer;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/*
 * @Author cyf
 * @Description
 * @Date 2021/12/22
 **/
public class ParallelEx {

    public static void main(String[] args) {

        Random random = new Random();
        List<Integer> list = IntStream.range(0, 1_000_000)
                .map(x -> random.nextInt(10_000_000))
                .boxed()
                .collect(Collectors.toList());
        long start = System.currentTimeMillis();
        System.out.println(start);
        System.out.println(list.stream().max((a,b)->a-b));
        System.out.println(System.currentTimeMillis()-start);

        long start01 = System.currentTimeMillis();
        System.out.println(start01);
        System.out.println(list.stream().max((a,b)->a-b));
        System.out.println(Runtime.getRuntime().availableProcessors());
        System.out.println(System.currentTimeMillis()-start01);

        int num = 5;
        List<Integer> nums = new ArrayList<>();




    }

}
