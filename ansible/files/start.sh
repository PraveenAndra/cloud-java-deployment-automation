#!/bin/bash

JAR_FILE=/home/praveenandra/spring-petclinic-3.3.0-SNAPSHOT.jar
APP_PROPERTIES=/opt/application.properties
PROPERTIES_SCRIPT=/home/praveenandra/properties.py

sudo python3 ${PROPERTIES_SCRIPT}

sudo java -jar "${JAR_FILE}" --spring.config.location="${APP_PROPERTIES}" --spring.profiles.active=mysql &