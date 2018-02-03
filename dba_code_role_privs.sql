select
  substrb(owner      , 1, 15) owner,
  substrb(object_name, 1, 15) object_name,
  substrb(role       , 1, 15) role
from
  dba_code_role_privs
where
  role  like 'ROL\_%' escape '\' or
  owner like 'USR\_%' escape '\';
  
