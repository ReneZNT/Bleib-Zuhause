--Criacao da tabela empresa
create table empresa (
	cnpjemp numeric(14) constraint empresa_pk primary key,
	nomfanemp varchar(40) not null,
	gestemp integer not null,
	razsocemp integer not null,
	ruaendemp integer not null,
	emailemp varchar(100) not null,
	telcontemp numeric(20) not null,
	tipoemp char(1) not null
);

CREATE TABLE cep (
	cep integer NOT NULL CONSTRAINT cep_pk PRIMARY KEY, 
	codCid integer
);

CREATE TABLE cidade (
	codCid integer NOT NULL,
	nomcid varchar(255) NOT NULL,
	codEst
);

CREATE TABLE triagem(
	codtri integer constraint triagem_pk primary key,
	pesopac real (6) NOT NULL,
	altpac integer NOT NULL,
	alerpac char(1) NOT NULL,
	compac char(2) NOT NULL,
	tipcompac varchar(255) NOT NULL,
	papac NUMERIC (5,2) NOT NULL,
	cpfpac2 integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac2)
);

CREATE TABLE sintoma(
	desc varchar(255) NOT NULL,
	valor integer NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac)
);

CREATE TABLE comorbidade(
codcom integer NOT NULL, 
descom integer NOT NULL,
valor integer NOT NULL,
cpfpac integer NOT NULL constraint paciente_pk,
REFERENCES paciente(cpfpac)
);

CREATE TABLE triagem_sintoma(
CONSTRAINT codsin integer FOREIGN KEY (sintoma),
REFERENCES sintoma (codsin),
CONSTRAINT codtri integer FOREIGN KEY (triagem),
REFERENCES triagem (codtri)
);

CREATE TABLE sintoma(
	codsin integer constraint paciente_pk primary key,
	DESC varchar(255) NOT NULL, 
	valor integer NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac)
);

CREATE TABLE gravidade(
	codgrav integer NOT NULL, 
	resultado char (1) NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac)
);

CREATE TABLE teste(
	idteste integer constraint teste_pk primary key,
	tipteste integer NOT NULL, 
	resultado char (1) NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac)
);

CREATE TABLE vacina(
	idvac integer constraint vacina_pk primary key,
	tipvac varchar(255) NOT NULL, 
	qtddose integer NOT NULL,
	datadose integer NOT NULL,
	cpfpac integer NOT NULL constraint paciente_pk,
	REFERENCES paciente(cpfpac)
);
CREATE TABLE tipo_de_paciente(
	codtippac integer constraint tipo_de_paciente_pk primary key,
	DESC varchar(255) NOT NULL,
);

