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
	gestemp varchar(255),
	razsocemp varchar(255) not null,
	ruaendemp varchar(255) not null,
	emailemp varchar(100) not null,
	telcontemp numeric(20) not null,
	tipoemp varchar(255) not null,
	codcep integer not null,
	constraint codcep_fk foreign key(codcep) REFERENCES cep(codcep)
);

create table paciente (
	cpfpac varchar(11) constraint paciente_pk primary key,
	nompac varchar(255) not null, 
	prontpac numeric(10) not null unique,
	datnaspac date not null,
	rgpac numeric(10) not null,
	cnspac integer not null unique,
	filipac varchar(255) not null,
	endpac varchar(40) not null,
	telcontpac varchar(40) not null,
	sexpac char(1) constraint sexpac_ck check (sexpac in ('F', 'M')),
	expcadpac date not null,
	escolpac varchar(255),
	cnpjemp numeric(14),
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
	cpfpac varchar(11) NOT null,
	constraint paciente_fk foreign key(cpfpac) REFERENCES paciente(cpfpac)
);


CREATE TABLE triagem (
	codtri integer constraint triagem_pk primary key,
	pesopac real NOT NULL,
	altpac integer NOT NULL,
	alerpac varchar(255) NOT NULL,
	compac char(1) NOT null constraint compac_ck check (compac in ('S', 'N')),
	papac NUMERIC (5,2) NOT NULL,
	cpfpac varchar(11) NOT null,
	constraint paciente_fk foreign key(cpfpac) REFERENCES paciente(cpfpac)
);

CREATE TABLE comorbidade(
	codcom integer NOT NULL, 
	desccom varchar(255) NOT NULL,
	valor integer NOT NULL,
	cpfpac varchar(11) NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);


CREATE TABLE triagem_sintoma(
codsin integer,
constraint trs_codsin_fk FOREIGN KEY(codsin)
REFERENCES sintoma(codsin),
codtri integer,
constraint tri_codsin_fk FOREIGN KEY(codtri)
REFERENCES triagem(codtri)
);

CREATE TABLE gravidade(
	codgrav integer NOT NULL, 
	resultado integer NOT NULL,
	cpfpac varchar(11) NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);

CREATE TABLE teste(
	idteste integer constraint teste_pk primary key,
	tipteste varchar(255) NOT NULL, 
	resultado char (1) NOT null constraint resultado_ck check (resultado in ('P', 'N')),
	cpfpac varchar(11) NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);


CREATE TABLE vacina(
	idvac integer constraint vacina_pk primary key,
	tipvac varchar(255) NOT NULL, 
	qtddose integer NOT NULL,
	datadose date NOT NULL,
	cpfpac varchar(11) NOT NULL constraint paciente_pk
	REFERENCES paciente(cpfpac)
);

--INSERÇÃO DE DADOS

--Tipo_de_Paciente

insert into tipo_de_paciente (codtippac, descr) values (0, 'Administrativo');
insert into tipo_de_paciente (codtippac, descr) values (1, 'Leitura');
insert into tipo_de_paciente (codtippac, descr) values (2, 'Privativo');

--Estados

insert into estado (codest, uf) values (0, 'SC');
insert into estado (codest, uf) values (1, 'RS');
insert into estado (codest, uf) values (2, 'PR');
insert into estado (codest, uf) values (3, 'RJ');
insert into estado (codest, uf) values (4, 'SP');
insert into estado (codest, uf) values (5, 'MS');
insert into estado (codest, uf) values (6, 'GO');
insert into estado (codest, uf) values (7, 'MT');
insert into estado (codest, uf) values (8, 'TO');
insert into estado (codest, uf) values (9, 'AC');
insert into estado (codest, uf) values (10, 'AL');
insert into estado (codest, uf) values (11, 'AP');
insert into estado (codest, uf) values (12, 'AN');
insert into estado (codest, uf) values (13, 'BA');
insert into estado (codest, uf) values (14, 'CE');
insert into estado (codest, uf) values (15, 'ES');
insert into estado (codest, uf) values (16, 'MA');
insert into estado (codest, uf) values (17, 'RR');
insert into estado (codest, uf) values (18, 'PE');
insert into estado (codest, uf) values (19, 'RO');
insert into estado (codest, uf) values (20, 'SE');
insert into estado (codest, uf) values (21, 'DF');
insert into estado (codest, uf) values (22, 'MG');
insert into estado (codest, uf) values (23, 'PA');
insert into estado (codest, uf) values (24, 'PB');
insert into estado (codest, uf) values (25, 'PI');
insert into estado (codest, uf) values (26, 'RN');

