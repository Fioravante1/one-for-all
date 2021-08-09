CREATE VIEW faturamento_atual AS
SELECT
  MIN(pv.plano_valor) AS 'faturamento_minimo',
  MAX(pv.plano_valor) AS 'faturamento_maximo',
  ROUND(SUM(pv.plano_valor) / COUNT(u.usuario_id), 2) AS 'faturamento_medio',
  SUM(pv.plano_valor) AS 'faturamento_total'
FROM
  planos AS pv
  INNER JOIN usuarios AS u ON pv.plano_id = u.plano_id;
