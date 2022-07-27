# c:url 사용시 jsessionid 붙는 경우

처음 접속 시 cookie 사용하지 못하는 경우를 위해 자동으로 jsessionid를 붙여줌

경로를 못 찾는 경우 발생



### jsessionid 제거

- application.properites 파일에서 설정

  ```properties
  # 해당 코드 작성하면 jsessionid가 링크에 붙여서 나오지 않음
  server.servlet.session.tracking-modes=cookie
  ```

  