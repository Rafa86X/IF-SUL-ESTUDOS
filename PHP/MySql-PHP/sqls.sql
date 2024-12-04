/* Lógico_1 com CPF como parte da chave primária */


CREATE TABLE Pessoa (
    id INT AUTO_INCREMENT,
    cpf VARCHAR(20),
    telefone VARCHAR(20),
    nome VARCHAR(50),
    data_nasc DATE,
    estado VARCHAR(50),
    cidade VARCHAR(50),
    rua VARCHAR(50),
    numero INT,
    bairro VARCHAR(50),
    PRIMARY KEY (id, cpf),
    UNIQUE (cpf) -- Garante que o CPF seja único para a FK
);

CREATE TABLE cliente (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf_pessoa VARCHAR(20),
    preferencias VARCHAR(255),
    UNIQUE (cpf_pessoa)
);

CREATE TABLE funcionario (
    cod_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf_pessoa VARCHAR(20),
    id_cargo INT
);

CREATE TABLE cargos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(50),
    permissoes VARCHAR(255)
);

CREATE TABLE historico (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT,
    cod_locacao INT,
    filme VARCHAR(50),
    genero VARCHAR(50),
    data_retirada DATE,
    data_devolucao DATE,
    pago BOOLEAN,
    valor FLOAT
);

CREATE TABLE filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(50),
    valor_unitario FLOAT
);

CREATE TABLE locacao (
    cod_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    cod_cliente INT,
    data_retirata DATE,
    data_devolucao DATE,
    valor_tot FLOAT,
    numero_filmes INT
);

CREATE TABLE item_locado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT,
    cod_locacao INT
);

/* Ajuste das Foreign Keys */
ALTER TABLE cliente ADD CONSTRAINT FK_cliente_2
    FOREIGN KEY (cpf_pessoa)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE;

ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_2
    FOREIGN KEY (cpf_pessoa)
    REFERENCES Pessoa (cpf)
    ON DELETE CASCADE;

ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_3
    FOREIGN KEY (id_cargo)
    REFERENCES cargos (id)
    ON DELETE RESTRICT;

ALTER TABLE historico ADD CONSTRAINT FK_historico_2
    FOREIGN KEY (cod_cliente)
    REFERENCES cliente (cod_cliente)
    ON DELETE RESTRICT;

ALTER TABLE locacao ADD CONSTRAINT FK_locacao_2
    FOREIGN KEY (id_funcionario)
    REFERENCES funcionario (cod_funcionario)
    ON DELETE RESTRICT;

ALTER TABLE locacao ADD CONSTRAINT FK_locacao_3
    FOREIGN KEY (cod_cliente)
    REFERENCES cliente (cod_cliente)
    ON DELETE RESTRICT;

ALTER TABLE item_locado ADD CONSTRAINT FK_item_locado_1
    FOREIGN KEY (id_filme)
    REFERENCES filme (id_filme)
    ON DELETE RESTRICT;

ALTER TABLE item_locado ADD CONSTRAINT FK_item_locado_2
    FOREIGN KEY (cod_locacao)
    REFERENCES locacao (cod_locacao)
    ON DELETE RESTRICT;
    
    
-- Inserir dados na tabela Pessoa para funcionários
INSERT INTO Pessoa (cpf, telefone, nome, data_nasc, estado, cidade, rua, numero, bairro)
VALUES
('11111111111', '1234567890', 'João Silva', '1990-01-01', 'SP', 'São Paulo', 'Rua A', 123, 'Centro'),
('22222222222', '1234567891', 'Maria Souza', '1985-02-02', 'RJ', 'Rio de Janeiro', 'Rua B', 456, 'Copacabana'),
('33333333333', '1234567892', 'Carlos Pereira', '1995-03-03', 'MG', 'Belo Horizonte', 'Rua C', 789, 'Savassi'),
('44444444444', '1234567893', 'Ana Costa', '1988-04-04', 'RS', 'Porto Alegre', 'Rua D', 101, 'Moinhos'),
('55555555555', '1234567894', 'Fernanda Lima', '1992-05-05', 'BA', 'Salvador', 'Rua E', 202, 'Barra');

-- Inserir dados na tabela Pessoa para clientes
INSERT INTO Pessoa (cpf, telefone, nome, data_nasc, estado, cidade, rua, numero, bairro)
VALUES
('66666666666', '1234567895', 'Rafael Torres', '1993-06-06', 'PR', 'Curitiba', 'Rua F', 303, 'Centro'),
('77777777777', '1234567896', 'Beatriz Almeida', '1991-07-07', 'PE', 'Recife', 'Rua G', 404, 'Boa Viagem'),
('88888888888', '1234567897', 'Gustavo Moreira', '1994-08-08', 'CE', 'Fortaleza', 'Rua H', 505, 'Aldeota'),
('99999999999', '1234567898', 'Letícia Araújo', '1990-09-09', 'AM', 'Manaus', 'Rua I', 606, 'Centro'),
('10101010101', '1234567899', 'Marcelo Martins', '1996-10-10', 'PA', 'Belém', 'Rua J', 707, 'Nazaré'),
('12121212121', '1234567800', 'Juliana Gomes', '1997-11-11', 'GO', 'Goiânia', 'Rua K', 808, 'Setor Oeste'),
('13131313131', '1234567801', 'Felipe Andrade', '1998-12-12', 'SC', 'Florianópolis', 'Rua L', 909, 'Centro'),
('14141414141', '1234567802', 'Camila Castro', '1992-01-13', 'ES', 'Vitória', 'Rua M', 1010, 'Praia do Canto'),
('15151515151', '1234567803', 'Lucas Oliveira', '1993-02-14', 'MS', 'Campo Grande', 'Rua N', 1111, 'Jardim dos Estados'),
('16161616161', '1234567804', 'Aline Dias', '1994-03-15', 'MA', 'São Luís', 'Rua O', 1212, 'Centro');

