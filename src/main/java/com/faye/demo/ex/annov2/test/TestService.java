package com.faye.demo.ex.annov2.test;

import com.faye.demo.ex.annov2.aspect.SendMail;
import org.springframework.stereotype.Service;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@Service
public class TestService {

    @SendMail
    public String test(String sellerNo){
        return "ok";
    }

    @SendMail
    public String testV2(String sellerNo){
        return "fail";
    }
    
}
