package date0606.sec01;

import java.util.Scanner;

public class bj_1546 {

	public static void main(String[] args) {
		// 첫째 줄에 새로운 평균을 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-2 이하이면 정답이다.
		// 과목 수 입력
		Scanner sc = new Scanner(System.in);

		int subjectNum = sc.nextInt();
		int[] scoreArr = new int[subjectNum];

		double average = 0;
		double sum = 0;
		double max = 0;
		
		
		for (int i = 0; i < scoreArr.length; i++) {
			scoreArr[i] = sc.nextInt();

			if (max < scoreArr[i]) {
				max = scoreArr[i];
			}
		}
		sc.close();

		for (int i = 0; i < scoreArr.length; i++) {
			sum += (scoreArr[i] / max * 100);
		}
		
		average = sum / subjectNum;
		System.out.println(average);
	}

}
