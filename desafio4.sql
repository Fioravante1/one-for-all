CREATE VIEW top_3_artistas AS
SELECT
  a.nome_artista AS 'artista',
  COUNT(ui.usuario_id) AS 'seguidores'
FROM
  artistas AS a
  INNER JOIN seguindo_artista AS ui ON a.artista_id = ui.artista_id
GROUP BY
  a.artistas
ORDER BY
  seguidores DESC,
  artista
LIMIT
  3;
