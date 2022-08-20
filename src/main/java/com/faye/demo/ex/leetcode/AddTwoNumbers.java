package com.faye.demo.ex.leetcode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/19
 **/
public class AddTwoNumbers {

    public static void main(String[] args) {
        ListNode l1 = new ListNode();
        ListNode n1 = new ListNode(2);
        ListNode n2 = new ListNode(4);
        ListNode n3 = new ListNode(3);
        l1.next = n1;
        n1.next = n2;
        n2.next = n3;

        ListNode l2 = new ListNode();
        ListNode p1 = new ListNode(5);
        ListNode p2 = new ListNode(6);
        ListNode p3 = new ListNode(4);
        l2.next = p1;
        p1.next = p2;
        p2.next = p3;
        ListNode result = addTwoNumbers(l1, l2);
        ListNode next = result.next;
        System.out.print("[");
        while (next!=null){
            System.out.print(next.val);
            next = next.next;
        }
        System.out.print("]");

    }

    public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        List<Integer> list1 = ford(l1);
        List<Integer> list2 = ford(l2);

        Integer mg1 = mg(list1);
        Integer mg2 = mg(list2);
        Integer sum = mg1 + mg2;
        String s = String.valueOf(sum);
        ListNode result = new ListNode();
        ListNode next = new ListNode();
        result.next = next;
        next.val = Integer.parseInt(String.valueOf(s.charAt(s.length()-1)));
        for (int i = s.length()-2; i >=0 ; i--) {
            int num = Integer.parseInt(s.charAt(i) + "");
            ListNode temp = new ListNode();
            temp.val = num;
            next.next = temp;
            next = next.next;
        }
        return result;
    }

    private static Integer mg(List<Integer> list) {
        Collections.reverse(list);
        StringBuilder sb = new StringBuilder();
        for (Integer num : list) {
            sb.append(num);
        }
        return Integer.parseInt(sb.toString());
    }

    private static List<Integer> ford(ListNode l1) {
        List<Integer> list = new ArrayList<>();
        ListNode next = l1.next;
        while (next!=null){
            list.add(next.val);
            next = next.next;
        }
        return list;
    }


    public static class ListNode {
         int val;
         ListNode next;
         ListNode() {}
         ListNode(int val) { this.val = val; }
         ListNode(int val, ListNode next) { this.val = val; this.next = next; }
     }

}


