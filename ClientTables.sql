create database proyecto

create table Province(
IdProvince INT PRIMARY KEY IDENTITY (1,1),
nameProvince nvarchar(20) not null
)

create table Address(
IdAddress INT PRIMARY KEY IDENTITY (1,1),
street nvarchar (100),
IdProvince INT FOREIGN KEY REFERENCES Province(IdProvince)
)

create table Person(
IdPerson INT PRIMARY KEY IDENTITY (1,1),
name nvarchar(100) not null,
lastName nvarchar(100) not null,
secondLastName nvarchar(100) not null,
IdAddress INT FOREIGN KEY REFERENCES Address(IdAddress)ON DELETE CASCADE
);


create table Client(
IdClient INT PRIMARY KEY IDENTITY (1,1),
IdPerson INT FOREIGN KEY REFERENCES Person(IdPerson)ON DELETE CASCADE
)
create table Phone(
IdPhone INT PRIMARY KEY IDENTITY (1,1),
phone int UNIQUE not null,
IdPerson INT FOREIGN KEY REFERENCES Person(IdPerson)ON DELETE CASCADE
)

CREATE TABLE ShoppingHistory (
    IdShoppingHistory INT PRIMARY KEY IDENTITY (1,1),
    IdClient INT UNIQUE NOT NULL,
    FOREIGN KEY (IdClient) REFERENCES Client(IdClient) ON DELETE CASCADE
)


