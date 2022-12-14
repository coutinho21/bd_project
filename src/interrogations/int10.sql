.mode columns
.headers on
.nullvalue NULL

SELECT JOGO.RESULTADO AS "Resultado", E1.NOME AS "Equipa Casa", E2.NOME AS "Equipa Visitante", JOGO.ESTADIO as "Estádio"
FROM JOGO
JOIN JOGOEQUIPAEPOCA ON JOGO.IDJOGO = JOGOEQUIPAEPOCA.IDJOGO
JOIN EQUIPA AS E1 ON JOGOEQUIPAEPOCA.IDEQUIPACASA = E1.IDEQUIPA
JOIN EQUIPA AS E2 ON JOGOEQUIPAEPOCA.IDEQUIPAVISITANTE = E2.IDEQUIPA
WHERE JOGO.DIA = "2022-05-12"