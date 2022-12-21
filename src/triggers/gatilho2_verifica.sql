.mode columns
.header on
.nullvalue NULL
BEGIN TRANSACTION

PRAGMA foreign_keys = ON;

.print ""
.print "Estado inicial:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 117;

.print ""
.print "Criando um novo golo..."
.print ""

INSERT INTO GOLO VALUES (8, 35, "Gustavo Poffo marcou um golo de trivela.", 117, 108);

.print ""
.print "Golo adicionado:"
.print ""

SELECT * FROM GOLO WHERE IDGOLO = 8;

.print ""
.print "Criando um novo golo..."
.print ""

INSERT INTO GOLO VALUES (10, 93, "Rodrigo Dias marcou o seu primeiro golo na época", 1100, 200);

.print ""
.print "Golo não adicionado."
.print ""