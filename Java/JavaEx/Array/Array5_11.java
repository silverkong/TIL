package date0605.sec01;

public class Array5_11 {

	public static void main(String[] args) {
		int[][] score = {
				{ 100, 100, 100 },
				{ 20, 20, 20 },
				{ 30, 30, 30 },
				{ 40, 40, 40 },
				{ 50, 50, 50 } };
		
		int[][] result = new int[score.length + 1][score[0].length + 1];
		//result = int[6][4]
		
		// score.length = 5
		for (int i = 0; i < score.length; i++) {
			// score[i].length = 3
			for (int j = 0; j < score[i].length; j++) {
				// result 배열에 그대로 입력
				result[i][j] = score[i][j];
				// result[i][3] 자리에 배열의 합 넣기 // 4번째 자리
				result[i][score[i].length] += result[i][j];
				// result[5][j] 자리에 배열의 합 넣기 // 6번째 줄에
				result[score.length][j] += result[i][j];
				// result[5][3] 자리에 배열의 합 넣기 // 6번째 줄 4번째 자리
				result[score.length][score[i].length] += result[i][j];
			}
		}
		
//		100 100 100 300
//		20 20 20 60
//		30 30 30 90
//		40 40 40 120
//		50 50 50 150
//		240 240 240 720
		
		// result.length = 6
		for (int i = 0; i < result.length; i++) {
			// result[i].length = 4
			for (int j = 0; j < result[i].length; j++) {
				// 4의 배수 자리에 result[i][j]의 값을 넣겠다
				System.out.printf("%4d", result[i][j]);
			}
			System.out.println();
		}
	}

}
