# fit:nance DB(fitdb)

-- bank 테이블
CREATE TABLE bank (
	memBank VARCHAR(30) PRIMARY KEY,
	fin_co_no VARCHAR(30),
	kor_co_nm VARCHAR(30)
);
    
-- bank에 값 넣기
INSERT INTO bank 
	VALUES ("0","","선택해주세요!"),
		   ("1","0013175","농협"),
		   ("2","0011625","신한"),
		   ("3","0010026","IBK기업"),
		   ("4","0013909","하나"),
		   ("5","0010001","우리"),
		   ("6","0010927","국민"),
		   ("7","0010002","SC제일"),
		   ("8","0010016","대구"),
		   ("9","0010017","부산"),
		   ("10","0010019","광주"),
		   ("11","0010019","광주"),
		   ("12","0010024","경남"),
		   ("13","0010022","전북"),
		   ("14","0010020","제주"),
		   ("15","0010030","산업"),
		   ("16","0014807","수협"),
		   ("17","0010006","씨티"),
		   ("18","0015130","카카오뱅크"),
		   ("19","0014674","케이뱅크"),
		   ("20","0017801","토스뱅크");
           
-- 멤버
CREATE TABLE member (
	memRole VARCHAR(20),
    memId VARCHAR(30) PRIMARY KEY,
    memPwd VARCHAR(100),
    memName VARCHAR(100),
    memBirth VARCHAR(10),
    memGender VARCHAR(6),
    memBank VARCHAR(30),
    memEmailRecd VARCHAR(5),
    memImg VARCHAR(100),
    provider VARCHAR(10),
    providerId VARCHAR(100),
    certified VARCHAR(50) DEFAULT NULL,
	CONSTRAINT FK_bank_member FOREIGN KEY (memBank) REFERENCES bank (memBank)
);

-- 찜한 상품
CREATE TABLE favorite(
	favoriteIndex INT AUTO_INCREMENT PRIMARY KEY,
	kind INT,
	oIndex INT, 
	memId VARCHAR(30),
    CONSTRAINT FK_member_favorite FOREIGN KEY (memId) REFERENCES member (memId)
);
    
-- 고객센터
-- 자주 묻는 질문
CREATE TABLE FAQ (
	FAQIndex INT AUTO_INCREMENT PRIMARY KEY,
	FAQTitle VARCHAR(50),
	FAQContent VARCHAR(300),
	memId VARCHAR(30),
	CONSTRAINT FK_order_faq_member FOREIGN KEY (memId) REFERENCES member (memId)  on delete cascade
);

-- 공지사항
CREATE TABLE notice (
	noticeIndex INT AUTO_INCREMENT PRIMARY KEY,
	noticeTitle VARCHAR(50),
	noticeContent VARCHAR(10000),
	noticeDate DATE DEFAULT (CURRENT_DATE),
	memId VARCHAR(30),
	CONSTRAINT FK_order_notice_member FOREIGN KEY (memId) REFERENCES member (memId)  on delete cascade
);

-- QnA 질문
CREATE TABLE question(
	qIndex INT AUTO_INCREMENT PRIMARY KEY,
	qTitle VARCHAR(30),
	qContent VARCHAR(300),
	qDate DATE DEFAULT (CURRENT_DATE),
	memId VARCHAR(30),
	CONSTRAINT FK_order_question_member FOREIGN KEY (memId) REFERENCES member (memId)  on delete cascade
);

-- QnA 답변
CREATE TABLE answer(
	aIndex INT AUTO_INCREMENT PRIMARY KEY,
	qIndex INT,
	aTitle VARCHAR(30),
	aContent VARCHAR(300),
	aDate DATE DEFAULT (CURRENT_DATE),
	memId VARCHAR(30),
	CONSTRAINT FK_order_answer_member FOREIGN KEY (memId) REFERENCES member (memId)  on delete cascade,
	CONSTRAINT FK_order_answer_question FOREIGN KEY (qIndex) REFERENCES question (qIndex)  on delete cascade
);

