#!/bin/sh
COMMITID=$1
PUSHNAME=$2
PUSHEMAIL=$3
REF=$4
TAG=$5
IMAGEUSER=$6
IMAGENAME=$7

DEFAULTTAG=latest
DEFAULTIMAGEUSER=gavinjonespf
DEFAULTIMAGENAME=docker-publicweb-base
DEFAULTPREREQ=gavinjonespf/apache-php:latest

if [ -z "$COMMITID" ]
then
    COMMITID=`date +%Y-%m-%d-%H%M%S`
fi

if [ -z "$TAG" ]
then
    TAG=latest
fi

if [ -z "$IMAGEUSER" ]
then
    IMAGEUSER=$DEFAULTIMAGEUSER
fi

if [ -z "$IMAGENAME" ]
then
    IMAGENAME=$DEFAULTIMAGENAME
fi

docker pull $DEFAULTPREREQ

docker build --build-arg COMMIT_ID=$COMMITID \
  -t $IMAGEUSER/$DEFAULTIMAGENAME \
  -t $IMAGEUSER/$DEFAULTIMAGENAME:$TAG \
  .
