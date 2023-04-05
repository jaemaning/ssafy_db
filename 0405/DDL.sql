-- 테이블 생성 (DDL)
CREATE TABLE contacts (
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    -- 값이 있어야하고, 중복 허용 안함.
    email TEXT NOT NULL UNIQUE
);

-- 테이블 이름 변경 (DDL)
ALTER TABLE contacts RENAME TO new_contacts;

ALTER TABLE new_contacts RENAME TO contacts;

-- contacts 테이블의 name column 이름 변경
ALTER TABLE contacts RENAME COLUMN name TO last_name;

-- contacts 테이블에 새로운 column 추가
ALTER TABLE contacts ADD COLUMN address TEXT NOT NULL DEFAULT 'no address';

-- contacts 테이블 속성 삭제
ALTER TABLE contacts DROP COLUMN address;

-- contacts 테이블 삭제
DROP TABLE contacts;