package com.faye.demo.ex.niuk;

import java.util.*;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/16
 **/
public class HJ20 {

    private static String OK = "OK";
    private static String NG = "NG";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<String> results = new ArrayList<>();
        Set<String> set = new HashSet<>();
        while (scanner.hasNext()){
            String str = scanner.nextLine();
            int type1 =0,type2=0,type3=0,type4=0;
            boolean b1 = false;
            if (str.length()<8){
                results.add(NG);
                continue;
            }
            for (int i = 0; i < str.length(); i++) {
                 String c = String.valueOf(str.charAt(i));
                 String res1 = "[A-Z]";
                 String res2 = "[a-z]";
                 String res3 = "[0-9]";
                 if (c.matches(res1)){
                     type1 = 1;
                 }else if (c.matches(res2)) {
                     type2 = 1;
                 }else if (c.matches(res3)){
                     type3 = 1;
                 } else {
                     type4 = 1;
                 }
                 if (i==str.length()-2){
                     break;
                 }
                 boolean b = set.add(c + str.charAt(i + 1)+str.charAt(i+2));
                 if (!b){
                     results.add(NG);
                     b1 = true;
                     break;
                 }
            }
            set.clear();
            if (b1){
                continue;
            }
            if (type1+type2+type3+type4>=3){
                results.add(OK);
            }else {
                results.add(NG);
            }
        }
        for (String result : results) {
            System.out.println(result);
        }
    }
}
