create table Teenuse_tyyp(
teenuse_tyyp_ID int primary key identity(1,1),
ost varchar(3),
hooldamine varchar(3),
lising varchar(3),
test_soit varchar(3)
);

create table Koht(
koht_ID int primary key identity(1,1),
linn varchar(10),
aadress varchar(35),
);

create table Salong(
salong_ID int primary key identity(1,1),
nimi varchar(30),
koht int foreign key references Koht(koht_ID)
);

create table Tootaja(
tootaja_ID int primary key identity(1,1),
nimi varchar(10),
perenimi varchar(35),
amet varchar(30),
salong int foreign key references Salong(salong_ID)
);

create table Klient(
klient_ID int primary key identity(1,1),
nimi varchar(10),
perenimi varchar(35),
telefon varchar(8)
);

create table Teenus(
teenus_id int primary key identity(1,1),
klient int foreign key references Klient(klient_id),
teenuse_tyyp int foreign key references Teenuse_tyyp(teenuse_tyyp_id),
salong int foreign key references Salong(salong_id),
tootaja int foreign key references Tootaja(tootaja_id)
);

create table Keretyyp(
keretyyp_ID int primary key identity(1,1),
keretyyp varchar(20)
);

create table Mark(
mark_ID int primary key identity(1,1),
Mark varchar(30)
);

create table Mudel(
mudel_ID int primary key identity(1,1),
mudel varchar(35)
);

create table Aasta(
aasta_ID int primary key identity(1,1),
aasta int
);

create table Hind(
hind_ID int primary key identity(1,1),
hind int
);

create table kW(
kW_ID int primary key identity(1,1),
kW int
);

create table Kytus(
kytus_ID int primary key identity(1,1),
kytus varchar(20)
);

create table Kaigukast(
kaigukast_ID int primary key identity(1,1),
kaigukast varchar(15)
);

create table Auto(
auto_ID int primary key identity(1,1),
keretyyp int foreign key references Keretyyp(keretyyp_ID),
mark int foreign key references Mark(mark_ID),
mudel int foreign key references Mudel(mudel_ID),
aasta int foreign key references Aasta(aasta_ID),
hind int foreign key references Hind(hind_ID),
kW int foreign key references kW(kW_ID),
kytus int foreign key references Kytus(kytus_ID),
kaigukast int foreign key references Kaigukast(kaigukast_ID),
salong int foreign key references Salong(salong_ID)
);

select * from Aasta
select * from Auto
select * from Hind
select * from Kaigukast
select * from Keretyyp
select * from Klient
select * from Koht
select * from kW
select * from Kytus
select * from Mark
select * from Mudel
select * from Salong
select * from Teenus
select * from Tootaja

insert into Teenuse_tyyp(ost,hooldamine,lising,test_soit)
values('ei','ei','ei','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','jah','jah','jah');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('ei','ei','ei','jah');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('ei','jah','ei','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','ei','ei','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','ei','jah','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','jah','jah','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','jah','ei','ei');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('jah','jah','ei','jah');
insert into Teenus_tyyp(ost,hooldamine,lising,test_soit)
values('ei','jah','ei','jah');

insert into Koht(linn, aadress)
values('Tallinn','Mustamäe tee 203');
insert into Koht(linn, aadress)
values('Tartu','Võru 47');
insert into Koht(linn, aadress)
values('Tapa','Kalmistu 3');
insert into Koht(linn, aadress)
values('Tabasalu','Klooga mnt 10b');
insert into Koht(linn, aadress)
values('Haapsalu','Kiltsi tee 3');
insert into Koht(linn, aadress)
values('Paide','Uus 18');
insert into Koht(linn, aadress)
values('Narva','Tallinna mnt 41');
insert into Koht(linn, aadress)
values('Pärnu','Riia mnt 106');
insert into Koht(linn, aadress)
values('Otepää','Lipuväljak 28');
insert into Koht(linn, aadress)
values('Maardu','Keemikute 2');

insert into Salong(nimi, koht)
values('SaksaAutod',1);
insert into Salong(nimi, koht)
values('TopAutod',2);
insert into Salong(nimi, koht)
values('Kia Autod',3);
insert into Salong(nimi, koht)
values('Viking Motors',4);
insert into Salong(nimi, koht)
values('United Motors',5);
insert into Salong(nimi, koht)
values('German Beuty',6);
insert into Salong(nimi, koht)
values('Elke',7);
insert into Salong(nimi, koht)
values('Auto 100',8);
insert into Salong(nimi, koht)
values('Allcars',9);
insert into Salong(nimi, koht)
values('SCC',10);


