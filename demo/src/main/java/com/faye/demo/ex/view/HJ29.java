package com.faye.demo.ex.view;

import java.util.Scanner;
import java.util.function.Function;

/*
 * @Author cyf
 * @Description
 * @Date 2022/5/18
 **/
public class HJ29 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String s1 = scanner.nextLine();
        String s2 = scanner.nextLine();
        String turn1 = turn(s1, (o1) -> (char) (o1 + 1), true);
        String turn2 = turn(s2, (o1) -> (char) (o1 - 1), false);
        System.out.println(turn1);
        System.out.println(turn2);
    }

    private static String turn(String s1, Function<Character,Character> crtOpt,boolean flag) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s1.length(); i++) {
            Character c = s1.charAt(i);
            Character c1 = null;
            if (flag){
                c1 = postbdy(c);
            }else{
                c1 = postbdyV2(c);
            }

            if (c1==null){
                c1 = crtOpt.apply(c);
            }
            c1 = doSwitch(c1);
            sb.append(c1);
        }
        return sb.toString();
    }

    private static Character postbdyV2(Character c) {
        Character uCase = Character.toUpperCase(c);
        if (uCase.equals('A')){
            return Character.isLowerCase(c) ? 'z':'Z';
        }else if (uCase.equals('0')){
            return '9';
        }
        return null;
    }

    private static Character postbdy(Character c) {
        Character uCase = Character.toUpperCase(c);
        if (uCase.equals('Z')){
            return Character.isLowerCase(c) ? 'a':'A';
        }else if (uCase.equals('9')){
            return '0';
        }
        return null;
    }

    private static Character doSwitch(Character c) {
        return Character.isLowerCase(c) ? Character.toUpperCase(c):Character.toLowerCase(c);
    }

}
