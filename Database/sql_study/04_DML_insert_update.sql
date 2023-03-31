CREATE TABLE publisher (
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(20) NOT NULL
);

CREATE TABLE book (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName CHAR(30) NOT NULL,
    bookPrice INT,
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- publisher 테이블에 데이터 입력
INSERT INTO publisher (pubNo, pubName) VALUES ('1', '서울 출판사');
INSERT INTO publisher (pubNo, pubName) VALUES ('2', '강남 출판사');
INSERT INTO publisher (pubNo, pubName) VALUES ('3', '종로 출판사');

-- publisher 테이블 내용 조회
SELECT * FROM publisher;

-- book 테이블에 데이터 입력
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
	VALUES ('1', '자바', 20000, '2022-01-03', '1');

-- book 테이블 내용 조회
SELECT * FROM book;

-- 모든 열의 데이터 입력 시 열 이름 생략 가능
INSERT INTO book VALUES ('2', '자바스크립트', 23000, '2022-01-03', '3');

-- 여러 개의 데이터를 한 번에 INSERT
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
	VALUES ('3', '데이터베이스', 35000, '2022-07-03', '2'),
		   ('4', '알고리즘', 10000, '2021-01-15', '3'),
           ('5', '웹프로그래밍', 22000, '2010-09-03', '2');

-- 모든 열의 데이터 입력 시 (열이름 생략) : 여러 개 한 번에 INSERT
INSERT INTO book
	VALUES ('6', '데이터베이스', 35000, '2022-07-03', '2'),
		   ('7', '알고리즘', 10000, '2021-01-15', '3'),
           ('8', '웹프로그래밍', 22000, '2010-09-03', '2');
           
           

-- INSERT문 연습문제
-- 학과 테이블 생성
CREATE TABLE department (
	dptNo CHAR(10) NOT NULL PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL,
    dptPhone VARCHAR(13)
);

-- 학생 테이블 생성
CREATE TABLE student (
	stdNo CHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdYear INT DEFAULT 1,
    stdAddress VARCHAR(50),
    dptNo CHAR(10) NOT NULL,
    CONSTRAINT FK_std_department FOREIGN KEY (dptNo) REFERENCES department (dptNo)
);

INSERT INTO department (dptNo, dptName, dptPhone)
	VALUE ('1', '컴퓨터공학과', '029999999'),
		  ('2', '경영학과', '021111111'),
          ('3', '시각디자인과', '028888888');
          
INSERT INTO student
	VALUE ('1001', '홍길동', 2, '서울시 강남구', '1'),
		  ('1002', '이몽룡', 1, '서울시 강서구', '2'),
          ('1003', '성춘향', 4, '경기도 고양시', '3');
          
SELECT * FROM department;
SELECT * FROM student;


-- 기본키 제약조건 추가하기 전에 text타입을 VARCHAR(10)로 변경
-- 변경하지 않으면 text 길이가 없다는 오류 발생
ALTER TABLE product MODIFY prdNo VARCHAR(10) NOT NULL;

-- 기본키 제약조건 추가
ALTER TABLE product
	ADD CONSTRAINT PK_product_prdNo
    PRIMARY KEY (prdNo);
    
-- 모든 텍스트 타입을 VARCHAR 타입으로 변경
ALTER TABLE product MODIFY prdName VARCHAR(20),
					MODIFY prdMaker VARCHAR(30),
                    MODIFY prdColor VARCHAR(10),
                    MODIFY ctgNo VARCHAR(10);
                    
-- 상품번호가 5인 행의 상품명을 'UHD TV'로 수정
UPDATE product SET prdName='UHD TV' WHERE prdNo='5';

SELECT * FROM product;

-- 상품명이 '그늘막 텐트'인 행 삭제
DELETE FROM product WHERE prdName='그늘막 텐트';


SELECT * FROM book;
-- 연습문제
INSERT INTO book
	VALUE ('9', 'JAVA 프로그래밍', 30000, '2022-03-10', '1'),
		  ('10', '파이썬 데이터 과학', 24000, '2021-02-05', '2');

UPDATE book SET bookPrice=22000 WHERE bookName='자바';

DELETE FROM book WHERE bookDate >= '2021-01-01' AND bookDate <= '2021-12-31';
DELETE FROM book WHERE bookDate BETWEEN '2021-01-01' AND '2021-12-31';



-- 종합 연습문제
-- 1. 고객 테이블 생성 : customer
CREATE TABLE customer (
	csNo CHAR(10) NOT NULL PRIMARY KEY,
    csName VARCHAR(30) NOT NULL,
    csPhone VARCHAR(13)
);

-- 2. 고객 테이블의 '전화번호' 열을 NOT NULL로 변경
ALTER TABLE customer MODIFY csPhone VARCHAR(13) NOT NULL;

-- 3. 고객 테이블에 '성별', '나이' 열 추가
ALTER TABLE customer ADD (csGender VARCHAR(10), csAge INT);

-- 4. 고객 테이블에 데이터 삽입 3개
INSERT INTO customer
	VALUE('1', '홍길동', '010-1234-5678', '남', 30),
		 ('2', '이몽룡', '010-2334-5655', '남', 19),
         ('3', '성춘향', '010-1113-4443', '여', 20);
         
-- 5. 고객명이 홍길동인 고객의 전화번호 값 수정 (값 임의)
UPDATE customer SET csPhone='010-9999-9999' WHERE csName='홍길동';

-- 6. 나이가 20살 미만인 고객 삭제
DELETE FROM customer WHERE csAge < 20;
 
SELECT * FROM customer;







