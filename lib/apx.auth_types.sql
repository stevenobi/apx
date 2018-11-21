select case AUTHENTICATION_SCHEME_TYPE 
       when 'Application Express Accounts'
       then 'APEX'
       when 'Custom Authentication'
       then 'benutzerdefinierte'
       when 'Database Accounts'
       then 'Datenbank'
       when 'HTTP Header Variable'
       then 'HTTP Header Variable'
       when 'LDAP Directory Verification'
       then 'LDAP'
       when 'No Authentication (using DAD)'
       then 'DAD'
       when 'Open Door Credentials'
       then 'Open Door Credentials'
       when 'Oracle Application Server Single Sign-On Server'
       then 'Oracle Application Server Single Sign-On Server'
       else 'die kommunizierten'
       end as AUTH_TYPE
from apex_applications
where application_id = v('APP_ID');



