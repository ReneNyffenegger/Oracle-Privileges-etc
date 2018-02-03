select
  substrb(grantee     , 1, 10) grantee,
  substrb(granted_role, 1, 10) granted_role,
  admin_option
from
  dba_role_privs
where
  grantee      like 'USR\_%' escape '\' or
  grantee      like 'ROL\_%' escape '\' or
  granted_role like 'ROL\_%' escape '\';
