#!/bin/bash

TOMCAT_VERSION="9.0.48"
INSTALL_DIR="/opt/tomcat"
JAVA_HOME="/usr/lib/jvm/default-java"

wget "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -P /tmp
sudo mkdir -p ${INSTALL_DIR}
sudo tar xf /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C ${INSTALL_DIR} --strip-components=1

export CATALINA_HOME=${INSTALL_DIR}
export JAVA_HOME=${JAVA_HOME}
export PATH=${PATH}:${CATALINA_HOME}/bin


${CATALINA_HOME}/bin/startup.sh

sleep 5

xdg-open "http://localhost:8080"

echo "Tomcat installed and started successfully. Open http://localhost:8080 in your web browser."