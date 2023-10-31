CREATE DATABASE locacao
GO
USE locacao

CREATE TABLE cliente(
num_cadastro        INT            NOT NULL,
nome                VARCHAR(70)    NOT NULL,
logradouro          VARCHAR(150)   NOT NULL,
num                 INT            NOT NULL    CHECK(num > 0),
cep                 CHAR(8)        NULL     CHECK(LEN(cep) = 8)
PRIMARY KEY(num_cadastro)
)

CRAETE TABLE filme(
id                  INT             NOT NULL,
titulo              VARCHAR(40)     NOT NULL,
ano                 INT             NULL    CHECK(ano <= '2021')
PRIMARY KEY(id)
)

CREATE TABLE estreia(
id                  INT             NOT NULL,
nome                VARCHAR(50)     NOT NULL
PRIMARY KEY(id)
)

CREATE TABLE filme_estreia(
id_filme            INT             NOT NULL,
id_estreia          INT             NOT NULL
FOREIGN KEY(id_filme) REFERENCES filme(id),
FOREIGN KEY(id_estreia) REFERENCES estreia(id)
)

CREATE TABLE dvd(
num                 INT             NOT NULL,
data_fabricacao     DATE            NOT NULL    CHECK(data_fabricacao < (CONVERT(CHAR(10), GETDATE(), 103))),
id_filme            INT             NOT NULL
PRIMARY KEY(num),
FOREIGN KEY(id_filme) REFERENCES filme(id)
)

CREATE TABLE locacao(
num_dvd             INT             NOT NULL,
num_cadastro_cliente INT            NOT NULL,
data_locacao        DATE            NOT NULL    DEFAULT(CONVERT(CHAR(10), GETDATE(), 103)),
data_devolucao      DATE            NOT NULL    CHECK(data_devolucao > data_locacao),
valor               DECIMAL(7,2)    NOT NULL    CHECK(valor > 0)
PRIMARY KEY(data_locacao),
FOREIGN KEY(num_dvd) REFERENCES dvd(num),
FOREIGN KEY(num_cadastro_cliente) REFERENCES cliente(num_cadastro)
)

ALTER TABLE estrela
ALTER COLUMN nome VARCHAR(50) NOT NULL

ALTER TABLE filme
ALTER COLUMN titulo VARCHAR(80) NOT NULL