--CRIAÇÃO DA BASE DE DADOS
CREATE DATABASE BD_Comercio
USE BD_Comercio

--CRIAÇÃO DAS TABELAS
-- Criação da tabela TBL_Estado_Civil
CREATE TABLE TBL_Estado_Civil (
    cod_est_civ INT PRIMARY KEY IDENTITY,
    desc_est_civ VARCHAR(255)
);

-- Criação da tabela TBL_Cliente
CREATE TABLE TBL_Cliente (
    cod_cliente INT PRIMARY KEY IDENTITY,
    nome_cliente VARCHAR(100),
    cod_est_civ INT,
    salario FLOAT,
    FOREIGN KEY (cod_est_civ) REFERENCES TBL_Estado_Civil(cod_est_civ)
);

-- Criação da tabela TBL_Conjuge
CREATE TABLE TBL_Conjuge (
    cod_conjuge INT PRIMARY KEY IDENTITY,
    nome_conjuge VARCHAR(100),
    cod_cliente INT,
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente)
);

-- Criação da tabela TBL_Tipo_Fone
CREATE TABLE TBL_Tipo_Fone (
    cod_fone INT PRIMARY KEY,
    desc_fone VARCHAR(50)
);

-- Criação da tabela TBL_Telefone
CREATE TABLE TBL_Telefone (
    cod_fone INT,
    cod_cliente INT,
    numero_fone VARCHAR(20),
    FOREIGN KEY (cod_fone) REFERENCES TBL_Tipo_Fone(cod_fone),
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente)
);

-- Criação da tabela TBL_Func
CREATE TABLE TBL_Func (
    cod_func INT PRIMARY KEY IDENTITY,
    nome_func VARCHAR(100)
);

-- Criação da tabela TBL_Dependente
CREATE TABLE TBL_Dependente (
    cod_dep INT PRIMARY KEY IDENTITY,
    nome_dep VARCHAR(100),
    data_nasc DATE,
    cod_func INT,
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);

-- Criação da tabela TBL_Premio
CREATE TABLE TBL_Premio (
    cod_func INT,
    valor_premio FLOAT,
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);

-- Criação da tabela TBL_Produto
CREATE TABLE TBL_Produto (
    cod_produto INT PRIMARY KEY IDENTITY,
    nome_produto VARCHAR(100),
    tipo_produto VARCHAR(100)
);

-- Criação da tabela TBL_Pedido
CREATE TABLE TBL_Pedido (
    cod_pedido INT PRIMARY KEY IDENTITY,
    cod_cliente INT,
    cod_func INT,
    data_pedido DATE,
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente),
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);

-- Criação da tabela TBL_Item_Pedido
CREATE TABLE TBL_Item_Pedido (
    cod_pedido INT,
    cod_produto INT,
    qtde_produto INT,
    FOREIGN KEY (cod_pedido) REFERENCES TBL_Pedido(cod_pedido),
    FOREIGN KEY (cod_produto) REFERENCES TBL_Produto(cod_produto)
);


-- INSERÇÃO DE DADOS
-- Inserção de dados na tabela TBL_Estado_Civil
INSERT INTO TBL_Estado_Civil (desc_est_civ) VALUES
('Solteiro(a)'),
('Casado(a)'),
('Divorciado(a)'),
('Viúvo(a)'),
('Separado(a)');

-- Inserção de dados na tabela TBL_Cliente
INSERT INTO TBL_Cliente (nome_cliente, cod_est_civ, salario) VALUES
('Rener Silva', 2, 3500.50),
('Daniel Oliveira', 2, 4200.00),
('Pedro Souza', 3, 2800.75),
('Ana Pereira', 4, 5000.00),
('Carlos Lima', 2, 3100.00),
('Henrique Ruas', 1, 2800.00),
('Cesar', 5, 2900.00);

-- Inserção de dados na tabela TBL_Conjuge
INSERT INTO TBL_Conjuge (nome_conjuge, cod_cliente) VALUES
('Lucia Silva', 1),
('Julia Oliveira', 2),
('Carla Souza', 3),
('Dario Pereira', 4),
('Irene Lima', 5);

