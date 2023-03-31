package date0605.sec02;

import java.util.Scanner;

public class bj_2577 {

	public static void main(String[] args) {
		// 세 개의 자연수 A, B, C가 주어질 때
		// A × B × C를 계산한 결과에 0부터 9까지 각각의 숫자가 몇 번씩 쓰였는지를 구하는 프로그램을 작성

		Scanner sc = new Scanner(System.in);

		System.out.println("3개의 숫자 입력 : ");
		int result = sc.nextInt() * sc.nextInt() * sc.nextInt();
		sc.close();
		
		int[] resultArr = new int[(int) Math.log(result)];
		// 150 266 427

		while (result != 0) {
			resultArr[result % 10]++;
			result /= 10;
		}
		
		for(int count : resultArr) {
			System.out.println(count);
		}
	}

}
