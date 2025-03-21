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

-- オール1を選択する。
select distinct
    ary1.key 
from
    array_tbl2 ary1 
where
    not exists ( 
        select
            * 
        from
            array_tbl2 ary2 
        where
            ary1.key = ary2.key 
            and (val <> 1 or val is null) 
    );

-- 1から100までの素数を選択する。
with numbers as (select generate_series(1, 100, 1) as number) 
select
    number 
from
    numbers devided 
where
    devided.number <> 1 
    and not exists ( 
        select
            * 
        from
            numbers devider 
        where
            devider.number <> devided.number 
            and devider.number <> 1 
            and mod(devided.number, devider.number) = 0
    );
