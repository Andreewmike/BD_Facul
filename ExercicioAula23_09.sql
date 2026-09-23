DROP DATABASE IF EXISTS BD_Produto;
CREATE DATABASE BD_Produto;
USE BD_Produto;

DROP TABLE IF EXISTS produto;

CREATE TABLE produto(
    id_produto INT NOT NULL PRIMARY KEY,
    nome VARCHAR(300) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL
);

DROP PROCEDURE IF EXISTS sp_InsereProduto;
DELIMITER //
CREATE PROCEDURE sp_InsereProduto(v_id_produto INT, v_nome VARCHAR(300), v_preco DECIMAL(10,2), v_quantidade INT)
BEGIN
    if (v_id_produto IS NOT NULL AND v_nome IS NOT NULL AND v_preco IS NOT NULL AND v_quantidade IS NOT NULL) THEN
        BEGIN
            INSERT INTO produto (id_produto, nome, preco, quantidade)
            VALUES (v_id_produto, v_nome, v_preco, v_quantidade);
            SELECT 'Produto inserido com sucesso' AS mensagem;
        END;
    else
        BEGIN
            SELECT 'Parametros inadequados' AS mensagem;
        END;
    END IF;
END
//
DELIMITER ;
CALL sp_InsereProduto(1, 'Escada', 150.00, 10);
CALL sp_InsereProduto(2, 'Caneca', 80.00, 20);
CALL sp_InsereProduto(3, 'PC', 900.00, 5);
SELECT * FROM produto;

DROP PROCEDURE IF EXISTS sp_ConsultaProduto;
DELIMITER //

CREATE PROCEDURE sp_ConsultaProduto(v_id_produto INT)
BEGIN
    IF (v_id_produto IS NOT NULL) THEN
        SELECT id_produto, nome, preco, quantidade FROM produto
        WHERE id_produto = v_id_produto;
    ELSE
        SELECT id_produto, nome, preco, quantidade
        FROM produto;
    END IF;
END
//
DELIMITER ;
CALL sp_ConsultaProduto(1);
CALL sp_ConsultaProduto(2);
CALL sp_ConsultaProduto(NULL);

DROP PROCEDURE IF EXISTS sp_AtualizaProduto;
DELIMITER //

CREATE PROCEDURE sp_AtualizaProduto(v_id_produto INT, v_nome VARCHAR(300), v_preco DECIMAL(10,2), v_quantidade INT)
BEGIN
    IF (v_id_produto IS NOT NULL AND v_nome IS NOT NULL AND v_preco IS NOT NULL AND v_quantidade IS NOT NULL) THEN
        BEGIN
            UPDATE produto
            SET nome = v_nome, preco = v_preco, quantidade = v_quantidade
            WHERE id_produto = v_id_produto;
            SELECT 'Produto atualizado com sucesso' AS mensagem;
        END;
    ELSE
        BEGIN
            SELECT 'Parametros inadequados' AS mensagem;
        END;
    END IF;
END
//
DELIMITER ;
CALL sp_AtualizaProduto(1, 'Teclado Redragon', 250.00, 15);
SELECT * FROM produto;

DROP PROCEDURE IF EXISTS sp_DeletaProduto;
DELIMITER //
CREATE PROCEDURE sp_DeletaProduto(v_id_produto INT)
BEGIN
    IF (v_id_produto IS NOT NULL) THEN
        DELETE FROM produto
        WHERE id_produto = v_id_produto;
        SELECT 'Produto excluido com sucesso' AS mensagem;
    ELSE
        DELETE FROM produto;
        SELECT 'Todos os produtos foram excluidos' AS mensagem;
    END IF;
END
//
DELIMITER ;
CALL sp_DeletaProduto(3);
SELECT * FROM produto;
