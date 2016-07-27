PROJECT_ID := gfdrr_oondra

SHELL := /bin/bash

# ----------------------------------------------------------------------------
#    P R O D U C T I O N     C O M M A N D S
# ----------------------------------------------------------------------------
default: web
run: build permissions web

deploy: run
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Bringing up fresh instance "
	@echo "You can access it on http://0.0.0.0:8111"
	@echo "------------------------------------------------------------------"

build:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Building in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) build geonode

web:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) up -d geonode
	@# Dont confuse this with the dbbackup make command below
	@# This one runs the postgis-backup cron container
	@# We add --no-recreate so that it does not destroy & recreate the db container
	

permissions:
	# Probably we want something more granular here....
	# Your sudo password will be needed to set the file permissions
	# on logs, media, static and pg dirs
	@if [ ! -d "logs" ]; then mkdir logs; fi
	@if [ ! -d "pg" ]; then mkdir pg; fi
	@if [ ! -d "geoserver_data" ]; then mkdir geoserver_data; fi
	@if [ ! -d "backups" ]; then mkdir backups; fi
	@if [ -d "logs" ]; then sudo chmod -R a+rwx logs; fi
	@if [ -d "geoserver_data" ]; then sudo chmod -R a+rwx geoserver_data; fi
	@if [ -d "pg" ]; then sudo chmod -R a+rwx pg; fi
	@if [ -d "backups" ]; then sudo chmod -R a+rwx backups; fi

db:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running db in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) up -d db


kill:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Killing in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) kill



dblogs:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Showing db logs in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) logs db



dbshell:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Shelling in in production database"
	@echo "------------------------------------------------------------------"
	@docker exec -t -i $(PROJECT_ID)-db psql -U docker -h localhost gis

