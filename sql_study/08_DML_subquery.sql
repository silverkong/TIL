-- 서브 쿼리

-- 고객 호날두의 주문 수량 조회
-- 1. client 테이블에서 고객명 '호날두'의 clientNo를 찾아서
-- 2. bookSale 테이블에서 이 clientNo에 해당되는 주문에 대해 주문일, 주문수량 출력

SELECT bsDate, bsQty
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');

SELECT bsDate, bsQty
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				   FROM client
				   WHERE clientName = '호날두');
                  
-- 고객 '호날두'가 주문한 총 주문 수량
SELECT SUM(bsQty) AS "총 주문 수량"
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');
                  
SELECT SUM(bsQty) AS "총 주문 수량"
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				   FROM client
			       WHERE clientName = '호날두');     


-- 가장 비싼 도서의 도서명과 가격 출력
SELECT bookName, bookPrice
FROM book
WHERE bookPrice = (SELECT MAX(bookPrice)
				   FROM book);
                   

-- 단일 행 서브 쿼리 예 : 비교 연산자 사용
-- 1. 도서의 평균 가격보다 비싼 도서에 대해서
-- 2. 도서명, 가격 출력
SELECT bookName, bookPrice
FROM book
WHERE bookPrice > (SELECT ROUND(AVG(bookPrice))
				   FROM book);
                   
SELECT ROUND(AVG(bookPrice)) FROM book;


-- 단일행과 다중행의 의미 : 서브쿼리 결과가 단일행(1행)이냐 다중행(2행~)이냐
-- 단일행인지 다중행인지 확실하지 않을 경우에는 IN 사용하면 오류 없음

-- 다중 행 서브쿼리 (IN / NOT IN)
-- 도서를 구매한 적이 있는 고객의 고객번호, 고객명 출력
-- 1. 도서를 구매한 적이 있는 고객 : bookSale 테이블에 존재하는 고객
-- 2. client 테이블에서 1번에서 찾은 고객번호에 해당하는 고객을 찾아 고객번호, 고객명 출력

SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale);
-- 도서 구매 고객이 여러 명 존재하기 때문에 서브쿼리 결과 다중행


-- 한 번도 도서를 구매한 적이 없는 고객의 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE clientNo NOT IN (SELECT clientNo
					   FROM bookSale);
                       

-- 도서명이 '안드로이드 프로그래밍'인 도서를 구매한 고객의 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT C.clientNo
					FROM bookSale BS
						INNER JOIN book B ON B.bookNo = BS.bookNo
						INNER JOIN client C ON C.clientNo = BS.clientNo
					WHERE B.bookName = '안드로이드 프로그래밍');
                    
-- 중첩 서브쿼리
SELECT clientName
FROM client
WHERE clientNO IN (SELECT clientNo
				   FROM bookSale
				   WHERE bookNo = (SELECT bookNo
								   FROM book
								   WHERE bookName = '안드로이드 프로그래밍'))
ORDER BY clientName;


-- 다중 행 서브쿼리 (EXISTS / NOT EXISTS)
-- 서브쿼리의 결과가 행을 반환하면 TRUE
-- WHERE절에 외래키 제약조건 반환

-- 도서를 구매한 적이 있는 고객의 고객번호, 고객명 출력
-- 1. bookSale 테이블에 조건에 해당되는 행이 존재하면 참 변환
-- 2. client 테이블에서 이 clientNo에 해당되는 고객의 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE EXISTS (SELECT clientNo
		      FROM bookSale
		      WHERE client.clientNo = bookSale.clientNo);
              
-- 한 번도 주문한 적이 없는 고객의 고객번호, 고객명 출력
-- 서브쿼리의 조건에 해당되는 행이 없으면 TRUE 반환
SELECT clientNo, clientName
FROM client
WHERE NOT EXISTS (SELECT clientNo
				  FROM bookSale
				  WHERE client.clientNo = bookSale.clientNo);
              
-- NULL인 경우 IN과 EXISTS 차이
-- clientHobby에 NULL이 포함되어 있음
SELECT clientNo, clientHobby FROM client;

-- EXISTS : 서브 쿼리 결과에 NULL 값 포함
-- NULL 값을 가진 clientHobby도 포함하여 모든 clientNo 출력
SELECT clientNo
FROM client
WHERE EXISTS (SELECT clientHobby
			  FROM client);

-- IN : 서브쿼리 결과에 NULL 값 포함되지 않음
-- NULL 값을 갖지 않는 clientNo만 출력
SELECT clientNo
FROM client
WHERE clientHobby IN (SELECT clientHobby
					  FROM client);

