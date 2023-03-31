package date0606.sec01;

import java.util.Scanner;

public class bj_3052 {
	public static void main(String[] args) {
		// 첫째 줄에, 42로 나누었을 때, 서로 다른 나머지가 몇 개 있는지 출력한다.

		Scanner sc = new Scanner(System.in);
		int[] numArr = new int[10];
		boolean[] checkArr = new boolean[42];
		int count = 0;

		for (int i = 0; i < numArr.length; i++) {
			numArr[i] = sc.nextInt();
			checkArr[numArr[i]%42] = true;
		}
		sc.close();
		
		for (int i = 0; i < checkArr.length; i++) {
			if(checkArr[i]) {
				count++;
			}
		}
		
		System.out.println(count);
	}
}