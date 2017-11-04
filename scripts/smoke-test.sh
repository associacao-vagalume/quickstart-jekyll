#!/bin/bash
# smoke-test.sh
#
url=$1

statusOutput=$(curl --insecure --silent -o /dev/null  -w %{http_code} $url)
if [[ "$statusOutput" == "000" || "$statusOutput" == "40*" || "$statusOutput" == "50*" ]]; then
    echo "$url not reachable"
    exit 1
fi
echo "Check configuration OK"