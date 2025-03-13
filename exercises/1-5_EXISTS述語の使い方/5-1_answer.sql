-- valがオール1のkeyを選択する。
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
