drop table if exists array_tbl2; 

create table array_tbl2( 
    key varchar
    , i integer
    , val integer
    , primary key (key, i)
);

insert into array_tbl2 values
('A', 1, null)
,('A', 2, null)
,('A', 3, null)
,('A', 4, null)
,('A', 5, null)
,('A', 6, null)
,('A', 7, null)
,('A', 8, null)
,('A', 9, null)
,('A', 10, null)
,('B', 1, 3)
,('B', 2, null)
,('B', 3, null)
,('B', 4, null)
,('B', 5, null)
,('B', 6, null)
,('B', 7, null)
,('B', 8, null)
,('B', 9, null)
,('B', 10, null)
,('C', 1, 1)
,('C', 2, 1)
,('C', 3, 1)
,('C', 4, 1)
,('C', 5, 1)
,('C', 6, 1)
,('C', 7, 1)
,('C', 8, 1)
,('C', 9, 1)
,('C', 10, 1);