-- ALL
-- 검색 조건이 서브 쿼리의 결과의 모든 값에 만족하면 참
-- 2번 고객이 주문한 도서의 최고 주문수량보다 더 많은 도서를 구입한 고객의 고객번호, 주문번호, 주문수량 출력
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ALL (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2');

-- ANY
-- 2번 고객보다 한 번이라도 더 많은 주문을 한 적이 있는 고객의 고객번호, 주문번호, 주문수량 출력
-- 최소 한 번이라도 크면 됨
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2');

-- 2번 고객 자신은 제외
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE clientNo != '2' AND bsQty > ANY (SELECT bsQty
								       FROM bookSale
								       WHERE clientNo = '2');
                                       
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
				   WHERE clientNo = '2')
AND clientNo != '2';



-- 연습문제 : 서브쿼리 사용
-- 1. 호날두(고객명)가 주문한 도서의 총 구매량 출력
SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
			  	  WHERE clientName = '호날두');


-- 2. ‘정보출판사’에서 출간한 도서를 구매한 적이 있는 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
				   WHERE bookNo IN (SELECT bookNo
									FROM book
									WHERE pubNo IN (SELECT pubNo
													FROM publisher
													WHERE pubName = '정보출판사')));

-- 3. 베컴이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구매한 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
                   WHERE bsQty > ALL (SELECT bsQty
								      FROM bookSale
                                      WHERE clientNo = (SELECT clientNo
													    FROM client
                                                        WHERE clientName = '베컴')));
                                                        
-- MAX()
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				   FROM bookSale
                   WHERE bsQty > (SELECT MAX(bsQty)
								  FROM bookSale
								  WHERE clientNo = (SELECT clientNo
													FROM client
													WHERE clientName = '베컴')));

-- 4. 서울에 거주하는 고객에게 판매한 도서의 총 판매량 출력
SELECT SUM(bsQty) AS "총 판매량"
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				   FROM client
                   WHERE clientAddress LIKE '%서울%' );
                   
SELECT SUM(bsQty) AS "총 판매량"
FROM bookSale
WHERE clientNo IN (SELECT clientNo
				   FROM client
                   WHERE clientAddress = '서울' );




-- 스칼라 서브 쿼리 예제
-- 고객별로 총 주문 수량 출력
SELECT clientNo, (SELECT clientName
				  FROM client
                  WHERE client.clientNo = bookSale.clientNo) AS 고객명, SUM(bsQty)
FROM bookSale
GROUP BY clientNo;


-- 인라인 뷰 서브 쿼리 예제
-- 도서 가격이 25,000원 이상인 도서에 대하여 도서별로 도서명, 도서가격, 총 판매수량, 총 판매액 출력
-- 총 판매액 기준으로 내림차순 정렬
SELECT bookName, bookPrice, SUM(bsQty) AS "총 판매수량", SUM(bookPrice * bsQty) AS "총 판매액"
FROM (SELECT bookNo, bookName, bookPrice
	  FROM book
      WHERE bookPrice >= 25000) book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY book.bookNo
ORDER BY 4 DESC;





-- 내장 함수

-- ROUND(값, 자릿수)
-- 자릿수 양수 : 소숫점 오른쪽 자릿수
-- 자릿수 음수 : 소수점 왼쪽 자릿수

-- 고객별로 평균 주문액을 백 원 단위에서 반올림하여 출력 (천 원 자리까지 출력)
SELECT clientNo, ROUND(AVG(bookPrice * bsQty)) AS "평균 주문액",
				 ROUND(AVG(bookPrice * bsQty), 0) AS "1의 자리까지 주문액",
                 ROUND(AVG(bookPrice * bsQty), -1) AS "10의 자리까지 주문액",
                 ROUND(AVG(bookPrice * bsQty), -2) AS "100의 자리까지 주문액",
                 ROUND(AVG(bookPrice * bsQty), -3) AS "1000의 자리까지 주문액"
FROM book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY clientNo;


-- RANK() / DENSE_RANK() / ROW_NUMBER()

SELECT bookPrice,
	   RANK() OVER (ORDER BY bookPrice DESC) 'RANK',
       DENSE_RANK() OVER (ORDER BY bookPrice DESC) 'DENSE_RANK',
       ROW_NUMBER() OVER (ORDER BY bookPrice DESC) 'ROW_NUMBER'
FROM book;


-- REPLACE() / CHAR_LENGTH() / LENGTH() / SUBSTR()

-- REPLACE()
-- 문자열을 치환하는 함수
-- 실제 데이터는 변경되지 않음
-- 도서명에 '안드로이드'가 포함된 도서에 대해 'Android'로 변경해서 출력
SELECT bookNo, REPLACE(bookName, '안드로이드', 'Android'), bookName, bookAuthor, bookPrice
FROM book
WHERE bookName LIKE '%안드로이드%';


