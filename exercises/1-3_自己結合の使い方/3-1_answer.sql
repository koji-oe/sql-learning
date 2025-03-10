-- nameについて、2列の重複組み合わせを求める。
select
    product1.name as name_1
    , product2.name as name_2 
from
    products product1 
    inner join products product2 
        on product1.name >= product2.name;
