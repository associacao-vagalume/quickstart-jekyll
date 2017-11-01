#!/bin/bash
abort() {
    local message=$1
    echo $message
    exit -1
}
[ -z $FTP_PASS ] && abort "FTP_PASS is undefined"
[ -z $FTP_USER ] && abort "FTP_USER is undefined"
[ -z $FTP_SITE ] && abort "FTP_SITE is undefined"

# lftp -u $FTP_USER,$FTP_PASS $FTP_SITE \
#  -e 'set ssl:verify-certificate false ; mirror -c -e -R _site ~ ; exit'

#!/bin/bash    
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
       --exclude-glob .ftpaccess"