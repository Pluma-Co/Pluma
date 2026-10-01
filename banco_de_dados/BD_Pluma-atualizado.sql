CREATE DATABASE pluma;
USE pluma;

CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(100),
    cnpj CHAR(14) UNIQUE ,
    dtcadastro DATE
);

CREATE TABLE usina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dtcadastro DATETIME,
    cidade VARCHAR(60),
    estado VARCHAR(45),
    endereco VARCHAR(100),
    fk_empresa INT,
    FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(80),
    senha VARCHAR(50),
    dtcadastro DATETIME,
    login VARCHAR(45),
    permissao VARCHAR(45),
    fk_empresa INT,
    FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    localinstalacao VARCHAR(45),
    ativo TINYINT,
    dtinstalacao DATE,
    numero_serie VARCHAR(20),
    fk_usina INT,
    FOREIGN KEY (fk_usina) REFERENCES Usina(id)
);

CREATE TABLE medicao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    indice_gas DECIMAL(10,2),
    dtmedicao DATETIME,
    fk_sensor INT,
    FOREIGN KEY (fk_sensor) REFERENCES Sensor(id)
);

INSERT INTO empresa (razao_social, cnpj, dtcadastro) VALUES
('RZK Energia', '28133664000148', '2026-09-30'),
('Ecoparque Usina Paulínia Verde', '03279285002850', '2026-09-30'),
('Termoverde Caieiras', '10490040000112', '2026-09-30');

SELECT * FROM empresa;

INSERT INTO usina (dtCadastro, cidade, estado, endereco, fk_empresa) 
VALUES 
(NOW(), 'São Paulo', 'SP', 'Estr. de Sapopemba, 23325 - Cidade Satélite Santa Bárbara', 1),
(NOW(), 'Paulínia', 'SP', 'Avenida Orlando Vedovello, 894 - Parque da Represa, Paulínia', 2),
(NOW(), 'Caieiras', 'SP', 'Via de Acesso Norte, Km 33 Rodovia dos Bandeirantes – Bairro Calcárea, Caieiras', 3);

INSERT INTO sensor (localinstalacao, ativo, dtinstalacao, numero_serie, fk_usina) VALUES 
('Biodigestor Central', 1, '2026-09-30', 'MQ2-SP01', 1),
('Válvula de Purificação', 1, '2026-09-30', 'MQ2-SP02', 2),
('Gasômetro Principal', 1, '2026-09-30', 'MQ2-CAIE01', 3);

SELECT * 
FROM empresa
JOIN usina ON empresa.id = usina.fk_empresa
INNER JOIN sensor ON usina.id = sensor.fk_usina;

SELECT 
empresa.razao_social AS 'Empresa Operadora',
usina.cidade AS 'Unidade / Cidade',
usina.endereco AS 'Localização da Usina',
sensor.numero_serie AS 'Código do Sensor',
sensor.localinstalacao AS 'Ponto de Monitoramento'
FROM empresa
INNER JOIN usina ON empresa.id = usina.fk_empresa
INNER JOIN sensor ON usina.id = sensor.fk_usina;
