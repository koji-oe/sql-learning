drop table if exists students; 

create table students( 
    student_id integer primary key
    , dpt varchar
    , sbmt_date date
); 

insert 
into students 
values (100, '理学部', '2018-10-10')
, (101, '理学部', '2018-09-22')
, (102, '文学部', null)
, (103, '文学部', '2018-09-10')
, (200, '文学部', '2018-09-22')
, (201, '工学部', null)
, (202, '経済学部', '2018-09-25');

comment on column students.student_id is '学生ID';
comment on column students.dpt is '学部';
comment on column students.sbmt_date is '提出日';

-- 学部生が全員提出済みの学部を選択する。
select
    dpt 
from
    students 
group by
    dpt 
having
    count(*) = count(sbmt_date);