-- Inserção de dados na tabela TBL_Tipo_Fone
INSERT INTO TBL_Tipo_Fone (cod_fone, desc_fone) VALUES
(1, 'Celular'),
(2, 'Residencial'),
(3, 'Comercial'),
(4, 'FAX'),
(5, 'Trabalho');

-- Inserção de dados na tabela TBL_Telefone
INSERT INTO TBL_Telefone (cod_fone, cod_cliente, numero_fone) VALUES
(1, 1, '99999-1111'),
(2, 2, '88888-2222'),
(3, 3, '77777-3333'),
(5, 4, '66666-4444'),
(4, 4, '4444-6666');

-- Inserção de dados na tabela TBL_Func
INSERT INTO TBL_Func (nome_func) VALUES
('Francisco Dias'),
('Roseane Costa'),
('Paulo Almeida'),
('Juliana Fernandes'),
('Ricardo Nascimento'),
('José Mendes');

-- Inserção de dados na tabela TBL_Dependente
INSERT INTO TBL_Dependente (nome_dep, data_nasc, cod_func) VALUES
('Marcos Dias', '2010-05-10', 1),
('Sofia Costa', '2012-08-15', 2),
('Lucas Almeida', '2008-11-20', 3),
('Isabel Fernandes', '2015-02-25', 4),
('Lucio Mendes', '2013-04-07', 6),
('Lucia Mendes', '2013-04-07', 6);

-- Inserção de dados na tabela TBL_Premio
INSERT INTO TBL_Premio (cod_func, valor_premio) VALUES
(1, 500.00),
(2, 600.00),
(3, 550.00),
(4, 700.00),
(4, 350.00),
(5, 200.00);

-- Inserção de dados na tabela TBL_Produto
INSERT INTO TBL_Produto (nome_produto, tipo_produto) VALUES
('Fósforo', 'Utensílio'),
('Alicate', 'Ferramenta'),
('Cadeira', 'Móvel'),
('Furadeira', 'Ferramenta'),
('Cimento', 'Construção'),
('Areia', 'Construção');

-- Inserção de dados na tabela TBL_Pedido
INSERT INTO TBL_Pedido (cod_cliente, cod_func, data_pedido) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-20'),
(4, 4, '2024-04-25'),
(5, 5, '2024-05-30');

-- Inserção de dados na tabela TBL_Item_Pedido
INSERT INTO TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 20),
(3, 4, 15),
(4, 5, 30),
(5, 1, 25);


--Consultas Parte 1

--Exercício 1 - Selecione o nome dos clientes e o numero de todos os telefones que cada cliente possui:

SELECT TBL_Cliente.nome_Cliente, TBL_Telefone.numero_fone
FROM TBL_Cliente INNER JOIN TBL_Telefone
ON TBL_Cliente.cod_cliente = TBL_Telefone.cod_cliente
ORDER BY TBL_Cliente.nome_cliente;


--Exercício 2 - Selecione o nome dos clientes casados e o nome de seus cônjuges:

SELECT TBL_Cliente.nome_cliente, TBL_Conjuge.nome_conjuge
FROM TBL_Cliente INNER JOIN TBL_Conjuge
ON TBL_Cliente.cod_cliente = TBL_Conjuge.cod_cliente
WHERE TBL_Cliente.cod_est_civ = 2 
ORDER BY TBL_Cliente.nome_cliente;


--Exercicio 3 - Selecione o nome dos clientes, o numero e o tipo de telefone que cada um possui:

SELECT TBL_Cliente.nome_Cliente, TBL_Telefone.numero_fone, TBL_Tipo_Fone.desc_fone
FROM TBL_Cliente INNER JOIN TBL_Telefone
ON TBL_Cliente.cod_cliente = TBL_Telefone.cod_cliente
INNER JOIN TBL_Tipo_Fone
ON TBL_Telefone.cod_fone = TBL_Tipo_Fone.cod_fone
ORDER BY TBL_Cliente.nome_cliente;


