drop table if exists test_scores; 

create table test_scores( 
    student_id integer
    , subject varchar
    , score integer
); 

insert 
into test_scores 
values (100, '算数', 100)
, (100, '国語', 80)
, (100, '理科', 80)
, (200, '算数', 80)
, (200, '国語', 95)
, (300, '算数', 40)
, (300, '国語', 90)
, (300, '社会', 55)
, (400, '算数', 80); 

-- 全ての教科について50点以上を取っている生徒
-- →言い換えると50点未満である教科が1つも存在しない生徒
select distinct
    student_id 
from
    test_scores t1 
where
    not exists ( 
        select
            * 
        from
            test_scores t2 
        where
            t2.student_id = t1.student_id 
            and t2.score < 50
    ) 
order by
    student_id;

-- 算数の点数が80点以上かつ国語の点数が50点以上
select distinct
    student_id 
from
    test_scores t1 
where
    not exists ( 
        select *  from test_scores t2 
        where
            t2.student_id = t1.student_id 
            and 1 = case
                    when subject = '算数' and score < 80 then 1
                    when subject = '国語' and score < 50 then 1
                    else 0
                end
    ) 
order by
    student_id;
    
-- 上記に、国語と算数の行が必ず存在するという条件を追加する
select
    student_id  -- group byで集約しているためdistinctは不要となる
from
    test_scores t1 
where
    not exists ( 
        select *  from test_scores t2 
        where
            t2.student_id = t1.student_id 
            and 1 = case
                    when subject = '算数' and score < 80 then 1
                    when subject = '国語' and score < 50 then 1
                    else 0
                end
    ) 
group by
    student_id
having count(*) >= 2
order by
    student_id;