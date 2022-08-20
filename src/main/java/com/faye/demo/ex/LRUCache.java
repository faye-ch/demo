package com.faye.demo.ex;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Spliterator;
import java.util.function.Consumer;

/*
 * @Author cyf
 * LRU 最近少用算法
 * 为什么选择 LinkHashMap ? 因为 LinkHashMao 是有序存储 , 可以实现元素的先进先出功能
 * HashMap 是无序的
 * @Date 2021/12/20
 **/
public class LRUCache<K,V> implements Iterable {

    private static int MAX_SIZE = 3;
    private LinkedHashMap<K,V> cache = new LinkedHashMap<>();

    public void cache(K key,V value){
        if (cache.containsKey(key)){
            cache.remove(key);
        }else if (cache.size() >= MAX_SIZE){
            Iterator<K> it = cache.keySet().iterator();
            K first = it.next();
            cache.remove(first);
        }
        cache.put(key,value);
    }

    @Override
    public Iterator<K> iterator() {
        Iterator<Map.Entry<K, V>> it = cache.entrySet().iterator();
        return new Iterator<K>() {
            @Override
            public boolean hasNext() {
                return it.hasNext();
            }

            @Override
            public K next() {
                return it.next().getKey();
            }
        };
    }

    @Override
    public void forEach(Consumer action) {

    }

    @Override
    public Spliterator spliterator() {
        return null;
    }
}
