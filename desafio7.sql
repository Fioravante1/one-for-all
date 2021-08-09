CREATE VIEW perfil_artistas AS
SELECT
  a.nome_artista AS artista,
  na.nome_album AS album,
  COUNT(ui.usuario_id) AS seguidores
FROM
  artistas AS a
  INNER JOIN albuns AS na ON a.artista_id = na.artista_id
  INNER JOIN seguindo_artista AS ui ON ui.artista_id = na.artista_id
GROUP BY
  na.album_id
ORDEr BY
  seguidores DESC,
  artista,
  album;
