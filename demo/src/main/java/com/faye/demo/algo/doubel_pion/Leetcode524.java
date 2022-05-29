package com.faye.demo.algo.doubel_pion;

import java.util.*;

public class Leetcode524 {

    public static void main(String[] args) {
        String s = "abpcplea";
        List<String> list = new ArrayList<>();
        list.add("ale");
        list.add("apple");
        list.add("monkey");
        list.add("plea");
        String longestWord = new Leetcode524().findLongestWord(s,list);
        System.out.println(longestWord);
    }

    public String findLongestWord(String s, List<String> dictionary) {
        Map<Character,Integer> map = new HashMap<>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            map.put(c,map.getOrDefault(c,0)+1);
        }

        boolean flag = true;
        List<String> res = new ArrayList<>();
        Map<Character,Integer> copymap = new HashMap<>();
        for (int i = 0; i < dictionary.size(); i++) {
            String s1 = dictionary.get(i);
            copymap.putAll(map);
            for (int j = 0; j < s1.length(); j++) {
                char c = s.charAt(j);
                Integer cnt = copymap.get(c);
                if (cnt!=null && cnt>=0){
                    copymap.put(c,cnt-1);
                }else {
                    flag = false;
                    break;
                }
            }
            if (flag){
                res.add(s1);
            }
            flag = true;
            copymap.clear();
        }
        if (res.isEmpty()){
            return "";
        }
        Collections.sort(res, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                if (o1.length() == o2.length()){
                    if (o1.charAt(0) > o2.charAt(0)){
                        return 1;
                    }else if (o1.charAt(0) == o2.charAt(0)){
                        return 0;
                    }
                }
                if (o1.length() < o2.length()){
                    return 1;
                }
                if (o1.length() > o2.length()){
                    return -1;
                }
                return 0;
            }
        });
        return res.get(0);
    }

}
