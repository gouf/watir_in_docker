#!/bin/sh

docker run -it --rm --name watir_demo \
  -v $HOME/watir_in_docker/pic:/app/pic \
  watir_demo
