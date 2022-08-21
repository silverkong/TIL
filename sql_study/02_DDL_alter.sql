-- ALTER 테이블 수정

-- ALTER TABLE ADD : 열 추가
-- ALTER TABLE 테이블명 ADD 열이름 타입(크기);
-- student 테이블에 stdTel 열 추가
ALTER TABLE student ADD stdTel VARCHAR(13);

DESCRIBE student;

-- 여러 개의 열 추가 : stdAge, stdAddress2 열 추가
ALTER TABLE student ADD(stdAge VARCHAR(2), stdAddress2 VARCHAR(50));

-- 열의 데이터 형식 변경 : stdAge 열의 데이터 타입을 INT로 변경
ALTER TABLE student MODIFY stdAge INT;

-- 열의 제약 조건 변경 : stdName을 NULL 허용으로 변경
ALTER TABLE student MODIFY stdName VARCHAR(20) NULL;

-- 열의 이름 변경 : stdTel에서 stdPhone으로 변경
-- 주의! 데이터 타입 적으면 오류
ALTER TABLE student RENAME COLUMN stdTel TO stdPhone;

-- 열 이름과 데이터 타입 같이 변경
ALTER TABLE student CHANGE stdAddress stdAddress1 VARCHAR(40);

-- 열 하나 삭제
ALTER TABLE student DROP COLUMN stdPhone;

-- 여러 열 삭제
ALTER TABLE student DROP stdAge,
					DROP stdAddress2;
                    
                    
-- ALTER 연습문제
ALTER TABLE product ADD (prdStock INT, prdDate DATE);
ALTER TABLE product MODIFY prdCompany VARCHAR(20) NOT NULL;
ALTER TABLE publisher ADD (pubPhone VARCHAR(13), pubAddress VARCHAR(50));
ALTER TABLE publisher DROP COLUMN pubPhone;



/*
	제약조건 삭제
    - 기본키 / 외래키 제약조건 삭제
	- 기본키 / 외래키 제약조건 추가
    - ON DELETE CASCADE
    - CHECK 제약조건 추가 / 삭제
    - DEFAULT 제약조건 추가 / 삭제    
*/

-- 기본키 / 외래키 삭제

-- 기본키 삭제
-- 1) department 테이블의 기본키 삭제 : student 테이블에서 외래키 제약조건이 설정되어 있으므로 기본키 삭제 시 오류
-- 2) 외래키 제약조건 삭제하고 기본키 삭제
-- department의 dpmCode를 외래키로 사용하고 있는 테이블 : student와 professor

-- department 테이블의 기본키 삭제
ALTER TABLE department DROP PRIMARY KEY;
-- 외래키 제약조건 위배되어 기본키 삭제 안됨


-- student 테이블 외래키 제약조건 삭제
ALTER TABLE student DROP CONSTRAINT FK_std_department;

-- professor 테이블 외래키 제약조건 삭제
ALTER TABLE professor DROP CONSTRAINT FK_pf_department;

-- department 테이블의 기본키 삭제
ALTER TABLE department DROP PRIMARY KEY;

DESCRIBE department;

-- department 테이블 기본키 제약조건 추가
ALTER TABLE department
	ADD CONSTRAINT PK_department_dpmCode
    PRIMARY KEY (dpmCode);
    
-- department 테이블 기본키 제약조건 추가2
ALTER TABLE department
	ADD
    PRIMARY KEY (dpmCode);

-- 테이블에 설정된 제약 조건 확인
SELECT * FROM information_schema.table_constraints WHERE table_schema="sqldb";

SELECT * FROM information_schema.table_constraints WHERE table_schema="sqldb" AND table_name="department";


-- 외래키 제약조건 추가 : student
ALTER TABLE student
	ADD CONSTRAINT FK_std_department
    FOREIGN KEY (dpmCode) REFERENCES department (dpmCode);

SELECT * FROM information_schema.table_constraints WHERE table_schema="sqldb" AND table_name="student";

-- 외래키 제약조건 추가 : professor
ALTER TABLE professor
	ADD CONSTRAINT FK_pf_deparment
    FOREIGN KEY (dpmCode) REFERENCES department (dpmCode);


-- book3 테이블 생성 : 이름 없이 외래키 설정 > 자동으로 외래키 이름 붙임
-- 따라서 외래키 제약조건 삭제 시 자동으로 붙은 이름으로 삭제하면 됨
CREATE TABLE book3 (
	bookNo CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
);

-- ON DELETE CASCADE
-- ON DELETE CASCADE 제약조건으로 외래키 제약조건을 설정해야 하므로 기존 외래키 제약조건 먼저 삭제 후 다시 설정
ALTER TABLE student DROP CONSTRAINT FK_std_department;

ALTER TABLE student
	ADD CONSTRAINT FK_std_department
    FOREIGN KEY (dpmCode) REFERENCES department (dpmCode)
    ON DELETE CASCADE;
    
    
SELECT * FROM information_schema.table_constraints WHERE table_schema="sqldb" AND table_name="book";

-- CHECK 제약조건 삭제
-- 현재 book 테이블의 CHECK 제약조건 (bookPrice > 1000)
ALTER TABLE book DROP CONSTRAINT book_chk_1;

-- CHECK 제약조건 추가
-- 주의! 기존 데이터가 새로 추가하는 제약조건에 위배되는지 확인 > 위배될 경우 제약 조건 추가 안 됨
-- EX) 10,000이 입력되어 있는 경우 제약조건을 100,000 이상으로 입력되게 설정하면 10,000이 제약조건에 위배되어 오류 발생
ALTER TABLE book ADD CHECK (bookPrice > 1000);

-- 디폴트 값 수정
ALTER TABLE book MODIFY bookPrice INT DEFAULT 5000;

-- 디폴트 값 삭제
ALTER TABLE book ALTER bookPrice DROP DEFAULT;
-- or
ALTER TABLE book ALTER COLUMN bookPrice DROP DEFAULT;

DESCRIBE book;


-- 데이터 입력해서 확인 : bookPrice 값 안넣으면 오류
-- DEFAULT 삭제 후 NULL 설정 안하면 입력 시 디폴트 값 입력하라고 오류
ALTER TABLE book MODIFY bookPrice INT NULL;

-- DEFAULT 설정
ALTER TABLE book ALTER bookPrice SET DEFAULT 3000;

