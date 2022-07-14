CREATE TABLE product(
	prdNo CHAR(20) NOT NULL PRIMARY KEY,
	prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30),
    prdStock INT
);

INSERT INTO product
	VALUES ('1001', '노트북', 1000000, '삼성', 10),
		   ('1002', '냉장고', 1200000, 'LG', 5),
           ('1003', '마우스', 30000, '로지텍', 12);
           
SELECT * FROM product;


CREATE TABLE book(
	bookNo CHAR(20) NOT NULL PRIMARY KEY,
	bookName VARCHAR(30) NOT NULL,
    bookAuthor VARCHAR(20),
    bookPrice INT,
    bookDate DATE,
    bookStock INT
);

INSERT INTO book
	VALUES ('1001','데이터베이스 이론','홍길동',22000,'2018-11-11',5),
		   ('1002','자바 프로그래밍','이몽룡',25000,'2020-12-12',4),
           ('1003','인터넷프로그래밍','성춘향',30000,'2019-02-10',10);

           
SELECT * FROM book;


CREATE TABLE product (
	prdNo VARCHAR(10) NOT NULL PRIMARY KEY,
	prdName VARCHAR(30),
	prdPrice INT(10),           
	prdCompany VARCHAR(50),
	prdStock INT(5),
	prdDate Date
 );
         
INSERT INTO product VALUES('1001', '세탁기', 100000, '삼성', 10, '2020-11-11');    
INSERT INTO product VALUES('1002', '냉장고', 120000, 'LG', 3, '2021-11-11');
INSERT INTO product VALUES('1003', '프린터', 300000, 'HP', 5, '2022-11-11');    

SELECT * FROM product;
