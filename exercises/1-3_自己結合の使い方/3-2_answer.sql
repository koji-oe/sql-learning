-- ウィンドウ関数で重複削除組合せを抽出
select
    name
    , price 
from
    -- 行番号付き商品
    ( 
        select
            row_number() over (partition by name, price order by name) as row_num
            , name
            , price 
        from
            products
    ) as products_with_row 
where
    row_num = 1;
