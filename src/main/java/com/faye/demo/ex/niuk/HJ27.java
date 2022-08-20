package com.faye.demo.ex.niuk;

import java.util.*;
import java.util.stream.Collectors;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/17
 **/
public class HJ27 {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        List<String> letters = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            String next = scanner.next();
            letters.add(next);
        }
        String key = scanner.next();
        Map<Character,Integer> map = toMap(key);
        int index = scanner.nextInt();
        List<String> broList = new ArrayList<>();
        for (String letter : letters) {
            if (key.length()!=letter.length()||key.equals(letter)){
                continue;
            }
            Map<Character, Integer> annoMap = toMap(letter);
            boolean b = check(letter,map,annoMap);
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

    private static boolean check(String letter, Map<Character, Integer> map, Map<Character, Integer> annoMap) {
        for (int i = 0; i < letter.length(); i++) {
            char c = letter.charAt(i);
            Integer keyNum = map.get(c);
            if (keyNum==null){
                return false;
            }
            Integer annoNum = annoMap.get(c);
            if (!annoNum.equals(keyNum)){
                return false;
            }
        }
        return true;
    }

    private static Map<Character, Integer> toMap(String key) {
        Map<Character,Integer> map = new HashMap<>();
        for (int i = 0; i < key.length(); i++) {
            map.put(key.charAt(i),map.getOrDefault(key.charAt(i),0)+1);
        }
        return map;
    }


}
