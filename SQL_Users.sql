CREATE DATABASE usersprojects
GO
USE usersprojects

CREATE TABLE users(
id          INT          NOT NULL   IDENTITY,
name        VARCHAR(45)  NOT NULL   UNIQUE,
username    VARCHAR(45)  NOT NULL,
password    VARCHAR(45)  NOT NULL   DEFAULT('123mudar'),
email       VARCHAR(45)  NOT NULL
PRIMARY KEY(id)
)

CREATE TABLE projects(
id          INT          NOT NULL   IDENTITY(10001, 1),
name        VARCHAR(45)  NOT NULL,
description VARCHAR(45)  NULL,
date        DATE         NOT NULL   CHECK(date > '2014-09-01')
PRIMARY KEY(id)
)

CREATE TABLE users_has_projects(
users_id    INT          NOT NULL,
projects_id INT          NOT NULL
FOREIGN KEY(users_id) REFERENCES users(id)
FOREIGN KEY(projects_id) REFERENCES projects(id)
)

ALTER TABLE users
ALTER COLUMN username VARCHAR(10) NOT NULL

ALTER TABLE users
ALTER COLUMN password VARCHAR(8) NOT NULL

INSERT INTO users VALUES
('Maria', 'Rh_maria', 'maria@empresa.com'),
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
('Ana', 'Rh_ana', 'ana@empresa.com'),
('Clara', 'Ti_clara', 'clara@empresa.com'),
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

INSERT INTO projects VALUES
('Re-folha', 'Refatoração das Folhas', '2014-09-05'),
('Manutenção PC´s', 'Manutenção PC´s', '2014-09-06'),
('Auditoria', NULL, '2014-09-07')

INSERT INTO users_has_projects VALUES
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)

UPDATE projects
SET date = '2014-09-12'
WHERE id = 10002

UPDATE users
SET name = 'Rh_cido'
WHERE name = 'Rh_apareci'

UPDATE users
SET password = '888@*'
WHERE (name = 'Rh_maria') AND (password = '123mudar')

DELETE users_has_projects
WHERE (users_id = 2) AND (projects_id = 10002)