create database Arduino;
use Arduino;

create table Consumo(
  id int not null auto_increment primary key ,
  nome VARCHAR(250),
  valor double ,
  DataInicial timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  TempoON   int
);
