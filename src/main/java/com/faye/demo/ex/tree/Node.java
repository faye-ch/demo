package com.faye.demo.ex.tree;

import java.util.Collections;
import java.util.List;

public class Node {

    private int val;

    private List<Node> children = Collections.emptyList();

    public Node(int val){
        this.val = val;
    }

    public Node(int val,List<Node> children){
        this.val = val;
        this.children = children;
    }


    public int getVal() {
        return val;
    }

    public void setVal(int val) {
        this.val = val;
    }

    public List<Node> getChildren() {
        return children;
    }

    public void setChildren(List<Node> children) {
        this.children = children;
    }
}
