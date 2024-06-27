CREATE TABLE funcionario (
    idfunc int NOT NULL,
    nome VARCHAR(30) NOT NULL,
    Sobnome VARCHAR(40) NOT NULL,
    cpf varchar(11) NOT NULL,
    email VARCHAR(30) NOT NULL,
    senha VARCHAR(200) NOT NULL, 
    cep varchar(8) NOT NULL,
    en VARCHAR(30) NOT NULL,
    tlf VARCHAR(15),
    CONSTRAINT pk_funcionario PRIMARY KEY (idfunc)
);

CREATE TABLE viagem (
    idvia int NOT NULL,
    cid varchar(200) NOT NULL,
    dtvolta date,
    dtsaida date,
    obj VARCHAR(200), 
    idf int NOT NULL,
    CONSTRAINT pk_viagem PRIMARY KEY (idvia),
    CONSTRAINT fk_viagem_idfunc FOREIGN KEY (idf) REFERENCES funcionario (idfunc)
);

CREATE TABLE alimentacao (
    coddesp Int NOT NULL,
    vlorpago REAL NOT NULL,
    descr TEXT NOT NULL,
    cidntfis VARCHAR(200),
    dtntfis Date NOT NULL,
    idv INT NOT NULL,
    CONSTRAINT pk_alimentacao PRIMARY KEY (coddesp),
    CONSTRAINT fk_alimentacao_idvia FOREIGN KEY (idv) REFERENCES viagem (idvia)
);

CREATE TABLE transporte (
    coddesp Int NOT NULL,
    vlorpago REAL NOT NULL,
    descr TEXT NOT NULL,
    cidntfis VARCHAR(200),
    dtntfis Date NOT NULL,
    idv INT NOT NULL,
    CONSTRAINT pk_transporte PRIMARY KEY (Coddesp),
    CONSTRAINT fk_transporte_idvia FOREIGN KEY (idv) REFERENCES viagem (idvia)
);

CREATE TABLE hospedagem (
    coddesp Int NOT NULL,
    vlorpago REAL NOT NULL,
    descr TEXT NOT NULL,
    cidntfis VARCHAR(200),
    dtntfis Date NOT NULL,
    idv INT NOT NULL,
    CONSTRAINT pk_hospedagem PRIMARY KEY (coddesp),
    CONSTRAINT fk_hospedagem_idvia FOREIGN KEY (idv) REFERENCES viagem (idvia)
);

CREATE TABLE compra (
    codcomp Int NOT NULL,
    dtcomp DATE NOT NULL,
    loca VARCHAR(300) NOT NULL,
    comi REAL NOT NULL, 
    descr VARCHAR(300),
    idv int,
    CONSTRAINT pk_compra PRIMARY KEY (codcomp),
    CONSTRAINT fk_compra_idvia FOREIGN KEY (idv) REFERENCES viagem (idvia) 
);

CREATE TABLE cosmetico (
    codprod int NOT NULL,
    nomeprod varchar(300) NOT NULL,
    marcaProd varchar(300) NOT NULL,
    qtprod int NOT NULL,
    prec REAL NOT NULL,
    dtcomp date NOT NULL,
    codc int,
    CONSTRAINT pk_cosmetico PRIMARY KEY (codprod),
    CONSTRAINT fk_cosmetico_codcomp FOREIGN KEY (codc) REFERENCES compra (codcomp) 

);

CREATE TABLE vestuario (
    codprodv int NOT NULL ,
    nomeprodv varchar(300) NOT NULL,
    marcaProdv varchar(300) NOT NULL,
    qtprodv int NOT NULL,
    precv REAL NOT NULL,
    dtcompv date NOT NULL,
    codcv int,
    CONSTRAINT pk_vestuario PRIMARY KEY (codprodv),
    CONSTRAINT fk_vestuario_codcomp FOREIGN KEY (codcv) REFERENCES compra (codcomp) 
);

