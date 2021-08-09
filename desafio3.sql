CREATE VIEW historico_reproducao_usuarios AS
SELECT
  u.nome AS 'usuario',
  m.nome_musica AS 'nome'
FROM
  usuarios AS u
  INNER JOIN historico AS us ON u.usuario_id = us.usuario_id
  INNER JOIN musicas AS m ON us.musica_id = m.musica_id
ORDER BY
  usuario,
  nome;
