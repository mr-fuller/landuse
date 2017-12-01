--select * from lucasparcels limit 10;
--show data_directory;
--select * from areis_class_lookup;
alter table areis_class_lookup add column mapclass varchar;
update table areis_class_lookup set mapclass='Park, Open Space, or Golf Course' where class_landuse in (463,660)
update table areis_class_lookup set mapclass='Single-Family Residential' where class_landuse between 510 and 515;
update table areis_class_lookup set mapclass='Multi-Family Residential' where class_landuse between 520 and 550 of class_landuse between 401 and 403;
update table areis_class_lookup set mapclass='Agricultural' where class_landuse between 100 and 199;
update table areis_class_lookup set mapclass='Commercial' where class_landuse in (400,464,465) or class_landuse between 410 and 462 or class_landuse between 490 and 499;
update table areis_class_lookup set mapclass='Industrial' where class_landuse between 300 and 399 or class_landuse in (480,482) ;
update table areis_class_lookup set mapclass='Cemetery, Charity, or Church' where class_landuse between 680 and 690;
update table areis_class_lookup set mapclass='Government' where class_landuse between 600 and 640;
update table areis_class_lookup set mapclass='Education' where class_landuse in (670,650) ;
update table areis_class_lookup set mapclass='Transportation, Communication, and Utility' where class_landuse between 840 and 870 or class_landuse between 210 and 260;
update table areis_class_lookup set mapclass='Vacant' where class_landuse between 500 and 505 or class_landuse in (100,300,400);
update table areis_class_lookup set mapclass='Parking Lots' where class_landuse=456;