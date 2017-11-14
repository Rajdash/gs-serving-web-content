#!/bin/bash
currentVersion=`mvn -f complete/pom.xml org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version|grep -Ev '(^\[|Download\w+:)'`
versionwithoutSnap=`echo $currentVersion | cut -d '-' -f1`
check=`echo $currentVersion | cut -d '-' -f2`
majorVersion=`echo $versionwithoutSnap | cut -d '.' -f1`
minorVersion=`echo $versionwithoutSnap | cut -d '.' -f2`
let nextminorVersion=$minorVersion+1
nextSnapshotVersion=`echo $majorVersion"."$nextminorVersion"-SNAPSHOT"`
if [ $check == "SNAPSHOT" ]
then
echo "It is already a snapshot"
else
mvn -f complete/pom.xml versions:set -DnewVersion=$nextSnapshotVersion versions:commit
git add complete/pom.xml
git commit -m "bumped to next snapshot version"
git push origin master
echo "The version is bumped to next release version $nextSnapshotVersion"
fi
