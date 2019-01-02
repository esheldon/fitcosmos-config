#!/bin/bash

dir=$FITCOSMOS_CONFIG_DIR
if [[ $dir == "" ]]; then
    echo "FITCOSMOS_CONFIG_DIR not set"
    exit 1
fi


echo "rsyncing to $dir"

if [[ ! -e $dir ]]; then
    echo "Creating directory $dir"
    mkdir -p $dir
fi

rsync -av \
    --exclude "*svn*" \
    --exclude "*git*" \
    --exclude "*swp" \
    --exclude "*~" \
    --exclude "*pyc" ./ $dir/
