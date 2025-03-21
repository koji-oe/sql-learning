drop table if exists items; 

create table items(item varchar primary key); 

insert 
into items 
values ('ビール')
, ('紙オムツ')
, ('自転車'); 

drop table if exists shop_items; 

create table shop_items(shop varchar, item varchar); 

insert 
into shop_items 
values ('仙台', 'ビール')
, ('仙台', '紙オムツ')
, ('仙台', '自転車')
, ('仙台', 'カーテン')
, ('東京', 'ビール')
, ('東京', '紙オムツ')
, ('東京', '自転車')
, ('大阪', 'テレビ')
, ('大阪', '紙オムツ')
, ('大阪', '自転車'); 

-- Itemsの全商品を揃えている店舗を選択する。
select
    shop 
from
    shop_items si 
    inner join items i 
        on si.item = i.item 
group by
    shop 
having
    count(*) = (select count(*) from items); 

-- カーテンを除き、Itemsの全商品を揃えている店舗を選択する。
select
    shop 
from
    shop_items si 
    left outer join items i 
        on si.item = i.item 
group by
    shop 
having
    count(si.item) = (select count(*) from items) 
    and count(i.item) = (select count(*) from items)
