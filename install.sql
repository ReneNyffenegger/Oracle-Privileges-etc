-- ROLE_TAB_PRIVS   


@cleanup

connect sys/1_amRoot as sysdba
-- {

create user usr_01 identified by pw;
create user usr_02 identified by pw;
create user usr_03 identified by pw;

create role rol_01;
create role rol_02;
create role rol_03;

grant
  create     session,
  create     table,
  create     role
to
  usr_01;

grant
  create any table  ,
  connect           , /* This is a role */
  resource          , /* This is a role */
  create     procedure
to
  usr_02;

grant
  rol_02
to
  usr_01 with admin option;

grant
  create     session,
  create     table,
  create     view
to
  usr_03;

grant
  create type
to
  usr_03 with admin option;

grant
  connect,
  resource,
  purge dba_recyclebin
to
  rol_02;

grant
  rol_02
to
  rol_03;

-- }

connect usr_01/pw
-- {

create table tb_01_001 (col number);
create table tb_01_002 (col number);
create table tb_01_003 (col number);
create table tb_01_004 (col number);

grant select                 on tb_01_001 to usr_03;
grant select, update, insert on tb_01_002 to usr_03;
grant all                    on tb_01_003 to usr_03;


grant select, update on tb_01_004 to rol_02;
grant rol_02 to usr_03;

-- }

connect usr_02/pw
-- {
create table tb_02_001 (col number);
create table tb_02_002 (col number);
create table tb_02_003 (col number);

create procedure pc_02_001 as begin null; end;
/

grant  execute on pc_02_001 to usr_03;

-- }

connect usr_03/pw
-- {

create table tb_03_001 (col number);
create table tb_03_002 (col number);
create table tb_03_003 (col number);

create view vw_03_001 as select * from usr_01.tb_01_001;
create view vw_03_002 as select * from usr_01.tb_01_002;
create view vw_03_003 as select * from usr_01.tb_01_003;

-- }

connect sys/1_amRoot as sysdba


@ dba_roles
@ dba_tab_privs
@ dba_sys_privs
@ dba_role_privs
@ dba_connect_role_grantees
@ dba_code_role_privs

@ role_role_privs
@ role_sys_privs

-- TODO
-- @ session_privs

exit;
