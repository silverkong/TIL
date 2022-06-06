package date0605.sec01;

public class Array5_6 {

	public static void main(String[] args) {
		// 큰 금액의 동전을 우선적으로 거슬러 줘야한다.
		
		int[] coinUnit = {500, 100, 50, 10};
		
		int money = 2680;
		System.out.println("money="+money);
		
		for(int i=0;i<coinUnit.length;i++) {
			int coinCal = 0;
			coinCal = money/coinUnit[i];
			//만약, 2680/500 = 5
			money = money%coinUnit[i];
			//만약, 2680%500 = 380
			
			System.out.println(coinUnit[i]+"원 : " + coinCal);
		}

	}

}
