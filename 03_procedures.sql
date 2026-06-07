USE restaurante_db;

DELIMITER $$

-- =====================================================
-- CLIENTE
-- =====================================================

-- INSERT CLIENTE
CREATE PROCEDURE sp_insert_cliente(
    IN p_cpf VARCHAR(14),
    IN p_nome VARCHAR(64),
    IN p_datanascimento DATE,
    IN p_email VARCHAR(64),
    IN p_telefone VARCHAR(16)
)
BEGIN

    INSERT INTO CLIENTE(
        cli_cpf,
        cli_nome,
        cli_datanascimento,
        cli_email,
        cli_telefone,
        is_deleted
    )
    VALUES(
        p_cpf,
        p_nome,
        p_datanascimento,
        p_email,
        p_telefone,
        FALSE
    );

END $$


-- UPDATE CLIENTE
CREATE PROCEDURE sp_update_cliente(
    IN p_codigo INT,
    IN p_cpf VARCHAR(14),
    IN p_nome VARCHAR(64),
    IN p_datanascimento DATE,
    IN p_email VARCHAR(64),
    IN p_telefone VARCHAR(16)
)
BEGIN

    UPDATE CLIENTE
    SET
        cli_cpf = p_cpf,
        cli_nome = p_nome,
        cli_datanascimento = p_datanascimento,
        cli_email = p_email,
        cli_telefone = p_telefone
    WHERE cli_codigo = p_codigo
    AND is_deleted = FALSE;

END $$


-- SOFT DELETE CLIENTE
CREATE PROCEDURE sp_delete_cliente(
    IN p_codigo INT
)
BEGIN

    UPDATE CLIENTE
    SET is_deleted = TRUE
    WHERE cli_codigo = p_codigo;

END $$


-- SELECT CLIENTE
CREATE PROCEDURE sp_select_cliente()
BEGIN

    SELECT *
    FROM CLIENTE
    WHERE is_deleted = FALSE;

END $$


-- =====================================================
-- FORMAPAGAMENTO
-- =====================================================

