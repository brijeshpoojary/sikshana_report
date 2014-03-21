copy schools_master_2011_12(district , block , cluster , school_id, school_name , moi , math_minimum_or_above_percentage , kannada_minimum_or_above_percentage , clas , total_students , math_above_average , math_average , math_minimum , math_below_minimum , kannada_above_average , kannada_average , kannada_minimum , kannada_below_minimum) from '/home/brijesh/sikshana_report/report/sql/sikshana_assessment_2011-12_schools.csv' with csv;
update schools_master_2011_12 set district=trim(district), block=trim(block), cluster=trim(cluster), school_name=trim(school_name), moi=trim(moi);
	
insert into district_aggregation_2011_12(name, clas, math_above_average, math_average, math_minimum, math_below_minimum, kannada_above_average, kannada_average, kannada_minimum, kannada_below_minimum, total) select distinct district, clas, sum(math_above_average), sum(math_average), sum(math_minimum), sum(math_below_minimum), sum(kannada_above_average), sum(kannada_average), sum(kannada_minimum), sum(kannada_below_minimum), (sum(math_above_average) + sum(math_average) + sum(math_minimum) + sum(math_below_minimum))
from schools_master_2011_12 group by district, clas;

insert into block_aggregation_2011_12(name, clas, math_above_average, math_average, math_minimum, math_below_minimum, kannada_above_average, kannada_average, kannada_minimum, kannada_below_minimum, total) select distinct block, clas, sum(math_above_average), sum(math_average), sum(math_minimum), sum(math_below_minimum), sum(kannada_above_average), sum(kannada_average), sum(kannada_minimum), sum(kannada_below_minimum), (sum(math_above_average) + sum(math_average) + sum(math_minimum) + sum(math_below_minimum))
from schools_master_2011_12 group by block, clas;

insert into cluster_aggregation_2011_12(name, clas, math_above_average, math_average, math_minimum, math_below_minimum, kannada_above_average, kannada_average, kannada_minimum, kannada_below_minimum, total) select distinct cluster, clas, sum(math_above_average), sum(math_average), sum(math_minimum), sum(math_below_minimum), sum(kannada_above_average), sum(kannada_average), sum(kannada_minimum), sum(kannada_below_minimum), (sum(math_above_average) + sum(math_average) + sum(math_minimum) + sum(math_below_minimum))
from schools_master_2011_12 group by cluster, clas;

insert into school_aggregation_2011_12(name, clas, math_above_average, math_average, math_minimum, math_below_minimum, kannada_above_average, kannada_average, kannada_minimum, kannada_below_minimum, total) select distinct school_name, clas, sum(math_above_average), sum(math_average), sum(math_minimum), sum(math_below_minimum), sum(kannada_above_average), sum(kannada_average), sum(kannada_minimum), sum(kannada_below_minimum), (sum(math_above_average) + sum(math_average) + sum(math_minimum) + sum(math_below_minimum))
from schools_master_2011_12 group by school_name, clas;

insert into state_aggregation_2011_12(name, clas, math_above_average, math_average, math_minimum, math_below_minimum, kannada_above_average, kannada_average, kannada_minimum, kannada_below_minimum, total) select distinct 'all' as name, clas, sum(math_above_average), sum(math_average), sum(math_minimum), sum(math_below_minimum), sum(kannada_above_average), sum(kannada_average), sum(kannada_minimum), sum(kannada_below_minimum), (sum(math_above_average) + sum(math_average) + sum(math_minimum) + sum(math_below_minimum))
from schools_master_2011_12 group by clas;