--Exercício 4 - Selecione todas as colunas da tabela pedido, o nome do cliente que fez o pedido-- e o nome do funcionário que atendeu cada pedido:

SELECT TBL_Pedido.*, TBL_Cliente.nome_cliente, TBL_Func.nome_func
FROM TBL_Pedido INNER JOIN TBL_Cliente
ON TBL_Pedido.cod_cliente = TBL_Cliente.cod_cliente
INNER JOIN TBL_Func 
ON TBL_Pedido.cod_func = TBL_Func.cod_func
ORDER BY TBL_Pedido.cod_pedido;


-- Exercício 5 - - Selecione o código e a data do pedido, o nome do cliente que fez o pedido do funcionário “Francisco”:

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Cliente.nome_cliente
FROM TBL_Pedido INNER JOIN TBL_Cliente 
ON TBL_Pedido.cod_cliente = TBL_Cliente.cod_cliente
INNER JOIN TBL_Func 
ON TBL_Pedido.cod_func = TBL_Func.cod_func
WHERE TBL_Func.nome_func LIKE 'Francisco%';


--Exercício 6 - Selecione o código e a data do pedido, o nome do funcionário que atendeu o pedido do cliente “Rener”:

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Func.nome_func
FROM TBL_Pedido INNER JOIN TBL_Cliente
ON TBL_Pedido.cod_cliente = TBL_Cliente.cod_cliente
INNER JOIN TBL_Func
ON TBL_Pedido.cod_func = TBL_Func.cod_func
WHERE TBL_Cliente.nome_cliente LIKE 'Rener%';


--Consultas Parte 2

-- Exercício 7 - Mostre o nome e a data de nascimento dos dependentes de cada funcionário:

SELECT TBL_Dependente.nome_dep, TBL_Dependente.data_nasc
FROM TBL_Dependente INNER JOIN TBL_Func 
ON TBL_Dependente.cod_func = TBL_Func.cod_func
ORDER BY TBL_Dependente.nome_dep;


-- Exercício 8 - Selecione o código e a data do pedido e o nome de cada produto vendido:

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Produto.nome_produto
FROM TBL_Item_Pedido INNER JOIN  TBL_Pedido 
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Produto
ON TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
ORDER BY TBL_Pedido.cod_pedido;


-- Exercício 9 - Selecione o código e a data do pedido e o nome de funcionário que vendeu “Fosforo”:

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Func.nome_func
FROM TBL_Item_Pedido INNER JOIN TBL_Pedido 
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Produto 
ON TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
INNER JOIN TBL_Func
ON TBL_Pedido.cod_func = TBL_Func.cod_func
WHERE TBL_Produto.nome_produto LIKE 'Fósforo';


-- Exercício 10 - Selecione o código e a data do pedido e o nome dos produtos comprados pelo cliente “Daniel”:

SELECT TBL_Pedido.cod_pedido, TBL_Pedido.data_pedido, TBL_Produto.nome_produto
FROM TBL_Item_Pedido INNER JOIN TBL_Pedido
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Produto
ON TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
INNER JOIN TBL_Cliente ON TBL_Pedido.cod_cliente = TBL_Cliente.cod_cliente
WHERE TBL_Cliente.nome_cliente LIKE 'Daniel%';


-- Exercício 11 - Selecione todos os produtos vendidos pela funcionária “Roseane”:
SELECT TBL_Produto.nome_produto
FROM TBL_Produto INNER JOIN TBL_Item_Pedido
ON TBL_Produto.cod_produto = TBL_Item_Pedido.cod_produto
INNER JOIN TBL_Pedido
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Func
ON TBL_Pedido.cod_func = TBL_Func.cod_func
WHERE TBL_Func.nome_func LIKE 'Roseane%';


-- Exercício 12 - Selecione o nome dos clientes e o nome dos produtos comprados respectivamente:

SELECT TBL_Cliente.nome_cliente, TBL_Produto.nome_produto
FROM TBL_Item_Pedido INNER JOIN TBL_Pedido
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Produto
ON TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
INNER JOIN TBL_Cliente
ON TBL_Pedido.cod_cliente = TBL_Cliente.cod_cliente
ORDER BY TBL_Cliente.nome_cliente;


