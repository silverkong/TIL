# MySQL 내장함수



### 수학함수

- ROUND()
- RANK()
- DENSE_RANK()
- ROW_NUMBER()



### 문자 함수

- REPLACE()
- CHAR_LENGTH()
- LENGTH()
- SUBSTR()



### 날짜 함수

- DATE()
- NOW()
- TIME()
- YEAR() / MONTH() / HOUR() / MINUTE() / SECOND()
- DATEDIFF()



LOAD_FILE()



### 순위 출력 함수

- RANK() : 값의 순위 반환 (동일 순위 개수만큼 증가)
- DENSE_RANK() : 값의 순위 반환 (동일 순위 상관없이 1 증가)
- ROW_NUMBER() : 행의 순위 반환



### 문자 함수

- REPLACE() : 문자열을 치환하는 함수
- CHAR_LENGTH() : 글자의 수를 반환하는 함수
- LENGTH() : 바이트 수 반환하는 함수
- SUBSTR() : 지정한 길이만큼의 문자열을 반환하는 함수



### MySQL 시스템변수 : secure-file-priv 옵션

- 보안 강화를 위해 지정한 폴더 외에는 파일의 읽기/쓰기를 금지
- my.cnf 파일 찾아서 메모장으로 열고 추가
  - usr/local/etc/my.cnf
  - secure-file-priv=""
