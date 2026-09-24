DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
USE empresa;

CREATE TABLE clientes
(
    cod_cliente int not null PRIMARY KEY,
    nome varchar(300) not null,
    email varchar(300) not null,
    cidade varchar(300) not null,
    estado varchar(2) not null
);

CREATE TABLE pedidos
(
    cod_pedido int PRIMARY KEY,
    data_pedido date,
    valor decimal(10,2),
    cod_cliente int null,
    FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente)
);

INSERT INTO clientes (cod_cliente, nome, email, cidade, estado)
VALUES (1, 'Lucas', 'lucas@gmail.com', 'Sao Paulo', 'SP'),
(2, 'Amanda', 'amanda@gmail.com', 'Rio de Janeiro', 'RJ'),
(3, 'Bruno', 'bruno@gmail.com', 'Belo Horizonte', 'MG'),
(4, 'Carolina', 'carolina@gmail.com', 'Recife', 'PE'),
(5, 'Gabriel', 'gabriel@gmail.com', 'Curitiba', 'PR');

INSERT INTO pedidos (cod_pedido, data_pedido, valor, cod_cliente)
VALUES (1, '2026-07-10', 350.00, 1),
(2, '2024-03-08', 850.00, 2),
(3, '2026-06-12', 120.00, 1),
(4, '2023-03-02', 1500.00, 3),
(5, '2025-10-18', 450.00, 4);

SELECT * FROM clientes;
SELECT * FROM pedidos;

CREATE VIEW view_Clientes_Pedidos AS
SELECT c.cod_cliente, c.nome, p.cod_pedido, p.valor
FROM clientes c INNER JOIN pedidos p ON c.cod_cliente = p.cod_cliente;

SELECT * FROM view_Clientes_Pedidos;

CREATE VIEW view_Todos_Clientes AS
SELECT c.cod_cliente, c.nome, p.cod_pedido, p.valor
FROM clientes c LEFT JOIN pedidos p ON c.cod_cliente = p.cod_cliente;

SELECT * FROM view_Todos_Clientes;

CREATE VIEW view_Todos_Pedidos AS
SELECT c.cod_cliente, c.nome, p.cod_pedido, p.valor
FROM clientes c RIGHT JOIN pedidos p ON c.cod_cliente = p.cod_cliente;

SELECT * FROM view_Todos_Pedidos;

DROP DATABASE IF EXISTS funcionarios;
CREATE DATABASE funcionarios;
USE funcionarios;

DROP TABLE IF EXISTS colaboradores;

CREATE TABLE colaboradores
(
    id_colaborador int not null PRIMARY KEY,
    nome varchar(300) not null,
    cargo varchar(200) not null,
    salario decimal(10,2) not null,
    setor varchar(200) not null
);

INSERT INTO colaboradores
(id_colaborador, nome, cargo, salario, setor)
VALUES
(1, 'Marcos', 'Analista de Sistemas JR', 3500.00, 'TI'),
(2, 'Juliana', 'Gerente de RH', 6500.00, 'Administrativo'),
(3, 'Rafael', 'Desenvolvedor Infra', 5200.00, 'TI'),
(4, 'Fernanda', 'Assistente Financeiro', 2800.00, 'Financeiro'),
(5, 'Carlos', 'Analista Financeiro PL', 4200.00, 'Financeiro'),
(6, 'Beatriz', 'Coordenadora de RH', 5800.00, 'RH'),
(7, 'Thiago', 'Desenvolvedor Back-END', 4800.00, 'TI'),
(8, 'Camila', 'Assistente de RH', 2600.00, 'RH');

CREATE VIEW view_Colaboradores_TI AS
SELECT id_colaborador, nome, cargo, salario
FROM colaboradores
WHERE setor = 'TI';

SELECT * FROM view_Colaboradores_TI;

CREATE VIEW view_Salario_Alto AS
SELECT id_colaborador, nome, cargo, salario
FROM colaboradores
WHERE salario > 5000.00;

SELECT * FROM view_Salario_Alto;

CREATE VIEW view_Colaboradores_Administrativo AS
SELECT id_colaborador, nome, cargo, salario
FROM colaboradores
WHERE setor = 'Administrativo';

SELECT * FROM view_Colaboradores_Administrativo;

CREATE VIEW view_Colaboradores_Analistas AS
SELECT id_colaborador, nome, cargo, salario
FROM colaboradores
WHERE cargo = 'Analista';

SELECT * FROM view_Colaboradores_Analistas;

CREATE VIEW view_Colaboradores_Ordem_Salario AS
SELECT id_colaborador, nome, cargo, setor, salario
FROM colaboradores
ORDER BY salario DESC;

SELECT * FROM view_Colaboradores_Ordem_Salario;