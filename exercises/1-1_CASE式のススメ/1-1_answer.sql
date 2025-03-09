-- x,y列のうち最大のものをgreatest列として抽出する
select
    key,
    case
        when x < y then y
        else x
    end
from
    greatests
order by key;

-- x,y,z列のうち最大のものをgreatest列として抽出する
select
    key,
    max(greatest)
from
    (
        select key, x as greatest from greatests
        union all
        select key, y as greatest from greatests
        union all
        select key, z as greatest from greatests
    ) as aggreated
group by key
order by key;
