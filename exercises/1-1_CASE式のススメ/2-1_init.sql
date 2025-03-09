drop table if exists server_load_sample; 

create table server_load_sample( 
    server varchar
    , sample_date date
    , load_val integer
    , primary key (server, sample_date)
); 

insert 
into server_load_sample 
values ('A', '2018-02-01', 1024)
, ('A', '2018-02-02', 2366)
, ('A', '2018-02-05', 2366)
, ('A', '2018-02-07', 985)
, ('A', '2018-02-08', 780)
, ('A', '2018-02-12', 1000)
, ('B', '2018-02-01', 54)
, ('B', '2018-02-02', 39008)
, ('B', '2018-02-03', 2900)
, ('B', '2018-02-04', 556)
, ('B', '2018-02-05', 12600)
, ('B', '2018-02-06', 7309)
, ('C', '2018-02-01', 1000)
, ('C', '2018-02-07', 2000)
, ('C', '2018-02-16', 500);
