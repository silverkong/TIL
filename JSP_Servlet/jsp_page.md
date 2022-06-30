# JSP 지시어



### JSP 페이지 내용

HTML 문서 내용 / JSP 태그 / 자바 코드



### JSP 페이지 구성

- 지시어 : page, include, taglib
- 스크립트 요소
  - 선언문
  - 표현식
  - 스크립트릿
- 액션 태그



### JSP 태그

- <%로 시작하고%>로 종료
- @, !, =, -- 문자를 추가하여 태그의 의미 부여



### 지시어

- JSP 페이지의 전체적인 속성을 지정할 때 사용
- JSP 컨테이너에게 전달하는 JSP 페이지 관련 메시지
- <%@ 지시어 속성1=값, 속성2=값, ….%>



#### page 지시어

- <% @ page … %>
- JSP 페이지에 대한 속성 설정



#### include 지시어

- <%@ include file=”포함될 파일의 url” %>
- 공통적으로 포함될 내용을 가진 파일을 해당 JSP 페이지 내에 삽입하는 기능을 제공
- 복사 & 붙여넣기 방식으로 두 개의 파일이 하나의 파일로 합쳐진 후 하나의 파일로서 변환되고 컴파일



#### taglib 지시어

- <%@ taglib prefix=”c” uri=”http:.....  %>
- 표현 언어 (EL : Expression Language), JSTL(JSP Standard Tag Library)를 JSP 페이지 내에서 사용할 때 씀



