ALTER TABLE publisher MODIFY pubNo CHAR(10) NOT NULL,
					  MODIFY pubName VARCHAR(20);
                      
ALTER TABLE book MODIFY bookNo CHAR(10) NOT NULL,
				 MODIFY bookName VARCHAR(20),
                 MODIFY bookAuthor VARCHAR(20),
                 MODIFY bookDate DATE,
                 MODIFY pubNo CHAR(10) NOT NULL;
                 
ALTER TABLE client MODIFY clientNo CHAR(10) NOT NULL,
				   MODIFY clientName VARCHAR(20),
				   MODIFY clientPhone VARCHAR(13),
                   MODIFY clientAddress VARCHAR(50),
                   MODIFY clientBirth DATE,
                   MODIFY clientHobby VARCHAR(20),
                   MODIFY clientGender VARCHAR(5);

ALTER TABLE bookSale MODIFY bsNo CHAR(10) NOT NULL,
					 MODIFY bsDate DATE,
                     MODIFY clientNo CHAR(10) NOT NULL,
                     MODIFY bookNo CHAR(10) NOT NULL;
                     
ALTER TABLE publisher
	ADD CONSTRAINT PK_publisher_pubNo
    PRIMARY KEY (pubNo);
    
ALTER TABLE book
	ADD CONSTRAINT PK_book_bookNo
    PRIMARY KEY (bookNo);
    
ALTER TABLE client
	ADD CONSTRAINT PK_client_clientNo
    PRIMARY KEY (clientNo);
    
ALTER TABLE bookSale
	ADD CONSTRAINT PK_bookSale_bsNo
    PRIMARY KEY (bsNo);


ALTER TABLE book
	ADD CONSTRAINT FK_book_publisher
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo);
    
ALTER TABLE bookSale
	ADD CONSTRAINT FK_bs_client
    FOREIGN KEY (clientNo) REFERENCES client (clientNo);
    
ALTER TABLE bookSale
	ADD CONSTRAINT FK_bs_book
    FOREIGN KEY (bookNo) REFERENCES book (bookNo);
    
-- SELECT문
-- book 테이블에서 모든 행 검색하여 출력

-- 모든(*)열
SELECT * FROM book;

-- 도서명과 가격만 검색하여 출력
SELECT bookName, bookPrice FROM book;

-- 저자만 검색
SELECT bookAuthor FROM book;

-- 중복되는 행은 한 번만 출력해서 저자만 검색하여 출력
SELECT DISTINCT bookAuthor FROM book;


-- WHERE
-- 비교 (==, <, >, <=, >=, !=)

-- 저자가 '홍길동'인 도서의 도서명, 저자 출력
SELECT bookName, bookAuthor FROM book WHERE bookAuthor='홍길동';

-- 가격이 30000 이상인 도서의 도서명, 가격, 재고 출력
SELECT bookName, bookPrice, bookStock FROM book WHERE bookPrice >= 30000;

-- 재고가 3~5개 사이인 도서의 도서명, 재고 출력
-- BETWEEN 3 AND 5 : 3과 5포함
SELECT bookName, bookStock FROM book WHERE bookStock BETWEEN 3 AND 5; 


-- 리스트에 포함 (IN, NOT IN)

-- 출판사명이 '서울 출판사'와 '도서출판 강남'인 도서의 도서명, 출판사 번호 출력
SELECT bookName, pubNo FROM book WHERE pubNo IN('1', '2');

-- 출판사명이 '도서출판 강남'이 아닌 도서의 도서명, 출판사 번호 출력
SELECT bookName, pubNo FROM book WHERE pubNo NOT IN('2');


-- NULL (IS NULL, IS NOT NULL)

-- 먼저 client 테이블 확인 : null
SELECT * FROM client;

-- null로 설정
-- 고객명 호날두와 샤라포바의 취미를 null로 설정
UPDATE client SET clientHobby = NULL WHERE clientName = '호날두';
UPDATE client SET clientHobby = NULL WHERE clientName = '샤라포바';

-- 모든 고객명, 취미 출력
SELECT clientName, clientHobby FROM client;

-- 취미에 NULL 값이 들어가 있는 행만 출력
SELECT * FROM client WHERE clientHobby IS NULL;

-- 취미에 NULL 값이 아닌 행만 출력
SELECT * FROM client WHERE clientHobby IS NOT NULL;

-- 취미에 공백이 들어있는 행만 출력
-- 아래 두 행다 공백
SELECT * FROM client WHERE clientHobby = '';
SELECT * FROM client WHERE clientHobby = ' ';


-- 논리 (AND, OR)

-- 저자가 '홍길동'이면서 재고가 3권 이상인 모든 도서 출력
SELECT * FROM book WHERE bookAuthor = '홍길동' AND bookStock >= 3;

-- 저자가 '홍길동'이거나 '성춘향'인 모든 도서 출력
SELECT * FROM book WHERE bookAuthor = '홍길동' OR bookAuthor = '성춘향';


-- 패턴 매칭 (LIKE)

-- 출판사 테이블에서 출판사명에 '출판사'가 포함된 모든 행 출력
SELECT * FROM publisher WHERE pubName LIKE '%출판사%';

-- 고객 테이블에서 출생년도가 1990년대인 고객의 고객명, 생년월일 출력
SELECT clientName, clientBirth FROM client WHERE clientBirth LIKE '199%';

-- 고객 이름이 4글자인 모든 고객 출력
SELECT * FROM client WHERE clientName LIKE '____';

-- 도서 테이블에서 도서명에 '안드로이드'가 들어 있지 않는 도서의 도서명 출력
SELECT bookName FROM book WHERE bookName NOT LIKE '%안드로이드%';


-- 연습문제
-- 1. 고객 테이블에서 고객명, 생년월일, 성별 출력
SELECT clientName, clientBirth, clientGender FROM client;

-- 2. 고객 테이블에서 주소만 검색하여 출력 (중복은 한 번만 출력)
SELECT DISTINCT clientAddress FROM client;

-- 3. 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
SELECT clientName, clientHobby FROM client WHERE clientHobby = '축구' OR clientHobby = '등산';
SELECT clientName, clientHobby FROM client WHERE clientHobby IN ('축구', '등산');

-- 4. 도서 테이블에서 저자의 두 번재 위치에 '길'이 들어있는 저자명 출력 (중복은 한 번만 출력)
SELECT DISTINCT bookAuthor FROM book WHERE bookAuthor LIKE '_길%';

-- 5. 도서 테이블에서 발행일이 2019년인 도서의 도서명, 저자, 발행일 출력
SELECT bookName, bookAuthor, bookDate FROM book WHERE bookDate LIKE '2019%';

-- 6. 도서판매 테이블에서 고객번호 1,2를 제외한 모든 판매 데이터 출력
SELECT * FROM bookSale WHERE clientNo > 2;

-- 7. 고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
SELECT clientName, clientAddress, clientHobby FROM client WHERE clientHobby IS NOT NULL AND clientAddress = '%서울%';

-- 8. 도서 테이블에서 가격이 25,000원 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
SELECT bookName, bookAuthor, bookPrice, bookStock FROM book WHERE bookPrice >= 25000 AND bookAuthor LIKE '%길동%';

-- 9. 도서 테이블에서 가격이 20,000원 ~ 25,000원인 모든 도서 출력
SELECT * FROM book WHERE bookPrice BETWEEN 20000 AND 25000;

-- 10. 도서 테이블에서 저자명에 '길동'이 들어있지 않는 도서의 도서명, 저자 출력
SELECT bookName, bookAuthor FROM book WHERE bookAuthor NOT LIKE '%길동%';



