package com.faye.demo.ex;

import org.junit.Test;

import javax.crypto.spec.PSource;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Random;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/4
 **/
public class BufferExamples {


    //耗时 8000 ms
    public static void main(String[] args) throws Exception{
        //没有缓冲区
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

    @Test
    //耗时 5000 ms
    public void read_tests()throws Exception{
        String filename = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        FileInputStream in = new FileInputStream(filename);
        long start = System.currentTimeMillis();

        int b;
        while ((b=in.read())!=-1){

        }
        System.out.println(System.currentTimeMillis()-start);
    }

    @Test
    //单个字符读取 耗时 81ms
    //使用缓冲区读取 2ms
    public void read_test_buffer()throws Exception{
        String filename = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(filename));
        long start = System.currentTimeMillis();

        int b;
        //使用缓冲区读取
        byte[] buff = new byte[1024 * 8];
        while ((b=in.read(buff))!=-1){

        }
        in.close();
        System.out.println(System.currentTimeMillis()-start);
    }

    @Test
    // 4 ms
    public void read_nio()throws Exception{
        String filename = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        FileChannel channel = new FileInputStream(filename).getChannel();
        ByteBuffer buffer = ByteBuffer.allocate(1024 * 8);
        long start = System.currentTimeMillis();
        while (channel.read(buffer)!=-1){
            //翻转 ？？
            buffer.flip();
            //读取数据
//            System.out.println(new String(buffer.array()));
            //清空缓冲区 继续写入
            buffer.clear();
        }
        channel.close();
        System.out.println(System.currentTimeMillis() - start);
    }


}
