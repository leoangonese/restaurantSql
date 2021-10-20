r/* Modelo fisico */
CREATE DATABASE restaurante;

use restaurante;
CREATE TABLE cliente (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    cpf varchar(11)
);

CREATE TABLE pedido (
    id int PRIMARY KEY UNIQUE,
    idCliente int,
    descricaoPedido varchar(60),
    valor DOUBLE,
    idEstoque int
);

CREATE TABLE cozinha (
    id int PRIMARY KEY UNIQUE,
    idComanda int,
    idEstoque int,
    idTipoFuncionario int,
    idBebida int,
    idComida int
);

CREATE TABLE comanda (
    id int PRIMARY KEY UNIQUE,
    idPedido int,
    idCliente int,
    valor DOUBLE,
    idMesa int
);

CREATE TABLE funcionario (
    id int PRIMARY KEY UNIQUE,
    idTipoFuncionario int
);

CREATE TABLE restaurante_estoque (
    nome varchar(50),
    id int PRIMARY KEY UNIQUE,
    local varchar(50),
    idEstoque int,
    idBebidas int,
    idComidas int
);

CREATE TABLE fornecedor (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    cnpj varchar(14),
    valor DOUBLE,
    local varchar(50)
);

CREATE TABLE bebidas (
    id int PRIMARY KEY UNIQUE,
    refrigerante int,
    suco int,
    agua int,
    nome varchar(50)
);

CREATE TABLE comidas (
    id int PRIMARY KEY UNIQUE,
    carnes_ int,
    saladas int,
    nome varchar(50)
);

CREATE TABLE tipoFuncionario (
    id int PRIMARY KEY UNIQUE,
    salario DOUBLE,
    idCozinheiro int,
    idAtendente int,
    idFaxineiro int,
    idGarcom int,
    idAbastecedor int
);

CREATE TABLE caixa (
    id int PRIMARY KEY UNIQUE,
    idTipoFuncionario int,
    idComanda int
);

CREATE TABLE mesa (
    id int PRIMARY KEY UNIQUE,
    numero int,
    idComanda int
);

CREATE TABLE cozinheiro (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    funcao varchar(50),
    cpf varchar(11)
);

CREATE TABLE garcom (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    funcao varchar(50),
    cpf varchar(11)
);

CREATE TABLE atendente (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    funcao varchar(50),
    cpf varchar(11)
);

CREATE TABLE faxineiro (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    funcao varchar(50),
    cpf varchar(11)
);

CREATE TABLE abastecedor (
    id int PRIMARY KEY UNIQUE,
    nome varchar(50),
    funcao varchar(50),
    cpf varchar(11)
);


ALTER TABLE pedido ADD CONSTRAINT FK_pedido_2
    FOREIGN KEY (idCliente)
    REFERENCES cliente (id);

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_3
    FOREIGN KEY (idEstoque)
    REFERENCES restaurante_estoque (id);

ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_2
    FOREIGN KEY (idTipoFuncionario)
    REFERENCES tipoFuncionario (id);

ALTER TABLE comanda ADD CONSTRAINT FK_comanda_2
    FOREIGN KEY (idPedido)
    REFERENCES pedido (id);

ALTER TABLE comanda ADD CONSTRAINT FK_comanda_3
    FOREIGN KEY (idCliente)
    REFERENCES cliente (id);

ALTER TABLE comanda ADD CONSTRAINT FK_comanda_4
    FOREIGN KEY (idMesa)
    REFERENCES mesa (id);

ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_2
    FOREIGN KEY (idComanda)
    REFERENCES comanda (id);

ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_3
    FOREIGN KEY (idEstoque)
    REFERENCES estoque (id);


ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_4
    FOREIGN KEY (idTipoFuncionario)
    REFERENCES tipoFuncionario (id);

ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_5
    FOREIGN KEY (idComida)
    REFERENCES comidas (id);

ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_6
    FOREIGN KEY (idBebida)
    REFERENCES bebidas (id);

ALTER TABLE cozinha ADD CONSTRAINT FK_cozinha_7
    FOREIGN KEY (idEstoque)
    REFERENCES restaurante_estoque (id);

ALTER TABLE restaurante_estoque ADD CONSTRAINT FK_restaurante_estoque_2
    FOREIGN KEY (idBebidas)
    REFERENCES bebidas (id);

ALTER TABLE restaurante_estoque ADD CONSTRAINT FK_restaurante_estoque_3
    FOREIGN KEY (idComidas)
    REFERENCES comidas (id);

ALTER TABLE tipoFuncionario ADD CONSTRAINT FK_tipoFuncionario_2
    FOREIGN KEY (idCozinheiro)
    REFERENCES cozinheiro (id);

ALTER TABLE tipoFuncionario ADD CONSTRAINT FK_tipoFuncionario_3
    FOREIGN KEY (idAtendente)
    REFERENCES atendente (id);

ALTER TABLE tipoFuncionario ADD CONSTRAINT FK_tipoFuncionario_4
    FOREIGN KEY (idFaxineiro)
    REFERENCES faxineiro (id);

ALTER TABLE tipoFuncionario ADD CONSTRAINT FK_tipoFuncionario_5
    FOREIGN KEY (idAbastecedor)
    REFERENCES abastecedor (id);

ALTER TABLE tipoFuncionario ADD CONSTRAINT FK_tipoFuncionario_6
    FOREIGN KEY (idGarcom)
    REFERENCES garcom (id);

ALTER TABLE mesa ADD CONSTRAINT FK_mesa_2
    FOREIGN KEY (idComanda)
    REFERENCES comanda (id);

ALTER TABLE caixa ADD CONSTRAINT FK_caixa_2
    FOREIGN KEY (idComanda)
    REFERENCES comanda (id);

ALTER TABLE caixa ADD CONSTRAINT FK_caixa_3
    FOREIGN KEY (idTipoFuncionario)
    REFERENCES tipoFuncionario (id);

