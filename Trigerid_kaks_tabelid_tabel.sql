create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) Null,
member_since date);

create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int)

create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int FOREIGN KEY REFERENCES guest(id)
);

create table reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int FOREIGN KEY REFERENCES room_type(id),
reservartion_id int FOREIGN KEY REFERENCES reservation(id),
status varchar(20));

create table room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int FOREIGN KEY REFERENCES room_type(id));

create table occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int FOREIGN KEY REFERENCES room(id),
reservation_id int FOREIGN KEY REFERENCES reservation(id));

create table hosted_at(
id int primary key identity(1,1),
guest_id int FOREIGN KEY REFERENCES guest(id),
occupied_room_id int FOREIGN KEY REFERENCES occupied_room(id));

create table logi(
id int primary key identity(1,1),
andmed text,
kuupaev datetime,
kasutaja varchar(100)
);
