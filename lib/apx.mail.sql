declare
 l_result pls_integer;
 begin
     send_mail(  p_mailto => 'Trivadis@bfarm.de'
               , p_result => l_result
               , p_topic  => 'REGISTER'
               , p_app_id => 100000   -- needed for Topic to work :-)
               , p_debug_only => false);
     dbms_output.put_line('*** Send Mail returned: ' || l_result);
 end;
/

declare
l_result varchar2(4000);
begin
    check_email_address('Trivadis@bfarm.de', l_result, p_check_smtp => true);
    dbms_output.put_line(l_result);
end;
/


insert into "APEX_USER_REGISTRATION" (apx_username, apx_user_email)
values (nvl(:P110_USERNAME, :P110_USER_EMAIL), :P110_USER_EMAIL);

commit;

        select apx_domain_id, apx_domain
--        into :new.apx_user_domain_id, l_domain
        from "APX$DOMAIN"
        where upper(trim(apx_domain)) =
        upper(trim("PARSE_DOMAIN_FROM_EMAIL"(:new_apx_user_email)))
        and apx_domain_status_id = (select apx_status_id
                                    from "APX$STATUS"
                                    where apx_status = 'VALID'
                                    and apx_status_ctx_id = (select apx_context_id
                                                             from "APX$CTX"
                                                             where apx_context = 'DOMAIN'));


select upper(trim("PARSE_DOMAIN_FROM_EMAIL"(:new_apx_user_email))) from dual;

select trim(substr(:p_address, instr(:p_address, '@') +1, length(:p_address))) from dual;

begin
raise_application_error(-20000, 'Error');
end;
/

create or replace function "PARSE_DOMAIN_FROM_EMAIL" (
    p_address varchar2
) return varchar2
as
l_domain varchar2(1000);
begin
    if instr(p_address, '@') > 0 then
      l_domain := trim(substr(p_address, instr(p_address, '@') +1, length(p_address)));
    else
      l_domain := trim(p_address);
    end if;
  return (l_domain);
end;
/

alter table APX$DOMAIN modify APX_DOMAIN_STATUS_ID	number	default 6;
alter table APX$USER_REG modify apx_user_domain_id number default null;
alter table APX$USER_REG modify apx_user_status_id number default 11;

select apex_mail.get_instance_url from dual;
select APEX_UTIL.HOST_URL('SCRIPT') from dual;

with user_status
as
(select apx_status_id,
        apx_status,
        case when apx_status = 'REG_ATTEMPTS_EXCEEDED'
             then 0
             else 1
        end as apx_status_quote
 from "APX$STATUS"
 where apx_status_ctx_id =
     (select apx_context_id
      from "APX$CTX"
      where apx_context = 'USER'
      )
)
--select q.username, (q.token_valid + q.user_status) + (q.is_app_user + q.is_apex_user) as user_status
--from (
    select
      apex_username              as username,
      user_status                as user_status,
      token_valid                as token_valid,
      is_app_user                as is_app_user,
      is_apex_user               as is_apex_user
    from (
    select  u.apx_username as apex_username,
            s.apx_status as apex_status,
            nvl(s.apx_status_quote, 1) as apx_status_quote,
            case nvl(s.apx_status, 'UNKNOWN')
              when ('UNKNOWN')                  then 0
              when ('NEW')                      then 0
              when ('REGISTERED')               then 1
              when ('REG_ATTEMPTS_EXCEEDED')    then 2
                                                else 3
            end as user_status,
            case when sysdate > u.apx_user_token_valid_until
                 then 0 * nvl(s.apx_status_quote, 1) + 1
                 else 9 * nvl(s.apx_status_quote, 1) + 1
            end as token_valid,
            case when apx_app_user_id is not null
                 then 101 * nvl(s.apx_status_quote, 1)
                 else 0
            end as is_app_user,
            case when apex_user_id is not null
                 then 201 * nvl(s.apx_status_quote, 1)
                 else 0
            end as is_apex_user
    from "APX$USER_REG" u left outer join "USER_STATUS" s
    on (u.apx_user_status_id = s.apx_status_id)
  );
--) q;

select "GET_URL" ('REGISTER',
                            p_app     => 0,
                            p_page    => 'USRREG',
                            p_request => 'REGISTER',
                            p_params  => '##PARAMS##',
                            p_values  => '##VALUES##'
                            )
from dual;




declare
l_result pls_integer;
l_userid pls_integer;
begin

--raise_application_error(-20000, 'Error');

insert into "APEX_USER_REGISTRATION" (apx_username, apx_user_email)
    values (nvl(:P110_USERNAME, :P110_USER_EMAIL), :P110_USER_EMAIL)
    returning apx_user_id into l_userid;
 
    "SEND_MAIL"(  p_mailto => :P110_USER_EMAIL
                , p_result => l_result
                , p_topic  => 'REGISTER'
                , p_app_id => v('APP_ID')
                , p_debug_only => false);
               
    if (l_result = 0) then
        update "APEX_USER_REGISTRATION"
        set apx_user_status_id = (select apx_status_id
                                    from "APX$STATUS"
                                    where apx_status = 'REGISTERED'
                                    and apx_status_ctx_id = (select apx_context_id
                                                             from "APX$CTX"
                                                             where apx_context = 'USER'))
       where apx_user_id = l_userid;
   end if;
   commit;
   apex_util.set_session_state('P0_USER_REG_STATUS', l_userid);
