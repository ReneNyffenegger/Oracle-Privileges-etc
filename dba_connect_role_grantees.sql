select
  substrb(grantee                   , 1, 10) grantee,
  substrb(path_of_connect_role_grant, 1, 30) path_of_connect_role_grant
from
  dba_connect_role_grantees
where
  grantee      like 'USR\_%' escape '\'
order by
  grantee;
