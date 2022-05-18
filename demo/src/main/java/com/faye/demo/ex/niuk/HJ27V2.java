package com.faye.demo.ex.niuk;

import java.util.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/18
 **/
public class HJ27V2 {


    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        List<String> letters = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            String next = scanner.next();
            letters.add(next);
        }
        String key = scanner.next();
        int index = scanner.nextInt();
        List<String> broList = new ArrayList<>();
        for (String letter : letters) {
            if (key.length()!=letter.length()||key.equals(letter)){
                continue;
            }
            boolean b = check(key,letter);
            if (b){
                broList.add(letter);
            }

        }
        List<String> soredList = broList.stream().sorted().collect(Collectors.toList());
        System.out.println(soredList.size());
        if (index<=broList.size()){
            System.out.println(soredList.get(index - 1));
        }
    }

    private static boolean check(String key, String letter) {
        char[] keys = key.toCharArray();
        char[] lets = letter.toCharArray();
        Arrays.sort(keys);
        Arrays.sort(lets);
        return new String(keys).equals(new String(lets));
    }

}
