--- APEX User Management Objects ---


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APXDBA Release 1.0.0
--
-- APEX User Management Objects.
-- Objects and Attributes can be changed to your needs.
--
-- 11.02.2017 SO: created
--
--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Status Table for Application, Users, Roles,...
create table "APX$APP_STATUS" (
app_status_id number not null primary key,
app_status varchar2(64) not null,
app_status_code char(8),
app_status_scope varchar2(20),
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64)
);

create unique index "APX$APP_STATUS_UNQ" on "APX$APP_STATUS"(upper(app_status), upper(app_status_scope));
create index "APX$APP_STATUS_CODE" on "APX$APP_STATUS"(app_status_code, app_status);
create index "APX$APP_STATUS_APP_ID" on "APX$APP_STATUS"(app_id);

create sequence "APX$APP_STATUS_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$APP_STATUS_BIU_TRG"
before insert or update on APX$APP_status
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_status_id is null) then
        select APX$APP_STATUS_ID_SEQ.nextval
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


-- Application Roles
create table "APX$APP_ROLE" (
app_role_id number not null primary key,
app_rolename varchar2(64) not null,
app_role_code char(8) null,
app_role_description varchar2(128),
app_role_status_id number,
app_role_scope number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$APPROLE_STATUS_FK" foreign key (app_role_status_id) references "APX$APP_STATUS"(app_status_id) on delete set null
);

create unique index "APX$APP_ROLE_UNQ" on "APX$APP_ROLE"(app_id, upper(trim(app_rolename)), upper(trim(app_role_scope)));
create index "APX$APP_ROLE_CODE" on "APX$APP_ROLE"(app_rolename, app_id, app_role_code);
create index "APX$APP_ROLENAME" on "APX$APP_ROLE"(app_rolename, app_id);
create index "APX$APP_ROLE_STATUS_FK" on "APX$APP_ROLE"(app_role_status_id, app_id);
create index "APX$APP_ROLE_APP_ID" on "APX$APP_ROLE"(app_id);

create sequence "APX$APP_ROLE_ID_SEQ" start with 50 increment by 1 nocache;

create or replace trigger "APX$APP_ROLE_BIU_TRG"
before insert or update on "APX$APP_ROLE"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_role_id is null) then
        select APX$APP_ROLE_ID_SEQ.nextval
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

-- Application User
create table "APX$APP_USER" (
app_user_id number not null primary key,
app_username varchar2(64) not null,
app_user_email varchar2(64) not null,
app_user_default_role_id number default 1 not null, -- 0 PUBLIC; 1 USER
app_user_code char(12),
app_id number,
app_user_pwd varchar2(64),
app_user_first_name varchar2(32),
app_user_last_name varchar2(32),
app_user_adress varchar2(64),
app_user_phone1 varchar2(64),
app_user_phone2 varchar2(64),
app_user_description varchar2(128),
app_user_status_id number default 1,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$APPUSER_STATUS_FK" foreign key (app_user_status_id) references "APX$APP_STATUS"(app_status_id) on delete set null,
constraint "APX$APPUSER_DEFROLE_FK" foreign key (app_user_default_role_id) references "APX$APP_ROLE"(app_role_id) on delete set null
);

create unique index "APX$APP_USER_UNQ" on "APX$APP_USER"(app_id, upper(trim(app_username)), upper(trim(app_user_email)));
create index "APX$APP_USER_EMAIL" on "APX$APP_USER"(app_user_email);
create index "APX$APP_USERNAME" on "APX$APP_USER"(app_username, app_id, app_user_default_role_id);
create index "APX$APP_USER_DEFROLID" on "APX$APP_USER"(app_user_default_role_id, app_id);
create index "APX$APP_USER_STATUS_FK" on "APX$APP_USER"(app_user_status_id, app_id);


