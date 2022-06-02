# MYSQL

> Mac에서 Homebrew로 설치하는 방법 / workbench 설치하는 방법



### MySQL
- Oracle사에서 제작한 DBMS 소프트웨어
- 대량의 데이터를 관리해주는 소프트웨어
- 오픈 소스 (Open Source) 로 제공




#### 상용 에디션
 - Standard, Enterprise, Cluster CGE비용이나 기능 면 비교
 - Standard < Enterprise < Cluster CGE




#### 무료 에디션
- Community
- Enterprise 버전과 기능상 차이는 거의 없음
- 사용 허가에 대한 라이선스 차이
- 실습에 사용할 버전 : MySQL Community 8.0





### Mac 설치 방법

> Homebrew 필수 설치되어 있어야 함



```bash
% brew update						// 최신 버전이 아니라면 업데이트

% brew install mysql		// 간단하게 최신 버전 설치 됨
% mysql -V							// mysql 버전 확인
mysql  Ver 8.0.29 for macos12.2 on x86_64 (Homebrew)

% mysql.server start		// 서버 시작
```



##### 초기 설정 명령어

```bash
mysql_secure_installation		// 초기 설정 명령어

Would you like to setup VALIDATE PASSWORD component?	// 비밀번호 설정
Press y|Y for Yes, any other key for No

Remove anonymous users? (Press y|Y for Yes. any other key for No) // 사용자 설정

Disallow root login remotely? (Press y|Y for Yes, any other key for No) //원격 설정

Remove test database and access to it? (Press y|Y for Yes, any other key for No) //Test 데이터베이스 제거 or 유지?

Reload privilege tables now? (Press y|Y for Yes, any other key for No) // 변경된 권한 테이블에 적용할건지? 해당 질문은 무조건 y

All done!
```



##### workbench 설치 방법

> 이때, 워크벤치와 자신의 mysql 버전이 맞는지 확인 필요!

[MySQL 설치하러 가기](https://dev.mysql.com/downloads/workbench/)



*참고로 homebrew 설치 시 환경 변수 설정 필요 없음*

