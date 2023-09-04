create trigger guestLisamine
on guest
for insert
as
insert into logi(kuupaev, kasutaja, andmed, tegevus)
select GETDATE(), USER, 
CONCAT(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
from inserted
--kontroll

insert into guest(first_name,last_name,member_since)
values('Martin','Kemppi','2019-11-11');
select * from guest;
select * from logi;


create trigger roomLisamine
on room
for insert
as
insert into logi(kuupaev, kasutaja, andmed, tegevus)
select GETDATE(), USER, 
CONCAT(inserted.number, ', ', inserted.name, ', ', inserted.status,  ', ', inserted.smoke),
'room on lisatud'
from inserted
--kontroll

insert into room(number,name,status,smoke)
values('A100','PREMIUM','NOK',1)
select * from room;
select * from logi;
