package com.faye.demo.ex.redis;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Arrays;
import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/7
 **/
public class RedisPipeline {

    public static void main(String[] args) throws Exception{
        RedisPipeline test = new RedisPipeline();
        test.batchInsertToRedis();
        test.insertToRedis();
    }

    public void insertToRedis()throws Exception{
        String path = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(path));
        byte[] buff = new byte[1024 * 512];
        StringBuilder builder = new StringBuilder();
        while (bufferedInputStream.read(buff)!=-1){
            builder.append(new String(buff));
        }
        Jedis jedis = new Jedis("127.0.0.1", 6379, 1000);
        List<String> list = Arrays.asList(builder.toString().split(" "));
        long start = System.currentTimeMillis();
        for (int i = 0; i < list.size(); i++) {
            jedis.lpush("list3",list.get(i));
        }
        long result = System.currentTimeMillis() - start;
        System.out.println("jedis:  "+result+" ms");
        jedis.close();
    }

    public void batchInsertToRedis() throws Exception{
        String path = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(path));
        byte[] buff = new byte[1024 * 512];
        StringBuilder builder = new StringBuilder();
        while (bufferedInputStream.read(buff)!=-1){
            builder.append(new String(buff));
        }
        Jedis jedis = new Jedis("127.0.0.1", 6379, 1000);
        Pipeline pipelined = jedis.pipelined();
        List<String> list = Arrays.asList(builder.toString().split(" "));
        System.out.println("size:"+list.size());
        long start = System.currentTimeMillis();
        for (int i = 0; i < list.size(); i++) {
            pipelined.lpush("list2",list.get(i));
            if (i%1000==0){
                pipelined.sync();
            }
        }
        long result = System.currentTimeMillis() - start;
        System.out.println("pipe:  "+result+" ms");
        pipelined.close();
        jedis.close();
    }

}
