DROP TABLE IF EXISTS `Client`;
DROP TABLE IF EXISTS `Commande`;
DROP TABLE IF EXISTS `Ligne_commande`;
DROP TABLE IF EXISTS `Produit`;
DROP TABLE IF EXISTS `Vendeur`;

create table Client
(code_c int(2) not null,
nom varchar(25) not null,
adresse varchar(50) not null,
cp varchar(5) not null,
ville varchar(25) not null,
telephone varchar(12) not null,
constraint pk_Client primary key(code_c));

create table Commande
(numero int(5) not null,
code_v int(2) not null,
code_c int(2) not null,
date_livraison char(10) not null,
date_commande char(10) not null,
total_ht double precision not null,
total_tva double precision not null,
etat int(1) not null,
constraint pk_Commande primary key(numero));

create table Ligne_commande
(numero int(5) not null,
numero_ligne int(2) not null,
reference int(4) not null,
quantite_demandee int(1) not null,
constraint pk_Ligne_commande primary key (numero,reference));

create table Produit
(reference int(4) not null,
designation varchar(30),
quantite int(3) not null,
descriptif char,
prix_unitaire_ht double precision not null,
stock int(3) not null,
poids_piece int(2),
constraint pk_Produit primary key(reference));

create table Vendeur
(code_v int(2) not null,
nom varchar(25) not null,
adresse varchar(30) not null,
cp varchar(5) not null,
ville varchar(25),
telephone varchar(15) not null,
constraint pk_Vendeur primary key(code_v));