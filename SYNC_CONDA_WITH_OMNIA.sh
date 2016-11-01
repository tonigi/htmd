#!/bin/sh

PACKAGES="
ambermini
bhmm
funcsigs
mdtraj
msmtools
openbabel
pint
progress_reporter
pyemma
thermotools
"

DIR=$(mktemp -d)
cd $DIR
echo "Using TMPDIR $DIR"

mkdir win-64 win-32 osx-32 osx-64 linux-32 linux-64 noarch

for T in $PACKAGES; do
	echo "Downloading [$T]"
	anaconda download omnia/$T
done	

for F in */*; do
	echo "Uploading [$F]"
	anaconda upload */* -u acellera 
done

cd /
rm -rf $DIR

exit 0 
