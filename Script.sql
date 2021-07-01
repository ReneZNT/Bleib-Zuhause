--Criacao da tabela paciente
CREATE TABLE tipo_de_paciente(
	codtippac integer constraint tipo_de_paciente_pk primary key,
	descr varchar(255) NOT NULL
);

create table estado(
	codest integer constraint estado_pk primary key,
	uf varchar(255) not null
);
create TABLE cidade (
	codcid integer NOT null constraint cidade_pk primary key,
	nomcid varchar(255) NOT NULL,
	codest integer not null,
	constraint cid_codest_fk foreign key(codest) references estado(codest)
);

CREATE TABLE cep (
	codcep integer NOT NULL CONSTRAINT cep_pk PRIMARY KEY, 
	codcid integer NOT null,
	constraint cidade_fk foreign key(codcid) REFERENCES cidade(codcid)
);

create table empresa (
	cnpjemp numeric(14) constraint empresa_pk primary key,
	nomfanemp varchar(40) not null,
	gestemp integer not null,
	razsocemp integer not null,
	ruaendemp integer not null,
	emailemp varchar(100) not null,
	telcontemp numeric(20) not null,
	tipoemp char(1) not null,
	codcep integer not null,
	constraint codcep_fk foreign key(codcep) REFERENCES cep(codcep)
);

create table paciente (
	cpfpac integer constraint paciente_pk primary key,
	prontpac numeric(10) not null,
	datnaspac date not null,
	rgpac numeric(10) not null,
	cnspac integer not null,
	filipac varchar(255) not null,
	endpac varchar(40) not null,
	telcontpac varchar(40) not null,
	sexpac char(1) constraint sexpac_ck check (sexpac in ('F', 'M')),
	expcadpac date not null,
	escolpac integer,
	cathiepac integer not null,
	cnpjemp numeric(14) NOT null,
	constraint empresa_fk foreign key(cnpjemp) REFERENCES empresa(cnpjemp),
	codcep integer not null,
	constraint codcep_fk foreign key(codcep) REFERENCES cep(codcep),
	codtippac integer NOT null,
	constraint tipo_de_paciente_pk foreign key(codtippac) REFERENCES tipo_de_paciente(codtippac)
);

CREATE TABLE sintoma(
	codsin integer constraint sintoma_pk primary key,
	descr varchar(255) NOT NULL,
	valor integer NOT NULL,
	cpfpac integer NOT null,
	constraint paciente_fk foreign key(cpfpac) REFERENCES paciente(cpfpac)
);

CREATE TABLE triagem (
	codtri integer constraint triagem_pk primary key,
	pesopac real NOT NULL,
	altpac integer NOT NULL,
	alerpac char(1) NOT NULL,
	compac char(2) NOT NULL,
	tipcompac varchar(255) NOT NULL,
	papac NUMERIC (5,2) NOT NULL,
	cpfpac integer NOT null,
	constraint paciente_fk foreign key(cpfpac) REFERENCES paciente(cpfpac)
);

CREATE TABLE triagem_sintoma(
codsin integer,
constraint trs_codsin_fk FOREIGN KEY(codsin)
REFERENCES sintoma(codsin),
codtri integer,
constraint tri_codsin_fk FOREIGN KEY(codtri)
REFERENCES triagem(codtri)
);

--codsin integer constraint trs_codsin_fk references sintoma(codsin),
--codtri integer constraint tri_codsin_fk references triagem(codtri)
CREATE TABLE comorbidade(
	codcom integer NOT NULL, 
	desccom integer NOT NULL,
	valor integer NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);

CREATE TABLE gravidade(
	codgrav integer NOT NULL, 
	resultado char (1) NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);


CREATE TABLE teste(
	idteste integer constraint teste_pk primary key,
	tipteste integer NOT NULL, 
	resultado char (1) NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);

CREATE TABLE vacina(
	idvac integer constraint vacina_pk primary key,
	tipvac varchar(255) NOT NULL, 
	qtddose integer NOT NULL,
	datadose integer NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);


