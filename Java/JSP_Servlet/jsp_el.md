# EL (Expression Language)



### **JSP 발전 과정**

- 초기 : HTML 태그를 중심으로 자바를 이용해 화면 구현
- 화면에 대한 요구 사항이 복잡해지면서 자바 코드를 대체하는 액션 태그 등장
- 복잡 자바 코드를 제거하는 방향으로 발전
  - 복잡한 자바 코드로 인해 화면 작업 어려움
- 현재 JSP 페이지는 스크립트 요소보다 표현 언어나 JSTL 사용



### EL (Expression Language)

- 표현 언어
- 자바 코드가 들어가는 표현식을 좀 더 편리하게 사용하기 위해 JSP 2.0부터 도입된 데이터 출력 기능
- 표현식 또는 액션 태그 대신 값을 표현
- <%= 값 %>  -=> ${값}
- parameter : ${ param.이름 }



### EL 연산자

- 산술 연산자 : +, -, \*, /, %, (div, mod)
- 관계 연산자 : >, >=, <, <=, ==, !=
  - (gt, ge, lt, le, eq, ne)
- 논리 연산자 : &&, ||, !, (and, or, not)
- 조건 연산자 : 수식 ? 참일때 값 : 거짓일때 값
- empty 연산자
  - 값이 null 이거나 길이가 0이면 참 (true)
  - ${empty 변수} : 변수가 null 이거나 0이면 참
  - ${not empty 변수}
    - 변수가 null 이 아니거나 0이 아니면 참


