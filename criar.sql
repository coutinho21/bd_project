PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE EQUIPA
   (	
	IDEQUIPA TEXT NOT NULL,
	NOME TEXT NOT NULL,
	CLASSIFICACAO INT NOT NULL,
	PONTOS INT NOT NULL,
	NUMJOGOS INT NOT NULL,
	GOLOSMARCADOS INT NOT NULL,
	GOLOSSOFRIDOS INT NOT NULL,
	DIFERENCAGOLOS INT NOT NULL,
    PRIMARY KEY (IDEQUIPA));

CREATE TABLE JOGADOR
	(
	IDJOGADOR TEXT NOT NULL,
	NOME TEXT NOT NULL,
	IDADE INT NOT NULL,
	NUMERO INT NOT NULL,
	NACIONALIDADE TEXT NOT NULL,
	NUMGOLOS INT NOT NULL,
	NUMASSISTENCIAS INT NOT NULL,
	NUMAMARELOS INT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
    PRIMARY KEY (IDJOGADOR), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA));

CREATE TABLE EPOCA
	(
	IDEPOCA TEXT NOT NULL,
	ANO INT NOT NULL,
	PRIMARY KEY(IDEPOCA)
);

CREATE TABLE JOGO
	(
	IDJOGO TEXT NOT NULL,
	JORNADA INT NOT NULL,
	DIA DATE NOT NULL,
	RESULTADO TEXT NOT NULL,
	PRIMARY KEY (IDJOGO)
);

CREATE TABLE JOGOEQUIPAEPOCA
	(
	IDJOGO TEXT NOT NULL,
	IDEPOCA TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	IDEQUIPA2 TEXT NOT NULL,
	PRIMARY KEY(IDJOGO,IDEPOCA), FOREIGN KEY (IDEQUIPA,IDEQUIPA2) REFERENCES EQUIPA(IDEQUIPA,IDEQUIPA)
);

CREATE TABLE EQUIPAARBITRAGEM
	(
	IDEQUIPAARBITRAGEM TEXT NOT NULL,
	ARBITRO_PRINCIPAL TEXT NOT NULL,
	ARBITROLINHA1 TEXT NOT NULL,
	ARBITROLINHA2 TEXT NOT NULL,
	ARBITRO4 TEXT NOT NULL,
	VARPRINCIPAL TEXT NOT NULL,
	VARASSISTENTE TEXT NOT NULL,
	PRIMARY KEY(IDEQUIPAARBITRAGEM)
);

CREATE TABLE EQUIPATECNICA
	(
	IDEQUIPATECNICA TEXT NOT NULL,
	TREINADORPRINCIPAL TEXT NOT NULL,
	TREINADORADJUNTO TEXT NOT NULL,
	TREINADORGR TEXT NOT NULL,
	DIRETORDESPORTIVO TEXT NOT NULL,
	ANALISTA TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	PRIMARY KEY(IDEQUIPATECNICA), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA)
);

CREATE TABLE ESTADIO
	(
	IDESTADIO TEXT NOT NULL,
	NOME TEXT NOT NULL,
	LOCALIZACAO TEXT NOT NULL,
	CAPACIDADE BIGINT NOT NULL,
	PRIMARY KEY(IDESTADIO)
);

CREATE TABLE ESTATISTICAS
	(
	IDESTATISTICAS TEXT NOT NULL,
	POSSEBOLA FLOAT NOT NULL,
	CANTOS INT NOT NULL,
	LIVRES INT NOT NULL,
	REMATES INT NOT NULL,
	REMATESCOLOCADOS INT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	PRIMARY KEY (IDESTATISTICAS), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA)
);

CREATE TABLE GOLO
	(
	IDGOLO TEXT NOT NULL,
	MINUTO TIME NOT NULL,
	DESCRICAO TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	PRIMARY KEY (IDGOLO), FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR)
);

CREATE TABLE OUTRO
	(
	IDOUTRO TEXT NOT NULL,
	MINUTO TIME NOT NULL,
	DESCRICAO TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	PRIMARY KEY(IDOUTRO), FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR)
);

CREATE TABLE SUBSTITUICAO
	(
	IDSUBSTITUICAO TEXT NOT NULL,
	MINUTO TIME NOT NULL,
	IDJOGADORENTRA TEXT NOT NULL,
	IDJOGADORSAI TEXT NOT NULL,
	PRIMARY KEY(IDSUBSTITUICAO), FOREIGN KEY (IDJOGADORENTRA,IDJOGADORSAI) REFERENCES JOGADOR(IDJOGADOR,IDJOGADOR)
);

CREATE TABLE CARTAO
	(
	IDCARTAO TEXT NOT NULL,
	MINUTO TIME NOT NULL,
	COR TEXT NOT NULL,
	IDJOGADOR TEXT NOT NULL,
	PRIMARY KEY(IDCARTAO), FOREIGN KEY (IDJOGADOR) REFERENCES JOGADOR(IDJOGADOR)
);

CREATE TABLE ENTRADACOPALIBERTADORES
	(
	IDENTRADACOPALIBERTADORES TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	PRIMARY KEY(IDENTRADACOPALIBERTADORES), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA)
);

CREATE TABLE ENTRADACOPASULAMERICANA
	(
	IDENTRADACOPASULAMERICANA TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	PRIMARY KEY(IDENTRADACOPASULAMERICANA), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA)
);

CREATE TABLE DESPROMOCAO
	(
	IDDESPROMOCAO TEXT NOT NULL,
	IDEQUIPA TEXT NOT NULL,
	PRIMARY KEY(IDDESPROMOCAO), FOREIGN KEY (IDEQUIPA) REFERENCES EQUIPA(IDEQUIPA)
);
