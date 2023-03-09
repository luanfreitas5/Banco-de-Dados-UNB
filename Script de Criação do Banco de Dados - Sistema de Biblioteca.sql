DROP DATABASE IF EXISTS Biblioteca;

CREATE DATABASE Biblioteca;

USE Biblioteca;

START TRANSACTION;

-- #############################################################
-- Criação das Tabelas
-- #############################################################
CREATE TABLE Tipo_Email (
                id_Tipo_Email INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Tipo_Email)
);

CREATE TABLE Area_Conhecimento (
                id_Area_Conhecimento INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Area_Conhecimento)
);


CREATE TABLE Autor (
                id_Autor INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_Autor)
);


CREATE TABLE Editora (
                id_Editora INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_Editora)
);


CREATE TABLE Habilidade (
                id_Habilidade INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Habilidade)
);


CREATE TABLE Cor_Pele (
                id_Cor_Pele INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Cor_Pele)
);


CREATE TABLE Titulacao (
                id_Titulacao INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Titulacao)
);


CREATE TABLE Pais (
                id_Pais INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Pais)
);


CREATE TABLE Tipo_Telefone (
                id_Tipo_Telefone INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Tipo_Telefone)
);


CREATE TABLE Sexo (
                id_Sexo INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(10) NOT NULL,
                PRIMARY KEY (id_Sexo)
);


CREATE TABLE Tipo_Endereco (
                id_Tipo_Endereco INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Tipo_Endereco)
);


CREATE TABLE Estado_Civil (
                id_Estado_Civil INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                PRIMARY KEY (id_Estado_Civil)
);


CREATE TABLE UF (
                id_UF INT AUTO_INCREMENT NOT NULL,
                sigla VARCHAR(20) NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                id_Pais INT NOT NULL,
                PRIMARY KEY (id_UF)
);


CREATE TABLE Naturalidade (
                id_Naturalidade INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                id_UF INT NOT NULL,
                PRIMARY KEY (id_Naturalidade)
);


CREATE TABLE Cidade (
                id_Cidade INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_UF INT NOT NULL,
                PRIMARY KEY (id_Cidade)
);


CREATE TABLE Bairro (
                id_Bairro INT AUTO_INCREMENT NOT NULL,
                descricao VARCHAR(50) NOT NULL,
                id_Cidade INT NOT NULL,
                PRIMARY KEY (id_Bairro)
);


CREATE TABLE Aluno (
                id_Aluno INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                matricula VARCHAR(20) NOT NULL,
                cpf VARCHAR(20) NOT NULL,
                id_Sexo INT NOT NULL,
                id_Cor_Pele INT NOT NULL,
                id_Estado_Civil INT NOT NULL,
                id_Naturalidade INT NOT NULL,
                PRIMARY KEY (id_Aluno)
);


CREATE TABLE Professor (
                id_Professor INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                matricula VARCHAR(20) NOT NULL,
                cpf VARCHAR(20) NOT NULL,
                carga_Horaria TIME NOT NULL,
                id_Sexo INT NOT NULL,
                id_Cor_Pele INT NOT NULL,
                id_Estado_Civil INT NOT NULL,
                id_Naturalidade INT NOT NULL,
                PRIMARY KEY (id_Professor)
);


CREATE TABLE Professor_Titulacao (
                id_Titulacao INT NOT NULL,
                id_Professor INT NOT NULL,
                ano DATE NOT NULL,
                PRIMARY KEY (id_Titulacao, id_Professor)
);


CREATE TABLE Afiliacao (
                id_Afiliacao INT AUTO_INCREMENT NOT NULL,
                nome_Pai VARCHAR(100) NOT NULL,
                nome_Mae VARCHAR(100) NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                PRIMARY KEY (id_Afiliacao)
);


CREATE TABLE Reserva (
                id_Reserva INT AUTO_INCREMENT NOT NULL,
                data_Reserva DATE NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                PRIMARY KEY (id_Reserva)
);


