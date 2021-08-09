DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_plano VARCHAR(50) NOT NULL,
  plano_valor DECIMAL(5, 2) NOT NULL
) engine = InnoDB;
CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;
CREATE TABLE artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(50) NOT NULL
) engine = InnoDB;
CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;
CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT NOT NULL,
  nome_musica VARCHAR(50) NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;
CREATE TABLE historico(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY(musica_id) REFERENCES musicas(musica_id),
  CONSTRAINT PRIMARY KEY(usuario_id, musica_id)
) engine = InnoDB;
CREATE TABLE seguindo_artista(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
) engine = InnoDB;
INSERT INTO
  planos (tipo_plano, plano_valor)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('familiar', 7.99);
INSERT INTO
  usuarios (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
INSERT INTO
  artistas (nome_artista)
VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong');
