# 서블릿 포워딩



### 포워딩

서블릿에서 다른 서블릿이나 JSP 페이지로 요청을 전달하는 기능



### 포워딩 용도

- 요청에 대한 추가 작업을 다른 서블릿에서 수행
- 요청에 포함된 정보를 다를 서블릿이나 JSP 페이지와 공유
- 요청에 정보를 포함시켜 다른 서블릿으로 전달
- 컨트롤러에서 뷰로 데이터 전달



### 서블릿에서 포워딩 방법 4가지

1. redirect 방법
2. Refresh 방법
3. location 방법
4. dispatch 방법



#### **(1) redirect 방법**

- 웹 브라우저에 재요청하는 방식
- HttpServletResponse 객체의 sendRedirect() 메소드 이용
- 형식 : sendRedirect(“포워드할 서블릿 또는 JSP”);



#### (2) Refresh 방법

- 웹 브라우저에게 재요청하는 방식
- HttpServletResponse 객체의 addHeader() 메소드 이용
- 형식 : addHeader(“Refresh”, “경과시간(초);url=요청할 서블릿 또는 JSP”);



#### (3) location 방법

- 자바스크립트에서 재요청하는 방식
- 자바스크립트의 location 객체의 href 속성 이용
- 형식 : location.href = “요청할 서블릿 또는 JSP”;



#### **(4) dispatch 방법**

- 서블릿이 직접 요청하는 방식 (일반적으로 포워딩 기능 지칭)
- RequestDipatcher dis = request.getRequestDispatcher(“포워드할 서블릿 또는 JSP);
- dis.forward(request, response);



### 포워딩 방법들의 차이점

- redirect, Refresh, location 방법
  - 서블릿이 웹 브라우저를 거쳐서 다른 서블릿이나 JSP에게 요청하는 방법
- dispatch 방법
  - 클라이언트를 거치지 않고 서블릿에서 바로 다른 서블릿에게 요청하는 방법url이 바뀌지 않음 (즉, 클라이언트 측에서는 포워드가 진행되었는지 알 수 없음)