CREATE PROCEDURE sp_insert_formapagamento(
    IN p_forma VARCHAR(45)
)
BEGIN

    INSERT INTO FORMAPAGAMENTO(
        for_forma,
        is_deleted
    )
    VALUES(
        p_forma,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_formapagamento(
    IN p_codigo INT,
    IN p_forma VARCHAR(45)
)
BEGIN

    UPDATE FORMAPAGAMENTO
    SET for_forma = p_forma
    WHERE for_codigopagamento = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_formapagamento(
    IN p_codigo INT
)
BEGIN

    UPDATE FORMAPAGAMENTO
    SET is_deleted = TRUE
    WHERE for_codigopagamento = p_codigo;

END $$


CREATE PROCEDURE sp_select_formapagamento()
BEGIN

    SELECT *
    FROM FORMAPAGAMENTO
    WHERE is_deleted = FALSE;

END $$


-- =====================================================
-- GARCOM
-- =====================================================

CREATE PROCEDURE sp_insert_garcom(
    IN p_nome VARCHAR(45),
    IN p_horario VARCHAR(45)
)
BEGIN

    INSERT INTO GARCOM(
        gar_nome,
        gar_horariotrabalho,
        is_deleted
    )
    VALUES(
        p_nome,
        p_horario,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_garcom(
    IN p_codigo INT,
    IN p_nome VARCHAR(45),
    IN p_horario VARCHAR(45)
)
BEGIN

    UPDATE GARCOM
    SET
        gar_nome = p_nome,
        gar_horariotrabalho = p_horario
    WHERE gar_codigo = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_garcom(
    IN p_codigo INT
)
BEGIN

    UPDATE GARCOM
    SET is_deleted = TRUE
    WHERE gar_codigo = p_codigo;

END $$


CREATE PROCEDURE sp_select_garcom()
BEGIN

    SELECT *
    FROM GARCOM
    WHERE is_deleted = FALSE;

END $$


-- =====================================================
-- CATEGORIA
-- =====================================================

CREATE PROCEDURE sp_insert_categoria(
    IN p_nome VARCHAR(45)
)
BEGIN

    INSERT INTO CATEGORIA(
        cat_nome,
        is_deleted
    )
    VALUES(
        p_nome,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_categoria(
    IN p_codigo INT,
    IN p_nome VARCHAR(45)
)
BEGIN

    UPDATE CATEGORIA
    SET cat_nome = p_nome
    WHERE cat_codigo = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_categoria(
    IN p_codigo INT
)
BEGIN

    UPDATE CATEGORIA
    SET is_deleted = TRUE
    WHERE cat_codigo = p_codigo;

END $$


CREATE PROCEDURE sp_select_categoria()
BEGIN

    SELECT *
    FROM CATEGORIA
    WHERE is_deleted = FALSE;

END $$


-- =====================================================
-- CARDAPIO
-- =====================================================

CREATE PROCEDURE sp_insert_cardapio(
    IN p_nome VARCHAR(45),
    IN p_preco DECIMAL(10,2),
    IN p_unidade VARCHAR(45),
    IN p_categoria INT
)
BEGIN

    INSERT INTO CARDAPIO(
        car_nome,
        car_preco,
        car_unidade,
        categoria_cat_codigo,
        is_deleted
    )
    VALUES(
        p_nome,
        p_preco,
        p_unidade,
        p_categoria,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_cardapio(
    IN p_codigo INT,
    IN p_nome VARCHAR(45),
    IN p_preco DECIMAL(10,2),
    IN p_unidade VARCHAR(45),
    IN p_categoria INT
)
BEGIN

    UPDATE CARDAPIO
    SET
        car_nome = p_nome,
        car_preco = p_preco,
        car_unidade = p_unidade,
        categoria_cat_codigo = p_categoria
    WHERE car_codigo = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_cardapio(
    IN p_codigo INT
)
BEGIN

    UPDATE CARDAPIO
    SET is_deleted = TRUE
    WHERE car_codigo = p_codigo;

END $$


CREATE PROCEDURE sp_select_cardapio()
BEGIN

    SELECT
        c.car_codigo,
        c.car_nome,
        c.car_preco,
        c.car_unidade,
        cat.cat_nome AS categoria

    FROM CARDAPIO c

    INNER JOIN CATEGORIA cat
        ON c.categoria_cat_codigo = cat.cat_codigo

    WHERE c.is_deleted = FALSE
    AND cat.is_deleted = FALSE;

END $$


-- =====================================================
-- PEDIDO
-- =====================================================

CREATE PROCEDURE sp_insert_pedido(
    IN p_data DATETIME,
    IN p_valortotal DECIMAL(10,2),
    IN p_numeropessoas INT,
    IN p_formapagamento INT,
    IN p_cliente INT
)
BEGIN

    INSERT INTO PEDIDO(
        ped_data,
        ped_valortotal,
        ped_numeropessoas,
        formapagamento_for_codigopagamento,
        cliente_cli_codigo,
        is_deleted
    )
    VALUES(
        p_data,
        p_valortotal,
        p_numeropessoas,
        p_formapagamento,
        p_cliente,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_pedido(
    IN p_codigo INT,
    IN p_data DATETIME,
    IN p_valortotal DECIMAL(10,2),
    IN p_numeropessoas INT,
    IN p_formapagamento INT,
    IN p_cliente INT
)
BEGIN

    UPDATE PEDIDO
    SET
        ped_data = p_data,
        ped_valortotal = p_valortotal,
        ped_numeropessoas = p_numeropessoas,
        formapagamento_for_codigopagamento = p_formapagamento,
        cliente_cli_codigo = p_cliente
    WHERE ped_numerovenda = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_pedido(
    IN p_codigo INT
)
BEGIN

    UPDATE PEDIDO
    SET is_deleted = TRUE
    WHERE ped_numerovenda = p_codigo;

END $$


CREATE PROCEDURE sp_select_pedido()
BEGIN

    SELECT
        p.ped_numerovenda,
        p.ped_data,
        p.ped_valortotal,
        p.ped_numeropessoas,

        c.cli_nome AS cliente,

        CASE
            WHEN c.is_deleted = TRUE
            THEN 'CLIENTE EXCLUIDO'
            ELSE 'ATIVO'
        END AS status_cliente,

        f.for_forma AS forma_pagamento

    FROM PEDIDO p

    INNER JOIN CLIENTE c
        ON p.cliente_cli_codigo = c.cli_codigo

    INNER JOIN FORMAPAGAMENTO f
        ON p.formapagamento_for_codigopagamento = f.for_codigopagamento

    WHERE p.is_deleted = FALSE;

END $$


-- =====================================================
-- ITEMPEDIDO
-- =====================================================

CREATE PROCEDURE sp_insert_itempedido(
    IN p_quantidade INT,
    IN p_valorunitario DECIMAL(10,2),
    IN p_valortotal DECIMAL(10,2),
    IN p_pedido INT,
    IN p_garcom INT,
    IN p_cardapio INT
)
BEGIN

    INSERT INTO ITEMPEDIDO(
        item_quantidade,
        item_valorunitario,
        item_valortotalitem,
        pedido_ped_numerovenda,
        garcom_gar_codigo,
        cardapio_car_codigo,
        is_deleted
    )
    VALUES(
        p_quantidade,
        p_valorunitario,
        p_valortotal,
        p_pedido,
        p_garcom,
        p_cardapio,
        FALSE
    );

END $$


CREATE PROCEDURE sp_update_itempedido(
    IN p_codigo INT,
    IN p_quantidade INT,
    IN p_valorunitario DECIMAL(10,2),
    IN p_valortotal DECIMAL(10,2),
    IN p_pedido INT,
    IN p_garcom INT,
    IN p_cardapio INT
)
BEGIN

    UPDATE ITEMPEDIDO
    SET
        item_quantidade = p_quantidade,
        item_valorunitario = p_valorunitario,
        item_valortotalitem = p_valortotal,
        pedido_ped_numerovenda = p_pedido,
        garcom_gar_codigo = p_garcom,
        cardapio_car_codigo = p_cardapio

    WHERE item_numeroitem = p_codigo
    AND is_deleted = FALSE;

END $$


CREATE PROCEDURE sp_delete_itempedido(
    IN p_codigo INT
)
BEGIN

    UPDATE ITEMPEDIDO
    SET is_deleted = TRUE
    WHERE item_numeroitem = p_codigo;

END $$


CREATE PROCEDURE sp_select_itempedido()
BEGIN

    SELECT
        i.item_numeroitem,
        i.item_quantidade,
        i.item_valorunitario,
        i.item_valortotalitem,

        c.car_nome AS prato,
        g.gar_nome AS garcom,
        p.ped_numerovenda AS pedido

    FROM ITEMPEDIDO i

    INNER JOIN CARDAPIO c
        ON i.cardapio_car_codigo = c.car_codigo

    INNER JOIN GARCOM g
        ON i.garcom_gar_codigo = g.gar_codigo

    INNER JOIN PEDIDO p
        ON i.pedido_ped_numerovenda = p.ped_numerovenda

    WHERE i.is_deleted = FALSE;

END $$

DELIMITER ;