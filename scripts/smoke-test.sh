#!/bin/bash
# smoke-test.sh
#
. scripts/smoke.sh
url=$1

# statusOutput=$(curl --insecure --silent -o /dev/null  -w %{http_code} $url)
# if [[ "$statusOutput" == "000" || "$statusOutput" == "40*" || "$statusOutput" == "50*" ]]; then
#     echo "$url not reachable"
#     exit 1
# fi
# echo "Check configuration OK"

# URL para testar
smoke_url_prefix $url

# Testes
smoke_url_ok "/"
smoke_url_ok "/about"
smoke_report
