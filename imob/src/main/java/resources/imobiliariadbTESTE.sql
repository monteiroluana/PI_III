Create DATABASE imobiliariadbTESTE;
USE imobiliariadbTESTE;

CREATE TABLE imobiliariadbTESTE.USUARIO(
	idUsuario      INTEGER NOT NULL AUTO_INCREMENT,
	nome           VARCHAR(255),
        email          VARCHAR(255),
	login          VARCHAR(30),
	senha          VARCHAR(28),
	grupoFilial    VARCHAR(50),
	departamento   VARCHAR(50),
	cargo          VARCHAR(50),
        enable         BOOLEAN,	
        CONSTRAINT PK_USUARIO PRIMARY KEY (idUsuario)
);


CREATE TABLE imobiliariadbTESTE.CLIENTE(
	idCliente      INTEGER NOT NULL AUTO_INCREMENT,
	nome           VARCHAR(255),
	dataNasc       DATE,
	cpf            VARCHAR(11),
	sexo           VARCHAR(15),
	cep            VARCHAR(8),
	rua            VARCHAR(255),
	num            VARCHAR(10),
	complemento    VARCHAR(255),
	bairro         VARCHAR(255),
	cidade         VARCHAR(255),
	uf             VARCHAR(2),	
	telefone       VARCHAR(15),
	celular        VARCHAR(15),
	email          VARCHAR(255),
        enable         BOOLEAN,
        CONSTRAINT PK_CLIENTE PRIMARY KEY (idCliente)
	
);


CREATE TABLE imobiliariadbTESTE.IMOVEL (
	idImovel       INTEGER NOT NULL AUTO_INCREMENT,
	idCliente      INTEGER NOT NULL,
	codImovel      VARCHAR(255) NOT NULL,
	dataCad        DATE NOT NULL,
	servico        VARCHAR(255),
	categoria      VARCHAR(255),
	tipo           VARCHAR(255),
	quartos        INTEGER,
	banheiros      INTEGER,
	suites         INTEGER,
	vagasGaragem   INTEGER,
	areaUtil       DOUBLE,
	areaTotal      DOUBLE,
	informacao     VARCHAR(255),
	cep            VARCHAR(8),
	rua            VARCHAR(255),
	num            VARCHAR(10),
	complemento    VARCHAR(255),
	bairro         VARCHAR(255),
	cidade         VARCHAR(255),
	uf             VARCHAR(2),
	valor          DOUBLE,
	condominio     DOUBLE,
	iptu           DOUBLE,
	status         VARCHAR(255),
	enable         BOOLEAN,
	CONSTRAINT PK_IMOVEL PRIMARY KEY (idImovel),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
);


CREATE TABLE imobiliariadbTESTE.CONTRATO (
	idContrato     INTEGER NOT NULL AUTO_INCREMENT,
	codContrato    VARCHAR(255) NOT NULL,
	idImovel       INTEGER NOT NULL,
	idCliente      INTEGER NOT NULL,
	dataContrato   DATE NOT NULL,
	tipoContrato   VARCHAR(255),
	dataInicial    DATE,
	dataFinal      DATE,
	enable         BOOLEAN,
	CONSTRAINT PK_IMOVEL PRIMARY KEY (idContrato),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY(idImovel) REFERENCES imovel(idImovel)
);



INSERT INTO imobiliariadbTESTE.USUARIO (nome,login,senha,email,grupoFilial,departamento,cargo,enable) VALUES
("Jonas Araujo","jonas.araujo","jonas","jonas@jonas.com","SãoPaulo","","",true),
("Bruna Sayuri","bruna.sayuri","bruna","bruna@bruna.com","RioDeJaneiro","","",true),
("Rodrigo Normando","rodrigo.normando","rodrigo","rodrigo@rodrigo.com","SãoPaulo","","",true);

INSERT INTO imobiliariadbTESTE.CLIENTE(cpf,nome,dataNasc,sexo,telefone,celular,email,cep,rua,bairro,cidade,uf,num,complemento,enable) VALUES
("99991111111","kunieda aoi","1996-07-17","fem","1155554444","11944445555","aoi@aoi.com","04444000","","","","","","",true);

