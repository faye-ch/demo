package com.faye.demo.ex.sync;

/*
 * @Author cyf
 * 线程体
 * @Date 2022/3/2
 **/
public class SyncThread implements Runnable {
    private static int i = 0;
    private LockObject lockObject = new LockObject();

    @Override
    public void run() {
        //1.对象锁
        //获得当前对象的锁才能执行改方法
        //但是该方法是对象方法，调用此方法需要创建对象
        //结果是交替打印 说明不存在锁竞争
        //new LockObject().method();

        //2.对象锁
        //将 lockObject 对象作为 SyncThread 的属性，并不是每次调用 mothod 方法都需要创建一个新的对象
        //结果是 thread-0 线程连续打印0~99 后到 thread-1连续打印 100~199
        //说明存在锁竞争 发生线程等待现象
        //lockObject.method();

        //3.类锁
        StaticLock.mothod();

    }

}
