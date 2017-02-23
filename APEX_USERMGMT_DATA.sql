--- APEX User Management Data ---



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APXDBA Release 1.0.0
--
-- APEX User Management Sample Data.
-- Usernames and Roles can be changed to your needs.
-- If User ADMIN or PUBLIC are changed this needs to be reflected in Roles Table as well.
-- The email entries for those two User/Roles should be changed to real adresses.
--
-- 11.02.2017 SO: created
--
--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sample Data

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Status

-- DEFAULT Status first
insert into "APX$APP_STATUS" (app_id, app_status_id, app_status, app_status_code, app_status_scope)
values (v('FB_FLOW_ID'), 0, 'DEFAULT', 'DEF', 'ALL');

-- Status by Scope
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'OPEN', 'OPN', 'ACCOUNT');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'LOCKED', 'LCK', 'ACCOUNT');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'EXPIRED', 'XPR', 'ACCOUNT');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'ENABLED', 'ENA', 'ROLE');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'DISABLED', 'DIS', 'ROLE');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'UP', 'UP', 'APPLICATION');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'DOWN', 'DWN', 'APPLICATION');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'ENABLED', '1', 'SETTING');
insert into "APX$APP_STATUS" (app_id, app_status, app_status_code, app_status_scope) values (v('FB_FLOW_ID'), 'DISABLED', '0', 'SETTING');

commit;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Roles
-- can provide security levels groupwise in a up- or downwards security classification.
-- In this case we go upwards, means the higher the group_id the higher the privileges, except for root, who is allways allowed to all at any time.
-- So we can ask if the role_id is greater/equal to the security level, or if user has_root (min(users_role_id = 0)) in VPD functions or Authorizations Schemes.
-- and thus the higher the Security Level of an object, item or page the higher the Role Security Level (i.e. the ROLE_ID) needs to be to access it.

-- Public and Internal Roles
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 0, 'PUBLIC', 'PUB', 'Public User', 5);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1, 'USER', 'USR', 'Application User.', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 10, 'READER', 'READ', 'Application ReadOnly Users (May read but not change Data)', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 20, 'WRITER', 'WRITE', 'Application ReadWrite Users (May write and change Data)', 4);
-- Higher Privileged Roles
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1000, 'ADMINSTRATOR', 'ADM', 'Application Administrators', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1010, 'MANAGEMENT', 'MGM', 'Company Managers', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1050, 'BOARD_OF_DIRECTORS', 'BOD', 'Company''s Board of Directors', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1100, 'C_LEVEL1', 'CL1', 'Company''s Central Officers Level 1', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1200, 'C_LEVEL2', 'CL2', 'Company''s Central Officers Level 2', 4);
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1300, 'C_LEVEL3', 'CL3', 'Company''s Central Officers Level 3', 4);
-- The Super User Role
insert into "APX$APP_ROLE" (app_id, app_role_id, app_rolename, app_role_code, app_role_description, app_role_status_id)
values (v('FB_FLOW_ID'), 1000000, 'ROOT', 'ROOT', 'The Super User Role', '1');

commit;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Default User

-- Public Account a.k.a. ANONYMOUS
insert into "APX$APP_USER" (app_id, app_user_id, app_username, app_user_email, app_user_code, app_user_description,
                                                                 app_user_status_id, app_user_default_role_id)
values (v('FB_FLOW_ID'), 0, 'PUBLIC', 'public@mail.com', 'PUB', 'Application Public Account', 2, 0);

-- The Default APEX User (ADMIN) inherited from Workspace
insert into "APX$APP_USER" (app_id, app_user_id, app_username, app_user_email, app_user_code, app_user_description,
                                                                 app_user_status_id, app_user_default_role_id)
values (v('FB_FLOW_ID'), 1, 'ADMIN', 'admin@mail.com', 'ADM', 'Application Admin Account (Apex Default)', 1, 1000);

commit;

-- Check Constarint after Default Users have been entered  (0 PUBLIC; 1 USER)
alter table "APX$APP_USER" add constraint "APX$APPUSER_DEFROLE_CHK" check (app_user_default_role_id in (0, 1)) novalidate;
