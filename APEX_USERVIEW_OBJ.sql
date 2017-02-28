--- APEX User Session Objects ---


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APXDBA Release 1.0.0
--
-- APEX User Session Objects.
-- Objects and Attributes can be changed to your needs.
--
-- 22.02.2017 SO: created
--
--
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
