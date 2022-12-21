.mode columns
.headers on
.nullvalue NULL

SELECT NOME AS "Nome", CLASSIFICACAO AS "Classificação"
FROM EQUIPA 
ORDER BY CLASSIFICACAO
LIMIT 5