exception when others then
    rollback;
    apex_util.set_session_state('P0_USER_REG_STATUS', '0');
end;
/



create or replace procedure "APX_USER_REGISTRATION" (
     p_mailto                        varchar2
   , p_username                      varchar2        := null
   , p_first_name                    varchar2        := null
   , p_last_name                     varchar2        := null
   , p_params                        clob            := null
   , p_values                        clob            := null
   , p_topic                         varchar2        := null
   , p_userid                        pls_integer     := null
   , p_domain_id                     pls_integer     := null
   , p_token                         varchar2        := null
   , p_from                          varchar2        := null
   , p_app_id                        pls_integer     := v('APP_ID')
   , p_result                        pls_integer     := null
   , p_debug                         boolean         := null
   , p_send_mail                     boolean         := null

)
is
    -- Local Variables
    l_mailto                        varchar2(128);
    l_username                      varchar2(128);
    l_first_name                    varchar2(64);
    l_last_name                     varchar2(64);
    l_params                        varchar2(4000);
    l_values                        varchar2(4000);
    l_topic                         varchar2(64);
    l_userid                        pls_integer;
    l_domain_id                     pls_integer;
    l_token                         varchar2(4000);
    l_from                          varchar2(64);
    l_app_id                        pls_integer;
    l_result                        pls_integer;
    l_debug                         boolean;
    l_send_mail                     boolean;
    l_smtp_server               varchar2(1000);
    l_smtp_port                   varchar2(1000); 
    l_message_id                number;
    l_mail_send_date          date;
    l_mail_send_error         varchar2(4000);
    send_mail_error           exception;

    -- Constants
    C_TOPIC                         constant          varchar2(1000)  := 'REGISTER';
    C_FROM                          constant          varchar2(1000)  := 'arzneimittelfaelschung@bfarm.de';
    C_APP_ID                        constant          pls_integer       := 100000;
    C_RESULT                        constant          pls_integer       := 0;
    C_DEBUG                         constant          boolean            := false;
    C_SEND_MAIL                   constant          boolean            := true;
    C_SMTP_SERVER               constant          varchar2(1000) := 'mail.bfarm.de';
    C_SMTP_PORT                   constant          varchar2(1000) := '25'; 

begin

   -- Setting Locals Defaults
    l_mailto                        := p_mailto;
    l_username                      := p_username;
    l_first_name                    := p_first_name;
    l_last_name                     := p_last_name;
    l_params                        := p_params;
    l_values                        := p_values;
    l_topic                         := nvl(p_topic    , C_TOPIC);
    l_userid                        := p_userid;
    l_domain_id                     := p_domain_id;
    l_token                         := p_token;
    l_from                          := nvl(p_from     , C_FROM);
    l_app_id                        := nvl(p_app_id   , C_APP_ID);
    l_result                        := nvl(p_result   , C_RESULT);
    l_debug                         := nvl(p_debug    , C_DEBUG);
    l_send_mail                     := nvl(p_send_mail, C_SEND_MAIL);

    insert into "APEX_USER_REGISTRATION" (
                                          apx_username
                                        , apx_user_email
                                        , apx_user_first_name
                                        , apx_user_last_name
                                        )
                                 values (
                                          l_username
                                        , l_mailto
                                        , l_first_name
                                        , l_last_name
                                        )
    returning apx_user_id, apx_username, apx_user_token
    into l_userid, l_username, l_token;

    -- send confirmation mail if specified
    if l_send_mail then
    

        "SEND_MAIL" (
            p_result      =>  l_result
          , p_mailto      =>  l_mailto
          , p_username    =>  l_username
          , p_topic       =>  l_topic
          , p_params      =>  l_params
          , p_values      =>  l_values
          , p_app_id      =>  l_app_id
          , p_debug_only  =>  l_debug
        );
        
        dbms_output.put_line('Sending Mail with ID: '||l_message_id||' to '||  l_mailto);
        l_result := 0;

    end if;


    if (l_result = 0) then
        -- set status to registered
        update "APEX_USER_REGISTRATION"
        set apx_user_status_id = (select apex_status_id
                                    from apex_status
                                   where app_id is null
                                     and apex_status_context = 'USER'
                                     and apex_status = 'REGISTERED')
        where apx_user_id = l_userid;

    end if;

    commit;

exception when dup_val_on_index then
dbms_output.put_line('User '|| nvl(l_username, l_mailto) ||' exists!');
rollback;
when others then
rollback;
raise;
end;
/

begin
    "APX_USER_REGISTRATION"('trivadis13@bfarm.de');
    commit;
end;
/

