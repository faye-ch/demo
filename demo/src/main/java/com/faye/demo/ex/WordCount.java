package com.faye.demo.ex;

import org.junit.Test;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.Callable;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;

/*
 * @Author cyf
 * 词频分析
 * @Date 2022/1/5
 **/
public class WordCount {

    final ForkJoinPool pool = ForkJoinPool.commonPool();

    //单线程
    @Test
    public void compare_with_single()throws Exception{
        String path = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(path));
        //缓冲区
        byte[] buff = new byte[4 * 1024];
        //读取长度标记
        int len = 0;
        long start = System.currentTimeMillis();

        Map<String, Integer> totalMap = new HashMap<>();
        while ((len=in.read(buff))!=-1){
            //可以直接 new String(buff) , 使用 copy 的原因是可能读取的内容没有填充满缓冲区
            byte[] bytes = Arrays.copyOfRange(buff, 0, len);
            String str = new String(bytes);
            Map<String, Integer> wordMap = countByString(str);
            for (Map.Entry<String, Integer> entry : wordMap.entrySet()) {
                incKey(entry.getKey(),totalMap,entry.getValue());
            }
        }

        System.out.println("cnt:"+totalMap.get("ababb"));
        System.out.println("size:"+totalMap.size());
        System.out.println(System.currentTimeMillis()-start);

    }

    private Map<String,Integer> countByString(String str) {
        Map<String, Integer> map = new HashMap<>();
        StringTokenizer tokenizer = new StringTokenizer(str);
        while (tokenizer.hasMoreTokens()){
            String s = tokenizer.nextToken();
            incKey(s,map,1);
        }
        return map;
    }

    private void incKey(String s, Map<String, Integer> map, int n) {
        if (map.containsKey(s)){
            map.put(s,map.get(s)+n);
        }else {
            map.put(s,n);
        }
    }

    //实现线程的三种方式：继承 Thread、实现Runable、实现Callable
    //Callable 可以返回结果
    class CountTask implements Callable{

        private final long start;
        private final long end;
        private final String filename;

        public CountTask(String filename,long start,long end){
            this.start = start;
            this.end = end;
            this.filename = filename;
        }

        @Override
        public Object call() throws Exception {
            //使用 RandomAccessFile 读取流数据
            FileChannel channel = new RandomAccessFile(filename, "rw").getChannel();
            //将流数据映射到用户内存空间
            // 内存映射文件
            // [start, end] -> Memory
            // Device -> Kernel Space -> UserSpace(buffer) -> Thread
            MappedByteBuffer buffer = channel.map(FileChannel.MapMode.READ_ONLY, start, end - start);
            //解码 解析为字符串
            String str = StandardCharsets.US_ASCII.decode(buffer).toString();
            return countByString(str);
        }
    }

    public void run(String filename,long chunkSize)throws Exception{
        File file = new File(filename);
        long fileSize = file.length();
        List<ForkJoinTask<Map<String, Integer>>> list = new ArrayList<>();
        long start = System.currentTimeMillis();
        //读取起始位置
        long position = 0;
        while (position<fileSize){
            long next = Math.min(position + chunkSize, fileSize);
            CountTask task = new CountTask(filename, position, next);
            position = next;
            ForkJoinTask<Map<String, Integer>> future = pool.submit(task);
            list.add(future);
        }

        Map<String, Integer> totalMap = new HashMap<>();
        for (ForkJoinTask<Map<String, Integer>> future : list) {
            Map<String, Integer> map = future.get();
            for (Map.Entry<String, Integer> entry : map.entrySet()) {
                incKey(entry.getKey(),totalMap,entry.getValue());
            }
        }

        System.out.println("cnt:"+totalMap.get("ababb"));
        System.out.println("size:"+totalMap.size());
        System.out.println(System.currentTimeMillis()-start);
    }

    @Test
    public void count()throws Exception{
        String path = "C:\\Users\\Administrator.DESKTOP-EFOTAD8\\Desktop\\text.txt";
        WordCount count = new WordCount();
        count.run(path,1024*128);

        // 阿姆达定律
        // 120s(单线程) -> 16core(16核多线程) -> 120/16 = ?
        // P(不可多线程执行的任务)    NP(可多线程执行的任务)
        // 词频分析是可多线程执行的任务，但是从磁盘读取数据并不是可多线程执行的任务
        // 所以速度不能解决理论值
    }



}
