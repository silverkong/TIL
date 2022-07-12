# Ajax

> Asynchronous JavaScript and XML

- 클라이언트에서 비동기 방식으로 자바스크립트를 이용하여 화면 전환 없이 서버 측에 데이터를 요청할 때 사용
- TEXT, HTML, XML, JSON 등의 데이터 처리 가능
- 웹 서버 환경에서 실행



### $.ajax() 메소드

- 사용자가 지정한 URL 경로에 있는 파일의 데이터를 전송하고 입력한 URL 경로의 파일로부터 요청한 데이터를 불러오는데 사용

- 불러올 수 있는 외부 데이터는 텍스트, HTML, XML, JSON 유형 등 다양

  ```javascript
  .ajax({
    url: "전송되는 요청 URL 매핑 이름",
    type: "데이터 전송 방식 (get/post)",
    data: "전송할 데이터",
    dataType: "요청하는 데이터의 타입 (text, html, xml, json)",
    success: function(result) { // 서버로부터 응답 "result로 받음"
      전송 및 요청 성공 시 실행 부분
    },
    error: function(){
      오류 발생 시 실행 부분
    },
    complete: function(){
      전송 및 요청 완료 시 실행 부분
    }  
  });
  ```

  