.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Verificar a idade de um jogador a ser inserido. Se a idade for maior ou igual a 50, levanta um erro e não insere.

CREATE TRIGGER checkIdadeJogador
AFTER INSERT ON JOGADOR
BEGIN
SELECT
    CASE
    WHEN CAST(SUBSTR(NEW.IDADE, 1, 2) AS INT) >= 50 THEN
        RAISE(ABORT, "Idade tem de ser menor que 50.")
    END;
END;
