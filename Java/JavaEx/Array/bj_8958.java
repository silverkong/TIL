package date0606.sec01;

import java.util.Scanner;

public class bj_8958 {

	public static void main(String[] args) {
		// 각 테스트 케이스마다 점수를 출력한다.
		Scanner sc = new Scanner(System.in);
		
		int problemNum = sc.nextInt();
		String[] problem = new String[problemNum];
		
		for(int i = 0; i < problem.length; i++) {
			problem[i] = sc.next();
			char[] check = problem[i].toCharArray();
			int score = 0;
			int temp = 1;
			
			for(int j = 0; j < check.length; j++) {
				if(check[j] == 'O') {
					score += temp;
					temp++;
				}else{
					temp = 1;
				}
			}
			
			System.out.println(score);
		}
		sc.close();
		
	}

}
