package com.faye.demo.ex.proxyv;

import org.junit.Test;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/10
 **/
public class ProxyEampleTest {

    @Test
    public void testProxy()throws Exception{
        IOrder order = Aspect.getProxy(Order.class,"com.faye.demo.ex.proxyv.TimeUsageAspect");
        order.pay();;
        order.show();
    }

}
