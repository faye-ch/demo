package com.faye.demo.ex;

import org.junit.Test;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

/*
 * @Author cyf
 * 词频分析
 * @Date 2022/1/5
 **/
public class WordCount {

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

        System.out.println(totalMap.get("ababb"));
        System.out.println(totalMap.size());
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

}