CREATE TABLE Funcionario (
                id_Funcionario INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                matricula VARCHAR(20) NOT NULL,
                cpf VARCHAR(20) NOT NULL,
                id_Sexo INT NOT NULL,
                id_Cor_Pele INT NOT NULL,
                id_Estado_Civil INT NOT NULL,
                id_Naturalidade INT NOT NULL,
                PRIMARY KEY (id_Funcionario)
);


CREATE TABLE Habilidade_Funcionario (
                id_Habilidade INT NOT NULL,
                id_Funcionario INT NOT NULL,
                PRIMARY KEY (id_Habilidade, id_Funcionario)
);


CREATE TABLE Emprestimo (
                id_Emprestimo INT AUTO_INCREMENT NOT NULL,
                data_Emprestimo DATE NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                id_Funcionario INT NOT NULL,
                PRIMARY KEY (id_Emprestimo)
);


CREATE TABLE Email (
                id_Email INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                id_Funcionario INT,
                id_Tipo_Email INT NOT NULL,
                PRIMARY KEY (id_Email)
);


CREATE TABLE Telefone (
                id_Telefone INT AUTO_INCREMENT NOT NULL,
                ddd INT NOT NULL,
                numero INT NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                id_Funcionario INT,
                id_Tipo_Telefone INT NOT NULL,
                PRIMARY KEY (id_Telefone)
);


CREATE TABLE Endereco (
                id_Endereco INT AUTO_INCREMENT NOT NULL,
                rua VARCHAR(50) NOT NULL,
                complemento VARCHAR(50),
                numero INT NOT NULL,
                cep VARCHAR(20) NOT NULL,
                id_Aluno INT,
                id_Professor INT,
                id_Funcionario INT,
                id_Bairro INT NOT NULL,
                id_Tipo_Endereco INT NOT NULL,
                PRIMARY KEY (id_Endereco)
);


CREATE TABLE Dependente (
                id_Dependente INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(100) NOT NULL,
                id_Professor INT,
                id_Funcionario INT,
                PRIMARY KEY (id_Dependente)
);


CREATE TABLE Livro (
                id_Livro INT AUTO_INCREMENT NOT NULL,
                titulo VARCHAR(100) NOT NULL,
                isbn INT NOT NULL,
                ano_Edicao DATE NOT NULL,
                numero_Pagina INT NOT NULL,
                id_Editora INT NOT NULL,
                PRIMARY KEY (id_Livro)
);


CREATE TABLE Area_Conhecimento_Livro (
                id_Area_Conhecimento INT NOT NULL,
                id_Livro INT NOT NULL,
                PRIMARY KEY (id_Area_Conhecimento, id_Livro)
);


CREATE TABLE Autor_Livro (
                id_Autor INT NOT NULL,
                id_Livro INT NOT NULL,
                PRIMARY KEY (id_Autor, id_Livro)
);


CREATE TABLE Reserva_Livro (
                id_Livro INT NOT NULL,
                id_Reserva INT NOT NULL,
                PRIMARY KEY (id_Livro, id_Reserva)
);


CREATE TABLE Livro_Emprestimo (
                id_Livro INT NOT NULL,
                id_Emprestimo INT NOT NULL,
                data_Entrega DATE NOT NULL,
                data_Devolucao DATE,
                PRIMARY KEY (id_Livro, id_Emprestimo)
);


CREATE TABLE Pagamento (
                id_Livro INT NOT NULL,
                id_Emprestimo INT NOT NULL,
                data_Pagamento DATE NOT NULL,
                valor_Atraso DOUBLE PRECISION NOT NULL,
                valor_Pago DOUBLE PRECISION NOT NULL,
                hora_Pagamento TIME NOT NULL,
                PRIMARY KEY (id_Livro, id_Emprestimo)
);


