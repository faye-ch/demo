package com.faye.demo.adapter;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
public class calPrice {

    private static final int[] pricesA = {8,10,14};
    private static final int[] pricesB = {10,12,15};
    private static final int[] pricesC = {6,6,6};
    private static final int[] basePrices = {63,96,162};

    private static final String[] basePlans = {"20万","30万","50万"};
    private static final String[] plansA = {"投保","不投保"};
    private static final String[] plansB = {"投保","不投保"};
    private static final String[] plansC = {"投保","不投保"};

    public static void main(String[] args) throws Exception{



        for (String basePlan : basePlans) {
            for (String planA : plansA) {
                for (String planB : plansB) {
                    for (String planC : plansC) {
                        String planResult = basePlan+","+planA+","+planB+","+planC;
                        int price = getPrice(planResult);
                        System.out.println(planResult+","+price);
                    }
                }
            }
        }

    }

    private static int getPrice(String planResult) {
        String[] planResultArr = planResult.split(",");
        int index = 0;
        int totalPrice = 0;
        for (int i = 0; i < planResultArr.length; i++) {
            int price = 0;
            if (i==0){
                String basePlan = planResultArr[i];
                for (int j = 0; j < basePlans.length; j++) {
                    if (basePlan.equals(basePlans[j])){
                        index = j;
                    }
                }
                totalPrice = basePrices[index];
            }else {
                if (planResultArr[i].equals("不投保")){
                    continue;
                }
                switch (i){
                    case 1:
                        price = pricesA[index];
                        break;
                    case 2:
                        price = pricesB[index];
                        break;
                    case 3:
                        price = pricesC[index];
                        break;
                }
                totalPrice=totalPrice+price;
            }

        }
        return totalPrice;
    }
    
}
