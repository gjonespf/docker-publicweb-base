#!/bin/sh
COMMITID=$1
PUSHNAME=$2
PUSHEMAIL=$3
REF=$4
TAG=$5

if [ -z "$COMMITID" ]
then
    COMMITID=`date +%Y-%m-%d-%H%M%S`
fi

if [ -z "$TAG" ]
then
    TAG=latest
fi

docker build --build-arg COMMIT_ID=$COMMITID \
  -t gavinjonespf/publicweb-base \
  -t gavinjonespf/publicweb-base:$TAG \
  .
