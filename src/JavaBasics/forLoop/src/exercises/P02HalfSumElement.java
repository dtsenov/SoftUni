package EXERCISE;

import java.util.Scanner;

public class P02HalfSumElement {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int n = Integer.parseInt(scan.nextLine());
        int max = Integer.MIN_VALUE;
        int sum = 0;
        for (int i = 1; i <= n ; i++) {
            int num = Integer.parseInt(scan.nextLine());
            sum += num;

            if (num > max) {
                max = num;
            }
        }
        int sumWithoutMax = sum - max;

        if (max == sumWithoutMax) {
            System.out.println("Yes");
            System.out.println("Sum = " + max);
        } else {
            int diff = Math.abs(max - sumWithoutMax);
            System.out.println("No");
            System.out.println("Diff = " + diff);
        }
    }
}
