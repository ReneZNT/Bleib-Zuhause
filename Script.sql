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
