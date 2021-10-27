package com.faye.demo.rocketmq.consumer;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeOrderlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeOrderlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerOrderly;
import org.apache.rocketmq.common.message.MessageExt;

import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2021/10/26
 **/
public class Consumer {
    public static void main(String[] args) throws Exception{
        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer("faye");
        consumer.setNamesrvAddr("127.0.0.1:9876");
        //订阅消息监听器
        consumer.subscribe("TopicTest","*");
        //4.注册消息监听器
        // MessageListenerOrderly() 顺序消费
        consumer.registerMessageListener(new MessageListenerOrderly() {
            @Override
            public ConsumeOrderlyStatus consumeMessage(List<MessageExt> msgs, ConsumeOrderlyContext context) {
                for (MessageExt msg : msgs) {
                    System.out.println("线程名称"+Thread.currentThread().getName()+":"+new String(msg.getBody()));
                }
                return ConsumeOrderlyStatus.SUCCESS;
            }
        });
        //5.启动消费者
        consumer.start();
        System.out.println("消费者启动成功");
    }
}
