#/usr/bin/env sh
echo -e "What VM?"
read vname
if [ '`VboxManage list vms | grep -c "$vname"`' != 0 ]; then
	echo exists
fi