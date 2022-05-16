package com.faye.demo.ex.view;

import java.util.HashMap;
import java.util.Map;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/16
 **/
public class HJ21V2 {

    public static void main(String[] args) {
        //map 解法 : 遍历 keySet,若包含则使用key取出来
        Map<String,Integer> map = new HashMap<>();
        String c = "d";
        for (String key : map.keySet()) {
            if (key.contains(c)){
                Integer num = map.get(key);
            }
        }
    }

}
