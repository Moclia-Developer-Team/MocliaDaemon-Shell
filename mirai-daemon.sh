# !/bin/sh

# Copyright <C> 2020 Moclia-Developer-Team
# Copyright <C> 2020 KazeKonseki
# Copyright <C> 2020 Staswit
# All rights reserved.
# If you have any problems or ideas,
# Feel free to talk to us on https://github.com/Moclia-Developer-Team/MocliaDaemon-Shell

# Make sure to move mirai's folder under ~/mirai, or you can modify the specific folder.
cd ~/mirai

# This is the variable for mirai process's name. Edit execute path as you wish.
PROCESS=mirai
EXECUTE_MIRAI=

while true ; do
# Use ps to aquire the total amount of process mirai.
	NUMBER=`ps aux | grep ${PROCESS} | grep -v grep | wc -l`

# If the process amount is below 1 , then restart mirai.
	if [ "${NUMBER}" -lt "1" ]; then
		echo "Terminated ${PROCESS}."

# You can edit start option here.
		${EXECUTE_MIRAI}

	elif [ "${NUMBER}" -gt "1" ]; then
		echo "Multiple instances detected. Will reboot ${PROCESS}."
		killall -9 ${PROCESS}

# Again, edit the option if you needed.
		${EXECUTE_MIRAI}
	fi

# Aquire zombie process:
	NUMBER_STAT=`ps aux | grep ${PROCESS} | grep T | grep -v grep | wc -l`

	if [ "${NUMBER_STAT}" -gt "0" ]; then
		killall -9 ${PROCESS}
		${EXECUTE_MIRAI}
	fi
done

exit 0
