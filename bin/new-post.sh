#!/usr/bin/env sh

set -euo pipefail

test $# -ne 1 && echo "Please give file-name as parameter." && exit 128
( echo "$1" | grep -q '^[a-z-]\+.md$' ) \
    || ( echo "File name can only contain lowercase letter, dash and must end to .md" \
        && exit 128 )

docker-compose exec hugo hugo new "$@"
