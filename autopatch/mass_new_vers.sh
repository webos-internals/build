#!/bin/sh
LIST=`find . -name Makefile`
echo > test.log
for v in ${LIST} ; do
  VERSIONS=$(awk '/^VERSIONS =/ {print}' $v)
  if [ "$VERSIONS" ] ; then
    SINPLU=VERSIONS
  else
    SINPLU=VERSION
  fi
  OLD_VERSION=$(awk '/^'$SINPLU' =/ {print}' $v)
  OUTPUT_VERSION="$OLD_VERSION 1.4.2-1"
  echo "sed -i.orig -e 's|$OLD_VERSION|$OUTPUT_VERSION|' $v" >> test.log
done
