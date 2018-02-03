select
  substrb(grantee   , 1, 10) grantee,
  substrb(grantor   , 1, 10) grantor,
  substrb(owner     , 1, 10) owner,
  substrb(table_name, 1, 10) object_name, -- object_name because packages etc. are also registered here.
  substrb(privilege , 1, 10) privilege,
  substrb(hierarchy , 1, 10) hierarchy,
  substrb(common    , 1, 10) common,
  substrb(type      , 1, 10) type,
  substrb(inherited , 1, 10) inherited
from
  dba_tab_privs
where
  grantee      like 'USR\_%' escape '\' or
  grantee      like 'ROL\_%' escape '\'
order by
  grantee,
  table_name,
  privilege;
