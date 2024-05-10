#!/bin/sh
set -eu

SOCK_PATH="${1}"
COUNTER="0"

# Wait for socket to exist
while ! [ -e "${SOCK_PATH}" ]; do
    if [ "${COUNTER}" -ge 25 ]; then
        printf "%s\n" "Timeout" >&2
        exit 1
    fi

    COUNTER="$(( COUNTER + 1 ))"
    sleep 0.2
done

exec chown :wheel "${SOCK_PATH}" "${SOCK_PATH}.lock"
