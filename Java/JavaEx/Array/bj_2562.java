package date0605.sec02;

import java.util.Scanner;

public class bj_2562 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int num = 0;
		int max = 0;
		int count = 0;
		System.out.print("배열의 길이 입력 : ");
		num = sc.nextInt();

		int[] arr = new int[num];
		System.out.println("배열 내 숫자 입력 : ");
		for(int i = 0; i < arr.length; i++) {
			arr[i] = sc.nextInt();
			
			if(arr[i] > max) {
				max = arr[i];
				count = i;
			}
		}
		
		System.out.println("최대값 : " + max);
		System.out.println(( count + 1 ) + "번째" );
		sc.close();
	}

}
