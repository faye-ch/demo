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

    //先序遍历
    //根节点 -> 左子树 -> 右子树
    /**
     *      5
     *     / \
     *    3   6
     *   / \   \
     *  2  4    8
     *
     *  遍历结果：532468
     */
    <T> void preOrder(BSTNode<T> node){
        if (node ==null ){
            return;
        }
        System.out.println(node.data);
        preOrder(node.left);
        preOrder(node.right);
    }

    /**
     * 后序遍历
     * 左子树 -> 右子树 -> 根节点
     *      5
     *     / \
     *    3   6
     *   / \   \
     *  2  4    8
     *
     *  遍历结果：243865
     *
     */
    <T> void postOrder(BSTNode<T> node){
        if (node ==null ){
            return;
        }
        postOrder(node.left);
        postOrder(node.right);
        System.out.println(node.data);
    }


    @Test
    public void print_test(){
        BSTree<Integer> bsTree = buildTree();
        TreePrinter printer = new TreePrinter();
        printer.print(bsTree.root);
    }

    private BSTree<Integer> buildTree(){
        BSTree<Integer> bsTree = new BSTree<>();
        bsTree.add(5);
        bsTree.add(3);
        bsTree.add(2);
        bsTree.add(4);
        bsTree.add(6);
        bsTree.add(8);
        return bsTree;
    }

    @Test
    // == 0   < -1  > 1
    public void compare_test(){
        Integer num = 10;
        Integer num2 = 12;
        System.out.println(num2.compareTo(num));
    }

    @Test
    public void proOrder_test(){
        BSTree<Integer> bsTree = buildTree();
        preOrder(bsTree.root);
    }

    @Test
    public void postOrder_test(){
        BSTree<Integer> bsTree = buildTree();
        postOrder(bsTree.root);
    }
}
