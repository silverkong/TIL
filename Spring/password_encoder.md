# 비밀번호 암호화



### 비밀번호 암호화

- 회원가입 시 평문으로 입력한 비밀번호를 암호화해서 저장

- 로그인 할 때 평문으로 입력한 비밀번호 암호화해서 저장된 비밀번호를 비교해서 로그인 확인

- 비밀번호 암호화 시 동일한 평문이더라도(1234) 다르게 암호화되어 저장



### PasswordEncoder 인터페이스 사용

- 인터페이스 개체로 빈 등록 과정

- WebSecurityConfig 클래스 생성

- 상속 : WebSecurityConfigurerAdapter

  ```java
  @Configuration
  @EnableWebSecurity
  @Bean
  public PasswordEncoder getPasswordEncoder() {
    return new BCryptPasswordEncoder();
    //BcryptPasswordEncoder는 BCrypt라는 해시 함수를 이용하여 패스워드를 암호화하는 구현체
  }
  ```

- configure() 메소드 오버라이딩
- 스프링 기본 로그인 폼 사용 안하고 우리가 작성한 사용자 정의 로그인 폼 사용할 수 있도록 설정
- 기본 접근 보안 기능 disable 시킴



### 암호화된 비밀번호로 로그인

- 이전에는 mapper에서 입력된 비밀번호와 DB에 있는 비밀번호 비교해서 확인
- 동일한 평문을 암호화하더라도 다르게 암호문 생성되기 때문에 입력한 비밀번호를 암호화해서 DB에 암호화된 비밀번호를 비교 불가
- mapper에서 전달받은 아이디에 해당되는 비밀번호(암호화된)를 반환하면 서비스에서 matches() 메소드를 사용해서 평문과 암호화된 문장이 일치 여부 체크
- 컨트롤러 일부 변경
- 서비스에서 비교