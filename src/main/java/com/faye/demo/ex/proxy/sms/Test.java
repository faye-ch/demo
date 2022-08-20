package com.faye.demo.ex.proxy.sms;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import jdk.nashorn.internal.ir.SetSplitState;

import javax.swing.*;
import java.util.List;
import java.util.Set;

/*
 * @Author cyf
 * @Date 2022/1/6
 * 测试 使用
 **/
public class Test {

    public static void main(String[] args) {
        ISmsService smsService = JdkProxyFactory.getProxy(SmsServiceImpl.class);
        smsService.sendV2("hello");

        Set<Integer> list = Sets.newHashSet();
        Set<Integer> list1 = Sets.newHashSet(1,2,3);

        list.retainAll(list1);
        System.out.println();

        String s = null;
        System.out.println(""+s);
    }

}
