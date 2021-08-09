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
  usuario VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;
