package com.faye.demo.ex;

import java.util.stream.Stream;

/*
 * Event:上下文容器
 * T : 容器下真实要做的事情
 *(A->B) -> (M(A)->M(B)) M:envent
 * map 方法 : 自函子
 * Trabsfrom::transform 是什么 ? 可插拔式程序 复用性强
 * 群：一类符合某种条件的对象 Optional Stream Event
 * 子函子上的群 : 群中的对象和子函子一起使用达到某种效果 ：
 *      封闭性 ：Optional.of(100) * Optional.of(100) = Optional.of(10000) M*M -> M
 *      结合律 ：Optional(100)|op1|opt2...|Optional<?> a*b*c = a*(b*c)
 *      单元位 ：empty * any = empty  a*e = e*a = a
 **/
public class Event<T> {

    T data;

    public Event(T data){
        this.data = data;
    }

    static class EventData{
        Integer id;
        String msg;
        public EventData(Integer id,String msg){
            this.id = id;
            this.msg = msg;
        }

        @Override
        public String toString() {
            return "EventData{" +
                    "id=" + id +
                    ", msg='" + msg + '\'' +
                    '}';
        }
    }

    static class Transforms{
        static EventData transform(Integer id){
            switch (id){
                case 0 :
                    return new EventData(id,"Start");
                case 1 :
                    return new EventData(id,"Running");
                case 2:
                    return new EventData(id,"Done");
                case 3:
                    return new EventData(id,"Fail");
                default:
                    return new EventData(id,"Error");
            }
        }
    }

    @FunctionalInterface
    interface FN<A,B>{
        B apply(A a);
    }

    //<B> 声明B泛型
    //Event<?> 泛型未知
    //参数：FN<T,B> 需要传入一个函数式接口，传入FN接口
    //在方法体内调用
    <B> Event<?> map(FN<T,B> f){
        return new Event<B>(f.apply(this.data));
    }

    public static void main(String[] args) {
        Stream<Event<Integer>> stream = Stream.of(
                new Event(0),
                new Event(1),
                new Event(2),
                new Event(3),
                new Event(10)
        );

        // Transfroms::transfrom 就是 apply 的实现
        stream.map(event -> event.map(Transforms::transform))
                .forEach(e->{
                    System.out.println(e.data);
                });

    }

}
