#!/usr/bin/env bash

set -e
set -u
set -o pipefail

GIT_PATH="$( cd "$(dirname "$0")/../" && pwd -P )"
BIN_PATH="${GIT_PATH}/bin"

echo "------------------------------------------------------------"
echo "- Test: ${0}"
echo "------------------------------------------------------------"

"${BIN_PATH}/vhost-gen" -p ./ -n name -t etc/templates/ | grep -v '__'
"${BIN_PATH}/vhost-gen" -p ./ -n name -t etc/templates/ -c etc/conf.yml | grep -v '__'
"${BIN_PATH}/vhost-gen" -p ./ -n name -t etc/templates/ -c examples/conf.nginx.yml | grep -v '__'
"${BIN_PATH}/vhost-gen" -p ./ -n name -t etc/templates/ -c examples/conf.apache24.yml | grep -v '__'
