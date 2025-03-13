drop table if exists projects; 

create table projects( 
    project_id varchar
    , step_nbr integer
    , status varchar
    , primary key (project_id, step_nbr)
); 
comment on column projects.project_id is 'プロジェクトID';
comment on column projects.step_nbr is '工程番号';
comment on column projects.status is '状態';

insert 
into projects 
values ('AA100', 0, '完了')
, ('AA100', 1, '待機')
, ('AA100', 2, '待機')
, ('B200', 0, '待機')
, ('B200', 1, '待機')
, ('CS300', 0, '完了')
, ('CS300', 1, '完了')
, ('CS300', 2, '待機')
, ('CS300', 3, '待機')
, ('DY400', 0, '完了')
, ('DY400', 1, '完了')
, ('DY400', 2, '完了');

-- 1番の工程まで完了しているプロジェクトを選択
select
    project_id 
from
    projects 
group by
    project_id 
having
    count(*) = sum( 
        case 
            when step_nbr <= 1and status = '完了' then 1 
            when step_nbr > 1 and status = '待機' then 1 
            else 0 
            end
    );

-- 全称問題とするなら
-- プロジェクトのレコードが全て、工程番号が1以下なら完了、1を超過すれば待機となること
select
    *
from
    projects p1
where
    not exists (
    select *
    from projects p2
    where p1.project_id= p2.project_id
        and p2.status <> case
            when step_nbr <= 1 then '完了'
            else '待機'
            end
)
order by
    project_id, step_nbr;

-- existsを使うメリットは以下があげられる
-- ・パフォーマンスが良い
-- ・group byと違い、全カラムを結果に含められる
