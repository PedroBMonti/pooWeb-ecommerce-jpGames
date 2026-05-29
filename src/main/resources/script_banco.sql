DROP TABLE IF EXISTS biblioteca;
DROP TABLE IF EXISTS jogo;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
                         id SERIAL PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         email VARCHAR(100) UNIQUE NOT NULL,
                         senha VARCHAR(100) NOT NULL,
                         perfil VARCHAR(20) NOT NULL,
                         apelido VARCHAR(50),
                         foto_url VARCHAR(255)
);

CREATE TABLE categoria (
                           id SERIAL PRIMARY KEY,
                           nome VARCHAR(100) NOT NULL
);

CREATE TABLE jogo (
                      id SERIAL PRIMARY KEY,
                      titulo VARCHAR(150) NOT NULL,
                      descricao TEXT NOT NULL,
                      preco NUMERIC(10, 2) NOT NULL,
                      categoria_id INT NOT NULL,
                      url_imagem VARCHAR(255),
                      desenvolvedora VARCHAR(100),
                      requisitos_minimos TEXT,
                      requisitos_recomendados TEXT,

                      CONSTRAINT fk_jogo_categoria
                          FOREIGN KEY (categoria_id)
                              REFERENCES categoria(id)
);

CREATE TABLE biblioteca (
                            id SERIAL PRIMARY KEY,
                            usuario_id INT NOT NULL,
                            jogo_id INT NOT NULL,
                            data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                            CONSTRAINT fk_biblioteca_usuario
                                FOREIGN KEY (usuario_id)
                                    REFERENCES usuario(id),

                            CONSTRAINT fk_biblioteca_jogo
                                FOREIGN KEY (jogo_id)
                                    REFERENCES jogo(id),

                            CONSTRAINT uk_usuario_jogo
                                UNIQUE (usuario_id, jogo_id)
);

INSERT INTO usuario (nome, email, senha, perfil, apelido, foto_url)
VALUES
    ('Admin Master', 'admin@jpgames.com', '1234', 'admin', 'Admin Master', 'img/avatar1.png');

INSERT INTO categoria (nome)
VALUES
    ('Ação'),
    ('Terror'),
    ('RPG'),
    ('Aventura'),
    ('Estratégia');

INSERT INTO jogo (
    titulo,
    descricao,
    preco,
    categoria_id,
    url_imagem,
    desenvolvedora,
    requisitos_minimos,
    requisitos_recomendados
)
VALUES
    (
        'Helldivers 2',
        'Jogo de tiro cooperativo focado em espalhar a democracia gerenciada.',
        199.90,
        1,
        'img/helldivers2.png',
        'Arrowhead Game Studios',
        'SO: Windows 10 64 bits
    Processador: Intel Core i7-4790K ou AMD Ryzen 5 1500X
    Memória: 8 GB RAM
    Placa de vídeo: NVIDIA GeForce GTX 1050 Ti ou AMD Radeon RX 470
    Armazenamento: 135 GB disponíveis',
        'SO: Windows 10 64 bits
    Processador: Intel Core i7-9700K ou AMD Ryzen 7 3700X
    Memória: 16 GB RAM
    Placa de vídeo: NVIDIA GeForce RTX 2060 ou AMD Radeon RX 6600XT
    Armazenamento: 135 GB disponíveis'
    ),
    (
        'Outlast',
        'Jogo de terror em primeira pessoa focado em investigação e sobrevivência.',
        53.00,
        2,
        'img/outlast.png',
        'Red Barrels',
        'SO: Windows 7
    Processador: Intel Core 2 Duo
    Memória: 2 GB RAM
    Placa de vídeo: 512 MB
    Armazenamento: 5 GB disponíveis',
        'SO: Windows 10
    Processador: Intel Core i5
    Memória: 4 GB RAM
    Placa de vídeo: 1 GB
    Armazenamento: 5 GB disponíveis'
    ),
    (
        'Baldurs Gate 3',
        'RPG de fantasia com escolhas, exploração e combate estratégico.',
        134.00,
        3,
        'img/baldurs.png',
        'Larian Studios',
        'SO: Windows 10 64 bits
    Processador: Intel i5-4690 ou AMD FX 8350
    Memória: 8 GB RAM
    Placa de vídeo: GTX 970 ou RX 480
    Armazenamento: 150 GB disponíveis',
        'SO: Windows 10 64 bits
    Processador: Intel i7-8700K ou AMD Ryzen 5 3600
    Memória: 16 GB RAM
    Placa de vídeo: RTX 2060 Super ou RX 5700 XT
    Armazenamento: 150 GB disponíveis'
    );