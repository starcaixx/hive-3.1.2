set hive.mapred.mode=nonstrict;
create table src5_n2 (key string, value string);
load data local inpath '../../data/files/kv5.txt' into table src5_n2;
load data local inpath '../../data/files/kv5.txt' into table src5_n2;

set mapred.reduce.tasks = 4;
set hive.optimize.sampling.orderby=true;
set hive.optimize.sampling.orderby.percent=0.66f;

explain
create table total_ordered as select * from src5_n2 order by key, value;
create table total_ordered as select * from src5_n2 order by key, value;

desc formatted total_ordered;
select * from total_ordered;

set hive.optimize.sampling.orderby.percent=0.0001f;
-- rolling back to single task in case that the number of sample is not enough

drop table total_ordered;
create table total_ordered as select * from src5_n2 order by key, value;

desc formatted total_ordered;
select * from total_ordered;
