CREATE TABLE "Funcionario" (
    "Idfunc" int NOT NULL,
    "Nome" VARCHAR(30) NOT NULL,
    "Sobnome" VARCHAR(40) NOT NULL,
    "Cpf" varchar(11) NOT NULL,
    "Email" VARCHAR(30) NOT NULL,
    "Senha" VARCHAR(200) NOT NULL, 
    "Cep" varchar(8) NOT NULL,
    "End" VARCHAR(30) NOT NULL,
    "Tlf" VARCHAR(15),
    CONSTRAINT "pk_Funcionario" PRIMARY KEY (
        "Idfunc"
    )
);

CREATE TABLE "Viagem" (
    "Idvia" int NOT NULL,
    "Cid" varchar(200) NOT NULL,
    "Dtolta" date,
    "Dtsaida" date,
    "Obj" VARCHAR(200), 
    "Idfunc" int,
    CONSTRAINT "pk_Viagem" PRIMARY KEY (
        "Idvia"
    )
);

CREATE TABLE "Alimentacao" (
    "CoddespA" Int NOT NULL,
    "VlorpagoA" REAL NOT NULL,
    "DescA" TEXT NOT NULL,
    "CidntfisA" VARCHAR(200),
    "DtntfisA" Date NOT NULL,
    "Idvia" INT NOT NULL,
    CONSTRAINT "pk_Alimentacao" PRIMARY KEY (
        "Coddesp"
    )
);

CREATE TABLE "Transporte" (
    "CoddespT" Int NOT NULL,
    "VlorpagoT" REAL NOT NULL,
    "DescT" TEXT NOT NULL,
    "CidntfisT" VARCHAR(200),
    "DtntfisT" Date NOT NULL,
    "Idvia" INT NOT NULL,
    CONSTRAINT "pk_Transporte" PRIMARY KEY (
        "Coddesp"
    )
);

CREATE TABLE "Hospedagem"(
    "CoddespH" Int NOT NULL,
    "VlorpagoH" REAL NOT NULL,
    "DescH" TEXT NOT NULL,
    "CidntfisH" VARCHAR(200),
    "DtntfisH" Date NOT NULL,
    "Idvia" INT NOT NULL,
    CONSTRAINT "pk_Hospedagem" PRIMARY KEY (
        "Coddesp"
    )
);

CREATE TABLE "Compra"(
    "Codcomp" Int NOT NULL,
    "Dtcomp" DATE NOT NULL,
    "Loca" VARCHAR(300) NOT NULL,
    "Commi" REAL NOT NULL, 
    "Desc" VARCHAR(300),
    "Idvia" int,
    CONSTRAINT "pk_Compra" PRIMARY KEY (
        "Codcomp"
    )
);

CREATE TABLE "Cosmetico" (
    "Codprod" int NOT NULL,
    "Nomeprod" varchar(300) NOT NULL,
    "MarcaProd" varchar(300) NOT NULL,
    "Qtprod" int NOT NULL,
    "Prec" REAL NOT NULL,
    "Dtcomp" date NOT NULL,
    "Codcomp" int,
    CONSTRAINT "pk_Cosmetico" PRIMARY KEY (
        "Codprod"
    )
);

CREATE TABLE "Vestuario" (
    "Codprodv" int NOT NULL ,
    "Nomeprodv" varchar(300) NOT NULL,
    "MarcaProdv" varchar(300) NOT NULL,
    "Qtprodv" int NOT NULL,
    "Precv" REAL NOT NULL,
    "Dtcompv" date NOT NULL,
    "Codcomp" int,
    CONSTRAINT "pk_Vestuario" PRIMARY KEY (
        "Codprodv"
    )
);

ALTER TABLE "Viagem" ADD CONSTRAINT "fk_Viagem_Idfunc" FOREIGN KEY ("Idfunc")
REFERENCES "Funcionario" ("Idfunc");

ALTER TABLE "Alimentacao" ADD CONSTRAINT "fk_Alimentacao_Idvia" FOREIGN KEY ("Idvia") 
REFERENCES "Viagem" ("Idvia");

ALTER TABLE "Transporte" ADD CONSTRAINT "fk_Transporte_Idvia" FOREIGN KEY ("Idvia") 
REFERENCES "Viagem" ("Idvia");

ALTER TABLE "Hospedagem" ADD CONSTRAINT "fk_Hospedagem_Idvia" FOREIGN KEY ("Idvia") 
REFERENCES "Viagem" ("Idvia");

ALTER TABLE "Compra" ADD CONSTRAINT "fk_Compra_Idvia" FOREIGN KEY ("Idvia") 
REFERENCES "Viagem" ("Idvia");

ALTER TABLE "Cosmetico" ADD CONSTRAINT "fk_Cosmetico_Codcomp" FOREIGN KEY ("Codcomp") 
REFERENCES "Compra" ("Codcomp");

ALTER TABLE "Vestuario" ADD CONSTRAINT "fk_Vestuario_Codcomp" FOREIGN KEY ("Codcomp") 
REFERENCES "Compra" ("Codcomp");