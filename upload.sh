#!/bin/bash

PROJECT=wavview
VERSION=$(git describe --abbrev=0)
EXPORTDIR=$PROJECT
rm -rf $EXPORTDIR
mkdir -p $EXPORTDIR
cp *.pd *.wav *.md LICENSE* CHANGELOG* $EXPORTDIR
deken upload -v $VERSION $PROJECT


