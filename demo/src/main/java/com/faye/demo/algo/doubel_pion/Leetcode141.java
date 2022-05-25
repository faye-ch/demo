package com.faye.demo.algo.doubel_pion;

import java.util.HashSet;
import java.util.Set;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/25
 **/
public class Leetcode141 {

    public static void main(String[] args) {
        ListNode head = new ListNode(3);
        ListNode next1 = new ListNode(2);
        ListNode next2 = new ListNode(0);
        ListNode next3 = new ListNode(4);
        head.next = next1;
        next1.next = next2;
        next2.next = next3;
        next3.next = next2;

        boolean b = new Leetcode141().hasCycle(head);
        System.out.println(b);
    }

    public boolean hasCycle(ListNode head) {
        if (head==null){
            return false;
        }
        Set<ListNode> set = new HashSet<>();
        ListNode next = head.next;
        set.add(next);
        while (next!=null){
            next = next.next;
            boolean b = set.add(next);
            if (!b){
                return true;
            }
        }
        return false;
    }

}
