insert into guest(first_name,last_name,member_since)
values('Martin','Kemppi','2019-11-11');
insert into guest(first_name,last_name,member_since)
values('Luca','Gluhhov','2020-12-11');
insert into guest(first_name,last_name,member_since)
values('Maksim','Tsepelevits','2021-01-11');
insert into guest(first_name,last_name,member_since)
values('Oleksandr','Bohatyrov','2021-04-11');
insert into guest(first_name,last_name,member_since)
values('Yaroslav','Yekasov','2022-12-11');

insert into room_type(description,max_capacity)
values('President',20);
insert into room_type(description,max_capacity)
values('Kuld',15);
insert into room_type(description,max_capacity)
values('Hobe',12);
insert into room_type(description,max_capacity)
values('Pronks',10);
insert into room_type(description,max_capacity)
values('Tavaline',5);

insert into reservation(date_in,date_out,made_by,guest_id)
values('2022-01-11','2022-02-11','Aleksandr',1)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2023-01-11','2024-02-11','Marina',2)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2022-01-11','2022-04-11','Irina',3)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2022-06-11','2023-02-11','Denis',4)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2022-08-11','2023-02-11','Maksim',5)

insert into reserved_room(number_of_rooms,room_type_id,reservartion_id,status)
values(20,1,1,'makstud')
insert into reserved_room(number_of_rooms,room_type_id,reservartion_id,status)
values(15,2,2,'broneeritud')
insert into reserved_room(number_of_rooms,room_type_id,reservartion_id,status)
values(12,3,3,'broneeritud')
insert into reserved_room(number_of_rooms,room_type_id,reservartion_id,status)
values(10,4,4,'broneeritud')
insert into reserved_room(number_of_rooms,room_type_id,reservartion_id,status)
values(5,5,5,'makstud')

insert into room(number,name,status,smoke,room_type_id)
values('A100','PREMIUM','NOK',1,1)
insert into room(number,name,status,smoke,room_type_id)
values('A200','PREMIUM','OK',1,1)
insert into room(number,name,status,smoke,room_type_id)
values('B100','VIP','NOK',1,1)
insert into room(number,name,status,smoke,room_type_id)
values('B200','VIP','NOK',1,1)
insert into room(number,name,status,smoke,room_type_id)
values('C100','Classic','NOK',1,1)

insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-01-11','2022-02-11',1,1)
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2023-01-11','2024-02-11',2,2)
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-01-11','2022-04-11',3,3)
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-06-11','2023-02-11',4,4)
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-08-11','2023-02-11',5,5)

insert into hosted_at(guest_id,occupied_room_id)
values(1,1)
insert into hosted_at(guest_id,occupied_room_id)
values(2,2)
insert into hosted_at(guest_id,occupied_room_id)
values(3,3)
insert into hosted_at(guest_id,occupied_room_id)
values(4,4)
insert into hosted_at(guest_id,occupied_room_id)
values(5,5)