-- Exercício 13 - Selecione o nome dos funcionários e o nome dos produtos vendidos respectivamente:

SELECT TBL_Func.nome_func, TBL_Produto.nome_produto
FROM TBL_Item_Pedido INNER JOIN TBL_Pedido
ON TBL_Item_Pedido.cod_pedido = TBL_Pedido.cod_pedido
INNER JOIN TBL_Produto
ON TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
INNER JOIN TBL_Func
ON TBL_Pedido.cod_func = TBL_Func.cod_func
ORDER BY TBL_Func.nome_func;


--Consultas Parte 3:

--Exercício 14 - Mostre o nome dos funcionários e o valor total dos prêmios que cada funcionário tem:

SELECT TBL_Func.nome_func, SUM(TBL_Premio.valor_premio)
AS SOMA_PREMIO
FROM TBL_Func INNER JOIN TBL_Premio
ON TBL_Func.cod_func = TBL_Premio.cod_func
GROUP BY TBL_Func.nome_func;


--Exercício 15 - Mostre o nome dos funcionários e quantidade de dependentes de cada funcionário:
SELECT TBL_Func.nome_func, COUNT(TBL_Dependente.cod_dep)
AS Total_Dep
FROM TBL_Func INNER JOIN TBL_Dependente
ON TBL_Func.cod_func = TBL_Dependente.cod_func
GROUP BY TBL_Func.nome_func;



--Exercício 16 - Mostre a quantidade de clientes “Casados”, “Solteiros” e “Separados”:
SELECT TBL_Estado_Civil.desc_est_civ, COUNT(TBL_Cliente.cod_est_civ)
AS Estado_Civil
FROM TBL_Estado_Civil INNER JOIN TBL_Cliente
ON TBL_Estado_Civil.cod_est_civ = TBL_Cliente.cod_est_civ
GROUP BY TBL_Estado_Civil.desc_est_civ;


--Exercício 17 - Selecione os dados dos clientes que não tem telefone:

SELECT TBL_Cliente.*
FROM TBL_Cliente
WHERE TBL_Cliente.cod_cliente NOT IN
(SELECT TBL_Telefone.cod_cliente FROM TBL_Telefone);


--Exercício 18 - Selecione os dados dos clientes “Solteiros”:
SELECT TBL_Cliente.*
FROM TBL_Estado_Civil INNER JOIN TBL_Cliente
ON TBL_Estado_Civil.cod_est_civ = TBL_Cliente.cod_est_civ
WHERE TBL_Cliente.cod_est_civ = 1;


--Exercício 19 - Selecione os dados dos clientes “Casados”:

SELECT TBL_Cliente.*, TBL_Conjuge.nome_conjuge
FROM TBL_Estado_Civil INNER JOIN TBL_Cliente
ON TBL_Estado_Civil.cod_est_civ = TBL_Cliente.cod_est_civ
INNER JOIN TBL_Conjuge
ON TBL_Cliente.cod_cliente = TBL_Conjuge.cod_cliente
WHERE TBL_Cliente.cod_est_civ = 2;


--Exercício 20 - Selecione os dados dos funcionários que não têm prêmios:

SELECT TBL_Func.*
FROM TBL_Func
WHERE TBL_Func.cod_func NOT IN
(SELECT TBL_Premio.cod_func FROM TBL_Premio);


--Exercício 21 - Selecione os dados dos funcionários que não têm dependentes:

SELECT TBL_Func.*
FROM TBL_Func
WHERE TBL_Func.cod_func NOT IN 
(SELECT TBL_Dependente.cod_func FROM TBL_Dependente);


--Exercício 22 - Selecione os produtos que nunca foram vendidos:
SELECT TBL_Produto.*
FROM TBL_Produto
WHERE TBL_Produto.cod_produto NOT IN
(SELECT TBL_Item_Pedido.cod_pedido FROM TBL_Item_Pedido);
