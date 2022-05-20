package com.faye.demo.algo.dp;

/*
 * @Author cyf
 * @Date 2022/5/20
 *
 * 每次只能 向下 或向右移动一步
 * 就是说只有两个选择：向下，上一步[i-1][j]， 向右 左一步[i][j-1]
 * 可得出动态规划的状态转移方程为 dp[i][j] = min(dp[i-1][j],dp[i][j-1])+nums[i][j]
 * 边界：
 * 1. i > 1 : dp[i][j] = dp[i-1][j]+num[i][j] 填充 j=0 这一列
 * 2. j > 1 : dp[i][j] = dp[i][j-1]+num[i][j] 填充 i=0 这一列
 **/
public class Leetcode64 {

    public static void main(String[] args) {
        int[][] grid = {{1,2,3},{4,5,6}};
        int max = new Leetcode64().minPathSum(grid);
        System.out.println(max);
    }

    public int minPathSum(int[][] grid) {
        if (grid == null || grid.length==0 ||grid[0].length==0 ){
            return 0;
        }
        int m = grid.length;
        int n = grid[0].length;

        int[][] dp = new int[m][n];
        dp[0][0] = grid[0][0];
        //填充 j=0 这一列
        for (int i = 1; i < m; i++) {
            dp[i][0] = dp[i-1][0] + grid[i][0];
        }
        //填充 i=0 这一列
        for (int j = 1; j < n; j++) {
            dp[0][j] = dp[0][j-1] + grid[0][j];
        }
        for (int i = 1; i < m ; i++) {
            for (int j = 1; j < n; j++) {
                dp[i][j] = Math.min(dp[i-1][j],dp[i][j-1]) + grid[i][j];
            }
        }
        return dp[m-1][n-1];
    }

}
