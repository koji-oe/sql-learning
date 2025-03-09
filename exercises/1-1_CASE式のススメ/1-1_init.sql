-- 1-① 複数列の最大値
drop table if exists greatests; 

create table greatests( 
    key varchar (1) primary key
    , x integer
    , y integer
    , z integer
); 

insert 
into greatests 
values ('A', 1, 2, 3)
, ('B', 5, 5, 2)
, ('C', 4, 7, 1)
, ('D', 3, 3, 8);
