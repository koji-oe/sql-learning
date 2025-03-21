drop table if exists graduates; 

create table graduates(name varchar, income integer); 

insert 
into graduates 
values ('サンプソン', 400000)
, ('マイク', 30000)
, ('ホワイト', 20000)
, ('アーノルド', 20000)
, ('スミス', 20000)
, ('ロレンス', 15000)
, ('ハドソン', 15000)
, ('ケント', 10000)
, ('ベッカー', 10000)
, ('スコット', 10000); 

-- 最頻値を選択する。
select
    income
    , count(*) 
from
    graduates 
group by
    income 
having
    count(*) >= All (select count(*) from graduates group by income);
