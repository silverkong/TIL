-- ORDER BY : 정렬

-- 도서명 순으로 도서 검색 (기본 : 오름차순 (일반적으로 ASC 생략))
SELECT * FROM book ORDER BY bookName ASC;
SELECT * FROM book ORDER BY bookName;	-- ASC 생략

-- 도서명 순으로 도서 검색 (내림차순 : DESC)
SELECT * FROM book ORDER BY bookName DESC;

-- 한글 - 영문 - 숫자 순서로 출력 (오름차순)
SELECT * FROM book
ORDER BY
(CASE WHEN ASCII(SUBSTRING(bookName, 1)) BETWEEN 48 AND 57 THEN 3
	  WHEN ASCII(SUBSTRING(bookName, 1)) < 122 THEN 2 ELSE 1 END), bookName;
-- 영어 대문자 A ~ Z : 65 ~ 90
-- 영어 소문자 a ~ z : 97 ~ 122
-- 숫자 0 ~ 9 : 48 ~ 57

-- 한글 - 영문 - 숫자 순서로 출력 (내림차순)
SELECT * FROM book
ORDER BY
(CASE WHEN ASCII(SUBSTRING(bookName, 1)) BETWEEN 48 AND 57 THEN 3
	  WHEN ASCII(SUBSTRING(bookName, 1)) < 122 THEN 2 ELSE 1 END), bookName DESC;

-- 상위 N개만 출력 : LIMIT N
SELECT * FROM book ORDER BY bookName LIMIT 5;

-- 또는 OFFSET 0 설정 (OFFSET 시작 위치) : 첫 번째부터 시작
SELECT * FROM book ORDER BY bookName LIMIT 5 OFFSET 0;

-- 또는 LIMIT 시작, 출력 개수
SELECT * FROM book ORDER BY bookName LIMIT 0, 5;
SELECT * FROM book ORDER BY bookName LIMIT 10, 5;	-- 11번째부터 5개
SELECT * FROM book ORDER BY bookName LIMIT 10, 7;	-- 11번째부터 7개 (총 15개이므로 데이터 없으면 출력 안 됨)

-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여 도서명, 저자, 재고 출력
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC;

-- 2차 정렬 : 1차 재고수량 내림차순, 2차 저자명 오름차순
-- 재고 수량이 동일한 경우, 저자명으로 오름차순 정렬
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC, bookAuthor ASC;
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC, bookAuthor;	-- ASC 생략 가능

-- 2차 정렬 : 1차 재고수량 내림차순, 2차 저자명 내림차순
-- 재고 수량이 동일한 경우, 저자명으로 내림차순 정렬
SELECT bookName, bookAuthor, bookStock FROM book ORDER BY bookStock DESC, bookAuthor DESC;


-- SUM() : 합계

-- 도서 테이블에서 총 재고 수량 계산하여 출력
-- 열 이름 없이 총합만 출력
SELECT SUM(bookStock) FROM book;

-- 열 이름을 sum of bookStock으로 총 재고 수량 계산하여 출력
SELECT SUM(bookStock) AS "sum of bookStock" FROM book;

-- 열 이름으로 한글도 가능
SELECT SUM(bookStock) AS "총 재고량" FROM book;

-- 열 이름으로 작은 따옴표도 사용 가능
SELECT SUM(bookStock) AS '총 재고량' FROM book;

-- 열 이름에 공백 없으면 따옴표 없어도 사용 가능
SELECT SUM(bookStock) AS 총재고량 FROM book;

-- 도서 판매 테이블에서 고객번호가 2인 호날두가 주문한 도서의 총 주문 수량 계산하여 출력
SELECT SUM(bsQty) AS '총 주문 수량' FROM bookSale WHERE clientNo = '2'; 


-- 도서 판매 테이블에서 최대/최소 주문 수량
SELECT MAX(bsQty) AS '최대 주문 수량', MIN(bsQty) AS '최소 주문 수량' FROM bookSale;

-- 도서 테이블에서 도서의 가격 총액, 평균 가격, 최고가, 최저가 출력
SELECT SUM(bookPrice) AS '가격 총액', AVG(bookPrice) AS '평균 가격', MAX(bookPrice) AS '최고가', MIN(bookPrice) AS '최저가' FROM book;


-- 평균가를 정수로 표현 (반올림) : ROUND(숫자)
-- 소수이하 자리 출력 : ROUND(숫자, 소수이하 자리수)
SELECT SUM(bookPrice) AS '가격 총액', ROUND(AVG(bookPrice)) AS '평균 가격',MAX(bookPrice) AS '최고가', MIN(bookPrice) AS '최저가' FROM book;
SELECT SUM(bookPrice) AS '가격 총액', ROUND(AVG(bookPrice), 1) AS '평균 가격',MAX(bookPrice) AS '최고가', MIN(bookPrice) AS '최저가' FROM book;


-- 도서 판매 테이블에서 도서 판매 건수 출력 (모든 행의 수)
SELECT COUNT(*) AS '총 판매 건수' FROM bookSale;

-- 도서 테이블에서 총 도서 수 출력 (모든 행의 수)
SELECT COUNT(*) AS "총 도서 수" FROM book;

-- 고객 테이블에서 총 고객 수 출력 (모든 행의 수)
SELECT COUNT(*) AS "총 고객 수" FROM client;

-- 고객 테이블에서 총 취미 개수 출력
SELECT COUNT(clientHobby) AS "총 취미 개수" FROM client;	-- 7 (NULL 값만 제외)

