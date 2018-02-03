select
  substrb(role       , 1, 10) role,
  substrb(owner      , 1, 10) owner,
  substrb(table_name , 1, 10) object_name,
  substrb(column_name, 1, 10) column_name,
  substrb(privilege  , 1, 20) privilege,
  substrb(grantable  , 1,  3) common,
  substrb(common     , 1, 10) common,
  substrb(inherited  , 1, 10) inherited
from
  role_tab_privs
where
  role      like 'USR\_%' escape '\' or
  role      like 'ROL\_%' escape '\'
order by
  role,
  table_name
;
