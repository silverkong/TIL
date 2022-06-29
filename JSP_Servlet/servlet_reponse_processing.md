# 서블릿 응답 처리



### 서블릿 응답 처리 방법

- doGet()이나 doPost() 메소드 안에서 처리함
- javax.servlet.http.HttpServletResponse 객체를 이용함
- 클라이언트에게 전송할 데이터 타입 인코딩
  - response.setContentType(“text/html;charset=utf-8”);
  - MIME-TYPE
    - 미리 지정해놓은 데이터 종류로 서블릿에서 브라우저로 전송 시 설정해서 사용함
    - HTML로 전송 시 : text/html
    - 일반 텍스트로 전송 : text/plain
    - XML 데이터로 전송 : application/xml
- 클라이언트(웹 브라우저)와 서블릿의 통신은 자바 I/O의 스트림 이용
  - PrintWriter 클래스 사용
    - PrintWriter out = response.getWriter();
    - out.print(data);
    - // data : 웹 브라우저로 보내는 데이터 (HTML 문서 형식(태그 포함))



### 서블릿의 응답 처리 순서

**![img](https://lh5.googleusercontent.com/o6mxjnNpAZwmtq8SKbyvrjA-uNXnh3ZHyi2NbFBSEPiIi97DTbqpEjEP4e0vcdablwqOaoI_vLf0t2B9eA03gw36tfE05Ob9g9dgMZ9sS8qh-sRPqsvYZMJI91kQp84dhsZ9srYuWnUmg6F2zA)**