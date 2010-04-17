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
  VERSIONS_ARRAY=`awk '/^'$SINPLU' =/ {print}' $v | awk -F= '{print $2}'`
  NEW_VERSION=""
  for w in $VERSIONS_ARRAY ; do
    VERSION_MAIN=${w%-*}
    SUB_VERSION=${w#*-}
    if [ "$SUB_VERSION" -ne "99" ] ; then
      NEW_SUB_VERSION=`expr $SUB_VERSION + 1`
    else
      NEW_SUB_VERSION=$SUB_VERSION
    fi
    NEW_VERSION="$NEW_VERSION $VERSION_MAIN-$NEW_SUB_VERSION"
  done
  OUTPUT_VERSION="$SINPLU =$NEW_VERSION"
  echo $v >> test.log
  echo "$SINPLU =$VERSIONS_ARRAY" >> test.log
  echo $OUTPUT_VERSION >> test.log
  echo "sed -i.orig -e 's|$OLD_VERSION|$OUTPUT_VERSION|' $v" >> test.log
# To Run for real, uncomment the following line.. :)
#  sed -i.orig -e 's|$OLD_VERSION|$OUTPUT_VERSION|' $v
done
