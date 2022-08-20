package com.faye.demo.ex.link;

public interface ILinkedList<E> {

    Node<E> get(int index);

    void add(E data);

    void add(E data,int index);

    boolean remove(int index);

    void remove();

    int getSize();

    void print();



}
