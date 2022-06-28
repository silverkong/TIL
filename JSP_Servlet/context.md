# Context



### Context(컨텍스트)

- 톰캣의 server.xml에 등록하는 웹 애플리케이션을 컨텍스트라고 함
- 즉, 톰캣 입장에서 인식하는 한 개의 웹 애플리케이션임
- 웹 애플리케이션 당 하나의 컨텍스트가 등록됨
- 웹 애플리케이션 이름과 같을 수도 다를 수도 있음
- 컨텍스트 이름은 중복되면 안 됨
- 웹 애플리케이션의 의미를 가장 잘 나타낼 수 있는 명사형으로 지정
- 대소문자 구분server.xml에 등록
- 모든 설정 정보를 xml 로 저장한 후 실행 시 정보를 읽어와 설정대로 실행함
- 이클립스에서 프로젝트를 생성하면 자동으로 server.xml에 추가
- Servers / server.xml 열고 확인 : <Context> 태그



### URL / URI / ContextPath / ServletPath

- URL : 전체 주소
  - http://localhost:8080/Servlet01/first
  - 프로토콜 + IP + 포트번호 + URI
- URI : ContextPath + ServletPath
  - /Servlet01/first
  - 프로젝트명 + 서블릿 맵핑 이름
- ContextPath : 프로젝트명
  - /Servlet01
- 서블릿 매핑 이름
  - /first



#### URI (Uniform Resource Identifier : 통합 자원 식별자)

- 특정 리소스를 구분하는 식별자
- 논리적 또는 물리적 리소스 (접근할 리소스 위치를 알 수 있음)
- 인터넷, 모바일 기기 등 다양한 곳에서 사용



#### URL (Uniform Resource Locator) : 웹 주소

- 리소스 위치
- URI가 서브넷