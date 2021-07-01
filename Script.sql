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

CREATE TABLE triagem_usuario_paciente (
	pesopac real (6) NOT NULL,
	altpac integer NOT NULL,
	alerpac char(1) NOT NULL,
	compac char(2) NOT NULL,
	tipcompac varchar(255) NOT NULL,
	papac NUMERIC (5,2) NOT NULL
	cpfpac integer NOT NULL constraint cadusuariopac_pk 
	REFERENCES cadastro_usuario_paciente(cpfpac);
	prontpac integer NOT NULL constraint cadusuariopac_pk 
	REFERENCES cadastro_usuario_paciente(prontpac)
	
);
