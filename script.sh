#!/bin/bash

while getopts l:s: flag
do
    case "${flag}" in
        l) stash_len=${OPTARG};;
        s) search_string=${OPTARG};;
    esac
done

for i in $(seq 1 1 $stash_len)
do
    res=$(git stash show -p stash@{$i} | grep "$search_string") || true
    if [[ "$res" != "" ]] || [[ "$res" == fatal* ]] ; then
        echo stash@{$i}
        echo $res
    fi
done
