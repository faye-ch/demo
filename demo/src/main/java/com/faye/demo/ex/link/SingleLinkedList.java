package com.faye.demo.ex.link;


import org.junit.Test;

/*
 * @Author cyf
 * 单向链表
 * @Date 2022/1/11
 **/
public class SingleLinkedList<E> implements ILinkedList<E> {

    private Node<E> head;

    private Node<E> last;

    private int size;

    public SingleLinkedList(){
        this.head = new Node<>();
        last = head;
    }

    @Override
    public Node<E> get(int index){
        if (index<0 || index>size){
            return null;
        }
        Node<E> node = head.getNext();
        for (int i = 0; i < index; i++) {
            node = node.getNext();
        }
        return node;
    }

    @Override
    public void add(E data){
        Node<E> node = new Node<>(data);
        last.setNext(node);
        last = node;
        size ++ ;
    }

    //按指定位置插入元素，旧元素位置向后移动
    @Override
    public void add(E data,int index){
        if (index < 0 || index > size || size ==0){
            return;
        }
        //创建新结点
        Node<E> newNode = new Node<>(data);
        //查找插入位置的前一个结点
        Node<E> oldPreNode = get(index-1);
        //插入位置的当前结点
        Node<E> oldNode = oldPreNode.getNext();

        //新结点链接
        oldPreNode.setNext(newNode);
        //旧结点链接
        newNode.setNext(oldNode);
        size ++;
    }

    @Override
    public boolean remove(int index){
        if (index < 0 || index > size){
            return false;
        }
        if (index == 0){
            Node<E> next = head.getNext();
            head.setNext(next.getNext());
            size -- ;
            return true;
        }
        //找到目标结点的上一个节点
        Node<E> preNode = get(index-1);
        //目标结点
        Node<E> node = preNode.getNext();
        //目标结点的下一个结点
        Node<E> next = node.getNext();

        //剔除目标结点 目标上一结点 与 目标当前结点链接
        preNode.setNext(next);
        node.setNext(null);
        size --;
        return true;
    }

    //移除最后一个元素
    @Override
    public void remove(){
        Node<E> preNode = get(size - 2);
        if(preNode==null){
            preNode = head;
        }
        Node<E> next = preNode.getNext();
        next.setData(null);
        last = preNode;
        size --;
    }

    @Override
    public int getSize(){
        return size;
    }

    @Override
    public void print(){
        StringBuilder builder = new StringBuilder("{");
        for (int i = 0; i < size; i++) {
            builder.append("["+get(i).getData()+"]");
        }
        builder.append("}");
        System.out.println(builder.toString());
    }


    @Test
    public static void main(String[] args) {
        SingleLinkedList<Integer> linkedList = new SingleLinkedList<>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(3);
        linkedList.print();
        linkedList.add(4,1);
        linkedList.print();
        linkedList.remove();
        linkedList.print();
    }

}
