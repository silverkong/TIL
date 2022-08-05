# API URL 주소로 요청하기



URL 주소 요청하여 json 타입의 결과 받아오기

```java
// JSON 타입 URL
// 요청 주소를 나눠 적는다고 생각하면 됨
StringBuilder urlBuilder = new StringBuilder("URL 넣어야하는 곳");
urlBuilder.append("?" + URLEncoder.encode("auth","UTF-8") + "=" + URLEncoder.encode("인증키 넣어야하는 곳", "UTF-8")); 	// 인증키
urlBuilder.append("&" + URLEncoder.encode("topFinGrpNo","UTF-8") + "=" + URLEncoder.encode("권역코드 넣어야 하는 곳", "UTF-8")); // 금융회사가 속한 권역 코드 : 은행 020000
urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); // 조회하려는 페이지 번호
URL url = new URL(urlBuilder.toString());

HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json");
System.out.println("Response code: " + conn.getResponseCode());
BufferedReader rd;

if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
} else {
    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
}

StringBuilder sb = new StringBuilder();
String line;
while ((line = rd.readLine()) != null) {
    sb.append(line);
}

rd.close();
conn.disconnect();
```

