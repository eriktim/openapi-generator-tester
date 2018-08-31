#!/bin/sh

java -jar ../openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar generate -i openapi2.yaml  -g elm -t ../openapi-generator/modules/openapi-generator/src/main/resources/elm/ -o elm/openapi2/
