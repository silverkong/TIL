CREATE TABLE member(
	memId VARCHAR(10) NOT NULL PRIMARY KEY,
    memPwd VARCHAR(10),
    memName VARCHAR(30),
    memEmail VARCHAR(30),
    memJoinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    memHP VARCHAR(13),
    memZipcode VARCHAR(5),
    memAddress1 VARCHAR(30),
    memAddress2 VARCHAR(30)
);

INSERT INTO member
VALUES ('hong', '1234', '홍길동', 'hkd@abc.com', DEFAULT, '010-1234-1234', '12345', '서울 강남구', '1번지'),
	   ('lee', '1234', '이몽룡', 'lmr@abc.com', DEFAULT, '010-1111-1234', '23456', '서울 안양시', '2번지'),
       ('sung', '1234', '성춘향', 'sch@abc.com', DEFAULT, '010-2222-1234', '34567', '제주 제주시', '3번지');
       
SELECT * FROM member;