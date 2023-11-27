create database bd_vinculos;
use bd_vinculos;

-- Criação das tabelas

-- Tabela Cadastro da empresa 
CREATE TABLE cadastro_empresa (
	 Pk_cnpj VARCHAR(18) PRIMARY KEY,
     nome_colaborador VARCHAR(100) NOT NULL,
	 email_colaborador VARCHAR(255) NOT NULL,
     nome_empresa VARCHAR(100) NOT NULL,
     senha_empresa_hash VARCHAR(30)
);

-- Tabela cadastro de vaga 
CREATE TABLE cadastroVaga (
	Pk_Idvaga int primary key not null auto_increment,
    nome_vaga VARCHAR(150) NOT NULL,
	area_atuacao VARCHAR(150),
    modelo_trabalho ENUM('Remoto','Hibrido','Presencial') NOT NULL,
    estado CHAR(2) NOT NULL, -- add estados 
    localizacao VARCHAR(255),
    descricao TEXT NOT NULL,
    requisitos TEXT NOT NULL,
    valor_salario decimal(4.2)
);

-- Tabela cadastro cursos
CREATE TABLE cursos (
    Pk_ldCursos INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao INT, -- avaliaçõa do curso em estrelas 
    nome_curso VARCHAR(50) NOT NULL,
    comentario TEXT
);

-- Tabela Cadastro candidato
CREATE TABLE cadastro_candidato (
	cpf VARCHAR(14) primary key not null,
    email_candidato VARCHAR(255) NOT NULL,
    senha_candidato_hash VARCHAR(30)
);

-- Tabela perfil_candidato
CREATE TABLE perfil_cand (
    Pk_Idperfil_cand INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    nome_social VARCHAR(100) NOT NULL,
    celular VARCHAR(20),
    cep VARCHAR(10),
    numero int,
    complemento VARCHAR(100) NOT NULL,
    data_nasc DATE,
    nacionalidade VARCHAR(50),
    genero ENUM('Feminino','Masculino','Outro'),
    estado_civil ENUM('Casado','Solteiro','Divorciado','Viúvo','Separado'),
    cpf_candidato VARCHAR(14),
    FOREIGN KEY (cpf_candidato) REFERENCES cadastro_candidato (cpf),
    email_candidato VARCHAR(255),
    FOREIGN KEY (email_candidato) REFERENCES cadastro_candidato (email_candidato)
);
