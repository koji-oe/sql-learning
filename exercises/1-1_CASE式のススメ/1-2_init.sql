drop table if exists pop_tbl2; 

create table pop_tbl2( 
    pref_name varchar
    , sex integer
    , population integer
    , primary key (pref_name, sex)
); 

insert 
into pop_tbl2 
values ('徳島', 1, 60)
, ('徳島', 2, 40)
, ('香川', 1, 100)
, ('香川', 2, 100)
, ('愛媛', 1, 100)
, ('愛媛', 2, 50)
, ('高知', 1, 100)
, ('高知', 2, 100)
, ('福岡', 1, 100)
, ('福岡', 2, 200)
, ('佐賀', 1, 20)
, ('佐賀', 2, 80)
, ('長崎', 1, 125)
, ('長崎', 2, 125)
, ('東京', 1, 250)
, ('東京', 2, 150);
