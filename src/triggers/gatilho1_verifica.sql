.mode columns
.header on
.nullvalue NULL
BEGIN TRANSACTION

PRAGMA foreign_keys = ON;

.print ""
.print "Estado inicial:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 2000;


.print ""
.print "Tentando adicionar jogador com número válido..."
.print ""

INSERT INTO JOGADOR VALUES (2000, "André Camalãeo", "40 anos", 4, "Defesa", 3);

.print ""
.print "Jogador adicionado:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 2000;

.print ""
.print "Tentando adicionar jogador com número inválido..."
.print ""

INSERT INTO JOGADOR VALUES (2001, "Paulo Seixo", "20 anos", 300, "Avançado", 5);

.print ""
.print "Não adicionado."
.print ""
