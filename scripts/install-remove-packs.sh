#!/bin/sh
SCRIPTNAME="$(basename $0)"
LOG=/media/internal/${SCRIPTNAME}.log
NUM_FAILED="0"
NUM_SUCCEED="0"
SUCCEED_PACKS=""
FAILED=0
DO="$1"
LIST_FILE="$2"
if [ -d /media/cryptofs/apps ]
then
  IPKG_OFFLINE_ROOT=/media/cryptofs/apps
else
  IPKG_OFFLINE_ROOT=/var
fi

export IPKG_OFFLINE_ROOT

yesno() {
  IN=""
  until [ -n "$IN" ] ; do
    read -p "${@} " IN
    case "$IN" in
      y|Y|yes|YES)  return 1;;
      n|N|no|NO)    return 0;;
      *)            IN="";;
    esac
  done
}

do_failure() {
  echo "Failed!" | tee -a $LOG
  NUM_FAILED=`expr $NUM_FAILED + 1`
  FAILED_PACKS="$FAILED_PACKS${v}\n"
  FAILED=1
}

do_success() {
  echo "Success!" | tee -a $LOG
  PACK_CHECK=`echo $SUCCEED_PACKS | grep "${v}"`
  if [ ! "$PACK_CHECK" ]
  then
    NUM_SUCCEED=`expr $NUM_SUCCEED + 1`
    SUCCEED_PACKS="$SUCCEED_PACKS${v}\n"
  fi
  FAILED=0
}

if [ "$DO" != "i" -a "$DO" != "r" ] || [ ! -f "$LIST_FILE" ]
then
  echo "Usage: $SCRIPTNAME [i|r] <list_file>"
  exit
fi

if [ "$DO" = "i" ]
then
  DO2="install"
else
  DO2="remove"
fi

PACK_LIST=`cat $LIST_FILE`

echo "***************UPDATING FEEDS***************" >> $LOG
echo "" | tee -a $LOG
echo -n "Updating Feeds ... "
ipkg -o $IPKG_OFFLINE_ROOT update >> $LOG 2>&1 || echo "Failed!"
if [ "$?" -eq 0 ]
then
  echo "Success!"
fi
echo "" >> $LOG
echo "*************END UPDATING FEEDS*************" >> $LOG
echo "" | tee -a $LOG
echo "***************STARTING INSTALL/REMOVAL***************" | tee -a $LOG

mount -o remount,rw / >> $LOG 2>&1

echo "" | tee -a $LOG

for v in $PACK_LIST
do
  if [ "$DO" = "i" ]
  then
    echo "Installing $v" | tee -a $LOG
  else
    echo "Removing $v" | tee -a $LOG
  fi
  if [ -f $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.prerm -a "$DO" = "r" ]
  then
    echo -n "Running prerm script for $v ... "
    echo "Running prerm script for $v ... " >> $LOG
    $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.prerm >> $LOG 2>&1 || do_failure
    if [ "${FAILED}" -ne 1 ]
    then
      do_success
    fi
  fi
  if [ "${FAILED}" -ne 1 -a "$DO" = "r" ]
  then
    ipkg -o $IPKG_OFFLINE_ROOT --force-depends $DO2 $v >> $LOG 2>&1
  fi
  if [ "$DO" = "i" ]
  then
    ipkg -o $IPKG_OFFLINE_ROOT $DO2 $v >> $LOG 2>&1 || do_failure
    if [ -f $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.postinst ] && [ "$DO" = "i" ] && [ "${FAILED}" -ne 1 ]
    then
      echo -n "Running postinst script for $v ... " 
      echo "Running postinst script for $v ... " >> $LOG
      $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.postinst >> $LOG 2>&1 || do_failure
      if [ "${FAILED}" -ne 1 ]
      then
	do_success
      else
        ipkg -o $IPKG_OFFLINE_ROOT r $v
      fi
    else
      do_success
    fi
  fi
  FAILED=0
  echo "" | tee -a $LOG
done

echo "" >> $LOG
echo "***************START OF FAILED PACKAGES***************" >> $LOG
echo "" >> $LOG
echo -e $FAILED_PACKS >> $LOG
echo "****************END OF FAILED PACKAGES****************" >> $LOG
echo "" >> $LOG
echo "***************START OF SUCCEED PACKAGES***************" >> $LOG
echo "" >> $LOG
echo -e $SUCCEED_PACKS >> $LOG
echo "****************END OF SUCCEED PACKAGES****************" >> $LOG
echo "" >> $LOG

echo "************************RESULTS************************" | tee -a $LOG
echo "" | tee -a $LOG
echo "Succeed: ${NUM_SUCCEED}" | tee -a $LOG
echo "Failed:  ${NUM_FAILED}"  | tee -a $LOG
echo "See the end of the log ($LOG) for lists of packages. They are separated by succeed, failed and skipped." | tee -a $LOG
echo "" >> $LOG
echo "**********************END OF TEST**********************" >> $LOG
echo "" | tee -a $LOG
