package com.faye.demo.ex.link;

/*
 * @Author cyf
 * @Description
 * @Date 2022/1/11
 **/
public class DoubleLinkedList<E> implements ILinkedList<E> {

    private Node<E> head;

    private Node<E> last;

    private int size;

    public DoubleLinkedList(){
        Node<E> node = new Node<>();
        this.head = node;
        this.last = head;
    }

    @Override
    public Node<E> get(int index) {
        if (index < 0 || index > size ){
            return null;
        }
        Node<E> node = head.getNext();
        for (int i = 0; i < index; i++) {
            node = node.getNext();
        }
        return node;
    }

    @Override
    public void add(E data) {
        Node<E> node = new Node<>(data);
        node.setPre(last);
        last.setNext(node);
        last = node;
        size++;
    }

    @Override
    public void add(E data, int index) {
        if (index < 0 || index > size){
            return;
        }
        Node<E> node = new Node<>(data);
        Node<E> oldPreNode = get(index - 1);
        Node<E> oldNode = oldPreNode.getNext();

        oldPreNode.setNext(node);
        node.setPre(oldPreNode);
        node.setNext(oldNode);
        size++;
    }

    @Override
    public boolean remove(int index) {
        if (index<0 || index>size){
            return false;
        }
        if (index == 0){
            Node<E> node = head.getNext();
            head.setNext(node.getNext());
            size --;
            return true;
        }
        Node<E> preNode = get(index - 1);
        Node<E> node = preNode.getNext();
        Node<E> next = node.getNext();

        preNode.setNext(next);
        next.setPre(preNode);
        node.setNext(null);
        size -- ;
        return true;
    }

    @Override
    public void remove() {
        Node<E> pre = last.getPre();
        Node<E> next = pre.getNext();
        next.setData(null);
        last = pre;
        size --;
    }

    @Override
    public int getSize() {
        return size;
    }

    @Override
    public void print() {
        StringBuilder builder = new StringBuilder("{");
        for (int i = 0; i < size; i++) {
            builder.append("["+get(i).getData()+"]");
        }
        builder.append("}");
        System.out.println(builder);
    }

    public static void main(String[] args) {
        DoubleLinkedList<Integer> linkedList = new DoubleLinkedList<>();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.add(3);
        linkedList.print();
//        linkedList.add(4,1);
//        linkedList.print();
        linkedList.add(1);
        linkedList.add(2);
        linkedList.remove();
        linkedList.print();
    }
}
