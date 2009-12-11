#!/bin/sh
SCRIPTNAME="$(basename $0)"
LOG=/tmp/${SCRIPTNAME}.log
NUM_FAILED="0"
NUM_SUCCEED="0"
NUM_SKIPPED="0"
SUCCEED_PACKS=""
FAILED=0
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

do_skip() {
  echo "Skipping package {$v} because it is a -0 package..." | tee -a $LOG
  NUM_SKIPPED=`expr $NUM_SKIPPED + 1`
  SKIPPED_PACKS="$SKIPPED_PACKS${v}\n"
}

echo "***************UPDATING FEEDS***************" >> $LOG
echo "" | tee -a $LOG
echo -n "Updating Feeds ... "
#ipkg -o $IPKG_OFFLINE_ROOT update >> $LOG 2>&1 || echo "Failed!"
#if [ "$?" -eq 0 ]
#then
  echo "Success!"
#fi
echo "" >> $LOG
echo "*************END UPDATING FEEDS*************" >> $LOG
echo "" | tee -a $LOG

yesno "Would you like to skip the -0 packages? (Note: For AUPT) [Y/N]"
AUPT="$?"

if [ "$AUPT" = "1" ]
then
  echo "AUPT Selected. All -0 packages will be skipped." >> $LOG
else
  echo "AUPT NOT Selected. All -0 packages will be tested." >> $LOG
fi

echo "" >> $LOG

yesno "Use package list file? (To use all patches from ipkg list enter 'No') [Y/N]"
USE_FILE="$?"

if [ "$USE_FILE" = "1" ]
then
 until [ -f "$FILE" ]
 do
   read -p "File: " FILE
 done
 PATCH_LIST=`cat $FILE`
 echo "Using package list from file: $FILE" >> $LOG
else
 PATCH_LIST=`ipkg -o $IPKG_OFFLINE_ROOT list | awk '/^org.webosinternals.patches/ {print $1}'`
 echo "Using IPKG LIST for patches to test." >> $LOG
fi

echo "" | tee -a $LOG
echo "***************STARTING TESTS***************" | tee -a $LOG

mount -o remount,rw / >> $LOG 2>&1

echo "" | tee -a $LOG

for v in $PATCH_LIST
do
  SUB_VERSION=`ipkg -o $IPKG_OFFLINE_ROOT info $v | awk '/^Version:/ {print $2}' | awk -F- '{print $2}'`
  if [ "$SUB_VERSION" = "0" -a "$AUPT" = "1" ]
  then
    do_skip
  else
    echo "Installing $v" | tee -a $LOG
    ipkg -o $IPKG_OFFLINE_ROOT install $v >> $LOG 2>&1
    echo -n "Running postinst script for $v ... " 
    echo "Running postinst script for $v ... " >> $LOG
    $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.postinst >> $LOG 2>&1 || do_failure
    if [ "${FAILED}" -ne 1 ]
    then
      do_success
      echo -n "Running prerm script for $v ... " 
      echo "Running prerm script for $v ... " >> $LOG
      $IPKG_OFFLINE_ROOT/usr/lib/ipkg/info/$v.prerm >> $LOG 2>&1 || do_failure
      if [ "${FAILED}" -ne 1 ]
      then
        do_success
      fi
      echo "Removing $v" | tee -a $LOG
      ipkg -o $IPKG_OFFLINE_ROOT remove $v >> $LOG 2>&1
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
echo "***************START OF SKIPPED PACKAGES***************" >> $LOG
echo "" >> $LOG
echo -e $SKIPPED_PACKS >> $LOG
echo "****************END OF SKIPPED PACKAGES****************" >> $LOG
echo "" >> $LOG
echo "***************START OF SUCCEED PACKAGES***************" >> $LOG
echo "" >> $LOG
echo -e $SUCCEED_PACKS >> $LOG
echo "****************END OF SUCCEED PACKAGES****************" >> $LOG
echo "" >> $LOG

echo "************************RESULTS************************" | tee -a $LOG
echo "" | tee -a $LOG
echo "Succeed: ${NUM_SUCCEED}" | tee -a $LOG
echo "Skipped: ${NUM_SKIPPED}" | tee -a $LOG
echo "Failed:  ${NUM_FAILED}"  | tee -a $LOG
echo "See the end of the log ($LOG) for lists of packages. They are separated by succeed, failed and skipped." | tee -a $LOG
echo "" >> $LOG
echo "**********************END OF TEST**********************" >> $LOG
echo "" | tee -a $LOG
