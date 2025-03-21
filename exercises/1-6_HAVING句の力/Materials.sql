drop table if exists materials; 

create table materials( 
    center varchar
    , receive_date date
    , material varchar
); 

insert 
into materials 
values ('東京', '2018-04-01', '錫')
, ('東京', '2018-04-12', '亜鉛')
, ('東京', '2018-05-17', 'アルミニウム')
, ('東京', '2018-05-20', '亜鉛')
, ('大阪', '2018-04-20', '銅')
, ('大阪', '2018-04-22', 'ニッケル')
, ('大阪', '2018-04-29', '鉛')
, ('名古屋', '2018-03-15', 'チタン')
, ('名古屋', '2018-04-01', '炭素鋼')
, ('名古屋', '2018-04-24', '炭素鋼')
, ('名古屋', '2018-05-02', 'マグネシウム')
, ('名古屋', '2018-05-10', 'チタン')
, ('福岡', '2018-05-10', '亜鉛')
, ('福岡', '2018-05-28', '錫'); 

-- 素材にダブりのある拠点を選択せよ。
select
    center 
from
    materials m1 
group by
    center 
having
    count(*) <> count(distinct material);
