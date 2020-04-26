#!/bin/sh

# docker build . --force-rm --no-cache -t watir_demo \
#   && echo "\n----- END BUILD -----\n\n"

docker rm watir_demo
docker build . --force-rm -t watir_demo \
  && echo "\n----- END BUILD -----\n\n"
