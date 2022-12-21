.mode columns
.headers on
.nullvalue NULL

SELECT NOME AS "Nome", IDADE AS "Idade", NUMERO AS "Número"
FROM JOGADOR 
WHERE POSICAO = "Avançado" AND CAST(SUBSTR(IDADE, 1, 2) as INT) > 30 
ORDER BY 1, 2