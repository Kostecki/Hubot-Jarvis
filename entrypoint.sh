#!/bin/sh

HUBOT_VERSION=$(jq -r '.dependencies.hubot' package.json)

printf "\\n****************** Starting %s (Hubot %s) ******************\\n" "$HUBOT_NAME" "${HUBOT_VERSION}"

bin/hubot "$@"
