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

 cd ./_site && find . -type f -exec curl -u $FTP_USER:$FTP_PASS \
--ftp-create-dirs -T {} $FTP_SITE/{}