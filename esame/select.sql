CREATE TABLE elementi(
codice integer primary key,
descrizione varchar(100) not null,
quantita numeric(8,2) not null);

CREATE TABLE elementi_della_confezione(
codice integer primary key,
tipo_materiale varchar(20) not null,
riciclabile bit,
/*FOREIGN KEY (codice) REFERENCES elementi(codice)*/);

CREATE TABLE fornitori (
codice integer primary key,
nome varchar(20) not null,
CF char(16) not null,
p_iva char(11) not null);

CREATE TABLE indirizzi(
codice integer primary key,
indirizzo varchar(50) not null,
codice_fornitore integer not null,
/*FOREIGN KEY (codice_fornitore) REFERENCES fornitori(codice)*/);

CREATE TABLE ingredienti_alimentari(
codice integer primary key,
calorie integer,
FOREIGN KEY (codice) REFERENCES elementi(codice));

CREATE TABLE forniture_correnti(
codice_fornitore integer not null,
codice_ingrediente integer not null,
quantita integer,
PRIMARY KEY (codice_fornitore, codice_ingrediente)
/*FOREIGN KEY (codice_fornitore) REFERENCES fornitori(codice),
FOREIGN KEY (codice_ingrediente) REFERENCES ingredienti_alimentari(codice)*/);

CREATE TABLE forniture_passate(
codice_fornitore integer not null,
codice_ingrediente integer not null,
quantita integer,
PRIMARY KEY (codice_fornitore, codice_ingrediente)
/*FOREIGN KEY (codice_fornitore) REFERENCES fornitori(codice),
FOREIGN KEY (codice_ingrediente) REFERENCES ingredienti_alimentari(codice)*/);



insert into fornitori values (1111,'pippo','PPOPPR99M22L750R',0093412345);
insert into fornitori values (1112,'pluto','PLTPPR98M10L750O',0035345542);
insert into fornitori values (1113,'qui','QUIPPR78M25L750H',0023466723);
insert into fornitori values (1114,'quo','QUOPPR77M03L750X',0043534508);
insert into fornitori values (1115,'qua','QUAPPR79M11L750A',0097634523);


insert into indirizzi values (321,'via qua',1115);
insert into indirizzi values (322,'via quo',1114);
insert into indirizzi values (323,'via pippo 1',1111);
insert into indirizzi values (324,'via pippo 2',1111);



insert into forniture_correnti values (1111,123,10);
insert into forniture_correnti values (1111,124,10);
insert into forniture_correnti values (1111,125,9);
insert into forniture_correnti values (1111,126,8);



insert into elementi values (123,'gamberetto',300);
insert into elementi values (124,'riso',1400);
insert into elementi values (125,'carota',800);
insert into elementi values (126,'pomodoro',900);
insert into elementi values (127,'insalata',200);

SELECT descrizione, elementi.quantita AS "quantita totale", forniture_correnti.quantita AS "quantita fornita"
FROM elementi, forniture_correnti, fornitori
WHERE elementi.codice=forniture_correnti.codice_ingrediente 
	AND
forniture_correnti.codice_fornitore=fornitori.codice
	AND fornitori.nome='pippo';





