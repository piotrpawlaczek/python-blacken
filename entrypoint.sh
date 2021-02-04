#!/bin/sh
set -eax

only_check=""
if [ -n "$3" ] && [ "$3" = "yes" ]; then
    only_check="--check "
fi

black --version
black --"$1" --line-length "$2" ${only_check}"$4"
