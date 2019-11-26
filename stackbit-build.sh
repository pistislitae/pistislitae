#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5ddcfda3267c190012ce8e9f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5ddcfda3267c190012ce8e9f
curl -s -X POST https://api.stackbit.com/project/5ddcfda3267c190012ce8e9f/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5ddcfda3267c190012ce8e9f/webhook/build/publish > /dev/null
