package com.faye.demo.ex.basic.monad;

public interface TrySupplier<T>{
    T get() throws Throwable;
}
