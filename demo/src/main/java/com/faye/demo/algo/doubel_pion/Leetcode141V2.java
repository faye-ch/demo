package com.faye.demo.algo.doubel_pion;

 /*
  * 快慢指针
  * 总有一款会相遇
  */
public class Leetcode141V2 {

    public static void main(String[] args) {

    }

    public boolean hasCycle(ListNode head) {
        if (head==null){
            return false;
        }
        ListNode p1 = head;
        ListNode p2 = head.next;
        while (p1!=null && p2!=null && p2.next!=null){
            if (p1 == p2){
                return true;
            }
            p1 = p1.next;
            p2 = p2.next.next;
        }
        return false;
    }
}
