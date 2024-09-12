-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criação de tabelas
CREATE TABLE IF NOT EXISTS autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    categoria_id INT,
    data_publicacao DATE,
    isbn VARCHAR(13) UNIQUE,
    disponivel BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (autor_id) REFERENCES autores(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE IF NOT EXISTS emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    nome_emprestador VARCHAR(100) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserção de dados 
INSERT INTO autores (nome, data_nascimento, nacionalidade) VALUES
('J.K. Rowling', '1965-07-31', 'Britânica'),
('George Orwell', '1903-06-25', 'Britânica'),
('J.R.R. Tolkien', '1892-01-03', 'Britânica'),
('Harper Lee', '1926-04-28', 'Americana');

INSERT INTO categorias (nome) VALUES
('Fantasia'),
('Ficção Científica'),
('Mistério'),
('Não-Ficção');

INSERT INTO livros (titulo, autor_id, categoria_id, data_publicacao, isbn, disponivel) VALUES
('Harry Potter e a Pedra Filosofal', 1, 1, '1997-06-26', '9780747532699', TRUE),
('1984', 2, 2, '1949-06-08', '9780451524935', TRUE),
('O Hobbit', 3, 1, '1937-09-21', '9780345339683', TRUE),
('O Sol é Para Todos', 4, 3, '1960-07-11', '9780061120084', TRUE);

INSERT INTO emprestimos (livro_id, nome_emprestador, data_emprestimo, data_devolucao) VALUES
(1, 'Alice Silva', '2024-09-01', NULL),
(2, 'Bob Santos', '2024-09-10', '2024-09-25'),
(3, 'Carla Oliveira', '2024-09-15', NULL);

DELIMITER 

CREATE PROCEDURE adicionar_autor(
    IN p_nome VARCHAR(100),
    IN p_data_nascimento DATE,
    IN p_nacionalidade VARCHAR(50)
)
BEGIN
    INSERT INTO autores (nome, data_nascimento, nacionalidade)
    VALUES (p_nome, p_data_nascimento, p_nacionalidade);
END;

DELIMITER 

CREATE PROCEDURE adicionar_livro(
    IN p_titulo VARCHAR(150),
    IN p_autor_id INT,
    IN p_categoria_id INT,
    IN p_data_publicacao DATE,
    IN p_isbn VARCHAR(13)
)
BEGIN
    INSERT INTO livros (titulo, autor_id, categoria_id, data_publicacao, isbn)
    VALUES (p_titulo, p_autor_id, p_categoria_id, p_data_publicacao, p_isbn);
END;

CREATE PROCEDURE registrar_emprestimo(
    IN p_livro_id INT,
    IN p_nome_emprestador VARCHAR(100),
    IN p_data_emprestimo DATE
)
BEGIN
    INSERT INTO emprestimos (livro_id, nome_emprestador, data_emprestimo)
    VALUES (p_livro_id, p_nome_emprestador, p_data_emprestimo);
    
    -- Atualizar a disponibilidade do livro
    UPDATE livros
    SET disponivel = FALSE
    WHERE id = p_livro_id;
END;

CREATE FUNCTION verificar_disponibilidade(p_livro_id INT)
RETURNS BOOLEAN
BEGIN
    DECLARE disponibilidade BOOLEAN;

    SELECT disponivel INTO disponibilidade
    FROM livros
    WHERE id = p_livro_id;

    RETURN disponibilidade;
END;

