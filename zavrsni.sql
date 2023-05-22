-- c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\maxba\Documents\GitHub\desktop-tutorial\zavrsni.sql

drop database if exists nocniklub;
create database nocniklub;
use nocniklub;

create table nocni_klub (
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    lokacija varchar (50) not null,
    kontakt varchar (50) not null,
    rezervacija int,
    ulaznica int,
    radno_vrijeme decimal(9,3),
    dj int
);

create table dj (
    sifra int not null primary key auto_increment,
    osoba int,
    nadimak varchar (50),
    iban varchar (50),
    kontakt varchar (50),
    nocni_klub int
);

create table ulaznica (
    sifra int not null primary key auto_increment,
    cijena decimal (10,2),
    boja_ulaznica varchar (50),
    dimenzija varchar (50)
);

create table rezervacija (
    sifra int not null primary key auto_increment,
    cijena_rezervacije decimal (10,2) not null,
    istek_rezervacije varchar (50) not null,
    broj_osoba varchar (50),
    broj_stola varchar (50) not null,
    kontakt varchar (50)
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar (50),
    prezime varchar (50),
    oib varchar (50)
);

alter table nocni_klub add foreign key (ulaznica) references ulaznica(sifra);
alter table nocni_klub add foreign key (rezervacija) references rezervacija(sifra);
alter table dj add foreign key (osoba) references osoba(sifra);
alter table nocni_klub add foreign key (dj) references dj(sifra);
