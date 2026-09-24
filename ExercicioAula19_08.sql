CREATE DATABASE loja;
USE loja;

CREATE TABLE pedidos(
    codigo int not null PRIMARY KEY,
    codcli int not null,
    cliente varchar(300) not null,
    data date,
    valor decimal(10,2),
    cidade varchar(300),
    estado varchar(2)
);

INSERT INTO pedidos (codigo, codcli, cliente, data, valor, cidade, estado)
VALUES (1, 1, 'Carlos', '2025-01-10', 3500.00, 'Sao Paulo', 'SP'),
(2, 2, 'Amanda', '2025-01-11', 2200.00, 'Rio de Janeiro', 'RJ'),
(3, 3, 'Bruno', '2025-01-12', 150.00, 'Belo Horizonte', 'MG'),
(4, 4, 'Juliana', '2025-01-13', 900.00, 'Sao Paulo', 'SP'),
(5, 5, 'Rafael', '2025-01-14', 180.00, 'Curitiba', 'PR'),
(6, 6, 'Camila', '2025-01-15', 1500.00, 'Recife', 'PE'),
(7, 7, 'Fernando', '2025-01-16', 100.00, 'Sao Paulo', 'SP'),
(8, 8, 'Mariana', '2025-01-17', 700.00, 'Salvador', 'BA'),
(9, 9, 'Lucas', '2025-01-18', 500.00, 'Rio de Janeiro', 'RJ'),
(10, 10, 'Beatriz', '2025-01-19', 850.00, 'Brasilia', 'DF'),
(11, 11, 'Gustavo', '2025-01-20', 3500.00, 'Curitiba', 'PR'),
(12, 12, 'Larissa', '2025-01-21', 2200.00, 'Sao Paulo', 'SP'),
(13, 13, 'Eduardo', '2025-01-22', 180.00, 'Belo Horizonte', 'MG'),
(14, 14, 'Patricia', '2025-01-23', 150.00, 'Recife', 'PE'),
(15, 15, 'Thiago', '2025-01-24', 900.00, 'Sao Paulo', 'SP'),
(16, 16, 'Fernanda', '2025-01-25', 700.00, 'Salvador', 'BA'),
(17, 17, 'Ricardo', '2025-01-26', 500.00, 'Brasilia', 'DF'),
(18, 18, 'Carolina', '2025-01-27', 100.00, 'Rio de Janeiro', 'RJ'),
(19, 19, 'Felipe', '2025-01-28', 1500.00, 'Curitiba', 'PR'),
(20, 20, 'Renata', null, 850.00, 'Sao Paulo', 'SP');

SELECT * FROM pedidos;

SELECT * FROM pedidos
WHERE codigo = 10;

SELECT * FROM pedidos
WHERE valor > 1000;

SELECT * FROM pedidos
WHERE valor > 1000 AND data < '2025-01-20';

SELECT codigo, valor FROM pedidos;

SELECT codigo, cliente, valor
FROM pedidos WHERE valor <> 500;

SELECT codigo, cliente, data
FROM pedidos WHERE data IS NULL;

SELECT codigo, cliente, data
FROM pedidos WHERE data IS NOT NULL;

SELECT codigo, cliente, estado
FROM pedidos WHERE estado IN ('SP', 'RJ', 'MG');

SELECT codigo, cliente, estado
FROM pedidos WHERE estado NOT IN ('SP', 'RJ', 'MG');

SELECT codigo, cliente, valor
FROM pedidos WHERE valor > 1000 OR cidade = 'Sao Paulo';

SELECT codigo, cliente, valor
FROM pedidos WHERE NOT estado = 'SP';

SELECT codigo, valor, valor * 2 AS valor
FROM pedidos;

SELECT codigo, cliente, valor
FROM pedidos ORDER BY valor ASC;

SELECT codigo, cliente, valor
FROM pedidos ORDER BY valor DESC;