-- 상품 리스트
-- 적금
CREATE TABLE installment_base(
	pIndex INT PRIMARY KEY,
	fin_co_no VARCHAR(30),
	kor_co_nm VARCHAR(30),
	fin_prdt_cd VARCHAR(30),
	fin_prdt_nm VARCHAR(50),
	join_way VARCHAR(100),
	mtrt_int VARCHAR(500),
	spcl_cnd VARCHAR(500),
	join_deny INT,
	join_member VARCHAR(500),
	etc_note VARCHAR(500),
	max_limit int
);

-- 적금 옵션
CREATE TABLE installment_option(
	kind INT DEFAULT 1,
	oIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    intr_rate_type VARCHAR(30),
    intr_rate_type_nm VARCHAR(30),
    rsrv_type VARCHAR(30),
    rsrv_type_nm VARCHAR(30),
    save_trm VARCHAR(30),
    intr_rate DOUBLE,
    intr_rate2 DOUBLE,
    pIndex INT,
    CONSTRAINT FK_installment_base_option FOREIGN KEY (pIndex) REFERENCES installment_base (pIndex)
);

-- 예금
CREATE TABLE deposit_base(
	pIndex INT PRIMARY KEY,
	fin_co_no VARCHAR(30),
	kor_co_nm VARCHAR(30),
	fin_prdt_cd VARCHAR(30),
	fin_prdt_nm VARCHAR(50),
	join_way VARCHAR(100),
	mtrt_int VARCHAR(500),
	spcl_cnd VARCHAR(500),
	join_deny INT,
	join_member VARCHAR(500),
	etc_note VARCHAR(500),
	max_limit VARCHAR(30)
);

-- 예금 옵션
CREATE TABLE deposit_option(
	kind INT DEFAULT 2,
	oIndex INT PRIMARY KEY,
	fin_co_no VARCHAR(30),
	fin_prdt_cd VARCHAR(30),
	intr_rate_type VARCHAR(30),
	intr_rate_type_nm VARCHAR(30),
	save_trm VARCHAR(30),
	intr_rate DOUBLE,
	intr_rate2 DOUBLE,
    pIndex INT,
	CONSTRAINT FK_deposit_base_option FOREIGN KEY (pIndex) REFERENCES deposit_base (pIndex)
);

-- 연금
CREATE TABLE pension_base(
	pIndex INT PRIMARY KEY,
	fin_co_no VARCHAR(30),
	kor_co_nm VARCHAR(30),
	fin_prdt_cd VARCHAR(30),
	fin_prdt_nm VARCHAR(50),
	join_way VARCHAR(100),
	pnsn_kind VARCHAR(30),
	pnsn_kind_nm VARCHAR(30),
	sale_strt_day VARCHAR(30),
	mntn_cnt DOUBLE,
	prdt_type VARCHAR(30),
	prdt_type_nm VARCHAR(30),
	avg_prft_rate DOUBLE,
	dcls_rate VARCHAR(30),
	guar_rate VARCHAR(30),
	btrm_prft_rate_1 DOUBLE,
	btrm_prft_rate_2 DOUBLE,
	btrm_prft_rate_3 DOUBLE,
	etc VARCHAR(500),
	sale_co VARCHAR(500)
);

-- 연금 옵션
CREATE TABLE pension_option(
	kind INT DEFAULT 3,
	oIndex INT PRIMARY KEY,
	fin_co_no VARCHAR(30),
	fin_prdt_cd VARCHAR(30),
	pnsn_recp_trm VARCHAR(30),
	pnsn_recp_trm_nm VARCHAR(30),
	pnsn_entr_age VARCHAR(30),
	pnsn_entr_age_nm VARCHAR(30),
	mon_paym_atm VARCHAR(30),
	mon_paym_atm_nm	VARCHAR(30),
	paym_prd VARCHAR(30),
	paym_prd_nm VARCHAR(30),
	pnsn_strt_age VARCHAR(30),
	pnsn_strt_age_nm VARCHAR(30),
	pnsn_recp_amt DOUBLE,
	pIndex INT,
	CONSTRAINT FK_pension_base_option FOREIGN KEY (pIndex) REFERENCES pension_base (pIndex)
);

