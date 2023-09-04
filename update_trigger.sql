create trigger guestUuendamine
on guest
for update
as
insert into logi(kuupaev, kasutaja, andmed, tegevus)
select GETDATE(), USER, 
CONCAT('VANAD - ', deleted.first_name, ', ', deleted.last_name,
' UUED - ', inserted.first_name, ', ', inserted.last_name),
'guest on uuendatud'
from deleted INNER JOIN inserted
on  deleted.id = inserted.id
--kontroll


select * from guest
update guest SET first_name = 'Luca'
where id = 3;
select * from guest;
select * from logi;
