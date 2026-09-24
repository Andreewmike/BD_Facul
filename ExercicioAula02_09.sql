CREATE DATABASE vendas;
USE vendas;

CREATE TABLE vendas
(
    id_venda int not null PRIMARY KEY,
    produto varchar(300) not null,
    categoria varchar(200) not null,
    valor decimal(10,2) not null,
    quantidade int not null
);

INSERT INTO vendas (id_venda, produto, categoria, valor, quantidade)
VALUES (1, 'Notebook DELL', 'Informatica', 3500.00, 2),
(2, 'Celular Motorola', 'Eletronico', 2200.00, 3),
(3, 'Teclado Logitech', 'Informatica', 150.00, 5),
(4, 'Monitor Acer', 'Informatica', 900.00, 2),
(5, 'Fone JBL', 'Eletronico', 180.00, 8),
(6, 'Tablet Xiaomi', 'Eletronico', 1500.00, 4),
(7, 'Impressora HP Laser', 'Informatica', 850.00, 2),
(8, 'Mouse', 'Informatica', 100.00, 10),
(9, 'Cadeira gamer', 'Moveis', 700.00, 3),
(10, 'Mesa para desktop', 'Moveis', 500.00, 4);

SELECT * FROM vendas;

SELECT COUNT(*) AS total_registros
FROM vendas;

SELECT AVG(valor) AS valor_medio
FROM vendas;

SELECT MAX(valor) AS maior_valor
FROM vendas;

SELECT MIN(valor) AS menor_valor
FROM vendas;

SELECT SUM(valor) AS soma_valores
FROM vendas;
