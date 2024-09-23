CREATE USER 'jogador'@'localhost'
	IDENTIFIED BY 'urubu100';
    
GRANT SELECT ON sprint2.*
	TO 'jogador'@'localhost';
    
FLUSH PRIVILEGES;