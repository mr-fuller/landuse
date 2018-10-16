--classify lucas county data from 2012



--Classify data from 2017
--select * from lucasparcels limit 10;
--show data_directory;
--select * from areis_class_lookup;
alter table areis_class_lookup_2017 add column if not exists mapclass varchar;
--alter table areis_class_lookup_2017 add column if not exists class_landuse_int;
--update areis_class_lookup_2017 set class_landuse_int= CAST("CLASS_LANDUSE" as int)
update  areis_class_lookup_2017 set mapclass='Park, Open Space, or Golf Course' where CAST("CLASS_LANDUSE" as int) in (463,660);
update  areis_class_lookup_2017 set mapclass='Single-Family Residential' where CAST("CLASS_LANDUSE" as int) between 510 and 515;
update  areis_class_lookup_2017 set mapclass='Multi-Family Residential' where CAST("CLASS_LANDUSE" as int) between 520 and 550 or CAST("CLASS_LANDUSE" as int) between 401 and 403;
update  areis_class_lookup_2017 set mapclass='Agricultural' where CAST("CLASS_LANDUSE" as int) between 100 and 199;
update  areis_class_lookup_2017 set mapclass='Commercial' where CAST("CLASS_LANDUSE" as int) in (400,464,465) or CAST("CLASS_LANDUSE" as int) between 410 and 462 or cast("CLASS_LANDUSE" as int) between 490 and 499;
update  areis_class_lookup_2017 set mapclass='Industrial' where cast("CLASS_LANDUSE" as int) between 300 and 399 or cast("CLASS_LANDUSE"as int) in (480,482) ;
update  areis_class_lookup_2017 set mapclass='Cemetery, Charity, or Church' where cast("CLASS_LANDUSE" as int) between 680 and 690;
update  areis_class_lookup_2017 set mapclass='Government' where cast("CLASS_LANDUSE" as int) between 600 and 640;
update  areis_class_lookup_2017 set mapclass='Education' where cast("CLASS_LANDUSE" as int) in (670,650) ;
update  areis_class_lookup_2017 set mapclass='Transportation, Communication, and Utility' where cast("CLASS_LANDUSE" as int) between 840 and 870 or cast("CLASS_LANDUSE" as int) between 210 and 260;
--update table areis_class_lookup set mapclass='Vacant' where class_landuse between 500 and 505 or class_landuse in (100,300,400);
--update table areis_class_lookup set mapclass='Parking Lots' where class_landuse=456;

--calculate the square footage of each land use type in(this assumes you loaded data in EPSG 3734, which might not fly for MI data)
with area_2012 as( 
select desc2, sum(ST_Area(geom)) as sqft_2012
from lucasparcels2012
group by desc2),

joined_2017 as(
select --*,
d."Landuse", 
mapclass, 
wkb_geometry
from lucasparcels2017 b
	join areis_general_2017 d
	on assessor_num = d."AssrNo"
	join areis_class_lookup_2017 q
	on "Landuse" = q."CLASS_LANDUSE"
)

--calculate the square footage of each land use type for Lucas county 2017 data (some
select mapclass, sum(ST_Area(wkb_geometry)) as square_feet_2017
from joined_2017
--join area_2012 as b
--on mapclass = desc2
group by mapclass;

--join 2012 and 2017 data into one table