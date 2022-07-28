package com.faye.demo.temfile;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;

import java.util.Date;
import java.util.Map;

public class MapMergeTest {

    public static void main(String[] args) {
        Map<String, Object> map = Maps.newHashMap();
        map.put("surrender_time", new Date());
        map.put("order_no", "xxxxxxxxxxxxxxxx");
        String s = JSON.toJSONString(map);
        System.out.println(s);
    }
}
