CREATE DATABASE projeto;
USE projeto;

CREATE TABLE sensor(
	idSensor int primary key,
    tipo varchar(45),
    estadoSensor varchar(45),
    manutencaoEmDia varchar(45)
);

insert into sensor values
	(1, 'TCRT5000', 'Ativo', 'Sim'),
    (2, 'TCRT5000', 'Ativo', 'Não'),
    (3, 'TCRT5000', 'Inativo', 'Não'),
    (4, 'TCRT5000', 'Ativo', 'Sim');
    
select*from sensor;

CREATE TABLE alertas(
	idAlerta int primary key,
    InformacaoFluxo varchar(45)
);

insert into alertas values
	(1,'Fluxo Alto'),
    (2,'Fluxo Moderado'),
    (3,'Sem dados'),
    (4,'Fluxo Alto');
    
select*from alertas;



    

    