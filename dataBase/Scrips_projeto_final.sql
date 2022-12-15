CREATE DATABASE db_zero_to_hero;

USE db_zero_to_hero;

CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
dt_nas DATE,
sexo ENUM ('M','F'),
PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE posts (
userId INT NOT NULL,
id INT NOT NULL AUTO_INCREMENT,
post TEXT,
PRIMARY KEY (id),
CONSTRAINT fk_usersPosts FOREIGN KEY (userId) REFERENCES users (id)
);

CREATE TABLE comments (
id INT NOT NULL AUTO_INCREMENT,
userId INT NOT NULL,
postID INT NOT NULL,
comments TEXT,
PRIMARY KEY (id),
CONSTRAINT fk_usercomments FOREIGN KEY (userId) REFERENCES users (id),
CONSTRAINT fk_postcomments FOREIGN KEY (postId) REFERENCES posts (id)
);

DESCRIBE comments;

INSERT INTO users VALUES 
(DEFAULT, 'Fred', '1990-10-02', 'M'),
(DEFAULT, 'João', '1988-08-04', 'M'),
(DEFAULT, 'Maria', '2000-09-20', 'F'),
(DEFAULT, 'Zezinho', '2013-11-11', 'M');

SELECT * FROM users;

INSERT INTO posts VALUES
('1',DEFAULT, 'Obaaa meu primeiro post');

SELECT * FROM posts;

INSERT INTO comments VALUES
(DEFAULT, '2', '1','Que legal!! meus parabéns!!');

SELECT * FROM comments;




