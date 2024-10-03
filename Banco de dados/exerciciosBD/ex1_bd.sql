CREATE DATABASE Pet;
USE Pet;

CREATE TABLE clientes(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telFixo char(10),
    telCel char(10),
    bairro varchar(45),
    numEndereco INT
) AUTO_INCREMENT = 1;
ALTER TABLE clientes MODIFY COLUMN telCel char(12);
ALTER TABLE clientes MODIFY COLUMN telFixo char(11);
ALTER TABLE clientes MODIFY COLUMN nome varchar(70);

INSERT INTO clientes VALUES
	(default, 'Victor Trevisan', null, '1198763-9387', 'Capão Redondo', 34),
    (default, 'Kawê Souza', '119878-9089', '1128263-9345', 'Vila Alpina', 324),
    (default, 'Nikollas Souza', '119234-2989', '1192321-8902', 'Vila Ema', 12),
    (default, 'Bruno Carpa', null, '1198972-9098', 'Mooca', 80);
    
SELECT * FROM clientes;

SELECT C.nome as Cliente,
    ifnull(C.telFixo, 'Sem telefone fixo') as 'Telefone Fixo',
    C.telCel as 'Telefone Celular',
    C.bairro as 'Bairro',
    C.numEndereco as 'Número da residência'
    FROM clientes as C;
    
SELECT * FROM clientes ORDER BY bairro DESC;

SELECT * FROM clientes
	WHERE nome LIKE '%Souza%';
    
UPDATE clientes SET telFixo = '119998-0990'
	WHERE idCliente = 1;
    
CREATE TABLE pets(
	idPet INT,
    fkCliente INT,
    PRIMARY KEY (idPet, fkCliente),
    tipo VARCHAR(45),
    nome VARCHAR(45),
    raca VARCHAR(45),
    dtNasc DATE
);
ALTER TABLE pets MODIFY COLUMN idPet INT AUTO_INCREMENT;
ALTER TABLE pets AUTO_INCREMENT = 101;

ALTER TABLE pets ADD CONSTRAINT fkPetsCliente
	FOREIGN KEY (fkCliente) REFERENCES clientes(idCliente);
INSERT INTO pets (fkCliente, tipo, nome, raca, dtNasc) VALUES
	(1, 'Cachorro', 'Doug', 'Golden Retriever', '2023-08-20'),
    (1, 'Cachorro', 'Bombo', 'Salsicha', '2024-12-10'),
    (2, 'Gato', 'Fred', 'Garfield', '2021-10-08'),
    (3, 'Camaleão', 'José', null, '2020-10-10'),
    (4, 'Furão', 'Little Hair', null, '2023-12-05');
    
SELECT * FROM pets;

SELECT P.idPet as 'Id Pet',
	C.nome as 'Dono',
    P.nome as 'Pet',
    P.tipo as 'Tipo de animal',
    ifnull(P.raca, 'Não tem raça') as Raça,
    P.dtNasc as 'Data de Nascimento'
    FROM pets as P
    JOIN clientes as C
    ON P.fkCliente = C.idCliente;
    
SELECT P.idPet as 'Id Pet',
	C.nome as 'Dono',
    P.nome as 'Pet',
    P.tipo as 'Tipo de animal',
    ifnull(P.raca, 'Não tem raça') as Raça,
    P.dtNasc as 'Data de Nascimento'
    FROM pets as P
    JOIN clientes as C
    ON P.fkCliente = C.idCliente
    WHERE tipo = 'Cachorro';
    
SELECT nome, dtNasc FROM pets;
    
SELECT P.idPet as 'Id Pet',
	C.nome as 'Dono',
    P.nome as 'Pet',
    P.tipo as 'Tipo de animal',
    ifnull(P.raca, 'Não tem raça') as Raça,
    P.dtNasc as 'Data de Nascimento'
    FROM pets as P
    JOIN clientes as C
    ON P.fkCliente = C.idCliente
    ORDER BY P.nome;
    
SELECT * FROM pets
	WHERE nome LIKE 'D%';
    
SELECT * FROM pets as P
    JOIN clientes as C
    ON P.fkCliente = C.idCliente;
    
SELECT * FROM pets as P
    JOIN clientes as C
    ON P.fkCliente = C.idCliente
	WHERE idCliente = '2';
    
DELETE FROM pets
	WHERE idPet = 105;
    
SELECT * FROM pets;

DROP TABLE pets;
DROP TABLE clientes;
    


