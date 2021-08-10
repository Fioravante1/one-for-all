DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT a.nome_artista AS artista, na.nome_album AS album
FROM artistas AS a
INNER JOIN albuns AS na
WHERE a.artista_id = na.artista_id AND a.nome_artista = nome_artista
ORDER BY album;
END $$
DELIMITER ;
