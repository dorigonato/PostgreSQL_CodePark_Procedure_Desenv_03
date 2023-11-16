CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(255),
    quantidade_produto INT,
    data_comprados DATE
);


INSERT INTO produtos (nome_produto, quantidade_produto, data_comprados)
VALUES ('Produto A', 10, '2023-11-01'),
       ('Produto B', 5, '2023-11-01'),
       ('Produto C', 8, '2023-11-02'),
       ('Produto D', 15, '2023-11-02'),
       ('Produto E', 7, '2023-11-03'),
       ('Produto F', 13, '2023-11-03'),
       ('Produto G', 9, '2023-11-04'),
       ('Produto A', 15, '2023-11-03'),
       ('Produto B', 10, '2023-11-02'),
       ('Produto C', 2, '2023-11-04');

CREATE OR REPLACE PROCEDURE relatorio_diario_vendas()
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE TABLE relatorio AS
    SELECT data_comprados, SUM(quantidade_produto) as total_produtos
    FROM produtos
    GROUP BY data_comprados
    ORDER BY data_comprados;
END; $$


CALL relatorio_diario_vendas();


SELECT * from relatorio;


drop PROCEDURE relatorio_diario_vendas;
drop table relatorio;
