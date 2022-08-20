package com.faye.demo.spring.singleton;



/**
 * Spring bean 默认是单例的
 * 不是常量最好不要定义为 Spring bean 的成员属性
 * 测试并发下Spring bean 成员属性带来的线程不安全问题
 */
public class SingletonTest {
    
    private String content;
    
    public void setContent(String content){
        this.content = content;
    }
    
    public String getContent(){
        return this.content;
    }
    
    
}
