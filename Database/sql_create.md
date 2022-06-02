# SQL_CREATE

> SQL문 활용하여 테이블 생성해보기





#### CREATE 문

> 테이블, 도메인, 뷰, 인덱스, 스키마 구조 정의

- CREATE TABLE
- CREATE SCHEMA
- CREATE DOMAIN
- CREATE INDEX
- CREATE VIEW



##### CREATE TABLE

- 테이블 구성
- 속성(열)과 속성(열)에 관한 제약 정의
- 기본키 : PRIMARY KEY
- 외래키 : FOREIGN KEY



##### CREATE 문 기본 형식 (테이블 생성)

```sql
CREATE TABLE 테이블명(
  열이름 데이터타입 [...제약조건]
);

CREATE TABLE 테이블명(
  열이름 데이터타입 [NOT NULL][UNIQUE][DEFAULT][PRIMARY KEY 열이름][FOREIGN KEY 열이름 REFERENCES 테이블(기본키)]
);
```



##### CREATE KEY 제약 조건

- 기본키 제약 조건
- 열에 지정
- 중복 안 됨
- 빈 값 안 됨



##### 테이블 생성하기

###### 기본 스키마 설정

- Set as a Default Schema
- ```sql
  USE db명;
  ```



##### 외래키 제약 조건 설정

- 출판사 (출판사번호, 출판사명)
- 도서 (도서번호, 도서명, 가격, 발행일, 출판사번호(FK))
- **테이블 생성 순서 주의할 것**



##### 테이블 생성 후 데이터 입력 시 주의

- publisher의 pubNo에 먼저 값을 입력해야 book의 pubNo 입력할 때 오류 없음
- 즉, 외래키 값을 입력할 때는 참조되는 테이블의 기본키로서의 값과 동일해야 함 (참조 무결성 제약 조건 때문)



##### 테이블 삭제 시 주의

- book 테이블 먼저 삭제하고 publisher를 삭제
- book에서 pubNo 사용 중이기 때문에 publisher 먼저 삭제 불가
- 즉, 외래키로 사용 중인 경우에는 참조되는 테이블(부모 테이블)의 기본키를 삭제할 수 없음 (참조 무결성 제약 조건 때문)
