package date0605.sec01;

public class Array5_5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] ballArr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		int[] ball3 = new int[3];

		// 배열의 ballArr의 임의의 요소를 골라서 위치를 바꾼다
		for (int i = 0; i < ballArr.length; i++) {
			int j = (int) (Math.random() * ballArr.length);
			int tmp = 0;

			tmp = ballArr[j];
			ballArr[i] = ballArr[j];
			ballArr[j] = tmp;
		}

		// 배열의 ballArr의 앞에서 3개의 수를 배열ball3으로 복사한다
		for (int i = 0; i < 3; i++) {
			ball3[i] = ballArr[i];
		}

		for (int i = 0; i < ball3.length; i++) {
			System.out.print(ball3[i]);
		}
	}
}
