USE sprint2;

CREATE TABLE individuo(
	idIndividuo int primary key auto_increment,
    nome varchar(45),
    curso varchar(45),
    dtNasc date,
    fkMonitor int,
    constraint fkAlunoMonitor foreign key (fkMonitor)
		references individuo(idIndividuo)
    );

INSERT INTO individuo (nome, curso, dtNasc, fkMonitor)VALUES
	('Manoel Gomes', 'ADS','1998-02-21', 1),
    ('Romero Britto', 'CCO','1950-09-12', 2),
    ('Julian Gascar', 'SIS','2000-02-20', 3),
    ('Kenye West', 'ADS','1997-03-09', 4);

update individuo set fkMonitor = 1
	where idIndividuo = 3;
    
update individuo set fkMonitor = 2
	where idIndividuo = 4;
    
update individuo set fkMonitor = 3
	where idIndividuo = 2;
    
update individuo set fkMonitor = 4
	where idIndividuo = 1;
select*from individuo;
    
SELECT
	aluno.nome as Aluno,
	aluno.curso as 'Curso do aluno',
    monitor.nome as Monitor,
    monitor.curso as 'Curso do monitor',
    ifnull(monitor.nome, 'Sem monitor') as 'Com monitores?',
    CASE
    WHEN monitor.nome = 'Kenye West' THEN 'YE!!!! SPTech'
    ELSE ('Você não é o Kenye, monitor SPTech')
    END as 'Kenye?'
	FROM individuo as aluno
    JOIN individuo as Monitor
    ON aluno.fkMonitor = monitor.idIndividuo;


CREATE TABLE Pessoa(
	idPessoa int primary key auto_increment,
    farmaceutico varchar(45),
    farmacia varchar(45),
    cpf char(11),
    fkEndereco int unique,
    fkFarmacia int     
) auto_increment = 100;
desc pessoa;
	ALTER TABLE Pessoa ADD CONSTRAINT fkEnderecoPessoa
		foreign key (fkEndereco) references Pessoa(idPessoa);
	ALTER TABLE Pessoa ADD CONSTRAINT fkFarmaciaPessoa
		foreign key (fkFarmacia) references Pessoa(idPessoa);
	ALTER TABLE pessoa auto_increment = 1 ;
    drop table pessoa;
INSERT INTO pessoa (farmaceutico, farmacia, cpf) VALUES
	('Singed', 'Drogaria Zaune', '42398789745'),
    ('Dr.Mundo', 'Drogaria Zaunada', '52349799846'),
    ('Glascana', 'Drogaria Pilt', '65428789218'),
    ('Twinze', 'Drogaria Zaune', '54361718236'),
    ('Jinx', 'Drogaria KaBom', '20102921827');
    
    select*from pessoa;
    
UPDATE pessoa SET fkEndereco = 100, fkFarmacia = 100
	WHERE idPessoa = 100;
    
UPDATE pessoa SET fkEndereco = 102, fkFarmacia = 102
	WHERE idPessoa = 101;

    
UPDATE pessoa SET fkEndereco = 102, fkFarmacia = 102
	WHERE idPessoa = 103;
    

    
