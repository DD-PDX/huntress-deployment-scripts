#!/bin/zsh
#
#
# Based on the fact provided by Huntress.  Updated to return a boolean value for easier filtering in Addigy.
#
declare -a HuntressDaemons=("HuntressAgent" "HuntressUpdater" "Huntress")

for i in "${HuntressDaemons[@]}"; do 
  pgrep -x "$i" >/dev/null
  daemon_status=$?
  if [ "$daemon_status" != "0" ]; then
    echo "False"
    exit
  fi
done;

if [ ! -d "/Library/Application Support/Huntress" ]; then
    echo "False"
    exit
fi

echo "True"