insert into Tootaja(nimi, perenimi, amet, salong)
values('Martin','Kemppi','Esimees',1);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Maksim','Tsepeleivits','Asistent',1);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Anton','Buivol','Insener',1);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Oleksandr','Bohatyrov','Administrator',1);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Maksim','Miskeyvits','Tehnik',1);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Darja','Miljukova','Esimees',2);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Martin','Nõmiste','Asistent',2);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Denis','Gorjunov','Insener',2);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Yaroslav','Yekasov','Administrator',2);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Luca','Gluhov','Tehnik',2);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Ekaterina','Mõslaeva','Esimees',3);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Aleksandr','Rogovski','Asistent',3);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Timur','Denisenko','Insener',3);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Maksim','Artjomov','Administrator',3);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Arkadi','Korotõts','Tehnik',3);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Matvei','Kulakovski','Esimees',4);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Veronika','Milovsorova','Asistent',4);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Artur','Shuskeivits','Insener',4);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Maksim','Dotskin','Administrator',4);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Arkadi','Korotõts','Tehnik',4);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Artur','Ploom','Esimees',5);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Maksim','Trubko','Asistent',5);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Aleksandr','Aleksandrov','Insener',5);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Denis','Maltsev','Administrator',5);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Egor','Fedorenko','Tehnik',5);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Ilja','Rõbakov','Esimees',6);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Radion','Radionov','Asistent',6);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Anna','Sohromova','Insener',6);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Igor','Klimov','Administrator',6);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Egor','Klimenko','Tehnik',6);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Artur','Shiposhev','Esimees',7);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Artur','Knazev','Asistent',7);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Tarmo','Pitkve','Insener',7);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Anton','Kravtsuk','Administrator',7);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Georg','Tsernõi','Tehnik',7);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Mart','Suursoo','Esimees',8);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Kristjan','Suursoo','Asistent',8);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Aleksandr','Bekasov','Insener',8);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Anita','Tkatsenko','Administrator',8);
insert into Tootaja(nimi, perenimi, amet, salong)
values('German','Vasiljev','Tehnik',8);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Igor','Belokurov','Esimees',9);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Natalja','Vasiljeva','Asistent',9);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Irina','Kostromenko','Insener',9);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Ruuth','Bangaduri','Administrator',9);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Quentin','Tarantino','Tehnik',9);

insert into Tootaja(nimi, perenimi, amet, salong)
values('Andre','Michelin','Esimees',10);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Eduard','Michelin','Asistent',10);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Sedsiro','Isibaki','Insener',10);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Bill','Haven','Administrator',10);
insert into Tootaja(nimi, perenimi, amet, salong)
values('Jukko','Moisio','Tehnik',10);

insert into Klient(nimi, perenimi, telefon)
values('Andre','Giant','50034348');
insert into Klient(nimi, perenimi, telefon)
values('Barack','Obama','52738263');
insert into Klient(nimi, perenimi, telefon)
values('Dwayne','Johnson','57635987');
insert into Klient(nimi, perenimi, telefon)
values('Donald','Trump','58132610');
insert into Klient(nimi, perenimi, telefon)
values('Jericho','Iniko','50509113');
insert into Klient(nimi, perenimi, telefon)
values('Aleksandr','Bellen','51583759');
insert into Klient(nimi, perenimi, telefon)
values('Georg','Ots','57980491');
insert into Klient(nimi, perenimi, telefon)
values('Katalin','Novak','52400489');
insert into Klient(nimi, perenimi, telefon)
values('Freidrich','Kreutswald','50641509');
insert into Klient(nimi, perenimi, telefon)
values('Frank','SteinMeier','52701481');
insert into Klient(nimi, perenimi, telefon)
values('Anton','Tammsaare','57196846');
insert into Klient(nimi, perenimi, telefon)
values('Michael','Higgins','53167728');
insert into Klient(nimi, perenimi, telefon)
values('Michael','Jackson','57298118');
insert into Klient(nimi, perenimi, telefon)
values('Serjo','Matarella','52861579');
insert into Klient(nimi, perenimi, telefon)
values('Tom','Hardy','58641506');
insert into Klient(nimi, perenimi, telefon)
values('Andjey','Duda','54268224');
insert into Klient(nimi, perenimi, telefon)
values('Woody','Harrelson','52693115');
insert into Klient(nimi, perenimi, telefon)
values('Sauli','Niinistö','55012628');
insert into Klient(nimi, perenimi, telefon)
values('Alan','Karris','55335568');

insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(1,2,1,4);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(2,3,2,9);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(3,1,2,1);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(4,4,3,11);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(5,5,3,14);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(6,6,4,16);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(7,7,4,19);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(8,8,5,21);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(9,9,5,24);
insert into Teenus(klient,teenuse_tyyp,salong,tootaja)
values(10,10,6,26);