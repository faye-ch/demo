package com.faye.demo.datasource.dbswitch;

import java.lang.annotation.*;

@Target(value = ElementType.METHOD)
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
public @interface Db {
    
    String value();
    
}
