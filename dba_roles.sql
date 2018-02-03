select
  substrc(role, 1, 30) role
from
  dba_roles
where
  role like 'ROL\_%' escape '\';
