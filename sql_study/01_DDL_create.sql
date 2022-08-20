-- 스키마 (데이터베이스 생성)
CREATE SCHEMA sqldb DEFAULT CHARACTER SET utf8;
CREATE SCHEMA sqldb2 DEFAULT CHARACTER SET utf8mb4;

-- 스키마 (데이터베이스 삭제)
DROP SCHEMA sqldb2;

USE sqldb;

-- 상품 테이블 생성
-- 제약 조건
	-- 기본키 : prdNo, NOT NULL
    -- prdName : NOT NULL
    
-- 기본키 제약 조건 설정 방법1    
CREATE TABLE product(
	prdNo CHAR(10) NOT NULL PRIMARY KEY,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30)
);

-- 기본키 제약 조건 설정 방법2
CREATE TABLE product2(
	prdNo CHAR(10) NOT NULL,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30),
    PRIMARY KEY(prdNo)
);

-- 기본키 제약 조건 설정 방법3
CREATE TABLE product3(
	prdNo CHAR(10) NOT NULL,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    prdCompany VARCHAR(30),
	CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo)
);

-- 복합기 : CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo, prdName)
-- 주의! 따로 설정 불가

-- 외래키 제약 조건 설정
/*
	출판사 (출판사번호, 출판사명, 전화, … )
	도서 (도서번호, 도서명, 가격, 발행일, 출판사번호(FK))
	1) 출판사 테이블 생성
		-- 제약 조건
			- 기본키 : PubNo, NOT NULL
			- pubName : NOT NULL
	2) 도서 테이블 생성
		-- 제약 조건
			- bookNo, NOT NULL
            - 외래키 : pubNo (참조테이블과 기본키 지정)
            - bookPrice : 기본값 10000, 1000보다 크게 설정
*/

CREATE TABLE publisher (
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

CREATE TABLE book (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

CREATE TABLE book2 (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- 테이블 상세 정보 확인 : DESCRIBE
DESCRIBE book;
DESCRIBE book2;

CREATE TABLE department (
	dpmCode CHAR(10) NOT NULL PRIMARY KEY,
    dpmName VARCHAR(30) NOT NULL,
    dpmPhone VARCHAR(15)
);

CREATE TABLE student (
	stdNo CHAR(10) NOT NULL PRIMARY KEY,
    stdName VARCHAR(30) NOT NULL,
    stdGrade INT DEFAULT 4 CHECK(stdGrade >= 1 AND stdGrade <= 4),
    stdAddress VARCHAR(50),
    stdBirth DATE,
    dpmCode CHAR(10) NOT NULL,
    CONSTRAINT FK_std_department FOREIGN KEY (dpmCode) REFERENCES department (dpmCode)
);

CREATE TABLE professor (
	pfNo CHAR(10) NOT NULL PRIMARY KEY,
    pfName VARCHAR(30) NOT NULL,
    pfPhone VARCHAR(15),
    dpmCode CHAR(10) NOT NULL,
    CONSTRAINT FK_pf_department FOREIGN KEY (dpmCode) REFERENCES department (dpmCode)
);

CREATE TABLE course (
	courseCode CHAR(10) NOT NULL PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    courseScore DOUBLE DEFAULT 4.5 CHECK(courseScore >= 0 AND courseScore <= 4.5),
    pfNo CHAR(10) NOT NULL,
    CONSTRAINT FK_course_pf FOREIGN KEY (pfNo) REFERENCES professor (pfNo)
);

CREATE TABLE scores (
	stdNo CHAR(10) NOT NULL,
    courseCode CHAR(10) NOT NULL,
    score INT CHECK(score >= 0 AND score <= 100),
    scoreGrade DOUBLE CHECK(scoreGrade >= 0 AND scoreGrade <= 4.5),
    CONSTRAINT PK_socres_stdNo_courseCode PRIMARY KEY(stdNo, courseCode),
    CONSTRAINT FK_scores_std FOREIGN KEY (stdNo) REFERENCES student (stdNo),
    CONSTRAINT FK_scores_course FOREIGN KEY (courseCode) REFERENCES course (courseCode)
);

-- 자동 증가
CREATE TABLE board (
	boardNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    boardTitle VARCHAR(30) NOT NULL,
    boardAuthor VARCHAR(20),
    boardContent VARCHAR(200) NOT NULL
);

CREATE TABLE board2 (
	boardNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    boardTitle VARCHAR(30) NOT NULL,
    boardAuthor VARCHAR(20),
    boardContent VARCHAR(200) NOT NULL
);


ALTER TABLE board2 AUTO_INCREMENT = 100;
SET @@auto_increment_increment = 3;

SET sql_safe_updates=0;	-- 안전 모드 임시 해제
SET @COUNT = 0;
UPDATE board2 SET boardNo = @COUNT:=@COUNT+1;

ALTER TABLE board2 AUTO_INCREMENT = 1;