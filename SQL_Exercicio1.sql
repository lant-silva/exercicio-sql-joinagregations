CREATE DATABASE users_projects
GO
USE users_projects

CREATE TABLE users(
id          INT          NOT NULL   IDENTITY,
nome        VARCHAR(45)  NOT NULL   UNIQUE,
usernome    VARCHAR(45)  NOT NULL,
passwd    VARCHAR(45)  NOT NULL   DEFAULT('123mudar'),
email       VARCHAR(45)  NOT NULL
PRIMARY KEY(id)
)

CREATE TABLE projects(
id          INT          NOT NULL   IDENTITY(10001, 1),
nome        VARCHAR(45)  NOT NULL,
descr VARCHAR(45)  NULL,
dat        DATE         NOT NULL   CHECK(dat > '2014-09-01')
PRIMARY KEY(id)
)

CREATE TABLE users_has_projects(
users_id    INT          NOT NULL,
projects_id INT          NOT NULL
FOREIGN KEY(users_id) REFERENCES users(id)
FOREIGN KEY(projects_id) REFERENCES projects(id)
)

ALTER TABLE users
ALTER COLUMN usernome VARCHAR(10) NOT NULL

ALTER TABLE users
ALTER COLUMN passwd VARCHAR(8) NOT NULL

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
SET dat = '2014-09-12'
WHERE id = 10002

UPDATE users
SET nome = 'Rh_cido'
WHERE nome = 'Rh_apareci'

UPDATE users
SET passwd = '888@*'
WHERE (nome = 'Rh_maria') AND (passwd = '123mudar')

DELETE users_has_projects
WHERE (users_id = 2) AND (projects_id = 10002)

INSERT INTO users VALUES
('Joao', 'TI_joao', 'joao@empresa.com')

INSERT INTO projects VALUES
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PCs', '2014-09-12')

SELECT u.id, u.nome, u.email, p.nome, p.descr, p.dat
FROM users u, projects p, users_has_projects up 
WHERE u.id = up.users_id
    AND up.projects_id = p.id

SELECT u.nome AS usuarios_sem_projetos
FROM users u LEFT OUTER JOIN users_has_projects up
ON u.id = up.users_id
WHERE up.users_id IS NULL
