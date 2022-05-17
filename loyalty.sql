# mysql -uroot --default_character_set=utf8 <C:\Users\Marko\Documents\GitHub\zavrsni\loyalty.sql
# sifra int not null primary key auto_increment,

drop database if exists loyalty;
create database loyalty;
use loyalty;

create table poslovnica (
    sifra int not null primary key auto_increment,
    broj_poslovnice varchar(30) not null,
    skupljanje_bodova boolean not null,
    koristenje_bodova boolean not null,
    mjesto varchar(50),
    kartica int not null
);

create table clan (
    sifra int not null primary key auto_increment,
    kartica int not null,
    ime_prezime varchar (50) not null,
    adresa varchar (50) not null,
    postanski_broj int not null,
    datum_rodenja datetime,
    kontakt varchar(50) not null
);

create table kartica (
    sifra int not null primary key auto_increment,
    broj_kartice varchar (30) not null,
    vrijedi_od datetime not null,
    vrijedi_do datetime not null,
    ime_prezime varchar(50) not null,
    poslovnica int not null
);

create table artikl (
    cijena decimal (10,2),
    skupljanje_bodova boolean,
    koristenje_bodova boolean
);
