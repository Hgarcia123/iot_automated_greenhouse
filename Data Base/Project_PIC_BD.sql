-- RESTORE
-- drop database if exists db_projeto;
-- create database db_projeto;
-- use db_projeto;

SET SQL_SAFE_UPDATES = 0;

create table Estufa(
	estufa_id int NOT NULL AUTO_INCREMENT,
    estufa_esp_id int NOT NULL,
	estufa_gps varchar(40),
	PRIMARY KEY(estufa_id, estufa_esp_id)
);

create table Parametros(
	param_id int NOT NULL AUTO_INCREMENT, 
    param_especie_id int NOT NULL,
	param_esp_id int NOT NULL,
    param_temp_ar decimal(3,1),
	param_hum_ar decimal(4,1),
    param_lumin decimal(4,1),
	param_hum_solo decimal(4,1),
    param_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    param_deepsleep_time int,
    param_active_time int,
	PRIMARY KEY(param_id)
);

create table Sensores(
	sensor_id int NOT NULL AUTO_INCREMENT,
	sensor_tipo varchar(40),
    PRIMARY KEY(sensor_id)
);

create table Medidas(
	medidas_id int NOT NULL AUTO_INCREMENT,
    medidas_valor float,
    medidas_sensor_id int NOT NULL,
	medidas_timestamp timestamp NOT NULL,
    PRIMARY KEY(medidas_id)
);

create table Especie (
	especie_id int NOT NULL AUTO_INCREMENT,
	especie_nome varchar(40) NOT NULL,
    especie_regiao varchar(40) default 'Desconhecida',
	PRIMARY KEY(especie_id)
);

create table Planta_Estufa(
    planta_estufa_id int NOT NULL,
	planta_estufa_especie_id int NOT NULL,
	PRIMARY KEY(planta_estufa_id)
);

create table Estufa_Sensores(
	estufa_sensor_id int NOT NULL,
	estufa_estufa_id int NOT NULL,
	PRIMARY KEY(estufa_sensor_id, estufa_estufa_id)
);

alter table Parametros add FOREIGN KEY (param_especie_id) REFERENCES Especie(especie_id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Medidas add FOREIGN KEY (medidas_sensor_id) REFERENCES Sensores(sensor_id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Planta_Estufa add FOREIGN KEY (planta_estufa_especie_id) REFERENCES Especie(especie_id) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Estufa_Sensores add FOREIGN KEY (estufa_sensor_id) REFERENCES Sensores(sensor_id) ON DELETE CASCADE ON UPDATE CASCADE;

insert into Especie (especie_nome, especie_regiao) values 
('Alface Lisa', 'Global'),
('Coentros Comuns', 'Global'),
('Rosa do Sul', 'Sul'),
('Cenoura do Porto', 'Global'),
('Margarida da Ribiera', 'Sul'),
('Suculenta dos Suculentos', 'Sul'),
('Orquídeas de França', 'Açores'),
('Hibisco do Sul', default),
('Violeta Comum', 'Sul'),
('Tulipa Comum', 'Global'),
('Cenoura Comum', 'Global'),
('Alface Aspargo', 'Sul'),
('Hibisco Comum', 'Global'),
('Feto Comum', 'Madeira'),
('Suculenta do SUL', 'Global'),
('Rosa de Inverno', 'Madeira'),
('Feto de Verão', 'Global'),
('Margarida do Sol', 'Madeira'),
('Feto das Coves', 'Madeira'),
('Violeta Branca', 'Sul');

insert into Estufa (estufa_esp_id, estufa_gps) values
(1, '53°24 39.1"N 2°16 37.0"W'),
(2, '38º51 57.82"N 8º45 3.90"W'),
(3, '23º51 37.82"W 8º45 4.90"S'),
(4, '23º51 57.82"W 8º45 4.90"S'),
(5, '41º24 63"N 0º08 12"W'),
(6, '42º4 45"N 0º34 23"W'),
(7, '42º4 32"N 0º39 4.90"S'),
(8, '42º4 45"S 0º34 23"W'),
(9, '12º4 25"N 0º39 23"N'),
(10, '42º4 45"N 0º34 23"W'),
(11, '41º24 73"S 0º08 12"W'),
(12, '38º51 57.82"N 8º45 3.90"W'),
(13, '42º4 42"N 0º39 4.90"S'),
(14, '41º24 23"N 0º20 12"E'),
(15, '20º29 56"N 0º20 12"W'),
(16, '41º24 23"W 0º20 32"E'),
(17, '23º21 57.00"W 8º90 45"S'),
(18, '23º21 21"W 8º60 20"S'),
(187, '41º24 73"N 0º08 12"W'),
(204, '41º24 73"N 0º08 12"W');

insert into Parametros (param_especie_id, param_esp_id, param_temp_ar, param_hum_ar, param_lumin, param_hum_solo, param_litros_agua) values 
(1, 1, 25, 45, 70, 13, 2),
(1, 2, 28, 38.5, 30, 13, 2),
(1, 3, 24, 50, 90, 9, 2),
(1, 4, 30, 60.5, 56.7, 13, 2),
(1, 5, 25.5, 25.7, 85.2, 13, 2),
(1, 6, 26.4, 30.8, 55, 10, 2),
(1, 7, 21.8, 68, 35, 13, 2),
(1, 8, 29.3, 80, 62.6, 11, 2),
(1, 9, 21, 45, 50.9, 13, 2),
(1, 10, 26.7, 20.8, 90, 15, 1),
(1, 11, 26.7, 56, 90, 13, 2),
(1, 12, 21.8, 68, 35, 15, 2),
(1, 13, 26.4, 30.8, 55, 11, 2),
(1, 14, 28, 38.5, 30, 13, 2),
(1, 16, 25.5, 40.7, 85.2, 13, 2),
(1, 17, 21, 45, 50.9, 13, 2),
(1, 18, 28, 38.5, 30, 12, 2),
(1, 187, 28, 38.5, 30, 11, 1),
(1, 204, 23, 90, 70, 13, 2);

update Parametros set param_especie_id=2, param_temp_ar=19, param_hum_ar=95, param_lumin=50, param_hum_solo=89, param_litros_agua=0.5 where param_esp_id=187;

select * from Parametros;

insert into Sensores (sensor_tipo) values
('Temperatura do Ar'),
('Humidade do Ar'),
('Luminosidade'),
('Humidade do Solo');

insert into Planta_Estufa (planta_estufa_id, planta_estufa_especie_id) values
(187, 10),
(204, 13);

insert into Estufa_Sensores (estufa_sensor_id, estufa_estufa_id) values
(1, 187),
(2, 187),
(3, 187),
(4, 187),
(1, 204),
(2, 204),
(3, 204),
(4, 204);