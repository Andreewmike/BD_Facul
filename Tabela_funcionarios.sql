create database loja_caixadaagua;
use loja_caixadaagua;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50),
    salario DECIMAL(10, 2) NOT NULL
);

INSERT INTO funcionarios (nome, cpf, email, cargo, departamento, salario) VALUES 
('Ana Souza', '12345678901', 'ana.souza@caixadagua.com', 'Desenvolvedora Backend', 'Tecnologia', 7500.00),
('Carlos Silva', '98765432109', 'carlos.silva@caixadagua.com', 'Analista de RH', 'RH', 4800.50),
('Beatriz Lima', '45612378902', 'beatriz.lima@caixadagua.com', 'Gerente de Projetos', 'Projetos', 11200.00),
('Lucas Oliveira', '78912345603', 'lucas.oliveira@caixadagua.com', 'Suporte Técnico', 'TI', 3500.00),
('Mariana Costa', '32165498704', 'mariana.costa@caixadagua.com', 'Designer UX/UI', 'Produto', 6200.00),
('Rafael Santos', '65498732105', 'rafael.santos@caixadagua.com', 'Cientista de Dados', 'Tecnologia', 9800.00),
('Juliana Almeida', '15975348606', 'juliana.almeida@caixadagua.com', 'Assistente Financeiro', 'Financeiro', 3800.00),
('Gabriel Rocha', '75395185207', 'gabriel.rocha@caixadagua.com', 'Analista de Marketing', 'Marketing', 5100.00),
('Camila Martins', '85236974108', 'camila.martins@caixadagua.com', 'Product Owner', 'Produto', 10500.00),
('Bruno Fernandes', '36985214709', 'bruno.fernandes@caixadagua.com', 'DevOps Engineer', 'Tecnologia', 8900.00);

DELIMITER $$
CREATE FUNCTION AumentoSalario(salario_func decimal(20,2), percentual_de_aumento decimal(20,2))
RETURNS DECIMAL(20,2) DETERMINISTIC
BEGIN
    RETURN salario_func * percentual_de_aumento;
END $$
DELIMITER ;

SELECT nome, cargo,salario AS salario_atual, AumentoSalario(salario, 0.10) AS valor_do_aumento, salario + AumentoSalario(salario, 0.10) AS novo_salario
FROM funcionarios;
