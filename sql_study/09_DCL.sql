USE mysql;

-- 사용자 계정 조회
SELECT * FROM user;

-- 사용자 계정 생성
-- CREATE USER 계정@호스트 identified by 비밀번호;
-- 호스트 : 	localhost - 로컬에서 접근 가능
-- 			192.168.172.1 - 특정 IP에서 접근 가능
-- 			'%' : 어디에서나 접근 가능

-- 계정 생성 : CREATE USER 계정@호스트 identified by 비밀번호;
CREATE USER newuser1@'%' identified by '1111';
-- newuser1으로 connection 생성해서 서버에 연결되는지 확인
-- 스키마 접근 불가

-- 비밀번호 변경 : SET PASSWORD for '계정'@호스트 = '새 비밀번호';
SET PASSWORD for 'newuser1'@'%' = '1234';

-- 계정 삭제 : DROP USER '계정'@호스트;
DROP USER 'newuser1'@'%';



-- 권한 조회
SHOW GRANTS FOR newuser1;

-- 권한 부여 : GRANT 권한 ON 데이터베이스.테이블 TO 계정@호스트;
-- 모든 권한 부여 : GRANT ALL PRIVILEGES ON *.* TO 계정@호스트;
-- 특정 DB의 모든 테이블에 특정 권한 부여 : GRANT [SELECT / INSERT / UPDATE / DELETE] ON 특정DB.* TO 계정@호스트;

-- 모든 권한 부여 : newuser1
GRANT ALL PRIVILEGES ON *.* TO newuser1@'%';

-- 권한 삭제 : REVOKE 권한 ON 데이터베이스.테이블 FROM 계정@호스트;
-- 모든 권한 삭제 : REVOKE ALL PRIVILEGES ON *.* FROM 계정@호스트;
-- 특정 DB의 모든 테이블에 특정 권한 삭제 : REVOKE [SELECT / INSERT / UPDATE / DELETE] 특정DB.* FROM 계정@호스트;
-- 특정 DB의 모든 테이블에 모든 권한 삭제 : REVOKE ALL PRIVILEGES ON 특정DB.* 계정@호스트;

-- SELECT 권한 삭제
REVOKE SELECT ON *.* FROM newuser1@'%';


-- 백업 및 복구 (EXPORT / IMPORT)
-- DB를 주기적으로 백업해두거나 다른 서버로 이관할 때 사용

