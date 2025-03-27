#!/bin/zsh
#
# Based on the fact provided by Huntress.  Updated to return a boolean value for easier filtering in Addigy.
#
out=$(sqlite3 -line "/Library/Application Support/com.apple.TCC/TCC.db" "SELECT * FROM access where client == 'com.huntress.app';" | grep service | awk '{print $3}')
if [[ $out != "kTCCServiceSystemPolicyAllFiles" ]]; then
    echo "False"
    exit
fi

out=$(sqlite3 -line "/Library/Application Support/com.apple.TCC/TCC.db" "SELECT * FROM access where client == 'com.huntress.sysext';" | grep service | awk '{print $3}')
if [[ $out != "kTCCServiceSystemPolicyAllFiles" ]]; then
    echo "False"
    exit
fi

echo "True"