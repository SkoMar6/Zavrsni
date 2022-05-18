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
    artikl int
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
    clan int not null,
    poslovnica int not null
);

create table artikl (
    sifra int not null primary key auto_increment,
    cijena decimal (10,2),
    skupljanje_bodova boolean,
    koristenje_bodova boolean,
    poslovnica int not null
);

#definiranje vanjskih  kljuceva

alter table kartica add foreign key (poslovnica) references poslovnica(sifra);
alter table clan add foreign key (kartica) references kartica (sifra);
alter table artikl add foreign key (poslovnica) references poslovnica (sifra);

#unos podataka 
insert into poslovnica (sifra,broj_poslovnice, skupljanje_bodova, koristenje_bodova)
values (null,'posl-1', true, true);



