package com.faye.demo.ex;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 * @Author cyf
 * 使用try-with-resource 的方式来回收资源
 * 若有多个资源则使用分号来分隔
 * @Date 2022/1/6
 **/
public class TryWithResource {

    public static void main(String[] args) {

        String path = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        try(FileInputStream inputStream = new FileInputStream(path);
            final FileOutputStream outputStream = new FileOutputStream(path)){

        }catch (IOException e){

        }

    }

}
