# SQL_INSERT

> SQL문 활용하여 테이블에 데이터 입력해보기



#### INSERT 문

> 테이블에 새로운 행을 삽입하는 명령어



##### INSERT 문 기본 형식

```sql
INSERT INTO 테이블명 (열 이름 리스트) VALUES (값 리스트);

-- 열 이름 생략 가능
-- 이때 모든 열에 데이터 들어가야 함
INSERT INTO 테이블명 VALUES (값 리스트);
```

문자열은 작은 따옴표 사용함