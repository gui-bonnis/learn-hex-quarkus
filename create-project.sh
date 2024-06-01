#! /bin/bash

SERVICE_NAME='expense'
ROOT_PACKAGE_NAME='org/fin'
ROOT_SERVICE_NAME='vault'
PACKAGE_NAME=${ROOT_PACKAGE_NAME}/${ROOT_SERVICE_NAME}

# Create groupId
var="/"
replace="."
GROUP_ID=${PACKAGE_NAME//$var/$replace}.${SERVICE_NAME}

# Parent Project

mvn archetype:generate \
-DarchetypeGroupId=org.codehaus.mojo.archetypes \
-DarchetypeArtifactId=pom-root \
-DarchetypeVersion=RELEASE \
-DgroupId=${PACKAGE_NAME//$var/$replace} \
-DartifactId=${SERVICE_NAME} \
-Dversion=1.0-SNAPSHOT \
-DinteractiveMode=false

cd ${SERVICE_NAME}

CREATE_MODULE () {

BASIC_PACKAGE_NAME=$1
BASIC_GROUP_ID=$2
BASIC_MODULE_NAME=$3

mvn archetype:generate \
  -DarchetypeGroupId=de.rieckpil.archetypes  \
  -DarchetypeArtifactId=testing-toolkit \
  -DarchetypeVersion=1.0.0 \
  -DgroupId=${BASIC_PACKAGE_NAME} \
  -DartifactId=${BASIC_MODULE_NAME} \
  -Dversion=1.0-SNAPSHOT \
  -Dpackage=${BASIC_GROUP_ID}.${BASIC_MODULE_NAME} \
  -DinteractiveMode=false

}

# Create Domain Module
CREATE_MODULE ${PACKAGE_NAME//$var/$replace} ${GROUP_ID} "domain"

# Create Application Module
CREATE_MODULE ${PACKAGE_NAME//$var/$replace} ${GROUP_ID} "application"

# Create Framework Module
CREATE_MODULE ${PACKAGE_NAME//$var/$replace} ${GROUP_ID} "framework"

# Create Bootstrap Module
CREATE_MODULE ${PACKAGE_NAME//$var/$replace} ${GROUP_ID} "bootstrap"
