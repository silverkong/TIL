-- shopdb라는 schema 생성 (데이터베이스 생성)
CREATE SCHEMA shopdb DEFAULT CHARACTER SET utf8mb4;

-- shopdb 사용
USE shopdb;

-- 회원 테이블 생성하기 (member)
CREATE TABLE member(
	memId VARCHAR(20) NOT NULL PRIMARY KEY,
    memPwd VARCHAR(40) NOT NULL,
    memName VARCHAR(20) NOT NULL,
    memEmail VARCHAR(40) NOT NULL,
    memZipCode CHAR(5),
    memAddress VARCHAR(50),
    memPhone VARCHAR(13) NOT NULL,
    memDelete CHAR(1) DEFAULT 'N' NOT NULL,
    memSince DATE NOT NULL
);