-- DML 문
CREATE TABLE users (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);

-- users 테이블의 모든 값 조회
SELECT * FROM users;

-- users 테이블의 이름과 나이 값만 조회
SELECT first_name, age FROM users;

-- users 테이블의 rowid 와 이름 값만 조회
SELECT rowid, first_name FROM users;

-- users 테이블의 이름 나이 잔고를 잔고 내림차순, 나이 오름차순으로 정렬하여 조회
SELECT first_name, age, balance FROM users ORDER BY balance DESC, age ASC;

-- users 테이블의 모든 지역 중복없이 조회하기
SELECT DISTINCT country FROM users;

-- users 테이블의 모든 지역을 오름차순으로 정렬하여 중복없이 조회하기
SELECT DISTINCT country FROM users ORDER BY country ASC;

-- 이름과 지역이 중복 없이 모든 이름과 지역 조회하기
SELECT DISTINCT first_name, country FROM users;

-- 이름과 지역 중복 없이 지역 순으로 오름차순 정렬하여 모든 이름과 지역 조회하기
SELECT DISTINCT first_name, country FROM users ORDER BY country ASC;