-- 대출
-- 주택담보대출 목록
CREATE TABLE home_loan_base(
    pIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    kor_co_nm VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    fin_prdt_nm VARCHAR(30),
    join_way VARCHAR(100),
    loan_inci_expn VARCHAR(500),
    erly_rpay_fee VARCHAR(500),
    dly_rate VARCHAR(200),
    loan_lmt VARCHAR(500)
);

-- 주택담보대출 옵션
CREATE TABLE home_loan_option(
	kind INT DEFAULT 4,
    oIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    mrtg_type VARCHAR(30),
    mrtg_type_nm VARCHAR(30),
    rpay_type VARCHAR(30),
    rpay_type_nm VARCHAR(30),
    lend_rate_type VARCHAR(30),
    lend_rate_type_nm VARCHAR(30),
    lend_rate_min DOUBLE,
    lend_rate_max DOUBLE,
    lend_rate_avg DOUBLE,
    pIndex INT,
    CONSTRAINT FK_home_loan_base_option FOREIGN KEY (pIndex) REFERENCES home_loan_base (pIndex)
);

-- 전세자금대출 목록
CREATE TABLE charter_loan_base(
    pIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    kor_co_nm VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    fin_prdt_nm VARCHAR(30),
    join_way VARCHAR(30),
    loan_inci_expn VARCHAR(500),
    erly_rpay_fee VARCHAR(500),
    dly_rate VARCHAR(200),
    loan_lmt VARCHAR(100)
);

-- 전세자금대출 옵션
CREATE TABLE charter_loan_option(
	kind INT DEFAULT 5,
    oIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    rpay_type VARCHAR(30),
    rpay_type_nm VARCHAR(30),
    lend_rate_type VARCHAR(30),
    lend_rate_type_nm VARCHAR(30),
    lend_rate_min DOUBLE,
    lend_rate_max DOUBLE,
    lend_rate_avg DOUBLE,
    pIndex INT,
    CONSTRAINT FK_charter_loan_base_option FOREIGN KEY (pIndex) REFERENCES charter_loan_base (pIndex)
);

-- 개인신용대출 목록
CREATE TABLE personal_loan_base(
    pIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    kor_co_nm VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    fin_prdt_nm VARCHAR(30),
    join_way VARCHAR(30),
    crdt_prdt_type VARCHAR(500),
    crdt_prdt_type_nm VARCHAR(500),
    cb_name VARCHAR(50)
);

-- 개인신용대출 옵션
CREATE TABLE personal_loan_option(
	kind INT DEFAULT 6,
    oIndex INT PRIMARY KEY,
    fin_co_no VARCHAR(30),
    fin_prdt_cd VARCHAR(30),
    crdt_prdt_type VARCHAR(30),
    crdt_lend_rate_type VARCHAR(30),
    crdt_lend_rate_type_nm VARCHAR(30),
	crdt_grad_1 DOUBLE,
    crdt_grad_4 DOUBLE,
    crdt_grad_5 DOUBLE,
    crdt_grad_6 DOUBLE,
    crdt_grad_10 DOUBLE,
    crdt_grad_11 DOUBLE,
    crdt_grad_12 DOUBLE,
    crdt_grad_13 DOUBLE,
    crdt_grad_avg DOUBLE,
    pIndex INT,
    CONSTRAINT FK_personal_base_option FOREIGN KEY (pIndex) REFERENCES personal_loan_base (pIndex)
);

-- installment_option 테이블에 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE installment_option O, installment_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no;

-- deposit_option 테이블에 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE deposit_option O, deposit_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no;

-- pension_option 테이블에 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE pension_option O, pension_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no;

-- home_loan_option 테이블에 oIndex와 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE home_loan_option O, home_loan_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no;

-- charter_loan_option 테이블에 oIndex와 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE charter_loan_option O, charter_loan_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no;

-- personal_loan_option 테이블에 oIndex와 fin_co_no, fin_prdt_cd이 같은 pIndex값 넣기
UPDATE personal_loan_option O, personal_loan_base B
SET O.pIndex = B.pIndex
WHERE B.fin_prdt_cd = O.fin_prdt_cd AND B.fin_co_no = O.fin_co_no AND B.crdt_prdt_type = O.crdt_prdt_type;