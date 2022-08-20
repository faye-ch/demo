package com.faye.demo.tempfile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhongan.scorpoin.common.ZhongAnApiClient;
import com.zhongan.scorpoin.common.dto.CommonRequest;
import com.zhongan.scorpoin.common.dto.CommonResponse;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：2022 07:18
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
public class Hello {
    
    //CYF
    //cyf

    public static void main(String[] args) throws Exception{

        String appkey = "fe1812a47aabfe01bdd643d5ee1d50ab";
        String privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAO8h8JCJAMb1nd0uBkzZuWyNnL+atBzJKvIG7escD45ODf0AWKr8vSqLZ01HD86+a496CGjsae6GybK8C1MqiMSwaAsIv31nKD6U8xF607MPrD3r2lyjwUnmqBZY++R6yFNYz9ZDXcdiwCudESRsXunPJq7zfnnglCtEH+qqW8/VAgMBAAECgYEAnVc2gtMyKLbZTPuId65WG7+9oDB5S+ttD1xR1P1cmuRuvcYpkS/Eg6a/rJASLZULDpdbyzWqqaAUPD8QMINvAr3ZtkbwH5R0F/4aqOlx/5B0Okjsp3eSK2bQ8J2m/MmFKZxr6Aily7YUDdxcGcjLizsGi1KDkWS22JRufEeUNA0CQQD+g1XJ7ELqmUtrS4m4XnadB25f0g5QC0tMjoa3d9soMzK3q+Drkv8EZVpGSmSHEo1VlE7HUcnKNvK1BO5Nm4iXAkEA8IeZxaWmEcsRqiuFz8xmYGtKcYTmHgheGF4D+fnnFozSNP+3sS1lfgFQrjUkqUyZOoG1hPc6SDhGS4nbXwiscwJASO+gPR58yrgledkK3ZAMk9GWWtVajqu953GMv7UUU//gD+yspzXX6Q2WgkA9cMvrPtQig1I37sAya5e/JvRkfwJARzzCDEmdP9PW7YFqZjrxb0kXiTuFNAviYnEl2FltWb5nW48JBo6dao5VKONQclvfXfagnjriphUUrLatpB3bhQJAKRfJS6jDAIVKt7So5HOdzk4ipxgrMjG/QtZ1grO+VQectk4+tCwdJhOrr5blvdPQvFVqXBQfXuE7cibZrGs4sQ==";
        String version = "1.0.0";
        ZhongAnApiClient client = new ZhongAnApiClient("uat",appkey,privateKey,version);
        String serviceName = "zhongan.open.individual.generic.getProductCode";
        CommonRequest request = new CommonRequest(serviceName);
        

        JSONObject map = new JSONObject();
        map.put("productSeriesCode", "DC24");
        map.put("channelCode", "EY3AZ38");
        map.put("clauses",new JSONArray());
        map.put("liabilityPremium", new JSONArray());
        map.put("liabilityAmount", new JSONArray());
        map.put("clauseCode", new JSONArray());
        map.put("clauseAmount", new JSONArray());
        //业务参数
        JSONObject param = new JSONObject();
        param.put("requestParam", map.toJSONString());
        request.setParams(param);
        //发起请求
        CommonResponse response = (CommonResponse) client.call(request);
        System.out.println(response.getBizContent());
        
    }
}
