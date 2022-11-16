package com.faye.demo.ex.annov2.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@RestController
@RequestMapping("/api")
public class TestControllerV2 {
    
    @Autowired
    private TestService testService;
    
    @GetMapping("/test/v1")
    public String test(){
        String sellerNo = "ZA";
        return testService.test(sellerNo);
    }

    @GetMapping("/test/v2")
    public String testV2(){
        String sellerNo = "LM";
        return testService.testV2(sellerNo);
    }
    
    
}
