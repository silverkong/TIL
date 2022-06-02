# SQL_basic

> MySQL 워크벤치 GUI 활용하여 데이터베이스/테이블 생성해보기



## 데이터베이스 / 테이블 생성



### 데이터베이스 (스키마) 생성

> MySQL에서는 데이터베이스와 스키마가 동일한 의미로 사용

- root 권한으로 생성
- Schemas 탭에서 우클릭 / Create Schema...
- Name : shopdb (소문자 : 대문자로 하면 소문자로 바꾸겠다는 알림창 열림)
- Charset/Collation : utf8 / Default Collation
  - Collation : 해당 문자셋을 어떻게 정렬할 지 결정하는 방법
  - ORDER BY, LIKE, Primary Key 등 SQL 연산에 영향
- Apply



### 테이블 생성

- Shopdb / Tables 우클릭 > Create Table
  - 아직 SQL문 안하고 워크벤치에서 GUI로 테이블 작성
  - 데이터 입력
- member
  - memId : CHAR(10) PK NN
  - memName : VARCHAR(20) NN
  - memAddress : VARCHAR(50)





### 사용자 계정 생성

- Administration 탭에서 생성
- Users and Privileges > Add Account
  - Login Name : dbuser
  - Password : 1234
  - Confirm Password : 1234
  - Apply
- 권한 부여 : Schema Privileges > Add Entry
  - All Schema > Ok
  - Select ALL
  - Apply



### 사용자 계정으로 접속

- Home
- 접속 추가 : +버튼 누르기
  - Connection Name : dbtest
  - Username : dbuser
  - Default Schema : shopdb
  - Test Connection : 1234 > Ok
  - Ok