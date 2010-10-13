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
    if [ "$VERSION_MAIN" = "1.4.5" ] ; then
      NEW_VERSION="$NEW_VERSION $VERSION_MAIN-$SUB_VERSION"
    fi
  done
  OUTPUT_VERSION="$SINPLU =$NEW_VERSION"
#  echo $v >> test.log
#  echo "$SINPLU =$VERSIONS_ARRAY" >> test.log
#  echo $OUTPUT_VERSION >> test.log
#  echo "sed -e 's|$OLD_VERSION|$OUTPUT_VERSION|' < $v > $v.new" >> test.log
#  echo "mv $v.new $v" >> test.log
# To Run for real, uncomment the following line.. :)
  if [ "$NEW_VERSION" = "" ] ; then
    rm -f $v
#  else
#    sed -e 's|$OLD_VERSION|$OUTPUT_VERSION|' < $v > $v.new
  fi
done