-- Inserir dados na tabela funcionario
INSERT INTO funcionario (cpf_pessoa, id_cargo)
VALUES
('11111111111', 1), -- Atendente
('22222222222', 1), -- Atendente
('33333333333', 1), -- Atendente
('44444444444', 2), -- Gerente
('55555555555', 3); -- Diretor

-- Inserir dados na tabela cliente
INSERT INTO cliente (cpf_pessoa, preferencias)
VALUES
('66666666666', 'Ação, Comédia'),
('77777777777', 'Drama, Romance'),
('88888888888', 'Terror, Suspense'),
('99999999999', 'Animação, Fantasia'),
('10101010101', 'Documentário, História'),
('12121212121', 'Ficção Científica, Aventura'),
('13131313131', 'Policial, Crime'),
('14141414141', 'Esporte, Musical'),
('15151515151', 'Guerra, Western'),
('16161616161', 'Biografia, Fantasia');

INSERT INTO cargos (cargo, permissoes)
VALUES
('Atendente', 'Atender clientes, Registrar locações'),
('Gerente', 'Gerenciar atendentes, Relatórios'),
('Diretor', 'Supervisão geral');

INSERT INTO filme (titulo, genero, valor_unitario)
VALUES
('Filme 1', 'Ação', 10.00),
('Filme 2', 'Comédia', 8.00),
('Filme 3', 'Drama', 12.00),
('Filme 4', 'Romance', 9.00),
('Filme 5', 'Terror', 11.00),
('Filme 6', 'Suspense', 10.00),
('Filme 7', 'Animação', 7.00),
('Filme 8', 'Fantasia', 10.00),
('Filme 9', 'Documentário', 15.00),
('Filme 10', 'História', 14.00),
('Filme 11', 'Aventura', 10.00),
('Filme 12', 'Ficção Científica', 13.00),
('Filme 13', 'Musical', 9.00),
('Filme 14', 'Western', 10.00),
('Filme 15', 'Policial', 11.00),
('Filme 16', 'Esporte', 8.00),
('Filme 17', 'Guerra', 12.00),
('Filme 18', 'Biografia', 14.00),
('Filme 19', 'Crime', 11.00),
('Filme 20', 'Fantasia', 10.00);

INSERT INTO locacao (id_funcionario, cod_cliente, data_retirata, data_devolucao, valor_tot, numero_filmes)
VALUES
(1, 1, '2024-11-25', '2024-11-30', 20.00, 2),
(1, 2, '2024-11-20', '2024-11-25', 30.00, 3),
(2, 3, '2024-11-15', '2024-11-20', 15.00, 1),
(3, 4, '2024-11-10', '2024-11-15', 40.00, 4),
(3, 5, '2024-11-05', '2024-11-10', 25.00, 2),
(4, 1, '2024-11-01', '2024-11-06', 50.00, 5),
(4, 2, '2024-10-28', '2024-11-02', 35.00, 3),
(5, 3, '2024-10-23', '2024-10-28', 20.00, 2),
(5, 4, '2024-10-18', '2024-10-23', 15.00, 1),
(2, 5, '2024-10-13', '2024-10-18', 40.00, 4),
(1, 1, '2024-10-08', '2024-10-13', 30.00, 3),
(1, 2, '2024-10-03', '2024-10-08', 25.00, 2);

-- Inserir os itens locados
-- Locação 1 (ID: 1), 2 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(1, 1), -- Filme 1
(2, 1); -- Filme 2

-- Locação 2 (ID: 2), 3 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(3, 2), -- Filme 3
(4, 2), -- Filme 4
(5, 2); -- Filme 5

-- Locação 3 (ID: 3), 1 filme
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(6, 3); -- Filme 6

-- Locação 4 (ID: 4), 4 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(7, 4), -- Filme 7
(8, 4), -- Filme 8
(9, 4), -- Filme 9
(10, 4); -- Filme 10

-- Locação 5 (ID: 5), 2 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(1, 5), -- Filme 1
(2, 5); -- Filme 2

-- Locação 6 (ID: 6), 5 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(3, 6), -- Filme 3
(4, 6), -- Filme 4
(5, 6), -- Filme 5
(6, 6), -- Filme 6
(7, 6); -- Filme 7

-- Locação 7 (ID: 7), 3 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(8, 7), -- Filme 8
(9, 7), -- Filme 9
(10, 7); -- Filme 10

-- Locação 8 (ID: 8), 2 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(1, 8), -- Filme 1
(3, 8); -- Filme 3

-- Locação 9 (ID: 9), 1 filme
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(4, 9); -- Filme 4

-- Locação 10 (ID: 10), 4 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(5, 10), -- Filme 5
(6, 10), -- Filme 6
(7, 10), -- Filme 7
(8, 10); -- Filme 8

-- Locação 11 (ID: 11), 3 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(9, 11), -- Filme 9
(10, 11), -- Filme 10
(1, 11); -- Filme 1

-- Locação 12 (ID: 12), 2 filmes
INSERT INTO item_locado (id_filme, cod_locacao)
VALUES
(2, 12), -- Filme 2
(3, 12); -- Filme 3

