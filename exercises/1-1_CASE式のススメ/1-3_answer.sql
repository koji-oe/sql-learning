-- GreatestsテーブルのkeyをBADC順で並べ替える
select
    key
    , case 
        when key = 'A' 
            then 2 
        when key = 'B' 
            then 1 
        when key = 'C' 
            then 4 
        when key = 'D' 
            then 3 
        else 0 
        end as sort 
from
    greatests 
order by
    sort;
