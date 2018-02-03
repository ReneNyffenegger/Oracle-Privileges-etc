select
  substrb(role        , 1, 10) role,
  substrb(privilege   , 1, 20) privilege,
  substrb(admin_option, 1, 10) admin_option,
  substrb(common      , 1,  3) common,
  substrb(inherited   , 1,  3) inherited
from
  role_sys_privs
where
  role          like 'USR\_%' escape '\' or
  role          like 'ROL\_%' escape '\'
order by
  role;
