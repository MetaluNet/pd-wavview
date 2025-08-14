#!/bin/bash

PROJECT=wavview
VERSION=$(git describe --abbrev=0)
EXPORTDIR=dist/$PROJECT
rm -rf $EXPORTDIR
mkdir -p $EXPORTDIR
cp wavview/* *.md LICENSE* CHANGELOG* $EXPORTDIR

cd $EXPORTDIR/..
if [ $1x != testx ] ; then
    deken upload -v $VERSION $PROJECT
else deken package -v $VERSION $PROJECT
fi


