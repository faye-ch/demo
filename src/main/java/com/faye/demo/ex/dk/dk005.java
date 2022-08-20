package com.faye.demo.ex.dk;

import java.util.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/19
 **/
public class dk005 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int core = Integer.valueOf(scanner.nextLine());
        int n = Integer.valueOf(scanner.nextLine());
        List<Integer> nums = new ArrayList<>(n);
        for (int i = 0; i < n ; i++) {
            nums.add(scanner.nextInt());
        }
        nums.sort(Integer::compareTo);
        Collections.reverse(nums);

        int s = 0;
        while (!nums.isEmpty()){
            int cnt = 0;
            while (cnt < core && !nums.isEmpty()){
                if (nums.size()<core){
                    core = nums.size();
                    cnt = 0;
                }
                if (nums.get(cnt)!=0) {
                    nums.set(cnt, nums.get(cnt) - 1);
                    cnt++;
                }
                nums = nums.stream().filter(v->v!=0).sorted(Comparator.comparing(Integer::intValue).reversed()).collect(Collectors.toList());
            }
            s++;
        }
        System.out.println(s);
    }

}
