.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Verificar se o jogador existe quando é marcado um golo. Se não existir, levanta um erro.

CREATE TRIGGER IF NOT EXISTS existsScorer
    BEFORE INSERT ON GOLO
BEGIN
    SELECT
        CASE
	    WHEN NOT EXISTS (SELECT * FROM JOGADOR WHERE IDJOGADOR = NEW.IDJOGADOR) THEN
            RAISE(ABORT, "Jogador não existe.")
        END;
END;

