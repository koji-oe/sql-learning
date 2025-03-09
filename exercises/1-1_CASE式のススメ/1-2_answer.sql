-- 表頭に合計や再掲の列を持つクロス表を作成する。
select
    case sex
        when 1 then '男'
        else '女'
    end as "性別"
    ,sum(population) as "全国" 
    , sum(case
        when pref_name = '徳島' then population
        else 0
        end) as "徳島"
    , sum(case
        when pref_name = '香川' then population
        else 0
        end) as "香川"
    , sum(case
        when pref_name = '愛媛' then population
        else 0
        end) as "愛媛"
    , sum(case
        when pref_name = '高知' then population
        else 0
        end) as "高知"
    , sum(case
        when pref_name in ('徳島', '香川', '愛媛', '高知') then population
        else 0
        end) as "四国(再掲)"
from
    pop_tbl2 
group by
    sex;
