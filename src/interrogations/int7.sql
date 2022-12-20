.mode columns
.headers on
.nullvalue NULL

SELECT NOME, IDADE, NUMERO
FROM JOGADOR WHERE POSICAO = "Avançado" AND CAST(SUBSTR(IDADE, 1, 2) as INT) > 30 ORDER BY 1;