#!/bin/bash
# this is a stub / example of how the generate script
# might look
#
# I checked out swagger-codegen from github here
SWAGGER_CODEGEN_HOME=~/path-t/my/swagger-codegen

# this next bit doesn't work
# please fix it :)
# I want it to 
mkdir -p $SWAGGER_CODEGEN_HOME/out
echo $SWAGGER_CODEGEN_HOME/out
$SWAGGER_CODEGEN_HOME/run-in-docker.sh  \
    generate  \
    -i `pwd`/sip-integration-v2-api.json  \
    -l python  \
    -t codegen_templates_eventfactories
# and -t codegen_templates_eventschemata
# and maybe even codegen_templates_events
mv $SWAGGER_CODEGEN_HOME/out ./eventfactories
# factoryboy templates -> eventfactories package
# marshmallow templates -> eventschemata package
# python domain classes / deserialiser -> events package
