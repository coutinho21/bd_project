.mode columns
.headers on
.nullvalue NULL

SELECT JOGO.RESULTADO AS "Resultado", E1.NOME AS 'Equipa Casa', E2.NOME AS 'Equipa Visitante', JOGO.JORNADA AS "Jornada"
FROM JOGO
JOIN JOGOEQUIPAEPOCA ON JOGO.IDJOGO = JOGOEQUIPAEPOCA.IDJOGO
JOIN EQUIPA AS E1 ON JOGOEQUIPAEPOCA.IDEQUIPACASA = E1.IDEQUIPA
JOIN EQUIPA AS E2 ON JOGOEQUIPAEPOCA.IDEQUIPAVISITANTE = E2.IDEQUIPA
WHERE SUBSTR(JOGO.RESULTADO, 1, 1) = SUBSTR(JOGO.RESULTADO, 3, 1) AND JOGO.JORNADA BETWEEN 1 AND 19
ORDER BY 4