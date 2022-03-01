package com.faye.demo.ex.dclone;

import java.io.Serializable;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/1
 **/
public class SerialClone implements Cloneable, Serializable {

    private static final long serialVersionUID = 5794148504376232369L;

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return SerialCloneUtils.deepClone(this);
    }
}