create sequence "APX$APP_USER_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$APP_USER_BIU_TRG"
before insert or update on "APX$APP_USER"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_user_id is null) then -- generate id
        select APX$APP_user_id_seq.nextval
        into :new.app_user_id
        from dual;
    end if;
    -- audit columns
    select sysdate, nvl(v('APP_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    -- audit columns
    select sysdate, nvl(v('APP_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/


-- User Role Assignement
create table "APX$APP_USER_ROLE_MAP" (
app_user_role_map_id number not null primary key,
app_user_id number not null,
app_role_id number not null,
app_user_role_status_id number default 1,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$APPUSERROLE_STAT_FK" foreign key (app_user_role_status_id) references "APX$APP_STATUS"(app_status_id) on delete set null,
constraint "APX$APPUSER_ID_FK" foreign key (app_user_id) references "APX$APP_USER"(app_user_id) on delete cascade,
constraint "APX$APPROLE_ID_FK" foreign key (app_role_id) references "APX$APP_ROLE"(app_role_id) on delete cascade
) organization index;

create unique index "APX$APP_USERROLEMAP_UNQ" on "APX$APP_USER_ROLE_MAP"(app_id, app_user_id, app_role_id);

create index "APX$APP_USERROLEMAP_STATUS_FK" on "APX$APP_USER_ROLE_MAP"(app_user_role_status_id, app_id);
create index "APX$APP_USERROLEMAP_USERID_FK" on "APX$APP_USER_ROLE_MAP"(app_user_id);
create index "APX$APP_USERROLEMAP_ROLEID_FK" on "APX$APP_USER_ROLE_MAP"(app_role_id);

create sequence "APX$APP_USERROLE_SEQ" minvalue 0 start with 0 increment by 1 nocache;

create or replace trigger "APX$APP_USERROLE_BIU_TRG"
before insert or update on "APX$APP_USER_ROLE_MAP"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.app_user_role_map_id is null) then
        select "APX$APP_USERROLE_SEQ".nextval
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

-- set Roles based on default role setting in APEXP_APP_USER
create or replace trigger "APX$APP_USER_DEFROLE_AIU_TRG"
after insert or update of app_user_default_role_id on "APX$APP_USER"
referencing old as old new as new
for each row
begin
  if inserting then
      insert into"APX$APP_USER_ROLE_MAP" (app_id, app_user_id, app_role_id)
      values (:new.app_id, :new.app_user_id, :new.app_user_default_role_id);
  elsif updating then
      update "APX$APP_USER_ROLE_MAP"
      set  (app_role_id) =:new.app_user_default_role_id
      where app_id = :new.app_id
      and app_user_id = :new.app_user_id
      and app_role_id = :old.app_user_default_role_id;
  end if;
end;
/


-- Apex User Sessions
create table "APX$APP_USER_SESSION" (
app_user_session_id number not null primary key,
app_username varchar2(64) not null,
app_user_email varchar2(64),
app_id number,
app_ws_id number,
app_user_pwd varchar2(64),
app_user_cookie_name varchar2(64),
app_user_last_login timestamp default current_timestamp,
app_user_session_seconds number default 900
);


create sequence "APX$APP_USERSESS_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$APP_USERSESS_BI_TRG"
before insert on "APX$APP_USER_SESSION"
referencing old as old new as new
for each row
begin
  if (:new.app_user_session_id is null) then
      select "APX$APP_USERSESS_SEQ".nextval
      into :new.app_user_session_id
      from dual;
  end if;
  select current_timestamp, nvl(v('APP_USER'), user)
  into :new.app_user_last_login, :new.app_username
  from dual;
end;
/


create or replace procedure "REGISTER_LOGIN" (
p_session in varchar2 default v('SESSION'),
p_username in varchar2 default v('APP_USER'),
p_app_id in number default v('APP_ID'),
p_ws_id in number default v('FLOW_ID'),
p_userpw in varchar2
)
is
begin
  insert into APX$APP_USER_SESSION (APP_USER_SESSION_ID,APP_USERNAME,APP_ID,APP_WS_ID,APP_USER_PWD)
  values (p_session, p_username, p_app_id, p_ws_id, apx.encrypt(p_userpw));
commit;
exception when others then
  rollback;
  raise;
end;
/
