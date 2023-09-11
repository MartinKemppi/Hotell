---trigger INSERT SQLS
create trigger roomLisamine
on room
for insert
as
insert into logi(kuupaev, andmed, kasutaja)
select GETDATE(),
CONCAT(inserted.number,', ', inserted.name,', ', inserted.status,', ', inserted.smoke,', ', inserted.room_type_id),
USER
FROM inserted
inner join room_type rt on inserted.room_type_id = rt.id
---kontroll
insert into room(number,name,status,smoke,room_type_id)
values('A120', 'PREMIUM', 'OK', 1,1)
select * from room_type;
select * from room;
select * from logi;

---trigger UPDATE SQLS
create trigger roomUuendamine
on room
for update
as
insert into logi(kuupaev, andmed, kasutaja)
select GETDATE(),
CONCAT(
'VANAD andmed - ', deleted.number,', ', deleted.name,', ', deleted.status,', ', deleted.smoke,', ', rt1.id,
' UUED andmed - ', inserted.number,', ', inserted.name,', ', inserted.status,', ', inserted.smoke,', ', rt2.id
),
USER
FROM deleted
inner join inserted on deleted.id = inserted.id
inner join room_type rt1 on deleted.room_type_id = rt1.id
inner join room_type rt2 on inserted.room_type_id = rt2.id
---kontroll
select * from room;
update room set room_type_id = 2
where name = 'VIP';
select * from room;
select * from logi;

---trigger INSERT XAMPP
insert into logi(kuupaev, andmed, kasutaja)
select NOW(),
CONCAT('uued andmed - ',NEW.number,', ', NEW.name,', ', NEW.status,', ', NEW.smoke,', ', rt.id),
USER()
FROM room r
inner join room_type rt
on r.room_type_id = rt.id
where r.id = NEW.id


---trigger UPDATE XAMPP
insert into logi(kuupaev, andmed, kasutaja)
select GETDATE(),
CONCAT(
'VANAD andmed - ', deleted.number,', ', deleted.name,', ', deleted.status,', ', deleted.smoke,', ', rt1.id,
' UUED andmed - ', inserted.number,', ', inserted.name,', ', inserted.status,', ', inserted.smoke,', ', rt2.id
),
USER
FROM deleted
inner join inserted on deleted.id = inserted.id
inner join room_type rt1 on deleted.room_type_id = rt1.id
inner join room_type rt2 on inserted.room_type_id = rt2.id
