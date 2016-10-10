create table subway(
  STATION_CD varchar2(10) primary key,
  STATION_NM varchar2 (30) not null,
  LINE_NUM varchar2 (6) not null,
  FR_CODE varchar2(10) not null
);