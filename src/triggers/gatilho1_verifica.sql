.mode columns
.header on
.nullvalue NULL
BEGIN TRANSACTION

PRAGMA foreign_keys = ON;

.print ""
.print "Initial state:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 2000;


.print ""
.print "Trying to insert Player with valid number..."
.print ""

INSERT INTO JOGADOR VALUES (2000, "Jacinto Pinto", "40 anos", 4, "Defesa", 3);

.print ""
.print "Inserted with sucess:"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 2000;

.print ""
.print "Trying to insert Player with invalid number..."
.print ""

INSERT INTO JOGADOR VALUES (2001, "Seixo Paulo", "20 anos", 300, "Avançado", 5);

.print ""
.print "Not inserted due to trigger"
.print ""

SELECT * FROM JOGADOR WHERE IDJOGADOR = 2001;
