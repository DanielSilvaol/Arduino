CREATE DATABASE arduino;
use arduino;
create table Consumo
(
  id           int auto_increment
    primary key,
  nome         varchar(250)                            null,
  valor        double                                  null,
  data_final   timestamp default CURRENT_TIMESTAMP     not null,
  data_inicial timestamp default '0000-00-00 00:00:00' not null,
  contagem_dia int                                     null,
  STATUS       varchar(250)                            not null
);

create table login
(
  idLogin int auto_increment
    primary key,
  nome    varchar(250) not null,
  login   varchar(250) not null,
  senha   varchar(250) not null
);
SELECT * FROM Consumo;
INSERT INTO Consumo (id, nome, valor, data_final, data_inicial, contagem_dia, STATUS) values (1,'QUARTO',500,'2018-06-02','2018-06-01',1,'1');
SELECT DATEDIFF(NOW(),'2018-11-22') AS quantidade_DIAS FROM Consumo where nome = (?) order by id desc limit 1;
# show variables like 'sql_mode' ;
# set sql_mode = ''
