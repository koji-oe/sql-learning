drop table if exists teams; 

create table teams(member varchar, team_id integer, status varchar); 

insert 
into teams 
values ('ジョー', 1, '待機')
, ('ケン', 1, '出動中')
, ('ミック', 1, '待機')
, ('カレン', 2, '出動中')
, ('キース', 2, '休暇')
, ('ジャン', 3, '待機')
, ('ハート', 3, '待機')
, ('ディック', 3, '待機')
, ('ベス', 4, '待機')
, ('アレン', 5, '出動中')
, ('ロバート', 5, '休暇')
, ('ケーガン', 5, '待機'); 

-- すべてのメンバーが待機中であるチームを選択せよ。(exists)
select
    team_id
    , member 
from
    teams t1 
where
    not exists ( 
        select
            * 
        from
            teams t2 
        where
            t1.team_id = t2.team_id 
            and t2.status <> '待機'
    ); 

-- すべてのメンバーが待機中であるチームを選択せよ。(having)
select
    team_id 
from
    teams 
group by
    team_id 
having
    count(*) = sum(case when status = '待機' then 1 else 0 end);
