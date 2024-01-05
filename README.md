# landuse
SQL related to some land use maps for the TMACOG region made in postgres and qgis using parcel data from the Lucas, Monroe, and Wood County Auditor's offices. The sql files show how the detailed land use codes were generalized into broader categories when preparing the map.

## To acquire data for Lucas County:

- Create an account [here](http://co.lucas.oh.us/2730/File-Downloads)


- Sign in, then choose Real Estate, then GIS in the drop down boxes.  You will download LucasCounty.gdb, which contains the <i>Parcels</i>  feature class.

- Download the land use codes in the AREIS Access Database. Choose AREIS Data from the second drop down box (Real Estate in the first box). The GENERAL table has the land use codes in it.  You will use the field ASSESSOR NUMBER (or assessor_num or AssrNo) to link that table to the GIS parcel layer.

## For Wood County:

- The Wood County parcel layer and land use codes were requested using the contact form on the Wood County Auditor Website. Join on <i>mclassific</i> field in the parcel layer and <i>code</i> field in the land use code table.
- <b>TO DO:</b> Figure out where I got said land use code table.

