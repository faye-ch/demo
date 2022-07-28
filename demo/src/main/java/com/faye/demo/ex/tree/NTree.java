package com.faye.demo.ex.tree;

import java.util.*;
 /*
  * N叉树的层次遍历
  * 主要思路：把结点装进队列中。利用队列先进先出的特性
  * 把队列元素取出来后，获取元素值，再把元素的子结点装进队列
  */
public class NTree {

    public static void main(String[] args) {
        Node node1 = new Node(2);
        Node node2 = new Node(4);
        Node node3 = new Node(5);
        Node node4 = new Node(6);
        Node p1 = new Node(3,new ArrayList<>(Arrays.asList(node3,node4)));
        Node root = new Node(1,new ArrayList<>(Arrays.asList(p1,node1,node2)));
        List<List<Integer>> lists = levelOrder(root);
        System.out.println();
    }

    private static List<List<Integer>> levelOrder(Node root) {
        if (root==null){
            return Collections.emptyList();
        }
        List<List<Integer>> res = new ArrayList<>();
        Queue<Node> queue = new LinkedList<>();
        queue.offer(root);
        while (!queue.isEmpty()){
            //装一层的val值
            List<Integer> subList = new ArrayList<>();
            int size = queue.size();
            //遍历一层的结点
            for (int i = 0; i < size; i++) {
                //出队列
                Node cur = queue.poll();
                subList.add(cur.getVal());
                List<Node> childrens = cur.getChildren();
                for (Node children : childrens) {
                    queue.add(children);
                }
            }
            res.add(subList);
        }
        return res;
    }


}
