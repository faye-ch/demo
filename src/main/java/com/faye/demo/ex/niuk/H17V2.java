package com.faye.demo.ex.niuk;

import java.util.Scanner;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/15
 **/
public class H17V2 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String strs = sc.nextLine();
        String[] split = strs.split(";");
        int[] index = {0,0};
        for (String s : split) {
            if (s.equals("")){
                continue;
            }
            char c1 = s.charAt(0);
            String res = "[ADWS]";
            if (!String.valueOf(c1).matches(res)){
                continue;
            }
            String after = s.substring(1);
            boolean b = checkNum(after);
            if (!b){
                continue;
            }
            int num = Integer.parseInt(after);
            switch (c1){
                case 65:
                    index[0] = index[0]-num;
                    break;
                case 83:
                    index[1] = index[1]-num;
                    break;
                case 68:
                    index[0] = index[0]+num;
                    break;
                case 87:
                    index[1] = index[1]+num;
                    break;
                default:
            }
        }
        System.out.println(index[0]+","+index[1]);
    }

    private static boolean checkNum(String after) {
        String res = "[0-9]+";
        return after.matches(res);
    }

}
