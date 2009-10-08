#!/bin/sh

for i in `ls`
do
  if [ -d $i ]
  then
    found=0
    for j in `awk '{print $2}' list`
    do
      if [ "`basename $j .patch`" = "$i" ]
      then
        found=1
      fi
    done
    if [ $found -ne 1 ]
    then
      echo "NOT FOUND: $i"
    fi
  fi
done
