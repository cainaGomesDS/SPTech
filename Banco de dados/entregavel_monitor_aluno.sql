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

INSERT INTO individuo (nome, curso, fkMonitor)VALUES
	('Manoel Gomes', 'ADS', 1),
    ('Romero Britto', 'CCO', 2),
    ('Julian Gascar', 'SIS', 3),
    ('Kenye West', 'ADS', 4);

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
    CASE
    WHEN ifnull(monitor.nome, 'Sem monitor') as asa
    ELSE ('Com monitor')
    END
    
	FROM individuo as aluno
    JOIN individuo as Monitor
    ON aluno.fkMonitor = monitor.idIndividuo
    

    
