DROP DATABASE faculdade;
CREATE DATABASE faculdade;
USE faculdade;

CREATE TABLE cursos(
    id_curso int not null PRIMARY KEY,
    nome varchar(300) not null,
    duracao int not null
);

CREATE TABLE alunos(
    id_aluno int not null PRIMARY KEY,
    nome varchar(300) not null,
    idade int not null,
    id_curso int null,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO cursos (id_curso, nome, duracao)
VALUES (1, 'ADS', 4),
(2, 'ADM', 4),
(3, 'Contabilidade', 4),
(4, 'Engenharia de Software', 5),
(5, 'SI', 4),
(6, 'MKT', 4),
(7, 'RH', 2),
(8, 'Design Grafico', 3),
(9, 'Logistica', 2),
(10, 'Redes de Computadores', 3);

INSERT INTO alunos (id_aluno, nome, idade, id_curso)
VALUES (1, 'Carlos', 20, 1),
(2, 'Barbara', 22, 1),
(3, 'João', 25, 2),
(4, 'Vinicius', 21, 3),
(5, 'Rafael', 24, 4),
(6, 'Sabrina', 19, 5),
(7, 'Fernando', 28, 6),
(8, 'Mariana', 23, 1),
(9, 'Lucas', 26, null),
(10, 'Beatriz', 20, 7);

SELECT * FROM cursos;
SELECT * FROM alunos;

SELECT a.id_aluno, a.nome, c.nome AS curso
FROM alunos a INNER JOIN cursos c ON a.id_curso = c.id_curso;

SELECT a.id_aluno, a.nome, c.nome AS curso
FROM alunos a LEFT JOIN cursos c ON a.id_curso = c.id_curso;

SELECT a.id_aluno, a.nome, c.nome AS curso
FROM alunos a RIGHT JOIN cursos c ON a.id_curso = c.id_curso;

SELECT * FROM alunos ORDER BY nome;

SELECT * FROM cursos ORDER BY duracao DESC;

SELECT id_curso, COUNT(*) AS total_alunos
FROM alunos GROUP BY id_curso;

SELECT id_curso, COUNT(*) AS total_alunos
FROM alunos GROUP BY id_curso ORDER BY total_alunos DESC;

SELECT idade, COUNT(*) AS quantidade_alunos
FROM alunos GROUP BY idade ORDER BY idade;

SELECT COUNT(*) AS total_alunos FROM alunos;