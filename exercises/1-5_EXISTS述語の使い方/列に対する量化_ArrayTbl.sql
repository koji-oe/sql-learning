drop table if exists array_tbl;

create table array_tbl( 
    key varchar primary key
    , col1 integer
    , col2 integer
    , col3 integer
    , col4 integer
    , col5 integer
    , col6 integer
    , col7 integer
    , col8 integer
    , col9 integer
    , col10 integer
);

insert into array_tbl (key) values ('A');
insert into array_tbl (key, col1) values ('B', 3);
insert into array_tbl values ('C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into array_tbl (key, col3) values ('D', 9);
insert into array_tbl (key, col2, col4, col5, col8) values ('E', 3,1,9,9);
select * from array_tbl;

-- すべての列がである
select * from array_tbl
where 1 = all (array[
    col1
    , col2
    , col3
    , col4
    , col5
    , col6
    , col7
    , col8
    , col9
    , col10
]);

-- 少なくとも1つは9である
select * from array_tbl
where 9 = any (array[
    col1
    , col2
    , col3
    , col4
    , col5
    , col6
    , col7
    , col8
    , col9
    , col10
]);

-- 全てnullである
select * from array_tbl
where coalesce(
    col1
    , col2
    , col3
    , col4
    , col5
    , col6
    , col7
    , col8
    , col9
    , col10
) is null;