
---------------------------------------------------------------
       ---- 17/12/17 21:09 Begin of SQL Build APX ----


-- SQL Drop File
-- whenever oserror exit;
--whenever sqlerror exit sql.sqlcode;
set pages 0 line 120 define on verify off feed off echo off
alter session set nls_date_format='DD.MM.YYYY HH24:MI:SS';
select sysdate || '     Dropping: "&1. Objects"' as install_message
from dual;

---------------------------------------------------------------
prompt
prompt Dropping DB Model (Tables)
prompt


-------------------------------------------------------------------------------
-- Apex User Content and Attachements
prompt APX$ATTACHEMENT
drop view        "APEX_ATTACHEMENTS";
drop synonym     "APEX_ATTACHEMENT";
drop sequence    "APX$ATTACHEMENT_ID_SEQ";
drop trigger     "APX$ATTACHEMENT_BIU_TRG";
drop table       "APX$ATTACHEMENT" purge;


prompt APX$CONTENT
drop view        "APEX_WEB_CONTENT";
drop synonym     "APEX_CONTENT";
drop sequence    "APX$CONTENT_ID_SEQ";
drop trigger     "APX$CONTENT_BIU_TRG";
drop table       "APX$CONTENT" purge;


prompt APX$AUTHOR
drop view        "APEX_AUTHORS";
drop synonym     "APEX_AUTHOR";
drop sequence    "APX$AUTHOR_ID_SEQ";
drop trigger     "APX$AUTHOR_BIU_TRG";
drop table       "APX$AUTHOR" purge;


-------------------------------------------------------------------------------
-- Apex Application Sources
prompt APX$SOURCE
drop synonym  "APEX_SOURCE";

drop sequence "APX$SOURCE_ID_SEQ";
drop trigger "APX$SOURCE_BIU_TRG";

drop table "APX$SOURCE" purge;


-------------------------------------------------------------------------------
-- Apex User Session Tables and Views
prompt APX$USR_SESSION
drop synonym     "APEX_USER_SESSION";
drop view        "APEX_USER_SESSIONS";
drop sequence    "APX$USERSESS_SEQ";
drop trigger     "APX$USERSESS_BI_TRG";
drop table       "APX$USR_SESSION"  purge;


prompt APX$BUILTIN
drop synonym     "APEX_BUILTIN";
drop table       "APX$BUILTIN"       purge;


prompt APX$USER_ROLE_MAP
drop synonym     "APEX_USER_ROLE_MAP";
drop trigger     "APX$USRDEFROL_TRG";
drop sequence    "APX$USERROLE_SEQ";
drop trigger     "APX$USRROL_BIU_TRG";
drop table       "APX$USER_ROLE_MAP" purge;


prompt APX$USER_REGISTRATION
drop synonym     "APEX_USER_REGISTRATION";
drop synonym     "APEX_USREG";
drop sequence    "APX$USREG_ID_SEQ";
drop trigger     "APX$USRREG_BIU_TRG";
drop table       "APX$USER_REG"      purge;

prompt APX$USER
drop synonym     "APEX_USER";
drop sequence    "APX$USER_ID_SEQ";
drop trigger     "APX$USER_BIU_TRG" ;
drop table       "APX$USER"          purge;


prompt APX$ROLE
drop synonym     "APEX_ROLE";
drop sequence    "APX$ROLE_ID_SEQ";
drop trigger     "APX$ROLE_BIU_TRG" ;
drop table       "APX$ROLE"          purge;


prompt APX$PRIVILEGE
drop synonym     "APEX_PRIVILEGE";
drop sequence    "APX$PRIV_ID_SEQ";
drop trigger     "APX$PRIV_BIU_TRG";
drop table       "APX$PRIVILEGE"     purge;


prompt APX$DOMAIN
drop synonym     "APEX_DOMAIN";
drop sequence    "APX$DOMAIN_ID_SEQ";
drop trigger     "APX$DOMAIN_BIU_TRG";
drop table       "APX$DOMAIN"        purge;


prompt APX$GROUP
drop synonym     "APEX_GROUP";
drop sequence    "APX$GROUP_ID_SEQ";
drop trigger     "APX$GROUP_BIU_TRG";
drop table       "APX$GROUP"         purge;


-------------------------------------------------------------------------------
-- Core Tables and Objects

prompt APX$APP
drop synonym  "APEX_APP";

drop sequence "APX$APP_ID_SEQ";
drop trigger "APX$APP_BIU_TRG";

drop table "APX$APP" purge;


prompt APX$MIME
drop synonym  "APEX_MIME_TYPES";

drop sequence "APX$MIME_SEQ";
drop trigger  "APX$MIME_BIU_TRG";

drop table "APX$MIME" purge;


prompt APX$CFG
drop synonym  "APEX_CONFIG";
drop synonym  "APEX_SETTING";

drop sequence "APX$CFG_SEQ";
drop trigger "APX$CFG_BIU_TRG";

drop table "APX$CFG" purge;


prompt APX$OPT
drop synonym  "APEX_OPTION";

drop sequence "APX$OPT_ID_SEQ";
drop trigger "APX$OPT_BIU_TRG";

drop table "APX$OPT" purge;


prompt APX$PRC
drop synonym  "APEX_PROCESS";

drop sequence "APX$PRC_ID_SEQ";
drop trigger "APX$PRC_BIU_TRG";

drop table "APX$PRC" purge;


prompt APX$STATUS
drop synonym  "APEX_SYS_STATUS";

drop sequence    "APX$STATUS_ID_SEQ";
drop trigger     "APX$STATUS_BIU_TRG";

drop table       "APX$STATUS" purge;


prompt APX$CTX
drop synonym  "APEX_SYS_CONTEXT";

drop sequence "APX$CTX_ID_SEQ";
drop trigger "APX$CTX_BIU_TRG";

drop table "APX$CTX" purge;


prompt APX$
drop synonym  "APEX_APX";

drop sequence "APX$_ID_SEQ";
drop trigger "APX$_BIU_TRG";

drop table "APX$" purge;


---------------------------------------------------------------
prompt
prompt Dropping Interfaces required

prompt
prompt APX$KEY
drop function "APXKEY";

prompt APX_ENCRYPT
drop function "APX_ENCRYPT";

prompt APX_DECRYPT
drop function "APX_DECRYPT";

prompt "APX_GET_VERSION"
drop function "APX_GET_VERSION";

prompt "APX_CONFIG_VIEWS"
drop view "APEX_CONFIG_STATUS";
drop view "APEX_MIME_ICON_CLASSES";

prompt "APX_SEC_CODE_VIEWS"
drop view "APEX_SEC_CODE3";
drop view "APEX_SEC_CODE4";
drop view "APEX_SEC_CODE6";
drop view "APEX_SEC_CODE_PICKER";

prompt "APEX_OBJECTS"
drop view "APEX_OBJECTS";

prompt  "APEX_CONTEXT"
drop view  "APEX_CONTEXT";

prompt APEX_CONFIG
drop view "APEX_CONFIG_CONTEXT";
drop view "APEX_CONFIGURATION";

prompt APEX_STATUS
drop view "APEX_STATUS";


---------------------------------------------
-- Procedures and Functions

prompt "APX_GET_TOKEN"
drop function "APX_GET_TOKEN";

prompt
prompt "REGISTER_LOGIN"
drop procedure "REGISTER_LOGIN";


---------------------------------------------------------------
prompt
prompt Dropping Packages

prompt
prompt APX
drop package "APX";
prompt

---------------------------------------------------------------

set pages 0 line 120 define off verify off feed off echo off timing off

--exit;

---------------------------------------------------------------

---------------------------------------------------------------
--whenever oserror exit
whenever sqlerror exit sql.sqlcode;
set pages 0 line 120 define on verify off feed on timing on echo off

-----------------------------------------------------------------------------------------------------
-- Apex Object Table to provides Types and Indetifiers to the APX Schema

-- drop first
-- drop synonym  "APEX_APX";

-- drop sequence "APX$_ID_SEQ";
-- drop trigger "APX$_BIU_TRG";

-- drop table "APX$" purge;

-----------------------------------------------------------------------------------------------------
-- Apex Object Table to provides Types and Indetifiers to the APX Schema
create table "APX$"(
apx_id number not null,
apx_object varchar2(64) not null,
apx_obj_code varchar2(12),
apx_parent_object_id number,
apx_sec_level number default 0,
app_id number,
apx_object_is_generic number generated always as (case when app_id = 0 then 1 else 0 end),
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$_ID" primary key (apx_id),
constraint "APX$_PARENT_FK" foreign key (apx_parent_object_id) references "APX$"(APX_ID)
);

create unique index "APX$_UNQ1" on "APX$"(apx_id, app_id);
create unique index "APX$_UNQ2" on "APX$"(upper(apx_object), upper(apx_obj_code), app_id);

create sequence "APX$_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$_BIU_TRG"
before insert or update on "APX$"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_id is null) then
        select "APX$_ID_SEQ".NEXTVAL
        into :new.apx_id
        from dual;
    end if;
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_APX"               for "APX$";

-------------------------------------------------------------------------------------------------
-- Views on APX$

-- APEX_OBJECTS View
create view "APEX_OBJECTS"
as
select
    a.apx_id as apex_object_id,
    a.apx_object as apex_object,
    a.apx_obj_code as apex_object_code,
    (select b.apx_object from "APX$" b
     where b.apx_id = a.apx_parent_object_id) as apex_parent_object,
    a.apx_sec_level as security_level,
    a.app_id,
    a.apx_object_is_generic as object_is_generic,
    a.created,
    a.created_by,
    a.modified,
    a.modified_by
FROM "APEX_APX" a
order by 1;


-------------------------------------------------------------------------------------------------
-- INSERTING into APX$
set define off;

