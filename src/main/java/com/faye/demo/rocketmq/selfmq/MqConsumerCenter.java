package com.faye.demo.rocketmq.selfmq;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MqConsumerCenter {
    
    private final static Map<String,AbstractConsumer> classLoads = new HashMap<>();
    
    
    
    
}
