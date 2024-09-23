CREATE DATABASE sprint2b;
USE sprint2b;

CREATE TABLE pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
	cpf char(11)
);

INSERT INTO pessoa VALUES
	(default, 'Fulano da Silva', '42581919846'),
    (default, 'Ciclano Polen', '42581919846'),
    (default, 'Beltrano de Alcantara', '42581919846'),
    (default, 'Deltrano Euclides', '42581919846'),
    (default, 'Luano Santana', '42581919846');
    
    select * from pessoa;
    
CREATE TABLE reserva(
	idReserva int primary key auto_increment,
    dtReserva datetime default current_timestamp,
    dtRetirada datetime default current_timestamp,
    dtDevolucao datetime default current_timestamp,
    fkPessoa int
    ) auto_increment = 100;
    
    ALTER TABLE reserva MODIFY COLUMN fkPessoa int unique;
    
    INSERT INTO reserva  VALUES
		(default, default, default, default, 1);
        
	INSERT INTO reserva (fkPessoa) VALUES
    (2),
    (3),
    (4),
    (5);
        
	select * from reserva;
    
    ALTER TABLE reserva ADD CONSTRAINT fkReservaPessoa
		foreign key(fkPessoa) references Pessoa(idPessoa);
        
	select P.nome as Nome_Hospede,
    CASE 
    WHEN nome = 'Beltrano de Alcantara' THEN 'ATRASADO'
    ELSE 'Devolve em dia'
    END as Reputacao_Cliente,
    P.cpf as CPF,
    ifnull(R.dtReserva, 'Sem reservas' )as Dia_Reserva,
    R.dtRetirada as Dia_Retirada,
    R.dtDevolucao as Dia_Devolucao
	from reserva as R JOIN pessoa as P ON idPessoa = fkPessoa;
    
    update reserva set dtReserva = null
		where idReserva = 100;
        
        
CREATE TABLE Pessoa1(
	idPessoa1 int,
    nome varchar(45),
    dtNascimento date
    );
    alter table Pessoa1 modify column idPessoa1 int primary key auto_increment;
    
INSERT INTO pessoa1 VALUES
	(default, 'Luana Mendes', '1999-08-20');
    
    
CREATE TABLE Pessoa2 (
	idPessoa2 int primary key auto_increment,
    nome varchar(45),
    dtNascimento date,
	Constraint fkPessoa1Pessoa2
		foreign key (fkPessoa1) references Pessoa1(idPessoa1),
	fkPessoa1 int
    ) auto_increment = 100;
    
    INSERT INTO Pessoa2 VALUES
		(default, 'Kawê Dias', '1999-09-21', 1);
        
-- Teste para o ifnull
	UPDATE Pessoa2 SET nome = null
		WHERE idPessoa2 = 100;
        
-- Teste para o CASE
	UPDATE Pessoa2 SET nome = 'Kawê Dias'
		WHERE idPessoa2 = 100;

	SELECT P1.nome as Namorada,
    ifnull(P2.nome, "Pode não ser seu namorado") as namorado,
    P1.dtNascimento as Data_de_nascimento_namorada,
    P2.dtNascimento as Data_de_nascimento_namorado,
	CASE 
    WHEN P2.nome="Kawê Dias" THEN "É o seu namorado" 
    ELSE 'Não é seu namorado'
    END as namorado_ou_nao_namorado
    FROM 
    Pessoa2 as P2 
    JOIN 
    Pessoa1 as P1
    ON fkPessoa1 = idPessoa1;
        
