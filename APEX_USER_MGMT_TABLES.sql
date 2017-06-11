--- APEX User Management ---



-----------------------------------------------------------------------------------------------------
--
-- Stefan Obermeyer 12.2016
--
-- 12.12.2016 SOB created
-- 19.12.2016 SOB modified INSERT/UPDATE Trigger to get UserID for DB and APEX Users
-- 08.01.2017 SOB added Trigger for User INSERTs and Default Role changes.
-- 02.06.2017 SOB added BUILTINs
--
-----------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
-- Status Table for Application, Users, Roles,...
create table "APEX_APP_STATUS" (
app_status_id number not null primary key,
app_status varchar2(64) not null,
app_status_code varchar2(3),
app_status_scope varchar2(20),
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64)
);

create unique index "APEX_APP_STATUS_UNQ" on "APEX_APP_STATUS"(upper(app_status), upper(app_status_scope), app_id);
create index "APEX_APP_STATUS_CODE" on "APEX_APP_STATUS"(app_status_code, app_status);
create index "APEX_APP_STATUS_APP_ID" on "APEX_APP_STATUS"(app_id);

create sequence "APEX_APP_STATUS_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APEX_APP_STATUS_BIU_TRG"
before insert or update on APEX_APP_STATUS
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_status_id is null) then
        select APEX_APP_STATUS_ID_SEQ.nextval
        into :new.app_status_id
        from dual;
    end if;
    select sysdate, nvl(v('APP_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APP_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Application Roles
create table "APEX_APP_ROLE" (
app_role_id number not null primary key,
app_rolename varchar2(64) not null,
app_role_code varchar2(8) null,
app_role_description varchar2(128),
app_role_status_id number,
app_role_scope number,
app_id number,
app_parent_role_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APXAPPROLE_STATUS_FK" foreign key (app_role_status_id) references "APEX_APP_STATUS"(app_status_id) on delete set null
);

alter table "APEX_APP_ROLE" add constraint "APXAPPROLE_PARENT_FK" foreign key (app_parent_role_id)
references "APEX_APP_ROLE"(app_role_id) on delete set null;

create unique index "APEX_APP_ROLE_UNQ" on "APEX_APP_ROLE"(upper(app_rolename), upper(app_role_scope), app_id);
create index "APEX_APP_ROLE_CODE" on "APEX_APP_ROLE"(app_role_code, app_rolename);
create index "APEX_APP_ROLENAME" on "APEX_APP_ROLE"(app_rolename);
create index "APEX_APP_ROLE_STATUS_FK" on "APEX_APP_ROLE"(app_role_status_id);
create index "APEX_APP_ROLE_APP_ID" on "APEX_APP_ROLE"(app_id);

create sequence "APEX_APP_ROLE_ID_SEQ" start with 50 increment by 10 nocache;

create or replace trigger "APEX_APP_ROLE_BIU_TRG"
before insert or update on APEX_APP_ROLE
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_role_id is null) then
        select apex_app_role_id_seq.nextval
        into :new.app_role_id
        from dual;
    end if;
    select sysdate, nvl(v('APP_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APP_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Application User
create table "APEX_APP_USER" (
app_user_id number not null primary key,
app_username varchar2(64) not null,
app_user_email varchar2(64) not null,
app_user_default_role_id number default 1 not null, -- 0 PUBLIC, 1 USER
app_user_code varchar2(8),
app_user_ad_login varchar2(64),
app_user_novell_login varchar2(64),
app_user_first_name varchar2(32),
app_user_last_name varchar2(32),
app_user_adress varchar2(64),
app_user_phone1 varchar2(64),
app_user_phone2 varchar2(64),
app_user_description varchar2(128),
app_user_status_id number default 1,
app_user_parent_user_id number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APXAPPUSER_STATUS_FK" foreign key (app_user_status_id) references "APEX_APP_STATUS"(app_status_id) on delete set null,
constraint "APXAPPUSER_DEFROLE_FK" foreign key (app_user_default_role_id) references "APEX_APP_ROLE"(app_role_id)
);

alter table "APEX_APP_USER" add constraint "APXAPPUSER_PARENT_FK" foreign key (app_user_parent_user_id)
references "APEX_APP_USER"(app_user_id) on delete set null;

create unique index "APEX_APP_USER_UNQ" on "APEX_APP_USER"(upper(app_username), upper(app_user_email), app_id);
create index "APEX_APP_USER_EMAIL" on "APEX_APP_USER"(app_user_email);
create index "APEX_APP_USERNAME" on "APEX_APP_USER"(app_username);
create index "APEX_APP_USER_ADLOG" on "APEX_APP_USER"(app_user_ad_login, app_user_novell_login);
create index "APEX_APP_USER_APP_ID" on "APEX_APP_USER"(app_id);
create index "APEX_APP_USER_STATUS_FK" on "APEX_APP_USER"(app_user_status_id);
create index "APEX_APP_USER_DEFROLE_FK" on "APEX_APP_USER"(app_user_default_role_id);

create sequence "APEX_APP_USER_ID_SEQ" start with 2 increment by 1 nocache;

create or replace trigger "APEX_APP_USER_BIU_TRG"
before insert or update on "APEX_APP_USER"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_user_id is null) then
        select apex_app_user_id_seq.nextval
        into :new.app_user_id
        from dual;
    end if;
    select sysdate, nvl(v('APP_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APP_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- User Role Assignement
create table "APEX_APP_USER_ROLE_MAP" (
app_user_role_map_id number not null,
app_user_id number not null,
app_role_id number not null,
app_id number,
app_user_role_status_id number default 1,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX_APP_USERROLEMAP_PK" primary key (app_user_role_map_id),
constraint "APXAPPUSERROLE_STAT_FK" foreign key (app_user_role_status_id) references "APEX_APP_STATUS"(app_status_id) on delete set null,
constraint "APXAPPUSER_ID_FK" foreign key (app_user_id) references "APEX_APP_USER"(app_user_id) on delete cascade,
constraint "APXAPPROLE_ID_FK" foreign key (app_role_id) references "APEX_APP_ROLE"(app_role_id) on delete cascade
) organization index;

create index "APEX_APP_USERROLMAP_STAT" on "APEX_APP_USER_ROLE_MAP"(app_user_role_status_id);
create unique index "APEX_APP_USERROLEMAP_UNQ" on  "APEX_APP_USER_ROLE_MAP"(app_id, app_user_id, app_role_id);

create sequence "APEX_APP_USERROLE_SEQ" minvalue 0 start with 0 increment by 1 nocache;

create or replace trigger "APEX_APP_USRROL_BIU_TRG"
before insert or update on "APEX_APP_USER_ROLE_MAP"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_user_role_map_id is null) then
        select apex_app_userrole_seq.nextval
        into :new.app_user_role_map_id
        from dual;
    end if;
    select sysdate, nvl(v('APP_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APP_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

------------------------------------------------------------
-- set Roles based on default role setting in APEXP_APP_USER
-- Default Role for each new User = USER
create or replace trigger "APEX_APPUSRDEFROL_TRG"
after insert or update of app_user_default_role_id on "APEX_APP_USER"
referencing old as old new as new
for each row
declare
l_entries number;
begin
  if inserting then
      insert into "APEX_APP_USER_ROLE_MAP" (app_id, app_user_id, app_role_id)
      values (:new.app_id, :new.app_user_id, :new.app_user_default_role_id);
  elsif updating then
        update "APEX_APP_USER_ROLE_MAP"
        set  (app_role_id) = :new.app_user_default_role_id
        where app_user_id = :new.app_user_id
		  and app_id = :new.app_id
        and app_role_id = :old.app_user_default_role_id;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Application System Users, Roles,...
create table "APEX_SYS_BUILTINS" (
app_builtin_id number not null,
app_builtin_parent_id number,
app_id number,
app_user_id number,
app_role_id number,
is_admin number,
is_public number, 
is_default number,
constraint "APXSYSBUILTIN_IA_CHK" check (is_admin in(0, 1)),
constraint "APXSYSBUILTIN_IP_CHK" check (is_public in(0, 1)),
constraint "APXSYSBUILTIN_ID_CHK" check (is_default in(0, 1)),
constraint "APXSYSBUILTIN_PK" primary key (app_builtin_id),
constraint "APXAPPUSR_ID_FK" foreign key (app_user_id) references "APEX_APP_USER"(app_user_id) on delete cascade,
constraint "APXAPPROL_ID_FK" foreign key (app_role_id) references "APEX_APP_ROLE"(app_role_id) on delete cascade,
constraint "APXSYSBUILTINS_FK" foreign key (app_builtin_parent_id) references "APEX_SYS_BUILTINS"(app_builtin_id) on delete set null
) organization index;

create unique index "APEX_SYS_BUILTINS_UNQ" on  "APEX_SYS_BUILTINS"(app_id, app_user_id, app_role_id);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gather Stats for new/all Objects
--------------------------------------------------------------------------------------
begin
dbms_stats.gather_schema_stats(user);
end;
/

--------------------------------------------------------------------------------------
-- Grants
--------------------------------------------------------------------------------------

-- Tables
grant all on "APEX_APP_USER" to "APXADM";
grant all on "APEX_APP_ROLE" to "APXADM";
grant all on "APEX_APP_USER_ROLE_MAP" to "APXADM";
grant all on "APEX_APP_STATUS" to "APXADM";
grant all on "APEX_SYS_BUILTINS" to "APXADM";


