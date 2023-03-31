package date0605.sec01;

public class Array5_9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[][] star = {
				{ '*', '*', ' ', ' ', ' ' },
				{ '*', '*', ' ', ' ', ' ' },
				{ '*', '*', '*', '*', '*' },
				{ '*', '*', '*', '*', '*' } };

		char[][] result = new char[star[0].length][star.length];
		
		for (int i = 0; i < star.length; i++) {
			for (int j = 0; j < star[i].length; j++) {
				System.out.print(star[i][j]);
			}
			System.out.println();
		}
		
		System.out.println();
		
		for(int i = 0; i < star.length; i++) {			//star.length = 4
			// i = 0, 1, 2, 3
			for(int j = 0; j < star[i].length; j++) {	//star[i].length = 5
				// j = 0, 1, 2, 3, 4
				int t1 = j;					//t1 = 0;
				int t2 = star.length-1-i;	//t2 = 4-1-0; = 3
				
				// result[i][j] = 4개 원소 가진 5개
				
				result[t1][t2] = star[i][j];
			}
		}
		
		for(int i=0; i < result.length;i++) { 
			for(int j=0; j < result[i].length;j++) {
				System.out.print(result[i][j]);
			}
			System.out.println();
		}
		

	}

}
