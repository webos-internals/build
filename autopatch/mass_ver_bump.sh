#!/bin/sh
LIST=`find . -name Makefile`
for v in ${LIST} ; do
  VERSIONS=$(awk '/^VERSIONS =/ {print}' $v)
  if [ "$VERSIONS" ] ; then
    SINPLU=VERSIONS
  else
    SINPLU=VERSION
  fi
  OLD_VERSION=$(awk '/^'$SINPLU' =/ {print}' $v)
  VERSIONS1=$(awk '/^'$SINPLU' =/ {print $3}' $v)
  VERSIONS2=$(awk '/^'$SINPLU' =/ {print $4}' $v)
  VERSIONS3=$(awk '/^'$SINPLU' =/ {print $5}' $v)
  VERSIONS4=$(awk '/^'$SINPLU' =/ {print $6}' $v)
  VERSIONS5=$(awk '/^'$SINPLU' =/ {print $7}' $v)
  if [ "$VERSIONS1" ] ; then
   VERSIONS_ARRAY=$VERSIONS1
  fi
  if [ "$VERSIONS2" ] ; then
    VERSIONS_ARRAY="$VERSIONS_ARRAY $VERSIONS2"
  fi
  if [ "$VERSIONS3" ] ; then
    VERSIONS_ARRAY="$VERSIONS_ARRAY $VERSIONS3"
  fi
  if [ "$VERSIONS4" ] ; then
    VERSIONS_ARRAY="$VERSIONS_ARRAY $VERSIONS4"
  fi
  if [ "$VERSIONS5" ] ; then
    VERSIONS_ARRAY="$VERSIONS_ARRAY $VERSIONS5"
  fi
  NEW_VERSION=""
  for w in $VERSIONS_ARRAY ; do
    VERSION_MAIN=${w%-*}
    NEW_SUB_VERSION=`expr ${w#*-} + 1`
    NEW_VERSION="$NEW_VERSION $VERSION_MAIN-$NEW_SUB_VERSION"
  done
  OUTPUT_VERSION="$SINPLU =$NEW_VERSION"
  echo $v >> test.log
  echo "$SINPLU = $VERSIONS_ARRAY" >> test.log
  echo $OUTPUT_VERSION >> test.log
  echo "sed -i -e 's|$OLD_VERSION|$OUTPUT_VERSION|' $v" >> test.log
# To Run for real, uncomment the following line.. :)
#  sed -i -e 's|$OLD_VERSION|$OUTPUT_VERSION|' $v
done
