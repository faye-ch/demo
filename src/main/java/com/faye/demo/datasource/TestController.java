package com.faye.demo.datasource;

import com.faye.demo.datasource.service.impl.SpringTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class TestController {
    
    @Autowired
    private SpringTransactional transactional;
    
    @GetMapping("/test")
    public String test(){
        transactional.insert();
        return "ok";
    }
    
    @GetMapping("/d-insert")
    public String doubleInsert(){
        transactional.doubleInsert();
        return "ok";
    }
    
}
