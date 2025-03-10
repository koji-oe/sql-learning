select
    server
    , sample_date
    , sum(load_val) over () as sum_load 
from
    server_load_sample;
