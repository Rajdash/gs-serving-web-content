#!/bin/sh

set -e -x
cd ..
apache-maven-3.2.1/bin/mvn clean package -f complete/pom.xml 

cp source-code/complete/target/gs-serving-web-content-1.4-SNAPSHOT.jar  build-output/.
