#!/bin/bash

if [[ -z $1 || -z $2 ]]; then
	echo "Usage: run_scad.sh <script.scad> <output.stl>"
	exit 1
fi

#get the parent directory of both
scriptdir=$(dirname $1)
stldir=$(dirname $2)
if [[ $scriptdir != $stldir ]]; then
	echo "${1} and ${2} must be in the same directory"
	exit 1
fi

scriptname=$(basename $1)
stlname=$(basename $2)

#get all the arguments
num_args=$(($#))
extra=""
for ((arg=3; arg<=num_args; arg++)); do
	argnum=$(($arg-2))
	extra="${extra} -D \"arg${argnum}='${!arg}'\""
done

docker run \
    -it \
    --rm \
    -v $(cd ${stldir} && pwd):/openscad \
    -u $(id -u ${USER}):$(id -g ${USER}) \
    openscad/openscad:latest \
    openscad -o ${stlname} ${scriptname} ${extra}
