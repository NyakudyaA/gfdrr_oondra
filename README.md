# gfdrr_oondra
GFDRR Challenge Online Operational Natural Disaster Risk Assessment platform

# Instructions

Git clone the geonode repository into deployment `git clone git@github.com:GeoNode/geonode.git` and rename the repository as docker-geonode

Copy the Dockerfile , build and 71-apt-cacher-ng.template file at the base of deployment into  docker-geonode .

Build the geonode image by running the build script in docker-geonode.

Use docker-compose to build and start the containers.

## Uploading data to geoserver

* create a geotiff coverage store

 `curl -u admin:babyrasta -v -XPOST -H 'Content-Type: application/xml' -d '<coverageStore><name>int_dec</name><workspace>geonode</workspace> <enabled>true</enabled><type>GeoTIFF</type></coverageStore>' http://127.0.0.1:8080/geoserver/rest/workspaces/geonode/coveragestores`


* upload the file into coverage store

    `curl -u admin:babyrasta -v -XPUT -H 'Content-type: text/plain' -d 'file:/geonode/geoserver/data/data/geonode/eritrea/ERI10v3.tif' http://127.0.0.1:8080/geoserver/rest/workspaces/geonode/coveragestores/int_dec/external.geotiff?configure=first\&coverageName=int_dec`

 For more instructions about uploading data into geoserver read (http://docs.geoserver.org/stable/en/user/rest/api/)



