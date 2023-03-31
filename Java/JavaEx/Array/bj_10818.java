package date0605.sec02;

import java.util.Scanner;

public class bj_10818 {

	public static void main(String[] args) {
		// N개의 정수가 주어진다. 이때, 최솟값과 최댓값을 구하는 프로그램을 작성하시오.
		Scanner sc = new Scanner(System.in);
		
		int num = 0;
		int maxNum = -1000001;
		int minNum = 1000001;
		
		System.out.print("갯수 입력 : ");
		num = sc.nextInt();
		
		int[] arr = new int[num];
		System.out.println(num + "개의 정수 입력 : ");
		for(int i = 0; i < arr.length; i++) {
			arr[i] = sc.nextInt();
			
			if (arr[i] > maxNum) {
				maxNum = arr[i];
			}
			
			if (arr[i] < minNum) {
				minNum = arr[i];
			}
		}
		
		System.out.println(minNum + " " + maxNum);
		sc.close();

	}

}