-- 고객 테이블의 취미 열에서 값이 들어 있는 행의 수 출력
SELECT COUNT(clientHobby) AS "취미 수" FROM client WHERE clientHobby NOT IN('');
SELECT COUNT(clientHobby) AS "취미 수" FROM client WHERE clientHobby != '';


-- GROUP BY
-- 주의! SELECT 절에는 GROUP BY에서 사용한 열과 집계만 나올 수 있음

-- 도서 판매 테이블에서 도서 번호 별로 주문 수량 합계 출력
SELECT bookNo, SUM(bsQty) AS "주문량 합계" FROM bookSale GROUP BY bookNo;

-- GROUP BY 절에서 정렬
SELECT bookNo, SUM(bsQty) AS "주문량 합계" FROM bookSale GROUP BY bookNo ORDER BY bookNo;
SELECT bookNo, SUM(bsQty) AS "주문량 합계" FROM bookSale GROUP BY bookNo ORDER BY 1; -- 첫 번재 열로 정렬
SELECT bookNo, SUM(bsQty) AS "주문량 합계" FROM bookSale GROUP BY bookNo ORDER BY 2; -- 두 번재 열로 정렬

-- 주의! ORDER BY 다음 열 이름에 따옴표가 있으면 정렬 안 됨
-- 참고 : 열 이름에 따옴표 있으면 영어도 안 됨 (큰 따옴표, 작은 따옴표 다 안 됨)
SELECT bookNo, SUM(bsQty) AS "주문량 합계" FROM bookSale GROUP BY bookNo ORDER BY "주문량 합계";

-- 공백 없는 열 이름으로(따옴표 없음) 정렬 가능
SELECT bookNo, SUM(bsQty) AS 주문량합계 FROM bookSale GROUP BY bookNo ORDER BY 주문량합계;

-- ROLLUP : 중간의 소 합계와 총 합계 출력
SELECT bookNo, SUM(bsQty) AS 주문량합계 FROM bookSale GROUP BY bookNo WITH ROLLUP;
SELECT bookNo, SUM(bsQty) AS 주문량합계 FROM bookSale GROUP BY bookNo WITH ROLLUP ORDER BY 주문량합계;	-- ORDER BY는 ROLLUP 다음에 넣어야 함



-- HAVING 검색 조건
-- GROUP BY에 의해 구성된 그룹들에 대해 적용할 조건 기술
-- SUM, AVG, MAX, MIN, COUNT 등의 집계 함수와 함께 사용
-- 주의! 반드시 GROUP BY와 같이 사용, WHERE보다 뒤에 검색 조건에는 집계 함수만 와야 함

-- 도서 테이블에서 가격이 25,000원 이상인 도서에 대하여 출판사별로 도서 수 합계 출력
SELECT pubNo, COUNT(*) AS "도서수 합계"
FROM book WHERE bookPrice >= 25000 GROUP BY pubNo;

-- 출판사별로 그룹화 한 후 조건 추가 : HAVING
-- 단, 도서수 합계가 2 이상인 경우
SELECT pubNo, COUNT(*) AS "도서수 합계"
FROM book WHERE bookPrice >= 25000 GROUP BY pubNo
HAVING COUNT(*) >= 2;



-- 연습문제
-- 1. 도서 테이블에서 가격 순으로 내림차순 정렬하여 도서명, 저자, 가격 출력 (가격 같으면 저자 순으로 오름차순)
SELECT bookName, bookAuthor, bookPrice FROM book ORDER BY bookPrice DESC, bookAuthor;

-- 2. 도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
SELECT SUM(bookStock) AS "총 재고 수량" FROM book WHERE bookAuthor LIKE '%길동%';

-- 3. 도서 테이블에서 '서울 출판사' 도서 중 최고가와 최저가 출력
SELECT MAX(bookPrice) AS 최고가, MIN(bookPrice) AS 최저가 FROM book WHERE pubNo = '1';

-- 4. 도서 테이블에서 출판사별로 총 재고 수량과 평균 재고 수량 계산하여 출력(총 재고 수량 내림차순)
SELECT pubNo, SUM(bookStock) AS "총 재고 수량", ROUND(AVG(bookStock), 1) AS "평균 재고 수량"
FROM book GROUP BY pubNo ORDER BY 2 DESC;

-- 무조건 올림 : CEIL()
SELECT pubNo, SUM(bookStock) AS "총 재고 수량", CEIL(AVG(bookStock)) AS "평균 재고 수량"
FROM book GROUP BY pubNo ORDER BY 2 DESC;

-- 무조건 내림 : FLOOR()
SELECT pubNo, SUM(bookStock) AS "총 재고 수량", FLOOR(AVG(bookStock)) AS "평균 재고 수량"
FROM book GROUP BY pubNo ORDER BY 2 DESC;

-- 5. 도서판매 테이블에서 고객별로 총 주문 수량과 총 주문 건수 출력 (단, 주문 건수 2 이상인 고객만)
SELECT clientNo, SUM(bsQty) AS "총 주문 수량", COUNT(*) AS "총 주문 건수"
FROM bookSale GROUP BY clientNo HAVING COUNT(*) >= 2;



SELECT * FROM bookSale WHERE clientNo = '2';
-- 호날두가 주문한 내역과 총 주문 수량 합계 출력
-- 먼저 주문내역 결과 출력하고 그 아래에 합계 결과 출력
-- 2개의 쿼리를 합침 : UNION ALL
SELECT clientNo, bsQty FROM bookSale WHERE clientNo = '2'
UNION ALL
SELECT "합계" clentNo, SUM(bsQty) AS "주문수량 합계" FROM bookSale WHERE clientNo = '2';

