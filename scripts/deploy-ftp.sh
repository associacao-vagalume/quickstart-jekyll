#!/bin/bash
abort() {
    local message=$1
    echo $message
    exit -1
}

[ -z $FTP_PASS ] && abort "FTP_PASS is undefined"
[ -z $FTP_USER ] && abort "FTP_USER is undefined"
[ -z $FTP_SITE ] && abort "FTP_SITE is undefined"

HOST=$FTP_SITE
USER=$FTP_USER
PASS=$FTP_PASS
FTPURL="ftp://$USER:$PASS@$HOST"
LCD="./_site"
RCD="~"
DELETE="--delete"
lftp -c "set ftp:list-options -a; set cmd:fail-exit yes; set ssl:verify-certificate false ;
open '$FTPURL';
lcd $LCD;
cd $RCD;
mirror --reverse \
       $DELETE \
       --verbose \
       --exclude-glob .ftpaccess;
exit"
