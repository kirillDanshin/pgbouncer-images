#!/bin/bash

set -a

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | jq -r ".tag_name"
}

get_all_versions() {
    curl --silent "https://api.github.com/repos/pgbouncer/pgbouncer/releases" | jq -c '{ "tag": map(. .tag_name) }' \
        | sed s/_/./g | sed s/pgbouncer.//g | sed 's/,"1.11.0","1.10.0","1.9.0"//g'
}
