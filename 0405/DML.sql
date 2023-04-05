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
SELECT DISTINCT first_name, country
FROM users
ORDER BY country ASC;

-- 나이가 30살 이상인 이름, 나이, 잔고 조회하기
SELECT first_name, age, balance
FROM users
WHERE age >= 30;

-- 나이가 30살 이상이고 계좌 잔고가 50만원 초과인 사람들의 이름, 나이, 잔고 조회하기
SELECT first_name, age, balance FROM users 
WHERE age >= 30 AND balance > 500000;

-- 이름에 호가 포함되는 사람들의 이름과 성 조회하기
SELECT first_name, last_name FROM users
WHERE first_name LIKE '%호%' OR last_name LIKE '%호%'; 

-- 이름이 '준'으로 끝나는 사람들의 이름 조회하기
SELECT first_name FROM users
WHERE first_name LIKE '%준';

-- 서울 지역 전화번호를 가진 사람들의 이름과 전화번호 조회하기
SELECT first_name, phone FROM users
WHERE phone LIKE '02%';

-- 나이가 20대인 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users
WHERE age LIKE '2_';

-- 전화번호 중간 4자리가 51로 시작하는 사람들의 이름과 전화번호 조회하기
SELECT first_name, phone FROM users
WHERE phone LIKE '%-51__-%';

-- 경기도 혹은 강원도에 사는 사람들의 이름과 지역 조회하기
SELECT first_name, country FROM users
WHERE country IN ('경기도', '강원도');

-- 경기도 혹은 강원도에 살지 않는 사람들의 이름과 지역 조회하기
SELECT first_name, country FROM users
WHERE country NOT IN ('경기도', '강원도');

-- 나이가 20살이상, 30살 이하인 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users
WHERE age BETWEEN 20 AND 30;

-- 나이가 20살이상, 30살 이하가 아닌 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users
WHERE age NOT BETWEEN 20 AND 30;

-- 첫 번째부터 열 번째 데이터까지 rowid 와 이름 조회하기
SELECT rowid, first_name FROM users LIMIT 10;

-- 계좌 잔고가 가장 많은 10명의 이름과 계좌 잔고 조회하기
SELECT first_name, balance FROM users
ORDER BY balance DESC LIMIT 10;

-- 나이가 가장 어린 5명의 이름과 나이 조회하기
SELECT first_name, age FROM users
ORDER BY age ASC LIMIT 5;

-- offset 과 함께 사용하면 특정 지정된 위치에서부터 데이터를 조회할 수 있음.
SELECT first_name, age, balance
FROM users
ORDER BY age
LIMIT 10 OFFSET 10;