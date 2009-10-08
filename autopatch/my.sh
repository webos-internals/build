#!/bin/sh

for i in `ls`
do
  newdir=`basename $i .patch`
  if [ "$newdir" != "$i" ]
  then
    git mv $i $newdir
  fi
done
