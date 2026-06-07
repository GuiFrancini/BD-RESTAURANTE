USE restaurante_db;

-- =====================================================
-- 1. INSERTS: CATEGORIA
-- =====================================================

INSERT INTO CATEGORIA (
    cat_nome,
    is_deleted
) VALUES 
('Entradas', FALSE), 
('Pratos Principais', FALSE), 
('Bebidas Não Alcoólicas', FALSE), 
('Bebidas Alcoólicas', FALSE), 
('Sobremesas', FALSE);


-- =====================================================
-- 2. INSERTS: FORMAPAGAMENTO
-- =====================================================

INSERT INTO FORMAPAGAMENTO (
    for_forma,
    is_deleted
) VALUES 
('PIX', FALSE), 
('Cartão de Crédito', FALSE), 
('Cartão de Débito', FALSE), 
('Dinheiro', FALSE), 
('Vale Refeição', FALSE);


-- =====================================================
-- 3. INSERTS: GARCOM
-- =====================================================

INSERT INTO GARCOM (
    gar_nome,
    gar_horariotrabalho,
    is_deleted
) VALUES 
('Ricardo Almeida', '10h00 as 17h00', FALSE),
('Fernanda Costa', '10h00 as 17h00', FALSE),
('Marcos Silva', '10h00 as 17h00', FALSE),
('Juliana Mendes', '10h00 as 17h00', FALSE),
('Roberto Santos', '10h00 as 17h00', FALSE);


-- =====================================================
-- 4. INSERTS: CLIENTE
-- =====================================================

INSERT INTO CLIENTE (
    cli_nome,
    cli_cpf,
    cli_telefone,
    cli_email,
    cli_datanascimento,
    is_deleted
) VALUES 

('Ana Oliveira', '001.001.001-01', '(11) 91111-1111', 'ana.oliveira@email.com', '1990-05-15', FALSE),
('Bruno Cardoso', '002.002.002-02', '(11) 92222-2222', 'bruno.cardoso@email.com', '1985-11-20', FALSE),
('Camila Rocha', '003.003.003-03', '(11) 93333-3333', 'camila.rocha@email.com', '1992-03-10', FALSE),
('Daniel Faria', '004.004.004-04', '(11) 94444-4444', 'daniel.faria@email.com', '1988-07-25', FALSE),
('Eduarda Lima', '005.005.005-05', '(11) 95555-5555', 'eduarda.lima@email.com', '1995-12-02', FALSE),
('Fábio Martins', '006.006.006-06', '(11) 96666-6666', 'fabio.martins@email.com', '1980-01-30', FALSE),
('Gabriela Souza', '007.007.007-07', '(11) 97777-7777', 'gabriela.souza@email.com', '1993-09-14', FALSE),
('Henrique Alves', '008.008.008-08', '(11) 98888-8888', 'henrique.alves@email.com', '1987-04-05', FALSE),
('Isabela Motta', '009.009.009-09', '(11) 99999-9999', 'isabela@email.com', '1991-08-22', FALSE),
('João Teixeira', '010.010.010-10', '(11) 90000-0000', 'joao.teixeira@email.com', '1982-06-18', FALSE),
('Karina Gomes', '011.011.011-11', '(21) 91111-1111', 'karina.gomes@email.com', '1994-02-28', FALSE),
('Leonardo Ribeiro', '012.012.012-12', '(21) 92222-2222', 'leonardo.ribeiro@email.com', '1989-10-12', FALSE),
('Mariana Nunes', '013.013.013-13', '(21) 93333-3333', 'mariana.nunes@email.com', '1996-05-09', FALSE),
('Nicolas Dias', '014.014.014-14', '(21) 94444-4444', 'nicolas.dias@email.com', '1998-11-30', FALSE),
('Otávio Mendes', '015.015.015-15', '(21) 95555-5555', 'otavio.mendes@email.com', '1979-03-21', FALSE),
('Patrícia Castro', '016.016.016-16', '(31) 96666-6666', 'patricia.castro@email.com', '1990-07-07', FALSE),
('Quintino Barros', '017.017.017-17', '(31) 97777-7777', 'quintino.barros@email.com', '1984-12-15', FALSE),
('Rafaela Moraes', '018.018.018-18', '(31) 98888-8888', 'rafaela.moraes@email.com', '1997-01-25', FALSE),
('Sérgio Machado', '019.019.019-19', '(41) 99999-9999', 'sergio.machado@email.com', '1981-08-03', FALSE),
('Tatiane Freitas', '020.020.020-20', '(41) 90000-0000', 'tatiane.freitas@email.com', '1992-09-19', FALSE);


-- =====================================================
-- 5. INSERTS: CARDAPIO
-- =====================================================

INSERT INTO CARDAPIO (
    car_nome,
    car_unidade,
    car_preco,
    CATEGORIA_cat_codigo,
    is_deleted
) VALUES 

('Bruschetta Tradicional', 'Porção', 35.50, 1, FALSE),
('Bolinho de Bacalhau', 'Porção', 48.00, 1, FALSE),
('Picanha na Chapa', 'Prato Feito', 125.00, 2, FALSE),
('Risoto de Funghi', 'Prato Feito', 75.00, 2, FALSE),
('Salmão Grelhado', 'Prato Feito', 98.00, 2, FALSE),
('Strogonoff de Frango', 'Prato Feito', 45.00, 2, FALSE),
('Suco de Laranja Natural', 'Copo 500ml', 15.00, 3, FALSE),
('Água Mineral com Gás', 'Garrafa 300ml', 6.00, 3, FALSE),
('Cerveja Artesanal IPA', 'Garrafa 600ml', 28.00, 4, FALSE),
('Caipirinha de Limão', 'Copo', 22.00, 4, FALSE),
('Pudim de Leite Condensado', 'Fatia', 18.00, 5, FALSE),
('Petit Gâteau', 'Unidade', 32.00, 5, FALSE);


-- =====================================================
-- 6. INSERTS: PEDIDO
-- =====================================================

INSERT INTO PEDIDO (
    ped_data,
    ped_valortotal,
    ped_numeropessoas,
    CLIENTE_cli_codigo,
    FORMAPAGAMENTO_for_codigopagamento,
    is_deleted
) VALUES 

('2025-10-01 13:55:42', 153.00, 4, 1, 2, FALSE),
('2025-10-02', 90.00, 1, 2, 1, FALSE),
('2025-10-15', 283.00, 3, 3, 2, FALSE),
('2025-11-05', 45.00, 1, 4, 5, FALSE),
('2025-11-20', 130.00, 2, 1, 1, FALSE),
('2025-12-10', 315.00, 4, 5, 2, FALSE),
('2025-12-24', 64.00, 1, 6, 3, FALSE),
('2026-01-05', 125.00, 1, 7, 4, FALSE),
('2026-01-15', 214.50, 2, 8, 1, FALSE),
('2026-02-14', 93.50, 1, 9, 2, FALSE),
('2026-02-28', 196.00, 2, 10, 1, FALSE),
('2026-03-01', 45.00, 1, 11, 5, FALSE),
('2026-03-10', 140.00, 1, 12, 1, FALSE),
('2026-03-12', 35.50, 1, 1, 3, FALSE);