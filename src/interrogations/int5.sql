.mode columns
.headers on
.nullvalue NULL

SELECT NOME AS "Nome", CLASSIFICACAO AS "Classificação", DIFERENCAGOLOS AS "Diferença de Golos"
FROM EQUIPA
WHERE DIFERENCAGOLOS < 0