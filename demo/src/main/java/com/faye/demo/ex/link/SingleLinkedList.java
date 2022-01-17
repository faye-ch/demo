package com.faye.demo.ex.link;


import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

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

    //根据条件查询结点
    //断言表达式
    //传入一个判断表达式
    public List<Node<E>> query(Predicate<E> predicate){
        List<Node<E>> nodeList = new ArrayList<>();
        if (head ==null){
            return nodeList;
        }
        Node<E> node = head.getNext();
        while (node!=null){
            if (predicate.test(node.getData())){
                nodeList.add(node);
            }
            node = node.getNext();
        }
        return nodeList;
    }

    // O(n)
    public void remove(Node<E> node){
        if(head == null) {
            return;
        }

        if(head == node) {
            head = head.getNext();
            return;
        }

        //这里的快慢指针的用处并不提高效率,而是删除某个结点后,方便前后结点连接,旨在记录目标结点的 pre 结点
        //如果是下标删除，使用 get(index-1) 也可以
        Node<E> slow = head;
        Node<E> fast = head.getNext();

        while(fast != node && fast != null) {
            slow = fast;
            fast = fast.getNext();
        }
        if(fast != null) {
            slow.setNext(fast.getNext());
            fast.setData(null);
        }

    }

    //判断链表是否有环
    public boolean hasLooped(){
        if (head==null || head.getNext()==null){
            return false;
        }
        Node<E> slow = head;
        Node<E> fast = head.getNext().getNext();
        while (fast != null && fast.getNext() != null){
            if (fast == slow){
                return true;
            }
            slow = slow.getNext();
            fast = fast.getNext().getNext();
        }
        return false;
    }

    @Test
    public void loop_test(){
        SingleLinkedList<Integer> linkedList = new SingleLinkedList<>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(3);
        linkedList.add(4);

        linkedList.last.setNext(linkedList.head.getNext());
        System.out.println(linkedList.hasLooped());
    }

    public static void main(String[] args) {
        SingleLinkedList<Integer> linkedList = new SingleLinkedList<>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(3);
        linkedList.add(4);
        linkedList.print();
        List<Node<Integer>> nodeList = linkedList.query(k -> k < 3);
        nodeList.forEach(v-> System.out.println(v.getData()));
//        linkedList.add(4,1);
//        linkedList.print();
//        linkedList.remove();
//        linkedList.print();
    }

}
