#!/bin/bash

if [[ ($# -eq 4)  ||  ($# -eq 3   &&  "$1" != "/*") ]]; # from server to host
then
    parent_dir_1=$(dirname "$2")
    base_dir_1=$(basename "$2")
    echo Logging to $1 and compressing...
    ssh $1 "cd \"$parent_dir_1\" && tar -czvf tarball.tar.gz \"$base_dir_1\""
    echo Copying to host...
    if [ $# -eq 3 ]
    then
        scp $1:$parent_dir_1/tarball.tar.gz $3
        echo Extracting and removing compressed file from host...
        tar -xvzf $3/tarball.tar.gz && rm -rf $3/tarball.tar.gz
    else
        scp $1:$parent_dir_1/tarball.tar.gz .
    fi
    echo Removing compressed file from $1...
    ssh $1 "cd \"$parent_dir_1\" && rm -rf tarball.tar.gz"
fi

echo Copying to $3...
scp tarball.tar.gz $3:$4
echo Remove compressed file from host...
rm -rf tarball.tar.gz
echo Extracting and removing compressed file from $3...
ssh $3 "cd \"$4\" && tar -xvzf tarball.tar.gz && rm -rf tarball.tar.gz"
