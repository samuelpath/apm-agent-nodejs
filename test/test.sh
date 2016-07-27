#!/usr/bin/env bash

shopt -s extglob # allow for complex regex-like globs

files () {
  [ -f "$1" ] && echo "$@"
}

for file in $(files test/!(_*).js); do
  node "$file" || exit $?;
done

for file in $(files test/instrumentation/!(_*).js); do
  node "$file" || exit $?;
done

for file in $(files test/instrumentation/modules/!(_*).js); do
  node "$file" || exit $?;
done

for file in $(files test/instrumentation/modules/mysql/!(_*).js); do
  node "$file" || exit $?;
done
