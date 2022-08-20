package com.faye.demo.tempfile;

import com.alibaba.fastjson.JSONObject;

public class JsonToBean {

    public static void main(String[] args) {
        String s = "{\n" +
                "  \"groupPolicyNo\": \"xxxx\",\n" +
                "  \"insuredRefundPremium\": 1985,\n" +
                "  \"terminateTime\": \"2022-07-27\"\n" +
                "}";
        JSONObject req = JSONObject.parseObject(s);
        System.out.println(req.getString("terminateTime"));
        System.out.println(req.getString("groupPolicyNo"));
        System.out.println(req.getString("insuredRefundPremium"));

        String property = System.getProperty("user.dir");
        System.out.println(property);
    }

}
