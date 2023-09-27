--92 DDL Trigger SQLS
create trigger trMyFirstTrigger
on database
for CREATE_TABLE
as
begin
print 'New table created'
end

create table Test(Id int)

alter trigger trMyFirstTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
print 'A table has just been created, modified or deleted'
end

create table Test3(Id int)

alter trigger trMyFirstTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table'
end

drop trigger trMyFirstTrigger on database

create trigger trRenameTable
on database
for rename
as
begin
print 'You just renamed something'
end

sp_rename 'Test2', 'Test3' 

--93 Server-Scoped DDL triggerid

create trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop table in the current database'
end

create table Test4(Id int)

create trigger tr_ServerScopeTrigger
on all server
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in any database on the server'
end

DISABLE TRIGGER tr_ServerScopeTrigger on all server

ENABLE TRIGGER tr_ServerScopeTrigger on all server

DROP TRIGGER tr_ServerScopeTrigger on all server

--94 SQL serveri trigeri täitmise järjekord

create trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE
as
begin
print 'Database Scope Trigger'
end 
go

create trigger tr_ServerScopeTrigger
on all server
for CREATE_TABLE
as
begin
print 'Server Scope Trigger'
end
go

create table Test6(Id int)

exec sp_settriggerorder

@triggername = 'tr_DatabaseScopeTrigger', --trigeri nimi
@order = 'none', --järjestik First, Last v None , trigeri järjestik
@stmttype = 'CREATE_TABLE', -- mille jaoks teeme (DDL event / insert, update, delete) 
@namespace = 'DATABASE' --pealkiri , DATABASE, SERVER v NULL
GO

--96 Logon trigger SQL serveris

create trigger tr_LogonAuditTriggers
on all server
for LOGON
as
begin
	declare @LoginName nvarchar(100)

	SET @LoginName = ORIGINAL_LOGIN()

	IF(SELECT COUNT(*)FROM sys.dm_exec_sessions
		WHERE is_user_process = 1
		and original_login_name = @LoginName) > 3
	BEGIN 
		print 'Fourth connection of' +@LoginName + 'blocked'
		rollback
	END
END

Execute sp_readerrorlog
