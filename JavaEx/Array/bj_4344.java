package date0606.sec01;

import java.util.Scanner;

public class bj_4344 {

	public static void main(String[] args) {
		// 각 케이스마다 한 줄씩 평균을 넘는 학생들의 비율을 반올림하여 소수점 셋째 자리까지 출력한다.
		Scanner sc = new Scanner(System.in);
		
		int group = sc.nextInt();
		
		for(int i = 0; i < group; i++) {
			int std = sc.nextInt();
			int[] stdScore = new int[std];
			double sum = 0;
			int count = 0;
			
			for(int j = 0; j < stdScore.length; j++) {
				stdScore[j] = sc.nextInt();
				sum += stdScore[j];
			}
			double average = sum / std;
			
			for (int j = 0; j < stdScore.length; j++) {
				if(average < stdScore[j]) {
					count++;
				}
			}

			double b = (double)count/std * 100;
			System.out.println(String.format("%.3f", b) + "%");
		}
		
		sc.close();
	}
	// 5 50 50 70 80 100
	// 7 100 95 90 80 70 60 50
	// 3 70 90 80
	// 3 70 90 81
	// 9 100 99 98 97 96 95 94 93 91

}
