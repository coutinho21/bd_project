.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ""
.print "Criando um novo jogador..."
.print ""

INSERT INTO JOGADOR VALUES (1400, "Mário Miguel da Silva", "31 anos", 32, "Avançado", 2);

.print ""
.print "Jogador adicionado:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 1400;

.print ""
.print "Criando um novo jogador..."
.print ""

INSERT INTO JOGADOR VALUES (1300, "Luís Silveira", "56 anos", 56, "Médio", 15);

.print ""
.print "Jogador Não adicionado."
.print ""
