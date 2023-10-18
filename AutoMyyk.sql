create table Teenus(
teenus_ID int primary key identity(1,1),
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
teenus int foreign key references Teenus(teenus_ID),
salong int foreign key references Salong(salong_ID)
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

insert into Teenus(ost,hooldamine,lising,test_soit)
values('ei','ei','ei','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','jah','jah','jah');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('ei','ei','ei','jah');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('ei','jah','ei','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','ei','ei','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','ei','jah','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','jah','jah','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','jah','ei','ei');
insert into Teenus(ost,hooldamine,lising,test_soit)
values('jah','jah','ei','jah');
insert into Teenus(ost,hooldamine,lising,test_soit)
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

insert into Klient(nimi, perenimi, teenus, salong)
values('Andre','Giant',2,1);
insert into Klient(nimi, perenimi, teenus, salong)
values('Barack','Obama',2,1);
insert into Klient(nimi, perenimi, teenus, salong)
values('Dwayne','Johnson',1,1);
insert into Klient(nimi, perenimi, teenus, salong)
values('Donald','Trump',1,1);
insert into Klient(nimi, perenimi, teenus, salong)
values('Jericho','Iniko',3,3);
insert into Klient(nimi, perenimi, teenus, salong)
values('Aleksandr','Bellen',3,3);
insert into Klient(nimi, perenimi, teenus, salong)
values('Georg','Ots',4,4);
insert into Klient(nimi, perenimi, teenus, salong)
values('Katalin','Novak',4,4);
insert into Klient(nimi, perenimi, teenus, salong)
values('Freidrich','Kreutswald',5,5);
insert into Klient(nimi, perenimi, teenus, salong)
values('Frank','SteinMeier',5,5);
insert into Klient(nimi, perenimi, teenus, salong)
values('Anton','Tammsaare',6,6);
insert into Klient(nimi, perenimi, teenus, salong)
values('Michael','Higgins',6,6);
insert into Klient(nimi, perenimi, teenus, salong)
values('Michael','Jackson',7,7);
insert into Klient(nimi, perenimi, teenus, salong)
values('Serjo','Matarella',7,7);
insert into Klient(nimi, perenimi, teenus, salong)
values('Tom','Hardy',8,8);
insert into Klient(nimi, perenimi, teenus, salong)
values('Andjey','Duda',8,8);
insert into Klient(nimi, perenimi, teenus, salong)
values('Woody','Harrelson',9,9);
insert into Klient(nimi, perenimi, teenus, salong)
values('Sauli','Niinistö',9,9);
insert into Klient(nimi, perenimi, teenus, salong)
values('Alan','Karris',10,10);