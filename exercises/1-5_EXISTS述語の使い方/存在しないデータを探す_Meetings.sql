drop table if exists meetings; 

create table meetings(meeting varchar, person varchar); 

insert 
into meetings 
values ('第1回', '伊藤')
, ('第1回', '水島')
, ('第1回', '坂東')
, ('第2回', '伊藤')
, ('第2回', '宮田')
, ('第3回', '坂東')
, ('第3回', '水島')
, ('第3回', '宮田'); 

-- 全員が皆勤した場合の組合せ
select distinct
    m1.meeting
    , m2.person 
from
    meetings m1 
    cross join meetings m2 
order by
    meeting
    , person; 

-- 欠席者の一覧
select distinct
    m1.meeting
    , m2.person 
from
    meetings m1 
    cross join meetings m2 
where
    not exists ( 
        select
            * 
        from
            meetings m3 
        where
            m1.meeting = m3.meeting 
            and m2.person = m3.person
    ) 
order by
    meeting
    , person;
