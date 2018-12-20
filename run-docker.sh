#!/usr/bin/env bash

if [ $(docker images snapbuild | wc -l) -ne 2 ]; then
    docker build -t snapbuild .;
fi;

docker run \
  --interactive \
  --tty \
  -e LOCAL_USER_ID=$(id -u $USER) \
  -e LOCAL_GROUP_ID=$(id -g $USER) \
  -v $PWD:/home/snapbuild/work \
  -w=/home/snapbuild/work \
  --rm \
  snapbuild bash;
