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

INSERT INTO cadastro_empresa
(Pk_cnpj,nome_colaborador,email_colaborador,nome_empresa,senha_empresa_hash) Values 

('12.345.678/0001-90', 'Ana Silva', 'contato@tech.com', 'Tech Solutions Ltda','SenhaSegura123'),
('12.345.768/0001-00', 'Lucas Oliveira', 'contato@inovatech.com', 'InovaTech Solutions','Senha@123'),
('12.345.678/0001-99', 'Rafael Lima', 'contato@futurotech.com', 'FuturoTech','Segura1326'),
('98.765.432/0001-21', 'Carolina Santos', 'contato@visionsoft.com', 'VisionSoft Solutions','Senha2013');

-- Tabela cadastro de vaga 
CREATE TABLE cadastro_vaga (
	Pk_Idvaga int primary key not null auto_increment,
    nome_vaga VARCHAR(150) NOT NULL,
	area_atuacao VARCHAR(150),
    modelo_trabalho ENUM('Remoto','Hibrido','Presencial') NOT NULL,
    estado CHAR(2) NOT NULL, -- add estados 
    localizacao VARCHAR(255),
    descricao TEXT NOT NULL,
    requisitos TEXT NOT NULL,
    valor_salario decimal(10.2)
);

-- Tabela cadastro cursos
CREATE TABLE cursos (
    Pk_ldCursos INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao INT, -- avaliaçõa do curso em estrelas 
    nome_curso VARCHAR(50) NOT NULL,
    comentario TEXT
);

INSERT INTO cursos
(avaliacao,nome_curso,comentario) VALUES

('3', 'Desenvolvimento de Habilidades de Comunicação', 'Conteúdo útil, mas as atividades práticas poderiam ser mais desafiadoras.'),
('4', 'Gestão de Projetos Empresariais', 'Curso essencial para quem busca liderar equipes e projetos com eficiência.'),
('5', 'Introdução à Estatística', 'Achei o curso muito util e pratico');


-- Tabela Cadastro candidato
CREATE TABLE cadastro_candidato (
	cpf VARCHAR(14) primary key not null,
    email_candidato VARCHAR(255) NOT NULL,
    senha_candidato_hash VARCHAR(30)
);

INSERT INTO cadastro_candidato 
(cpf,email_candidato,senha_candidato_hash) VALUES 

('789.012.345-67', 'rafael@email.com', 'hashjkl'),
('890.123.456-78', 'carla@email.com', 'hashmno'),
('901.234.567-89', 'joao@email.com', 'hashpqr'),
('456.789.012-34', 'diana@email.com', 'hashabc'),
('567.890.123-45', 'eduardo@email.com', 'hashdef');


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

INSERT INTO perfil_candidato 
(nome_completo,nome_social,celular,cep,numero.complemento,data_nasc,nacionalidade,genero,estado_civil)VALUES

('Rafael Silva', 'Rafa', '987654321', '12345-678', 123, 'Apto 456', '1990-05-15', 'Brasileiro', 'Masculino', 'Solteiro'),
('Carla Oliveira', 'Carlinha', '987123456', '54321-876', 456, 'Casa 789', '1985-12-20', 'Brasileira', 'Feminino', 'Casada'),
('João Santos', 'Joãozinho', '999888777', '87654-321', 789, 'Bloco C', '1988-08-10', 'Brasileiro', 'Masculino', 'Solteiro'),
('Diana Pereira', 'Diana', '999111222', '98765-432', 234, 'Andar 5', '1995-03-25', 'Brasileira', 'Feminino', 'Solteira'),
('Eduardo Souza', 'Dudu', '987654123', '43210-876', 567, 'Cobertura 101', '1982-11-05', 'Brasileiro', 'Masculino', 'Divorciado');

