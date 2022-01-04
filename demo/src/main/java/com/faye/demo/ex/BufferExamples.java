package com.faye.demo.ex;

import java.io.FileOutputStream;
import java.util.Random;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/4
 **/
public class BufferExamples {

    public static void main(String[] args) throws Exception{
        Random r = new Random();
        String filename = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        FileOutputStream fout = new FileOutputStream(filename);

        long start = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            for (int j = 0; j < 5; j++) {
                fout.write(97+r.nextInt(5));
            }
        }

        fout.close();
        System.out.println(System.currentTimeMillis()-start);
    }

}
