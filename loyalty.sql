# mysql -uroot --default_character_set=utf8 <C:\Users\Marko\Documents\GitHub\Zavrsni\loyalty.sql
# sifra int not null primary key auto_increment,

drop database if exists loyalty;
create database loyalty;
use loyalty;

create table poslovnica (
    sifra int not null primary key auto_increment,
    broj_poslovnice varchar(30) not null,
    skupljanje_bodova boolean not null,
    koristenje_bodova boolean not null,
    mjesto varchar(50)
);

create table clan (
    sifra int not null primary key auto_increment,
    kartica int not null,
    ime varchar (50) not null,
    prezime varchar(50) not null,
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

insert into poslovnica (sifra,broj_poslovnice, skupljanje_bodova, koristenje_bodova, mjesto)
values (null, 'posl-1', true, true,'Osijek'),
       (null, 'posl-2', true, true, 'Zagreb'),
       (null, 'posl-3', false, false, 'Tenja'),
       (null, 'posl-4', false, true, 'Šibenik'),
       (null, 'posl-5', true, false, 'Zadar');

insert into kartica (sifra, broj_kartice, vrijedi_od, vrijedi_do, poslovnica)
values (null, '1234567', '2022-01-01', '2099-12-31', 1),
       (null, '7654321', '2021-05-01', '2099-12-31', 2),
       (null, '9988776', '2019-01-20', '2099-12-31', 1),
       (null, '8523697', '2022-01-01', '2099-12-31', 4),
       (null, '6532187', '2022-05-05', '2099-12-31', 2);

insert into clan (sifra, kartica, ime, prezime, adresa, postanski_broj, datum_rodenja, kontakt)
values (null, 1, 'Marko', 'Skorup','Kaštelanska 49', 31000, '1991-06-05', 'mskorup@gmail.com'),
       (null, 2, 'Pero', 'Perić','Vlaška 15', 10000, '1988-01-05', 'peroperic@gmail.com'),
       (null, 3, 'Kristina', 'Kovačić','Radićeva 22', 31000, '1995-29-05', 'kriko@gmail.com'),
       (null, 4, 'Duje', 'Dujić','Ribarska 98', 22000, '1980-09-14', 'dujedujic@gmail.com'),
       (null, 5, 'Ivan', 'Miloloža','Osječka 7', 10000, '1979-02-13', 'mskorup@gmail.com');

insert into artikl (sifra, cijena, skupljanje_bodova, koristenje_bodova,poslovnica)
values (null, 250.99,true,true,1),
       (null, 500.00,false,false,2),
       (null, 999.99,true,true,4),
       (null, 199.99,true,false,3),
       (null, 2099.99,true,true,5);