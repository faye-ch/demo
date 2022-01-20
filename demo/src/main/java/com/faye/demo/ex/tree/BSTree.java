package com.faye.demo.ex.tree;

import org.junit.Test;

/*
 * @Author cyf
 * 二叉搜索树
 * @Date 2022/1/19
 **/
public class BSTree<T extends Comparable<T>> {

    static class BSTNode<T>{
        BSTNode<T> left = null;
        BSTNode<T> right = null;
        T data;

        public BSTNode(T data){
            this.data = data;
        }
    }

    BSTNode<T> root = null;

    public void add(T data){
        BSTNode<T> node = new BSTNode<>(data);
        if (root ==null ){
            root = node;
            return;
        }
        add(root,node);
    }

    //递归
    // node(当前结点) elements(需要插入的结点)
    private void add(BSTNode<T> node, BSTNode<T> element){
        //当前结点 大于 需要插入的结点
        //则放在当前结点的左子树
        if (node.data.compareTo(element.data)<=0){
            //当前结点的右子树 为空即插入
            if (node.right ==null){
                node.right = element;
                return;
            }
            //当前结点的右子树存在元素 则向下寻找空位结点
            add(node.right,element);
        }else {
            if (node.left ==null){
                node.left = element;
                return;
            }
            add(node.left,element);
        }
    }

    @Test
    public void print_test(){
        BSTree<Integer> bsTree = new BSTree<>();
        bsTree.add(1);
        bsTree.add(5);
        bsTree.add(11);
        bsTree.add(4);
        bsTree.add(3);
        bsTree.add(-1);

        TreePrinter printer = new TreePrinter();
        printer.print(bsTree.root);
    }

    @Test
    // == 0   < -1  > 1
    public void compare_test(){
        Integer num = 10;
        Integer num2 = 12;
        System.out.println(num2.compareTo(num));
    }
}