-- #############################################################
-- Criação dos Relacionamentos
-- #############################################################
ALTER TABLE Email ADD CONSTRAINT tipo_email_email_fk
FOREIGN KEY (id_Tipo_Email)
REFERENCES Tipo_Email (id_Tipo_Email)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Area_Conhecimento_Livro ADD CONSTRAINT area_conhecimento_area_conhecimento_livro_fk
FOREIGN KEY (id_Area_Conhecimento)
REFERENCES Area_Conhecimento (id_Area_Conhecimento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Autor_Livro ADD CONSTRAINT autor_autor_livro_fk
FOREIGN KEY (id_Autor)
REFERENCES Autor (id_Autor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livro ADD CONSTRAINT editora_livro_fk
FOREIGN KEY (id_Editora)
REFERENCES Editora (id_Editora)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Habilidade_Funcionario ADD CONSTRAINT habilidade_habilidade_funcionario_fk
FOREIGN KEY (id_Habilidade)
REFERENCES Habilidade (id_Habilidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT cor_pele_professor_fk
FOREIGN KEY (id_Cor_Pele)
REFERENCES Cor_Pele (id_Cor_Pele)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT cor_pele_aluno_fk
FOREIGN KEY (id_Cor_Pele)
REFERENCES Cor_Pele (id_Cor_Pele)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Funcionario ADD CONSTRAINT cor_pele_funcionario_fk
FOREIGN KEY (id_Cor_Pele)
REFERENCES Cor_Pele (id_Cor_Pele)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor_Titulacao ADD CONSTRAINT titulacao_professor_titulacao_fk
FOREIGN KEY (id_Titulacao)
REFERENCES Titulacao (id_Titulacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE UF ADD CONSTRAINT pais_uf_fk
FOREIGN KEY (id_Pais)
REFERENCES Pais (id_Pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Telefone ADD CONSTRAINT tipo_telefone_telefone_fk
FOREIGN KEY (id_Tipo_Telefone)
REFERENCES Tipo_Telefone (id_Tipo_Telefone)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT sexo_professor_fk
FOREIGN KEY (id_Sexo)
REFERENCES Sexo (id_Sexo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Funcionario ADD CONSTRAINT sexo_funcionario_fk
FOREIGN KEY (id_Sexo)
REFERENCES Sexo (id_Sexo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT sexo_aluno_fk
FOREIGN KEY (id_Sexo)
REFERENCES Sexo (id_Sexo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Endereco ADD CONSTRAINT tipo_endereco_endereco_fk
FOREIGN KEY (id_Tipo_Endereco)
REFERENCES Tipo_Endereco (id_Tipo_Endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT estado_civil_professor_fk
FOREIGN KEY (id_Estado_Civil)
REFERENCES Estado_Civil (id_Estado_Civil)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Funcionario ADD CONSTRAINT estado_civil_funcionario_fk
FOREIGN KEY (id_Estado_Civil)
REFERENCES Estado_Civil (id_Estado_Civil)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT estado_civil_aluno_fk
FOREIGN KEY (id_Estado_Civil)
REFERENCES Estado_Civil (id_Estado_Civil)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Cidade ADD CONSTRAINT uf_cidade_fk
FOREIGN KEY (id_UF)
REFERENCES UF (id_UF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Naturalidade ADD CONSTRAINT uf_naturalidade_fk
FOREIGN KEY (id_UF)
REFERENCES UF (id_UF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor ADD CONSTRAINT naturalidade_professor_fk
FOREIGN KEY (id_Naturalidade)
REFERENCES Naturalidade (id_Naturalidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Funcionario ADD CONSTRAINT naturalidade_funcionario_fk
FOREIGN KEY (id_Naturalidade)
REFERENCES Naturalidade (id_Naturalidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Aluno ADD CONSTRAINT naturalidade_aluno_fk
FOREIGN KEY (id_Naturalidade)
REFERENCES Naturalidade (id_Naturalidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Bairro ADD CONSTRAINT cidade_bairro_fk
FOREIGN KEY (id_Cidade)
REFERENCES Cidade (id_Cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Endereco ADD CONSTRAINT bairro_endereco_fk
FOREIGN KEY (id_Bairro)
REFERENCES Bairro (id_Bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Telefone ADD CONSTRAINT aluno_telefone_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Email ADD CONSTRAINT aluno_email_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Endereco ADD CONSTRAINT aluno_endereco_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Afiliacao ADD CONSTRAINT aluno_afiliacao_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Reserva ADD CONSTRAINT aluno_reserva_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Emprestimo ADD CONSTRAINT aluno_emprestimo_fk
FOREIGN KEY (id_Aluno)
REFERENCES Aluno (id_Aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Email ADD CONSTRAINT professor_email_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Telefone ADD CONSTRAINT professor_telefone_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Endereco ADD CONSTRAINT professor_endereco_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Emprestimo ADD CONSTRAINT professor_emprestimo_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Reserva ADD CONSTRAINT professor_reserva_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Afiliacao ADD CONSTRAINT professor_afiliacao_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Dependente ADD CONSTRAINT professor_depedente_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Professor_Titulacao ADD CONSTRAINT professor_professor_titulacao_fk
FOREIGN KEY (id_Professor)
REFERENCES Professor (id_Professor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Reserva_Livro ADD CONSTRAINT reserva_reserva_livro_fk
FOREIGN KEY (id_Reserva)
REFERENCES Reserva (id_Reserva)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Dependente ADD CONSTRAINT funcionario_depedente_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Endereco ADD CONSTRAINT funcionario_endereco_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Telefone ADD CONSTRAINT funcionario_telefone_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Email ADD CONSTRAINT funcionario_email_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Emprestimo ADD CONSTRAINT funcionario_emprestimo_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Habilidade_Funcionario ADD CONSTRAINT funcionario_habilidade_funcionario_fk
FOREIGN KEY (id_Funcionario)
REFERENCES Funcionario (id_Funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livro_Emprestimo ADD CONSTRAINT emprestimo_livroemprestimo_fk
FOREIGN KEY (id_Emprestimo)
REFERENCES Emprestimo (id_Emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Livro_Emprestimo ADD CONSTRAINT livro_livroemprestimo_fk
FOREIGN KEY (id_Livro)
REFERENCES Livro (id_Livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Reserva_Livro ADD CONSTRAINT livro_reserva_livro_fk
FOREIGN KEY (id_Livro)
REFERENCES Livro (id_Livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Autor_Livro ADD CONSTRAINT livro_autor_livro_fk
FOREIGN KEY (id_Livro)
REFERENCES Livro (id_Livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Area_Conhecimento_Livro ADD CONSTRAINT livro_area_conhecimento_livro_fk
FOREIGN KEY (id_Livro)
REFERENCES Livro (id_Livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Pagamento ADD CONSTRAINT livroemprestimo_pagamento_fk
FOREIGN KEY (id_Livro, id_Emprestimo)
REFERENCES Livro_Emprestimo (id_Livro, id_Emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- #############################################################
-- Criação das Restrições
-- #############################################################
ALTER TABLE Area_Conhecimento 
ADD UNIQUE INDEX area_conhecimento_nome_UNIQUE (nome);

ALTER TABLE Titulacao 
ADD UNIQUE INDEX titulacao_descricao_UNIQUE (descricao);

ALTER TABLE Sexo 
ADD UNIQUE INDEX sexo_descricao_UNIQUE (descricao);

ALTER TABLE Estado_Civil 
ADD UNIQUE INDEX estado_descricao_UNIQUE (descricao);

ALTER TABLE Email 
ADD UNIQUE INDEX email_nome_UNIQUE (nome);


-- #############################################################
-- Criação dos Índices
-- #############################################################
ALTER TABLE Professor 
ADD INDEX professor_nome (nome);

ALTER TABLE Emprestimo
ADD INDEX emprestimo_data_empretismo (data_emprestimo);

ALTER TABLE Livro 
ADD INDEX livro_titulo (titulo);

COMMIT;