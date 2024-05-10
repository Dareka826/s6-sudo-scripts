#!/bin/sh
set -eu

# Verify user's password, before allowing command execution
if ! /root/s6-sudod/chk_pw/chk_pw "${REMOTEEUID}"; then
    printf "Authentication Failed\n"
    exit 1
fi

# First arg should be new pwd
cd "${1}"
shift 1

# Execute user-supplied command
exec env -i "$(command -v sh)" -c "$(\
    printf "%s\n" "$@" \
        | sed \
            -e "s/'/'\\\\''/g" \
            -e "s/^/'/"  -e "s/$/'/" \
        | tr '\n' ' '
)"
