-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS noite_assombrada;
USE noite_assombrada;

-- Criação de tabelas
CREATE TABLE IF NOT EXISTS fantasias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tamanho CHAR(2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS eventos_assustadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    data_evento DATE NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    detalhes TEXT
);

CREATE TABLE IF NOT EXISTS convidados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    email_contato VARCHAR(100) UNIQUE NOT NULL,
    confirmado BOOLEAN DEFAULT FALSE,
    fantasia_id INT,
    FOREIGN KEY (fantasia_id) REFERENCES fantasias(id)
);

-- Inserção de dados 
INSERT INTO fantasias (nome, tamanho, disponivel) VALUES
('Drácula', 'M', TRUE),
('Esqueleto', 'L', TRUE),
('Bruxa', 'M', TRUE),
('Lobisomem', 'P', FALSE);

INSERT INTO eventos_assombrados (titulo, data_evento, localizacao, detalhes) VALUES
('Noite dos Fantasmas 2024', '2024-10-31', 'Castelo Assombrado', 'Uma noite repleta de mistérios e diversão.'),
('Marcha dos Monstros', '2024-10-30', 'Praça das Sombras', 'Participe do desfile e ganhe prêmios fantasmagóricos!');

INSERT INTO convidados (nome_completo, email_contato, confirmado, fantasia_id) VALUES
('Ana Costa', 'ana.costa@email.com', TRUE, 1),
('Carlos Pereira', 'carlos.pereira@email.com', FALSE, 2),
('Fernanda Lima', 'fernanda.lima@email.com', TRUE, 3);
