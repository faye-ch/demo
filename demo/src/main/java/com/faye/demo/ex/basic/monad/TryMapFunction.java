package com.faye.demo.ex.basic.monad;

public interface TryMapFunction<T, R> {
    R apply(T t) throws Throwable;
}