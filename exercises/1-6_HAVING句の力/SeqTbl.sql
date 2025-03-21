drop table if exists seq_tbl; 

create table seq_tbl(seq integer primary key, name varchar); 

insert 
into seq_tbl 
values (1, 'ディック')
, (2, 'アン')
, (3, 'ライル')
, (5, 'カー')
, (6, 'マリー')
, (8, 'ベン'); 

-- 歯抜けがあるか
select
    '歯抜けあり' as gap 
from
    seq_tbl 
having
    count(*) <> max(seq); 

-- 歯抜けの最小値は？(開始値1が存在する前提)
select
    min(seq + 1) as gap 
from
    seq_tbl 
where
    (seq + 1) not in (select seq from seq_tbl);

-- 歯抜けの最小値は？(開始値1が存在しない場合を考慮)
select
    case
        when count(*) = 0 or min(seq) > 1 then 1
        else (
            select min(s1.seq + 1)
            from seq_tbl s1
            where not exists (
                select *
                from seq_tbl s2
                where s2.seq = s1.seq + 1
            )
        )
        end 
from seq_tbl;
