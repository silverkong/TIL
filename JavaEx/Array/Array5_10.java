package date0605.sec01;

public class Array5_10 {
	public static void main(String[] args) {
		char[] abcCode = { '`', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', 
				'-', '_', '+', '=', '|', '[', ']', '{', '}', ';', ':', ',', '.', '/' };
		
		char[] numCode = { 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p' };
		
		String src = "abc123";
		String result = "";
		
		// 문자열 src의 문자를 charAt()으로 하나씩 읽어서 변환 후 result에 저장
		for (int i = 0; i < src.length(); i++) {
			char ch = src.charAt(i);
			// (1) 알맞은 코드를 넣어 완성하시오.
			// 97 <= ch <= 122
			if(ch >= 'a' && ch <= 'z') {
				result += abcCode[ch-'a'];
			// 48 <= ch <= 57
			}else if(ch >= '0' && ch <= '9') {
				result += numCode[ch-'0'];
			}
			
			}
		System.out.println("src:" + src);
		System.out.println("result:" + result);
	}
}
