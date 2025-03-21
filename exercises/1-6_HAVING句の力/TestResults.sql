drop table if exists test_results; 

create table test_results( 
    student_id varchar primary key
    , class varchar
    , sex varchar
    , score integer
); 

insert 
into test_results 
values ('001', 'A', '男', 100)
, ('002', 'A', '女', 100)
, ('003', 'A', '女', 49)
, ('004', 'A', '男', 30)
, ('005', 'B', '女', 100)
, ('006', 'B', '男', 92)
, ('007', 'B', '男', 80)
, ('008', 'B', '男', 80)
, ('009', 'B', '女', 10)
, ('010', 'C', '男', 92)
, ('011', 'C', '男', 80)
, ('012', 'C', '女', 21)
, ('013', 'D', '女', 100)
, ('014', 'D', '女', 0)
, ('015', 'D', '女', 0); 

-- クラスの75%以上の生徒が80点以上のクラスを選択せよ。
select
    class 
from
    test_results 
group by
    class 
having
    count(*) * 0.75 <= sum(case when score >= 80 then 1 else 0 end); 

-- 50点以上を取った生徒のうち、男子の数が女子の数より多いクラスを選択せよ。
select
    class 
from
    test_results 
group by
    class 
having
    sum( 
        case 
            when score >= 50 
            and sex = '男' 
                then 1 
            else 0 
            end
    ) > sum( 
        case 
            when score >= 50 
            and sex = '女' 
                then 1 
            else 0 
            end
    ); 

-- 女子の平均点が、男子の平均点より高いクラスを選択せよ。
select
    class 
from
    test_results 
group by
    class 
having
    avg(case when sex = '女' then score else null end) > avg(case when sex = '男' then score else null end)
;
