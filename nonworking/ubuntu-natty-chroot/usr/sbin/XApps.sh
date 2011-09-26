#!/bin/bash

ACTION=$1
APP_NAME=$2
APP_INSTALL_LOG_DIR=/var/log/
INSTALLER_LOG=XApps_installer.log
ERROR_LOG=XApps_installer_error.log
UPDATE_LOG=update.log
DATE=date +%Y%m%d%H%M%S

rm ${APP_INSTALL_LOG_DIR}${ERROR_LOG}

case ${ACTION} in

      update)
             if ! `apt-get update > #{APP_INSTALL_LOG_DIR}${UPDATE_LOG}`
             then 
                 echo '${DATE} apt-get update failed' >> ${APP_INSTALL_LOG_DIR}${ERROR_LOG} 
             fi
             ;;

      install)
              if `apt-get install ${APP_NAME} -y \
              >> ${APP_INSTALL_LOG_DIR}${INSTALLER_LOG} 2>&1`
              then
                  echo '[${DATE}] Install Succeeded ${APP_NAME}' >> ${APP_INSTALL_LOG_DIR}${INSTALLER_LOG}
             else 
                  echo '[${DATE}] Installer Failed ${APP_NAME}' >> ${APP_INSTALL_LOG_DIR}${ERROR_LOG}
             fi
             ;;

       remove)
              if `apt-get remove ${APP_NAME}  \
              >> ${APP_INSTALL_LOG_DIR}${INSTALLER_LOG} 2>&1`
              then                  
                   echo '[${DATE}] Remove  Succeeded ${APP_NAME}' >> ${APP_INSTALL_LOG_DIR}${INSTALLER_LOG}
              else
                    echo '[${DATE}] Remove  Failed ${APP_NAME}' >> ${APP_INSTALL_LOG_DIR}${ERROR_LOG}
             fi
             ;;

esac
