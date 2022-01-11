package com.faye.demo.ex.link;


import org.junit.Test;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/11
 **/
public class SingleLinkedList<E> {

    private Node<E> head;

    private Node<E> last;

    private int size;

    public SingleLinkedList(){
        this.head = new Node<>();
        last = head;
    }

    public Node<E> get(int index){
        if (index<0 || index>size){
            return null;
        }
        Node<E> node = head.next;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    }

    public void add(E data){
        Node<E> node = new Node<>(data);
        last.setNext(node);
        last = node;
        size ++ ;
    }

    //按指定位置插入元素，旧元素位置向后移动
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
        Node<E> node = preNode.next;
        //目标结点的下一个结点
        Node<E> next = node.next;

        //剔除目标结点 目标上一结点 与 目标当前结点链接
        preNode.setNext(next);
        node.setNext(null);
        size --;
        return true;
    }

    //移除最后一个元素
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

    public int getSize(){
        return size;
    }

    public void print(){
        StringBuilder builder = new StringBuilder("{");
        for (int i = 0; i < size; i++) {
            builder.append("["+get(i).getData()+"]");
        }
        builder.append("}");
        System.out.println(builder.toString());
    }


    private class Node<E>{
        private Node<E> next;
        private E data;

        public Node(){

        }

        public Node(E data){
            this.data = data;
        }

        public Node<E> getNext(){
            return next;
        }

        public void setNext(Node<E> next){
            this.next = next;
        }

        public E getData(){
            return data;
        }

        public void setData(E data){
            this.data = data;
        }
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
