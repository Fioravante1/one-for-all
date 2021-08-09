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
INSERT INTO
  albuns (nome_album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
INSERT INTO
  musicas (nome_musica, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);
