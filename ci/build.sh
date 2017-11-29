#!/bin/sh

set -e -x

cd source-code
  ./source-code/complete/mvnw clean package
cd ..

cp source-code/complete/target/gs-serving-web-content-1.4-SNAPSHOT.jar  build-output/.
