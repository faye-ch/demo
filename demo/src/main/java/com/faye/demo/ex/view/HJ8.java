package com.faye.demo.ex.view;

import java.util.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/4/28
 **/
public class HJ8 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        scanner.nextLine();
        Map<Integer, Integer> map = new TreeMap<>(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                if (o1>o2){
                    return 1;
                }else if (o1.equals(o2)){
                    return 0;
                }
                return -1;
            }
        });
        for (int i = 0; i < N ; i++) {
            String str = scanner.nextLine();
            String[] split = str.split(" ");
            Integer index = Integer.parseInt(split[0]);
            Integer value = Integer.parseInt(split[1]);
            Integer hasValue = map.get(index);
            if (hasValue==null){
                map.put(index,value);
            }else {
                map.put(index,hasValue+value);
            }
        }

        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
            System.out.println(entry.getKey()+" "+entry.getValue());
        }

    }

}