--Cidades
insert into cidade (codcid, nomcid, codest) values (0, 'Maravilha', 0);
insert into cidade (codcid, nomcid, codest) values (1, 'Chapecó', 0);
insert into cidade (codcid, nomcid, codest) values (2, 'Descanso', 0);
insert into cidade (codcid, nomcid, codest) values (3, 'Pinhalzinho', 0);
insert into cidade (codcid, nomcid, codest) values (4, 'Itapiranga', 0);
insert into cidade (codcid, nomcid, codest) values (5, 'São Miguel do Oeste', 0);
insert into cidade (codcid, nomcid, codest) values (6, 'Florianópolis', 0);
insert into cidade (codcid, nomcid, codest) values (7, 'Pato Branco', 2);
insert into cidade (codcid, nomcid, codest) values (8, 'Barra do Guarita', 1);
insert into cidade (codcid, nomcid, codest) values (9, 'Porto Alegre', 1);
insert into cidade (codcid, nomcid, codest) values (10, 'Tenente Portela', 1);
--CEPs
insert into cep (codcep, codcid) values (89874000, 0);
insert into cep (codcep, codcid) values (89801220, 1);
insert into cep (codcep, codcid) values (89910000, 2);
insert into cep (codcep, codcid) values (89870000, 3);
insert into cep (codcep, codcid) values (89896000, 4);
insert into cep (codcep, codcid) values (89900000, 5);
insert into cep (codcep, codcid) values (88066060, 6);
insert into cep (codcep, codcid) values (85504014, 7);
insert into cep (codcep, codcid) values (98530000, 8);
insert into cep (codcep, codcid) values (90020180, 9);
insert into cep (codcep, codcid) values (98500000, 10);

--EMPRESAS
insert into empresa (cnpjemp, nomfanemp, gestemp, razsocemp, ruaendemp, emailemp, telcontemp, tipoemp, codcep) 
values (42318949000184, 'Nicoleta Wiskas', 'Nicoleta ADM', 'Nicoleta Wiskas LTDA', 'Rua 7 de Setembro', 'nicoletaltda@gmail.com',49991059423, 'Privada', 89900000);
insert into empresa (cnpjemp, nomfanemp, gestemp, razsocemp, ruaendemp, emailemp, telcontemp, tipoemp, codcep) 
values (47832943092843, 'Matheus Celulares', 'Matheus', 'MT Cell LTDA', 'Rua XV de Novembro', 'mtcell@gmail.com', 49989622685, 'Publica', 89874000);

--PACIENTES
insert into paciente (cpfpac, nompac, prontpac, datnaspac, rgpac, cnspac, filipac, endpac, telcontpac, sexpac, expcadpac, escolpac, codcep, codtippac)
values ('02132213145', 'Luana dos Santos', 65,  '1999-04-08', 6352433, 23423, 'Maria Conceição dos Santos', 'Rua Valdomiro', 4998487732, 'F', '2021-02-20', 'Ensino Médio',  89874000, 0);
insert into paciente (cpfpac, nompac, prontpac, datnaspac, rgpac, cnspac, filipac, endpac, telcontpac, sexpac, expcadpac, escolpac, codcep, codtippac)
values ('01678739204', 'Joao Brandao', 53,  '1980-07-12', 5849467, 85746, 'Dalvina Brandao', 'Rua Jeremias', 48969412564, 'M', '2021-01-14', 'Ensino Superior',  98530000, 0);
insert into paciente (cpfpac, nompac, prontpac, datnaspac, rgpac, cnspac, filipac, endpac, telcontpac, sexpac, expcadpac, escolpac, codcep, codtippac)
values ('01574672377', 'Janaina Almeida', 21,  '1975-09-26', 3264971, 7485615, 'Josué Almeida', 'Rua Bahia', 49975491237, 'F', '2020-11-09', 'Ensino Fundamental',  98500000, 0);


--SINTOMAS
insert into sintoma (codsin, descr, valor, cpfpac) values (1, 'Tosse', 1, '02132213145');
insert into sintoma (codsin, descr, valor, cpfpac) values (2, 'Falta de ar', 1, '01678739204');
insert into sintoma (codsin, descr, valor, cpfpac) values (3, 'Falta de ar', 1, '01574672377');
--TRIAGEM
insert into triagem (codtri, pesopac, altpac, alerpac, compac, papac, cpfpac) 
values (43, 65.3, 160, 'Alergia anti estaminico', 'S', 12.8, '02132213145');


--TRIAGEM_SINTOMA
insert into triagem_sintoma(codsin, codtri) values (1, 43);

--COMORBIDADES
insert into comorbidade(codcom, desccom, valor, cpfpac) values (0, 'hipertensão', 5, '02132213145');

--GRAVIDADE
insert into gravidade(codgrav, resultado, cpfpac) values (0, 80, '02132213145');

--TESTE COVID
insert into teste(idteste, tipteste, resultado, cpfpac) values (0, 'Teste Rápido', 'P', '02132213145');

--VACINA
insert into vacina(idvac, tipvac, qtddose, datadose, cpfpac) values (0, 'Astra Zaneca', 1,'2021/04/12', '02132213145');

/* 1) Relacione o código e nome de pacientes com idades entre 40 e 50,
que apresentaram falta de ar. 
Relacione a consulta em ordem ascendente de nome */

SELECT p.cpfpac, p.nompac
FROM paciente p 
left JOIN sintoma ON sintoma.cpfpac = p.cpfpac where extract(year from datnaspac) <= extract(year from current_timestamp)-40 and 
extract(year from datnaspac) >= extract(year from current_timestamp)-50 and sintoma.descr = 'Falta de ar'
order by p.nompac asc;







