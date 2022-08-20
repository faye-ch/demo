package com.faye.demo.ex.niuk;
import java.util.*;

public class HJ24 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            int n = sc.nextInt();
            int[] arr = new int[n];
            for (int i = 0; i < n; i++) {
                arr[i] = sc.nextInt();
            }

            int[] left = new int[n]; //存储每个数左边小于其的数的个数
            int[] right = new int[n];//存储每个数右边小于其的数的个数
            left[0] = 1;            //最左边的数设为1
            right[n - 1] = 1;        //最右边的数设为1
            //计算每个位置左侧的最长递增
            //nums[i] > nums[j] : dp[i] = max(dp[i],dp[j]+1)
            //dp[i] 上一次的累加最大值
            //dp[j]+1,nums[i] > nums[j]说明nums[i]比dp[j]上累计的数都要大 因此在dp[j]+1 如下面例子3
            //为什么要用 dp[i] 于 dp[j]+1 做比较，有dp[j]累计的值比前面少的情况,如下面例子5

            //1 2 3 3 2 12
            //1.dp[0] = 0
            //2.dp[1] = i=1 j=0:2 1 dp[1]=1
            //3.dp[2] = 1=2 j=0:3 1 dp[1]=1 ,i=2 j=1:3 dp[1]=2 ,
            // dp[1]累计的值为：1、2, nums[i]=3 > nums[j]=2 就必然大于dp[1]中累计的值，所以可以继承dp[1]的值，在其后面追加 +1
            //4.dp[3] = 2
            //5.dp[4] = 1
            //6.dp[5] = 3  这就是比较dp[i]的用处了，dp[i] 在 j=4 时 dp[i] = max(dp[5],dp[3+1]) = 3 若dp[j]+1 = 2
            for (int i = 0; i < n; i++) {
                left[i] = 1;
                for (int j = 0; j < i; j++) {
                    if (arr[i] > arr[j]) {   //动态规划
                        left[i] = Math.max(left[j] + 1, left[i]);
                    }
                }
            }
            //计算每个位置右侧的最长递减
            for (int i = n - 1; i >= 0; i--) {
                right[i] = 1;
                for (int j = n - 1; j > i; j--) {
                    if (arr[i] > arr[j]) {   //动态规划
                        right[i] = Math.max(right[i], right[j] + 1);
                    }
                }
            }
            // 记录每个位置的值
            int[] result = new int[n];
            for (int i = 0; i < n; i++) {
                //位置 i计算了两次 所以需要－1
                result[i] = left[i] + right[i] - 1; //两个都包含本身
            }

            //找到最大的满足要求的值
            int max = 1;
            for (int i = 0; i < n; i++) {
                max = Math.max(result[i],max);
            }
            System.out.println(n - max);
        }

    }
}

