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


CREATE TABLE member (
		memId VARCHAR(10) NOT NULL PRIMARY KEY,
		memPwd VARCHAR(10),
        memName VARCHAR(30),
        memEmail VARCHAR(30),
        memJoinDate TIMESTAMP DEFAULT NOW(),
        memHP VARCHAR(13),
        memZipcode VARCHAR(5),
        memAddress1 VARCHAR(50),
        memAddress2 VARCHAR(50)
);

INSERT INTO member 
VALUES('hong', '1234', '홍길동', 'hkd@naver.com', default, '010-1234-1234', '12345', '서울 종로구', '1번지'),
	  ('lee', '1234', '이몽룡', 'lee@naver.com', default, '010-1111-1111', '5678', '경기 안양시', '100번지'),
          ('sch', '1234', '성춘향', 'sch@naver.com', default, '010-2222-2222', '12345', '서울 영등포구', '10번지');

INSERT INTO member(memId, memPwd, memName, memEmail)  
VALUES('kim', '1234', '김길동', 'hkd@naver.com');


CREATE TABLE category (
		ctgId VARCHAR(2) NOT NULL PRIMARY KEY,
		ctgName VARCHAR(30)
);

INSERT INTO category VALUES('1', '노트북');
INSERT INTO category VALUES('2', '프린터');
INSERT INTO category VALUES('3', '마우스');
INSERT INTO category VALUES('4', '키보드');

CREATE TABLE product (
		prdNo VARCHAR(10) NOT NULL PRIMARY KEY,
		prdName VARCHAR(100),
        prdPrice INT,
        prdCompany VARCHAR(50),
        prdStock INT,
        prdDescript VARCHAR(500),
        prdImg VARCHAR(50),
        ctgId VARCHAR(2) NOT NULL,
        CONSTRAINT FK_product_category FOREIGN KEY (ctgId) REFERENCES category (ctgId)
);

INSERT INTO product VALUES('1001', 'LG울트라기어', 1599000, 'LG전자', 10, '대화면으로 즐기는 강력한 퍼포먼스. 듀얼 스토리지로 확장 자유롭게!', '1001.jpg', '1');
INSERT INTO product VALUES('1002', 'LG그램', 1929000, 'LG전자', 5, 'LG그램 17인치 2019고사양 i7 풀옵션 노트북', '1002.jpg', '1');
INSERT INTO product VALUES('1003', '삼성노트북9', 1139000, '삼성전자', 7, '삼성노트북9 NT930XBV-A58A + Win10 정품설치_ICT', '1003.jpg', '1');
INSERT INTO product VALUES('1004', '삼성노트북5', 939020, '삼성전자', 3, '삼성노트북5 METAL NT560XBE-K54A 위스키레이크 NS', '1004.jpg', '1');
INSERT INTO product VALUES('1005', '맥북프로', 2496600, '애플', 5, '맥북프로 13형 512GB Silver MV9A2KH/A 터치바', '1005.jpg', '1'); 
INSERT INTO product VALUES('1006', '애플노트북', 1809000, '애플', 2, '애플노트북 맥북프로 13형I5/8G/512G 실버 MPXY2KH/A', '1006.jpg', '1'); 
INSERT INTO product VALUES('1007', '삼성 SL-J1660', 71900, '삼성전자', 12, '삼성 SL-J1660 잉크젯복합기 + 무한잉크공급기', '1007.jpg', '2'); 
INSERT INTO product VALUES('1008', '제록스 P265DW', 149000, '제록스', 7, '제록스 P265DW 와이파이 레이저 프린터 가정용 프린트', '1008.jpg', '2'); 
INSERT INTO product VALUES('1009', '엡손 L6160', 299000  , '엡손', 4, '엡손 L6160 무한잉크복합기 인쇄+복사+스캔+네트워크', '1009.jpg', '2');   
INSERT INTO product VALUES('1010', 'HP M254dw', 99500  , 'HP', 5, 'HP M254dw 컬러프린터 자동양면인쇄 기본 토너포함/KH', '1010.jpg', '2');   
INSERT INTO product VALUES('1011', 'M331 무소음 무선마우스', 24900, '로지텍코리아', 5, '무소음, 긴 배터리 수명, 플러그 앤 플레이 연결 방식, 자유로운 무선 연결', '1011.jpg', '3');  
INSERT INTO product VALUES('1012', 'MS 모던 모바일 마우스', 39900, '마이크로소프트', 20, '마이크로소프트 정품 인증. 가볍고 휴대가 편한 모던한 디자인의 모바일 마우스. 어느 표면에서도 작동하는 블루트랙 기술 적용', '1012.jpg', '3');  
INSERT INTO product VALUES('1013', '맥스틸 TRON G10 PRO', 22900, '맥스틸', 10, '맥스틸 TRON G10 PRO Reborn 화이트 게이밍마우스', '1013.jpg', '3');  
INSERT INTO product VALUES('1014', '아이리버 EQwear-V10', 10890, '아이리버', 10, '아이리버 EQwear-V10 무소음 무선 마우스', '1014.jpg', '3');   
INSERT INTO product VALUES('1015', '아이리버 IR-WMK5000', 26900, '아이리버', 15, '아이리버 IR-WMK5000 무선키보드 마우스 set 키스킨증정', '1015.jpg', '4');     
INSERT INTO product VALUES('1016', '컴썸 VENOM-9', 49000, '컴썸', 7, '컴썸 VENOM-9 레인보우LED 게이밍 기계식 키보드 청축', '1016.jpg', '4');   
INSERT INTO product VALUES('1017', '무선키보드 MX KEYS', 139000, '로지텍코리아', 7, '로지텍코리아 정품 무선키보드 MX KEYS', '1017.jpg', '4');   
INSERT INTO product VALUES('1018', 'SKP-900B 유선키보드 마우스 세트', 19200, '삼성전자', 3, '삼성전자 正品 신제품 SKP-900B 유선키보드 마우스 세트', '1018.jpg', '4');   

  
CREATE TABLE cart (
		cartNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
		memId VARCHAR(10) NOT NULL,
        prdNo VARCHAR(10) NOT NULL,        
        cartQty INT,
        CONSTRAINT FK_cart_member FOREIGN KEY (memId) REFERENCES member (memId),
        CONSTRAINT FK_cart_product FOREIGN KEY (prdNo) REFERENCES product (prdNo)
);


-- 주문 테이블 : 주문 정보 테이블 
CREATE TABLE order_info (
		ordNo VARCHAR(20)  NOT NULL PRIMARY KEY,
        ordDate TIMESTAMP DEFAULT NOW(),
		memId VARCHAR(10) NOT NULL,
        ordReceiver VARCHAR(30),
        ordZipcode VARCHAR(5),
        ordAddress1 VARCHAR(50),
        ordAddress2 VARCHAR(50),
        ordRcvPhone VARCHAR(13),
        ordRcvMsg VARCHAR(30),
        ordPay VARCHAR(30),
        CONSTRAINT FK_order_member FOREIGN KEY (memId) REFERENCES member (memId)
);

-- 주문 상품 및 수량 테이블
CREATE TABLE order_product (
		ordNo VARCHAR(20)  NOT NULL,
        prdNo VARCHAR(10) NOT NULL,
        ordQty INT,
        CONSTRAINT PK_ordNo_prdNo PRIMARY KEY (ordNo, prdNo),
        CONSTRAINT FK_order_product FOREIGN KEY (prdNo) REFERENCES product (prdNo),
        CONSTRAINT FK_order_prd_info FOREIGN KEY (ordNo) REFERENCES order_info (ordNo)
);