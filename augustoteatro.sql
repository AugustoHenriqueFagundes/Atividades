-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS teatro;
USE teatro;

 -- Criação de Tabelas
CREATE TABLE t (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n VARCHAR(255) NOT NULL,
    e VARCHAR(255) NOT NULL
);

CREATE TABLE d (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n VARCHAR(255) NOT NULL
);

CREATE TABLE p (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n VARCHAR(255) NOT NULL
);

CREATE TABLE a (
    id INT AUTO_INCREMENT PRIMARY KEY,
    t VARCHAR(255) NOT NULL,
    d TEXT,
    id_d INT,
    id_p INT,
    id_t INT,
    FOREIGN KEY (id_d) REFERENCES d(id),
    FOREIGN KEY (id_p) REFERENCES p(id),
    FOREIGN KEY (id_t) REFERENCES t(id)
);

CREATE TABLE ar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    n VARCHAR(255) NOT NULL
);

CREATE TABLE ar_a (
    id_ar INT,
    id_a INT,
    p VARCHAR(255),
    PRIMARY KEY (id_ar, id_a),
    FOREIGN KEY (id_ar) REFERENCES ar(id),
    FOREIGN KEY (id_a) REFERENCES a(id)
);

CREATE TABLE h (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_a INT,
    dh DATETIME NOT NULL,
    FOREIGN KEY (id_a) REFERENCES a(id)
);

-- Inserção de dados 
INSERT INTO t (n, e) VALUES 
('Teatro Central', 'Rua dos Jasmins, 789'),
('Teatro das Artes', 'Avenida Estrela, 101');


INSERT INTO d (n) VALUES 
('Lucas Oliveira'),
('Mariana Rocha');


INSERT INTO p (n) VALUES 
('Roberto Silva'),
('Fernanda Costa');

INSERT INTO a (t, d, id_d, id_p, id_t) VALUES 
('O Espetáculo Inesquecível', 'Uma performance dramática envolvente.', 1, 1, 1),
('Mistério Sob as Estrelas', 'Uma peça cheia de enigmas e surpresas.', 2, 2, 2);


INSERT INTO ar (n) VALUES 
('João Martins'),
('Clara Lima'),
('Ricardo Almeida'),
('Marina Costa');

-- Relacionar artistas e apresentações
INSERT INTO ar_a (id_ar, id_a, p) VALUES 
(1, 1, 'Héroi'),
(2, 1, 'Vilão'),
(3, 2, 'Investigador'),
(4, 2, 'Suspeito');

-- Inserir horários
INSERT INTO h (id_a, dh) VALUES 
(1, '2024-09-15 20:00:00'),
(1, '2024-09-16 19:00:00'),
(2, '2024-09-17 21:00:00'),
(2, '2024-09-18 20:00:00');
