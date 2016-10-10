create table tuser(
  user_id varchar2(20) primary key,
  pass varchar2 (20) not null,
  user_name varchar2 (10) not null,
  nickname varchar2(20) not null,
  email varchar2(50) not null,
  phone_num varchar2 (20) not null
);