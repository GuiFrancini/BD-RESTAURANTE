-- restaurante_db CHECK >8.0.16

CREATE DATABASE IF NOT EXISTS restaurante_db;

USE restaurante_db;

-- 1. CLIENTE
CREATE TABLE IF NOT EXISTS CLIENTE (

    cli_codigo INT NOT NULL AUTO_INCREMENT,
    cli_nome VARCHAR(100) NOT NULL,
    cli_cpf VARCHAR(14) NOT NULL UNIQUE,
    cli_telefone VARCHAR(20),
    cli_email VARCHAR(100) NOT NULL,
    cli_datanascimento DATE,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (cli_codigo)

) ENGINE=InnoDB;


-- 2. CATEGORIA
CREATE TABLE IF NOT EXISTS CATEGORIA (

    cat_codigo INT NOT NULL AUTO_INCREMENT,
    cat_nome VARCHAR(45) NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (cat_codigo)

) ENGINE=InnoDB;


-- 3. FORMAPAGAMENTO
CREATE TABLE IF NOT EXISTS FORMAPAGAMENTO (

    for_codigopagamento INT NOT NULL AUTO_INCREMENT,
    for_forma VARCHAR(45) NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (for_codigopagamento)

) ENGINE=InnoDB;


-- 4. GARCOM
CREATE TABLE IF NOT EXISTS GARCOM (

    gar_codigo INT NOT NULL AUTO_INCREMENT,
    gar_nome VARCHAR(100) NOT NULL,
    gar_horariotrabalho VARCHAR(45),

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (gar_codigo)

) ENGINE=InnoDB;


-- 5. CARDAPIO
CREATE TABLE IF NOT EXISTS CARDAPIO (

    car_codigo INT NOT NULL AUTO_INCREMENT,
    car_nome VARCHAR(100) NOT NULL,
    car_unidade VARCHAR(45),
    car_preco DECIMAL(10,2) NOT NULL,

    CATEGORIA_cat_codigo INT NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (car_codigo),

    CHECK (car_preco > 0.00),

    CONSTRAINT fk_cardapio_possui_categoria
        FOREIGN KEY (CATEGORIA_cat_codigo)
        REFERENCES CATEGORIA(cat_codigo)

) ENGINE=InnoDB;


-- 6. PEDIDO
CREATE TABLE IF NOT EXISTS PEDIDO (

    ped_numerovenda INT NOT NULL AUTO_INCREMENT,
    ped_data DATETIME NOT NULL,
    ped_valortotal DECIMAL(10,2),
    ped_numeropessoas INT,

    CLIENTE_cli_codigo INT NOT NULL,
    FORMAPAGAMENTO_for_codigopagamento INT NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (ped_numerovenda),

    CHECK (ped_valortotal > 0.00),
    CHECK (ped_numeropessoas > 0),

    CONSTRAINT fk_pedido_possui_cliente
        FOREIGN KEY (CLIENTE_cli_codigo)
        REFERENCES CLIENTE(cli_codigo),

    CONSTRAINT fk_pedido_possui_formapagamento
        FOREIGN KEY (FORMAPAGAMENTO_for_codigopagamento)
        REFERENCES FORMAPAGAMENTO(for_codigopagamento)

) ENGINE=InnoDB;


-- 7. ITEMPEDIDO
CREATE TABLE IF NOT EXISTS ITEMPEDIDO (

    item_numeroitem INT NOT NULL AUTO_INCREMENT,
    item_quantidade INT NOT NULL,
    item_valorunitario DECIMAL(10,2) NOT NULL,
    item_valortotalitem DECIMAL(10,2),

    PEDIDO_ped_numerovenda INT NOT NULL,
    CARDAPIO_car_codigo INT NOT NULL,
    GARCOM_gar_codigo INT NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (item_numeroitem),

    CHECK (item_quantidade > 0),
    CHECK (item_valorunitario > 0.00),
    CHECK (item_valortotalitem > 0.00),

    CONSTRAINT fk_itempedido_possui_pedido
        FOREIGN KEY (PEDIDO_ped_numerovenda)
        REFERENCES PEDIDO(ped_numerovenda),

    CONSTRAINT fk_itempedido_possui_cardapio
        FOREIGN KEY (CARDAPIO_car_codigo)
        REFERENCES CARDAPIO(car_codigo),

    CONSTRAINT fk_itempedido_possui_garcom
        FOREIGN KEY (GARCOM_gar_codigo)
        REFERENCES GARCOM(gar_codigo)

) ENGINE=InnoDB;