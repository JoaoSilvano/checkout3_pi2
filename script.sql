CREATE DATABASE checkout3;

USE checkout3;

CREATE TABLE Usuarios( 	
ID_Usuario int AUTO_INCREMENT, 
nome varchar(100) NOT NULL, 	
email varchar(100) NOT NULL UNIQUE, 	
senha varchar(30) NOT NULL, 	
tipoUser varchar(10) NOT NULL, 	
primary key(ID_Usuario)); 	 

CREATE TABLE Depositos( 	
ID_Deposito int AUTO_INCREMENT, 	
userId int, 	
material varchar(20), 	
quantidade varchar(10), 	
detalhes varchar(100), 	
localizacao POINT, 	
data_hora TIMESTAMP, 	
coletado BOOLEAN, 	ID_Catador int, 	
PRIMARY KEY (ID_Deposito), 	
FOREIGN KEY (userId) REFERENCES Usuarios(ID_Usuario), 	
FOREIGN KEY (ID_Catador) REFERENCES Usuarios(ID_Usuario)); 

CREATE TABLE Coleta ( 	
ID_Coleta int AUTO_INCREMENT, 	
ID_Deposito int, 	
ID_Coletor int, 	
ID_Depositador int, 
timestamp_aceite TIMESTAMP,
PRIMARY KEY (ID_Coleta),
FOREIGN KEY (ID_Deposito) REFERENCES Depositos(ID_Deposito), 	
FOREIGN KEY (ID_Coletor) REFERENCES Usuarios(ID_Usuario), 	
FOREIGN KEY (ID_Depositador) REFERENCES Usuarios(ID_Usuario));

INSERT INTO Usuarios (nome, email, senha, tipoUser)
VALUES('João Pedro','joao.pedro@email.com','senha123','catador'),
('José','jose.silva@email.com','123senha','empresa'),
('Lucia Maria','lucia.maria1@email.com','lucia321','cidadao');

INSERT INTO Depositos (userId,material,quantidade,detalhes,localizacao,data_hora,coletado, ID_Catador)
VALUES(1,'papelao','1kg','varias caixas',POINT(0,0),NOW(),false,NULL),
(1,'plastico','2kg','rolo plastico bolha',POINT(0,0),NOW(),true,NULL);

INSERT INTO Coleta(ID_Deposito,ID_Coletor,ID_Depositador,timestamp_aceite)
values(1,1,2,now());

