create table woodparcels2017joined as (
select * from wood_parcels_2017 i
join wood_parcel_codes_2017 j
on i.mclassific = j.code_str

	)