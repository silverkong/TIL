
-- 멤버 테이블
CREATE TABLE member (
	memId varchar(30) NOT NULL PRIMARY KEY,
	memPwd varchar(30),
	memName varchar(30),
	memPhone varchar(30),
	memEmail varchar(45)
);

-- 최근 검색 기록 테이블
CREATE TABLE history (
	historyNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	historyDep VARCHAR(10),
    historyArr VARCHAR(10),
    historyDateRange VARCHAR(30),
    historyShuttle VARCHAR(10),
    historyCount VARCHAR(5),
    historyType VARCHAR(10),
    memId VARCHAR(10) NOT NULL,
    CONSTRAINT FK_history_member FOREIGN KEY (memId) REFERENCES member (memId)
);

-- 호텔 룸타입 트윈 테이블
CREATE TABLE room1(
	roomT VARCHAR(10) NOT NULL PRIMARY KEY,
    roomTType VARCHAR(20),
    roomTPrice INT,
    roomTView VARCHAR(10),
    hotelNo VARCHAR(10),
    hotelTImg VARCHAR(10)
);

-- 호텔 룸타입 더블 테이블
CREATE TABLE room2(
	roomD VARCHAR(10) NOT NULL PRIMARY KEY,
    roomDType VARCHAR(20),
    roomDPrice INT,
    roomDView VARCHAR(20),
    hotelNo VARCHAR(10),
    hotelDImg VARCHAR(10)
);

-- 호텔 테이블
CREATE TABLE hotel(
	hotelNo VARCHAR(10) NOT NULL PRIMARY KEY,
    hotelName VARCHAR(20),
    hotelGrade VARCHAR(10),
    hotelAddress VARCHAR(30),
    hotelAssesment VARCHAR(30),
    hotelLocation VARCHAR(40),
    hotelContact VARCHAR(20),
    hotelRule VARCHAR(500),
    hotelTime VARCHAR(20),
    roomT VARCHAR(10),
    roomD VARCHAR(10),
    CONSTRAINT FK_hotel_roomT FOREIGN KEY (roomT) REFERENCES room1 (roomT),
    CONSTRAINT FK_hotel_roomD FOREIGN KEY (roomD) REFERENCES room2 (roomD)
); 

-- 렌트카 테이블
CREATE TABLE rent (
	rentNo VARCHAR(4) NOT NULL PRIMARY KEY,
	rentName VARCHAR(30),
	rentBusStop VARCHAR(50),
	rentItvTime VARCHAR(50),
	rentOpTime VARCHAR(15),
	rentTakenTime VARCHAR(20),
	rentPhoneNum VARCHAR(13),
	rentAddress VARCHAR(50),
	rentExpl VARCHAR(2000)
);

-- 차량 테이블
CREATE TABLE car (
	carNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	carName VARCHAR(50),
	carType VARCHAR(10),
	carPrice INT,
	carCount INT,
	carYear VARCHAR(10),
	carFuel VARCHAR(10),
	carSeater INT,
	carGear VARCHAR(10),
	carNav VARCHAR(5),
	carBluetooth VARCHAR(5),
	carBlackbox VARCHAR(5),
	carStroller VARCHAR(5),
	carBabySeat VARCHAR(5),
	carImgNo VARCHAR(4),
	rentNo VARCHAR(4),
	CONSTRAINT FK_car_rent FOREIGN KEY (rentNo) REFERENCES rent (rentNo)
);

-- 항공 예약 후 테이블
CREATE TABLE booked_flight (
	booked_flight_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	dep_airline VARCHAR(20),
	dep_flight_no VARCHAR(20),
	dep_start_time VARCHAR(20),
	dep_end_time VARCHAR(20),
	dep_start_city VARCHAR(20),
	dep_end_city VARCHAR(20),
	dep_during_time VARCHAR(20),
	arr_airline VARCHAR(20),
	arr_flight_no VARCHAR(20),
	arr_start_time VARCHAR(20),
	arr_end_time VARCHAR(20),
	arr_start_city VARCHAR(20),
	arr_end_city VARCHAR(20),
	arr_during_time VARCHAR(20),
	dateRange VARCHAR(30),
	personCount VARCHAR(20),
	charge_flight VARCHAR(20),
	charge_fuel VARCHAR(20),
	charge_tax VARCHAR(20),
	charge_ticket VARCHAR(20),
	charge_total VARCHAR(20),
	memId  VARCHAR(20),
	FOREIGN KEY (memId) REFERENCES member(memId)
);

-- 숙박 예약 후 테이블
CREATE TABLE booked_stay(
	booked_stay_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	memId VARCHAR(20),
	hotelNo VARCHAR(10),
	hotelName VARCHAR(20),
	roomType VARCHAR(10),
	roomView VARCHAR(10),
	roomPrice VARCHAR(20),
	daterange2 VARCHAR(100),
	CONSTRAINT FK_book_stay_member FOREIGN KEY (memId) REFERENCES member (memId)
);

-- 렌트 예약 후 테이블
CREATE TABLE booked_rent(
	booked_rent_no INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    carNo INT,
    memId VARCHAR(10),
    bookDateRange VARCHAR(100),
    CONSTRAINT FK_br_car FOREIGN KEY (carNo) REFERENCES car (carNo),
    CONSTRAINT FK_br_member FOREIGN KEY (memId) REFERENCES member (memId)
);