package com.faye.demo.ex.annov2.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@Aspect
@Component
public class SendMailAspect {

    /**
     * 定义切点
     */
    @Pointcut("@annotation(com.faye.demo.ex.annov2.aspect.SendMail)")
    public void pointcut(){
        
    }
    
    @Around(value = "pointcut() && @annotation(annotation)")
    public Object around(ProceedingJoinPoint joinPoint, SendMail annotation)throws Throwable{
        String result = (String)joinPoint.proceed();
        Object[] args = joinPoint.getArgs();
        String sellerNo = (String)args[0];
        if ("fail".equals(result)){
            System.out.println(String.format("发送邮件 seller:%s",sellerNo));
        }
        return result;
    }
    
}
