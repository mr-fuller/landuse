create table lucasparcels2017joined as (
select * from lucasparcels2017 i
join areis_general_2017 j
on i.assessor_num = j."AssrNo"
join areis_class_lookup_2017 k
on j."Landuse" = k."CLASS_LANDUSE"
	)