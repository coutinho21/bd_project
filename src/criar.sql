PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS EQUIPA;
DROP TABLE IF EXISTS JOGADOR;
DROP TABLE IF EXISTS JOGO;
DROP TABLE IF EXISTS EPOCA;
DROP TABLE IF EXISTS JOGOEQUIPAEPOCA;
DROP TABLE IF EXISTS ESTATISTICAS;
DROP TABLE IF EXISTS GOLO;
DROP TABLE IF EXISTS OUTRO;
DROP TABLE IF EXISTS CARTAO;
DROP TABLE IF EXISTS SUBSTITUICAO;
DROP TABLE IF EXISTS ENTRADACOPALIBERTADORES;
DROP TABLE IF EXISTS QUALIFICACAOCOPALIBERTADORES;
DROP TABLE IF EXISTS ENTRADACOPASULAMERICANA;
DROP TABLE IF EXISTS DESPROMOCAO;

CREATE TABLE EQUIPA
   (	
	IDEQUIPA INTEGER PRIMARY KEY NOT NULL,
	NOME TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL,
	PONTOS INT NOT NULL,
	NUMJOGOS INT NOT NULL,
	GOLOSMARCADOS INT NOT NULL,
	GOLOSSOFRIDOS INT NOT NULL,
	DIFERENCAGOLOS INT NOT NULL);

CREATE TABLE JOGADOR
	(
	IDJOGADOR INTEGER PRIMARY KEY NOT NULL,
	NOME TEXT NOT NULL,
	IDADE INT NOT NULL,
	NUMERO INT NOT NULL,
	POSICAO TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
    FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA));

CREATE TABLE EPOCA
	(
	IDEPOCA INTEGER PRIMARY KEY NOT NULL,
	ANO INT NOT NULL);

CREATE TABLE JOGO
	(
	IDJOGO INTEGER PRIMARY KEY NOT NULL,
	JORNADA INT NOT NULL,
	DIA DATE NOT NULL,
	RESULTADO TEXT NOT NULL,
	ESTADIO TEXT NOT NULL);

CREATE TABLE JOGOEQUIPAEPOCA
	(
	IDJOGO INT NOT NULL,
	IDEPOCA INT NOT NULL,
	IDEQUIPACASA INT NOT NULL,
	IDEQUIPAVISITANTE INT NOT NULL,
	PRIMARY KEY(IDJOGO,IDEPOCA), FOREIGN KEY (IDEQUIPACASA) REFERENCES EQUIPA(IDEQUIPA), 
	FOREIGN KEY (IDEQUIPAVISITANTE) REFERENCES EQUIPA(IDEQUIPA));

CREATE TABLE ESTATISTICAS
	(
	IDESTATISTICAS INTEGER PRIMARY KEY NOT NULL,
	POSSEBOLA INT NOT NULL,
	CANTOS INT NOT NULL,
	FALTAS INT NOT NULL,
	REMATES INT NOT NULL,
	REMATESCOLOCADOS INT NOT NULL,
	IDEQUIPA INT NOT NULL,
	IDJOGO INT NOT NULL,
	FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA),
	FOREIGN KEY (IDJOGO) REFERENCES JOGO(IDJOGO));

CREATE TABLE GOLO
	(
	IDGOLO INTEGER PRIMARY KEY NOT NULL,
	MINUTO INT NOT NULL,
	DESCRICAO TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	IDJOGO INT NOT NULL,
	FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR),
	FOREIGN KEY (IDJOGO) REFERENCES JOGO(IDJOGO));

CREATE TABLE OUTRO
	(
	IDOUTRO INTEGER PRIMARY KEY NOT NULL,
	MINUTO INT NOT NULL,
	DESCRICAO TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	IDJOGO INT NOT NULL,
	FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR),
	FOREIGN KEY (IDJOGO) REFERENCES JOGO(IDJOGO));

CREATE TABLE SUBSTITUICAO
	(
	IDSUBSTITUICAO INTEGER PRIMARY KEY NOT NULL,
	MINUTO INT NOT NULL,
	IDJOGADORENTRA TEXT NOT NULL,
	IDJOGADORSAI TEXT NOT NULL,
	IDJOGO INT NOT NULL,
	FOREIGN KEY (IDJOGADORENTRA) REFERENCES JOGADOR(IDJOGADOR),
	FOREIGN KEY (IDJOGADORSAI) REFERENCES JOGADOR(IDJOGADOR),
	FOREIGN KEY (IDJOGO) REFERENCES JOGO(IDJOGO));

CREATE TABLE CARTAO
	(
	IDCARTAO INTEGER PRIMARY KEY NOT NULL,
	MINUTO INT NOT NULL,
	COR TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	IDJOGO INT NOT NULL,
	FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR),
	FOREIGN KEY (IDJOGO) REFERENCES JOGO(IDJOGO));

CREATE TABLE ENTRADACOPALIBERTADORES
	(
	IDENTRADACOPALIBERTADORES INTEGER PRIMARY KEY NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL CHECK(CLASSIFICACAO <= 4 AND CLASSIFICACAO > 0),
	FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA),
	FOREIGN KEY (CLASSIFICACAO) REFERENCES EQUIPA(CLASSIFICACAO));

CREATE TABLE QUALIFICACAOCOPALIBERTADORES
	(
	IDQUALIFICACAOCOPALIBERTADORES INTEGER PRIMARY KEY NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL CHECK(CLASSIFICACAO == 5 OR CLASSIFICACAO == 6),
	FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA),
	FOREIGN KEY (CLASSIFICACAO) REFERENCES EQUIPA(CLASSIFICACAO));

CREATE TABLE ENTRADACOPASULAMERICANA
	(
	IDENTRADACOPASULAMERICANA INTEGER PRIMARY KEY NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL CHECK(CLASSIFICACAO >= 7 AND CLASSIFICACAO <= 12),
	FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA),
	FOREIGN KEY (CLASSIFICACAO) REFERENCES EQUIPA(CLASSIFICACAO));

CREATE TABLE DESPROMOCAO
	(
	IDDESPROMOCAO INTEGER PRIMARY KEY NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL CHECK(CLASSIFICACAO >= 17 AND CLASSIFICACAO <= 20),
	FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA),
	FOREIGN KEY (CLASSIFICACAO) REFERENCES EQUIPA(CLASSIFICACAO));
