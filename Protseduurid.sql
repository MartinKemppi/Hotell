--Protseduurid guest
--Andmete lisamine ja SELECT
use hotell;
go
create procedure lisaGuest
@nimi varchar(80),
@perenimi varchar(80)
as
begin
insert into guest(first_name, last_name)
values(@nimi, @perenimi);
select * from guest;
select * from logi;
end

exec lisaGuest @nimi='Luca', @perenimi='Gluhhov'

--Kustutamine ja SELECT
use hotell;
go
create procedure kustutamineGuest
@kustutaID int
as
begin
select * from guest;
 
delete from guest
where id=@kustutaID;
 
select * from guest;
end
 
exec kustutamineGuest @kustutaID=4;

--Andmete uuendamine sisestatud id järgi

use hotell;
go
create procedure uuendamineGuest
@fname varchar(80),
@id int
as
begin
select * from guest;

update guest set first_name = @fname
where id = @id

select * from guest;
select * from logi;
end

exec uuendamineGuest @fname ='Yaroslav', @id = 3

--Külaliste (guest) arvu leidmine



--? Oma ?

select * from guest
