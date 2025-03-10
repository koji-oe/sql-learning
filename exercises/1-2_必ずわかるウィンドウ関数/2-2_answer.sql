select
    server
    , sample_date
    , sum(load_val) over (partition by server) as sum_load 
from
    server_load_sample;
