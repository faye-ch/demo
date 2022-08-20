package com.faye.demo.ex.dclone;

import java.io.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/3/1
 **/
public class SerialCloneUtils {

    public static <T extends Serializable> T deepClone(T t)throws CloneNotSupportedException{

        //保存对象为字节数组
        try{
            ByteArrayOutputStream bout = new ByteArrayOutputStream();

            //序列化输出流：将对象转为字节数据
            //ByteArrayOutputStream 传入到 ObjectOutputStream 中，
            try(ObjectOutputStream out = new ObjectOutputStream(bout)){
                // ObjectOutputStream 将对象转化成字节数据写入到 ByteArrayOutputStream
                out.writeObject(t);
            }
            //从字节数组中读取克隆对象
            try(InputStream bin = new ByteArrayInputStream(bout.toByteArray())){
                //序列化输入流读取对象
                ObjectInputStream in = new ObjectInputStream(bin);
                return (T)(in.readObject());

            }
        } catch (IOException | ClassNotFoundException e){
            CloneNotSupportedException cloneNotSupportedException = new CloneNotSupportedException();
            e.initCause(cloneNotSupportedException);
            throw cloneNotSupportedException;
        }
    }

}
