select
  substrb(grantee     , 1, 15) grantee,
  substrb(privilege   , 1, 22) privilege,
  substrb(admin_option, 1, 15) admin_option,
  substrb(common      , 1,  6) common,
  substrb(inherited   , 1,  9) inherited
from
  dba_sys_privs
where
  grantee like 'USR\_%' escape '\' or  -- grantee can either be a user or
  grantee like 'ROL\_%' escape '\'     -- a role
order by
  grantee,
  privilege;
