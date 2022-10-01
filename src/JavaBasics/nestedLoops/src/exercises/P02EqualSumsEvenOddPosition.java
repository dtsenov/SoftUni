package EXERCISE;

import java.util.Scanner;

public class P02EqualSumsEvenOddPosition {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int firstNum = Integer.parseInt(scan.nextLine());
        int secondNum = Integer.parseInt(scan.nextLine());

        for (int i = firstNum; i <= secondNum ; i++) {
            int currentNum = i;

            int evenSum = 0;
            int oddSum = 0;
            for (int j = 6; j >= 1 ; j--) {
                int digit = currentNum % 10;

                if (j % 2 == 0) {
                    evenSum = evenSum + digit;
                } else {
                    oddSum = oddSum + digit;
                }

                currentNum = currentNum / 10;
            }

            if (evenSum == oddSum) {
                System.out.printf("%d ", i);
            }

        }
    }
}
