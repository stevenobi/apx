--- APEX User Management Drop ---


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APXDBA Release 1.0.0
--
-- APEX User Management Drop Objects.
--
-- 11.02.2017 SO: created
--
--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

drop sequence "APX$APP_USER_ID_SEQ";
drop trigger "APX$APP_USER_BIU_TRG" ;
drop sequence "APX$APP_ROLE_ID_SEQ";
drop trigger "APX$APP_ROLE_BIU_TRG" ;
drop sequence "APX$APP_USERROLE_SEQ";
drop trigger "APX$APP_USERROLE_BIU_TRG";
drop trigger "APX$APP_USER_DEFROLE_AIU_TRG";
drop sequence "APX$APP_STATUS_ID_SEQ";
drop trigger "APX$APP_STATUS_BIU_TRG" ;
drop sequence "APX$APP_USERSESS_SEQ";
drop trigger "APX$APP_USERSESS_BI_TRG";

drop table "APX$APP_USER_ROLE_MAP" purge;
drop table "APX$APP_USER" purge;
drop table "APX$APP_ROLE" purge;
drop table "APX$APP_STATUS" purge;
drop table "APX$APP_USER_SESSION" purge;

drop procedure "REGISTER_LOGIN";
