#!/usr/bin/env sh
echo -e "What VM?"
read -r vname
if [ "$(VBoxManage list vms | grep -c "$vname")" != 0 ]; then
    echo exists
fi