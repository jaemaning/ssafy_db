CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    userid INTEGER,
    CONSTRAINT userid_fk FOREIGN KEY(userid) REFERENCES users(id)
);


CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    roleid INTEGER NOT NULL
);

INSERT INTO users(name, roleid)
VALUES
('aiden', 1),
('ken', 3),
('lynda', 3),
('sophia', 2),
('beemo', 1),
('feel', 3),
('coo', 2);

DELETE FROM users;

INSERT INTO articles(title, content, userid)
VALUES
('제목1', '내용1', 1),
('제목2', '내용2', 2),
('제목3', '내용3', 3),
('제목5', '내용5', 5),
('제목9', '내용9', 9),
('제목10', '내용10', 10);

-- CROSS JOIN
SELECT articles.*, users.*
FROM articles, users;

-- 두 테이블간에 공유하는 커럼(외래 키) INNER JOIN
SELECT articles.*, users.*
FROM articles, users
WHERE articles.userid = users.id;

DROP TABLE users;

/* 두 테이블간에 조호를 하는데 왼쪽 테이블의 데이터는 오른쪽과 매칭되는게 없어도
조회 할 수 있도록 LEFT JOIN */
SELECT articles.*, users.*
FROM articles LEFT JOIN users
ON articles.userid = users.id;

SELECT articles.*, users.*
FROM articles RIGHT JOIN users
ON articles.userid = users.id;
