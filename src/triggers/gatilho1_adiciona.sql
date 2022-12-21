.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Verificar se o número da camisola de um jogador é valido. Se não for, levanta um erro.

CREATE TRIGGER IF NOT EXISTS numberPlayer
BEFORE INSERT ON JOGADOR
BEGIN
SELECT
    CASE
    WHEN NEW.NUMERO NOT BETWEEN 1 AND 99 THEN
        RAISE(ABORT, 'Número Inválido')
    END;
END;