--------------------------------------------------------------------------
--- Apex Mail Log and Queue
create or replace view "APEX_MAIL_QUEUE_LOG"
as
SELECT   nvl(ml.app_id, mq.app_id) as app_id
             , nvl(ml.last_updated_on, mq.last_updated_on) as last_update
             , nvl(ml.mail_id, mq.id) as email_id
             , nvl(ml.mail_to, mq.mail_to) as email_to
             , max(ml.mail_message_created)    as email_created_at
             , max(ml.mail_message_send_end) as email_send_at
             , nvl(max(mq.mail_send_error), '0') as email_send_error
from "APEX_MAIL_LOG" ml full outer join "APEX_MAIL_QUEUE" mq
on (ml.mail_id = mq.id)
group by    mq.mail_send_error
                , nvl(ml.mail_id, mq.id)
                , nvl(ml.mail_to, mq.mail_to)
                , nvl(ml.app_id, mq.app_id)
                , nvl(ml.last_updated_on, mq.last_updated_on)
order by nvl(ml.last_updated_on, mq.last_updated_on);

select * from "APEX_MAIL_LOG";
--------------------------------------------------------------------------
--- Apex Mail Send 2.0
declare
    l_mailto                        varchar2(128) := 'trivadis@bfarm.de' ;
    l_username                   varchar2(128) := 'Trivadis 1';
    l_first_name                  varchar2(64) := 'Tri';
    l_last_name                   varchar2(64) := 'Vadis';
    l_params                       varchar2(4000) := 'USR,TKN';
    l_values                        varchar2(4000) := 'trivadis@bfarm.de, MTk3NTc3ODAwM2JmYXJtLmRlMTc2MDAxNDk0Mw==';
    l_topic                           varchar2(64) := 'REGISTER';
    l_userid                         pls_integer;
    l_domain_id                   pls_integer;
    l_token                          varchar2(4000);
    l_app_id                        pls_integer := 100000;
    l_result                          pls_integer;
    l_debug                         boolean;
    l_send_mail                   boolean := true;
    l_from                           varchar2(128) := 'arzneimittelfaelschung@bfarm.de';
    l_subject                       varchar2(128) := 'Hallo Trivadis';
    l_body                          clob := 'Sie brauchen einen HTML Email Client, um diese Nachricht anzuzeigen' ;
    l_body_html                  clob := '<html><body><p><h2>HiHo Trivadis</h2><br /> Welcome Dude:-)...</p></body></html>'; 
    l_smtp_server               varchar2(1000) := 'mail.bfarm.de';
    l_smtp_port                   varchar2(1000) := '25'; 
    l_message_id                number := null;
    l_mail_send_date          date := null;
    l_mail_send_error         varchar2(4000);
    send_mail_error           exception;
begin
    -- set Apex Environment
    for c1 in (
        select workspace_id
        from apex_applications
        where application_id = l_app_id ) loop
        apex_util.set_security_group_id(p_security_group_id => c1.workspace_id);
    end loop;

    if (      l_mailto         is not null
        and l_from          is not null
        and l_body          is not null
        and l_body_html  is not null
        and l_subject       is not null
        ) then

        l_message_id :=    apex_mail.send (
                p_to               => l_mailto,      -- change to your email address
                p_from           => l_from,        -- change to a real senders email address
                p_body           => l_body,
                p_body_html   => l_body_html,
                p_subj            => l_subject
            );

        dbms_output.put_line('Sending Mail with ID: '||l_message_id||' to '||  l_mailto);
        l_result := 0;

    end if;
        
        apex_mail.push_queue (
            p_smtp_hostname   => l_smtp_server
          , p_smtp_portno        => l_smtp_port
          );
 
        select email_send_error, email_send_at
        into l_mail_send_error, l_mail_send_date
        from  "APEX_MAIL_QUEUE_LOG"
        where email_id =  l_message_id;

        if (l_mail_send_error != '0') then
            raise send_mail_error;
        else
            dbms_output.put_line('SUCCESS: Mail with ID: '||l_message_id||' to '||  l_mailto || ' was delivered at: ' ||l_mail_send_date);
        end if;
        
exception when  send_mail_error then
  dbms_output.put_line('ERROR in Send Mail: ' || l_mail_send_error);
  l_result := -1;
when others then
raise;
end;
/



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- check queries

desc apex_mail;

select email_send_error, email_send_at 
from  "APEX_MAIL_QUEUE_LOG"
where email_id =  37996561446901461; -- 37979184455647000;

SELECT id, nvl(max(mail_send_error), '0') as mail_send_error
from APEX_MAIL_QUEUE
where app_id = 100000
and id = 37979184455647000
group by id;

desc APEX_MAIL_QUEUE;
desc apex_mail_log;

select * from apex_mail_log;


--WHERE nvl(ml.mail_id, mq.id) =  37979184455647000 -- 37996561446901461 --37996561446901461     -- 37996561446901461


declare
l_result   pls_integer;
begin
    send_mail('trivadis@bfarm.de', l_result, p_topic => 'REGISTER', p_debug_local => true, p_app_id => 100000);
end;
/
