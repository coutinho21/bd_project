.mode columns
.headers on
.nullvalue NULL

SELECT NOME, CLASSIFICACAO, DIFERENCAGOLOS
FROM EQUIPA
WHERE DIFERENCAGOLOS < 0