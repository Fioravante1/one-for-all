CREATE VIEW top_2_hits_do_momento AS
SELECT
  m.nome_musica AS cancao,
  COUNT(sa.musica_id) AS reproducoes
FROM
  musicas AS m
  INNER JOIN historico AS sa ON m.musica_id = sa.musica_id
GROUP BY
  cancao
ORDER BY
  reproducoes DESC,
  cancao
LIMIT
  2;
