USE sprint2b;

CREATE TABLE projeto(
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(70)
);

INSERT INTO projeto VALUES
	(default, 'Vaquinhas', 'Projeto sobre vacas'),
    (default, 'Aliens', 'Projeto sobre aliens'),
	(default, 'WineGuard', 'Projeto sobre vinho');
    
select*from projeto;

    

CREATE TABLE aluno(
	ra char(8) primary key,
    nome varchar(45),
    telefone char(10),
    fkRepresentante char(8),
     constraint fkRepresentanteAluno
		foreign key (fkRepresentante) references aluno(ra),
    fkProjeto int,
    constraint fkProjetoAluno
		foreign key (fkProjeto) references Projeto(idProjeto)	
);

drop table aluno;
INSERT INTO aluno VALUES
	('01240901', 'Gabriel', '98338-0938', null, null),
    ('01243939', 'Junior', '98738-8276', null, null),
    ('01249287', 'Mailik', '97863-0989', null, null),
    ('01246453', 'Dandara', '98376-9080', null, null);
    
select * from aluno;


update aluno set fkRepresentante = '01249287'
	where ra = '01246453';
    
update aluno set fkRepresentante = '01246453'
	where ra = '01243939';
    
update aluno set fkRepresentante = '01243939'
	where ra = '01240901';
    
update aluno set fkRepresentante = '01240901'
	where ra = '01249287';
    
update aluno set fkProjeto = 3
	where ra = '01249287';
    
update aluno set fkProjeto = 2
	where ra = '01243939';
    
update aluno set fkProjeto = 1
	where ra = '01240901';

update aluno set fkProjeto = 1
	where ra = '01246453';

    

select aluno.ra as RA,
	aluno.nome as Aluno,
	aluno.telefone as Contato,
    repre.nome as Representante,
    proj.nome as Projeto,
    proj.descricao as 'Descrição'
    from aluno as aluno
    JOIN aluno as repre
    ON aluno.fkRepresentante = repre.ra
    JOIN projeto as proj
    ON aluno.fkProjeto = proj.idProjeto;
    
    
    
CREATE TABLE organizador(
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    rua varchar(45),
    bairro varchar(45),
    email varchar(45),
    fkOrientador int
);
ALTER TABLE organizador auto_increment = 30;
INSERT INTO organizador (nome, rua, bairro, email, fkOrientador) VALUES
	('KlJay', 'Compton Street', 'Groove Block', 'racionais@gmail.com', null),
    ('Ice Cube', 'Wes Street', 'Was Block', 'cube@gmail.com', null),
    ('Big Poppa', 'Biggie Street', 'Momma Block', 'bigg@gmail.com', null),
    ('50 cent', 'Inda Street', 'Candy Block', 'cent@gmail.com', null);
    
select * from organizador;
    a
    
    


