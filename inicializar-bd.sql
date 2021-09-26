DROP DATABASE IF EXISTS `test-database`;
CREATE DATABASE IF NOT EXISTS `test-database`;

-- INÍCIO DA CRIAÇÃO DE TABELAS
CREATE TABLE IF NOT EXISTS `test-database`.`generos` (
	id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `test-database`.`empresas` (
	id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `test-database`.`jogos` (
	id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    empresa BIGINT,
    FOREIGN KEY(empresa) REFERENCES `empresas`(id)
    ON DELETE SET NULL,
    nome VARCHAR(100),
    dt_lancamento DATE
);

CREATE TABLE IF NOT EXISTS `test-database`.`generos_dos_jogos` (
	jogo BIGINT,
    genero BIGINT,
    FOREIGN KEY(jogo) REFERENCES `jogos`(id)
    ON DELETE CASCADE,
    FOREIGN KEY(genero) REFERENCES `generos`(id)
    ON DELETE CASCADE,
    PRIMARY KEY(jogo, genero)
);

CREATE TABLE IF NOT EXISTS `test-database`.`empresas_dos_jogos` (
	jogo BIGINT,
    empresa BIGINT,
    FOREIGN KEY(jogo) REFERENCES `jogos`(id)
    ON DELETE CASCADE,
    FOREIGN KEY(empresa) REFERENCES `empresas`(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `test-database`.`usuarios` (
	id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS `test-database`.`jogos_dos_usuarios` (
	usuario BIGINT,
    jogo BIGINT,
    FOREIGN KEY(usuario) REFERENCES `usuarios`(id)
    ON DELETE CASCADE,
    FOREIGN KEY(jogo) REFERENCES `jogos`(id)
    ON DELETE CASCADE,
    PRIMARY KEY(usuario, jogo)
);
-- FIM DA CRIAÇÃO DE TABELAS