insert into "APX$" (apx_id, apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values (0,  'SYSTEM', null, null, 0, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('APPLICATION', 'APP', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SECURITY', 'SEC', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SERVER', 'SRV', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('BROWSER', 'BRW', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('USER', 'USR', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PROCESS', 'PRC', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CONTEXT', 'CTX', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('OPTION', 'OPT', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CONFIGURATION', 'CONFIG', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('LANGUAGE', 'LANG', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('METHOD', 'METH', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('ARGUMENT', 'ARG', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CLASS', 'CLASS', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('OBJECT', 'OBJ', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TYPE', 'TYPE', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SERVICE', 'SRV', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SCHEDULE', 'JOB', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PROTOCOL', 'PROT', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FRAMEWORK', 'FRW', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FORMAT', 'FRM', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CODE', 'CODE', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TEXT', 'TXT', null, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('APPLICATION PROGRAMMING INTERFACE', 'API', null, 1, 0);
-- sub types
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DATA', 'DAT', 14, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TOKEN', 'TKN', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('REALM', 'REALM', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('APPLICATION_PROCESS', 'APPRC', 6, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SQL', 'SQL', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PL/SQL', 'PLSQL', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('JAVASCRIPT', 'JS', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('JQUERY', 'JQ', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('ANGULAR', 'NG', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TYPESCRIPT', 'TS', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SASS', 'SASS', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SCSS', 'SCSS', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CSS', 'CSS', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('HTML', 'HTML', 10, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CALL', 'CALL', 11, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('ASYNC_CALL', 'ASYNC', 11, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SOAP', 'SOAP', 11, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('AJAX', 'AJAX', 11, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CALLBACK', 'CB', 11, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('REST', 'REST', 23, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('HTTP', 'HTTP', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('HTTPS', 'HTTPS', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FTP', 'FTP', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FTPS', 'FTPS', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SSH', 'SSH', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TELNET', 'TELNET', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SQLNET', 'SQLNET', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('NAMED_PIPES', 'NP', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('STREAM', 'STREAM', 18, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('JSON', 'JSON', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CSV', 'CVS', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('XML', 'XML', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('XTD', 'XTD', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('XLS', 'XLS', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PDF', 'PDF', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('IMAGE', 'IMG', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('BINARY', 'BIN', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CHARACTER', 'CHAR', 20, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('OBJECT', 'JSOBJ', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('ARRAY', 'JSARR', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('STRING', 'JSSTR', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('NUMBER', 'JSINT', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DATE', 'JSDATE', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('BOOLEAN', 'JSBOOL', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FUNCTION', 'JSFNC', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('VARIABLE', 'JSVAR', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CONSTANT', 'JSCONST', 30, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('IDENTIFIER', 'ID', 12, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('VALUE', 'VAL', 12, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('INSERT', 'INS', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('UPDATE', 'UPD', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MERGE', 'MERGE', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DELETE', 'DEL', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SELECT', 'SEL', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CREATE', 'CRE', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DROP', 'DRP', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('ALTER', 'ALT', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('GRANT', 'GRANT', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('REVOKE', 'REV', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TABLE', 'TAB', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('INDEX ', 'IDX', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MATERIALIZED_VIEW', 'MV', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('VIEW', 'VW', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SEQUENCE', 'SEQ', 28, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PACKAGE', 'PKG', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PACKAGE_SPEC', 'PKS', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PACKAGE_BODY', 'PKB', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PROCEDURE', 'PRC', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FUNCTION', 'FNC', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TRIGGER', 'TRG', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('FUNCTION_BODY_RETURNING_BOOLEAN', 'FNCRB', 29, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('REQUEST', 'REQ', 44, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('RESPONSE', 'RSP', 95, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('GET', 'GET', 95, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PUT', 'PUT', 95, 2, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('POST', 'POST', 95, 3, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DELETE', 'DELETE', 95, 4, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MIME_TYPE_CLASS','MTC', 36, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('APPLICATION','MAPP', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('AUDIO','MAUDIO', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CHEMICAL','MCHEM', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('DRAWING','MDRAW', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('I-WORLD','MIWRLD', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('IMAGE','MIMG', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MESSAGE','MMSG', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MODEL','MMOD', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MULTIPART','MMULTI', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('MUSIC','MMUSIC', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PALEOVU','MPAVL', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('TEXT','MTXT', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('VIDEO','MVIDEO', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('WINDOWS','MWIN', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('WWW','MWWW', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('X-CONFERENCE','MXCONF', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('X-MUSIC','MXMUSIC', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('X-WORLD','MXWRLD', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('XGL','MXGL', 101, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('SECURE_SOCKET_LAYER','SSL', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CERTIFICATE','CERT', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('KEY','KEY', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('AUTHORIZATION','AUTHORIZE', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('AUTHENTICATION', 'AUTH', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('OAUTH', 'OAUTH', 125, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('CREDENTIALS', 'CRED', 2, 1, 0);
insert into "APX$" (apx_object, apx_obj_code, apx_parent_object_id, apx_sec_level, app_id)
values ('PUBLIC_PRIVATE_KEY', 'PPK', 2, 1, 0);

commit;

-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures,  Functions,  Authorization Items, ...)

-- -- drop first
-- drop synonym  "APX_CONTEXT";

-- drop sequence "APX$CTX_ID_SEQ";
-- drop trigger "APX$CTX_BIU_TRG";

-- drop table "APX$CTX" purge;

-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures,  Functions,  Authorization Items, ...)
create table "APX$CTX"(
apx_context_id number not null,  -- extra field for certain predefined values like 0,  1, ...
apx_context varchar2(128) not null,
apx_context_value varchar2(4000),
apx_context_code varchar2(12),
apx_parent_context_id number,
apx_sub_context_id number,
apx_context_sec_level number default 0,
apx_context_type_id number,
apx_context_subtype_id number,
app_id number,
apx_context_is_generic number generated always as (case when app_id = 0 then 1 else 0 end),
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$CTX_ID" primary key (apx_context_id),
constraint "APX$CTX_TYPE_FK" foreign key (apx_context_type_id) references "APX$"(apx_id) on delete set null,
constraint "APX$CTX_SUBTYPE_FK" foreign key (apx_context_subtype_id) references "APX$"(apx_id) on delete set null,
constraint "APX$CTX_PARENT_FK" foreign key (apx_parent_context_id) references "APX$CTX"(apx_context_id),
constraint "APX$CTX_SUBCONTEXT_FK" foreign key (apx_sub_context_id) references "APX$CTX"(apx_context_id)
);

create unique index "APX$CTX_UNQ1" on "APX$CTX"(apx_context_id, app_id);
create unique index "APX$CTX_UNQ2" on "APX$CTX"(upper(apx_context),  upper(apx_context_code), app_id);
create index "APX$CTX_TYPE_FK" on "APX$CTX" (apx_context_type_id);
create index "APX$CTX_SUBTYPE_FK" on "APX$CTX" (apx_context_subtype_id);
create index "APX$CTX_SUBCONTEXT_FK" on "APX$CTX" (apx_sub_context_id);

create sequence "APX$CTX_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$CTX_BIU_TRG"
before insert or update on "APX$CTX"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_context_id is null) then
        select "APX$CTX_ID_SEQ".NEXTVAL
        into :new.apx_context_id
        from dual;
    end if;
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_SYS_CONTEXT"               for "APX$CTX";


-------------------------------------------------------------------------------------------------
-- Views on APX$CTX

create view  "APEX_CONTEXT"
as
select
    ctx.apx_context_id as apex_context_id,
    ctx.apx_context_code as apx_context_code,
    ctx.apx_context as apex_context,
    ctx.apx_sub_context_id as apex_sub_context,
    ctx.apx_context_value as apex_context_value,
    ctx.apx_parent_context_id as apex_parent_context_id,
    (select b.apx_context from "APEX_SYS_CONTEXT" b
     where b.apx_context_id = ctx.apx_parent_context_id) as apex_parent_context,
    ctx.apx_context_sec_level as security_level,
    ctx.apx_context_type_id as apex_object_id,
    apx.apex_object as apex_object,
    ctx.apx_context_subtype_id as apex_sub_object_id,
    apxsub.apex_object as apex_subobject,
    ctx.app_id as app_id,
    ctx.apx_context_is_generic as is_generic_context,
    ctx.created,
    ctx.created_by,
    ctx.modified,
    ctx.modified_by
FROM "APEX_SYS_CONTEXT" ctx
left outer join "APEX_OBJECTS" apx
on (ctx.apx_context_type_id = apx.apex_object_id)
left outer join "APEX_OBJECTS" apxsub
on (ctx.apx_context_subtype_id = apxsub.apex_object_id)
order by 1;


-- APEX LOV for Apex Config
create view "APEX_CONFIG_CONTEXT"
as
SELECT
    ctx.apx_context_id as config_context_id,
    ctx.apx_context as config_context
FROM
    "APEX_SYS_CONTEXT" ctx
order by 1;



-------------------------------------------------------------------------------------------------
-- INSERTING into APX$CTX
set define off;

insert into "APX$CTX" (apx_context_id, apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values (0,  'DEFAULT', null, null, 0, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('HOST', 'HOST', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SECURITY', 'SEC', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SERVICE', 'SRV', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('DATABASE', 'DB', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('APPLICATION_SERVER', 'APPSRV', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('WEB_SERVER', 'WEBSRV', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('ORACLE_RESTFUL_SERVICE', 'ORDS', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('APEX', 'APX', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('WORKSPACE', 'WS', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('APPLICATION', 'APP', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('PAGE', 'PAGE', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('REGION', 'REGION', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('REPORT', 'REP', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('ITEM', 'ITEM', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('PROCESS', 'PRC', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SUBSCRIBER', 'SUB', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('PUBLISHER', 'PUB', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('FILES', 'FILES', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('VIEW', 'VIEW', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('MODEL', 'MODL', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('TEMPLATE', 'TMPL', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('THEME', 'THM', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('USER', 'USR', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('GROUP', 'GRP', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('ROLE', 'ROLE', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('DOMAIN', 'DOM', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('ACCOUNT', 'ACC', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SESSION', 'SES', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('AUTHENTICATION', 'AUTH', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('AUTHORIZATION', 'AUT', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SERVER', 'SERVER', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('CLIENT', 'CLIENT', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('DESIGN', 'DESIGN', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('MEDIA', 'MEDIA', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('MODEL', 'MODEL', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('STAGING', 'STG', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('INTEGRATION', 'INT', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('PRODUCTION', 'PRD', null, 1, 0);
insert into "APX$CTX" (apx_context, apx_context_code, apx_parent_context_id, apx_context_sec_level, app_id)
values ('SETTING', 'SET', null, 1, 0);

commit;

update "APX$CTX" set apx_context_type_id = 0,
                     apx_context_subtype_id = 9
where apx_context_is_generic = 1;

commit;

-----------------------------------------------------------------------------------------------------
-- App Status Table (for all sorts of Apex Object Types)

-- @requires "APX$" "APX$CTX"
-----------------------------------------------------------------------------------------------------

-- drop first
-- drop synonym     "APEX_SYS_STATUS";

-- drop sequence    "APX$STATUS_ID_SEQ";
-- drop trigger     "APX$STATUS_BIU_TRG";

-- drop table       "APX$STATUS" purge;

-----------------------------------------------------------------------------------------------------
-- Status Table for Application, Users, Roles,...
create table "APX$STATUS" (
apx_status_id number not null,
apx_status varchar2(64) not null,
apx_status_code varchar2(8),
apx_status_ctx_id number,
apx_parent_status_id number,
apx_status_sec_level number default 0,
apx_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$STATUS_ID" primary key (apx_status_id),
constraint "APX$STATUS_PARENT_FK" foreign key (apx_parent_status_id) references "APX$STATUS"(apx_status_id),
constraint "APX$STATUS_CTX_FK" foreign key (apx_status_ctx_id) references "APX$CTX"(apx_context_id)
);

create unique index "APX$STATUS_UNQ1" on "APX$STATUS"(apx_status_id, apx_id);
create unique index "APX$STATUS_UNQ2" on "APX$STATUS"(upper(apx_status), apx_status_ctx_id, apx_id);
create index "APX$STATUS_CODE_IDX" on "APX$STATUS"(apx_status_code, apx_status);
create index "APX$STATUS_apx_ID_IDX" on "APX$STATUS"(apx_id);

create sequence "APX$STATUS_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$STATUS_BIU_TRG"
before insert or update on "APX$STATUS"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_status_id is null) then
        select "APX$STATUS_ID_SEQ".NEXTVAL
        into :new.apx_status_id
        from dual;
    end if;
    select sysdate, nvl(v('apx_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('apx_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_SYS_STATUS"                    for "APX$STATUS";

-----------------------------------------------------------------------------------------------------
-- Views on APX$STATUS

create view "APEX_STATUS"
as
 select s.apx_status_id as apex_status_id,
           s.apx_status as apex_status,
           s.apx_status_code as apex_status_code,
           s.apx_status_ctx_id as apex_status_context_id,
           ctx.apex_context as apex_status_context,
           s.apx_parent_status_id as apex_parent_status_id,
          (select b.apx_status from "APEX_SYS_STATUS" b
           where b.apx_status_id = s.apx_parent_status_id) as apex_parent_status,
           s.apx_status_sec_level as apex_status_security_level,
           s.apx_id as app_id
from  "APEX_SYS_STATUS" s
left outer join "APEX_CONTEXT" ctx
on (s.apx_status_ctx_id = ctx.apex_context_id)
order by 1;


-----------------------------------------------------------------------------------------------------
-- Status Data

-- DEFAULT Status first
insert into "APX$STATUS" (apx_status_id, apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('0', 'DEFAULT', 'DEF', (select apx_context_id from "APX$CTX" WHERE apx_context = 'DEFAULT'), V('FB_FLOW_ID'));
-- Status by Context
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('ON', 'ON', (select apx_context_id from "APX$CTX" WHERE apx_context = 'SETTING'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('OFF', 'OFF', (select apx_context_id from "APX$CTX" WHERE apx_context = 'SETTING'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('ENABLED', 'ENA', (select apx_context_id from "APX$CTX" WHERE apx_context = 'APPLICATION'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('DISABLED', 'DIS', (select apx_context_id from "APX$CTX" WHERE apx_context = 'APPLICATION'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('OPEN', 'OPN', (select apx_context_id from "APX$CTX" where apx_context = 'ACCOUNT'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('LOCKED', 'LCK', (select apx_context_id from "APX$CTX" WHERE apx_context = 'ACCOUNT'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('EXPIRED', 'XPR', (select apx_context_id from "APX$CTX" WHERE apx_context = 'ACCOUNT'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('SUSPENDED', 'SUS', (select apx_context_id from "APX$CTX" WHERE apx_context = 'ACCOUNT'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('UP', 'UP', (select apx_context_id from "APX$CTX" WHERE apx_context = 'APPLICATION'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('DOWN', 'DWN', (select apx_context_id from "APX$CTX" where apx_context = 'APPLICATION'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('NEW', 'NEW', (select apx_context_id from "APX$CTX" WHERE apx_context = 'USER'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('REGISTERED', 'REG', (select apx_context_id from "APX$CTX" where apx_context = 'USER'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('VERIFIED', 'VER', (select apx_context_id from "APX$CTX" WHERE apx_context = 'USER'), v('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('VALIDATED', 'VALI', (select apx_context_id from "APX$CTX" where apx_context = 'USER'), V('FB_FLOW_ID'));
insert into "APX$STATUS" (apx_status, apx_status_code, apx_status_ctx_id, apx_id)
values ('VALID', 'VAL', (select apx_context_id from "APX$CTX" where apx_context = 'USER'), V('FB_FLOW_ID'));

commit;



-----------------------------------------------------------------------------------------------------
-- Status Views

-- Config Status
create or replace view "APEX_CONFIG_STATUS"
as
SELECT
    apx_status_id as config_status_id,
    apx_status as config_status
FROM
    "APX$STATUS"
where apx_status
      in ('DISABLED', 'ENABLED')
order by 1;
/


-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures, Functions, Authorization Items,...)

-- requires APX$APP_TYPES

-- drop first
-- drop synonym  "APEX_PROCESS";

-- drop sequence "APX$PRC_ID_SEQ";
-- drop trigger "APX$PRC_BIU_TRG";

-- drop table "APX$PRC" purge;

-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures, Functions, Authorization Items,...)
create table "APX$PRC" (
apx_process_id number not null, -- extra field for certain predefined values like 0, 1,...
apx_process varchar2(64) not null,
apx_process_code varchar2(12),
apx_process_description varchar2(4000),
apx_process_source clob,
apx_parent_process_id number,
apx_process_status_id number,
apx_process_ctx_id number,
apx_process_sec_level number default 0,
apx_process_type_id number,
app_id number,
apx_process_is_generic number generated always as (case when app_id = 0 then 1 else 0 end),
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$PRC_ID" primary key (apx_process_id),
constraint "APX$PRC_TYPE_FK" foreign key (apx_process_type_id) references "APX$"(apx_id) on delete set null,
constraint "APX$PRC_PARENT_FK" foreign key (apx_parent_process_id) references "APX$PRC"(apx_process_id) on delete set null,
constraint "APX$PRC_STATUS_FK" foreign key (apx_process_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$PRC_CTX_FK" foreign key (apx_process_ctx_id) references "APX$CTX"(apx_context_id) on delete set null
);

create unique index "APX$PRC_UNQ1" on "APX$PRC"(apx_process_id, app_id);
create unique index "APX$PRC_UNQ2" on "APX$PRC"(upper(apx_process), apx_process_ctx_id, app_id);

create sequence "APX$PRC_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$PRC_BIU_TRG"
before insert or update on "APX$PRC"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_process_id is null) then
        select "APX$PRC_ID_SEQ".NEXTVAL
        into :new.apx_process_id
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

create synonym  "APEX_PROCESS"              for "APX$PRC";


---------------------------------------------------
-- INSERTING into APX$PRC
set define off;

insert into "APX$PRC" (apx_process_id, apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values (0,  'DEFAULT', 'Default Process', null, 0, 0, 'DEF', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('APPLICATION', 'Application Process', 0, 1, 1, 'APPPRC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('USER', 'User Process', 1, 0, 5, 'USRPRC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('PAGE', 'Page Process', 1, 0, 14, 'PAGEPRC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('ITEM', 'Item Process', 1, 0, 14, 'ITEMPRC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('PLSQL', 'PL/SQL Process', 1, 0, 15, 'PLSQL', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('AUTHENTICATION', 'Authentication Process', 1, 0, 2, 'AUTH', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('AUTHORIZATION', 'Authorization Process', 1, 0, 2, 'AUT', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('ENCRYPT', 'Encrypt Strings', 1, 2, 2, 'ENC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('DECRYPT', 'Decrypt Strings', 1, 3, 2, 'DEC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('LOGIN', 'Login Process', 1, 2, 14, 'LOGIN', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('LOGOFF', 'Logoff Process', 1, 2, 14, 'LOGOFF', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('DML_PRC', 'DML Process', 1 , 4, 15, 'DMLPRC', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('DYNAMIC_ACTION', 'Dynamic Action fired by Page/Item Event', 1, 1, 17, 'DA', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('PAGE_ONLOAD', 'Page Body Onload Process', 1, 1, 4, 'ONLOAD', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('SCRIPT', 'Script that get''s executed in Browser', 1, 1, 4, 'SCR', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('SCHEDULE', 'Scheduler in Database or Application Server', 1, 1, 6, 'SCHED', 0);
insert into "APX$PRC" (apx_process, apx_process_description, apx_parent_process_id, apx_process_sec_level, apx_process_type_id, apx_process_code, app_id)
values ('CRON', 'CRON Jobs triggered on Server', 1, 1, 6, 'CRON', 0);


commit;
-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures, Functions, Authorization Items,...)

-- requires APX$APP_TYPES

-- drop first
-- drop synonym  "APEX_OPTION";

-- drop sequence "APX$OPT_ID_SEQ";
-- drop trigger "APX$OPT_BIU_TRG";

-- drop table "APX$OPT" purge;


-----------------------------------------------------------------------------------------------------
-- Scope Table (Application, Users, Roles,...)
create table "APX$OPT" (
apx_option_id number not null, -- PK
apx_option varchar2(64) not null,
apx_option_value varchar2(2000),
apx_default_value varchar2(2000),
apx_option_code varchar2(4000),
apx_option_source clob,
apx_parent_opt_id number,
apx_option_ctx_id number,
apx_option_status_id number,
apx_option_sec_level number default 0,
apx_process_id number,
apx_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$OPT_ID" primary key (apx_option_id),
constraint "APX$OPT_PRC_FK" foreign key (apx_process_id) references "APX$PRC"(apx_process_id) on delete cascade,
constraint "APX$OPT_CTX_FK" foreign key (apx_option_ctx_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$OPT_STATUS_FK" foreign key (apx_option_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$OPT_PARENT_FK" foreign key (apx_parent_opt_id) references "APX$OPT"(apx_option_id) on delete set null
);

create unique index "APX$OPT_UNQ1" on "APX$OPT"(apx_option_id, apx_id);
create unique index "APX$OPT_UNQ2" on "APX$OPT"(upper(trim(apx_option)), apx_option_ctx_id, apx_id);

create sequence "APX$OPT_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$OPT_BIU_TRG"
before insert or update on "APX$OPT"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_option_id is null) then
        select "APX$OPT_ID_SEQ".NEXTVAL
        into :new.apx_option_id
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

create synonym  "APEX_OPTION"        for "APX$OPT";


-----------------------------------------------------------------------------------------------------
-- App Configuration Table (Procedures,  Functions,  Authorization Items, ...)

-- @requires APX$ APX$CTX APX$STATUS

-----------------------------------------------------------------------------------------------------

--drop first
-- drop synonym  "APEX_CONFIG";
-- drop synonym  "APEX_SETTINGS";

-- drop sequence "APX$CFG_SEQ";
-- drop trigger "APX$CFG_BIU_TRG";

-- drop table "APX$CFG" purge;

-------------------------------------------------------------------------------
-- Application Settings
create table "APX$CFG" (
apx_config_id number not null,
apx_config_name varchar2(512) not null,
apx_config_value varchar2(1000),
apx_config_def_value varchar2(4000),
apx_config_status_id number,
apx_config_ctx_id number,
apx_config_sub_ctx_id number,
apx_config_comment varchar2(256),
apx_config_description varchar2(1000),
apx_parent_config_id number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$CFG_ID" primary key (apx_config_id),
constraint "APX$CFG_SUB_FK" foreign key (apx_parent_config_id) references "APX$CFG"(apx_config_id),
constraint "APX$CFG_STAT_FK" foreign key (apx_config_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$CFG_CTX_FK" foreign key (apx_config_ctx_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$CFG_SUB_CTX_FK" foreign key (apx_config_sub_ctx_id) references "APX$CTX"(apx_context_id) on delete set null
);

create unique index "APX$CFG_UNQ1" on "APX$CFG"(apx_config_id,  app_id);
create unique index "APX$CFG_UNQ2" on "APX$CFG"(upper(apx_config_name),  apx_config_ctx_id,  app_id);
create index "APX$CFG_STAT" on "APX$CFG"(apx_config_status_id);
create index "APX$CFG_CONTEXT" on "APX$CFG"(apx_config_ctx_id);

create sequence "APX$CFG_SEQ" minvalue 0 start with 0 increment by 1 nocache;

create or replace trigger "APX$CFG_BIU_TRG"
before insert or update on "APX$CFG"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_config_id is null) then
        select "APX$CFG_SEQ".NEXTVAL
        into :new.apx_config_id
        from dual;
    end if;
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.created,  :new.created_by
    from dual;
  elsif updating then
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.modified,  :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_CONFIG"           for "APX$CFG";
create synonym  "APEX_SETTING"         for "APX$CFG";


-------------------------------------------------------------------------------
-- Views on APX$CFG
create view "APEX_CONFIGURATION"
as
select
    cfg.apx_config_id as apex_config_id,
    cfg.apx_config_name as apex_config_item,
    nvl(cfg.apx_config_value, cfg.apx_config_def_value) as apex_config_item_value,
    cfg.apx_config_value as apex_configured_item_value,
    cfg.apx_config_def_value as apex_default_item_value,
    s.apex_status as apex_config_item_status,
    ctx.apx_context as apex_configuration_context,
    subctx.apx_context as apex_configuration_subcontext,
    cfg.apx_config_comment as apex_config_comment,
    cfg.apx_config_description as apex_config_description,
    cfg.apx_parent_config_id as apex_parent_config_id,
    (select b.apx_config_name from "APEX_CONFIG" b
     where b.apx_config_id = cfg.apx_parent_config_id) as apex_parent_config,
    cfg.app_id,
    cfg.created,
    cfg.created_by,
    cfg.modified,
    cfg.modified_by
FROM "APEX_CONFIG" cfg
left outer join "APEX_STATUS" s
on (cfg.apx_config_status_id = s.apex_status_id)
left outer join "APEX_SYS_CONTEXT" ctx
on (cfg.apx_config_ctx_id = ctx.apx_context_id)
left outer join "APEX_SYS_CONTEXT" subctx
on (cfg.apx_config_sub_ctx_id = subctx.apx_context_id);


-------------------------------------------------------------------------------
-- INSERTING into APX$CFG
SET DEFINE OFF;
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('DEFAULT', null, null, 3, 0, null, 'Default Configuration', null, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('HOST', null, 'localhost', 3, 8, null, 'Apex Host', 0, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('OS', null, 'linux x86-64', 3, 8, null, 'Apex Host OS', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('IP', null, '127.0.0.1', 3, 8, null, 'Apex Host IP Address', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('PORT', null, '80', 3, 8, null, 'Apex Port', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('KERNEL', null, 'x86-64', 3, 8, null, 'Apex Host OS Kernel', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('SERVER_DAEMON', null, 'EPG', 3, 8, null, 'Apex Server Daemon (EPG,  ORDS,  HTTPD,  Tomcat,  Weblogic,  Websphere)', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('DB_INSTANCE', null, 'orcl', 3, 8, null, 'Apex Database Service', 1, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('DB_SERVICE', null, 'localhost:1521:orcl', 3, 8, null, 'Apex Database Service', '7', null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('DB_CONTAINER', null, 'apex51', 3, 8, null, 'Apex Database Service Container', 8, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('DB_SCHEMA', null, 'APEX_050100', 3, 8, null, 'Apex DB Schema', 8, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('WS_ID', null, 0, 3, 8, null, 'Apex Workspace ID', 10, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('WS_NAME', null, 'WORKSPACE', 3, 8, null, 'Apex Workspace Name', 10, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('APP_ID', null, 0, 3, 9, null, 'Apex Application ID', 11, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('APP_NAME', null, 'APP', 3, 9, null, 'Apex Application Name', 12, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('AUTH_MODEL', null, 'Two-Factor', 3, 10, null, 'Apex Application Authentication Model (Single-Pass,  Two-Factor,  Three-Step,  Biometric)', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('AUTH_METHOD', null, 'Application Express Accounts', 3, 10, null, 'Apex Authentication Method (Apex Accounts,  Database Account,  LDAP)', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('AUTH_PROCESS', null, 'APEX_AUTHENTICATION', 3, 10, null, 'Apex Authentication Function', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('PRE_AUTH_METHOD', null, null, 3, 10, null, 'Apex Pre-Authentication Method', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('POST_AUTH_METHOD', null, null, 3, 10, null, 'Apex Post-Authentication Method', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USERNAME_FORMAT', null, 'EMAIL', 3, 10, null, 'Apex Username Format (EMAIL,  USERNAME)', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USER_REGISTRATION_METHOD', null, 'Token-Response', 3, 10, 2, 'Apex User Registration Model (Token-Response,  SMS Code,  Survey)', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USER_REGISTRATION_TOKEN', null, 'BASE64', 3, 10, 2, 'Apex User Registration Token Format [BASE64, 3DIGITS, 4DIGITS, 6DIGITS, 2X4DIGITS ]', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USER_TOKEN_VALID_FOR_HOURS', null, '24', 3, 10, 2, 'Apex User Registration Token Grace Period in Hours', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USER_REGISTRATION_ATTEMPTS', null, '3', 3, 10, 2, 'Apex User Registration Attempts before redirected to Homepage', 13, null);
insert into "APX$CFG" (apx_config_name, apx_config_value, apx_config_def_value, apx_config_status_id, apx_config_ctx_id, apx_config_sub_ctx_id, apx_config_comment, apx_parent_config_id, app_id)
values ('USER_TOKEN_FUNCTION', null, 'APX_GET_TOKEN', 3, 10, 2, 'Apex User Registration Token Function or Procedure', 13, null);

commit;

--set echo on
--whenever sqlerror exit.sqlcode
-----------------------------------------------------------------------------------------------------
-- App MIME Types Table (txt, pdf, jpg,...)

-- @requires

-- 2017.12.03 SO: created
--
-----------------------------------------------------------------------------------------------------

-- drop first
-- drop synonym  "APEX_MIME_TYPES";

-- drop sequence "APX$MIME_SEQ";
-- drop trigger  "APX$MIME_BIU_TRG";

-- drop table "APX$MIME" purge;


-----------------------------------------------------------------------------------------------------
-- Media MIME Types and Classes
create table "APX$MIME" (
mime_type_id number not null,
file_extension varchar2(20),
mime_type varchar2(100),
mime_type_class_id number,
mime_type_in_default_set1 number,
mime_type_in_default_set2 number,
mime_type_in_default_set3 number,
mime_icon_class varchar2(100) default 'fa-file-o',
mime_icon_color varchar2(100) default 'fff',
mime_icon_color_active varchar2(100) default 'fff',
mime_icon_color_hover varchar2(100) default 'fff',
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$MIME_ID" primary key (mime_type_id),
constraint "APX$MIME_CLASS_FK" foreign key (mime_type_class_id) references "APX$"(apx_id) on delete set null
);

create unique index "APX$MIME_UNQ1" on "APX$MIME"(file_extension, mime_type, mime_type_class_id);
create unique index "APX$MIME_UNQ2" on "APX$MIME"(mime_type, mime_icon_class, file_extension);
create index "APX$MIMETYPEMEDIA_FK" on "APX$MIME"(mime_type_class_id);

create sequence "APX$MIME_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$MIME_BIU_TRG"
before insert or update on "APX$MIME"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.mime_type_id is null) then
        select "APX$MIME_SEQ".NEXTVAL
        into :new.mime_type_id
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

create synonym  "APEX_MIME_TYPES" for "APX$MIME";


-----------------------------------------------------------------------------------------------------
-- View MIME Type Icons
create or replace view "APEX_MIME_ICON_CLASSES"
as
select m.mime_type_id, m.mime_type, m.mime_icon_class
, m.mime_icon_color, m.mime_icon_color_active, m.mime_icon_color_hover
, m.mime_type_class_id as mime_type_media_class_id
, a.apx_object as mime_type_media_class
from "APEX_MIME_TYPES" m left outer join "APEX_APX" a
on (m.mime_type_class_id = a.apx_id);


-----------------------------------------------------------------------------------------------------
--- APX$MIME
--SET DEFINE OFF;
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ra','audio/x-pn-realaudio-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ra','audio/x-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ram','audio/x-pn-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ras','application/x-cmu-raster', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ras','image/cmu-raster', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ras','image/x-cmu-raster', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rast','image/cmu-raster', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rexx','text/x-script.rexx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rf','image/vnd.rn-realflash', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rgb','image/x-rgb', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rm','application/vnd.rn-realmedia', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rm','audio/x-pn-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rmi','audio/mid', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rmm','audio/x-pn-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rmp','audio/x-pn-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rmp','audio/x-pn-realaudio-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rng','application/ringing-tones', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rng','application/vnd.nokia.ringing-tone', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rnx','application/vnd.rn-realplayer', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.roff','application/x-troff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rp','image/vnd.rn-realpix', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rpm','audio/x-pn-realaudio-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rt','text/richtext', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rt','text/vnd.rn-realtext', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rtf','application/rtf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rtf','application/x-rtf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rtf','text/richtext', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rtx','application/rtf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rtx','text/richtext', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.rv','video/vnd.rn-realvideo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.s','text/x-asm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.s3m','audio/s3m', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.saveme','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sbk','application/x-tbook', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.scm','application/x-lotusscreencam', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.scm','text/x-script.guile', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.scm','text/x-script.scheme', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.scm','video/x-scm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sdml','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sdp','application/sdp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sdp','application/x-sdp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sdr','application/sounder', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sea','application/sea', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sea','application/x-sea', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.set','application/set', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sgm','text/sgml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sgm','text/x-sgml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sgml','text/sgml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sgml','text/x-sgml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sh','application/x-bsh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sh','application/x-sh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sh','application/x-shar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sh','text/x-script.sh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.shar','application/x-bsh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.shar','application/x-shar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.shtml','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.shtml','text/x-server-parsed-html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sid','audio/x-psid', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sit','application/x-sit', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sit','application/x-stuffit', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.skd','application/x-koan', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.skm','application/x-koan', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.skp','application/x-koan', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.skt','application/x-koan', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sl','application/x-seelogo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.smi','application/smil', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.smil','application/smil', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.snd','audio/basic', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.snd','audio/x-adpcm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sol','application/solids', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.spc','application/x-pkcs7-certificates', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.spc','text/x-speech', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.spl','application/futuresplash', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.spr','application/x-sprite', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sprite','application/x-sprite', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.src','application/x-wais-source', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ssi','text/x-server-parsed-html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ssm','application/streamingmedia', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sst','application/vnd.ms-pki.certstore', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.step','application/step', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.stl','application/sla', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.stl','application/vnd.ms-pki.stl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.stl','application/x-navistyle', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.stp','application/step', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sv4cpio','application/x-sv4cpio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.sv4crc','application/x-sv4crc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.svf','image/vnd.dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.svf','image/x-dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.svr','application/x-world', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.svr','x-world/x-svr', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.swf','application/x-shockwave-flash', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.t','application/x-troff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.talk','text/x-speech', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tar','application/x-tar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tbk','application/toolbook', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tbk','application/x-tbook', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tcl','application/x-tcl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tcl','text/x-script.tcl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.3dm','x-world/x-3dmf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.3dmf','x-world/x-3dmf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.a','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aab','application/x-authorware-bin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aam','application/x-authorware-map', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aas','application/x-authorware-seg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.abc','text/vnd.abc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.acgi','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.afl','video/animaflex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ai','application/postscript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aif','audio/aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aif','audio/x-aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aifc','audio/aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aifc','audio/x-aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aiff','audio/aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aiff','audio/x-aiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aim','application/x-aim', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aip','text/x-audiosoft-intra', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ani','application/x-navi-animation', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aos','application/x-nokia-9000-communicator-add-on-software', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.aps','application/mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.arc','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.arj','application/arj', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.arj','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.art','image/x-jg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asf','video/x-ms-asf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asm','text/x-asm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asp','text/asp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asx','application/x-mplayer2', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asx','video/x-ms-asf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.asx','video/x-ms-asf-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.au','audio/basic', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.au','audio/x-au', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.avi','application/x-troff-msvideo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.avi','video/avi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.avi','video/msvideo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.avi','video/x-msvideo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.avs','video/avs-video', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bcpio','application/x-bcpio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bin','application/mac-binary', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bin','application/macbinary', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bin','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bin','application/x-binary', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bin','application/x-macbinary', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bm','image/bmp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bmp','image/bmp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bmp','image/x-windows-bmp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.boo','application/book', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.book','application/book', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.boz','application/x-bzip2', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bsh','application/x-bsh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bz','application/x-bzip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.bz2','application/x-bzip2', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.c','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.c','text/x-c', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.c++','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cat','application/vnd.ms-pki.seccat', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cc','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cc','text/x-c', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ccad','application/clariscad', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cco','application/x-cocoa', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cdf','application/cdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cdf','application/x-cdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cdf','application/x-netcdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cer','application/pkix-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cer','application/x-x509-ca-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cha','application/x-chat', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.chat','application/x-chat', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.class','application/java', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.class','application/java-byte-code', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.class','application/x-java-class', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.com','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.com','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.conf','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cpio','application/x-cpio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cpp','text/x-c', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cpt','application/mac-compactpro', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cpt','application/x-compactpro', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cpt','application/x-cpt', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.crl','application/pkcs-crl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.crl','application/pkix-crl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.crt','application/pkix-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.crt','application/x-x509-ca-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.crt','application/x-x509-user-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.csh','application/x-csh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.csh','text/x-script.csh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.css','application/x-pointplus', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.css','text/css', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.cxx','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dcr','application/x-director', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.deepv','application/x-deepv', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.def','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.der','application/x-x509-ca-cert', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dif','video/x-dv', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dir','application/x-director', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dl','video/dl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dl','video/x-dl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.doc','application/msword', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dot','application/msword', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dp','application/commonground', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.drw','application/drafting', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dump','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dv','video/x-dv', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dvi','application/x-dvi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dwf','drawing/x-dwf (old)', (select a.apx_id from "APX$" a where lower(a.apx_object) = substr('drawing/x-dwf (old)' , 1, instr('drawing/x-dwf (old)',  '/') -1) and a.apx_parent_object_id = (select apx_id from "APX$" where apx_obj_code = 'MTC')), null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dwf','model/vnd.dwf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dwg','application/acad', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dwg','image/vnd.dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dwg','image/x-dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dxf','application/dxf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dxf','image/vnd.dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dxf','image/x-dwg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.dxr','application/x-director', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.el','text/x-script.elisp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.elc','application/x-bytecode.elisp (compiled elisp)', (select a.apx_id from "APX$" a where lower(a.apx_object) = substr('application/x-bytecode.elisp (compiled elisp)' , 1, instr('application/x-bytecode.elisp (compiled elisp)',  '/') -1) and a.apx_parent_object_id = (select apx_id from "APX$" where apx_obj_code = 'MTC')), null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.elc','application/x-elc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.env','application/x-envoy', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.eps','application/postscript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.es','application/x-esrehber', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.etx','text/x-setext', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.evy','application/envoy', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.evy','application/x-envoy', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.exe','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.f','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.f','text/x-fortran', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.f77','text/x-fortran', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.f90','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.f90','text/x-fortran', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fdf','application/vnd.fdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fif','application/fractals', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fif','image/fif', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fli','video/fli', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fli','video/x-fli', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.flo','image/florian', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.flx','text/vnd.fmi.flexstor', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fmf','video/x-atomic3d-feature', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.for','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.for','text/x-fortran', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fpx','image/vnd.fpx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.fpx','image/vnd.net-fpx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.frl','application/freeloader', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.funk','audio/make', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.g','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.g3','image/g3fax', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gif','image/gif', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gl','video/gl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gl','video/x-gl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gsd','audio/x-gsm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gsm','audio/x-gsm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gsp','application/x-gsp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gss','application/x-gss', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gtar','application/x-gtar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gz','application/x-compressed', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gz','application/x-gzip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gzip','application/x-gzip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.gzip','multipart/x-gzip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.h','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.h','text/x-h', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hdf','application/x-hdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.help','application/x-helpfile', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hgl','application/vnd.hp-hpgl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hh','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hh','text/x-h', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hlb','text/x-script', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hlp','application/hlp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hlp','application/x-helpfile', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hlp','application/x-winhelp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hpg','application/vnd.hp-hpgl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hpgl','application/vnd.hp-hpgl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/binhex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/binhex4', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/mac-binhex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/mac-binhex40', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/x-binhex40', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hqx','application/x-mac-binhex40', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.hta','application/hta', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.htc','text/x-component', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.htm','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.html','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.htmls','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.htt','text/webviewhtml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.htx','text/html', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ice','x-conference/x-cooltalk', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ico','image/x-icon', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.idc','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ief','image/ief', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.iefs','image/ief', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.iges','application/iges', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.iges','model/iges', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.igs','application/iges', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.igs','model/iges', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ima','application/x-ima', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.imap','application/x-httpd-imap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.inf','application/inf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ins','application/x-internett-signup', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ip','application/x-ip2', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.isu','video/x-isvideo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.it','audio/it', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.iv','application/x-inventor', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ivr','i-world/i-vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ivy','application/x-livescreen', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jam','audio/x-jam', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jav','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jav','text/x-java-source', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.java','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.java','text/x-java-source', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jcm','application/x-java-commerce', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jfif','image/jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jfif','image/pjpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jfif-tbnl','image/jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpe','image/jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpe','image/pjpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpeg','image/jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpeg','image/pjpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpg','image/jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jpg','image/pjpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jps','image/x-jps', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.js','application/x-javascript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.js','application/javascript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.js','application/ecmascript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.js','text/javascript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.js','text/ecmascript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.jut','image/jutvision', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.kar','audio/midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.kar','music/x-karaoke', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ksh','application/x-ksh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ksh','text/x-script.ksh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.la','audio/nspaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.la','audio/x-nspaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lam','audio/x-liveaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.latex','application/x-latex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lha','application/lha', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lha','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lha','application/x-lha', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lhx','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.list','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lma','audio/nspaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lma','audio/x-nspaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.log','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lsp','application/x-lisp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lsp','text/x-script.lisp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lst','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lsx','text/x-la-asf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ltx','application/x-latex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lzh','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lzh','application/x-lzh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lzx','application/lzx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lzx','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.lzx','application/x-lzx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m','text/x-m', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m1v','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m2a','audio/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m2v','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.m3u','audio/x-mpequrl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.man','application/x-troff-man', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.map','application/x-navimap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mar','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mbd','application/mbedlet', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mc$','application/x-magic-cap-package-1.0', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mcd','application/mcad', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mcd','application/x-mathcad', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mcf','image/vasa', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mcf','text/mcf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mcp','application/netmc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.me','application/x-troff-me', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mht','message/rfc822', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mhtml','message/rfc822', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','application/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','audio/midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','audio/x-mid', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','audio/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','music/crescendo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mid','x-music/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','application/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','audio/midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','audio/x-mid', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','audio/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','music/crescendo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.midi','x-music/x-midi', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mif','application/x-frame', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mif','application/x-mif', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mime','message/rfc822', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mime','www/mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mjf','audio/x-vnd.audioexplosion.mjuicemediafile', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mjpg','video/x-motion-jpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mm','application/base64', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mm','application/x-meme', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mme','application/base64', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mod','audio/mod', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mod','audio/x-mod', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.moov','video/quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mov','video/quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.movie','video/x-sgi-movie', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp2','audio/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp2','audio/x-mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp2','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp2','video/x-mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp2','video/x-mpeq2a', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp3','audio/mpeg3', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp3','audio/x-mpeg-3', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp3','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mp3','video/x-mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpa','audio/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpa','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpc','application/x-project', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpe','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpeg','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpg','audio/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpg','video/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpga','audio/mpeg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpp','application/vnd.ms-project', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpt','application/x-project', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpv','application/x-project', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mpx','application/x-project', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mrc','application/marc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ms','application/x-troff-ms', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mv','video/x-sgi-movie', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.my','audio/make', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.mzz','application/x-vnd.audioexplosion.mzz', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nap','image/naplps', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.naplps','image/naplps', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nc','application/x-netcdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ncm','application/vnd.nokia.configuration-message', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nif','image/x-niff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.niff','image/x-niff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nix','application/x-mix-transfer', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nsc','application/x-conference', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.nvd','application/x-navidoc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.o','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.oda','application/oda', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.omc','application/x-omc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.omcd','application/x-omcdatamaker', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.omcr','application/x-omcregerator', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p','text/x-pascal', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p10','application/pkcs10', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p10','application/x-pkcs10', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p12','application/pkcs-12', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p12','application/x-pkcs12', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7a','application/x-pkcs7-signature', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7c','application/pkcs7-mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7c','application/x-pkcs7-mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7m','application/pkcs7-mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7m','application/x-pkcs7-mime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7r','application/x-pkcs7-certreqresp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.p7s','application/pkcs7-signature', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.part','application/pro_eng', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pas','text/pascal', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pbm','image/x-portable-bitmap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pcl','application/vnd.hp-pcl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pcl','application/x-pcl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pct','image/x-pict', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pcx','image/x-pcx', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pdb','chemical/x-pdb', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pdf','application/pdf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pfunk','audio/make', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pfunk','audio/make.my.funk', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pgm','image/x-portable-graymap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pgm','image/x-portable-greymap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pic','image/pict', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pict','image/pict', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pkg','application/x-newton-compatible-pkg', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pko','application/vnd.ms-pki.pko', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pl','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pl','text/x-script.perl', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.plx','application/x-pixclscript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pm','image/x-xpixmap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pm','text/x-script.perl-module', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pm4','application/x-pagemaker', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pm5','application/x-pagemaker', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.png','image/png', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pnm','application/x-portable-anymap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pnm','image/x-portable-anymap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pot','application/mspowerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pot','application/vnd.ms-powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pov','model/x-pov', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppa','application/vnd.ms-powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppm','image/x-portable-pixmap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pps','application/mspowerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pps','application/vnd.ms-powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppt','application/mspowerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppt','application/powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppt','application/vnd.ms-powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppt','application/x-mspowerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ppz','application/mspowerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pre','application/x-freelance', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.prt','application/pro_eng', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ps','application/postscript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.psd','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pvu','paleovu/x-pv', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pwz','application/vnd.ms-powerpoint', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.py','text/x-script.phyton', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.pyc','application/x-bytecode.python', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qcp','audio/vnd.qcelp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qd3','x-world/x-3dmf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qd3d','x-world/x-3dmf', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qif','image/x-quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qt','video/quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qtc','video/x-qtc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qti','image/x-quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.qtif','image/x-quicktime', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ra','audio/x-pn-realaudio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tcsh','text/x-script.tcsh', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tex','application/x-tex', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.texi','application/x-texinfo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.texinfo','application/x-texinfo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.text','application/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.text','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tgz','application/gnutar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tgz','application/x-compressed', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tif','image/tiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tif','image/x-tiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tiff','image/tiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tiff','image/x-tiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tr','application/x-troff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tsi','audio/tsp-audio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tsp','application/dsptype', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tsp','audio/tsplayer', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.tsv','text/tab-separated-values', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.turbot','image/florian', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.txt','text/plain', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uil','text/x-uil', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uni','text/uri-list', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.unis','text/uri-list', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.unv','application/i-deas', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uri','text/uri-list', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uris','text/uri-list', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ustar','application/x-ustar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.ustar','multipart/x-ustar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uu','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uu','text/x-uuencode', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.uue','text/x-uuencode', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vcd','application/x-cdlink', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vcs','text/x-vcalendar', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vda','application/vda', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vdo','video/vdo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vew','application/groupwise', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.viv','video/vivo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.viv','video/vnd.vivo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vivo','video/vivo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vivo','video/vnd.vivo', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vmd','application/vocaltec-media-desc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vmf','application/vocaltec-media-file', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.voc','audio/voc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.voc','audio/x-voc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vos','video/vosaic', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vox','audio/voxware', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vqe','audio/x-twinvq-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vqf','audio/x-twinvq', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vql','audio/x-twinvq-plugin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vrml','application/x-vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vrml','model/vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vrml','x-world/x-vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vrt','x-world/x-vrt', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vsd','application/x-visio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vst','application/x-visio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.vsw','application/x-visio', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.w60','application/wordperfect6.0', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.w61','application/wordperfect6.1', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.w6w','application/msword', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wav','audio/wav', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wav','audio/x-wav', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wb1','application/x-qpro', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wbmp','image/vnd.wap.wbmp', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.web','application/vnd.xara', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wiz','application/msword', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wk1','application/x-123', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wmf','windows/metafile', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wml','text/vnd.wap.wml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wmlc','application/vnd.wap.wmlc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wmls','text/vnd.wap.wmlscript', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wmlsc','application/vnd.wap.wmlscriptc', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.word','application/msword', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wp','application/wordperfect', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wp5','application/wordperfect', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wp5','application/wordperfect6.0', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wp6','application/wordperfect', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wpd','application/wordperfect', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wpd','application/x-wpwin', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wq1','application/x-lotus', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wri','application/mswrite', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wri','application/x-wri', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wrl','application/x-world', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wrl','model/vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wrl','x-world/x-vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wrz','model/vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wrz','x-world/x-vrml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wsc','text/scriplet', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wsrc','application/x-wais-source', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.wtk','application/x-wintalk', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xbm','image/x-xbitmap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xbm','image/x-xbm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xbm','image/xbm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xdr','video/x-amt-demorun', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xgz','xgl/drawing', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xif','image/vnd.xiff', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xl','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xla','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xla','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xla','application/x-msexcel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlb','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlb','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlb','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlc','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlc','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlc','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xld','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xld','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlk','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlk','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xll','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xll','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xll','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlm','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlm','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlm','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xls','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xls','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xls','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xls','application/x-msexcel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlt','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlt','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlv','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlv','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlw','application/excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlw','application/vnd.ms-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlw','application/x-excel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xlw','application/x-msexcel', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xm','audio/xm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xml','application/xml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xml','text/xml', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xmz','xgl/movie', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xpix','application/x-vnd.ls-xpix', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xpm','image/x-xpixmap', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xpm','image/xpm', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.x-png','image/png', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xsr','video/x-amt-showrun', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xwd','image/x-xwd', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xwd','image/x-xwindowdump', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.xyz','chemical/x-pdb', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.z','application/x-compress', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.z','application/x-compressed', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zip','application/x-compressed', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zip','application/x-zip-compressed', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zip','application/zip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zip','multipart/x-zip', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zoo','application/octet-stream', null, null,null,null,'fa-file-o','fff','fff','fff',null);
insert into "APX$MIME" (file_extension,mime_type,mime_type_class_id,mime_type_in_default_set1,mime_type_in_default_set2,mime_type_in_default_set3,mime_icon_class,mime_icon_color,mime_icon_color_active,mime_icon_color_hover,app_id)
values ('.zsh','text/x-script.zsh', null, null,null,null,'fa-file-o','fff','fff','fff',null);

commit;

/* -- 12c validated
update "APX$MIME" m
set m.mime_type_class_id = (
select apx_id from (
  select a.apx_id
  from "APX$" a
  where lower(a.apx_object) = substr(m.mime_type, 1, instr(m.mime_type, '/') -1)
  and a.apx_parent_object_id = (select b.apx_id
                                from "APX$" b
                                where b.apx_obj_code = 'MTC'))
);
*/

-- 11g validated
update "APX$MIME" m
set m.mime_type_class_id = (
select b.apx_id from (
  select a.apx_id, a.apx_object
  from "APX$" a
  where a.apx_parent_object_id = (select b.apx_id
                                  from "APX$" b
                                  where b.apx_obj_code = 'MTC')) b
where lower(b.apx_object) = substr(m.mime_type, 1, instr(m.mime_type, '/') -1)
);

commit;


-- Updated File Type Icons
update "APX$MIME" set mime_icon_class = 'fa-file-archive-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%zip%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-audio-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%audio%');

commit;

-- all apps first
update "APX$MIME" set mime_icon_class = 'fa-file-code-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%application%');

commit;

-- then refine
update "APX$MIME" set mime_icon_class = 'fa-file-code-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%java%'
or mime_type like '%css%'
or mime_type like '%binary%'
or mime_type like '%fortran%'
or mime_type like '%script%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-excel-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%excel%');

commit;


-- Aliases 'fa-file-photo-o' 'fa-file-picture-o'
update "APX$MIME" set mime_icon_class = 'fa-file-image-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%image%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-movie-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%movie%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-pdf-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%pdf%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-powerpoint-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%powerpoint%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-sound-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%sound%');

commit;

-- Dark fa-file-text
update "APX$MIME" set mime_icon_class = 'fa-file-text-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%text%');

commit;


update "APX$MIME" set mime_icon_class = 'fa-file-video-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%video%');

commit;

update "APX$MIME" set mime_icon_class = 'fa-file-word-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%word%');

commit;

/*
update "APX$MIME" set mime_icon_class = 'fa-file-zip-o'
where mime_type_id in (
select mime_type_id
from "APEX_MIME_ICON_CLASSES"
where mime_type like '%zip%');

commit;
*/

-- default -> Open 'fa-file-o' | alt: Dark 'fa-file'
update "APX$MIME" set mime_icon_class = 'fa-file-o'
where mime_icon_class is null;

commit;

-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures,  Functions,  Authorization Items, ...)

---- drop first
-- drop synonym  "APEX_APP";

-- drop sequence "APX$APP_ID_SEQ";
-- drop trigger "APX$APP_BIU_TRG";

-- drop table "APX$APP" purge;

-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures,  Functions,  Authorization Items, ...)
create table "APX$APP"(
apx_app_id number not null,
apx_app_name varchar2(64) not null,
apx_app_code varchar2(12),
apx_app_parent_app_id number,
apx_app_sec_level number default 0,
app_id number,
ws_id number,
ws_name varchar2(128),
app_status_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$APP_ID" primary key (apx_app_id),
constraint "APX$APP_PARENT_FK" foreign key (apx_app_parent_app_id) references "APX$APP"(apx_app_id),
constraint "APX$APP_STATUS_FK" foreign key (app_status_id) references "APX$STATUS"(apx_status_id)
);

create unique index "APX$APP_UNQ1" on "APX$APP"(apx_app_id,  app_id);
create unique index "APX$APP_UNQ2" on "APX$APP"(upper(apx_app_name),  upper(apx_app_code),  app_id);
create index "APX$APP_STATUS_FK" on "APX$APP" (app_status_id);

create sequence "APX$APP_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$APP_BIU_TRG"
before insert or update on "APX$APP"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_app_id is null) then
        select "APX$APP_ID_SEQ".NEXTVAL
        into :new.apx_app_id
        from dual;
    end if;
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate,  nvl(v('APP_USER'),  user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_APP"               for "APX$APP";

-------------------------------------------------------------------------------------------------
-- INSERTING into APX$APP

insert into "APX$APP" (apx_app_id, apx_app_name, apx_app_code, apx_app_sec_level, app_id, ws_id, ws_name, app_status_id)
(select 0,  application_name, alias, 2, application_id, workspace_id, workspace, 3
 from "APEX_APPLICATIONS"
 where ALIAS = 'BUILDER');

commit;
--- APEX User Management ---



-----------------------------------------------------------------------------------------------------
--
-- Stefan Obermeyer 12.2016
--
-- 12.12.2016 SOB created
-- 19.12.2016 SOB modified INSERT/UPDATE Trigger to get UserID for DB and APEX Users
-- 08.01.2017 SOB added Trigger for User INSERTs and Default Role changes.
-- 02.06.2017 SOB added BUILTINs
-- 06.11.2017 SOB added Scopes, Domains, Groups and Privileges
-- 17.12.2017 SOB renamed to apx_ and switched Domain Group paradigm
--
-----------------------------------------------------------------------------------------------------

-- @requires APX$ model (Status, Context, ...)


--------------------------------------------------------------------------------
-- APEX User's, Groups, Domains,...
--------------------------------------------------------------------------------

-- -- Apex User Session Tables and Views

-- -- -- drop first

-- drop synonym     "APEX_USER_SESSION";
-- drop view        "APEX_USER_SESSIONS";
-- drop sequence    "APX$USERSESS_SEQ";
-- drop trigger     "APX$USERSESS_BI_TRG";
-- drop table       "APX$USR_SESSION"  purge;


-- drop synonym     "APEX_BUILTIN";
-- drop table       "APX$BUILTIN"       purge;


-- drop synonym     "APEX_USER_ROLE_MAP";
-- drop trigger     "APX$USRDEFROL_TRG";
-- drop sequence    "APX$USERROLE_SEQ";
-- drop trigger     "APX$USRROL_BIU_TRG";
-- drop table       "APX$USER_ROLE_MAP" purge;


-- drop synonym     "APEX_USER_REGISTRATION";
-- drop synonym     "APEX_USREG";
-- drop sequence    "APX$USREG_ID_SEQ";
-- drop trigger     "APX$USRREG_BIU_TRG";
-- drop table       "APX$USER_REG"      purge;


-- drop synonym     "APEX_USER";
-- drop sequence    "APX$USER_ID_SEQ";
-- drop trigger     "APX$USER_BIU_TRG" ;
-- drop table       "APX$USER"          purge;


-- drop synonym     "APEX_ROLE";
-- drop sequence    "APX$ROLE_ID_SEQ";
-- drop trigger     "APX$ROLE_BIU_TRG" ;
-- drop table       "APX$ROLE"          purge;


-- drop synonym     "APEX_PRIVILEGE";
-- drop sequence    "APX$PRIV_ID_SEQ";
-- drop trigger     "APX$PRIV_BIU_TRG";
-- drop table       "APX$PRIVILEGE"     purge;


-- drop synonym     "APEX_DOMAIN";
-- drop sequence    "APX$DOMAIN_ID_SEQ";
-- drop trigger     "APX$DOMAIN_BIU_TRG";
-- drop table       "APX$DOMAIN"        purge;


-- drop synonym     "APEX_GROUP";
-- drop sequence    "APX$GROUP_ID_SEQ";
-- drop trigger     "APX$GROUP_BIU_TRG";
-- drop table       "APX$GROUP"         purge;


--------------------------------------------------------------------------------------
-- Application Groups
create table "APX$GROUP" (
apx_group_id number not null,
apx_group_name varchar2(64) not null,
apx_group_code varchar2(8) null,
apx_group_description varchar2(128),
apx_group_status_id number,
apx_group_context_id number,
apx_parent_group_id number,
apx_group_sec_level number default 0,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$GROUP_GROUP_ID" primary key (apx_group_id),
constraint "APX$GROUP_CTX_FK" foreign key (apx_group_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$GROUP_STATUS_FK" foreign key (apx_group_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$GROUP_PARENT_FK" foreign key (apx_parent_group_id) references "APX$GROUP"(apx_group_id) on delete set null
);

create unique index "APX$GROUP_UNQ1"   on "APX$GROUP"(upper(trim(apx_group_name)), apx_group_context_id, app_id);
create unique index "APX$GROUP_UNQ2"   on "APX$GROUP"(upper(trim(apx_group_code)), apx_group_context_id, app_id);
create unique index "APX$GROUP_UNQ3"   on "APX$GROUP"(upper(trim(apx_group_name)), upper(trim(apx_group_code)), apx_group_context_id, app_id);
create index "APX$GROUP_STATUS_FK_IDX" on "APX$GROUP"(apx_group_status_id);
create index "APX$GROUP_PARENT_FK_IDX" on "APX$GROUP"(apx_parent_group_id);
create index "APX$GROUP_SECLEV"        on "APX$GROUP"(apx_group_sec_level);
create index "APX$GROUP_APX_ID"        on "APX$GROUP"(app_id);


create sequence "APX$GROUP_ID_SEQ" start with 10 increment by 1 nocache;

create or replace trigger "APX$GROUP_BIU_TRG"
before insert or update on "APX$GROUP"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_group_id is null) then
        select "APX$GROUP_ID_SEQ".NEXTVAL
        into :new.apx_group_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/


--------------------------------------------------------------------------------------
-- Synonyms on APX$GROUP
create synonym  "APEX_GROUP"           for "APX$GROUP";


--------------------------------------------------------------------------------------
-- Application Domains
create table "APX$DOMAIN" (
apx_domain_id number not null,
apx_domain varchar2(64) not null, -- fully qualified domain name (f.e.: mydomain.net)
apx_domain_name varchar2(64) not null, -- conceptual name like MyDomain
apx_domain_code varchar2(8) null,
apx_domain_description varchar2(128),
apx_parent_domain_id number,
apx_domain_status_id number,
apx_domain_group_id number default 1,
apx_domain_sec_level number default 0,
apx_domain_context_id number default 0,
apx_domain_homepage varchar2(1000),
app_id number default 0,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$DOMAIN_DOMAIN_ID" primary key (apx_domain_id),
constraint "APX$DOMAIN_CTX_ID_FK" foreign key (apx_domain_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$DOMAIN_STATUS_FK" foreign key (apx_domain_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$DOMAIN_GROUP_ID_FK" foreign key (apx_domain_group_id) references "APX$GROUP"(apx_group_id) on delete set null,
constraint "APX$DOMAIN_PARENT_FK" foreign key (apx_parent_domain_id) references "APX$DOMAIN"(apx_domain_id) on delete set null
);

create unique index "APX$DOMAIN_UNQ1"   on "APX$DOMAIN"(upper(trim(apx_domain_name)), app_id);
create unique index "APX$DOMAIN_UNQ2"   on "APX$DOMAIN"(upper(trim(apx_domain)), app_id);
create unique index "APX$DOMAIN_UNQ3"   on "APX$DOMAIN"(upper(trim(apx_domain_name)), upper(trim(apx_domain)), app_id);
create index "APX$DOMAIN_GROUP_FK_IDX"  on "APX$DOMAIN"(apx_domain_group_id);
create index "APX$DOMAIN_STATUS_FK_IDX" on "APX$DOMAIN"(apx_domain_status_id);
create index "APX$DOMAIN_PARENT_FK_IDX" on "APX$DOMAIN"(apx_parent_domain_id);
create index "APX$DOMAIN_SECLEV"        on "APX$DOMAIN"(apx_domain_sec_level);
create index "APX$DOMAIN_APX_ID"        on "APX$DOMAIN"(app_id);


create sequence "APX$DOMAIN_ID_SEQ" start with 10 increment by 1 nocache;

create or replace trigger "APX$DOMAIN_BIU_TRG"
before insert or update on "APX$DOMAIN"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_domain_id is null) then
        select "APX$DOMAIN_ID_SEQ".NEXTVAL
        into :new.apx_domain_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$DOMAIN
create synonym  "APEX_DOMAIN"           for "APX$DOMAIN";


--------------------------------------------------------------------------------------
-- Application Privileges
create table "APX$PRIVILEGE" (
apx_priv_id number not null,
apx_privilege varchar2(64) not null,
apx_priv_code varchar2(12) null,
apx_priv_description varchar2(128),
apx_priv_status_id number,
apx_priv_context_id number,
app_id number,
apx_parent_priv_id number,
apx_priv_sec_level number default 0,
apx_priv_domain_id number default 0,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$PRIV_PRIV_ID" primary key (apx_priv_id),
constraint "APX$PRIV_CTX_FK" foreign key (apx_priv_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$PRIV_STATUS_FK" foreign key (apx_priv_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$PRIV_PARENT_FK" foreign key (apx_parent_priv_id) references "APX$PRIVILEGE"(apx_priv_id) on delete set null
);

create unique index "APX$PRIV_UNQ1"   on "APX$PRIVILEGE"(upper(trim(apx_privilege)), apx_priv_context_id, app_id);
create unique index "APX$PRIV_UNQ2"   on "APX$PRIVILEGE"(upper(trim(apx_priv_code)), apx_priv_context_id, app_id);
create index "APX$PRIV_STATUS_FK_IDX" on "APX$PRIVILEGE"(apx_priv_status_id);
create index "APX$PRIV_PARENT_FK_IDX" on "APX$PRIVILEGE"(apx_parent_priv_id);
create index "APX$PRIV_SECLEV"        on "APX$PRIVILEGE"(apx_priv_sec_level);
create index "APX$PRIV_APP_ID"        on "APX$PRIVILEGE"(app_id);

create sequence "APX$PRIV_ID_SEQ" start with 10 increment by 1 nocache;

create or replace trigger "APX$PRIV_BIU_TRG"
before insert or update on "APX$PRIVILEGE"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_priv_id is null) then
        select "APX$PRIV_ID_SEQ".NEXTVAL
        into :new.apx_priv_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$PRIVILEGE
create synonym  "APEX_PRIVILEGE"        for "APX$PRIVILEGE";


--------------------------------------------------------------------------------------
-- Application Roles
create table "APX$ROLE" (
APX_ROLE_ID number not null,
apx_role_name varchar2(64) not null,
apx_role_code varchar2(8) null,
apx_role_description varchar2(128),
apx_role_sec_level number default 0,
apx_role_domain_id number default 0,
apx_role_status_id number,
apx_role_context_id number,
app_id number,
apx_parent_role_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$ROLE_ROLE_ID" primary key (apx_role_id),
constraint "APX$ROLE_CTX_FK" foreign key (apx_role_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$ROLE_STATUS_FK" foreign key (apx_role_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$ROLE_DOMAIN_FK" foreign key (apx_role_domain_id) references "APX$DOMAIN"(apx_domain_id) on delete set null,
constraint "APX$ROLE_PARENT_FK" foreign key (apx_parent_role_id) references "APX$ROLE"(apx_role_id) on delete set null
);

create unique index "APX$ROLE_UNQ1" on "APX$ROLE"(apx_role_id, app_id);
create unique index "APX$ROLE_UNQ2" on "APX$ROLE"(upper(apx_role_name), apx_role_context_id, app_id);

create index "APX$ROLE_DOMAIN_FK_IDX" on "APX$ROLE"(apx_role_domain_id);
create index "APX$ROLE_CTX_FK_IDX"    on "APX$ROLE"(apx_role_context_id);
create index "APX$ROLE_STATUS_FK_IDX" on "APX$ROLE"(apx_role_status_id);
create index "APX$ROLE_PARENT_FK_IDX" on "APX$ROLE"(apx_parent_role_id);
create index "APX$ROLE_SECLEV"        on "APX$ROLE"(apx_role_sec_level);
create index "APX$ROLE_APX_ID"        on "APX$ROLE"(app_id);

create sequence "APX$ROLE_ID_SEQ" start with 10 increment by 1 nocache;

create or replace trigger "APX$ROLE_BIU_TRG"
before insert or update on "APX$ROLE"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_role_id is null) then
        select "APX$ROLE_ID_SEQ".NEXTVAL
        into :new.apx_role_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$USER
create synonym  "APEX_ROLE"             for "APX$ROLE";


--------------------------------------------------------------------------------------
-- Application User
create table "APX$USER" (
apx_user_id number not null,
apx_username varchar2(64) default 'AppUser' not null,
apx_user_email varchar2(64) not null,
apx_user_default_role_id number default 1 not null, -- 0 PUBLIC, 1 USER
apx_user_code varchar2(8),
apx_user_first_name varchar2(32),
apx_user_last_name varchar2(32),
apx_user_ad_login varchar2(64),
apx_user_host_login varchar2(64),
apx_user_email2 varchar2(64),
apx_user_email3 varchar2(64),
apx_user_twitter varchar2(64),
apx_user_facebook varchar2(64),
apx_user_linkedin varchar2(64),
apx_user_xing varchar2(64),
apx_user_other_social_media varchar2(64),
apx_user_phone1 varchar2(64),
apx_user_phone2 varchar2(64),
apx_user_adress varchar2(128),
apx_user_description varchar2(128),
apx_user_domain_id number default 0,
apx_user_status_id number default 1,
apx_user_sec_level number default 0,
apx_user_context_id number,
apx_user_parent_user_id number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$USER_ID" primary key(apx_user_id),
constraint "APX$USER_CTX_FK" foreign key (apx_user_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$USER_STATUS_FK" foreign key (apx_user_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$USER_DEFROLE_FK" foreign key (apx_user_default_role_id) references "APX$ROLE"(apx_role_id) on delete set null,
constraint "APX$USER_DOMAIN_FK" foreign key (apx_user_domain_id) references "APX$DOMAIN"(apx_domain_id) on delete set null,
constraint "APX$USER_PARENT_FK" foreign key (apx_user_parent_user_id) references "APX$USER"(apx_user_id) on delete set null
);

create unique index "APX$USER_UNQ1"    on "APX$USER"(upper(trim(apx_user_email)), app_id);
create unique index "APX$USER_UNQ2"    on "APX$USER"(upper(trim(apx_username)), app_id);
create index "APX$USER_APX_ID"         on "APX$USER"(app_id);
create index "APX$USER_DOMAIN_FK_IDX"  on "APX$USER"(apx_user_domain_id);
create index "APX$USER_CTX_FK_IDX"     on "APX$USER"(apx_user_context_id);
create index "APX$USER_STATUS_FK_IDX"  on "APX$USER"(apx_user_status_id);
create index "APX$USER_DEFROLE_FK_IDX" on "APX$USER"(apx_user_default_role_id);
create index "APX$USER_PARENT_FK_IDX"  on "APX$USER"(apx_user_parent_user_id);
create index "APX$USER_SECLEV"         on "APX$USER"(apx_user_sec_level);

create sequence "APX$USER_ID_SEQ" start with 10 increment by 1 nocache;

create or replace trigger "APX$USER_BIU_TRG"
before insert or update on "APX$USER"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_user_id is null) then
        select "APX$USER_ID_SEQ".NEXTVAL
        into :new.apx_user_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    if (:new.apx_user_context_id is null) then
      begin
        select apx_context_id
        into :new.apx_user_context_id
        from "APX$CTX"
        where upper(apx_context) = 'USER';
        exception when no_data_found then
        select 0 into :new.apx_user_context_id from dual;
      end;
    end if;
    if (:new.apx_username is null) then
      begin
        select :new.apx_user_first_name||' '||:new.apx_user_last_name
        into :new.apx_username
        from dual;
        exception when no_data_found then
        select 'AppUser '||nvl(:new.apx_user_id, to_number(SYS_GUID(),'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'))
        into :new.apx_username from dual;
      end;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$USER
create synonym  "APEX_USER"             for "APX$USER";


--------------------------------------------------------------------------------------
-- Application User Registration
create table "APX$USER_REG" (
APX_USER_ID number not null,
apx_username varchar2(64) default 'NewAppUser' not null,
apx_user_email varchar2(64) not null,
apx_user_default_role_id number default 1 not null, -- 0 PUBLIC, 1 USER
apx_user_code varchar2(8),
apx_user_first_name varchar2(32),
apx_user_last_name varchar2(32),
apx_user_ad_login varchar2(64),
apx_user_host_login varchar2(64),
apx_user_email2 varchar2(64),
apx_user_email3 varchar2(64),
apx_user_twitter varchar2(64),
apx_user_facebook varchar2(64),
apx_user_linkedin varchar2(64),
apx_user_xing varchar2(64),
apx_user_other_social_media varchar2(64),
apx_user_phone1 varchar2(64),
apx_user_phone2 varchar2(64),
apx_user_adress varchar2(128),
apx_user_description varchar2(128),
apx_user_token_created date,
apx_user_token_valid_until date,
apx_user_token_ts timestamp(6) with time zone,
apx_user_token varchar2(4000),
apx_user_domain_id number default 0,
apx_user_status_id number default 7, -- New User
apx_user_sec_level number default 0,
apx_user_context_id number,
apx_user_parent_user_id number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$USREG_ID" primary key(apx_user_id),
constraint "APX$USREG_CTX_FK" foreign key (apx_user_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$USREG_STATUS_FK" foreign key (apx_user_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$USREG_DOMAIN_FK" foreign key (apx_user_domain_id) references "APX$DOMAIN"(apx_domain_id) on delete set null,
constraint "APX$USREG_DEFROLE_FK" foreign key (apx_user_default_role_id) references "APX$ROLE"(apx_role_id) on delete set null
);

create unique index "APX$USREG_UNQ1"    on "APX$USER_REG"(apx_user_id, app_id);
create unique index "APX$USREG_UNQ2"    on "APX$USER_REG"(apx_user_token);
create unique index "APX$USREG_UNQ3"    on "APX$USER_REG"(upper(apx_user_email), app_id);
-- create unique index "APX$USREG_UNQ4" on "APX$USER_REG"(upper(apx_username), apx_id); -- only needed when apx_username_format = username
create index "APX$USRREG_DOMAIN_FK_IDX" on "APX$USER_REG"(apx_user_domain_id);
create index "APX$USRREG_CTX_FK_IDX"    on "APX$USER_REG"(apx_user_context_id);

create sequence "APX$USREG_ID_SEQ" start with 100 increment by 1 nocache;

create or replace trigger "APX$USRREG_BIU_TRG"
before insert or update on "APX$USER_REG"
referencing old as old new as new
for each row
declare
l_domain varchar2(100);
l_token_valid_for_hours pls_integer;
begin
  if inserting then
    if (:new.apx_user_id is null) then
        select "APX$USREG_ID_SEQ".NEXTVAL
        into :new.apx_user_id
        from dual;
    end if;
    if (:new.app_id is null) then
        select nvl2(v('FB_FLOW_ID'), v('FB_FLOW_ID'), v('APP_ID'))
        into :new.app_id
        from dual;
    end if;
    if (:new.apx_user_token is null) then
      begin
        select apx_domain_name
        into l_domain
        from "APX$DOMAIN"
        where apx_domain_id = :new.apx_user_domain_id;
      exception when no_data_found then
        l_domain := 'NewAppUserDomain.net';
      end;
      begin
        select  apex_config_item_value
        into l_token_valid_for_hours
        from "APEX_CONFIGURATION"
        where  apex_config_item = 'USER_TOKEN_VALID_FOR_HOURS';
        select sysdate,
               sysdate + l_token_valid_for_hours / 24,
               systimestamp,
               apx_get_token(l_domain)
          into :new.apx_user_token_created,
               :new.apx_user_token_valid_until,
               :new.apx_user_token_ts,
               :new.apx_user_token
        from dual;
      exception when no_data_found then
        select 0 into :new.apx_user_context_id from dual;
      end;
    end if;
    if (:new.apx_user_context_id is null) then
      begin
        select apx_context_id
        into :new.apx_user_context_id
        from "APX$CTX"
        where upper(apx_context) = 'USER';
        exception when no_data_found then
        select 0 into :new.apx_user_context_id from dual;
      end;
    end if;
    if (:new.apx_username is null or :new.apx_username = 'NewAppUser') then
      begin
        select nvl(:new.apx_user_first_name, 'New')||' '||nvl(:new.apx_user_last_name, 'User')
        into :new.apx_username
        from dual;
        exception when no_data_found then
        select 'AppUser '||nvl(to_char(:new.apx_user_id), to_number(SYS_GUID(),'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'))
        into :new.apx_username from dual;
      end;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$USER_REG
create synonym  "APEX_USER_REGISTRATION"        for "APX$USER_REG";
create synonym  "APEX_USREG"                    for "APX$USER_REG";


--------------------------------------------------------------------------------------
-- User Role Assignement
create table "APX$USER_ROLE_MAP" (
apx_user_role_map_id number not null,
apx_user_id number not null,
apx_role_id number not null,
apx_user_role_status_id number default 1,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$USERROLEMAP_ID" primary key (apx_user_role_map_id),
constraint "APX$USERROLE_STAT_FK" foreign key (apx_user_role_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$USER_ID_FK" foreign key (apx_user_id) references "APX$USER"(apx_user_id) on delete cascade,
constraint "APX$ROLE_ID_FK" foreign key (apx_role_id) references "APX$ROLE"(apx_role_id) on delete cascade
) organization index;

create index "APX$USERROLMAP_STAT" on "APX$USER_ROLE_MAP"(apx_user_role_status_id);
create unique index "APX$USERROLEMAP_UNQ" on  "APX$USER_ROLE_MAP"(app_id, apx_user_id, apx_role_id);

create sequence "APX$USERROLE_SEQ" minvalue 0 start with 0 increment by 1 nocache;

create or replace trigger "APX$USRROL_BIU_TRG"
before insert or update on "APX$USER_ROLE_MAP"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_user_role_map_id is null) then
        select APX$userrole_seq.nextval
        into :new.apx_user_role_map_id
        from dual;
    end if;
    select sysdate, nvl(v('APX_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('APX_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

------------------------------------------------------------
-- set Roles based on default role setting in APEXP_APX_USER
-- Default Role for each new User = USER
create or replace trigger "APX$USRDEFROL_TRG"
after insert or update of "APX_USER_DEFAULT_ROLE_ID" on "APX$USER"
referencing old as old new as new
for each row
declare
l_entries number;
begin
  if inserting then
      insert into "APX$USER_ROLE_MAP" (app_id, apx_user_id, apx_role_id)
      values (:new.app_id, :new.apx_user_id, :new.apx_user_default_role_id);
  elsif updating then
        update "APX$USER_ROLE_MAP"
        set  (apx_role_id) = :new.apx_user_default_role_id
        where apx_user_id = :new.apx_user_id
		  and app_id = :new.app_id
        and apx_role_id = :old.apx_user_default_role_id;
  end if;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms on APX$USER_ROLE_MAP
create synonym  "APEX_USER_ROLE_MAP"    for "APX$USER_ROLE_MAP";


--------------------------------------------------------------------------------------
-- Application System Users, Roles,...
create table "APX$BUILTIN" (
apx_builtin_id number not null,
apx_builtin_parent_id number,
apx_builtin_status_id number,
apx_builtin_context_id number,
app_id number,
apx_user_id number,
apx_role_id number,
is_admin number,
is_public number,
is_default number,
constraint "APX$SYSBUILTIN_IA_CHK" check (is_admin in(0, 1)),
constraint "APX$SYSBUILTIN_IP_CHK" check (is_public in(0, 1)),
constraint "APX$SYSBUILTIN_ID_CHK" check (is_default in(0, 1)),
constraint "APX$SYSBUILTIN_ID" primary key (apx_builtin_id),
constraint "APX$USR_ID_FK" foreign key (apx_user_id) references "APX$USER"(apx_user_id) on delete cascade,
constraint "APX$ROL_ID_FK" foreign key (apx_role_id) references "APX$ROLE"(apx_role_id) on delete cascade,
constraint "APX$SYSBUILTIN_STATUS_FK" foreign key (apx_builtin_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$SYSBUILTIN_CTX_FK" foreign key (apx_builtin_context_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$SYSBUILTINS_FK" foreign key (apx_builtin_parent_id) references "APX$BUILTIN"(apx_builtin_id) on delete set null
) organization index;

create unique index "APX$BUILTIN_UNQ" on  "APX$BUILTIN"(app_id, apx_user_id, apx_role_id);
create index "APX$BUILTIN_CTX_FK_IDX" on "APX$BUILTIN"(apx_builtin_context_id);
create index "APX$BUILTIN_STAT_FK_IDX" on "APX$BUILTIN"(apx_builtin_status_id);

--------------------------------------------------------------------------------------
-- Synonyms on APX$BUITIN
create synonym  "APEX_BUILTIN"          for "APX$BUILTIN";


--------------------------------------------------------------------------------------
-- Apex App User Session
create table "APX$USR_SESSION" (
apx_user_session_id number not null,
apx_username varchar2(64) not null,
apx_user_email varchar2(64),
apx_user_session_status_id number,
app_id number,
app_ws_id number,
apx_user_cookie_name varchar2(64),
apx_user_last_page number,
apx_user_last_login timestamp default current_timestamp,
apx_user_last_logout timestamp default null,
apx_user_session_seconds number default 28800, -- 8 hrs.
apx_user_session_idle_sec number default 900, -- 15 min.
constraint "APX$SESSION_ID" primary key (apx_user_session_id),
constraint "APX$SESSION_STATUS_FK" foreign key (apx_user_session_status_id) references "APX$STATUS"(apx_status_id) on delete set null
);

create sequence "APX$USERSESS_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$USERSESS_BI_TRG"
before insert on "APX$USR_SESSION"
referencing old as old new as new
for each row
begin
  if (:new.apx_user_session_id is null) then
      select "APX$USERSESS_SEQ".nextval
      into :new.apx_user_session_id
      from dual;
  end if;
  select current_timestamp, nvl(v('APP_USER'), user)
  into :new.apx_user_last_login, :new.apx_username
  from dual;
end;
/

--------------------------------------------------------------------------------------
-- Synonyms
create synonym  "APEX_USER_SESSION"         for "APX$USR_SESSION";


--------------------------------------------------------------------------------------
-- Views on "APX$USR_SESSION" table
create view "APEX_USER_SESSIONS"
as
select apx_user_session_id,
  apx_username,
  apx_user_email,
  app_id,
  app_ws_id,
  apx_user_session_status_id,
  apx_user_last_login,
  apx_user_last_logout,
  trunc(apx_session_duration) as apx_session_duration_seconds,
  nvl(nullif(apx_user_session_seconds,0), trunc(apx_session_duration)) -
  trunc(apx_session_duration) as apx_session_remaining_seconds,
  case when apx_session_duration <= apx_user_session_seconds
          then 'Y'
          else 'N'
  end as apx_session_is_current
from (
select apx_user_session_id,
  apx_username,
  apx_user_email,
  app_id,
  app_ws_id,
  apx_user_last_login,
  apx_user_last_logout,
  apx_user_session_seconds,
  apx_user_session_status_id,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) as just_now,
  ((cast(apx_user_last_login as date) - date '1970-01-01')*24*60*60) as login_second,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) -
  ((cast(apx_user_last_login as date) - date '1970-01-01')*24*60*60) as apx_session_duration
from  "APX$USR_SESSION"
);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gather Stats for new/all Objects
--------------------------------------------------------------------------------------
begin
dbms_stats.gather_schema_stats(user);
end;
/



-----------------------------------------------------------------------------------------------------
-- App Processes Table (Procedures, Functions, Authorization Items,...)

-- requires APX$ APX$CTX APX$STATUS APX$PRC

-- -- drop first
-- drop synonym  "APEX_SOURCE";

-- drop sequence "APX$SOURCE_ID_SEQ";
-- drop trigger "APX$SOURCE_BIU_TRG";

-- drop table "APX$SOURCE" purge;


-----------------------------------------------------------------------------------------------------
-- Scope Table (Application, Users, Roles,...)
create table "APX$SOURCE" (
apx_source_id number not null, -- PK
apx_source_name varchar2(64) not null,
apx_source_value varchar2(2000),
apx_source_default_value varchar2(2000),
apx_source_code varchar2(4000),
apx_sourcecode clob,
apx_parent_source_id number,
apx_source_ctx_id number,
apx_source_type_id number,
apx_source_subtype_id number,
apx_source_status_id number,
apx_source_sec_level number default 0,
apx_process_id number,
apx_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$SOURCE_ID" primary key (apx_source_id),
constraint "APX$SOURCE_PRC_FK" foreign key (apx_process_id) references "APX$PRC"(apx_process_id) on delete cascade,
constraint "APX$SOURCE_CTX_FK" foreign key (apx_source_ctx_id) references "APX$CTX"(apx_context_id) on delete set null,
constraint "APX$SOURCE_TYPE_FK" foreign key (apx_source_type_id) references "APX$"(apx_id) on delete set null,
constraint "APX$SOURCE_SUBTYPE_FK" foreign key (apx_source_subtype_id) references "APX$"(apx_id) on delete set null,
constraint "APX$SOURCE_STATUS_FK" foreign key (apx_source_status_id) references "APX$STATUS"(apx_status_id) on delete set null,
constraint "APX$SOURCE_PARENT_FK" foreign key (apx_parent_source_id) references "APX$SOURCE"(apx_source_id) on delete set null
);

create unique index "APX$SOURCE_UNQ1" on "APX$SOURCE"(apx_source_id, apx_id);
create unique index "APX$SOURCE_UNQ2" on "APX$SOURCE"(upper(trim(apx_source_name)), apx_source_ctx_id, apx_id);
create unique index "APX$SOURCE_UNQ3" on "APX$SOURCE"(upper(trim(apx_source_name)), apx_source_type_id, apx_source_subtype_id, apx_id);
create index "APX$SOURCE_CONTEXT_FK" on "APX$SOURCE" (apx_source_ctx_id);
create index "APX$SOURCE_TYPE_FK" on "APX$SOURCE" (apx_source_type_id);
create index "APX$SOURCE_SUBTYPE_FK" on "APX$SOURCE" (apx_source_subtype_id);
create index "APX$SOURCE_STATUS_FK" on "APX$SOURCE" (apx_source_status_id);

create sequence "APX$SOURCE_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$SOURCE_BIU_TRG"
before insert or update on "APX$SOURCE"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_source_id is null) then
        select "APX$SOURCE_ID_SEQ".NEXTVAL
        into :new.apx_source_id
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

create synonym  "APEX_SOURCE"        for "APX$SOURCE";


-----------------------------------------------------------------------------------------------------
-- App Status Table (for all sorts of Apex Object Types)

-- @requires "APX$" "APX$CTX"
-----------------------------------------------------------------------------------------------------

---- drop first


-- drop view        "APEX_ATTACHEMENTS";
-- drop synonym     "APEX_ATTACHEMENT";

-- drop sequence    "APX$ATTACHEMENT_ID_SEQ";
-- drop trigger     "APX$ATTACHEMENT_BIU_TRG";

-- drop table       "APX$ATTACHEMENT" purge;


-- drop view        "APEX_WEB_CONTENT";
-- drop synonym     "APEX_CONTENT";

-- drop sequence    "APX$CONTENT_ID_SEQ";
-- drop trigger     "APX$CONTENT_BIU_TRG";

-- drop table       "APX$CONTENT" purge;


-- drop view        "APEX_AUTHORS";
-- drop synonym     "APEX_AUTHOR";

-- drop sequence    "APX$AUTHOR_ID_SEQ";
-- drop trigger     "APX$AUTHOR_BIU_TRG";

-- drop table       "APX$AUTHOR" purge;

-----------------------------------------------------------------------------------------------------

--------------------------------------------------------
--  DDL for Table APX$AUTHOR
--------------------------------------------------------

create table "APX$AUTHOR" (
apx_author_id number not null,
apx_author varchar2(64) not null,
apx_author_code varchar2(8),
apx_parent_author_id number,
apx_author_sec_level number default 0,
author_name varchar2(64),
author_email varchar2(128),
author_photo_1 blob,
author_photo_2 blob,
author_photo_3 blob,
author_social_media_1 varchar2(128),
author_social_media_2 varchar2(128),
author_social_media_3 varchar2(128),
author_social_media_4 varchar2(128),
author_social_media_5 varchar2(128),
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$AUTHOR_ID_PK" primary key (apx_author_id),
constraint "APX$AUTHOR_PARENT_ID_FK" foreign key (apx_parent_author_id) references "APX$AUTHOR"(apx_author_id)
);

create unique index "APX$AUTHOR_UNQ1" on "APX$AUTHOR"(upper(trim(apx_author)), upper(trim(apx_author_code)), app_id);

create index "APX$AUTHOR_PARENT_ID_IDX" on "APX$AUTHOR"(apx_parent_author_id);
create index "APX$AUTHOR_CODE_IDX" on "APX$AUTHOR"(apx_author_code, apx_author);
create index "APX$AUTHOR_APP_ID_IDX" on "APX$AUTHOR"(app_id);

create sequence "APX$AUTHOR_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$AUTHOR_BIU_TRG"
before insert or update on "APX$AUTHOR"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_author_id is null) then
        select "APX$AUTHOR_ID_SEQ".NEXTVAL
        into :new.apx_author_id
        from dual;
    end if;
    select sysdate, nvl(v('apx_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('apx_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_AUTHOR"                    for "APX$AUTHOR";

-----------------------------------------------------------------------------------------------------
-- Views on APX$AUTHOR

create view "APEX_AUTHORS"
as
 select s.apx_author_id as apex_author_id,
        s.apx_author as apex_author,
        s.apx_author_code as apex_author_code,
        s.apx_parent_author_id as apex_parent_author_id,
        (select b.apx_author from "APEX_AUTHOR" b
         where b.apx_author_id = s.apx_parent_author_id) as apex_parent_author,
        s.apx_author_sec_level as apex_author_security_level,
        s.app_id as app_id
from  "APEX_AUTHOR" s
order by 1;


-----------------------------------------------------------------------------------------------------
-- Initial Data

-- DEFAULT Author, Content, Attachement first
insert into "APX$AUTHOR" (apx_author_id, apx_author, apx_author_code, app_id)
values ('0', 'DEFAULT', 'DEF', v('FB_FLOW_ID'));

commit;


--------------------------------------------------------
--  DDL for Table APX$CONTENT
--------------------------------------------------------
create table "APX$CONTENT" (
apx_content_id number not null,
apx_content_title varchar2(128) not null,
apx_content_sub_title  varchar2(128),
apx_content varchar2(4000),
apx_parent_content_id number,
apx_content_sec_level number default 0,
apx_content_type_id number default 0,
app_id number,
author_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$CONTENT_ID_PK" primary key (apx_content_id),
constraint "APX$CONTENT_PARENT_ID_FK" foreign key (apx_parent_content_id) references "APX$CONTENT"(apx_content_id) on delete cascade,
constraint "APX$CONTENT_AUTHOR_FK" foreign key (author_id) references "APX$AUTHOR"(apx_author_id) on delete set null,
constraint "APX$CONTENT_TYPE_ID_FK" foreign key (apx_content_type_id) references "APX$"(apx_id) on delete set null
);

create unique index "APX$CONTENT_UNQ1" on "APX$CONTENT"(upper(trim(apx_content_title)), upper(trim(apx_content_sub_title)), app_id);

create index "APX$CONTENT_PARENT_ID_IDX" on "APX$CONTENT"(apx_parent_content_id);
create index "APX$CONTENT_TITLESUB_IDX" on "APX$CONTENT"(apx_content_title, apx_content_sub_title);
create index "APX$CONTENT_APP_ID_IDX" on "APX$CONTENT"(app_id);
create index "APX$CONTENT_AUTHOR_IDX" on "APX$CONTENT"(author_id);
create index "APX$CONTENT_TYPE_IDX" on "APX$CONTENT"(apx_content_type_id);

create sequence "APX$CONTENT_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$CONTENT_BIU_TRG"
before insert or update on "APX$CONTENT"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_content_id is null) then
        select "APX$CONTENT_ID_SEQ".NEXTVAL
        into :new.apx_content_id
        from dual;
    end if;
    select sysdate, nvl(v('apx_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('apx_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_CONTENT"                    for "APX$CONTENT";

-----------------------------------------------------------------------------------------------------
-- Views on APX$CONTENT

create view "APEX_WEB_CONTENT"
as
 select s.apx_content_id as apex_content_id,
        a.apx_author as apex_content_author,
        s.apx_content_title as apex_content_title,
        s.apx_content_sub_title as apex_content_subtitle,
        s.apx_content as apex_content,
        apx.apx_object as apex_content_type,
        s.apx_content_type_id as apex_content_type_id,
        s.apx_parent_content_id as apex_parent_content_id,
        (select b.apx_content from "APEX_CONTENT" b
         where b.apx_content_id = s.apx_parent_content_id) as apex_parent_content,
        s.apx_content_sec_level as apex_content_security_level,
        s.app_id as app_id
from  "APEX_CONTENT" s left outer join "APEX_AUTHOR" a
on (s.author_id = a.apx_author_id)
left outer join "APEX_APX" apx
on (s.apx_content_type_id = apx.apx_id)
order by 1;

-----------------------------------------------------------------------------------------------------
-- Initial Data

-- DEFAULT Author, Content, Attachement first
insert into "APX$CONTENT" (apx_content_id, apx_content_title, apx_content_sub_title, author_id, app_id)
values (0, 'DEFAULT', 'Default Content', 0, v('FB_FLOW_ID'));

commit;


--------------------------------------------------------
--  DDL for Table APX$ATTACHEMENT
--------------------------------------------------------
create table "APX$ATTACHEMENT" (
apx_attachement_id number not null,
apx_content_id number default 0 not null,
apx_attachement_code varchar2(20),
apx_parent_attachement_id number,
apx_attachement_sec_level number default 0,
attachement_filename varchar2(512),
attachement_mime_type varchar2(512),
attachement_comment varchar2(128),
attachement_binary blob,
attachement_size_bytes number,
attachement_type_id number,
app_id number,
created date,
created_by varchar2(64),
modified date,
modified_by varchar2(64),
constraint "APX$ATTACHMNT_ID_PK" primary key (apx_attachement_id),
constraint "APX$ATTACHMNT_PARENT_ID_FK" foreign key (apx_parent_attachement_id) references "APX$ATTACHEMENT"(apx_attachement_id) on delete cascade,
constraint "APX$ATTACHMNT_CONTENT_ID_FK" foreign key (apx_content_id) references "APX$CONTENT"(apx_content_id) on delete cascade,
constraint "APX$ATTACHMNT_TYPE_ID_FK" foreign key (attachement_type_id) references "APX$"(apx_id) on delete set null
);

create index "APX$ATTACHMNT_PARENT_ID_IDX"  on "APX$ATTACHEMENT"(apx_parent_attachement_id);
create index "APX$ATTACHMNT_CONTENT_FK_IDX" on "APX$ATTACHEMENT"(apx_content_id);
create index "APX$ATTACHMNT_TYPE_ID_IDX"     on "APX$ATTACHEMENT"(attachement_type_id);
create index "APX$ATTACHMNT_APP_ID_IDX"     on "APX$ATTACHEMENT"(app_id);

create sequence "APX$ATTACHEMENT_ID_SEQ" start with 1 increment by 1 nocache;

create or replace trigger "APX$ATTACHEMENT_BIU_TRG"
before insert or update on "APX$ATTACHEMENT"
referencing old as old new as new
for each row
begin
  if inserting then
    if (:new.apx_attachement_id is null) then
        select "APX$ATTACHEMENT_ID_SEQ".NEXTVAL
        into :new.apx_attachement_id
        from dual;
    end if;
    select sysdate, nvl(v('apx_USER'), user)
    into :new.created, :new.created_by
    from dual;
  elsif updating then
    select sysdate, nvl(v('apx_USER'), user)
    into :new.modified, :new.modified_by
    from dual;
  end if;
end;
/

create synonym  "APEX_ATTACHEMENT"                    for "APX$ATTACHEMENT";

-----------------------------------------------------------------------------------------------------
-- Views on APX$ATTACHEMENT

create view "APEX_ATTACHEMENTS"
as
 select s.apx_attachement_id as apex_attachement_id,
        c.author_id as apex_content_author_id,
        a.apx_author as apex_content_author,
        c.apx_content_title as apex_content_title,
        c.apx_content_sub_title as apex_content_subtitle,
        s.apx_attachement_code as apex_attachement_code,
        apx.apx_object as apex_attachement_type,
        s.attachement_filename as attachement_filename,
        s.attachement_mime_type as attachement_mime_type,
        s.attachement_comment as attachement_comment,
        s.attachement_size_bytes as attachement_size_bytes,
        s.apx_parent_attachement_id as apex_parent_attachement_id,
        (select b.apx_attachement_code from "APEX_ATTACHEMENT" b
         where b.apx_attachement_id = s.apx_parent_attachement_id) as apex_parent_attachement,
        s.apx_attachement_sec_level as attachement_security_level,
        s.app_id as app_id
from  "APEX_ATTACHEMENT" s left outer join "APEX_CONTENT" c
on (s.apx_content_id = c.apx_content_id)
left outer join "APEX_AUTHOR" a
on (c.author_id = a.apx_author_id)
left outer join "APEX_APX" apx
on (s.attachement_type_id = apx.apx_id)
order by 1;


-----------------------------------------------------------------------------------------------------
-- Status Data

-- DEFAULT Status first
insert into "APX$ATTACHEMENT" (apx_attachement_id, apx_content_id, apx_attachement_code, app_id)
values (0, 0, 'DEFAULT', v('FB_FLOW_ID'));

commit;



------------------------------------------------------------------
-- Funtion to return Component Versions

-- drop function "APX_GET_VERSION";
------------------------------------------------------------------

-- Get Version of a Component
create function  "APX_GET_VERSION" (
p_comp_id varchar2
) return varchar2
is
l_version          VARCHAR2 (20) := null;
db_version         VARCHAR2 (20) := '12.1.0.2.0';
apx_version        VARCHAR2 (20) := '5.1.3.00.05';
BEGIN
-- // TODO
---- Find alternative ways to get version without dba_registry
-- select version
-- into l_version
-- from dba_registry
-- where comp_id = upper(p_comp_id);
case upper(p_comp_id)
    when 'CATALOG'
    then
    return  db_version;
    when 'APEX'
    then
    return apx_version;
    else
    return l_version;
end case;
exception when others then
return null;
END "APX_GET_VERSION";
/

-----------------------------------------------------------------------------------------------------
-- Apex Security

-- function (wrapped) returns a DES key

--drop function "APXKEY";

-----------------------------------------------------------------------------------------------------

-- Encryption key wrapped
create function "APXKEY" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
be f7
WqX4PVV3F1X4nIQXM02Si0QUJU8wg2Lw7cusfI5gkPiOvx1h+ZnTByUZJwteWWurSYaPXQZN
ICB8X5qh/zrPoZ/LC6zG+E4jP2sbwfi9IOt6yUbIj+DCAOxHr2t4bP/I8l8aN1/H+r3CvvF8
86lTVNnYRCAjZY+oFMIlVRzF9YnLh/IFa2ifcbiWiHuVo7tuGQmae22gPXEws3sbAsLy3tS+
UEeCC1w9t4Gbmoq9G7EgP3pz0Ws=
/

------------------------------------------------------------------
-- Encryption Procedure
-- for Credential Management

-- drop function "APX_ENCRYPT";
------------------------------------------------------------------

-- APX Dencryption

-- Encrypt VARCHAR2 & return RAW
create function "APX_ENCRYPT" (
input_string       VARCHAR2
) return raw
is
num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes)
key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
output_string      VARCHAR2 (200);
encrypted_raw      RAW (2000) := null;     -- stores encrypted binary text
decrypted_raw      RAW (2000);             -- stores decrypted binary text
-- encryption_type    PLS_INTEGER :=       -- total encryption type
--                             SYS.DBMS_CRYPTO.ENCRYPT_AES256
--                           + SYS.DBMS_CRYPTO.CHAIN_CBC
--                           + SYS.DBMS_CRYPTO.PAD_PKCS5;
BEGIN

-- // TODO
---- Find alternative encryption that uses public packages

  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || input_string);
--    encrypted_raw := SYS.DBMS_CRYPTO.ENCRYPT
--       (
--          src => UTL_I18N.STRING_TO_RAW (input_string,  'AL32UTF8'),
--          typ => encryption_type,
--          key => key_bytes_raw
--       );
    -- The encrypted value "encrypted_raw"
  --output_string := UTL_I18N.RAW_TO_CHAR (encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || output_string);
return encrypted_raw;
exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
end "APX_ENCRYPT";
/

------------------------------------------------------------------
-- Decryption Procedure
-- for Credential Management

-- drop function "APX_DECRYPT";
------------------------------------------------------------------

-- APX Dencryption

-- Decrypt RAW & return VARCHAR2
create function  "APX_DECRYPT" (
p_encrypted_raw      RAW
) return varchar2
is
num_key_bytes      NUMBER := 256/8;        -- key length 256 bits (32 bytes)
key_bytes_raw      RAW (32);               -- stores 256-bit encryption key
output_string      VARCHAR2 (200) := null;
decrypted_raw      RAW (2000);             -- stores decrypted binary text
-- encryption_type    PLS_INTEGER :=          -- total encryption type
--                             SYS.DBMS_CRYPTO.ENCRYPT_AES256
--                           + SYS.DBMS_CRYPTO.CHAIN_CBC
--                           + SYS.DBMS_CRYPTO.PAD_PKCS5;
BEGIN

-- // TODO
---- Find alternative encryption that uses public packages


  --output_string := UTL_I18N.RAW_TO_CHAR (p_encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Input hash: ' || output_string);
--   decrypted_raw := SYS.DBMS_CRYPTO.DECRYPT
--   (
--      src => p_encrypted_raw,
--      typ => encryption_type,
--      key => key_bytes_raw
--   );
--    output_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
--    --DBMS_OUTPUT.PUT_LINE ('Decrypted string: ' || output_string);
return  output_string;
exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
END "APX_DECRYPT";
/

-----------------------------------------------------------------------------------------------------

-- App User Registration Security Codes

-- drop view "APEX_SEC_CODE3";
-- drop view "APEX_SEC_CODE4";
-- drop view "APEX_SEC_CODE6";
-- drop view "APEX_SEC_CODE_PICKER";

--
-- 2017/12/03 SO: created
--
-- @requires: DBMS_RANDOM
--
------------------------------------------------------------------
-- Security Codes for Registration or others

-- 3DIGITS
create or replace view "APEX_SEC_CODE3"
as
select substr(to_char(abs(dbms_random.random())), 1, 3) code1,
       substr(to_char(abs(dbms_random.random())), 3, 3) code2,
       substr(to_char(abs(dbms_random.random())), 5, 3) code3,
       substr(to_char(abs(dbms_random.random())), 2, 3) code4
from dual;

-- 4DIGITS
create or replace view "APEX_SEC_CODE4"
as
select substr(to_char(abs(dbms_random.random())), 1, 4) code1,
       substr(to_char(abs(dbms_random.random())), 3, 4) code2,
       substr(to_char(abs(dbms_random.random())), 5, 4) code3,
       substr(to_char(abs(dbms_random.random())), 2, 5) code4
from dual;

-- 6DIGITS
create or replace view "APEX_SEC_CODE6"
as
select substr(to_char(abs(dbms_random.random())), 1, 6) code1,
       substr(to_char(abs(dbms_random.random())), 3, 6) code2,
       substr(to_char(abs(dbms_random.random())), 5, 6) code3,
       substr(to_char(abs(dbms_random.random())), 2, 6) code4
from dual;


-- RANDOM Number Picker that decides which code column to select
create or replace view "APEX_SEC_CODE_PICKER"
as
select  pickcode1,
        case when pickcode2 = pickcode1
            then decode(pickcode2 - 1, 0, 4, pickcode2 - 1)
            else pickcode2
        end as pickcode2
from (
select trunc(dbms_random.value(1,4)) as pickcode1,
       trunc(dbms_random.value(1,4)) pickcode2
from dual);
/
------------------------------------------------------------------
-- Funtion to return UserRegistrationToken

-- drop function "APX_GET_TOKEN";

--
-- 2017/12/03 SO: created
--
-- @requires: APX_SEC_CODES
--
------------------------------------------------------------------

-- Get Version of a Component
create function  "APX_GET_TOKEN" (
p_input_str varchar2 := 'UEeCC1w9t4Gbmoq9G7EgP3pz0Ws', -- some random string as default
p_token_type varchar2 := 'BASE64', -- [BASE64, 3DIGITS, 4DIGITS, 6DIGITS, 2X4DIGITS]
p_add_random boolean := true
) return varchar2
is
l_input_str varchar2(1000);
l_token varchar2(4000);
l_sql varchar2(4000);
pc1 number;
pc2 number;
c1 pls_integer;
c2 pls_integer;
begin
    l_input_str := p_input_str;
    if (p_token_type = 'BASE64') then
    if (p_add_random) then
        l_token := replace(UTL_RAW.CAST_TO_VARCHAR2(
                        UTL_ENCODE.BASE64_ENCODE(
                        UTL_RAW.CAST_TO_RAW(ABS(DBMS_RANDOM.random())||
                        l_input_str||
                        ABS(DBMS_RANDOM.random())))), CHR(13)||CHR(10),'');
    else
        l_token := replace(UTL_RAW.CAST_TO_VARCHAR2(
                        UTL_ENCODE.BASE64_ENCODE(
                        UTL_RAW.CAST_TO_RAW(
                        l_input_str
                        ))), CHR(13)||CHR(10),'');
    end if;
    elsif (p_token_type = '3DIGITS') then
        select pickcode1
        into pc1
        from "APEX_SEC_CODE_PICKER";
        l_sql := 'select code'||pc1||' from "APEX_SEC_CODE3"';
        execute immediate l_sql into c1;
        l_token := c1;
    elsif (p_token_type = '4DIGITS') then
        select pickcode1
        into pc1
        from "APEX_SEC_CODE_PICKER";
        l_sql := 'select code'||pc1||' from "APEX_SEC_CODE4"';
        execute immediate l_sql into c1;
        l_token := c1;
    elsif (p_token_type = '6DIGITS') then
        select pickcode1
        into pc1
        from "APEX_SEC_CODE_PICKER";
        l_sql := 'select code'||pc1||' from "APEX_SEC_CODE6"';
        execute immediate l_sql into c1;
        l_token := c1;
    elsif (p_token_type = '2X4DIGITS') then
        select pickcode1, pickcode2
        into pc1, pc2
        from "APEX_SEC_CODE_PICKER";
        l_sql := 'select code'||pc1||', code'||pc2||' from "APEX_SEC_CODE4"';
        execute immediate l_sql into c1, c2;
        l_token := c1||':'||c2;
    else
        l_token := "APX_GET_TOKEN"(p_token_type => 'BASE64');
    end if;
return l_token;
exception when others then
return null;
END "APX_GET_TOKEN";
/


set define off
--------------------------------------------------------------------------------
--
-- Title: apx.pkg (APEX MAIN PACKAGE)
--
-- Description: PL/SQL Package to provide an interface to subprocedures and functions.
--
-- Parameters: None
--
-- Requirements (see required section for implementation):
-- apxkey function, APX$APP_USER_SESSION table, APEX_APP_USER_SESSION view
--
-- Compatible: validated against Oracle 12c.
-- Lower versions are partly supported but it's not guaranteed to stay that way.
--
-- The User compiling this Package must have at least the following privileges:
--   RESOURCE and CONNECT Roles
--   APEX_ADMINISTRATOR_ROLE
--   select on "SYS"."V_$INSTANCE" and DBA_REGISTRY
--   create for views, tables, packages and synonyms
--
-- -- Example for User APXDBA:
--
--    GRANT "CONNECT" TO "APXDBA";
--    GRANT "RESOURCE" TO "APXDBA";
--    GRANT "APEX_ADMINISTRATOR_ROLE" TO "APXDBA";
--
--    GRANT SELECT ON "SYS"."V_$INSTANCE" TO "APXDBA";
--    GRANT SELECT ON "SYS"."DBA_REGISTRY" TO "APXDBA";
--    GRANT EXECUTE ON "SYS"."DBMS_CRYPTO" TO "APXDBA";
--    GRANT DEBUG CONNECT SESSION TO "APXDBA";
--    GRANT DEBUG ANY PROCEDURE TO "APXDBA";
--    GRANT CREATE VIEW TO "APXDBA";
--    GRANT CREATE TABLE TO "APXDBA";
--    GRANT CREATE TRIGGER TO "APXDBA";
--    GRANT CREATE PROCEDURE TO "APXDBA";
--    GRANT CREATE PUBLIC SYNONYM TO "APXDBA";
--
-- -----------------------------------------------------------------------------
-- History:      12.09.2007 SO: created
--               29.01.2017 SO: refactored for APEX
--               12.02.2017 SO: integrated in new Git Repository APX
--               20.11.2017 SO: outfactored encryption to interfaces, session mgmt
--
-- Disclaimer: the software is delivered "as-is", and the author takes
-- no responsiblity nor guarantee for the proper function of this script
-- nor for any damages or misfunctions that occure from using this software.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- required objects and interfaces
--------------------------------------------------------------------------------


-- Apex User Session Tables and Views
/*
-- Cleanup
drop view "APEX_APP_USER_SESSION";
drop sequence "APX$APP_USERSESS_SEQ";
drop trigger "APX$APP_USERSESS_BI_TRG";
drop table "APX$APP_USER_SESSION" purge;


create table "APX$APP_USER_SESSION" (
app_user_session_id number not null primary key,
app_username varchar2(64) not null,
app_user_email varchar2(64),
app_id number,
app_ws_id number,
app_user_pwd varchar2(64),
app_user_cookie_name varchar2(64),
app_user_last_page number,
app_user_last_login timestamp default current_timestamp,
app_user_last_logout timestamp default null,
app_user_session_seconds number default 28800, -- 8 hrs.
app_user_session_idle_sec number default 900 -- 15 min.
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

-- Apex User Sessions (requires: "APX$APP_USER_SESSION" table)
create or replace view "APEX_APP_USER_SESSION"
as
select app_user_session_id,
  app_username,
  app_user_email,
  app_id,
  app_ws_id,
  app_user_last_login,
  app_user_last_logout,
  trunc(app_session_duration) as app_session_duration_seconds,
  nvl(nullif(app_user_session_seconds,0), trunc(app_session_duration)) -
  trunc(app_session_duration) as app_session_remaining_seconds,
  case when app_session_duration <= app_user_session_seconds
          then 'Y'
          else 'N'
  end as app_session_is_current
from (
select app_user_session_id,
  app_username,
  app_user_email,
  app_id,
  app_ws_id,
  app_user_pwd,
  app_user_last_login,
  app_user_last_logout,
  app_user_session_seconds ,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) as now,
  ((cast(app_user_last_login as date) - date '1970-01-01')*24*60*60) as login_second,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) -
  ((cast(app_user_last_login as date) - date '1970-01-01')*24*60*60) as app_session_duration
from  "APX$APP_USER_SESSION"
);

-- Encryption key wrapped
create or replace function apxkey wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
be f7
WqX4PVV3F1X4nIQXM02Si0QUJU8wg2Lw7cusfI5gkPiOvx1h+ZnTByUZJwteWWurSYaPXQZN
ICB8X5qh/zrPoZ/LC6zG+E4jP2sbwfi9IOt6yUbIj+DCAOxHr2t4bP/I8l8aN1/H+r3CvvF8
86lTVNnYRCAjZY+oFMIlVRzF9YnLh/IFa2ifcbiWiHuVo7tuGQmae22gPXEws3sbAsLy3tS+
UEeCC1w9t4Gbmoq9G7EgP3pz0Ws=

/


*/

------------------------------------------------------------------

-- Standard Procedures and Functions are defined in this Package
-- and used by APX Packages Scripts and other processes.
-- This Package is intended to run standalone and provide a hub
-- for all Sub Packages and Procedures.
--
-- Common Functions and Procedures are made public by creating
-- standalone Procedures and Functions that server as an interface
-- to those commeon objects.
--
-- This is planned to make Migration and Renaming easier, since you
-- just need to update the reference in the wrapper to make things
-- work again;-). To make sure these wrappers are in place, this
-- package checks them at startup (see init) und creates them as needed.
-- We keep basic logging and debugging Functions in here
-- to avoid the henn-egg problem of logging/debugging this package,
-- if its the only one in place (which it is in mimimal configuration:-)

------------------------------------------------------------------
--                          Package Specification
------------------------------------------------------------------
CREATE OR REPLACE PACKAGE "APX" AUTHID CURRENT_USER
IS

------------------------------------------------------------------
-- Global Variables, REF_CURSORS and Types
------------------------------------------------------------------

-- names of objects (tables, views... usually 30 bytes)
SUBTYPE objname IS ALL_OBJECTS.SUBOBJECT_NAME%TYPE;

-- generic weak REF CURSOR (no RETURN Clause)
TYPE curtype IS REF CURSOR;

-- globals
g_debug boolean;

-- app sso
ssomaster number := 1000;

g_txt varchar2(4000);
g_dat date;
g_int pls_integer;
g_num number;

-- status output
c_ok CONSTANT VARCHAR2(5) := 'OK.';
c_fld CONSTANT VARCHAR2(10) := 'failed!';
c_con CONSTANT VARCHAR2(20) := 'connected';
c_discon CONSTANT VARCHAR2(20) := 'disconnected';

-- padding
c_pad CONSTANT PLS_INTEGER := 85;

-- name of this package
l_pkg objname := 'APX';

-- Step Markers for Debug
l_stepname objname := 'null';
l_step pls_integer := 0;
l_step_comment varchar2(1000);
l_str varchar2(4000);
l_apxcon varchar2(100);

-- APEX Session
p_session_id varchar2(512);
p_app_id number;
p_ws_id number;
p_user_id number;

-- majorversion of current instance
db_version PLS_INTEGER;

-- majorversion of current APEX instance
apx_version PLS_INTEGER;

-- print_pretty_line counter
ppl_cnt PLS_INTEGER := 0;

-- print_pretty_line_length
ppl_len PLS_INTEGER := 0;

------------------------------------------------------------------
-- Package Procedures and Functions
------------------------------------------------------------------

------------------------------------------------------------------
-- Setter and Getter Procedures and Functions
-- are used to set and get global variable values
-- Overloaded to support real types (char, int, date)
------------------------------------------------------------------

PROCEDURE "SETVAL" (
p_variable in varchar2,
p_value in varchar2,
p_initialize in boolean := false);


FUNCTION "GETVAL" (
p_variable in varchar2,
p_initialize in boolean := false)
return varchar2;

------------------------------------------------------------------
-- Encryption Procedure
-- for Credential Management
------------------------------------------------------------------

-- Encrypt VARCHAR2 & return RAW
function "ENCRYPT" (
input_string       VARCHAR2
) return raw;


------------------------------------------------------------------
-- Apex Environment
------------------------------------------------------------------

-- Get Workspace ID by Workspacename
function "GETWSID" (
p_ws_name apex_workspaces.workspace%type
) return apex_workspaces.workspace_id%type;

-- Get Workspace ID by Applicationname
function "GETWSID" (
p_app_id apex_applications.application_id%type
) return apex_workspaces.workspace_id%type;


-- Get Workspacename by Workspace ID
function "GETWS" (
p_app_id apex_applications.application_id%type,
p_ws_id apex_workspaces.workspace_id%type default null
) return apex_workspaces.workspace%type;


-- Get Application ID by Applicationname
function "GETAPPID" (
p_app_name apex_applications.application_name%type
) return apex_applications.application_id%type;


-- Get Applicationame by Application ID
function "GETAPP" (
p_app_id apex_applications.application_id%type
) return apex_applications.application_name%type;


-- Get the main APEX Database Schema (Owner of the API)
function "GETAPEXOWNER"
return apex_applications.owner%type;


-- redirect to a given URL
procedure "REDIRECT" (
p_url in varchar2
);


------------------------------------------------------------------
-- DBMS_OUTPUT Limitations:
--
-- Oracle 9i:
--  Errors raised:
--  ORU-10027: buffer overflow, limit of <buf_limit> bytes.
--  ORU-10028:line length overflow, limit of 255 bytes

-- Oracle 10g:
--  Errors raised:
--  ORU-10027: buffer overflow, limit of <buf_limit> bytes.
--  ORU-10028:line length overflow, limit of 32767 bytes per line.

-- Note: Procedures assume LINESIZE 100 in SQL*Plus
------------------------------------------------------------------


------------------------------------------------------------------
-- PrintLine: Wrapper Procedure to DBMS_OUTPUT
-- avoids ORU-10028 Errors with lines larger 255 bytes (up until 9i)
-- adopted from Steven Feuerstein: PL/SQL Best Practices (B-01)
------------------------------------------------------------------
PROCEDURE "PL_PRINT_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- PrintPrettyLine: Wrapper Procedure to DBMS_OUTPUT
-- see PrintLine for Description
-- added support for "pretty" line breaks at last blank of line.
------------------------------------------------------------------
PROCEDURE "PL_PRINT_PRETTY_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- Wrapper Procedure to DBMS_OUTPUT for easier access
-- and extended functionality. Calls to pl and ppl are made from it.
------------------------------------------------------------------
PROCEDURE "PL_PRINT" (
str_in IN VARCHAR2,
len_in IN NUMBER DEFAULT 100,
p_line IN BOOLEAN DEFAULT TRUE, -- use put_line ?
c_padding IN NUMBER DEFAULT NULL, -- use rc_pad?
c_padchar IN CHAR DEFAULT '.',        -- character used for c_padding
print_pretty IN BOOLEAN := FALSE,  -- use PrintPretty for Linebreaks
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- Wrapper Procedures to HTP.PRN and HTP.PRINT for easier access
-- htp.print - a string terminated with a newline.
-- htp.prn - the specified string, not terminated with a newline.
-- Parameters: p_txt, p_date, p_int - the string to generate.
------------------------------------------------------------------

PROCEDURE "HT_PRINTN" (p_txt in varchar2);
PROCEDURE "HT_PRINTN" (p_date in date);
PROCEDURE "HT_PRINTN" (p_int in number);

PROCEDURE "HT_PRINT" (p_txt in varchar2);
PROCEDURE "HT_PRINT" (p_date in date);
PROCEDURE "HT_PRINT" (p_int in number);

------------------------------------------------------------------
-- Wrapper Procedures to HTP.PS and HTP.PRINTS for easier access
-- Both these subprograms generate a string and replace
-- the following characters with the corresponding escape sequence.
-- < to &lt;
-- > to &gt;
-- " to &quot;
-- & to &amp;
-- htp.prints an escaped string terminated with a newline.
-- htp.ps an escaped string not terminated with a newline.
-- Parameters: ctext - the string where to perform character substitution.
-- Generates: A string.
------------------------------------------------------------------

PROCEDURE "HT_PRINTS"(p_txt in varchar2);

PROCEDURE "HT_PS"(p_txt in varchar2);

------------------------------------------------------------------
-- Conversion Functions for special PL/SQL types
-- and extended functionality.
------------------------------------------------------------------

-- Conversion Functions for Booleans
FUNCTION "NUM_TO_BOOLEAN" (
  number_in IN NUMBER
, false_num IN NUMBER := 0 -- which value evaluates to false?
, operand IN VARCHAR2 := '>'
) RETURN BOOLEAN;

FUNCTION "BOOLEAN_TO_NUM" (
  boolean_in IN BOOLEAN
, true_num IN NUMBER := 1 -- which value is true?
) RETURN NUMBER;


END "APX";
/


------------------------------------------------------------------
--                          Package Body
------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY "APX"
IS

------------------------------------------------------------------
-- Private Procedures and Functions
------------------------------------------------------------------
-- Encryption
num_key_bytes NUMBER := 256/8;        -- key length 256 bits (32 bytes)
key_bytes_raw RAW (32); -- stores 256-bit encryption key

-- Decrypt RAW & return VARCHAR2
function  "DECRYPT" (
p_encrypted_raw      RAW
) return varchar2
is
   output_string      VARCHAR2 (200);
   decrypted_raw      RAW (2000);             -- stores decrypted binary text
BEGIN
  --output_string := UTL_I18N.RAW_TO_CHAR (p_encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Input hash: ' || output_string);

  -- using interface "APX_ENCRYPT"
  output_string := "APX_DECRYPT"(p_encrypted_raw);

  --DBMS_OUTPUT.PUT_LINE ('Decrypted string: ' || output_string);
return  output_string;

exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
END "DECRYPT";


--------------------------------------------------------------------------------
-- Public Procedures and Functions
--------------------------------------------------------------------------------

------------------------------------------------------------------
-- Encryption Procedure
-- for Credential Management
------------------------------------------------------------------

-- Encrypt VARCHAR2 & return RAW
function "ENCRYPT" (
input_string       VARCHAR2
) return raw
is
  output_string      VARCHAR2 (200);
  encrypted_raw      RAW (2000);             -- stores encrypted binary text
BEGIN
  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || input_string);

  -- using interface "APX_ENCRYPT"
   encrypted_raw := "APX_ENCRYPT"(input_string);

   --output_string := UTL_I18N.RAW_TO_CHAR (encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || output_string);
return encrypted_raw;
exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
end "ENCRYPT";

------------------------------------------------------------------
-- Apex Environment
------------------------------------------------------------------

-- Get Workspace ID by Workspacename
function "GETWSID" (
p_ws_name apex_workspaces.workspace%type
) return apex_workspaces.workspace_id%type
is
l_ws_id apex_workspaces.workspace_id%type;
begin
  select workspace_id
  into l_ws_id
  from apex_workspaces
  where upper(workspace) = upper(trim(p_ws_name));
return l_ws_id;
exception when others then
raise;
end "GETWSID";

-- Get Workspace ID by Applicationname
function "GETWSID" (
p_app_id apex_applications.application_id%type
) return apex_workspaces.workspace_id%type
is
l_ws_id apex_workspaces.workspace_id%type;
begin
  select workspace_id
  into l_ws_id
  from apex_workspaces
  where workspace = (
    select workspace
    from apex_applications
    where application_id = p_app_id);
return l_ws_id;
exception when others then
raise;
end "GETWSID";

-- Get Workspacename by Workspace ID
function "GETWS" (
p_app_id apex_applications.application_id%type,
p_ws_id apex_workspaces.workspace_id%type default null
) return apex_workspaces.workspace%type
is
l_ws apex_workspaces.workspace%type;
begin
  if p_ws_id is not null then -- we get the workspace_name by it's ID
    select workspace
    into l_ws
    from apex_workspaces
    where workspace_id = p_ws_id;
  else -- we get the workspace_name by getting the WS_ID for an Application ID (default)
    l_ws := getws(null, getwsid(p_app_id));
  end if;
return l_ws;
exception when others then
raise;
end "GETWS";


-- Get Application ID by Applicationname
function "GETAPPID" (
p_app_name apex_applications.application_name%type
) return apex_applications.application_id%type
is
l_app_id apex_applications.application_id%type;
begin
  select application_id
  into l_app_id
  from apex_applications
  where upper(application_name) = upper(trim(p_app_name));
return l_app_id;
exception when others then
raise;
end "GETAPPID";

-- Get Applicationame by Application ID
function "GETAPP" (
p_app_id apex_applications.application_id%type
) return apex_applications.application_name%type
is
l_app apex_applications.application_name%type;
begin
  select application_name
  into l_app
  from apex_applications
  where application_id = p_app_id;
return l_app;
exception when others then
raise;
end "GETAPP";

-- Get the main APEX Database Schema (Owner of the API)
function "GETAPEXOWNER"
return apex_applications.owner%type
is
  l_apex_owner apex_applications.owner%type;
begin
  select owner
  into l_apex_owner
  from apex_applications
  where WORKSPACE = 'INTERNAL'
  and rownum = 1;
return l_apex_owner;
exception when others then
raise;
end "GETAPEXOWNER";


-- redirect to a given URL
procedure "REDIRECT" (
p_url in varchar2
)
is
  l_url varchar2(4000);
begin
  l_url := sys.utl_url.escape ( url => p_url, escape_reserved_chars => false );
  sys.owa_util.redirect_url(l_url);
  apex_application.stop_apex_engine;
end "REDIRECT";


------------------------------------------------------------------
-- Setter and Getter Procedures and Functions
-- used to set and get global variable values
------------------------------------------------------------------

PROCEDURE "SETVAL" (
p_variable in varchar2,
p_value in varchar2,
p_initialize in boolean := false)
is
l_sql varchar2(4000);
begin
  -- set the string
  l_sql := 'begin '|| p_variable||':= :val ; end;';
  if (p_initialize) then -- the value gets pruned before
    execute immediate l_sql using in '';
    --dbms_output.put_line('apx.g_txt (in package): '||apx.g_txt); -- needed for testing
  end if;
  -- set value
  execute immediate l_sql using in p_value;
end;


FUNCTION "GETVAL" (
p_variable in varchar2,
p_initialize in boolean := false)
return varchar2
is
l_sql varchar2(4000);
l_value varchar2(4000);
begin
  -- set the string
  l_sql := 'begin :val :='|| p_variable||'; end;';
  -- get value
  execute immediate l_sql using out l_value;
  if (p_initialize) then -- the value gets pruned after
    setval(p_variable, null);
    dbms_output.put_line('apx.g_txt (in package): '||apx.g_txt); -- needed for testing
  end if;
  return l_value;
end;



------------------------------------------------------------------
-- Printing Output Procedures for Debug and Logging
------------------------------------------------------------------

-- print_line
PROCEDURE "PL_PRINT_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE)
IS
len PLS_INTEGER;
str VARCHAR2(2000);
BEGIN
    -- set maximum chars/line
    IF (db_version < 10) THEN
        len  := LEAST (len_in, 255);
    ELSE
        len  := LEAST (len_in, 32767);
    END IF;

    IF (LENGTH (str_in) > len) THEN
        str := SUBSTR (str_in, 1, len);
        DBMS_OUTPUT.PUT_LINE (str);
        --recursive call of this procedure for remaining characters
        PL_PRINT_LINE (SUBSTR (str_in, len + 1), len, expand_in);
    ELSE
        str := str_in;
        DBMS_OUTPUT.PUT_LINE (str);
    END IF;
EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('Execption in PL');
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    DBMS_OUTPUT.PUT_LINE (str);
END;


-- print_pretty_line
PROCEDURE "PL_PRINT_PRETTY_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE)
IS
len PLS_INTEGER := LEAST (len_in, 255);
str VARCHAR2(2000);
BEGIN
    -- set maximum chars/line
    IF (db_version < 10) THEN
        len  := LEAST (len_in, 255);
    ELSE
        len  := LEAST (len_in, 32767);
    END IF;

    IF (LENGTH (str_in) > len) THEN
        -- increment package variable ppl_cnt first
        ppl_cnt := ppl_cnt + 1;
        IF (ppl_cnt = 1) THEN -- first run, so set l_len
        -- len_in can change at runtime, so we need a constant value here.
            ppl_len := len_in;
        END IF;

        str := SUBSTR (str_in, 1, len);
        len := INSTR(str, ' ', -1, 1);
        str := SUBSTR (str, 1, INSTR(str, ' ', -1, 1));
        DBMS_OUTPUT.PUT_LINE (str);
        --recursive call of this procedure for remaining characters
        PL_PRINT_PRETTY_LINE (SUBSTR (str_in, len + 1), ppl_len, expand_in);
    ELSE
        str := str_in;
        DBMS_OUTPUT.PUT_LINE (str);
    END IF;
EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('Execption in PPL');
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    -- PUT_LINE Exceptions are handled in ppl or pl already
    DBMS_OUTPUT.PUT (str);
END;

-- PL/SQL Print
PROCEDURE "PL_PRINT" (
str_in IN VARCHAR2,
len_in IN NUMBER DEFAULT 100,
p_line IN BOOLEAN DEFAULT TRUE, -- use put_line ?
c_padding IN NUMBER DEFAULT NULL, -- use c_pad?
c_padchar IN CHAR DEFAULT '.',         -- character used for c_pad
print_pretty IN BOOLEAN := FALSE,  -- use PrintPretty for Linebreaks
expand_in IN BOOLEAN := TRUE)
IS
str VARCHAR2(2000);
max_line PLS_INTEGER;
BEGIN

    IF (c_padding IS NOT NULL) THEN
        str := RPAD(str_in, c_padding, c_padchar);
    ELSE
        str := str_in;
    END IF;

    IF (p_line) THEN
        IF (print_pretty) THEN
        --DBMS_OUTPUT.PUT_LINE ('Printing Pretty Line: '||str);
            PL_PRINT_PRETTY_LINE (str, len_in);
        ELSE
        --DBMS_OUTPUT.PUT_LINE ('Printing Line: '||str);
            PL_PRINT_LINE (str, len_in);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT(str);
    END IF;
EXCEPTION WHEN OTHERS THEN
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    -- PUT_LINE Exceptions are handled in pl_print_pretty_line or pl already
    DBMS_OUTPUT.PUT (str);
END;

------------------------------------------------------------------
-- Print Text Procedures (HTP.PRN and HTP.PRINT)
------------------------------------------------------------------

-- Print without newlines (classic print command)
PROCEDURE "HT_PRINT" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.prn(l_txt);
end;

PROCEDURE "HT_PRINT" (p_date in date)
is
  l_date date;
begin
  l_date := p_date;
  htp.prn(l_date);
end;

PROCEDURE "HT_PRINT" (p_int in number)
is
  l_int number;
begin
  l_int := p_int;
  htp.prn(l_int);
end;

-- Print with newlines (classic printn command)
PROCEDURE "HT_PRINTN" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.print(l_txt);
end;

PROCEDURE "HT_PRINTN" (p_date in date)
is
  l_date date;
begin
  l_date := p_date;
  htp.print(l_date);
end;

PROCEDURE "HT_PRINTN" (p_int in number)
is
  l_int number;
begin
  l_int := p_int;
  htp.print(l_int);
end;

------------------------------------------------------------------
-- Print Escaped Text Procedures (HTP.PS and HTP.PRINTS)
------------------------------------------------------------------

-- don't print newlines
PROCEDURE "HT_PS"(p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.ps(l_txt);
end;

-- print newlines
PROCEDURE "HT_PRINTS" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.prints(l_txt);
end;

------------------------------------------------------------------
-- Admin Functions (converters mostly)
------------------------------------------------------------------

-- convert number to a boolean
FUNCTION "NUM_TO_BOOLEAN" (
  number_in IN NUMBER
, false_num IN NUMBER := 0 -- which value evaluates to false?
, operand IN VARCHAR2 := '>'
) RETURN BOOLEAN
IS
retval BOOLEAN := FALSE;
BEGIN
    IF operand = '>' AND number_in > false_num THEN
        retval := TRUE;
    ELSIF operand = '=' AND number_in = false_num THEN
        retval := FALSE;
    ELSIF operand = '=' AND number_in != false_num THEN
        retval := TRUE;
    ELSIF operand = '<' AND number_in < false_num THEN
        retval := TRUE;
    END IF;
RETURN retval;
END;

-- convert boolean to a number
FUNCTION "BOOLEAN_TO_NUM" (
  boolean_in IN BOOLEAN
, true_num IN NUMBER := 1 -- which value is true?
) RETURN NUMBER
IS
retval NUMBER := 0;
BEGIN
    IF boolean_in THEN
        retval := true_num;
    END IF;
RETURN retval;
END;


------------------------------------------------------------------
-- Initialization Section
------------------------------------------------------------------
BEGIN
    l_stepname := 'INIT';

    ------------------------------------------------------------------
    -- Set Encryption key
    ------------------------------------------------------------------
    l_step := l_step + 1;
    l_step_comment := 'Set Encryption key';
    select apxkey into key_bytes_raw from dual;

    ------------------------------------------------------------------
    -- APEX Environment
    -- (set here to see if a session exists,
    --  else no more processing needed.)
    ------------------------------------------------------------------
    l_step := l_step + 1;
    l_step_comment := 'APEX Session ID';
    p_session_id := nvl(v('SESSION_ID'), c_discon);

    if (p_session_id != c_discon or g_debug) then -- a Session exists or we debug

       ------------------------------------------------------------------
       -- APEX Settings (Workspace ID/NAME, APP_ID, APP_USER,...)
       ------------------------------------------------------------------

      -- //TODO

       ------------------------------------------------------------------
       -- get current Database- and APEX Majorversion
       -- (set in here once to minimize depencies among packages)
       ------------------------------------------------------------------
      begin

      l_step := l_step + 1;
      l_step_comment := 'DB Version';
      db_version := "APX_GET_VERSION"('CATALOG');

      l_step := l_step + 1;
      l_step_comment := 'APEX Version';
      db_version := "APX_GET_VERSION"('APEX');

      -- in here we use hard-wired logging, since apxerr might not be in place yet
      exception when others then
        l_str := 'ERROR: ['|| l_pkg||']:['||l_stepname|| ']:[';
        l_str := l_str ||l_step||']: Setting '||l_step_comment||' has '||c_fld||' ***';
        dbms_output.put_line (l_str);
        dbms_output.put_line (sqlerrm);
      raise;
      end;

    else
      -- say something about usage of this package, or
      null;
    end if;

------------------------------------------------------------------
-- End of Initialization Section
------------------------------------------------------------------

END "APX";
/

----------------------------------------------------------------------------------------------------
-- Display Errors if any
------------------------------------------------------------------
prompt
prompt Package "APX" Errors:
select line, text from all_errors
where name = 'APX'
order by line;
prompt Done compiling Package "APX" :-)
prompt
----------------------------------------------------------------------------------------------------
set define on

---- if you want make it public
-- grant execute on apx to apex_public_user;
-- create public synonym apx for apx;

--------------------------------------------------------------------------------
-- provided interfaces
prompt "APX" provided interfaces
--------------------------------------------------------------------------------
prompt
prompt "REGISTER_LOGIN"
create or replace procedure "REGISTER_LOGIN"
is
begin
  insert into "APX$USR_SESSION" (app_user_session_id, app_username, app_id, app_ws_id)
  values(v('SESSION'), v('APP_USER'), v('APP_ID'), apx.getwsid(p_app_id=>v('APP_ID')));
end;
/

set pages 0 line 120 define off verify off feed off echo off timing off

=======
set define off
--------------------------------------------------------------------------------
--
-- Title: apx.pkg (APEX MAIN PACKAGE)
--
-- Description: PL/SQL Package to provide an interface to subprocedures and functions.
--
-- Parameters: None
--
-- Requirements (see required section for implementation):
-- apxkey function, APX$APP_USER_SESSION table, APEX_APP_USER_SESSION view
--
-- Compatible: validated against Oracle 12c.
-- Lower versions are partly supported but it's not guaranteed to stay that way.
--
-- The User compiling this Package must have at least the following privileges:
--   RESOURCE and CONNECT Roles
--   APEX_ADMINISTRATOR_ROLE
--   select on "SYS"."V_$INSTANCE" and DBA_REGISTRY
--   create for views, tables, packages and synonyms
--
-- -- Example for User APXDBA:
--
--    GRANT "CONNECT" TO "APXDBA";
--    GRANT "RESOURCE" TO "APXDBA";
--    GRANT "APEX_ADMINISTRATOR_ROLE" TO "APXDBA";
--
--    GRANT SELECT ON "SYS"."V_$INSTANCE" TO "APXDBA";
--    GRANT SELECT ON "SYS"."DBA_REGISTRY" TO "APXDBA";
--    GRANT EXECUTE ON "SYS"."DBMS_CRYPTO" TO "APXDBA";
--    GRANT DEBUG CONNECT SESSION TO "APXDBA";
--    GRANT DEBUG ANY PROCEDURE TO "APXDBA";
--    GRANT CREATE VIEW TO "APXDBA";
--    GRANT CREATE TABLE TO "APXDBA";
--    GRANT CREATE TRIGGER TO "APXDBA";
--    GRANT CREATE PROCEDURE TO "APXDBA";
--    GRANT CREATE PUBLIC SYNONYM TO "APXDBA";
--
-- -----------------------------------------------------------------------------
-- History:      12.09.2007 SO: created
--               29.01.2017 SO: refactored for APEX
--               12.02.2017 SO: integrated in new Git Repository APX
--               20.11.2017 SO: outfactored encryption to interfaces, session mgmt
--
-- Disclaimer: the software is delivered "as-is", and the author takes
-- no responsiblity nor guarantee for the proper function of this script
-- nor for any damages or misfunctions that occure from using this software.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- required objects and interfaces
--------------------------------------------------------------------------------


-- Apex User Session Tables and Views
/*
-- Cleanup
drop view "APEX_APP_USER_SESSION";
drop sequence "APX$APP_USERSESS_SEQ";
drop trigger "APX$APP_USERSESS_BI_TRG";
drop table "APX$APP_USER_SESSION" purge;


create table "APX$APP_USER_SESSION" (
app_user_session_id number not null primary key,
app_username varchar2(64) not null,
app_user_email varchar2(64),
app_id number,
app_ws_id number,
app_user_pwd varchar2(64),
app_user_cookie_name varchar2(64),
app_user_last_page number,
app_user_last_login timestamp default current_timestamp,
app_user_last_logout timestamp default null,
app_user_session_seconds number default 28800, -- 8 hrs.
app_user_session_idle_sec number default 900 -- 15 min.
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

-- Apex User Sessions (requires: "APX$APP_USER_SESSION" table)
create or replace view "APEX_APP_USER_SESSION"
as
select app_user_session_id,
  app_username,
  app_user_email,
  app_id,
  app_ws_id,
  app_user_last_login,
  app_user_last_logout,
  trunc(app_session_duration) as app_session_duration_seconds,
  nvl(nullif(app_user_session_seconds,0), trunc(app_session_duration)) -
  trunc(app_session_duration) as app_session_remaining_seconds,
  case when app_session_duration <= app_user_session_seconds
          then 'Y'
          else 'N'
  end as app_session_is_current
from (
select app_user_session_id,
  app_username,
  app_user_email,
  app_id,
  app_ws_id,
  app_user_pwd,
  app_user_last_login,
  app_user_last_logout,
  app_user_session_seconds ,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) as now,
  ((cast(app_user_last_login as date) - date '1970-01-01')*24*60*60) as login_second,
  trunc((cast(current_timestamp as date) - date '1970-01-01')*24*60*60) -
  ((cast(app_user_last_login as date) - date '1970-01-01')*24*60*60) as app_session_duration
from  "APX$APP_USER_SESSION"
);

-- Encryption key wrapped
create or replace function apxkey wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
be f7
WqX4PVV3F1X4nIQXM02Si0QUJU8wg2Lw7cusfI5gkPiOvx1h+ZnTByUZJwteWWurSYaPXQZN
ICB8X5qh/zrPoZ/LC6zG+E4jP2sbwfi9IOt6yUbIj+DCAOxHr2t4bP/I8l8aN1/H+r3CvvF8
86lTVNnYRCAjZY+oFMIlVRzF9YnLh/IFa2ifcbiWiHuVo7tuGQmae22gPXEws3sbAsLy3tS+
UEeCC1w9t4Gbmoq9G7EgP3pz0Ws=

/


*/

------------------------------------------------------------------

-- Standard Procedures and Functions are defined in this Package
-- and used by APX Packages Scripts and other processes.
-- This Package is intended to run standalone and provide a hub
-- for all Sub Packages and Procedures.
--
-- Common Functions and Procedures are made public by creating
-- standalone Procedures and Functions that server as an interface
-- to those commeon objects.
--
-- This is planned to make Migration and Renaming easier, since you
-- just need to update the reference in the wrapper to make things
-- work again;-). To make sure these wrappers are in place, this
-- package checks them at startup (see init) und creates them as needed.
-- We keep basic logging and debugging Functions in here
-- to avoid the henn-egg problem of logging/debugging this package,
-- if its the only one in place (which it is in mimimal configuration:-)

------------------------------------------------------------------
--                          Package Specification
------------------------------------------------------------------
CREATE OR REPLACE PACKAGE "APX" AUTHID CURRENT_USER
IS

------------------------------------------------------------------
-- Global Variables, REF_CURSORS and Types
------------------------------------------------------------------

-- names of objects (tables, views... usually 30 bytes)
SUBTYPE objname IS ALL_OBJECTS.SUBOBJECT_NAME%TYPE;

-- generic weak REF CURSOR (no RETURN Clause)
TYPE curtype IS REF CURSOR;

-- globals
g_debug boolean;

-- app sso
ssomaster number := 1000;

g_txt varchar2(4000);
g_dat date;
g_int pls_integer;
g_num number;

-- status output
c_ok CONSTANT VARCHAR2(5) := 'OK.';
c_fld CONSTANT VARCHAR2(10) := 'failed!';
c_con CONSTANT VARCHAR2(20) := 'connected';
c_discon CONSTANT VARCHAR2(20) := 'disconnected';

-- padding
c_pad CONSTANT PLS_INTEGER := 85;

-- name of this package
l_pkg objname := 'APX';

-- Step Markers for Debug
l_stepname objname := 'null';
l_step pls_integer := 0;
l_step_comment varchar2(1000);
l_str varchar2(4000);
l_apxcon varchar2(100);

-- APEX Session
p_session_id varchar2(512);
p_app_id number;
p_ws_id number;
p_user_id number;

-- majorversion of current instance
db_version PLS_INTEGER;

-- majorversion of current APEX instance
apx_version PLS_INTEGER;

-- print_pretty_line counter
ppl_cnt PLS_INTEGER := 0;

-- print_pretty_line_length
ppl_len PLS_INTEGER := 0;

------------------------------------------------------------------
-- Package Procedures and Functions
------------------------------------------------------------------

------------------------------------------------------------------
-- Setter and Getter Procedures and Functions
-- are used to set and get global variable values
-- Overloaded to support real types (char, int, date)
------------------------------------------------------------------

PROCEDURE "SETVAL" (
p_variable in varchar2,
p_value in varchar2,
p_initialize in boolean := false);


FUNCTION "GETVAL" (
p_variable in varchar2,
p_initialize in boolean := false)
return varchar2;

------------------------------------------------------------------
-- Encryption Procedure
-- for Credential Management
------------------------------------------------------------------

-- Encrypt VARCHAR2 & return RAW
function "ENCRYPT" (
input_string       VARCHAR2
) return raw;


------------------------------------------------------------------
-- Apex Environment
------------------------------------------------------------------

-- Get Workspace ID by Workspacename
function "GETWSID" (
p_ws_name apex_workspaces.workspace%type
) return apex_workspaces.workspace_id%type;

-- Get Workspace ID by Applicationname
function "GETWSID" (
p_app_id apex_applications.application_id%type
) return apex_workspaces.workspace_id%type;


-- Get Workspacename by Workspace ID
function "GETWS" (
p_app_id apex_applications.application_id%type,
p_ws_id apex_workspaces.workspace_id%type default null
) return apex_workspaces.workspace%type;


-- Get Application ID by Applicationname
function "GETAPPID" (
p_app_name apex_applications.application_name%type
) return apex_applications.application_id%type;


-- Get Applicationame by Application ID
function "GETAPP" (
p_app_id apex_applications.application_id%type
) return apex_applications.application_name%type;


-- Get the main APEX Database Schema (Owner of the API)
function "GETAPEXOWNER"
return apex_applications.owner%type;


-- redirect to a given URL
procedure "REDIRECT" (
p_url in varchar2
);


------------------------------------------------------------------
-- DBMS_OUTPUT Limitations:
--
-- Oracle 9i:
--  Errors raised:
--  ORU-10027: buffer overflow, limit of <buf_limit> bytes.
--  ORU-10028:line length overflow, limit of 255 bytes

-- Oracle 10g:
--  Errors raised:
--  ORU-10027: buffer overflow, limit of <buf_limit> bytes.
--  ORU-10028:line length overflow, limit of 32767 bytes per line.

-- Note: Procedures assume LINESIZE 100 in SQL*Plus
------------------------------------------------------------------


------------------------------------------------------------------
-- PrintLine: Wrapper Procedure to DBMS_OUTPUT
-- avoids ORU-10028 Errors with lines larger 255 bytes (up until 9i)
-- adopted from Steven Feuerstein: PL/SQL Best Practices (B-01)
------------------------------------------------------------------
PROCEDURE "PL_PRINT_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- PrintPrettyLine: Wrapper Procedure to DBMS_OUTPUT
-- see PrintLine for Description
-- added support for "pretty" line breaks at last blank of line.
------------------------------------------------------------------
PROCEDURE "PL_PRINT_PRETTY_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- Wrapper Procedure to DBMS_OUTPUT for easier access
-- and extended functionality. Calls to pl and ppl are made from it.
------------------------------------------------------------------
PROCEDURE "PL_PRINT" (
str_in IN VARCHAR2,
len_in IN NUMBER DEFAULT 100,
p_line IN BOOLEAN DEFAULT TRUE, -- use put_line ?
c_padding IN NUMBER DEFAULT NULL, -- use rc_pad?
c_padchar IN CHAR DEFAULT '.',        -- character used for c_padding
print_pretty IN BOOLEAN := FALSE,  -- use PrintPretty for Linebreaks
expand_in IN BOOLEAN := TRUE);

------------------------------------------------------------------
-- Wrapper Procedures to HTP.PRN and HTP.PRINT for easier access
-- htp.print - a string terminated with a newline.
-- htp.prn - the specified string, not terminated with a newline.
-- Parameters: p_txt, p_date, p_int - the string to generate.
------------------------------------------------------------------

PROCEDURE "HT_PRINTN" (p_txt in varchar2);
PROCEDURE "HT_PRINTN" (p_date in date);
PROCEDURE "HT_PRINTN" (p_int in number);

PROCEDURE "HT_PRINT" (p_txt in varchar2);
PROCEDURE "HT_PRINT" (p_date in date);
PROCEDURE "HT_PRINT" (p_int in number);

------------------------------------------------------------------
-- Wrapper Procedures to HTP.PS and HTP.PRINTS for easier access
-- Both these subprograms generate a string and replace
-- the following characters with the corresponding escape sequence.
-- < to &lt;
-- > to &gt;
-- " to &quot;
-- & to &amp;
-- htp.prints an escaped string terminated with a newline.
-- htp.ps an escaped string not terminated with a newline.
-- Parameters: ctext - the string where to perform character substitution.
-- Generates: A string.
------------------------------------------------------------------

PROCEDURE "HT_PRINTS"(p_txt in varchar2);

PROCEDURE "HT_PS"(p_txt in varchar2);

------------------------------------------------------------------
-- Conversion Functions for special PL/SQL types
-- and extended functionality.
------------------------------------------------------------------

-- Conversion Functions for Booleans
FUNCTION "NUM_TO_BOOLEAN" (
  number_in IN NUMBER
, false_num IN NUMBER := 0 -- which value evaluates to false?
, operand IN VARCHAR2 := '>'
) RETURN BOOLEAN;

FUNCTION "BOOLEAN_TO_NUM" (
  boolean_in IN BOOLEAN
, true_num IN NUMBER := 1 -- which value is true?
) RETURN NUMBER;


END "APX";
/


------------------------------------------------------------------
--                          Package Body
------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY "APX"
IS

------------------------------------------------------------------
-- Private Procedures and Functions
------------------------------------------------------------------
-- Encryption
num_key_bytes NUMBER := 256/8;        -- key length 256 bits (32 bytes)
key_bytes_raw RAW (32); -- stores 256-bit encryption key

-- Decrypt RAW & return VARCHAR2
function  "DECRYPT" (
p_encrypted_raw      RAW
) return varchar2
is
   output_string      VARCHAR2 (200);
   decrypted_raw      RAW (2000);             -- stores decrypted binary text
BEGIN
  --output_string := UTL_I18N.RAW_TO_CHAR (p_encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Input hash: ' || output_string);

  -- using interface "APX_ENCRYPT"
  output_string := "APX_DECRYPT"(p_encrypted_raw);

  --DBMS_OUTPUT.PUT_LINE ('Decrypted string: ' || output_string);
return  output_string;

exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
END "DECRYPT";


--------------------------------------------------------------------------------
-- Public Procedures and Functions
--------------------------------------------------------------------------------

------------------------------------------------------------------
-- Encryption Procedure
-- for Credential Management
------------------------------------------------------------------

-- Encrypt VARCHAR2 & return RAW
function "ENCRYPT" (
input_string       VARCHAR2
) return raw
is
  output_string      VARCHAR2 (200);
  encrypted_raw      RAW (2000);             -- stores encrypted binary text
BEGIN
  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || input_string);

  -- using interface "APX_ENCRYPT"
   encrypted_raw := "APX_ENCRYPT"(input_string);

   --output_string := UTL_I18N.RAW_TO_CHAR (encrypted_raw, 'AL32UTF8');
  --DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || output_string);
return encrypted_raw;
exception when others then
--DBMS_OUTPUT.PUT_LINE ('Input hash: ' || output_string);
--DBMS_OUTPUT.PUT_LINE (sqlerrm);
return null;
end "ENCRYPT";

------------------------------------------------------------------
-- Apex Environment
------------------------------------------------------------------

-- Get Workspace ID by Workspacename
function "GETWSID" (
p_ws_name apex_workspaces.workspace%type
) return apex_workspaces.workspace_id%type
is
l_ws_id apex_workspaces.workspace_id%type;
begin
  select workspace_id
  into l_ws_id
  from apex_workspaces
  where upper(workspace) = upper(trim(p_ws_name));
return l_ws_id;
exception when others then
raise;
end "GETWSID";

-- Get Workspace ID by Applicationname
function "GETWSID" (
p_app_id apex_applications.application_id%type
) return apex_workspaces.workspace_id%type
is
l_ws_id apex_workspaces.workspace_id%type;
begin
  select workspace_id
  into l_ws_id
  from apex_workspaces
  where workspace = (
    select workspace
    from apex_applications
    where application_id = p_app_id);
return l_ws_id;
exception when others then
raise;
end "GETWSID";

-- Get Workspacename by Workspace ID
function "GETWS" (
p_app_id apex_applications.application_id%type,
p_ws_id apex_workspaces.workspace_id%type default null
) return apex_workspaces.workspace%type
is
l_ws apex_workspaces.workspace%type;
begin
  if p_ws_id is not null then -- we get the workspace_name by it's ID
    select workspace
    into l_ws
    from apex_workspaces
    where workspace_id = p_ws_id;
  else -- we get the workspace_name by getting the WS_ID for an Application ID (default)
    l_ws := getws(null, getwsid(p_app_id));
  end if;
return l_ws;
exception when others then
raise;
end "GETWS";


-- Get Application ID by Applicationname
function "GETAPPID" (
p_app_name apex_applications.application_name%type
) return apex_applications.application_id%type
is
l_app_id apex_applications.application_id%type;
begin
  select application_id
  into l_app_id
  from apex_applications
  where upper(application_name) = upper(trim(p_app_name));
return l_app_id;
exception when others then
raise;
end "GETAPPID";

-- Get Applicationame by Application ID
function "GETAPP" (
p_app_id apex_applications.application_id%type
) return apex_applications.application_name%type
is
l_app apex_applications.application_name%type;
begin
  select application_name
  into l_app
  from apex_applications
  where application_id = p_app_id;
return l_app;
exception when others then
raise;
end "GETAPP";

-- Get the main APEX Database Schema (Owner of the API)
function "GETAPEXOWNER"
return apex_applications.owner%type
is
  l_apex_owner apex_applications.owner%type;
begin
  select owner
  into l_apex_owner
  from apex_applications
  where WORKSPACE = 'INTERNAL'
  and rownum = 1;
return l_apex_owner;
exception when others then
raise;
end "GETAPEXOWNER";


-- redirect to a given URL
procedure "REDIRECT" (
p_url in varchar2
)
is
  l_url varchar2(4000);
begin
  l_url := sys.utl_url.escape ( url => p_url, escape_reserved_chars => false );
  sys.owa_util.redirect_url(l_url);
  apex_application.stop_apex_engine;
end "REDIRECT";


------------------------------------------------------------------
-- Setter and Getter Procedures and Functions
-- used to set and get global variable values
------------------------------------------------------------------

PROCEDURE "SETVAL" (
p_variable in varchar2,
p_value in varchar2,
p_initialize in boolean := false)
is
l_sql varchar2(4000);
begin
  -- set the string
  l_sql := 'begin '|| p_variable||':= :val ; end;';
  if (p_initialize) then -- the value gets pruned before
    execute immediate l_sql using in '';
    --dbms_output.put_line('apx.g_txt (in package): '||apx.g_txt); -- needed for testing
  end if;
  -- set value
  execute immediate l_sql using in p_value;
end;


FUNCTION "GETVAL" (
p_variable in varchar2,
p_initialize in boolean := false)
return varchar2
is
l_sql varchar2(4000);
l_value varchar2(4000);
begin
  -- set the string
  l_sql := 'begin :val :='|| p_variable||'; end;';
  -- get value
  execute immediate l_sql using out l_value;
  if (p_initialize) then -- the value gets pruned after
    setval(p_variable, null);
    dbms_output.put_line('apx.g_txt (in package): '||apx.g_txt); -- needed for testing
  end if;
  return l_value;
end;



------------------------------------------------------------------
-- Printing Output Procedures for Debug and Logging
------------------------------------------------------------------

-- print_line
PROCEDURE "PL_PRINT_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE)
IS
len PLS_INTEGER;
str VARCHAR2(2000);
BEGIN
    -- set maximum chars/line
    IF (db_version < 10) THEN
        len  := LEAST (len_in, 255);
    ELSE
        len  := LEAST (len_in, 32767);
    END IF;

    IF (LENGTH (str_in) > len) THEN
        str := SUBSTR (str_in, 1, len);
        DBMS_OUTPUT.PUT_LINE (str);
        --recursive call of this procedure for remaining characters
        PL_PRINT_LINE (SUBSTR (str_in, len + 1), len, expand_in);
    ELSE
        str := str_in;
        DBMS_OUTPUT.PUT_LINE (str);
    END IF;
EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('Execption in PL');
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    DBMS_OUTPUT.PUT_LINE (str);
END;


-- print_pretty_line
PROCEDURE "PL_PRINT_PRETTY_LINE" (
str_in IN VARCHAR2,
len_in IN INTEGER := 100,
expand_in IN BOOLEAN := TRUE)
IS
len PLS_INTEGER := LEAST (len_in, 255);
str VARCHAR2(2000);
BEGIN
    -- set maximum chars/line
    IF (db_version < 10) THEN
        len  := LEAST (len_in, 255);
    ELSE
        len  := LEAST (len_in, 32767);
    END IF;

    IF (LENGTH (str_in) > len) THEN
        -- increment package variable ppl_cnt first
        ppl_cnt := ppl_cnt + 1;
        IF (ppl_cnt = 1) THEN -- first run, so set l_len
        -- len_in can change at runtime, so we need a constant value here.
            ppl_len := len_in;
        END IF;

        str := SUBSTR (str_in, 1, len);
        len := INSTR(str, ' ', -1, 1);
        str := SUBSTR (str, 1, INSTR(str, ' ', -1, 1));
        DBMS_OUTPUT.PUT_LINE (str);
        --recursive call of this procedure for remaining characters
        PL_PRINT_PRETTY_LINE (SUBSTR (str_in, len + 1), ppl_len, expand_in);
    ELSE
        str := str_in;
        DBMS_OUTPUT.PUT_LINE (str);
    END IF;
EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE ('Execption in PPL');
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    -- PUT_LINE Exceptions are handled in ppl or pl already
    DBMS_OUTPUT.PUT (str);
END;

-- PL/SQL Print
PROCEDURE "PL_PRINT" (
str_in IN VARCHAR2,
len_in IN NUMBER DEFAULT 100,
p_line IN BOOLEAN DEFAULT TRUE, -- use put_line ?
c_padding IN NUMBER DEFAULT NULL, -- use c_pad?
c_padchar IN CHAR DEFAULT '.',         -- character used for c_pad
print_pretty IN BOOLEAN := FALSE,  -- use PrintPretty for Linebreaks
expand_in IN BOOLEAN := TRUE)
IS
str VARCHAR2(2000);
max_line PLS_INTEGER;
BEGIN

    IF (c_padding IS NOT NULL) THEN
        str := RPAD(str_in, c_padding, c_padchar);
    ELSE
        str := str_in;
    END IF;

    IF (p_line) THEN
        IF (print_pretty) THEN
        --DBMS_OUTPUT.PUT_LINE ('Printing Pretty Line: '||str);
            PL_PRINT_PRETTY_LINE (str, len_in);
        ELSE
        --DBMS_OUTPUT.PUT_LINE ('Printing Line: '||str);
            PL_PRINT_LINE (str, len_in);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT(str);
    END IF;
EXCEPTION WHEN OTHERS THEN
    IF expand_in THEN
       DBMS_OUTPUT.ENABLE (1000000);
    ELSE
       RAISE;
    END IF;
    -- PUT_LINE Exceptions are handled in pl_print_pretty_line or pl already
    DBMS_OUTPUT.PUT (str);
END;

------------------------------------------------------------------
-- Print Text Procedures (HTP.PRN and HTP.PRINT)
------------------------------------------------------------------

-- Print without newlines (classic print command)
PROCEDURE "HT_PRINT" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.prn(l_txt);
end;

PROCEDURE "HT_PRINT" (p_date in date)
is
  l_date date;
begin
  l_date := p_date;
  htp.prn(l_date);
end;

PROCEDURE "HT_PRINT" (p_int in number)
is
  l_int number;
begin
  l_int := p_int;
  htp.prn(l_int);
end;

-- Print with newlines (classic printn command)
PROCEDURE "HT_PRINTN" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.print(l_txt);
end;

PROCEDURE "HT_PRINTN" (p_date in date)
is
  l_date date;
begin
  l_date := p_date;
  htp.print(l_date);
end;

PROCEDURE "HT_PRINTN" (p_int in number)
is
  l_int number;
begin
  l_int := p_int;
  htp.print(l_int);
end;

------------------------------------------------------------------
-- Print Escaped Text Procedures (HTP.PS and HTP.PRINTS)
------------------------------------------------------------------

-- don't print newlines
PROCEDURE "HT_PS"(p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.ps(l_txt);
end;

-- print newlines
PROCEDURE "HT_PRINTS" (p_txt in varchar2)
is
  l_txt varchar2(4000);
begin
  l_txt := p_txt;
  htp.prints(l_txt);
end;

------------------------------------------------------------------
-- Admin Functions (converters mostly)
------------------------------------------------------------------

-- convert number to a boolean
FUNCTION "NUM_TO_BOOLEAN" (
  number_in IN NUMBER
, false_num IN NUMBER := 0 -- which value evaluates to false?
, operand IN VARCHAR2 := '>'
) RETURN BOOLEAN
IS
retval BOOLEAN := FALSE;
BEGIN
    IF operand = '>' AND number_in > false_num THEN
        retval := TRUE;
    ELSIF operand = '=' AND number_in = false_num THEN
        retval := FALSE;
    ELSIF operand = '=' AND number_in != false_num THEN
        retval := TRUE;
    ELSIF operand = '<' AND number_in < false_num THEN
        retval := TRUE;
    END IF;
RETURN retval;
END;

-- convert boolean to a number
FUNCTION "BOOLEAN_TO_NUM" (
  boolean_in IN BOOLEAN
, true_num IN NUMBER := 1 -- which value is true?
) RETURN NUMBER
IS
retval NUMBER := 0;
BEGIN
    IF boolean_in THEN
        retval := true_num;
    END IF;
RETURN retval;
END;


------------------------------------------------------------------
-- Initialization Section
------------------------------------------------------------------
BEGIN
    l_stepname := 'INIT';

    ------------------------------------------------------------------
    -- Set Encryption key
    ------------------------------------------------------------------
    l_step := l_step + 1;
    l_step_comment := 'Set Encryption key';
    select apxkey into key_bytes_raw from dual;

    ------------------------------------------------------------------
    -- APEX Environment
    -- (set here to see if a session exists,
    --  else no more processing needed.)
    ------------------------------------------------------------------
    l_step := l_step + 1;
    l_step_comment := 'APEX Session ID';
    p_session_id := nvl(v('SESSION_ID'), c_discon);

    if (p_session_id != c_discon or g_debug) then -- a Session exists or we debug

       ------------------------------------------------------------------
       -- APEX Settings (Workspace ID/NAME, APP_ID, APP_USER,...)
       ------------------------------------------------------------------

      -- //TODO

       ------------------------------------------------------------------
       -- get current Database- and APEX Majorversion
       -- (set in here once to minimize depencies among packages)
       ------------------------------------------------------------------
      begin

      l_step := l_step + 1;
      l_step_comment := 'DB Version';
      db_version := "APX_GET_VERSION"('CATALOG');

      l_step := l_step + 1;
      l_step_comment := 'APEX Version';
      db_version := "APX_GET_VERSION"('APEX');

      -- in here we use hard-wired logging, since apxerr might not be in place yet
      exception when others then
        l_str := 'ERROR: ['|| l_pkg||']:['||l_stepname|| ']:[';
        l_str := l_str ||l_step||']: Setting '||l_step_comment||' has '||c_fld||' ***';
        dbms_output.put_line (l_str);
        dbms_output.put_line (sqlerrm);
      raise;
      end;

    else
      -- say something about usage of this package, or
      null;
    end if;

------------------------------------------------------------------
-- End of Initialization Section
------------------------------------------------------------------

END "APX";
/

----------------------------------------------------------------------------------------------------
-- Display Errors if any
------------------------------------------------------------------
prompt
prompt Package "APX" Errors:
select line, text from all_errors
where name = 'APX'
order by line;
prompt Done compiling Package "APX" :-)
prompt
----------------------------------------------------------------------------------------------------
set define on

---- if you want make it public
-- grant execute on apx to apex_public_user;
-- create public synonym apx for apx;

--------------------------------------------------------------------------------
-- provided interfaces
prompt "APX" provided interfaces
--------------------------------------------------------------------------------
prompt
prompt "REGISTER_LOGIN"
create or replace procedure "REGISTER_LOGIN"
is
begin
  insert into "APX$USR_SESSION" (apx_user_session_id, apx_username, app_id, app_ws_id)
  values(v('SESSION'), v('APP_USER'), v('APP_ID'), apx.getwsid(p_app_id=>v('APP_ID')));
end;
/

set pages 0 line 120 define off verify off feed off echo off timing off

>>>>>>> origin/master
EXIT SQL.SQLCODE;

       ---- 17/12/17 21:09  End of SQL Build APX  ----
---------------------------------------------------------------
