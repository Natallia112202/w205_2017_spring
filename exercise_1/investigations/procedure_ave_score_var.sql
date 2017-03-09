select measure_name, cast(STDDEV(rating) as decimal(5,2)) std_rating, cast(avg(rating) as decimal(5,2)) ave_rating from proced_var group by measure_name order by (std_rating*100/ave_rating) DESC;

