# Core Tag



### Core 태그 

#### c:set

- JSP의 setAttribute()와 같은 역할.
- (page|request|session|application) 범위의 변수(속성)를 설정



#### c:remove

- JSP의 removeAttribute()와 같은 역할.
- (page|request|session|application) 범위의 변수(속성)를 제거



#### c:out

- 화면 출력. JSP의 표현식 대체



#### c:redirect

- response.sendRedirect()를 대체하는 태그로 지정한 다른 페이지로 이동



#### c:if

조건문을 사용할 때 씀 : else문 없을 때



#### c:choose

- 자바의 switch 문과 같지만, 조건에 문자열 비교도 가능하고 쓰임의 범위가 넓음.

- 서브 태그로 <when>과 <otherwise>를 가짐 

-  else 가 필요할 때



####  c:when

- choose의 서브 태그로 조건의 비교 시에 조건을 만족한 경우에 사용



#### c:otherwise

- 조건을 만족하지 못한 경우에 사용



#### c:forEach

- 객체 전체에 걸쳐 반복 실행을 할 때 사용



#### c:forToken

- 자바의 StringTokenizer 클래스를 사용하는 것과 같음



#### c:catch

- body 위치에서 실행되는 코드의 예외를 잡아내는 역할을 담당



#### c:import

웹 애플리케이션 내부의 자원 접근은 물론이고, http, ftp 같은 외부에 있는 자원(html, jsp등)을 가져옴



#### c:param

- 파라미터 사용 시 필요.
- <import>태그의 URL뒤에 파라미터로 붙여서 사용되기도 함 



#### c:url 

- 쿼리 파라미터로 부터 URL을 생성