-- CHAR_LENGTH() / LENGTH()
-- '서울 출판사'에서 출간한 도서의 도서명과 도서명의 글자 수, 바이트 수, 출판사명 출력
SELECT B.bookName AS "도서명",
	   LENGTH(B.bookName) AS "바이트 수",
       CHAR_LENGTH(B.bookName) AS "길이",
       P.pubName AS "출판사명"
FROM book B
	INNER JOIN publisher P ON B.pubNo = P.pubNo
WHERE P.pubName = '서울 출판사';


-- SUBSTR()
-- SUBSTR(전체문자열, 시작, 길이)
-- 저자에서 성만 출력
SELECT SUBSTR(bookAuthor, 1, 1) AS "성"
FROM book;

-- 저자에서 이름만 출력
SELECT SUBSTR(bookAuthor, 2) AS "이름"
FROM book;



-- 연습문제
-- 1. 저자 중에서 성이 '손'인 모든 저자 출력
SELECT bookAuthor
FROM book
WHERE SUBSTR(bookAuthor, 1, 1) = '손';


-- 2. 저자 중에서 같은 성을 가진 사람이 몇 명인지 알아보기 위해
-- 성별로 그룹지어 인원 수 출력
SELECT SUBSTR(bookAuthor, 1, 1) AS "성", COUNT(*) AS "인원수"
FROM book
GROUP BY 성;



-- 현재 날짜와 시간 출력
SELECT DATE(NOW()), TIME(NOW());
SELECT NOW(); -- '2022-06-08 13:31:03'

-- 연/월/일
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT CURDATE();

-- 시/분/초/마이크로초
SELECT HOUR(CURTIME()), MINUTE(CURRENT_TIME()), SECOND(CURRENT_TIME()), MICROSECOND(CURRENT_TIME());

SELECT DATEDIFF('2022-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10');



-- LOAD_FILE()

-- 테이블 생성
CREATE TABLE flower (
	flowerNo VARCHAR(10) NOT NULL PRIMARY KEY,
    flowerName VARCHAR(30),
    flowerInfo LONGTEXT,
    flowerImage LONGBLOB
);

INSERT INTO flower VALUES ('f001', '장미',
						   LOAD_FILE('/Users/bina/Documents/dbWorkspace/file/rose.txt'),
                           LOAD_FILE('/Users/bina/Documents/dbWorkspace/file/rose.jpg'));

CREATE TABLE movie (
	movieId VARCHAR(10) NOT NULL PRIMARY KEY,
    movieTitle VARCHAR(30),
    movieDirector VARCHAR(20),
    movieStar VARCHAR(20),
    movieScript LONGTEXT,
    movieFilm LONGBLOB
);

INSERT INTO movie VALUES ('1', '쉰들러 리스트', '스필버그', '리암 니슨',
		LOAD_FILE('/Users/bina/Documents/dbWorkspace/file/Schindler.txt'), 
        LOAD_FILE('/Users/bina/Documents/dbWorkspace/file/Schindler.mp4'));
        
-- 테이블 복사
CREATE TABLE new_book1 AS 
      SELECT * FROM book;
       
SELECT * FROM new_book1;
DESCRIBE new_book1;
        
-- 테이블 복사2 : 새 테이블로 일부만 복사
-- WHERE 절에서 조건 설정
CREATE TABLE new_book2 AS
      SELECT * FROM book WHERE bookDate >= '2020-01-01';

-- 테이블 복사3 : 기존 테이블로 데이터만 복사
-- 1. new_book2 테이블의 데이터 삭제
DELETE FROM new_book2;
SELECT * FROM new_book2;

-- 2. 기존의 book 테이블에서 데이터만 new_book2 테이블로 복사
INSERT INTO new_book2
SELECT * FROM book;

ALTER TABLE new_book2
	ADD CONSTRAINT PK_new_book2_bookNo
    PRIMARY KEY (bookNo);

-- bookSale 테이블에서 새 테이블 new_bookSale 테이블 복사
-- 단 주문 수량이 5개 이상인 행만 복사
CREATE TABLE new_bookSale AS
SELECT * FROM bookSale WHERE bsQty >= 5;

ALTER TABLE new_bookSale
	ADD CONSTRAINT PK_new_bookSale_bsNo
    PRIMARY KEY (bsNo);

SELECT * FROM new_bookSale;
DESCRIBE new_bookSale;


-- 다른 데이터베이스에 있는 테이블 복사
CREATE TABLE product AS
SELECT * FROM sqldb2.product;

ALTER TABLE product
	ADD CONSTRAINT PK_product_prdNo
    PRIMARY KEY (prdNo);
    
SELECT * FROM product;
DESCRIBE product;
