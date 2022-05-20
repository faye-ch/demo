package com.faye.demo.ex.leetcode;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/19
 **/
public class AddTwoNumbers2 {


    public static void main(String[] args) {
        AddTwoNumbers.ListNode l1 = new AddTwoNumbers.ListNode(2);
        AddTwoNumbers.ListNode n1 = new AddTwoNumbers.ListNode(4);
        AddTwoNumbers.ListNode n2 = new AddTwoNumbers.ListNode(3);
        l1.next = n1;
        n1.next = n2;

        AddTwoNumbers.ListNode l2 = new AddTwoNumbers.ListNode(5);
        AddTwoNumbers.ListNode p1 = new AddTwoNumbers.ListNode(6);
        AddTwoNumbers.ListNode p2 = new AddTwoNumbers.ListNode(4);
        l2.next = p1;
        p1.next = p2;
        AddTwoNumbers.ListNode result = addTwoNumbers(l1, l2);
        AddTwoNumbers.ListNode next = result.next;
        System.out.print("[");
        while (next!=null){
            System.out.print(next.val);
            next = next.next;
        }
        System.out.print("]");

    }

    public static AddTwoNumbers.ListNode addTwoNumbers(AddTwoNumbers.ListNode l1, AddTwoNumbers.ListNode l2) {
        List<Integer> list1 = ford(l1);
        List<Integer> list2 = ford(l2);

        Integer mg1 = mg(list1);
        Integer mg2 = mg(list2);
        Integer sum = mg1 + mg2;
        String s = String.valueOf(sum);
        AddTwoNumbers.ListNode result = new AddTwoNumbers.ListNode();
        AddTwoNumbers.ListNode next = new AddTwoNumbers.ListNode();
        result.next = next;
        next.val = Integer.parseInt(String.valueOf(s.charAt(s.length()-1)));
        for (int i = s.length()-2; i >=0 ; i--) {
            int num = Integer.parseInt(s.charAt(i) + "");
            AddTwoNumbers.ListNode temp = new AddTwoNumbers.ListNode();
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

    private static List<Integer> ford(AddTwoNumbers.ListNode l1) {
        List<Integer> list = new ArrayList<>();
        AddTwoNumbers.ListNode next = l1.next;
        while (next!=null){
            list.add(next.val);
            next = next.next;
        }
        return list;
    }


    public static class ListNode {
        int val;
        AddTwoNumbers.ListNode next;
        ListNode() {}
        ListNode(int val) { this.val = val; }
        ListNode(int val, AddTwoNumbers.ListNode next) { this.val = val; this.next = next; }
    }

}
