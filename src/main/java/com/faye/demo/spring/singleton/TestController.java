package com.faye.demo.spring.singleton;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class TestController {
    
    @Autowired
    private SingletonTest singleton;
    
    @PostMapping("/insert")
    public String insertTest(@RequestParam(name = "content")String content){
        singleton.setContent(content);
        return singleton.getContent();
    }
    
}
